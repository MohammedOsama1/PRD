<?php

namespace App\Http\Controllers\API;

trait ApiResponseTrait
{
    public function apiResponse($data=null,$message=null,$status=null){
        $array=[
          'data'=>$data,
            'msg'=>$message,
            'status'=>$status
        ];

        return response($array,$status);

    }
}
