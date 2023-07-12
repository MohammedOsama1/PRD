<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Models\categories;
use App\Models\Allcategories;
use App\Models\wishlist;
use App\Http\Resources\postResourse;
use Dotenv\Validator;
use Illuminate\Http\Request;


class mainController extends Controller
{
    use ApiResponseTrait;

    public function AllCategories()
    {
        $AllCategories = Allcategories::all();
        return $this->apiResponse($AllCategories, 'all categories', 200);
    }

    public function categories()
    {
        $categories = categories::all();
        return $this->apiResponse($categories, 'all categories', 200);
    }

    public function wishlist()
    {
        $wishlist = wishlist::all();
        return $this->apiResponse($wishlist, 'all wish-list', 200);
    }

    public function CategoriesInsertion(Request $request)
    {
        $post = Allcategories::create($request->all());
        if ($post) {
            return $this->apiResponse(new postResourse($post), 'data saved', '201');
        } else {
            return $this->apiResponse(null, 'not found', '404');
        }
    }

    public function categoriesNamesInsertion(Request $request3)
    {
        $post3 = categories::create($request3->all());
        if ($post3) {
            return $this->apiResponse(new postResourse($post3), 'data saved', '201');
        } else {
            return $this->apiResponse(null, 'not found', '404');
        }
    }

    public function Categoriesupdate(Request $request, $ID)
    {
        $post = Allcategories::find($ID);
        
        if (!$post) {
            return $this->apiResponse(null, 'Not found', '404');
        }
        
        Allcategories::where('ID','=',$ID )->update($request->all() );
        return $this->apiResponse(new postResourse($post), 'Data updated', '201');
    }
    

    public function Categoriesdelete(Request $request14)
    {
        Allcategories::where('ID','=',$request14-> id )->delete();
        return "deleted";
    }


    public function WishListInsertion(Request $request16)
    {
        $item = $request16->input('product-id');
        $userId = $request16->input('user-id');

    
        $existingItem = Wishlist::where('user-id', $userId)->where('product-id', $item)->first();
        
        if ($existingItem) {

            Wishlist::where('product-id','=',$item)->delete();
            return $this->apiResponse(null, 'Item deleted :)', '200');  
        }
        
        $post16 = Wishlist::create($request16->all());
    
        if ($post16) {
            return $this->apiResponse(new postResourse($post16), 'Data saved', '201');
        } else {
            return $this->apiResponse(null, 'Failed to save data', '500');
        }
    }
    
    
    public function Searchcategories($category){
        $search=Allcategories::where('Category',$category)->get();
        if($search){
            return $this->apiResponse(new postResourse($search), 'data found', '201');
        }
        else {
            return $this->apiResponse(null, 'not found', '404');
        }
    }

    public function getWishlist($userId)
{
    $wishlist = Wishlist::where('user-id', $userId)->get();
    
    return $this->apiResponse($wishlist, 'Wishlist retrieved successfully', '200');
}

}
