<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class OrderDetailsResource extends JsonResource
{
    public function toArray($request)
    {
        $paymentMethod = json_decode($this->payment_method, true);

        return [
            'id' => $this->id,
            'status' => $this->status,
            'created_at' => $this->created_at->toDateTimeString(),
            'updated_at' => $this->updated_at->toDateTimeString(),
            'user' => [
                'name' => $this->user->name,
                'address' => $this->user->address,
            ],
            'details' => $this->details->map(function ($detail) {
                return [
                    'product_name' => $detail->product->name,
                    'product_description' => $detail->product->description,
                    'product_image' => $detail->product->image,
                    'price' => $detail->product->price,
                    'quantity' => $detail->quantity,
                ];
            }),
            'payment_method' => [
                'type' => $paymentMethod['type'] ?? 'N/A',
                'masked_number' => $this->maskCardNumber($paymentMethod['number'] ?? ''),
                'name' => $paymentMethod['name'] ?? 'N/A',
                'expiration_date' => $paymentMethod['expirationDate'] ?? 'N/A',
            ],
        ];
    }

    private function maskCardNumber($cardNumber)
    {
        if (strlen($cardNumber) > 4) {
            return str_repeat('*', strlen($cardNumber) - 4) . substr($cardNumber, -4);
        }
        return $cardNumber;
    }
}
