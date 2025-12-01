# shop_app

Built a responsive Flutter e-commerce UI showcasing a shoe collection with filtering, product details, size selection, and cart management, using Provider for state management

## Features

### Product Listing
Displays shoes with title, price, and image.

### Responsive design:
- ListView for mobile (<650 px width)
- GridView for web/tablet

### Product Filtering
Filter shoes by brand: All, Adidas, Nike, Bata

### Search Bar (UI Only)
A search input prepared for future functionality.

### Product Details Page
- Shows full shoe details.
- Allows selecting size via chips.
- Highlights selected size visually.

### Cart System
- Add items to cart using Provider state management.
- Cart stores:
  - title
  - image
  - price
- Snackbar feedback for actions (added or no size selected).
📱 Responsive Layout

Automatically adjusts UI between mobile and web/tablet screens.
