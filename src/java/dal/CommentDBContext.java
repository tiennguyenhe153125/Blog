/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog;
import model.Comment;
import model.User;

/**
 *
 * @author ADMIN
 */
public class CommentDBContext extends DBContext {

    public Comment getComment(int id) {
        try {
            String sql = "select cid, bid, userid, blogTitle, bfrom, [description], [uid], displayname, gender, dob, [address], cdes, cfrom\n"
                    + "from Comment c inner join [Blog] b on c.blgid = b.bid\n"
                    + "             inner join [User] u on c.usid = u.[uid]\n"
                    + "where cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                Comment c = new Comment();
                c.setId(id);
                Blog b = new Blog();
                b.setId(rs.getInt("bid"));
                UserDBContext dbU = new UserDBContext();
                User u = dbU.getUser(rs.getInt("userid"));
                b.setUser(u);
                b.setTitle(rs.getString("blogTitle"));
                b.setFrom(rs.getDate("bfrom"));
                b.setDescription(rs.getString("description"));
                c.setBlog(b);
                User u2 = new User();
                u2.setId(rs.getInt("uid"));
                u2.setDisplayName(rs.getString("displayname"));
                u2.setGender(rs.getBoolean("gender"));
                u2.setDob(rs.getDate("dob"));
                u2.setAddress(rs.getString("address"));
                c.setDescription(rs.getString("cdes"));
                c.setFrom(rs.getDate("cfrom"));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insert(Comment cmt) {
        try {
            String sql = "INSERT INTO [Comment]\n"
                    + "           ([blgid]\n"
                    + "           ,[usid]\n"
                    + "           ,[cdes]\n"
                    + "           ,[cfrom])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cmt.getBlog().getId());
            stm.setInt(2, cmt.getUser().getId());
            stm.setString(3, cmt.getDescription());
            stm.setDate(4, cmt.getFrom());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void update(Comment cmt) {
        try {
            String sql = "UPDATE [Comment]\n"
                    + "   SET [blgid] = ?\n"
                    + "      ,[usid] = ?\n"
                    + "      ,[cdes] = ?\n"
                    + "      ,[cfrom] = ?\n"
                    + " WHERE cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cmt.getBlog().getId());
            stm.setInt(2, cmt.getUser().getId());
            stm.setString(3, cmt.getDescription());
            stm.setDate(4, cmt.getFrom());
            stm.setInt(5, cmt.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void delete(int id) {
        try {
            String sql = "DELETE FROM [Comment]\n"
                    + "      WHERE cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void removeFromBlog (int id) {
        try {
            String sql = "DELETE FROM [Comment]\n"
                    + "      WHERE blgid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
