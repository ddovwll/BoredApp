using BoredApp.Models;
using BoredApp.Views;

namespace BoredApp.Presenters;

public class MainPagePresenter : IMainPagePresenter
{
    private readonly IMainPage mainPage;
    private IActivityModel? activityModel;

    public MainPagePresenter(IMainPage mainPage)
    {
        this.mainPage = mainPage;
    }

    public async Task SendActivity()
    {
        activityModel = await IActivityModel.GetActivityAsync();
        mainPage.ShowActivity(activityModel.Activity);
        mainPage.ShowAccessibility(activityModel.Accessibility);
        mainPage.ShowType(activityModel.Type);
        mainPage.ShowLink(activityModel.Link);
        mainPage.ShowParticipants(activityModel.Participants);
        mainPage.ShowPrice(activityModel.Price);
    }

    public async Task LikeAsync()
    {
        if (activityModel != null)
            await activityModel.LikeActivityAsync();
    }

    public async Task CreateFavoritePage()
    {
        var favoritePage = new FavoritePage();
        await mainPage.ShowFavoritePageAsync(favoritePage);
    }
}