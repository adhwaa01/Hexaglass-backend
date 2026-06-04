@extends('layouts.app', ['title' => $title ?? 'Dashboard'])

@section('content')
    {{ $slot }}
@endsection