<?php

namespace App\Http\Middleware;

use Closure;
use Auth;

use App\Models\User;
use App\Models\Role;
use App\Models\RoleUser;
use Illuminate\Http\Request;

class CheckAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $userRole = Auth::user()->roles->pluck('name');
        if (!$userRole->contains('Admin')) {
            return redirect('/noPermission');        
        }else {
            return $next($request);
        }        
    }
}
