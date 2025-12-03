<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdatePropietarioRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'nombres' => 'sometimes|nullable|string|max:100',
            'apellidos' => 'sometimes|nullable|string|max:100',
            'documento' => [
                'sometimes',
                'required',
                'string',
                'max:50',
                Rule::unique('propietarios')->ignore(request()->route('propietario'))
            ],
            'telefono' => 'sometimes|nullable|string|max:20',
            'email' => 'sometimes|nullable|email|max:100',
            'direccion' => 'sometimes|nullable|string|max:255',
        ];
    }
}
