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
import model.Account;

/**
 *
 * @author ADMIN
 */
public class AccUserDBContext extends DBContext {

    public void insert(Account a) {
        try {
            connection.setAutoCommit(false);
            String sql_u = "INSERT INTO [User]\n"
                    + "           ([displayname]\n"
                    + "           ,[gender]\n"
                    + "           ,[dob]\n"
                    + "           ,[address])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm_u = connection.prepareStatement(sql_u);
            stm_u.setString(1, a.getUser().getDisplayName());
            stm_u.setBoolean(2, a.getUser().isGender());
            stm_u.setDate(3, a.getUser().getDob());
            stm_u.setString(4, a.getUser().getAddress());
            stm_u.executeUpdate();
            //find uid
            int id = -1;
            String sql_search = "SELECT @@IDENTITY as uid";
            PreparedStatement stm_search = connection.prepareStatement(sql_search);
            ResultSet rs_search = stm_search.executeQuery();
            if (rs_search.next()) {
                id = rs_search.getInt("uid");
            }
            //insert to account
            String sql_a = "INSERT INTO [Account]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[aid])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm_a = connection.prepareStatement(sql_a);
            stm_a.setString(1, a.getUsername());
            stm_a.setString(2, a.getPassword());
            stm_a.setInt(3, id);
            stm_a.executeUpdate();

            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(AccUserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(AccUserDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AccUserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void insertGA(Account a) {
        try {
            String sql = "INSERT INTO [Group Account]\n"
                    + "           ([gaid]\n"
                    + "           ,[gausername])\n"
                    + "     VALUES\n"
                    + "           (2\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, a.getUsername());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccUserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
