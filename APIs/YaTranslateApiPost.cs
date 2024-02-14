using System.Text;
using System.Text.Json.Nodes;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace BoredApp.Helpers;

public static class YaTranslateApiPost
{
    private static string targetLang = "ru";

    public static async Task<string> TranslateAsync(string originalText)
    {
        using HttpClient client = new HttpClient();
        
        string url = "https://translate.api.cloud.yandex.net/translate/v2/translate";
        
        client.DefaultRequestHeaders.Add("Accept", "application/json");
        client.DefaultRequestHeaders.Add("Authorization", $"Api-Key AQVN0lFgHt6B-fjjMFGiPpqdD5yJzsHxMFEzZ8h4");
        
        var body = new
        {
            targetLanguageCode = targetLang,
            texts = originalText,
        };

        string jsonBody = JsonConvert.SerializeObject(body);
        var content = new StringContent(jsonBody, Encoding.UTF8, "application/json");
        
        HttpResponseMessage response = await client.PostAsync(url, content);
        
        //ДОПИЛИТЬ ПРОВЕРКУ ОТВЕТА
        dynamic responseContent = await response.Content.ReadAsStringAsync();

        var translated = "";
        
        JObject json;
        json = JObject.Parse(responseContent);
        foreach (var val in json["translations"])
        {
            translated += val["text"];
        }

        return translated;
    }
}