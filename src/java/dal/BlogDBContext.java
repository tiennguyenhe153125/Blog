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
import model.Blog;
import model.Comment;
import model.User;

/**
 *
 * @author ADMIN
 */
public class BlogDBContext extends DBContext {

    public Blog getBlog(int id) {
        try {
            String sql = "SELECT bid, u.[uid], u.displayname, u.gender, u.dob, u.[address], blogTitle, [bfrom], [description],\n"
                    + "c.cid, u2.[uid] as uid2, u2.displayname as display2, u2.gender as gen2, u2.dob as dob2, u2.[address] as add2, c.cdes, c.cfrom\n"
                    + "FROM [Blog] b INNER JOIN [User] u ON b.userid = u.[uid]\n"
                    + "			LEFT JOIN Comment c ON b.bid = c.blgid\n"
                    + "			LEFT JOIN [User] u2 ON c.usid = u2.[uid]\n"
                    + "	WHERE bid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            Blog b = null;
            while (rs.next()) {
                if (b == null) {
                    b = new Blog();
                    b.setId(rs.getInt("bid"));
                    User u = new User();
                    u.setId(rs.getInt("uid"));
                    u.setDisplayName(rs.getString("displayname"));
                    u.setGender(rs.getBoolean("gender"));
                    u.setDob(rs.getDate("dob"));
                    u.setAddress(rs.getString("address"));
                    b.setUser(u);
                    b.setTitle(rs.getString("blogTitle"));
                    b.setFrom(rs.getDate("bfrom"));
                    b.setDescription(rs.getString("description"));
                }
                int cid = rs.getInt("cid");
                if (cid != 0) {
                    Comment c = new Comment();
                    c.setId(cid);
                    c.setBlog(b);
                    User u2 = new User();
                    u2.setId(rs.getInt("uid2"));
                    u2.setDisplayName(rs.getString("display2"));
                    u2.setGender(rs.getBoolean("gen2"));
                    u2.setDob(rs.getDate("dob2"));
                    u2.setAddress(rs.getString("add2"));
                    c.setUser(u2);
                    c.setDescription(rs.getString("cdes"));
                    c.setFrom(rs.getDate("cfrom"));
                    b.getComments().add(c);
                }
            }
            return b;
        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Blog> getBlogs() {
        ArrayList<Blog> blogs = new ArrayList<>();
        try {
            String sql = "SELECT [bid]\n"
                    + "      ,u.[uid], u.displayname, u.gender, u.dob, u.[address]\n"
                    + "      ,[blogTitle]\n"
                    + "      ,[bfrom]\n"
                    + "      ,[description]\n"
                    + "  FROM [Blog] b INNER JOIN [User] u ON b.userid = u.[uid]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("bid"));
                User u = new User();
                u.setId(rs.getInt("uid"));
                u.setDisplayName(rs.getString("displayname"));
                u.setGender(rs.getBoolean("gender"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                b.setTitle(rs.getString("blogTitle"));
                b.setFrom(rs.getDate("bfrom"));
                b.setDescription(rs.getString("description"));
                blogs.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }

    public void deleteBlog(int id) {
        try {
            String sql = "DELETE FROM [Blog]\n"
                    + "      WHERE [bid] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void insert(Blog blog) {
        try {
            String sql = "INSERT INTO [Blog]\n"
                    + "           ([userid]\n"
                    + "           ,[blogTitle]\n"
                    + "           ,[bfrom]\n"
                    + "           ,[description])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, blog.getUser().getId());
            stm.setString(2, blog.getTitle());
            stm.setDate(3, blog.getFrom());
            stm.setString(4, blog.getDescription());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void update(Blog blog) {
        try {
            String sql = "UPDATE [Blog]\n"
                    + "   SET [userid] = ?\n"
                    + "      ,[blogTitle] = ?\n"
                    + "      ,[bfrom] = ?\n"
                    + "      ,[description] = ?\n"
                    + " WHERE bid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, blog.getUser().getId());
            stm.setString(2, blog.getTitle());
            stm.setDate(3, blog.getFrom());
            stm.setString(4, blog.getDescription());
            stm.setInt(5, blog.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Blog> search(String title) {
        ArrayList<Blog> blogs = new ArrayList<>();
        try {
            String sql = "SELECT [bid]\n"
                    + "      ,u.[uid], u.displayname, u.gender, u.dob, u.[address]\n"
                    + "      ,[blogTitle]\n"
                    + "      ,[bfrom]\n"
                    + "      ,[description]\n"
                    + "  FROM [Blog] b INNER JOIN [User] u ON b.userid = u.[uid]\n"
                    + "  where (1=1)\n";

            if (title != null) {
                sql += "and [blogTitle] like '%' + ? + '%'";
            }

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, title);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("bid"));
                User u = new User();
                u.setId(rs.getInt("uid"));
                u.setDisplayName(rs.getString("displayname"));
                u.setGender(rs.getBoolean("gender"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                b.setTitle(rs.getString("blogTitle"));
                b.setFrom(rs.getDate("bfrom"));
                b.setDescription(rs.getString("description"));
                blogs.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }

    public ArrayList<Blog> getMyBLogs(int id) {
        ArrayList<Blog> blogs = new ArrayList<>();
        try {
            String sql = "SELECT [bid],u.[uid], u.displayname, u.gender, u.dob, u.[address],[blogTitle],[bfrom],[description]\n"
                    + "FROM [Blog] b INNER JOIN [User] u ON b.userid = u.[uid]\n"
                    + "where [uid] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("bid"));
                User u = new User();
                u.setId(rs.getInt("uid"));
                u.setDisplayName(rs.getString("displayname"));
                u.setGender(rs.getBoolean("gender"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                b.setTitle(rs.getString("blogTitle"));
                b.setFrom(rs.getDate("bfrom"));
                b.setDescription(rs.getString("description"));
                blogs.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }

    public ArrayList<Blog> paging(int size, int index) {
        ArrayList<Blog> blogs = new ArrayList<>();
        try {
            String sql = "SELECT RowNum, bid, [uid], displayname, gender, dob, [address], blogTitle, bfrom, [description] FROM\n"
                    + "  (SELECT  ROW_NUMBER() OVER (ORDER BY bid desc) as RowNum, b.bid, u.[uid], u.displayname, u.gender, u.dob, u.[address], b.blogTitle, b.bfrom, b.[description]\n"
                    + "FROM Blog b inner join [User] u on b.userid = u.[uid]) t\n"
                    + "WHERE RowNum >= (((? - 1) * ?)+ 1) AND RowNum <= (?*?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, index);
            stm.setInt(2, size);
            stm.setInt(3, index);
            stm.setInt(4, size);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("bid"));
                User u = new User();
                u.setId(rs.getInt("uid"));
                u.setDisplayName(rs.getString("displayname"));
                u.setGender(rs.getBoolean("gender"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                b.setTitle(rs.getString("blogTitle"));
                b.setFrom(rs.getDate("bfrom"));
                b.setDescription(rs.getString("description"));
                blogs.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }

    public int getRowCountSearch(String title) {
        try {
            String sql = "select count(*) as Total from Blog\n";
            if (title != null) {
                sql += "and blogTitle like '%' + ? +'%'";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setString(1, title);
                ResultSet rs = stm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("Total");
                }
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Blog> pagingMyBlog(int id, int size, int index) {
        ArrayList<Blog> blogs = new ArrayList<>();
        try {
            String sql = "SELECT RowNum, bid, [uid], displayname, gender, dob, [address], blogTitle, bfrom, [description] FROM\n"
                    + "  (SELECT  ROW_NUMBER() OVER (ORDER BY bid desc) as RowNum, b.bid, u.[uid], u.displayname, u.gender, u.dob, u.[address], b.blogTitle, b.bfrom, b.[description]\n"
                    + "  FROM Blog b inner join [User] u on b.userid = u.[uid] where u.[uid] = ?) t\n"
                    + "WHERE RowNum >= (((? - 1) * ?)+ 1) AND RowNum <= (?*?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setInt(2, index);
            stm.setInt(3, size);
            stm.setInt(4, index);
            stm.setInt(5, size);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("bid"));
                User u = new User();
                u.setId(rs.getInt("uid"));
                u.setDisplayName(rs.getString("displayname"));
                u.setGender(rs.getBoolean("gender"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                b.setTitle(rs.getString("blogTitle"));
                b.setFrom(rs.getDate("bfrom"));
                b.setDescription(rs.getString("description"));
                blogs.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }

    public int getRowCountMyBlog(int id) {
        try {
            String sql = "select count(*) as Total from Blog where userid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Blog> searchMyBlog(ArrayList<Blog> myBlogs, String title) {
        ArrayList<Blog> blogs = new ArrayList<>();
        for (Blog myBlog : myBlogs) {
            if (myBlog.getTitle().toLowerCase().contains(title.toLowerCase())) {
                blogs.add(myBlog);
            }
        }
        return blogs;
    }

    public int getRowCountSearchMyBlog(int id, String title) {
        try {
            String sql = "select count(*) as Total from Blog where userid = ?\n";
            if (title != null) {
                sql += "and blogTitle like '%' + ? +'%'";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setInt(1, id);
                stm.setString(2, title);
                ResultSet rs = stm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("Total");
                }
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
