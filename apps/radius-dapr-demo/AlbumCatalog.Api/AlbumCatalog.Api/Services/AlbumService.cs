using AlbumCatalog.Api.Models;
using Azure.Data.Tables;
using Dapr.Client;
using System.Text.Json;

namespace AlbumCatalog.Api.Services
{
    public class AlbumService : IAlbumService
    {
        private static string STORE_NAME = "albums";
        private readonly DaprClient _daprClient;
        private readonly TableClient _tableClient;
        private readonly IConfiguration _config;
        private readonly ILogger<AlbumService> _logger;

        public AlbumService(DaprClient daprClient, TableClient tableClient, IConfiguration config, ILogger<AlbumService> logger)
        {
            _daprClient = daprClient;
            _tableClient = tableClient;
            _config = config;
            _logger = logger;
        }

        public async Task<string> CreateAlbumAsync(AlbumDto albumDto)
        {
            var album = new Album()
            {
                Id = Guid.NewGuid().ToString(),
                Title = albumDto.Title,
                Artist = albumDto.Artist,
                ReleaseDate = albumDto.ReleaseDate,
                Genre = albumDto.Genre
            };

            _logger.LogInformation("Saving new Album with ID: {Id}", album.Id);
            await _daprClient.SaveStateAsync<Album>(STORE_NAME, album.Id, album);
            return album.Id;
        }

        public async Task<bool> DeleteAlbumAsync(string id)
        {
            _logger.LogInformation($"Deleting Album with ID: {id}");
            await _daprClient.DeleteStateAsync(STORE_NAME, id);
            return true;
        }

        public async Task<Album> GetAlbumAsync(string id)
        {
            _logger.LogInformation($"Retrieving Album with ID: {id}");
            var album = await _daprClient.GetStateAsync<Album>(STORE_NAME, id.ToString());
            return album;
        }

        public async Task<AlbumDto> UpdateAlbumAsync(string id, AlbumDto album)
        {
            var existingAlbum = await _daprClient.GetStateAsync<Album>(STORE_NAME, id.ToString());
            existingAlbum.Title = album.Title;
            existingAlbum.Artist = album.Artist;
            existingAlbum.ReleaseDate = album.ReleaseDate;
            existingAlbum.Genre = album.Genre;
            await _daprClient.SaveStateAsync<Album>(STORE_NAME, id.ToString(), existingAlbum);
            return album;
        }

        public async Task<List<Album>> GetAlbumsAsync()
        {
            var albumEntities = new List<AlbumEntity>();
            var albums = new List<Album>();

            await foreach (var entity in _tableClient.QueryAsync<AlbumEntity>())
            {
                albumEntities.Add(entity);
            }

            foreach (var album in albumEntities)
            {
                var entry = JsonSerializer.Deserialize<Album>(album.Value);
                albums.Add(entry);
            }

            return albums;
        }
    }
}
