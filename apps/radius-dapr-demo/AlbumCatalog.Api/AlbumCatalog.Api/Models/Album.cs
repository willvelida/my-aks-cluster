using System.Text.Json.Serialization;

namespace AlbumCatalog.Api.Models
{
    public class Album
    {
        [JsonPropertyName("id")]
        public string Id { get; set; }
        [JsonPropertyName("title")]
        public string Title { get; set; }
        [JsonPropertyName("artist")]
        public string Artist { get; set; }
        [JsonPropertyName("releaseDate")]
        public DateTime ReleaseDate { get; set; }
        [JsonPropertyName("genre")]
        public string Genre { get; set; }
    }
}
