<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Recipe;
use App\Models\Ingredients;
use App\Models\Tool;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function create_recipe(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'judul' => 'required|max:255',
            'gambar' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'cara_pembuatan' => 'required',
            'video' => 'required',
            'user_email' => 'required',
            'bahan' => 'required',
            'alat' => 'required',
        ]);

        if ($validator->fails()) {
            //return MessageError::message($validator->errors()->messages());
            response()->json([
                "msg" => "Error",
                "data" => $validator->errors()->messages()
            ], 400);
        }

        $thumb = $request->file('gambar');
        $filename = time() . '.' . $thumb->getClientOriginalExtension();
        $thumb->move('uploads/', $filename);

        $data = $validator->validated();
        $recipe = Recipe::create([
            'judul' => $data['judul'],
            'gambar' => $filename,
            'cara_pembuatan' => $data['cara_pembuatan'],
            'video' => $data['video'],
            'user_email' => $data['user_email'],
            'status_resep' => 'submit'
        ]);

        foreach (json_decode($request->bahan) as $bahan) {
            Ingredients::create([
                'nama' => $bahan->nama,
                'satuan' => $bahan->satuan,
                'banyak' => $bahan->banyak,
                'keterangan' => $bahan->keterangan,
                'resep_idresep' => $recipe->id
            ]);
        }

        foreach (json_decode($request->alat) as $alat) {
            Tool::create([
                'nama_alat' => $alat->nama,
                'keterangan' => $alat->keterangan,
                'resep_idresep' => $recipe->id
            ]);
        }

        return response()->json([
            "msg" => "Resep berhasil dibuat",
            "data" => $recipe
        ], 200);
    }
}