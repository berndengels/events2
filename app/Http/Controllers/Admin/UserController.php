<?php
/**
 * UserController.php
 *
 * @author    Bernd Engels
 * @created   28.02.19 17:17
 * @copyright Webwerk Berlin GmbH
 */
namespace App\Http\Controllers\Admin;

use App\Http\Requests\UserRequest;
use App\Models\MusicStyle;
use Exception;
use Hash;
use App\Forms\UserForm;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\AdminUser;
use Illuminate\Validation\Rule;
use Kris\LaravelFormBuilder\FormBuilder;
use Kris\LaravelFormBuilder\FormBuilderTrait;

class UserController extends MainController
{
    use FormBuilderTrait;

    static protected $model = AdminUser::class;
    static protected $form = UserForm::class;

    public function index() {

		if($this->isAdmin) {
			$data = AdminUser::sortable()->paginate( $this->paginationLimit );
		} else {
			$data = AdminUser::where('id', auth()->user()->id)->paginate( $this->paginationLimit );
		}

		return view('admin.users', [
            'data'      => $data,
            'addLink'   => $this->addLink,
            'entity'    => $this->entity,
            'title'     => Str::plural($this->title),
        ]);
    }

    public function edit( FormBuilder $formBuilder, $id = 0, $options = null ) {
        $user   = ($id > 0) ? AdminUser::findOrFail($id): null;
        $form   = $formBuilder->create(UserForm::class, ['model' => $user]);

        $form->password->setValue(null);

        return view('admin.form.user', [
            'form'      => $form,
            'listLink'  => $this->listLink,
            'title'     => $this->title,
        ]);
    }

	public function reset()
	{
		if( !$this->isAdmin ) {
			return redirect()->route('admin.userList');
		}

		$users = AdminUser::where('username','!=','bengels')->get();
		$count = $users->count();
		if($count) {
			/**
			 * @var $user AdminUser
			 */
			foreach($users as $user) {
				$user->password = Hash::make($user->username  . '7');
				$user->save();
			}
		}
		return redirect()->route('admin.userList', ['msg' => 'Passwörter von ' . $count . ' Usern zurückgesetzt!']);
	}

    public function store(UserRequest $request, $id = 0 )
    {
        $user   = ($id > 0) ? AdminUser::find($id) : new AdminUser();
        $values = $request->validated();

        $user->username         = $values['username'];
        $user->email            = $values['email'];
        $user->activated        = isset($values['activated']) ? 1 : 0;
        $user->is_super_admin   = ($this->isAdmin && (bool) $values['is_super_admin']) ?? null;

        if( $values['password'] && '' !== $values['password'] ) {
            $user->password = Hash::make($values['password']);
        }

        if(isset($values['music_styles'])) {
            $musicStyles = collect($values['music_styles']);

			$user->musicStyles()->sync($values['music_styles']);
/*
            if($musicStyles->count() > 0 && $musicStyles->first()) {
                $user->musicStyles()->sync($values['music_styles']);
            } else {
                $user->musicStyles()->detach();
            }
*/
        }

        try {
            $user->saveOrFail();
            $id = $user->id;
        } catch (Exception $e) {
            return back()->with('error','Fehler: '.$e->getMessage());
        }

        switch($request->submit) {
            case 'save':
                return redirect()->route('admin.adminUserEdit', ['id' => $id]);
            case 'saveAndBack':
            default:
                return redirect()->route('admin.adminUserList');
        }
    }
}
