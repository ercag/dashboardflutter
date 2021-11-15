part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = User.empty,
    this.menuList,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(User user, List<Menu>? menuList)
      : this._(
            status: AuthenticationStatus.authenticated,
            user: user,
            menuList: menuList);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final User user;
  final List<Menu>? menuList;

  @override
  List<Object> get props => [status, user];
}
