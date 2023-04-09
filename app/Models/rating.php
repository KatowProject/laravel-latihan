<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasEvents;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class rating extends Model
{
    use HasFactory, HasEvents;

    protected $table = 'rating';

    protected $fillable = ['rating', 'review', 'resep_idresep', 'email_user'];
}
