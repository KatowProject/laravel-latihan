<?php

namespace App\Observers;

use App\Models\Tool;
use App\Models\Log;

class ToolObserver
{
    /**
     * Handle the Tool "created" event.
     *
     * @param  \App\Models\Tool  $tool
     * @return void
     */
    public function created(Tool $tool)
    {
        Log::create([
            'module' => 'Tool',
            'action' => 'Create' . $tool->nama_alat . ' ID: ' . $tool->id . 'ID Recipe: ' . $tool->resep_idresep,
            'useraccess' => '-'
        ]);
    }

    /**
     * Handle the Tool "updated" event.
     *
     * @param  \App\Models\Tool  $tool
     * @return void
     */
    public function updated(Tool $tool)
    {
        //
    }

    /**
     * Handle the Tool "deleted" event.
     *
     * @param  \App\Models\Tool  $tool
     * @return void
     */
    public function deleted(Tool $tool)
    {
        Log::create([
            'module' => 'Tool',
            'action' => 'Delete tool. ' . 'ID Recipe: ' . $tool->resep_idresep,
            'useraccess' => '-'
        ]);
    }

    /**
     * Handle the Tool "restored" event.
     *
     * @param  \App\Models\Tool  $tool
     * @return void
     */
    public function restored(Tool $tool)
    {
        //
    }

    /**
     * Handle the Tool "force deleted" event.
     *
     * @param  \App\Models\Tool  $tool
     * @return void
     */
    public function forceDeleted(Tool $tool)
    {
        //
    }
}