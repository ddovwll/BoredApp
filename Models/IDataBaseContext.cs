namespace BoredApp.Models;

public interface IDataBaseContext
{
    Task<List<ActivityModel>> GetItemsAsync();
    Task<ActivityModel> GetItemAsync(int id);
    Task<int> SaveItemAsync(ActivityModel item);
    Task<int> DeleteItemAsync(ActivityModel item);
}