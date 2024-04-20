# Pixbay

Responsive Image Gallery with Pixabay API

This project showcases a Flutter application that fetches images from pixabay API and displays them in a responsive grid layout.

**Key Features:**

- **API Integration:** Leverages the Pixabay API to dynamically retrieve a collection of images.
- **Responsive Grid View:** Utilizes a custom `ResponsiveGridView` widget that adapts the number of columns based on the screen size (mobile, tablet, or web) for optimal viewing.
- **Custom Page Route:** Provides a smooth zoom transition during image navigation.

**Technologies Used:**

1. **GetX (State Management):** A lightweight library that simplifies managing application state.
2. **Dio:** An HTTP client library used to perform network requests and fetch data from the Pixabay API.
3. **CachedNetworkImage:** Optimizes image loading and caching for a smoother user experience, especially on slower connections.
4. **Shimmer:** Provides a visual placeholder while images are loading, enhancing the perceived performance of the application.
5. **FlexColorScheme:** Offers a flexible color scheme library to customize the application's visual theme.

**Snapshots:**

![Responsive Grid View on iPhone (Light Theme)](https://github.com/sharhan108/pixbay/blob/main/assets/images/iphone15_light.png)
![Responsive Grid View on iPad (Dark Theme)](https://github.com/sharhan108/pixbay/blob/main/assets/images/ipad_dark.png)
