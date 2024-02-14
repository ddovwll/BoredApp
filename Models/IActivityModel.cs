using System.ComponentModel.DataAnnotations;
using BoredApp.Helpers;
using Newtonsoft.Json;
using SQLite;

namespace BoredApp.Models;

public interface IActivityModel
{
    public string Activity { get; set; }
    public string Type { get; set; }
    public int Participants { get; set; }
    public double Price { get; set; }
    public string? Link { get; set; }
    [PrimaryKey]
    public int Key { get; set; }
    public double Accessibility { get; set; }
    public int Completed { get; set; }
    Task LikeActivityAsync();
    public static async Task<List<ActivityModel>> GetModelsAsync()
    {
        IDataBaseContext dataBase = DataBaseContext.GetInstance();
        return await dataBase.GetItemsAsync();
    }

    public static async Task<ActivityModel> GetActivityAsync<T>(string parameter, T value)
    {
        var response = await BoredApiGet.GetResponseMessageAsync(parameter, value);
        if (!response.IsSuccessStatusCode)
            return new ActivityModel();
        var data = await response.Content.ReadAsStringAsync();
        return JsonConvert.DeserializeObject<ActivityModel>(data)!;
    }

    public static async Task<ActivityModel> GetActivityAsync()
    {
        var response = await BoredApiGet.GetResponseMessageAsync();
        if (!response.IsSuccessStatusCode)
            return new ActivityModel();
        var data = await response.Content.ReadAsStringAsync();
        var model =  JsonConvert.DeserializeObject<ActivityModel>(data)!;
        model.Activity = await YaTranslateApiPost.TranslateAsync(model.Activity);
        model.Type = await YaTranslateApiPost.TranslateAsync(model.Type);
        return model;
    }

    Task DeleteActivityAsync();
    Task CompleteActivityAsync();
}