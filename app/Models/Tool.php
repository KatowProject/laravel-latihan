<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasEvents;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tool extends Model
{
    use HasFactory, HasEvents;

    protected $table = 'alat';
    protected $fillable = ['nama_alat', 'keterangan', 'resep_idresep'];
}
