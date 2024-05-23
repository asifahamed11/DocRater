import 'package:app/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/CatBlock.dart';
import 'package:app/AddDoctorScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:app/about_screen.dart';

class HomeView extends StatefulWidget {
  final String userName;

  const HomeView({Key? key, required this.userName}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

enum _SelectedTab {
  home,
  search,
  info,
  profile,
}

_SelectedTab _selectedTab = _SelectedTab.home;

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List<Map<String, String>> filteredCategories = [];
  static const List<Map<String, String>> categories = [
    {"name": "Cardiology", "imageUrl": "card.jpg"},
    {"name": "Chest Medicine", "imageUrl": "chest.jpg"},
    {"name": "Consult Sonologist", "imageUrl": "csonologist.png"},
    {"name": "Consultant Pathologist", "imageUrl": "pathologist.png"},
    {"name": "Sonologist", "imageUrl": "sonologist.png"},
    {"name": "Skin or Dermatology", "imageUrl": "dermatology.png"},
    {"name": "Diabetologist", "imageUrl": "diabetologist.png"},
    {"name": "Dietician", "imageUrl": "dietician.png"},
    {"name": "Endocrine Medicine", "imageUrl": "endocrine.jpg"},
    {"name": "Endocrinology", "imageUrl": "endocrinology.png"},
    {"name": "ENT, Head & Neck Surgery", "imageUrl": "ent.png"},
    {"name": "Eye or Ophthalmology", "imageUrl": "ophthalmology.png"},
    {"name": "Gastroenterology", "imageUrl": "gastroenterology.png"},
    {"name": "Neurosurgery", "imageUrl": "neurosurgery.png"},
    {"name": "General Surgery", "imageUrl": "generalsurgery.png"},
    {"name": "Haematology", "imageUrl": "haematology.png"},
    {"name": "Liver Medicine or Hepatology", "imageUrl": "hepatologylm.png"},
    {
      "name": "Liver, Biliary And Pancreatic Surgery",
      "imageUrl": "liver_surgery.png"
    },
    {"name": "Medicine", "imageUrl": "medicine.png"},
    {
      "name": "Medicine And Neurology Specialist",
      "imageUrl": "neurology_specialist.png"
    },
    {"name": "Neurology", "imageUrl": "neur.png"},
    {"name": "Gynaecology", "imageUrl": "gynaecology.png"},
    {"name": "Orthopaedic Surgery", "imageUrl": "orthopaedic.png"},
    {"name": "Pain Management", "imageUrl": "pain_management.png"},
    {"name": "Pathologist", "imageUrl": "pathologist.png"},
    {"name": "Child or Pediatric", "imageUrl": "pediatric.png"},
    {"name": "Pediatric Surgery", "imageUrl": "pediatric_surgery.png"},
    {
      "name": "Physical Medicine And Rehabilitation",
      "imageUrl": "rehabilitation.png"
    },
    {"name": "Physiotherapy Department", "imageUrl": "physiotherapy.png"},
    {"name": "Psychiatry", "imageUrl": "psychiatry.png"},
    {"name": "Radiologist & Sonologist", "imageUrl": "radiologist.png"},
    {"name": "Radiology & Imaging", "imageUrl": "radiology.png"},
    {"name": "Respiratory Medicine", "imageUrl": "respiratory.png"},
    {"name": "Rheumatology Medicine", "imageUrl": "rheumatology.png"},
    {"name": "Urology Surgery", "imageUrl": "urology_surgery.png"},
    {"name": "Nephrology or Kidney Medicine", "imageUrl": "nephrology.png"},
    {"name": "Urologist", "imageUrl": "urologist.png"},
    {"name": "Hepatology", "imageUrl": "hepatology.png"},
    {"name": "Child Neurology", "imageUrl": "child_neurology.png"},
    {"name": "Nuclear Medicine", "imageUrl": "nuclear_medicine.png"},
    {"name": "Child Paediatrics", "imageUrl": "child_pediatrics.png"},
    {"name": "General and Colo-Rectal Surgeon", "imageUrl": "colo_rectal.png"},
    {"name": "Orthopedics", "imageUrl": "orthopedics.png"},
    {"name": "Colorectal Surgery", "imageUrl": "colorectal_surgery.png"},
    {"name": "Plastic Surgery", "imageUrl": "plastic_surgery.png"},
    {"name": "Vascular Surgery", "imageUrl": "vascular_surgery.png"},
    {"name": "Oncology", "imageUrl": "oncology.png"},
    {
      "name": "Breast, Colorectal & Laparoscopy Surgery",
      "imageUrl": "breast_surgery.png"
    },
    {"name": "Lithotripsy Department", "imageUrl": "lithotripsy.png"},
    {"name": "Medical Officer", "imageUrl": "medical_officer.png"},
    {
      "name": "Spine, Orthopaedic & Trauma Surgeon",
      "imageUrl": "spine_surgeon.png"
    },
    {"name": "Hematology Specialist", "imageUrl": "hematology_specialist.png"},
    {
      "name": "Medicine and Diabetologist",
      "imageUrl": "medicine_diabetologist.png"
    },
    {"name": "Nutritionist", "imageUrl": "nutritionist.png"},
    {"name": "General Surgeon", "imageUrl": "general_surgeon.png"},
    {
      "name": "Clinical & Interventional Cardiologist",
      "imageUrl": "interventional_cardiologist.png"
    },
    {"name": "Neuro Medicine", "imageUrl": "neuro_medicine.png"},
    {
      "name": "Child Specialist & Neonatologist",
      "imageUrl": "child_specialist.png"
    },
    {"name": "Urology", "imageUrl": "urology.png"},
    {"name": "General Physician", "imageUrl": "general_physician.png"},
    {
      "name": "Colorectal, Laparoscopy & Breast Surgeon",
      "imageUrl": "colorectal_surgeon.png"
    },
    {
      "name": "Breast Cancer Specialist",
      "imageUrl": "breast-cancer-specialist.png"
    },
    {"name": "Child Cardiology", "imageUrl": "child-cardiology.png"},
    {"name": "Child Neuro Surgery", "imageUrl": "child-neuro-surgery.png"},
    {
      "name": "Child or Paediatric Nephrology",
      "imageUrl": "child-or-paediatric-nephrology.png"
    },
    {"name": "Cardiac Surgery", "imageUrl": "cardiac-surgery.png"},
    {"name": "Dentist", "imageUrl": "dentist.png"},
    {"name": "Dental Surgery", "imageUrl": "dental-surgery.png"},
    {"name": "Food & Nutrition", "imageUrl": "food-and-nutrition.png"},
    {
      "name": "Paediatric Gastroenterology & Nutrition",
      "imageUrl": "paediatric-gastroenterology-and-nutrition.png"
    },
    {
      "name": "Public Health Specialist",
      "imageUrl": "public-health-specialist.png"
    },
    {"name": "Infertility & Gynae", "imageUrl": "infertility-and-gynae.png"},
    {"name": "Gyane Oncology", "imageUrl": "gyane-oncology.png"},
    {"name": "Oncology Surgery", "imageUrl": "oncology-surgery.png"},
    {"name": "Pediatric Orthopedic", "imageUrl": "pediatric-orthopedic.png"},
    {"name": "Clinical Oncology", "imageUrl": "clinical-oncology.png"},
    {"name": "Thyroid", "imageUrl": "thyroid.png"},
    {"name": "Lactation Consultant", "imageUrl": "lactation-consultant.png"},
    {
      "name": "Sports & Exercise Medicine",
      "imageUrl": "sports-and-exercise-medicine.png"
    },
    {
      "name": "Child Haematology & Oncology",
      "imageUrl": "child-haematology-and-oncology.png"
    },
    {
      "name": "Child or Paediatrics Chest Medicine",
      "imageUrl": "child-or-paediatrics-chest-medicine.png"
    },
    {
      "name": "Paediatric Haematology & Oncology",
      "imageUrl": "paediatric-haematology-and-oncology.png"
    },
    {"name": "Hernia Surgery", "imageUrl": "hernia-surgery.png"},
    {"name": "Forensic Medicine", "imageUrl": "forensic-medicine.png"}
  ];

  @override
  void initState() {
    super.initState();
    filteredCategories = categories;
  }

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });

    switch (_selectedTab) {
      case _SelectedTab.profile:
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return EditAccountPage();
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            transitionDuration: Duration(milliseconds: 300),
          ),
        ).then((_) {
          Future.delayed(Duration(milliseconds: 150), () {
            setState(() {
              _selectedTab = _SelectedTab.values[0];
            });
          });
        });
        break;
      case _SelectedTab.info:
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return AboutScreen();
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            transitionDuration: Duration(milliseconds: 300),
          ),
        ).then((_) {
          Future.delayed(Duration(milliseconds: 150), () {
            setState(() {
              _selectedTab = _SelectedTab.values[0];
            });
          });
        });
        break;
      case _SelectedTab.search:
        _searchFocusNode.requestFocus();
        Future.delayed(Duration(milliseconds: 150), () {
          setState(() {
            _selectedTab = _SelectedTab.values[0];
          });
        });

        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CrystalNavigationBar(
            currentIndex: _SelectedTab.values.indexOf(_selectedTab),
            height: 10,
            unselectedItemColor: Colors.white70,
            backgroundColor: Colors.black.withOpacity(0.1),
            onTap: _handleIndexChanged,
            items: [
              /// Home
              CrystalNavigationBarItem(
                icon: IconlyBold.home,
                unselectedIcon: IconlyLight.home,
                selectedColor: Colors.white,
              ),

              /// Search
              CrystalNavigationBarItem(
                icon: IconlyBold.search,
                unselectedIcon: IconlyLight.search,
                selectedColor: Colors.white,
              ),

              /// About
              CrystalNavigationBarItem(
                icon: IconlyBold.info_circle,
                unselectedIcon: IconlyLight.info_circle,
                selectedColor: Colors.white,
              ),

              /// Profile
              CrystalNavigationBarItem(
                icon: IconlyBold.user_2,
                unselectedIcon: IconlyLight.user,
                selectedColor: Colors.white,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.shade50, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            // Added ScrollView to prevent overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                _buildSearchField(),
                _buildCategoriesGrid(),
                //_buildAddDoctorButton(),***************
              ],
            ),
          ),
        ));
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 90),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello ${widget.userName}",
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 1),
          Text(
            "Find your specialist",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 34),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(.1),
              spreadRadius: 7,
              blurRadius: 20,
              blurStyle: BlurStyle.normal,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: TextField(
          controller: _searchController,
          focusNode: _searchFocusNode,
          onChanged: _onSearchTextChanged,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.black26),
            hintText: 'Search Category . . . .',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Categories",
            style: GoogleFonts.lato(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 440, // Set a fixed height for the grid view
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.3,
                crossAxisSpacing: 0,
                mainAxisSpacing: 20,
              ),
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {
                return ScaleTransition(
                    // 5. Add subtle animations and transitions
                    scale: Tween<double>(
                      begin: 0.0,
                      end: 1.0,
                    ).animate(
                      CurvedAnimation(
                        parent: AnimationController(
                          vsync: this,
                          duration: Duration(milliseconds: 400),
                        )..forward(),
                        curve: Curves.easeInOut,
                      ),
                    ),
                    child: CatBlock(
                      name: filteredCategories[index]["name"]!,
                      imageUrl: filteredCategories[index]["imageUrl"]!,
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onSearchTextChanged(String value) {
    setState(() {
      filteredCategories = categories
          .where((category) =>
              category["name"]!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

/*
  Widget _buildAddDoctorButton() {
    return Center(
      child: ElevatedButton.icon(
        onPressed: _navigateToAddDoctorScreen,
        icon: Icon(Icons.add),
        label: Text("Add Doctor"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
*/

/*void _navigateToAddDoctorScreen() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AddDoctorScreen(),
        transitionDuration: Duration(milliseconds: 800),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.elasticOut,
              ),
            ),
            child: child,
          );
        },
      ),
    );
  }*/

  @override
  bool get wantKeepAlive => true;
}
