## About The Project

This is a self learn/training project to experiment with Flutter, dart packages and features that I will need in an upcoming project.  Project is/was worked on at a hackathon pace, so not everything is arranged the way it should be in a formal project.

## Packages

A list of notable packages that I found and experimented with.  Packages need to support desktop and web, not just Android/iOS

* [get_it](https://pub.dev/packages/get_it)
    * I've experimented with this package before.  It's a service locator, which will provide a seperation of layers, similar to dependency injection.
    * Keeps the UI from needing to be wrapped with all sorts of other widgets
* [get_it_mixin](https://pub.dev/packages/get_it_mixin)
    * Handy get_it companion for flutter if you need to watch for changes in your models
* [http](https://pub.dev/packages/http)
    * Used for REST
* [json_serializable](https://pub.dev/packages/json_serializable)
    * Generate fromJson and toJson for your models (also handy for stash)
* [pdfx](https://pub.dev/packages/pdfx)
    * One stop solution to render pdf's cross platform (glad I found this, wasn't so lucky with xamarin)
* [flutter_widget_from_html_core](https://pub.dev/packages/flutter_widget_from_html_core)
    * This package was hard to find, there aren't many options for rendering html in desktop
        * Bonus, this actually generates widgets from the html, instead of using a webview (like I had to do in xamarin (nightmare))
* [build_runner](https://pub.dev/packages/build_runner)
    * Generate files from dart code, primarily using it for json_serializable, might be needed for other packages to come.
* [stash](https://pub.dev/packages/stash)
    * Used to cache objects offline
        * This package needs more attention (it's awesome), I almost didn't stumble upon it.
        * I don't know why it's not more popular, I didn't find many mentions of it across the internet.
        * Bonus, it can use the same generated files from the json_serializable, life saver.
* [connectivity_plus](https://pub.dev/packages/connectivity_plus)
    * Check connectivity
    * Subscribe to connectivity changes
        * Still need to decide on where to subscribe, one option is a streambuilder at the main app level

Packages I still want to look at

* [flutter_icons](https://pub.dev/packages/flutter_launcher_icons)
* [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)


