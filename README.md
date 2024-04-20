# pixbay

Responsive Image Gallery with API Integration

This project showcases a Flutter application that fetches images from pixabay API and displays them in a responsive grid layout.

Key Features:

API Integration: Using the Pixabay API to dynamically retrieve a collection of images.
Responsive Grid View: Utilizes a custom ResponsiveGridView widget that adapts the number of columns based on the screen size (mobile, tablet, or web) for optimal viewing.
Custom Page Route: Provides a smooth and zoom transition during image navigation.

Technologies Used:

GetX: A lightweight yet powerful state management library that simplifies managing application state.

Dio: An efficient HTTP client library used to perform network requests and fetch data from the Pixabay API.

CachedNetworkImage: Optimizes image loading and caching for a smoother user experience, especially on slower connections.

Shimmer: Provides a visual placeholder while images are loading, enhancing the perceived performance of the application.

FlexColorScheme: Offers a flexible color scheme library to customize the application's visual theme.