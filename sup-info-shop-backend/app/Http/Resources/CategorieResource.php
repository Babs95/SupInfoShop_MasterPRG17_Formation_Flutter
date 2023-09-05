<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CategorieResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'libelle' => $this->libelle,
            'icon_name' => asset('storage/images/categories/'.$this->icon_name),
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
