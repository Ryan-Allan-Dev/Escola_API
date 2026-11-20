using API_ESCOLA_NOVO.Models;

namespace API_ESCOLA_NOVO.Interfaces
{
    public interface ICursoRepository
    {
        /*
        public interface - É um contrato: só diz QUE o método existe,
                           sem implementar (sem corpo { }).

        List<Curso>      - devolve uma lista de Curso.
    */

        // R - Read: devolve todos os cursos.
        List<Curso> ListarTodos();

        // R - Read: busca um curso pelo Id (ou null se não achar).
        Curso? BuscarPorId(int id);

        // C - Create: cadastra um curso novo.
        void Cadastrar(Curso curso);

        //****************************************************

        //novo!!! 
        void Atualizar(int id, Curso curso); 

        void Deletar(int id);
    }


}
