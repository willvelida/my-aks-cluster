using AlbumCatalog.Api.Models;
using AlbumCatalog.Api.Services;
using Microsoft.AspNetCore.Mvc;

namespace AlbumCatalog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AlbumController : ControllerBase
    {

        private readonly ILogger<AlbumController> _logger;
        private readonly IAlbumService _albumService;

        public AlbumController(ILogger<AlbumController> logger, IAlbumService albumService)
        {
            _logger = logger;
            _albumService = albumService;
        }

        [HttpGet]
        public async Task<ActionResult<List<Album>>> GetAlbums()
        {
            var albums = await _albumService.GetAlbumsAsync();
            return Ok(albums);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Album>> GetAlbum(string id)
        {
            var album = await _albumService.GetAlbumAsync(id);
            if (album == null)
            {
                return NotFound();
            }
            return Ok(album);
        }

        [HttpPost]
        public async Task<ActionResult> CreateAlbum(AlbumDto albumDto)
        {
            try
            {
                var albumId = await _albumService.CreateAlbumAsync(albumDto);
                return Created();
            }
            catch (Exception ex)
            {
                _logger.LogError($"Exception thrown while creating album: {ex.Message}");
                throw;
            }         
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<AlbumDto>> UpdateAlbum(string id, AlbumDto albumDto)
        {
            var album = await _albumService.GetAlbumAsync(id);
            if (album == null)
            {
                return NotFound();
            }

            var updatedAlbum = await _albumService.UpdateAlbumAsync(id, albumDto);
            return Ok(updatedAlbum);
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteAlbum(string id)
        {
            var deleted = await _albumService.DeleteAlbumAsync(id);

            if (deleted)
            {
                return NoContent();
            }

            return NotFound();
        }
    }
}
