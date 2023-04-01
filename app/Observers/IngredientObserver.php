<?php

namespace App\Observers;

use App\Models\Ingredients;
use App\Models\Log;

class IngredientObserver
{
    /**
     * Handle the Ingredient "created" event.
     *
     * @param  \App\Models\Ingredients  $ingredient
     * @return void
     */
    public function created(Ingredients $ingredient)
    {
        Log::create([
            'module' => 'tambah alat',
            'action' => 'tambah bahan untuk id resep ' . $ingredient->resep_idresep . ' dengan bahan ' . $ingredient->nama,
            'useraccess' => '-'
        ]);
    }

    /**
     * Handle the Ingredient "updated" event.
     *
     * @param  \App\Models\Ingredients  $ingredient
     * @return void
     */
    public function updated(Ingredients $ingredient)
    {
        //
    }

    /**
     * Handle the Ingredient "deleted" event.
     *
     * @param  \App\Models\Ingredients  $ingredient
     * @return void
     */
    public function deleted(Ingredients $ingredient)
    {
        Log::create([
            'module' => 'hapus alat',
            'action' => 'hapus bahan untuk id resep ' . $ingredient->resep_idresep,
            'useraccess' => '-'
        ]);
    }

    /**
     * Handle the Ingredient "restored" event.
     *
     * @param  \App\Models\Ingredients  $ingredient
     * @return void
     */
    public function restored(Ingredients $ingredient)
    {
        //
    }

    /**
     * Handle the Ingredient "force deleted" event.
     *
     * @param  \App\Models\Ingredients  $ingredient
     * @return void
     */
    public function forceDeleted(Ingredients $ingredient)
    {
        //
    }
}