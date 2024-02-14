namespace BoredApp.Helpers;

public static class BoredApiGet
{
    private static HttpClient client;

    public static async Task Init()
    {
        client = new HttpClient();
        await client.GetAsync(
            $"https://www.boredapi.com/api/activity/");
    }
    
    public static async Task<HttpResponseMessage> GetResponseMessageAsync()
    {
            return await client.GetAsync(
                $"https://www.boredapi.com/api/activity/");
    }
    
    public static async Task<HttpResponseMessage> GetResponseMessageAsync<T>(string parameter, T value)
    {
            return await client.GetAsync(
                $"https://www.boredapi.com/api/activity/" +
                $"?{parameter}={value}");
    }
}