using BoredApp.Views;

namespace BoredApp.Presenters;

public interface IMainPagePresenter
{
    Task SendActivity();
    Task LikeAsync();
    Task CreateFavoritePage();
}