<?php

namespace App\View\Components\Form\Input;

use App\View\Components\Form\Field;
use Illuminate\View\View;

class Email extends Field
{
    /**
     * Get the view / contents that represent the component.
     * @return View|string
     */
    public function render()
    {
        return view('components.form.input.email');
    }
}
