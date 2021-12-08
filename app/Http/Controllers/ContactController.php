<?php
namespace App\Http\Controllers;

use App\Models\Address;
use App\Models\Message;
use App\Models\AdminUser;
use App\Mail\NotifyBooker;
use App\Models\MusicStyle;
use Illuminate\Http\Request;
use App\Http\Requests\BandRequest;
use Illuminate\Support\Facades\Mail;
use App\Http\Controllers\Controller as BaseController;
use Illuminate\Support\Facades\Validator;

class ContactController extends BaseController
{
//    use DispatchesJobs, ValidatesRequests;

    public function formBands() {
        $musicStyleOptions = MusicStyle::orderBy('name')->get()->keyBy('id')->map->name;
		return view('public.form.bands', compact('musicStyleOptions'));
    }

    public function sendBands( BandRequest $request )
    {
        $useMusicStyles = config('my.musicStyles.enabled');

		$validated = $request->validated();
		$message = Message::create($validated);

        if(app()->environment('local')) {
            $users = ['engels@goldenacker.de'];
        } else {
            $query = AdminUser::select(['email']);
            if($useMusicStyles) {
                $musicStyleId	= $validated['music_style_id'];
                $query->whereHas('musicStyles', function ($query) use ($musicStyleId) {
                    $query->where('music_style.id', $musicStyleId);
                });
            }
            $users = $query->pluck('email');
        }

        $users = ['engels@goldenacker.de'];

		$notifyBooker = new NotifyBooker($message);

		try {
			Mail::to($users)->send($notifyBooker);
			$content = $notifyBooker->render();
		} catch (Exception $e ) {
			$content = 'Error: Mail konnte nicht versand werden!<br>'. $e->getMessage();
		}

		return view('public.contact', compact('content'));
    }

	public function removeAddressShow($token)
	{
		$address = Address::where('token', $token)->first();
		return view('public.address-remove', compact('address'));
	}

	public function removeAddressHard($token)
	{
		$address = Address::where('token', $token)->first();
		return view('public.address-remove', compact('address'));
	}
}
