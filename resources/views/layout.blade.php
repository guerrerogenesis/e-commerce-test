 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-commerce test</title>
    @vite('resources/css/app.css')
</head>
    <body>
        <main>
            <header>
                <nav class="bg-gray-800 text-white p-4">
                    <div class="container mx-auto flex justify-between items-center">
                        <a href="/" class="font-bold">E-commerce</a>
                        <a href="/orders" class="hover:underline">Orders</a>
                    </div>
                </nav>
        <div class="container">
            @yield('content')
        </div>
        </main>
        
    </body>
    <footer>
    @stack('scripts')

    </footer>
</html>