import 'package:flutter/material.dart';
import 'package:onboard_coolva/app/core/values/constants/job_app_status_constants.dart';

class JobCard extends StatelessWidget {
  final Map<String, dynamic> job;
  final VoidCallback? onTap;
  final String? timePassed;

  const JobCard({
    super.key,
    required this.job,
    this.onTap,
    this.timePassed,
  });

  @override
  Widget build(BuildContext context) {
    final status = job['status'] as JobApplicationStatus;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
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
                        color: status.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                  ),
                  if (timePassed != null)
                    Text(
                      timePassed!,
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
    );
  }
}