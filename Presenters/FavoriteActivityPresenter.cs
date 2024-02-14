using BoredApp.Models;
using BoredApp.Views;

namespace BoredApp.Presenters;

public class FavoriteActivityPresenter : IFavoriteActivityPresenter
{
    private readonly IFavoriteActivityPage view;
    private readonly IActivityModel model;

    public FavoriteActivityPresenter(IFavoriteActivityPage view, IActivityModel model)
    {
        this.model = model;
        this.view = view;
    }

    public async Task DeleteActivityAsync()
    {
        await model.DeleteActivityAsync();
        await view.PopPageAsync();
    }

    public async Task<int> CompleteActivityAsync()
    {
        await model.CompleteActivityAsync();
        return model.Completed;
    }

    public IActivityModel ShowActivity()
    {
        return model;
    }
}