@extends('layout')

@section('content')
<h1 class="text-2xl font-bold my-10">Detalles de la Orden #{{ $order['id'] }}</h1>

<div class="flex flex-col md:flex-row items-start md:items-center gap-5 bg-white p-4 rounded-md shadow-md">
    <div class="basis-full md:basis-1/2">
        <p class="uppercase">{{ $order['status'] }}</p>
        <p><strong>Fecha del pedido:</strong> {{ $order['created_at'] }}</p>
        <p><strong>Última Actualizacion:</strong> {{ $order['updated_at'] }}</p>
        <p><strong>Metodo de pago</strong> {{ $order['payment_method']['type']."
            ".$order['payment_method']['masked_number'] }}</p>
    </div>
    <div class="basis-full md:basis-1/2">
        <p><strong>Usuario:</strong> {{ $order['user']['name'] }}</p>
        <p><strong>Dirección:</strong> {{ $order['user']['address'] }}</p>
    </div>


</div>

<h2 class="text-xl font-semibold mt-6">Producto(s):</h2>
<div class="flex flex-col gap-5 bg-gray-100 p-4 rounded-md mb-4">
    @foreach ($order['details'] as $detail)
    <div class="flex flex-row gap-4 justify-start items-center">

        <img src="{{ $detail['product_image'] }}" alt="{{ $detail['product_name'] }}"
            class="h-36 aspect-20 object-cover rounded-md border border-gray-400">
        <div>
            <p><strong>Producto:</strong> {{ $detail['product_name'] }}</p>
            <p><strong>Descripción:</strong> {{ $detail['product_description'] }}</p>
            <p><strong>Cantidad:</strong> {{ $detail['quantity'] }}</p>
            <p><strong>Precio:</strong> ${{ $detail['price'] }}</p>
        </div>

    </div>
    @endforeach

</div>


<a href="/orders" class="mt-6 inline-block bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600">Volver a la lista de
    pedidos</a>
@endsection
