using API_ESCOLA_NOVO.Contexts;
using API_ESCOLA_NOVO.Interfaces;
using API_ESCOLA_NOVO.Repositories;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();

builder.Services.AddDbContext<EscolaContext>(options =>
    // Diz que o banco é SQL Server e busca a connection string chamada "Escola"
    // dentro da seção ConnectionStrings do appsettings.json.
    options.UseSqlServer(builder.Configuration.GetConnectionString("Escola")));

builder.Services.AddControllers(o =>
    o.SuppressImplicitRequiredAttributeForNonNullableReferenceTypes = true);


builder.Services.AddScoped<ICursoRepository, CursoRepository>();


var app = builder.Build();

// Configure the HTTP request pipeline.

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
