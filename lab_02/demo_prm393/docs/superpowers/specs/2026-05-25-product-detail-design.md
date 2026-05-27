# Product Detail Page Design

## Overview
Transform `ProductWidget` from a simple card view to a full product detail page with large image and scrollable content.

## Layout Structure
- **Top half (~50%)**: Large product image using `Expanded` in a `Column`
- **Bottom half**: `SingleChildScrollView` containing product details

## Components

### Image Section
- Full-width `Image.asset` with `BoxFit.cover`
- Height: 50% of screen (via `Expanded` + `flex: 1`)

### Details Section (inside SingleChildScrollView)
1. **Product Name**: `Text` fontSize 22, `FontWeight.bold`
2. **Price**: `Text` fontSize 20, red color (`Colors.red[700]`), formatted as currency
3. **Rating Row**: `Row` with `Icon(Icons.star, color: Colors.amber)` + rating text + "Đã bán X"
4. **Description**: `Text` fontSize 16, `Colors.grey[700]`, longer text about product
5. **Action Buttons**: `Row` with 2 buttons:
   - **Add to Cart**: `OutlinedButton` with `Icons.add_shopping_cart`
   - **Buy Now**: `ElevatedButton` filled primary color (blue)

## Implementation
- Modify `lib/views/Widgets/ProductWidget.dart`
- Use `Column` with `Expanded` for image/details split
- Wrap bottom section in `SingleChildScrollView`
- Add sample long description text
- Add price value (e.g., "299.000đ")
- Add dummy sales count (e.g., "Đã bán 42")

## File
`lib/views/Widgets/ProductWidget.dart`