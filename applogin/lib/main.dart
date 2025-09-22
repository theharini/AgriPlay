import 'package:flutter/material.dart';

void main() {
  runApp(AgriPlayApp());
}

class AgriPlayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AgriPlay",
      home: WelcomePage(),
    );
  }
}

//////////////////////////////////////////////////////
// 1. Welcome Page
//////////////////////////////////////////////////////
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconSize;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _iconSize = Tween<double>(
      begin: 60,
      end: 100,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade800, Colors.green.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        width: double.infinity,
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _iconSize,
              builder: (context, child) {
                return Icon(
                  Icons.agriculture,
                  size: _iconSize.value,
                  color: Colors.white,
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              "AgriPlay",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Play, Learn, and Grow Sustainably\nExperience farming in a fun way!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.white,
                foregroundColor: Colors.green.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text("Start Game"),
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////
// 2. Login Page
//////////////////////////////////////////////////////
class LoginPage extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FarmerDataPage()),
    );
  }

  void _loginWithGoogle(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Google Login Coming Soon")));
  }

  void _loginWithFacebook(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Facebook Login Coming Soon")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "AgriPlay Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Learn Farming with Games",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 24),
                TextField(
                  controller: userController,
                  decoration: InputDecoration(
                    labelText: "Phone, Email or Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _login(context),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.green.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text("Login"),
                ),
                SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () => _loginWithGoogle(context),
                  icon: Icon(Icons.g_mobiledata),
                  label: Text("Login with Google"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade600,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () => _loginWithFacebook(context),
                  icon: Icon(Icons.facebook),
                  label: Text("Login with Facebook"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Forget Password Coming Soon")),
                    );
                  },
                  child: Text(
                    "Forget Password?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green.shade800),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Sign Up Coming Soon")),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.green.shade800,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////
// 3. Farmer Data Page
//////////////////////////////////////////////////////
class FarmerDataPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  void _submitData(BuildContext context) {
    String name = nameController.text.trim();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LobbyPage(fullName: name)),
    );
  }

  Widget _buildBoxField(
    TextEditingController controller,
    String label, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(2, 2)),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(labelText: label, border: InputBorder.none),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.green.shade800,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: Text("Farmer Data"),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionTitle("Personal Info"),
              _buildBoxField(nameController, "Full Name"),
              _buildBoxField(
                ageController,
                "Age",
                keyboardType: TextInputType.number,
              ),
              _buildBoxField(dobController, "Date of Birth"),
              _buildSectionTitle("Location Info"),
              _buildBoxField(cityController, "City"),
              _buildBoxField(stateController, "State"),
              _buildBoxField(districtController, "District"),
              _buildBoxField(
                pinController,
                "Pincode",
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _submitData(context),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.green.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////
// 4. Lobby Page
//////////////////////////////////////////////////////
class LobbyPage extends StatelessWidget {
  final String fullName;
  LobbyPage({required this.fullName});

  final List<Map<String, dynamic>> leaderboard = [
    {"name": "Farmer A", "xp": 120, "coins": 200},
    {"name": "Farmer B", "xp": 110, "coins": 180},
    {"name": "Farmer C", "xp": 100, "coins": 160},
    {"name": "Farmer D", "xp": 95, "coins": 150},
    {"name": "Farmer E", "xp": 90, "coins": 140},
    {"name": "Farmer F", "xp": 85, "coins": 130},
    {"name": "Farmer G", "xp": 80, "coins": 120},
    {"name": "Farmer H", "xp": 75, "coins": 110},
    {"name": "Farmer I", "xp": 70, "coins": 100},
    {"name": "Farmer J", "xp": 65, "coins": 90},
    {"name": "Farmer K", "xp": 60, "coins": 85},
    {"name": "Farmer L", "xp": 55, "coins": 80},
    {"name": "Farmer M", "xp": 50, "coins": 75},
    {"name": "Farmer N", "xp": 45, "coins": 70},
    {"name": "Farmer O", "xp": 40, "coins": 65},
    {"name": "Farmer P", "xp": 35, "coins": 60},
    {"name": "Farmer Q", "xp": 30, "coins": 55},
    {"name": "Farmer R", "xp": 25, "coins": 50},
    {"name": "Farmer S", "xp": 20, "coins": 45},
    {"name": "Farmer T", "xp": 15, "coins": 40},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: Text("Lobby"),
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.green.shade100,
                    child: Icon(
                      Icons.person,
                      size: 35,
                      color: Colors.green.shade700,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fullName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade800,
                          ),
                        ),
                        SizedBox(height: 6),
                        LinearProgressIndicator(
                          value: 0.4,
                          backgroundColor: Colors.green.shade100,
                          color: Colors.green.shade700,
                          minHeight: 8,
                        ),
                        SizedBox(height: 6),
                        Text("Level 2 • 40 XP"),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.monetization_on,
                        color: Colors.amber,
                        size: 28,
                      ),
                      Text(
                        "120",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Quick buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildQuickButton(Icons.settings, "Settings"),
                _buildQuickButton(Icons.group, "Friends"),
                _buildQuickButton(Icons.notifications, "Alerts"),
                _buildQuickButton(Icons.help, "Help"),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FarmingDetailsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Go to Farming Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "🌾 Farmer Leaderboard",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
            ),
            SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: leaderboard.length,
              itemBuilder: (context, index) {
                final farmer = leaderboard[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green.shade100,
                      child: Icon(Icons.person, color: Colors.green.shade700),
                    ),
                    title: Text(
                      "${index + 1}. ${farmer['name']}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "XP: ${farmer['xp']} • Coins: ${farmer['coins']}",
                    ),
                    trailing: Icon(Icons.emoji_events, color: Colors.amber),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: Colors.green.shade700, size: 28),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}

