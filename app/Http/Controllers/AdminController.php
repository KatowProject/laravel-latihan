<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Helper\MessageError;

class AdminController extends Controller
{
    public function register(Request $request)
    {
        $v = Validator::make($request->all(), [
            'name' => 'required|string',
            'email' => 'required|email|unique:user,email',
            'password' => 'required|string|min:6',
            'confirmation_password' => 'required|same:password',
            'role' => 'required|in:admin,user',
            'status' => 'required|in:aktif,nonaktif',
            'email_validate' => 'required|email'
        ]);

        if ($v->fails()) {
            return MessageError::message($v->errors()->messages());
        }

        $user = $v->validated();

        User::create($user);

        return response()->json([
            "data" => [
                'msg' => 'Register Success',
                'name' => $user['name'],
                'email' => $user['email'],
                'role' => $user['role'],
            ]
        ], 201);
    }

    public function show_register()
    {
        $users = User::where('role', 'admin')->get();

        return response()->json([
            "msg" => "Registration List",
            "data" => $users
        ], 200);
    }

    public function show_register_by_id($id)
    {
        $user = User::find($id);
        if ($user) {
            return response()->json([
                "msg" => "UserID: $id",
                "data" => $user
            ], 200);
        } else {
            return response()->json([
                "msg" => "Registration List",
                "data" => "Not Found"
            ], 404);
        }
    }

    public function update_register(Request $request, $id)
    {
        $user = User::find($id);

        if ($user) {
            $validator = Validator::make($request->all(), [
                'name' => 'required|string',
                'role' => 'required|in:admin,user',
                'status' => 'required|in:aktif,nonaktif',
                'email_validate' => 'required|email'
            ]);

            if ($validator->fails()) {
                return MessageError::message($validator->errors()->messages());
            }

            $data = $validator->validated();

            User::where('id', $id)->update($data);

            return response()->json([
                "msg" => "UserID: $id berhasil diupdate",
                "data" => $data
            ], 200);
        }
    }

    public function delete_register($id)
    {
        $user = User::find($id);

        if ($user) {
            User::destroy($id);

            return response()->json([
                "msg" => "UserID: $id berhasil dihapus",
                "data" => $user
            ], 200);
        } else {
            return response()->json([
                "msg" => "UserID: $id tidak ditemukan",
                "data" => "Not Found"
            ], 404);
        }
    }

    public function activation_account($id)
    {
        $user = User::find($id);

        if ($user) {
            User::where('id', $id)->update(['status' => 'aktif']);

            return response()->json([
                "msg" => "UserID: $id berhasil diaktifkan",
                "data" => $user
            ], 200);
        } else {
            return response()->json([
                "msg" => "UserID: $id tidak ditemukan",
                "data" => "Not Found"
            ], 404);
        }
    }

    public function deactivation_account($id)
    {
        $user = User::find($id);

        if ($user) {
            User::where('id', $id)->update(['status' => 'nonaktif']);

            return response()->json([
                "msg" => "UserID: $id berhasil dinonaktifkan",
                "data" => $user
            ], 200);
        } else {
            return response()->json([
                "msg" => "UserID: $id tidak ditemukan",
                "data" => "Not Found"
            ], 404);
        }
    }
}