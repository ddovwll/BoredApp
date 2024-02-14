using BoredApp.Models;

namespace BoredApp.Views;

public interface IFavoritePage
{
    void ShowFavoriteAsync(List<ActivityModel> models);
    Task CreateFAPageAsync(IFavoriteActivityPage FApage);
    void FavoritePage_OnAppearing(object? sender, EventArgs e);
}