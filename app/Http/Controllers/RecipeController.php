<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Recipe;
use App\Models\Tool;
use App\Models\Ingredients;
use App\Models\RecipeView;
use App\Models\Rating;
use Illuminate\Support\Facades\Validator;
use Helper\MessageError;

class RecipeController extends Controller
{
    public function show_recipes()
    {
        $recipes = Recipe::with('user')->where('status_resep', 'publish')->get();

        $data = [];
        foreach ($recipes as $r) {
            $data[] = [
                'idresep' => $r->idresep,
                'judul' => $r->judul,
                'gambar' => url('uploads/' . $r->gambar),
                'nama' => $r->user->nama,
            ];
        }

        return response()->json($data, 200);
    }

    public function get_recipe_by_id(Request $request)
    {
        $recipe = Recipe::where('status_resep', 'publish')->where('idresep', $request->idresep);
        if (!$recipe->exists()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Resep tidak ditemukan'
            ], 404);
        }

        $validator = Validator::make($request->all(), [
            'idresep' => 'required',
        ]);

        if ($validator->fails()) {
            return MessageError::message($validator->errors()->messages());
        }

        $id = $request->idresep;
        $recipe = Recipe::where('idresep', $id)->first();
        if (!$recipe) {
            return response()->json([
                'status' => 'error',
                'message' => 'Resep tidak ditemukan'
            ], 404);
        }

        $recipes = Recipe::where('status_resep', 'publish')->where('idresep', $request->idresep)->get();
        $tools = Tool::where('resep_idresep', $request->idresep)->get();
        $ingredients = Ingredients::where('resep_idresep', $request->idresep)->get();


        $data = [];
        foreach ($recipes as $recipe) {
            $data[] = [
                'idresep' => $recipe->idresep,
                'judul' => $recipe->judul,
                'gambar' => url('uploads/' . $recipe->gambar),
                'cara_pembuatan' => $recipe->cara_pembuatan,
                'video' => $recipe->video,
                'nama' => $recipe->user->nama,
            ];
        }

        RecipeView::create([
            'email' => $request->email ?? 'guest',
            'date' => now(),
            'resep_idresep' => $request->idresep
        ]);

        $recipeData = [
            'recipe' => $data,
            'tools' => $tools,
            'ingredients' => $ingredients
        ];

        return response()->json($recipeData, 200);
    }

    public function rating(Request $request)
    {
        $v = Validator::make($request->all(), [
            'idresep' => 'required',
            'email' => 'required',
            'rating' => 'required|in:1,2,3,4,5'
        ]);

        if ($v->fails()) {
            return MessageError::message($v->errors()->messages());
        }

        $recipe = Recipe::where('idresep', $request->idresep)->first();
        if (!$recipe) {
            return response()->json([
                'status' => 'error',
                'message' => 'Resep tidak ditemukan'
            ], 404);
        }

        Rating::create([
            'email_user' => $request->email,
            'review' => $request->review,
            'resep_idresep' => $request->idresep,
            'rating' => $request->rating
        ]);

        return response()->json([
            'data' => [
                'msg' => 'Berhasil memberi rating'
            ]
        ]);
    }
}