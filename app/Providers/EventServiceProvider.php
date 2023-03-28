<?php

namespace App\Providers;

use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Event;

use App\Models\User;
use App\Observers\UserObserver;

use App\Models\Recipe;
use App\Observers\RecipeObserver;

use App\Models\Tool;
use App\Observers\ToolObserver;

use App\Models\Ingredients;
use App\Observers\IngredientObserver;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        User::observe(UserObserver::class);
        Recipe::observe(RecipeObserver::class);
        Tool::observe(ToolObserver::class);
        Ingredients::observe(IngredientObserver::class);
    }
}