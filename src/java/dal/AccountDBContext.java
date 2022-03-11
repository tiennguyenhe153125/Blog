/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Group;
import model.User;

/**
 *
 * @author ADMIN
 */
public class AccountDBContext extends DBContext {

    public Account getAccount(String username, String password) {
        try {
            String sql = "select a.username, a.[password], a.aid, g.gid, g.gname\n"
                    + "from Account a left join [Group Account] ga on a.username = ga.gausername\n"
                    + "				left join [Group] g on ga.gaid = g.gid\n"
                    + "WHERE BINARY_CHECKSUM(Username) = BINARY_CHECKSUM(?)\n"
                    + "      AND BINARY_CHECKSUM(Password) = BINARY_CHECKSUM(?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            Account account = null;
            while (rs.next()) {
                if (account == null) {
                    account = new Account();
                    account.setUsername(username);
                    account.setPassword(password);
                    GroupDBContext db = new GroupDBContext();
                    Group g = db.getGroup(rs.getInt("gid"));
                    account.setGroup(g);
                }
            }
            return account;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Account> getAccounts() {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            String sql = "select a.username, a.[password], a.aid, g.gid, g.gname\n"
                    + "from Account a inner join [User] u on a.aid = u.[uid]\n"
                    + "				left join [Group Account] ga on a.username = ga.gausername\n"
                    + "				left join [Group] g on ga.gaid = g.gid\n"
                    + "				order by aid asc, gid desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                int uid = rs.getInt("aid");
                UserDBContext db = new UserDBContext();
                User user = db.getUser(uid);
                account.setUser(user);
                Group g = new Group();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                account.setGroup(g);
                accounts.add(account);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }

    public Account checkAccountExist(String acc) {
        try {
            String sql = "SELECT [username]\n"
                    + "      ,[password]\n"
                    + "  FROM [Account]\n"
                    + "  WHERE username LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, acc);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account getAccountUser(User user) {
        try {
            String sql = "select username, [password], aid, gid, gname\n"
                    + "from Account a inner join [User] u on a.aid = u.[uid]\n"
                    + "                 left join [Group Account] ga on a.username = ga.gausername\n"
                    + "                 left join [Group] g on ga.gaid = g.gid\n"
                    + "where [uid] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, user.getId());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                Group g = new Group();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                a.setGroup(g);
                a.setUser(user);
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void ban(Account account) {
        try {
            String sql = "UPDATE [Group Account]\n"
                    + "   SET [gaid] = ?\n"
                    + " WHERE [gausername] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, 3);
            stm.setString(2, account.getUsername());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void removeBan(Account account) {
        try {
            String sql = "UPDATE [Group Account]\n"
                    + "   SET [gaid] = ?\n"
                    + " WHERE [gausername] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, 2);
            stm.setString(2, account.getUsername());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
