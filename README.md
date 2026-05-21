# ReportApp – Money Management App

ReportApp is a Flutter-based money management application designed to help users track income and expenses with a modern fintech-style interface. The app automatically calculates total balance, visualizes financial data, and provides a simple and efficient way to manage daily finances.

---

## Features

### Transaction Management
Users can add financial records with:
- Title (e.g., Salary, Food, Shopping)
- Amount (numeric input)
- Type:
  - Income → stored as a positive value
  - Expense → automatically converted to a negative value  

This ensures consistent and accurate calculations.

---

### Automatic Balance Calculation

The app calculates total balance using:

```

Total Balance = Sum of all transactions

```

- Updates in real-time  
- Displayed prominently on the dashboard  

---

### Dashboard
The main screen provides:
- Current total balance  
- Recent transactions  
- Quick add (+) button  

The UI uses cards, gradients, and a modern layout inspired by fintech apps.

---

### Statistics Page
Provides visual insights into financial activity:
- Pie chart: income vs expenses  
- Line chart: spending over time  
- Bar chart: category breakdown  

Includes filters:
- Daily  
- Weekly  
- Monthly  

---

### Transaction History
Displays a complete list of transactions:
- Title  
- Amount  
  - Green for income  
  - Red for expense  
- Date  

Optional:
- Swipe to delete transactions  

---

### Add Transaction
Users can input new transactions through a form:
- Title input  
- Amount input  
- Type selector (Income / Expense toggle)  

Includes:
- Input validation  
- Smooth animations  

---

## Data Structure

Each transaction is stored as:

```

{
id: string,
title: string,
amount: number,
type: "income" | "expense",
date: timestamp
}

```

---

## UI and Design

The app follows a modern fintech design approach:
- Minimal layout  
- Soft shadows and rounded corners  
- Color system:
  - Income: green  
  - Expense: red  
  - Primary: purple/blue gradient  

### Navigation
Bottom navigation includes:
- Home (Dashboard)  
- Statistics  
- Add  
- History  
- Profile (optional)  

---

## Behavior and Logic

- Expense values are automatically converted to negative  
- Prevents invalid inputs (empty or non-numeric)  
- Real-time updates for balance and UI  
- Smooth transitions between pages  

---

## Tech Stack

- Flutter  
- Optional integrations:
  - Firebase (Firestore, Analytics)  
  - Chart libraries (e.g., fl_chart)  

---

## Future Improvements

- User authentication  
- Cloud synchronization with Firebase  
- Budget limits and alerts  
- Dark mode  
- Export reports  

---

## Setup

1. Clone the repository  
2. Run:
```

flutter pub get

```
3. Start the app:
```

flutter run

```

---

## License

This project is available under the MIT License.
```

## 🏆 Achievement Badges
- **YOLO Badge** - Merged without code review for instant deployment!
## 👥 Pair Programming Session
- Second pair programming session
## 🦈 Pull Shark Feature 1
- Enhanced transaction tracking system
## 🦈 Pull Shark Feature 2
- Improved user dashboard UI
## 🦈 Pull Shark Feature 3
- Added advanced analytics features
