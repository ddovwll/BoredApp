using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BoredApp.Models;
using BoredApp.Presenters;

namespace BoredApp.Views;

public partial class FavoriteActivityPagePage : ContentPage, IFavoriteActivityPage
{
    private readonly IFavoriteActivityPresenter presenter;
    
    public FavoriteActivityPagePage(IActivityModel model)
    {
        InitializeComponent();
        presenter = new FavoriteActivityPresenter(this, model);
    }

    public async void DeleteButton_OnClicked(object? sender, EventArgs e)
    {
        await presenter.DeleteActivityAsync();
    }

    public async void CompleteButton_OnClicked(object? sender, EventArgs e)
    {
        var completed = await presenter.CompleteActivityAsync();
        Completed.Text = completed.ToString();
    }

    public void FavoriteActivity_OnAppearing(object? sender, EventArgs e)
    {
        var model = presenter.ShowActivity();
        Activity.Text = model.Activity;
        Type.Text = model.Type;
        Participants.Value = model.Participants;
        Price.Value = model.Price;
        Link.Text = model.Link;
        Accessibility.Value = model.Accessibility;
        Completed.Text = model.Completed.ToString();
    }

    public async Task PopPageAsync()
    {
        await Navigation.PopModalAsync();
    }
}