//////////////////////////////////////////////////////
// 5. Farming Details Page
//////////////////////////////////////////////////////
class FarmingDetailsPage extends StatefulWidget {
  @override
  _FarmingDetailsPageState createState() => _FarmingDetailsPageState();
}

class _FarmingDetailsPageState extends State<FarmingDetailsPage> {
  String? selectedFarmingType;
  String? selectedCrop;
  String? selectedIrrigation;
  String? selectedSeason;
  String? selectedFrequency;
  String? selectedFarmSize;
  final TextEditingController waterUsedController = TextEditingController();

  final List<String> farmingTypes = [
    "Crop Farming",
    "Horticulture",
    "Dairy Farming",
    "Poultry Farming",
    "Mixed Farming",
    "Agroforestry",
    "Aquaculture",
  ];

  final List<String> crops = [
    "Rice",
    "Wheat",
    "Maize",
    "Sugarcane",
    "Cotton",
    "Vegetables",
    "Fruits",
    "Millets",
    "Pulses",
  ];
  final List<String> irrigationMethods = [
    "Drip Irrigation",
    "Sprinkler Irrigation",
    "Surface Irrigation",
    "Canal Irrigation",
    "Rain-fed",
  ];
  final List<String> seasons = [
    "Kharif (Monsoon)",
    "Rabi (Winter)",
    "Zaid (Summer)",
    "All Seasons",
  ];
  final List<String> farmSizes = [
    "< 1 acre",
    "1 - 5 acres",
    "5 - 10 acres",
    "> 10 acres",
  ];
  final List<String> irrigationFrequency = [
    "Daily",
    "Weekly",
    "Bi-weekly",
    "Monthly",
    "Seasonal",
  ];

