<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\User;
use App\Models\Log;
use Firebase\JWT\JWT;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Exceptions\HttpResponseException;
use Helper\MessageError;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $v = Validator::make($request->all(), [
            'name' => 'required|string',
            'email' => 'required|email|unique:user,email',
            'password' => 'required|string|min:6',
            'confirmation_password' => 'required|same:password'
        ]);

        if ($v->fails()) {
            return MessageError::message($v->errors()->messages());
        }

        $user = $v->validated();

        User::create($user);

        $payload = [
            'nama' => $user['name'],
            'role' => 'user',
            'iat' => time(),
            'exp' => time() + 60 * 60 * 24
        ];

        $token = JWT::encode($payload, env('JWT_SECRET_KEY'), 'HS256');

        Log::create([
            'module' => 'Auth',
            'action' => 'Register',
            'useraccess' => $user['name']
        ]);

        return response()->json([
            "data" => [
                'msg' => 'Register Success',
                'name' => $user['name'],
                'email' => $user['email'],
                'role' => 'user',
            ],
            'token' => "Bearer $token"
        ], 201);
    }

    public function login(Request $request)
    {
        $v = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:6'
        ]);

        if ($v->fails()) {
            return MessageError::message($v->errors()->messages());
        }

        if (Auth::attempt($v->validated())) {
            $payload = [
                'nama' => Auth::user()->name,
                'role' => Auth::user()->role,
                'iat' => time(),
                'exp' => time() + 60 * 60 * 24
            ];

            $token = JWT::encode($payload, env('JWT_SECRET_KEY'), 'HS256');

            Log::create([
                'module' => 'Auth',
                'action' => 'Login',
                'useraccess' => Auth::user()->name
            ]);

            return response()->json([
                "data" => [
                    'msg' => 'Login Success',
                    'name' => Auth::user()->name,
                    'email' => Auth::user()->email,
                    'role' => Auth::user()->role,
                ],
                "token" => "Bearer $token"
            ], 200);
        }

        return response()->json([
            'error' => 'Unauthorized'
        ], 401);
    }
}