using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve
{
    /// <summary>
    /// Base API response object
    /// This file will be regenerated based on the API's sample response
    /// </summary>
    public class ResponseObj
    {
        /// <summary>
        /// Status of the API response (e.g., "success", "error")
        /// </summary>
        [JsonProperty("status")]
        public string Status { get; set; }

        /// <summary>
        /// Error message if the request failed
        /// </summary>
        [JsonProperty("error")]
        public string Error { get; set; }

        /// <summary>
        /// The response data
        /// </summary>
        [JsonProperty("data")]
        public object Data { get; set; }
    }
}
