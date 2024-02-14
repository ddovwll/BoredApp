namespace BoredApp.Views;

public interface IFavoriteActivityPage
{
    void DeleteButton_OnClicked(object? sender, EventArgs e);
    void CompleteButton_OnClicked(object? sender, EventArgs e);
    void FavoriteActivity_OnAppearing(object? sender, EventArgs e);
    Task PopPageAsync();
}