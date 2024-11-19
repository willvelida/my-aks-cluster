using Azure;
using Azure.Data.Tables;

namespace AlbumCatalog.Api.Models
{
    public class AlbumEntity : ITableEntity
    {
        public string PartitionKey { get; set; }
        public string RowKey { get; set; }
        public DateTimeOffset? Timestamp { get; set; }
        public ETag ETag { get; set; }
        public string Value { get; set; }
    }
}
