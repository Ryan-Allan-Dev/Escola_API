using API_ESCOLA_NOVO.Contexts;
using API_ESCOLA_NOVO.Interfaces;
using API_ESCOLA_NOVO.Models;

namespace API_ESCOLA_NOVO.Repositories
{
    public class CursoRepository : ICursoRepository
    {
        /*
           Injetar o Context: uma cozinha precisa do fogão (EscolaContext)
           para fazer os pratos. Em vez de criar o Context sozinha,
           ela pede no construtor e a API entrega pronto.
           Isso se chama Injeção de Dependência.

           _context - convenção do C# para campo privado da classe.
       */
        private readonly EscolaContext _context;

        // Injeção de dependência: a API entrega o EscolaContext pronto.
        public CursoRepository(EscolaContext context)
        {
            _context = context;
        }

        // INSERT INTO Curso
        public void Cadastrar(Curso curso)
        {
            _context.Curso.Add(curso);   // coloca na fila (marca para inserir)
            _context.SaveChanges();      // grava no banco
        }

        // SELECT * FROM Curso
        public List<Curso> ListarTodos()
        {
            return _context.Curso.ToList();   // ToList() -> busca todos os registros
        }

        // SELECT * FROM Curso WHERE IdCurso = @id
        public Curso? BuscarPorId(int id)
        {
            return _context.Curso.Find(id);   // Find() -> busca pela chave primária (ou null)
        }

        //****************************************************

        //novo!!! 
        public void Atualizar(int id, Curso curso)
        {
            //buscar no banco de dados
            Curso? curso_encontrado = _context.Curso.Find(id);

            //curso_encontrado representa da linha do BD.

            if (curso_encontrado != null)
            {
                //prepara pra atualizar a linha do BD
                curso_encontrado.Nome = curso.Nome;
                curso_encontrado.CargaHoraria = curso.CargaHoraria;

                //realiza o UPDATE no BD
                _context.SaveChanges();
            }  
        }


        //DELETE FROM CURSO WHERE ID_CURSO = @id
        public void Deletar(int id)
        {
            Curso? curso_encontrado = _context.Curso.Find(id);

            if (curso_encontrado != null)
            {
                _context.Curso.Remove(curso_encontrado); //prepara
                _context.SaveChanges(); //deleta

            }


        }
    }
}
