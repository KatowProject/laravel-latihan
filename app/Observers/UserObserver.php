<?php

namespace App\Observers;

use App\Models\User;
use App\Models\Log;

class UserObserver
{
    /**
     * Handle the User "creating" event.
     *
     * @param \App\Models\User  $user
     * @return void
     *
     */

    public function creating(User $user)
    {
        $user->last_login = now();
    }

    /**
     * Handle the User "created" event.
     *
     * @param \App\Models\User  $user
     * @return void
     */

    public function created(User $user)
    {
        Log::create([
            'module' => 'User',
            'action' => 'Create',
            'useraccess' => $user->email
        ]);
    }

    public function updated(User $user)
    {
        Log::create([
            'module' => 'User',
            'action' => 'Update',
            'useraccess' => $user->email
        ]);
    }

    public function deleted(User $user)
    {
        Log::create([
            'module' => 'User',
            'action' => 'Delete',
            'useraccess' => $user->email
        ]);
    }
}