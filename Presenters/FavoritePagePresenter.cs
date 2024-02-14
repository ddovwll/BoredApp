using BoredApp.Models;
using BoredApp.Views;

namespace BoredApp.Presenters;

public class FavoritePagePresenter : IFavoritePagePresenter
{
    private readonly IFavoritePage favoritePage;

    public FavoritePagePresenter(IFavoritePage favoritePage)
    {
        this.favoritePage = favoritePage;
    }
    
    public async Task GetModelsAsync()
    { 
        favoritePage.ShowFavoriteAsync(await IActivityModel.GetModelsAsync());
    }

    public async Task CreateFAPageAsync(object model)
    {
        var favoriteActivityPage = new FavoriteActivityPagePage((IActivityModel)model);
        await favoritePage.CreateFAPageAsync(favoriteActivityPage);
    }
}