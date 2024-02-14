using BoredApp.Models;
using BoredApp.Views;

namespace BoredApp;

public interface IMainPage
{
    void ShowActivity(string activity);
    void ShowType(string type);
    void ShowParticipants(double participants);
    void ShowPrice(double price);
    void ShowLink(string? link);
    void ShowAccessibility(double accessibility);
    Task ShowFavoritePageAsync(IFavoritePage favoritePage);
    void GenerateButton_OnClicked(object? sender, EventArgs e);
    void ImageButton_OnClicked(object? sender, EventArgs e);
    void FavoritesButton_OnClicked(object? sender, EventArgs e);
}