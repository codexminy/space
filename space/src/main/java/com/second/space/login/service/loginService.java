package com.second.space.login.service;

import com.second.space.user_.model.LoginIdListDTO;
import com.second.space.user_.model.UserDTO;

public interface loginService {

	int insertGoogleUser(UserDTO user, LoginIdListDTO loginList);

}
