<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;


class OrderController extends Controller
{
    //
    public function index(Request $request)
    {
        $userId = $request->query('user_id'); 

        $orders = [];

        if ($userId) {
            $response = Http::get(route('api.orders'), [
                'user_id' => $userId,
            ]);

            if ($response->successful()) {
                $orders = $response->json()['data']; 
            } else {
                return redirect()->back()->withErrors('Error al obtener los pedidos.');
            }
        }

        return view('orders.index', [
            'orders' => $orders,
            'userId' => $userId,
        ]);
    }

    public function show($id)
    {
    
        $response = Http::get(route('api.ordersDetails', ['order' => $id]));

        if ($response->successful()) {
            
            $orderDetails = $response->json(); 
            return view('orders.details', ['order' => $orderDetails['data']]);
        }

        abort(404, 'No se encontraron detalles para la orden.');
    }
}
