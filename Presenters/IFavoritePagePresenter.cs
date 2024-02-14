using BoredApp.Models;

namespace BoredApp.Presenters;

public interface IFavoritePagePresenter
{
    Task GetModelsAsync();
    Task CreateFAPageAsync(object model);
}