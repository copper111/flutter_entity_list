import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_entity_list/authentication/api/loginApi.dart';
import 'package:dio/dio.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {}

class UnAuthenticated extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final LoginInfo user;
  final Dio connection;
  final String currentBaseUrl;


  Authenticated({@required this.user, @required this.connection, @required this.currentBaseUrl});

  @override
  List<Object> get props => [user];
}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  AuthenticationFailure({@required this.message});

  @override
  List<Object> get props => [message];
}