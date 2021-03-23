
package services;

import dataaccess.UserDB;
import java.util.List;
import models.Users;

public class UserService {
    private UserDB userDB;
    
    public UserService(){
        userDB = new UserDB();
    }
    public List<Users> getAllUsers() throws Exception{
        return userDB.getAll();
    }
    
    public Users get(String email) throws Exception {
        return userDB.get(email);
    }
    
    
}
