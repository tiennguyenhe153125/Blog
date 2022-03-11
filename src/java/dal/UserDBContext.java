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
import model.Blog;
import model.Comment;
import model.User;

/**
 *
 * @author ADMIN
 */
public class UserDBContext extends DBContext {

    public ArrayList<User> getUsers() {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "SELECT uid\n"
                    + "      ,[displayname]\n"
                    + "      ,[gender]\n"
                    + "      ,[dob]\n"
                    + "      ,[address]\n"
                    + "  FROM [User]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("uid"));
                u.setDisplayName(rs.getString("displayname"));
                u.setGender(rs.getBoolean("gender"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                users.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }

    public User getUser(int id) {
        try {
            String sql = "SELECT [uid]\n"
                    + "      ,[displayname]\n"
                    + "      ,[gender]\n"
                    + "      ,[dob]\n"
                    + "      ,[address]\n"
                    + "  FROM [User]\n"
                    + "  WHERE [uid] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(id);
                u.setDisplayName(rs.getString("displayname"));
                u.setGender(rs.getBoolean("gender"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                return u;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getUser_Comment(int id) {
        try {
            String sql = "select u.[uid], u.displayname, u.gender, u.dob, u.[address], cid, bid, "
                    + "u2.[uid] as uid2, u2.displayname as display2, u2.gender as gen2, u2.dob as dob2, u2.[address] as add2, "
                    + "blogTitle, [description], cdes, cfrom\n"
                    + "from [User] u left join Comment c on u.[uid] = c.usid\n"
                    + "             left join Blog b on c.blgid = b.bid\n"
                    + "             left join [User] u2 on b.userid = u2.[uid]\n"
                    + "where u.[uid] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            User u = null;
            while (rs.next()) {
                if (u == null) {
                    u = new User();
                    u.setId(id);
                    u.setDisplayName(rs.getString("displayname"));
                    u.setGender(rs.getBoolean("gender"));
                    u.setDob(rs.getDate("dob"));
                    u.setAddress(rs.getString("address"));
                }
                int cid = rs.getInt("cid");
                if (cid != 0) {
                    Comment c = new Comment();
                    c.setId(cid);
                    Blog b = new Blog();
                    b.setId(rs.getInt("bid"));
                    User u2 = new User();
                    u2.setId(rs.getInt("uid2"));
                    u2.setDisplayName(rs.getString("display2"));
                    u2.setGender(rs.getBoolean("gen2"));
                    u2.setDob(rs.getDate("dob2"));
                    u2.setAddress(rs.getString("add2"));
                    b.setUser(u2);
                    b.setTitle(rs.getString("blogTitle"));
                    b.setDescription(rs.getString("description"));
                    c.setBlog(b);
                    c.setUser(u);
                    c.setDescription(rs.getString("cdes"));
                    c.setFrom(rs.getDate("cfrom"));
                    u.getComments().add(c);
                }
            }
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getUser_Blog(int id) {
        try {
            String sql = "select [uid], displayname, gender, dob, [address], bid, blogTitle, bfrom, [description]\n"
                    + "from [User] u left join Blog b on u.[uid] = b.userid\n"
                    + "where u.[uid] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            User u = null;
            while (rs.next()) {
                if (u == null) {
                    u = new User();
                    u.setId(id);
                    u.setDisplayName(rs.getString("displayname"));
                    u.setGender(rs.getBoolean("gender"));
                    u.setDob(rs.getDate("dob"));
                    u.setAddress(rs.getString("address"));
                }
                int bid = rs.getInt("bid");
                if (bid != 0) {
                    Blog b = new Blog();
                    b.setId(bid);
                    b.setTitle(rs.getString("blogTitle"));
                    b.setFrom(rs.getDate("bfrom"));
                    b.setDescription(rs.getString("description"));
                    b.setUser(u);
                    u.getBlogs().add(b);
                }
            }
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getUserAccount(Account account) {
        try {
            String sql = "SELECT [uid], displayname, gender, dob, [address]\n"
                    + "FROM [User] u INNER JOIN Account a ON u.[uid] = a.aid\n"
                    + "WHERE a.[username] = ? AND a.[password] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getUsername());
            stm.setString(2, account.getPassword());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("uid"));
                u.setDisplayName(rs.getString("displayname"));
                u.setGender(rs.getBoolean("gender"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                return u;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

//    public void insertUser (User u) {
//        try {
//            String sql = "INSERT INTO [User]\n" +
//                    "           ([displayname]\n" +
//                    "           ,[gender]\n" +
//                    "           ,[dob]\n" +
//                    "           ,[address])\n" +
//                    "     VALUES\n" +
//                    "           (?\n" +
//                    "           ,?\n" +
//                    "           ,?\n" +
//                    "           ,?)";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setString(1, u.getDisplayName());
//            stm.setBoolean(2, u.isGender());
//            stm.setDate(3, u.getDob());
//            stm.setString(4, u.getAddress());
//            stm.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
    public void deleteUser(int id) {
        try {
            String sql = "DELETE FROM [User]\n"
                    + "      WHERE [uid] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
}
