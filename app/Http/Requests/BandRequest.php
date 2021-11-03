<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class BandRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name'      => 'required',
            'email'     => 'required|email',
            'message'   => 'required',
            'music_style_id' => config('my.musicStyles.enabled') ? 'required' : '',
            'g-recaptcha-response' => 'required|captcha',
        ];
    }

    public function messages()
    {
        return [
            'name.required'     => 'Bitte einen Namen angeben.',
            'email.required'    => 'Bitte eine Email-Adresse angeben.',
            'email.email'       => 'Die Email-Adresse scheint nicht valide zu sein',
            'message.required'  => 'Bitte eine Nachricht eintragen.',
            'g-recaptcha-response.required' => 'Bediene bitte das ReCaptcha-Feld',
            'g-recaptcha-response.captcha'  => 'Die ReCaptcha-Eingabe ist falsch',
        ];
    }
}
