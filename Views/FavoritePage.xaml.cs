using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BoredApp.Models;
using BoredApp.Presenters;

namespace BoredApp.Views;

public partial class FavoritePage : ContentPage, IFavoritePage
{
    private readonly IFavoritePagePresenter presenter;
    public FavoritePage()
    {
        InitializeComponent();
        presenter = new FavoritePagePresenter(this);
    }

    public async void FavoritePage_OnAppearing(object? sender, EventArgs e)
    {
        await presenter.GetModelsAsync();
    }
    
    public void ShowFavoriteAsync(List<ActivityModel> models)
    {
        ListView listView = new ListView { ItemsSource = models };
        listView.ItemTemplate = new DataTemplate(()=>
            {
                var viewCell = new ViewCell();
                var label = new Label();
                label.SetBinding(Label.TextProperty, "Activity");
                var tapGestureRecognizer = new TapGestureRecognizer();
                tapGestureRecognizer.Tapped += async (s, e) =>
                {
                    await presenter.CreateFAPageAsync(label.BindingContext);
                };
                label.GestureRecognizers.Add(tapGestureRecognizer);
                viewCell.View = label;
                return viewCell;
            }
        );
        Content = listView;
    }

    public async Task CreateFAPageAsync(IFavoriteActivityPage FApage)
    {
        await Navigation.PushModalAsync((FavoriteActivityPagePage)FApage);
    }
    
    
}