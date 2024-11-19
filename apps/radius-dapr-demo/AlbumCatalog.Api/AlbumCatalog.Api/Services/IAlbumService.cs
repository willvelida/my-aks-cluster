using AlbumCatalog.Api.Models;

namespace AlbumCatalog.Api.Services
{
    public interface IAlbumService
    {
        Task<List<Album>> GetAlbumsAsync();
        Task<Album> GetAlbumAsync(string id);
        Task<string> CreateAlbumAsync(AlbumDto albumDto);
        Task<AlbumDto> UpdateAlbumAsync(string id, AlbumDto albumDto);
        Task<bool> DeleteAlbumAsync(string id);
    }
}
