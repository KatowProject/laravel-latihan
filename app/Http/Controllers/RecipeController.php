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
                'gambar' => url($r->gambar),
                'nama' => $r->user->name,
            ];
        }

        return response()->json([
            'status' => 'success',
            'data' => $data
        ]);
    }

    public function get_recipe_by_id(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'idresep' => 'required',
            'email' => 'required'
        ]);

        if ($validator->fails()) {
            return MessageError::message($validator->messages()->toArray());
        }

        $recipe = Recipe::where('status_resep', 'publish')->where('idresep', $request->idresep)->get();
        $tools = Tool::where('resep_idresep', $request->idresep)->get();
        $ingredients = Ingredients::where('resep_idresep', $request->idresep)->get();

        RecipeView::create([
            'email' => $request->email,
            'date' => date('Y-m-d'),
            'resep_idresep' => $request->idresep
        ]);

        return response()->json([
            'status' => 'success',
            'data' => [
                'recipe' => $recipe,
                'tools' => $tools,
                'ingredients' => $ingredients
            ]
        ]);
    }

    public function rating(Request $request)
    {
        $v = Validator::make($request->all(), [
            'idresep' => 'required',
            'email' => 'required',
            'rating' => 'required|in:1,2,3,4,5'
        ]);

        if ($v->fails()) {
            return MessageError::message($v->messages()->toArray());
        }

        Rating::create([
            'email' => $request->email,
            'review' => $request->review,
            'resep_idresep' => $request->idresep,
            'rating' => $request->rating
        ]);

        return response()->json([
            'status' => 'success',
            'message' => 'Berhasil memberikan rating'
        ]);
    }
}