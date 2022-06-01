
package com.emergentes.dao;

import com.emergentes.modelo.Participante;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gualbert
 */
public class ParticipanteDAOimpl extends ConexionDB implements ParticipanteDAO{

    @Override
    public void insert(Participante participante) throws Exception {
        try {
            String sql = "insert into participantes(apellidos,nombres,id_seminario,confirmado) values (?,?,?,?)";
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, participante.getApellidos());
            ps.setString(2, participante.getNombres());
            ps.setInt(3, participante.getId_seminario());
            ps.setInt(4, participante.getConfirmado());
            
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void update(Participante participante) throws Exception {
        try {
            String sql = "update participantes set apellidos=?,nombres=?,id_seminario=?,confirmado=? where id=?";
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, participante.getApellidos());
            ps.setString(2, participante.getNombres());
            ps.setInt(3, participante.getId_seminario());
            ps.setInt(4, participante.getConfirmado());
            ps.setInt(5, participante.getId());

            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        try {
            String sql = "delete from participantes where id =?";
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Participante getById(int id) throws Exception {
        Participante parti = new Participante();
        try {
            String sql = "select * from participantes where id =?";
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                parti.setId(rs.getInt("id"));
                parti.setApellidos(rs.getString("apellidos"));
                parti.setNombres(rs.getString("nombres"));
                parti.setId_seminario(rs.getInt("id_seminario"));
                parti.setConfirmado(rs.getInt("confirmado"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return parti;
    }

    @Override
    public List<Participante> getAll() throws Exception {
        List<Participante> lista = null;
        try {
            String sql = "SELECT p.*,  s.titulo as Seminario  FROM participantes p ";
            sql +="LEFT JOIN seminarios s ON p.id_seminario = s.id ";
            
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            lista = new ArrayList<Participante>();
            while (rs.next()) {
                Participante parti = new Participante();
                parti.setId(rs.getInt("id"));
                parti.setApellidos(rs.getString("apellidos"));
                parti.setNombres(rs.getString("nombres"));
                parti.setId_seminario(rs.getInt("id_seminario"));
                parti.setConfirmado(rs.getInt("confirmado"));
                parti.setSeminario(rs.getString("seminario"));

                lista.add(parti);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;
        
    }
    
}
