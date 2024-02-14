using SQLite;
using FileSystem = Microsoft.Maui.Storage.FileSystem;

namespace BoredApp.Models;

public class DataBaseContext : IDataBaseContext
{
    private static DataBaseContext instance;
    
    public static DataBaseContext GetInstance()
    {
        if (instance == null)
        {
            instance = new DataBaseContext();
        }
        return instance;
    }
    
    private const string DatabaseFilename = Constants.Constants.DataBaseName;

    private const SQLite.SQLiteOpenFlags Flags =
        // open the database in read/write mode
        SQLite.SQLiteOpenFlags.ReadWrite |
        // create the database if it doesn't exist
        SQLite.SQLiteOpenFlags.Create |
        // enable multi-threaded database access
        SQLite.SQLiteOpenFlags.SharedCache;

    private static string DatabasePath =>
        Path.Combine(FileSystem.AppDataDirectory, DatabaseFilename);
    
    
    private SQLiteAsyncConnection Database;

    private async Task Init()
    {
        if (Database is not null)
            return;
        Database = new SQLiteAsyncConnection(DatabasePath, Flags);
        var result = await Database.CreateTableAsync<ActivityModel>();
    }
    
    public async Task<List<ActivityModel>> GetItemsAsync()
    {
        await Init();
        return await Database.Table<ActivityModel>().ToListAsync();
    }

    public async Task<ActivityModel> GetItemAsync(int id)
    {
        await Init();
        return await Database.Table<ActivityModel>().Where(i => i.Key == id).FirstOrDefaultAsync();
    }

    public async Task<int> SaveItemAsync(ActivityModel item)
    {
        await Init();
        if (await GetItemAsync(item.Key)!=null)
            return await Database.UpdateAsync(item);
        else
            return await Database.InsertAsync(item);
    }

    public async Task<int> DeleteItemAsync(ActivityModel item)
    {
        await Init();
        return await Database.DeleteAsync(item);
    }
}