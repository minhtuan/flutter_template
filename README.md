# Flutter template

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

Flutter is Google’s portable UI toolkit for building beautiful, natively-compiled applications for mobile, web, and desktop from a single codebase

  - Minimalist Design
  - Clean and Structured code
  - Reusable Components

# Examples!
## iOS Screenshots
  HomePage                 |   Hotel Page        |  Login Page
:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/minhtuan/flutter_template/blob/master/assets/images/screens/home.png?raw=true)|![](https://github.com/minhtuan/flutter_template/blob/master/assets/images/screens/hotel.png?raw=true)|![](https://github.com/minhtuan/flutter_template/blob/master/assets/images/screens/login.png?raw=true)

  Checkout                 |   Hotel Detail Page      |  Settings Page
:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/minhtuan/flutter_template/blob/master/assets/images/screens/check-out.png?raw=true)|![](https://github.com/minhtuan/flutter_template/blob/master/assets/images/screens/Hotel-detail.png?raw=true)|![](https://github.com/minhtuan/flutter_template/blob/master/assets/images/screens/settings.png?raw=true)

## Directory Structure
```
lib
│──main.dart    
│──blocs
│──components
└──data
    │──model
        │──category.dart
        │──data.dart
        └──product.dart
└───pages
    │──account
    │──home
    │──product
    │──search
    └──settings
└───widgets
    │──common
    |  |──busy_button.dart
    |  |──choice_chip.dart
    |  └──input_field.dart
    |──viewmodels
    |  |──city_card.dart
    |  └──login_view_model.dart
    
```