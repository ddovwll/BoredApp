using BoredApp.Models;

namespace BoredApp.Presenters;

public interface IFavoriteActivityPresenter
{
    Task DeleteActivityAsync();
    Task<int> CompleteActivityAsync();
    IActivityModel ShowActivity();
}