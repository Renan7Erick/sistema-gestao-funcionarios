package br.com.sistemaGestaoFuncionarios.filter;

import br.com.sistemaGestaoFuncionarios.model.Funcionario;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebFilter("/*")
public class AuthenticationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) { }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        String path = req.getServletPath();

        if (isPublic(path)) {
            chain.doFilter(servletRequest, servletResponse);
            return;
        }

        Funcionario funcionario = getFuncionarioLogado(req);

        if (funcionario == null) {
            resp.sendRedirect("/pages/login/index.html");
            return;
        }

        boolean areaFuncionario = path.startsWith("/pages/areaFuncionarios/")
                || path.startsWith("/funcionario/");
        boolean isAdmin = "ADMIN".equals(funcionario.getPerfil());

        if (!areaFuncionario && !isAdmin) {
            resp.sendRedirect("/pages/areaFuncionarios/meuPerfil/meuPerfil.jsp");
            return;
        }

        chain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() { }

    private Funcionario getFuncionarioLogado(HttpServletRequest req) {
        HttpSession session = req.getSession(false);
        if (session == null) return null;
        return (Funcionario) session.getAttribute("funcionarioLogado");
    }

    private boolean isPublic(String path) {
        return path.equals("/")
                || path.equals("/index.html")
                || path.equals("/login")
                || path.equals("/logout")
                || path.startsWith("/pages/login/")
                || path.endsWith(".css") || path.endsWith(".js")
                || path.endsWith(".png") || path.endsWith(".jpg") || path.endsWith(".svg");
    }

}
