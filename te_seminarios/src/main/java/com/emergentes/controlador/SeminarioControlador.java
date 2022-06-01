
package com.emergentes.controlador;

import com.emergentes.dao.SeminarioDAO;
import com.emergentes.dao.SeminarioDAOimpl;
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
@WebServlet(name = "SeminarioControlador", urlPatterns = {"/SeminarioControlador"})
public class SeminarioControlador extends HttpServlet {

    
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         try {
            Seminario semi = new Seminario();
            int id;
            SeminarioDAO dao = new SeminarioDAOimpl();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            switch (action) {
                case "add":
                    request.setAttribute("seminario", semi);
                    request.getRequestDispatcher("frmSeminario.jsp").forward(request, response);
                break;
                
                case "edit":
                    id=Integer.parseInt(request.getParameter("id"));
                    semi = dao.getById(id);
                    request.setAttribute("seminario", semi);
                    request.getRequestDispatcher("frmSeminario.jsp").forward(request, response);
                break;
                
                case "delete":
                    id=Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("SeminarioControlador");
                break;
                
                case "view":
                    //obtener la lista de registros(objetos)
                    List <Seminario> lista = dao.getAll();
                    request.setAttribute("seminarios", lista);
                    request.getRequestDispatcher("seminarios.jsp").forward(request, response);
                break;
            }

        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
        
        
        
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String titulo=request.getParameter("titulo");
        String fecha=request.getParameter("fecha");
        int cupo=Integer.parseInt(request.getParameter("cupo"));
        
        Seminario semi = new Seminario();
        semi.setId(id);
        semi.setTitulo(titulo);
        semi.setFecha(fecha);
        semi.setCupo(cupo);
        System.out.println("HOLA");
        SeminarioDAO dao = new SeminarioDAOimpl();
        if(id==0){
            try {
                //nuevo registro

                dao.insert(semi);
            } catch (Exception ex) {
                System.out.println("Error al Insertar."+ex.getMessage());            }
        }else{
            try {
                //edicion de registro
                dao.update(semi);
            } catch (Exception ex) {
                System.out.println("Error al EDITAR."+ex.getMessage());            }
        }
        response.sendRedirect("SeminarioControlador");
        
        
        
    }

   

}
