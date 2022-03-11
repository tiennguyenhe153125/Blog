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
import model.Feature;
import model.Group;

/**
 *
 * @author ADMIN
 */
public class GroupDBContext extends DBContext {

    public Group getGroup(int id) {
        try {
            String sql = "select g.gid, g.gname, f.fid, f.url\n"
                    + "from [Group] g inner join [Group Feature] gf on g.gid = gf.gfid\n"
                    + "				right join [Feature] f on gf.fgid = f.fid\n"
                    + "				where g.gid = ?\n";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            Group g = null;
            while (rs.next()) {
                if (g == null) {
                    g = new Group();
                    g.setId(id);
                    g.setName(rs.getString("gname"));
                }
                int fid = rs.getInt("fid");
                if (fid != 0) {
                    Feature f = new Feature();
                    f.setId(fid);
                    f.setUrl(rs.getString("url"));
                    g.getFeatures().add(f);
                }
            }
            return g;
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
