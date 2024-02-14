using System.ComponentModel.DataAnnotations;
using BoredApp.Helpers;
using Newtonsoft.Json;
using SQLite;

namespace BoredApp.Models;

public class ActivityModel : IActivityModel
{
    public string Activity { get; set; } = null!;
    public string Type { get; set; } = null!;
    public int Participants { get; set; }
    public double Price { get; set; }
    public string? Link { get; set; }
    [PrimaryKey]
    public int Key { get; set; }
    public double Accessibility { get; set; }
    public int Completed { get; set; } = 0;
    
    public async Task LikeActivityAsync()
    {
        IDataBaseContext dataBase = DataBaseContext.GetInstance();
        await dataBase.SaveItemAsync(this);
    }

    public async Task DeleteActivityAsync()
    {
        IDataBaseContext dataBase = DataBaseContext.GetInstance();
        await dataBase.DeleteItemAsync(this);
    }

    public async Task CompleteActivityAsync()
    {
        IDataBaseContext dataBase = DataBaseContext.GetInstance();
        Completed += 1;
        await dataBase.SaveItemAsync(this);
    }
}