<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\OrderController;


Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


Route::get('orders', [OrderController::class, 'index'])->name('api.orders'); // Obtener todos los pedidos por usuario
Route::get('orders/{order}', [OrderController::class, 'show'])->name('api.ordersDetails'); // Obtener detalles de un pedido específico

