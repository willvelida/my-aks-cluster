using AlbumCatalog.Api.Models;
using Dapr.Client;

namespace AlbumCatalog.Api.Services
{
    public class AlbumService : IAlbumService
    {
        private static string STORE_NAME = "album-state-store";
        private readonly DaprClient _daprClient;
        private readonly IConfiguration _config;
        private readonly ILogger<AlbumService> _logger;

        public AlbumService(DaprClient daprClient, IConfiguration config, ILogger<AlbumService> logger)
        {
            _daprClient = daprClient;
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

        public async Task<List<Album>> GetAlbumsAsync()
        {
            var query = "{\"filter\": {}}";
            var queryResponse = await _daprClient.QueryStateAsync<Album>(STORE_NAME, query);
            var albumList = queryResponse.Results
                .Where(x => x.Data != null)
                .Select(x => x.Data!)
                .OrderByDescending(x => x.ReleaseDate);

            return albumList.ToList();
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
    }
}