  void _submitDetails() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Farming Details Submitted Successfully!")),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameLevelsPage()),
    );
  }

  Widget _buildBoxField(Widget child) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.green.shade400, width: 1.5),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: child,
    );
  }

  Widget _buildDropdown(
    String label,
    String? selectedValue,
    List<String> items,
    Function(String?) onChanged,
  ) {
    return _buildBoxField(
      DropdownButton<String>(
        value: selectedValue,
        hint: Text(label),
        isExpanded: true,
        underline: SizedBox(),
        onChanged: onChanged,
        items:
            items
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Farming Details"),
        backgroundColor: Colors.green.shade700,
      ),
      backgroundColor: Colors.green.shade50,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDropdown(
              "Select Farming Type",
              selectedFarmingType,
              farmingTypes,
              (val) => setState(() => selectedFarmingType = val),
            ),
            _buildDropdown(
              "Select Crop",
              selectedCrop,
              crops,
              (val) => setState(() => selectedCrop = val),
            ),
            _buildDropdown(
              "Irrigation Method",
              selectedIrrigation,
              irrigationMethods,
              (val) => setState(() => selectedIrrigation = val),
            ),
            _buildDropdown(
              "Season",
              selectedSeason,
              seasons,
              (val) => setState(() => selectedSeason = val),
            ),
            _buildDropdown(
              "Irrigation Frequency",
              selectedFrequency,
              irrigationFrequency,
              (val) => setState(() => selectedFrequency = val),
            ),
            _buildDropdown(
              "Farm Size",
              selectedFarmSize,
              farmSizes,
              (val) => setState(() => selectedFarmSize = val),
            ),
            _buildBoxField(
              TextField(
                controller: waterUsedController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Water Used (Liters)"),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitDetails,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Submit",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////
// 6. Game Levels Page (Enhanced)
//////////////////////////////////////////////////////
class GameLevelsPage extends StatelessWidget {
  final List<Map<String, dynamic>> levels = [
    {
      "title": "Level 1: Awareness",
      "desc": "Quiz on water scarcity in Kerala",
      "xp": 50,
      "coins": 20,
    },
    {
      "title": "Level 2: Efficient Water Usage",
      "desc": "Puzzle on irrigation methods",
      "xp": 60,
      "coins": 25,
    },
    {
      "title": "Level 3: Crop Selection",
      "desc": "Choose water-efficient crops",
      "xp": 70,
      "coins": 30,
    },
    {
      "title": "Level 4: Rainwater Harvesting",
      "desc": "Simulation of water storage",
      "xp": 80,
      "coins": 35,
    },
    {
      "title": "Level 5: Community Farming",
      "desc": "Teamwork-based challenge",
      "xp": 90,
      "coins": 40,
    },
    {
      "title": "Level 6: Climate Smart Farming",
      "desc": "Run a virtual sustainable farm",
      "xp": 100,
      "coins": 50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Levels"),
        backgroundColor: Colors.green.shade700,
      ),
      backgroundColor: Colors.green.shade50,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: levels.length,
              itemBuilder: (context, index) {
                final level = levels[index];
                return Card(
                  margin: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: ListTile(
                    leading: Icon(
                      Icons.local_florist,
                      color: Colors.green.shade700,
                      size: 32,
                    ),
                    title: Text(
                      level["title"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Text("Objective: ${level["desc"]}"),
                        SizedBox(height: 6),
                        LinearProgressIndicator(
                          value: 0.3, // Example progress
                          color: Colors.green.shade700,
                          backgroundColor: Colors.green.shade100,
                          minHeight: 6,
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.monetization_on,
                              color: Colors.amber,
                              size: 18,
                            ),
                            SizedBox(width: 4),
                            Text("${level["xp"]} XP"),
                            SizedBox(width: 12),
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                              size: 18,
                            ),
                            SizedBox(width: 4),
                            Text("${level["coins"]} Coins"),
                          ],
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.play_arrow,
                      color: Colors.green.shade700,
                      size: 28,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => LevelCompletionPage(
                                levelName: level["title"],
                                xpEarned: level["xp"],
                                coinsEarned: level["coins"],
                                levelScore: 80, // Example score
                              ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),

          // ✅ Next Level Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to LevelCompletionPage for example
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => LevelCompletionPage(
                          levelName: "Level 1: Awareness",
                          xpEarned: 50,
                          coinsEarned: 20,
                          levelScore: 80,
                        ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.green.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Next",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////
// 7. Level Completion Page (Enhanced)
//////////////////////////////////////////////////////
class LevelCompletionPage extends StatelessWidget {
  final String levelName;
  final int xpEarned;
  final int coinsEarned;
  final int levelScore;

  LevelCompletionPage({
    required this.levelName,
    this.xpEarned = 0,
    this.coinsEarned = 0,
    this.levelScore = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Level Complete"),
        backgroundColor: Colors.green.shade700,
      ),
      backgroundColor: Colors.green.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.emoji_events, size: 80, color: Colors.amber),
            SizedBox(height: 20),
            Text(
              "$levelName Completed!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade800,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text("Score: $levelScore", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("XP Earned: $xpEarned", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Coins Earned: $coinsEarned", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
              ),
              child: Text("Back to Levels"),
            ),
          ],
        ),
      ),
    );
  }
}
