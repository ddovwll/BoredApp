using Android;
using Android.App;
using Android.Content.PM;
using Android.OS;

namespace BoredApp;

[Activity(Theme = "@style/Maui.SplashTheme", MainLauncher = true,
    ConfigurationChanges = ConfigChanges.ScreenSize | ConfigChanges.Orientation | ConfigChanges.UiMode |
                           ConfigChanges.ScreenLayout | ConfigChanges.SmallestScreenSize | ConfigChanges.Density)]
public class MainActivity : MauiAppCompatActivity
{
    private const int RequestPermissionCode = 1;

    protected override void OnCreate(Bundle savedInstanceState)
    {
        base.OnCreate(savedInstanceState);

        if (CheckSelfPermission(Manifest.Permission.ReadExternalStorage) != Permission.Granted)
        {
            RequestPermissions(new[] { Manifest.Permission.ReadExternalStorage }, RequestPermissionCode);
            RequestPermissions(new[] { Manifest.Permission.WriteExternalStorage }, RequestPermissionCode);
        }
    }

    public override void OnRequestPermissionsResult(int requestCode, string[] permissions, Permission[] grantResults)
    {
        base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == RequestPermissionCode)
        {
            if (grantResults.Length > 0 && grantResults[0] == Permission.Granted)
            {
                // Разрешение было предоставлено, можно выполнять операции с файлами
            }
            else
            {
                // Разрешение не было предоставлено, выполнение операций с файлами не допускается
            }
        }
    }
}