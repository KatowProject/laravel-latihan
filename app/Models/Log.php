<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasEvents;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Log extends Model
{
    use HasFactory, HasEvents;

    protected $table = 'log';

    protected $fillable = [
        'module',
        'action',
        'useraccess'
    ];
}