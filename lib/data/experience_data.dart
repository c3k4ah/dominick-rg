import '../shared/formation_model.dart';
import 'image_assets.dart';

List<ExpsModel> experienceList = [
  ExpsModel(
    isActive: true,
    institut: "Freelance",
    location: 'Remote',
    title: "Flutter Developer",
    date: "${DateTime.now().year}",
    projects: [
      ProjectDescriptionModel(
        title: "Dating App",
        tasks: [
          "Functional specifications drafting",
          "Integration of PocketBase API",
          "Adoption of Agile methodology",
        ],
        skills: [
          "Flutter",
          "Clean Architecture",
          "PocketBase framework",
        ],
        others: "Delivery of an MVP every Sprint",
      ),
      ProjectDescriptionModel(
        title: "Digital Library Software",
        isMobilePlatform: false,
        tasks: [
          "Windows application development",
          "Design integration",
        ],
        skills: [
          "Flutter",
          "ObjectBox",
        ],
      ),
      ProjectDescriptionModel(
        title: "Ticket Management Application",
        tasks: [
          "Android application development",
          "Design creation",
        ],
        skills: [
          "Flutter",
          "Dart",
          "Git",
        ],
      ),
    ],
    urlImage: imageAsset.freelance,
  ),
  ExpsModel(
    isActive: false,
    institut: "MyAgency",
    urlImage: imageAsset.myAgency,
    location: 'Anjanahary',
    title: "Flutter Developer",
    date: "2023",
    projects: [
      ProjectDescriptionModel(
        title: "Order Management Application Development",
        tasks: [
          "Android application development",
          "API integration",
          "Setup of a tracking system",
        ],
        skills: [
          "Flutter",
          "Clean Architecture",
        ],
      ),
      ProjectDescriptionModel(
        title: "Collaboration and Event Management Application",
        tasks: [
          "Design integration.",
        ],
        skills: [
          "Flutter",
          "Clean Architecture",
          "Firebase",
        ],
      ),
    ],
  ),
  ExpsModel(
    isActive: false,
    institut: "AreaTech",
    urlImage: imageAsset.areaTech,
    location: 'Avaradoha',
    title: "Flutter Developer",
    date: "2022",
    projects: [
      ProjectDescriptionModel(
        title: "Travel Reservation Application",
        tasks: [
          "Android application development",
          "Backend setup",
          "API integration",
          "Design integration.",
        ],
        skills: [
          "Flutter",
          "FastAPI",
        ],
      ),
    ],
  ),
  ExpsModel(
    isActive: false,
    institut: "IBONIA",
    urlImage: imageAsset.inonia,
    location: 'Ankatso',
    title: "Discovery Internship",
    date: "2020",
    projects: [
      ProjectDescriptionModel(
        title: "Travel Reservation Application",
        tasks: [
          "Observing a developer's daily routine",
          "Introduction to development.",
        ],
        skills: [],
      ),
    ],
  ),
];
