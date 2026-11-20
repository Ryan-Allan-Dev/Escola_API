using API_ESCOLA_NOVO.Interfaces;
using API_ESCOLA_NOVO.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;

namespace API_ESCOLA_NOVO.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CursoController : ControllerBase
    {
        // O garçom guarda o cardápio (o acesso à cozinha).
        private readonly ICursoRepository _cursoRepository;

        // Injeção de dependência: a API entrega o CursoRepository
        // (por causa do AddScoped do passo 11).
        public CursoController(ICursoRepository cursoRepository)
        {
            _cursoRepository = cursoRepository;
        }

        // GET api/curso
        [HttpGet]
        public IActionResult ListarTodos()
        {
            return Ok(_cursoRepository.ListarTodos());   // 200 + lista em JSON
        }

        [HttpPost]
        public IActionResult Cadastrar(Curso curso)
        {
            _cursoRepository.Cadastrar(curso);
            return Created(); //201
        }


        //****************************************************

        //novo!!! 


        //Atualizar.
        // api/curso/30

        [HttpPut("{id}")]
        public IActionResult Atualizar(int id, Curso curso)
        {
            //consulta se o ID existe no BD antes de atualizar.
            if(_cursoRepository.BuscarPorId(id) == null)
            {
                return NotFound(); //404
            }

            _cursoRepository.Atualizar(id, curso);


            return NoContent(); //204

        }

        [HttpDelete("{id}")]
        public IActionResult Deletar(int id)
        {
            //consulta se o ID existe no BD antes de atualizar.
            if (_cursoRepository.BuscarPorId(id) == null)
            {
                return NotFound(); //404
            }

            _cursoRepository.Deletar(id);
            return NoContent(); //204

        }


        //GET 
        //api/curso/19

        [HttpGet("{id}")]
        public IActionResult BuscarPorID(int id)
        {
            Curso? curso = _cursoRepository.BuscarPorId(id);

            if(curso == null)
                return NotFound();

            return Ok(curso);
        }




    }
}
