<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'description', 'price', 'stock', 'image'];

    // Relación con los detalles de los pedidos
    public function orderDetails()
    {
        return $this->hasMany(OrderDetail::class);
    }
}
