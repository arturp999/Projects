<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Contact;


class ContactController extends Controller
{
    public function contact()
    {
        return view('contactPage');
    }

    public function validationRules(Request $request)
    {
            $validated = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255'],
            'description' => ['required','max:255']
        ]);
    }

    public function contactMessage(Request $request)
    {
        $validation = new ContactController;
        $validation->validationRules($request);

        $contactMessage = new Contact();
        $contactMessage->name = $request->name;
        $contactMessage->email = $request->email;
        $contactMessage->description = $request->description;
        $contactMessage->update(['updated_at' => now()]);
        // dd($request);
        $contactMessage->save();


        return redirect('/movie')->with('Message','Your message has been sent!');
    }
}
