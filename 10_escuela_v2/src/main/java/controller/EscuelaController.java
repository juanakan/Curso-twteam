package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.Alumno;
import service.AlumnosService;
import service.CursosService;

@Controller
public class EscuelaController {
	@Autowired
	AlumnosService serviceAlumnos;
	@Autowired
	CursosService serviceCursos;
	@PostMapping("altaAlumno") //gestiona la pulsaci�n del bot�n de alta
	public String altaAlumno(@ModelAttribute("alumno") Alumno alumno, @RequestParam("idCurso") int idCurso) {
		serviceAlumnos.altaAlumno(alumno, idCurso);
		return "inicio";
	}
	@GetMapping("buscarAlumnos") //gestiona la pulsaci�n del bot�n de b�squeda
	public String alumnosCurso(@RequestParam("idCurso") int idCurso, HttpServletRequest request) {
		request.setAttribute("alumnos",serviceAlumnos.alumnosCurso(idCurso));
		return "forward:/paginaBusqueda";
	}
	@GetMapping("paginaBusqueda") //pulsaci�n del enlace a p�gina de busqueda
	public String paginaBusqueda(HttpServletRequest request) {
		request.setAttribute("cursos", serviceCursos.listaCursos());
		return "seleccionAlumnos";
	}
	@GetMapping("paginaAlta") //pulsaci�n del enlace a p�gina de alta
	public String paginaAta(HttpServletRequest request) {
		request.setAttribute("cursos", serviceCursos.listaCursos());
		return "altaAlumnos";
	}
}
