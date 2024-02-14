using BoredApp.Models;
using BoredApp.Presenters;
using BoredApp.Views;

namespace BoredApp;

public partial class MainPage : ContentPage, IMainPage
{
    private readonly IMainPagePresenter presenter;
    
    public MainPage()
    {
        InitializeComponent();
        presenter = new MainPagePresenter(this);
    }

    public async void GenerateButton_OnClicked(object? sender, EventArgs e)
    {
        await presenter.SendActivity();
    }

    public void ShowActivity(string activity)
    {
        Activity.Text = activity;
    }

    public void ShowType(string type)
    {
        Type.Text = type;
    }

    public void ShowParticipants(double participants)
    {
        Participants.Value = participants;
    }

    public void ShowPrice(double price)
    {
        Price.Value = price;
    }

    public void ShowLink(string? link)
    {
        Link.Text = link;
    }

    public void ShowAccessibility(double accessibility)
    {
        Accessibility.Value = accessibility;
    }

    public async void ImageButton_OnClicked(object? sender, EventArgs e)
    {
        await presenter.LikeAsync();
    }

    public void FavoritesButton_OnClicked(object? sender, EventArgs e)
    {
        presenter.CreateFavoritePage();
    }

    public async Task ShowFavoritePageAsync(IFavoritePage favoritePage)
    {
        await Navigation.PushModalAsync((FavoritePage)favoritePage);
    }
}