<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\OrderResource;
use App\Http\Resources\OrderDetailsResource;
use App\Models\Product;
use Illuminate\Support\Facades\DB;


class OrderController extends Controller
{
    public function index(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id',
        ]);
    
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        
        $userId = $request->query('user_id');

        if ($userId) {
            $orders = Order::where('user_id', $userId)
                ->with('details.product') 
                ->get();
        } else {
            $orders = Order::with('details.product')->get();
        }
        return OrderResource::collection($orders);
    }

    public function show($id)
    {
        $order = Order::with(['details.product', 'user'])->findOrFail($id);

        $orderDetails = $order->details()->with('product')->get();
        return new OrderDetailsResource($order);
    }

}
