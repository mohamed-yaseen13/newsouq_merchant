class AppConstants {
  static const List<String> categories = [
    'Electronics',
    'Clothing',
    'Furniture',
    'Sports',
    'Books',
    'other',
  ];

  static const List<String> metrics = ['Sales', 'Orders'];

  static const List<String> periods = ['This Week', 'Last Week', 'Last 7 Days'];

  // Simulated database data
  static Map<String, Map<String, List<ChartData>>> databaseData = {
    'Sales': {
      'Last 7 Days': [
        ChartData('Sept 10', 95000),
        ChartData('Sept 11', 40000),
        ChartData('Sept 12', 68000),
        ChartData('Sept 13', 25000),
        ChartData('Sept 14', 82000),
        ChartData('Sept 15', 48000),
        ChartData('Sept 16', 85000),
      ],
      'This Week': [
        ChartData('Sat', 55000),
        ChartData('Sun', 65000),
        ChartData('Mon', 75000),
        ChartData('Tue', 60000),
        ChartData('Wed', 85000),
        ChartData('Thu', 70000),
        ChartData('Fri', 90000),
      ],
    },
    'Orders': {
      'Last 7 Days': [
        ChartData('Sept 10', 850),
        ChartData('Sept 11', 420),
        ChartData('Sept 12', 650),
        ChartData('Sept 13', 280),
        ChartData('Sept 14', 780),
        ChartData('Sept 15', 510),
        ChartData('Sept 16', 820),
      ],
      'This Week': [
        ChartData('Sat', 530),
        ChartData('Sun', 640),
        ChartData('Mon', 720),
        ChartData('Tue', 590),
        ChartData('Wed', 810),
        ChartData('Thu', 680),
        ChartData('Fri', 920),
      ],
    },
  };
}

enum SidebarPage {
  dashboard,
  orders,
  customers,
  inventory,
  conversations,
  settings,
}

class ChartData {
  final String label;
  final double value;

  ChartData(this.label, this.value);
}
