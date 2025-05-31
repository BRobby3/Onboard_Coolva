import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onboard_coolva/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class JobStatus {
  final String label;
  final Color bgColor;
  final Color textColor;
  JobStatus(this.label, this.bgColor, this.textColor);
}

String timeAgo(DateTime date) {
  final now = DateTime.now();
  final diff = now.difference(date);

  if (diff.inMinutes < 60) {
    return '${diff.inMinutes} menit yang lalu';
  } else if (diff.inHours < 24) {
    return '${diff.inHours} jam yang lalu';
  } else if (diff.inDays < 30) {
    return '${diff.inDays} hari yang lalu';
  } else if (diff.inDays < 365) {
    return '${(diff.inDays / 30).floor()} bulan yang lalu';
  } else {
    return '${(diff.inDays / 365).floor()} tahun yang lalu';
  }
}

final List<Map<String, dynamic>> jobs = [
  {
    'status': JobStatus(
      'Applied',
      Color.fromRGBO(176, 199, 249, 1),
      Color.fromRGBO(0, 75, 235, 1),
    ),
    'date': '2025-05-31 10:00:00',
    'title': 'Senior Software Engineer - Cloud Infrastructure',
    'company': 'Tokopedia',
  },
  {
    'status': JobStatus(
      'No Response',
      Color.fromRGBO(199, 201, 205, 1),
      Color.fromRGBO(87, 96, 111, 1),
    ),
    'date': '2025-05-31 14:30:00',
    'title': 'Mobile Developer',
    'company': 'Tokopedia',
  },
  {
    'status': JobStatus(
      'Interview',
      Color.fromRGBO(176, 240, 244, 1),
      Color.fromRGBO(0, 148, 155, 1),
    ),
    'date': '2025-05-06 09:00:00',
    'title': 'iOS Developer',
    'company': 'Tokopedia',
  },
  {
    'status': JobStatus(
      'On Test',
      Color.fromRGBO(251, 221, 178, 1),
      Color.fromRGBO(220, 131, 6, 1),
    ),
    'date': '2025-05-31 08:00:00',
    'title': 'Data Analytics',
    'company': 'Tokopedia',
  },
  {
    'status': JobStatus(
      'Ghosting',
      Color.fromRGBO(0, 0, 0, 0.25),
      Color.fromRGBO(0, 0, 0, 1),
    ),
    'date': '2025-05-18 12:00:00',
    'title': 'UI Designer',
    'company': 'Tokopedia',
  },
  {
    'status': JobStatus(
      'Rejected',
      Color.fromRGBO(231, 185, 185, 1),
      Color.fromRGBO(178, 28, 28, 1),
    ),
    'date': '2025-04-01 15:00:00',
    'title': 'AI Engineer',
    'company': 'Tokopedia',
  },
  {
    'status': JobStatus(
      'Offering',
      Color.fromRGBO(216, 238, 180, 1),
      Color.fromRGBO(91, 143, 9, 1),
    ),
    'date': '2025-05-25 11:00:00',
    'title': 'Media Social Manager',
    'company': 'Tokopedia',
  },
  {
    'status': JobStatus(
      'Noticed',
      Color.fromRGBO(199, 195, 255, 1),
      Color.fromRGBO(108, 92, 231, 1),
    ),
    'date': '2024-12-01 13:00:00',
    'title': 'Product Manager',
    'company': 'Tokopedia',
  },
];

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Track This Job!',
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.teal.shade50,
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          final status = job['status'] as JobStatus;
          final date = DateTime.tryParse(job['date'] ?? '') ?? DateTime.now();
          final timePassed = timeAgo(date);

          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(
                  Routes.DETAIL,
                  arguments: job,
                ); // Pass the selected job as arguments
              },
              child: Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: status.bgColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              status.label,
                              style: TextStyle(
                                fontFamily: 'PlusJakartaSans',
                                fontSize: 12,
                                color: status.textColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            timePassed,
                            style: TextStyle(
                              fontFamily: 'PlusJakartaSans',
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        job['title'],
                        style: const TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 10,
                            child: Text(
                              (job['company'] as String)
                                  .substring(0, 1)
                                  .toUpperCase(),
                              style: const TextStyle(
                                fontFamily: 'PlusJakartaSans',
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            job['company'],
                            style: const TextStyle(
                              fontFamily: 'PlusJakartaSans',
                              fontSize: 14,
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
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_JOB);
        },
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
