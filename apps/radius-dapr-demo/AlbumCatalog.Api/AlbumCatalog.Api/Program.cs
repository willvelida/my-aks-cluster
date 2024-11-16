using AlbumCatalog.Api.Services;
using Azure.Data.Tables;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddDaprClient();
builder.Services.AddSingleton<TableServiceClient>(sp =>
{
    return new TableServiceClient("<TableConnectionString>");
});

builder.Services.AddSingleton<TableClient>(sp =>
{
    var tableServiceClient = sp.GetRequiredService<TableServiceClient>();
    return tableServiceClient.GetTableClient("<TableName>");
});

builder.Services.AddSingleton<IAlbumService, AlbumService>();
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthorization();

app.MapControllers();

app.Run();
