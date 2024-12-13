# toyshop

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



BottomNavigationBar bottonNav() 
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (value) => navigateBottomBar(value),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,color: Colors.green),
          label: "Home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline,color: Colors.green),
          label: "Favorite"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.tune),
          label: "Filter",
        )
      ]
    );