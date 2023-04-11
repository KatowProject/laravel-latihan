<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use App\Models\Recipe;
use App\Models\Tool;
use App\Models\Ingredients;
use Helper\MessageError;
use Illuminate\Support\Facades\DB;

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
                'name' => $user['nama'],
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

    public function show_recipes()
    {
        $recipes = Recipe::all();

        $data = [];
        foreach ($recipes as $recipe) {
            $recipe['gambar'] = url('uploads/' . $recipe['gambar']);
            $data[] = $recipe;
        }
        return response()->json([
            "msg" => "Recipe List",
            "data" => $recipes
        ], 200);

    }

    public function show_recipe($id)
    {
        $recipe = Recipe::where('idresep', $id)->first();
        if (!$recipe) {
            return response()->json([
                "msg" => "Recipe List",
                "data" => "Not Found"
            ], 404);
        }

        return response()->json([
            "msg" => "Recipe List",
            "data" => $recipe
        ], 200);
    }

    public function update_register(Request $request, $id)
    {
        $user = User::find($id);

        if ($user) {
            $validator = Validator::make($request->all(), [
                'nama' => 'required|string',
                'role' => 'required|in:admin,user',
                'status' => 'required|in:aktif,nonaktif',
                'email_validate' => 'required|email'
            ]);

            if ($validator->fails()) {
                return MessageError::message($validator->errors()->messages());
            }

            $data = $validator->validated();

            // update data
            $user->update($data);

            $data['msg'] = "UserID: $id berhasil diupdate";
            return response()->json([
                "data" => $data
            ], 200);
        }
    }

    public function delete_register($id)
    {
        $user = User::find($id);
        if (!$user) {
            return response()->json([
                "data" => [
                    "msg" => "user tidak ditemukan",
                ]
            ], 404);
        }

        $user->delete();
        $user['msg'] = "UserID: $id berhasil dihapus";
        return response()->json([
            "data" => $user
        ], 200);
    }

    public function activation_account($id)
    {
        $user = User::find($id);
        if (!$user) {
            return response()->json([
                "data" => "user tidak ditemukan"
            ], 404);
        }

        $user->update(['status' => 'aktif']);

        $data['msg'] = "UserID: $id berhasil diaktifkan";
        return response()->json([
            "data" => $user
        ], 200);
    }

    public function deactivation_account($id)
    {
        $user = User::find($id);
        if (!$user) {
            return response()->json([
                "data" => [
                    "msg" => "user tidak ditemukan",
                ]
            ], 404);
        }

        $user->update(['status' => 'nonaktif']);

        $user['msg'] = "UserID: $id berhasil dinonaktifkan";
        return response()->json([
            "data" => $user
        ], 200);

    }

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

    public function update_recipe(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'judul' => 'required|max:255',
            'gambar' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'cara_pembuatan' => 'required',
            'video' => 'required',
            'user_email' => 'required',
            'bahan' => 'required',
            'alat' => 'required',
            '__method' => 'required|in:PUT'
        ]);

        if ($validator->fails()) {
            return MessageError::message($validator->errors()->messages());
        }

        // custom key
        $recipe = Recipe::where('idresep', $id);
        if (!$recipe->first()) {
            return response()->json([
                "data" => [
                    "msg" => "Resep tidak ditemukan",
                ]
            ], 404);
        }

        $thumb = $request->file('gambar');
        $filename = time() . '.' . $thumb->getClientOriginalExtension();
        $thumb->move('uploads', $filename);

        $data = $validator->validated();

        $recipe->update([
            'judul' => $data['judul'],
            'gambar' => $filename,
            'cara_pembuatan' => $data['cara_pembuatan'],
            'video' => $data['video'],
            'user_email' => $data['user_email'],
            'status_resep' => 'submit'
        ]);

        Ingredients::where('resep_idresep', $id)->delete();
        Tool::where('resep_idresep', $id)->delete();

        foreach (json_decode($request->bahan) as $bahan) {
            Ingredients::create([
                'nama' => $bahan->nama,
                'satuan' => $bahan->satuan,
                'banyak' => $bahan->banyak,
                'keterangan' => $bahan->keterangan,
                'resep_idresep' => $id
            ]);
        }

        foreach (json_decode($request->alat) as $alat) {
            Tool::create([
                'nama_alat' => $alat->nama,
                'keterangan' => $alat->keterangan,
                'resep_idresep' => $id
            ]);
        }

        $data['msg'] = "Resep berhasil diupdate";
        return response()->json([
            "data" => $data
        ], 200);
    }

    public function delete_recipe($id)
    {
        Tool::where('resep_idresep', $id)->delete();
        Ingredients::where('resep_idresep', $id)->delete();
        Recipe::where('idresep', $id)->delete();

        return response()->json([
            "msg" => "Resep berhasil dihapus",
            "resep_id" => $id
        ], 200);
    }

    public function publish_recipe($id)
    {
        $recipe = Recipe::where('idresep', $id);
        if (!$recipe->first()) {
            return response()->json([
                "msg" => "Resep tidak ditemukan",
                "data" => "Not Found"
            ], 422);
        }

        $recipe->update(['status_resep' => 'publish']);
        $recipe = $recipe->first();
        \App\Models\Log::create([
            'module' => 'publish',
            'action' => 'publish resep dengan id ' . $id,
            'useraccess' => $recipe['user_email'] || 'admin'
        ]);

        return response()->json([
            "msg" => "Resep berhasil dipublish. ID Resep: " . $id,
            "data" => $recipe
        ], 200);
    }

    public function unpublish_recipe($id)
    {
        $recipe = Recipe::where('idresep', $id);
        if (!$recipe->first()) {
            return response()->json([
                "msg" => "Resep tidak ditemukan",
                "data" => "Not Found"
            ], 422);
        }

        $recipe->update(['status_resep' => 'unpublished']);
        $recipe = $recipe->first();
        \App\Models\Log::create([
            "module" => "unpublish",
            "action" => "unpublish resep dengan id " . $id,
            "useraccess" => $recipe['user_email'] || "admin"
        ]);

        return response()->json([
            "msg" => "Resep berhasil diunpublish. ID Resep: " . $id,
            "data" => $recipe
        ], 200);
    }

    public function dashboard()
    {
        $total_recipes = Recipe::count();
        $total_publish_recipes = Recipe::where('status_resep', 'publish')->count();
        $popular_recipe = DB::table('resep')
            ->select('judul', DB::raw('count(idresep_view) as jumlah'))
            ->leftJoin('resep_view', 'resep.idresep', '=', 'resep_view.resep_idresep')
            ->groupBy('judul')
            ->orderBy(DB::raw('count(idresep_view)'), 'desc')
            ->limit(10)
            ->get();

        return response()->json([
            "data" => [
                "msg" => "Dashboard Monitoring",
                "totalRecipes" => $total_recipes,
                "totalPublishRecipes" => $total_publish_recipes,
                "popularRecipe" => $popular_recipe
            ]
        ], 200);
    }
}
