@extends('layout')

@section('content')
<div class="flex flex-col h-auto justify-center items-center">

    <h1 class="text-2xl font-bold my-4">Lista de pedidos:</h1>

    @if ($userId === null) 

    <div class="user-id-form">
        <form id="user_id_form" method="GET" class="space-y-8 flex flex-col items-center justify-center">
            @csrf
            <label for="user_id" class="text-lg text-gray-800">Introduce tu ID de usuario:</label>
            <input
                class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg block w-full p-2.5"
                type="text" id="user_id" name="user_id" value="{{ old('user_id') }}">
            <button type="submit"
                class="py-3 px-5 text-sm font-medium text-center text-white rounded-lg bg-blue-500 sm:w-fit hover:bg-blue-600">Ver
                Pedidos</button>
        </form>
    </div>

    @else

    <div id="orders" class="w-full">
        @if (!empty($orders))
        @foreach ($orders as $order)
        <div class="flex flex-col gap-3 bg-white p-4 rounded-md shadow-md mb-4">
            <h2 data-status="{{ $order['status'] }}" class="text-status">{{ $order['status'] }}</h2>

            <div class="flex flex-col text-right text-sm text-gray-500">
                <span class="">Order ID: #{{ $order['id'] }}</span>
                <span>Fecha: {{ $order['created_at'] }}</span>
                <span>Total: ${{ $order['total'] }}</span>


            </div>

            <div class="flex gap-2">
                @foreach ($order['details'] as $product)
                <img src="{{ $product['product']['image'] }}" alt="{{ $product['product']['name'] }}"
                    class="w-20 h-20 object-cover rounded-md border border-gray-400">

                @endforeach
            </div>
            <div class="flex justify-end">
                <a href="/orders/{{ $order['id'] }}" class="py-2 px-3 text-sm font-medium text-center text-white rounded-lg bg-blue-500 sm:w-fit hover:bg-blue-600">Ver detalles del pedido</a>
            </div>

        </div>
        @endforeach
        @else
        <p class="text-gray-500">No se encontraron pedidos para este usuario.</p>

        @endif
    </div>
    @endif



</div>
@endsection