# local_bands_client

The client application for Local Bands. 

# Setup
- Flutter & Dart (LTE)
- Android Studio and command line tools

### Build
- flutter pub get ~ Install packages
- flutter pub outdated ~ Updated outdated packages
- flutter run ~ Runs the app on the attached device (Browser by default)

- dart run build_runner watch ~ Generates the riverpod and freezed files  
- dart run build_runner watch -delete-conflicting-outputs ~ Generates the riverpod and freezed files wthout duplicates/conflicting files

# Architecture

As for the architecture the components will be separated by different layers in a Clean Architecture style mixed with MVVM and Provider.

### Domain Layer
Here we'll place the different models that represent the screen view data.
- ProfileModel
- StoreModel
- ProductModel
- ...

This layer will have no understanding or dependency of the other layers.

_These classes will hold serialization methods only!_

### Presentation Layer
The presentation layer is responsible for the UI and UI State implementations. To separate the concerns we'll divide the components into Views and ViewModels. 

#### View
A view is any widget (stateful or not) that paints what's on the screen.
- ProfileView
- LoginView
Methods may include:
- paintForm
- paintLoader

#### ViewModel
The view model is responsible for the state of the view. It usually calls an external component (such as services) to do requests or change the models. It should be able to register changes to the models and update the UI state accordingly.
- ProductViewModel
- LoginViewModel

### Application Layer
This layer wil hold the business logic that will mutate the different models. 
- ProfileSerice
- AuthService 

This layer usually calls uppon the data layer for external API calls

### Data (Adapter) Layer
The Data Layer is basically our repositories, that will fetch data from the external APIs. 
- UserRepository
- ProductRepository


### File structure
For the file structure we'll apply a Feature-First approach.
>NOTE: Features are not defined by the views, but by their functionality.
This means that the different files will be separated what the user does, rather than sees:
&cross; home -> &check; auth
&cross; webstore -> &check; products
&cross; profile -> &check; address

Each feature will have application, data, domain and presentation folders, following the Clean Architecture design.
The sub-folders of any of the aforementioned layer folders will be named after the model.

* products ...
* auth ...
* cart
  * data ...
  * domain ...
  * applocation ... 
  * presentation
    * add_to_cart
    * shopping_cart
      * shopping_cart_item.dart
      * shopping_cart_screen.dart
      * ...

**Anything over the features folder should be considered a shared resource**
[Reference](https://codewithandrea.com/articles/flutter-project-structure/)


# Common Principles
- SOLID
  - Ensure all methods are atomic and do exactly what the name of the method says. Create additional methods if needed.

- Singletons
  - Use Providers to keep single instances of all reusable classes.

- KISS
  - No need to overcomplicate the different parts of a rather simple application. Use libraries and don't re-invent the wheel. 

- Testability
  - Ensure that all logic and widget are testable.