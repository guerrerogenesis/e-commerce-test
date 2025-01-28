<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class OrderListItemResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'product' => [
                'id' => $this->product->id,
                'name' => $this->product->name,
                'description' => $this->product->description,
                'image' => $this->product->image,
                'price' => $this->product->price,
            ],
            'quantity' => $this->quantity,
            'price' => $this->price,
        ];
    }
}
