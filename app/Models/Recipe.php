<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasEvents;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Recipe extends Model
{
    use HasFactory, HasEvents;

    protected $table = 'resep';
    protected $fillable = ['idresep', 'judul', 'gambar', 'cara_pembuatan', 'video', 'user_email', 'status_resep'];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_email', 'email');
    }
}
