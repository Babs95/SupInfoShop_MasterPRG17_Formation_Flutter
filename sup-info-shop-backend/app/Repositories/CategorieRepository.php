<?php

namespace  App\Repositories;

use App\Models\Categorie;
use App\Repositories\ResourceRepository;
use App\utils\UploadUtil;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class  CategorieRepository extends ResourceRepository {

    protected $uploadUtil;
    public function __construct(Categorie $categorie,
                                UploadUtil $uploadUtil)
    {
        $this->model = $categorie;
        $this->uploadUtil = $uploadUtil;
    }

    public function save(Request $request) {
        $inputs = $request->all();

        $this->model->libelle = $inputs['libelle'];
        if($request->hasFile('icon_name')){
            $this->model->icon_name = $this->uploadUtil->uploadFile($request->file('icon_name'));
        }

        try{
            $this->model->save();
            return $this->model;
        }catch (QueryException | \Throwable $e){
            Log::info('Erreur création catégorie: '. $e);
            return null;
        }
    }
}
