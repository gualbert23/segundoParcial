
package com.emergentes.controlador;

import com.emergentes.dao.ParticipanteDAO;
import com.emergentes.dao.ParticipanteDAOimpl;
import com.emergentes.dao.SeminarioDAO;
import com.emergentes.dao.SeminarioDAOimpl;
import com.emergentes.modelo.Participante;
import com.emergentes.modelo.Seminario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Gualbert
 */
@WebServlet(name = "ParticipanteControlador", urlPatterns = {"/ParticipanteControlador"})
public class ParticipanteControlador extends HttpServlet {

    
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        try {

            ParticipanteDAO dao = new ParticipanteDAOimpl();
            SeminarioDAO daoSeminario = new SeminarioDAOimpl();
            
            int id;
            List<Seminario> lista_seminarios = null;
            
            Participante p = new Participante();

            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            switch (action) {
                case "add":
                    //lenar la lista de prodcutos
                    lista_seminarios=daoSeminario.getAll();
                    
                    request.setAttribute("lista_seminarios", lista_seminarios);
                    
                    
                    request.setAttribute("participante", p);
                    request.getRequestDispatcher("frmParticipante.jsp").forward(request, response);
                    break;

                case "edit":
                    //
                    lista_seminarios=daoSeminario.getAll();
                   
                    request.setAttribute("lista_seminarios", lista_seminarios);
                    
                    
                    id = Integer.parseInt(request.getParameter("id"));
                    p = dao.getById(id);
                    request.setAttribute("participante", p);
                    request.getRequestDispatcher("frmParticipante.jsp").forward(request, response);
                    break;

                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("ParticipanteControlador");
                    break;

                case "view":
                    //obtener la lista de registros(objetos)
                    List<Participante> lista = dao.getAll();
                    request.setAttribute("participantes", lista);
                    request.getRequestDispatcher("participantes.jsp").forward(request, response);
                    break;
            }

        } catch (Exception ex) {
            System.out.println("Error 1 " + ex.getMessage());
        }
        
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        int id_seminario=Integer.parseInt(request.getParameter("id_seminario"));
        String apellidos = request.getParameter("apellidos");
        String nombres = request.getParameter("nombres");
        int confirmado = Integer.parseInt(request.getParameter("confirmado"));
        
       
        Participante parti = new Participante();
        parti.setId(id);
        parti.setId_seminario(id_seminario);
        parti.setApellidos(apellidos);
        parti.setNombres(nombres);
        parti.setConfirmado(confirmado);
        ParticipanteDAO dao = new ParticipanteDAOimpl();
        
        if(id==0){
            try {
                //nuevo registro

                dao.insert(parti);
            } catch (Exception ex) {
                System.out.println("Error al Insertar."+ex.getMessage());            }
        }else{
            try {
                //edicion de registro
                dao.update(parti);
            } catch (Exception ex) {
                System.out.println("Error al EDITAR."+ex.getMessage());            }
        }
        response.sendRedirect("ParticipanteControlador");
        
        
    }

    

}
