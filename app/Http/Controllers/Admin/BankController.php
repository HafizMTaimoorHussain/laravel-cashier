<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use App\Models\Bank;
use App\Models\Organization;

use Illuminate\Http\Request;

class BankController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->data['banks'] = Bank::orderBy('created_at', 'DESC')->paginate(10);
        return view('bank.listing', $this->data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->data['organizations'] = Organization::orderBy('created_at', 'DESC')->paginate(10);
        return view('bank.create', $this->data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:banks,name',
            'organization' => 'required'
        ]);

        try {
            $bank = new Bank();
            $bank->name = $request->name;
            $bank->organization_id = $request->organization;
            $bank->save();

            return redirect()->route('bank.index')->with('success', 'Bank created successfully.'); 

        } catch(\Exception $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Bank $bank)
    {
        $this->data['bank'] = $bank;
        $this->data['organizations'] = Organization::orderBy('created_at', 'DESC')->get();
        return view('bank.edit', $this->data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Bank $bank)
    {
        $request->validate([
            'name' => 'required|unique:banks,name,'.$bank->id,
            'organization' => 'required'
        ]);

        try {
            $bank->name = $request->name;
            $bank->organization_id = $request->organization;
            $bank->save();

            return redirect()->route('bank.index')->with('success', 'Bank updated successfully.'); 

        } catch(\Exception $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Bank $bank)
    {
        try {
            $bank->delete();

            return redirect()->route('bank.index')->with('success', 'Bank deleted successfully.'); 

        } catch(\Exception $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }
    }
}
