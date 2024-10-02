package dao;

import java.util.List;

import model.User;

public interface UserDao {
    void addUser(User user);

    User getUser(int id);

    List<User> getAllUsers();

    void updateUser(User user);

    void deleteUser(int id);
}
