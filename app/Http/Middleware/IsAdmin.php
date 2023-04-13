<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

// use Illuminate\Support\Facades\Auth;

class IsAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        // print_r(Auth::user()->role);

        if (Auth::user()->role === 'Admin') {
            return $next($request);
        } else {
            return response([
                'status' => 'Failed',
                'code' => 401,
                'message' => 'Access Denied as you are not an Admin!!',
            ], 401);
        }
    }
}
