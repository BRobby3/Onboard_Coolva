import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboard_coolva/app/routes/app_pages.dart';
import 'package:onboard_coolva/app/core/values/constants/job_app_status_constants.dart';
import 'package:onboard_coolva/app/core/theme/app_color.dart';


class EditJobView extends StatefulWidget {
  const EditJobView({super.key});

  @override
  State<EditJobView> createState() => _EditJobViewState();
}

class _EditJobViewState extends State<EditJobView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController posisiController = TextEditingController();
  final TextEditingController perusahaanController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController catatanController = TextEditingController();

  final List<JobApplicationStatus> statusList = JobApplicationStatus.values;
  JobApplicationStatus? selectedStatus;

  @override
  void initState() {
    super.initState();
    final job = Get.arguments;
    if (job != null) {
      posisiController.text = job['title'] ?? '';
      perusahaanController.text = job['company'] ?? '';
      tanggalController.text = job['date'] ?? '';
      catatanController.text = job['catatan'] ?? '';
      selectedStatus = job['status'] is JobApplicationStatus
          ? job['status']
          : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Get.back();
            } else {
              Get.offAllNamed(Routes.HOME);
            }
          },
        ),
        title: const Text(
          'Edit Lamaran',
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: AppColor.neutral100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          controller: posisiController,
                          decoration: const InputDecoration(
                            labelText: 'Posisi',
                            labelStyle: TextStyle(
                              fontFamily: 'PlusJakartaSans',
                            ),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: const TextStyle(fontFamily: 'PlusJakartaSans'),
                          validator:
                              (value) =>
                                  value == null
                                      ? 'Wajib diisi'
                                      : null,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          controller: perusahaanController,
                          decoration: const InputDecoration(
                            labelText: 'Perusahaan',
                            labelStyle: TextStyle(
                              fontFamily: 'PlusJakartaSans',
                            ),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: const TextStyle(fontFamily: 'PlusJakartaSans'),
                          validator:
                              (value) =>
                                  value == null
                                      ? 'Wajib diisi'
                                      : null,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          controller: tanggalController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Tanggal Lamaran',
                            labelStyle: TextStyle(
                              fontFamily: 'PlusJakartaSans',
                            ),
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_today),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: const TextStyle(fontFamily: 'PlusJakartaSans'),
                          onTap: () async {
                            DateTime now = DateTime.now();
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: now,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(now),
                              );
                              final dateTime = DateTime(
                                pickedDate.year,
                                pickedDate.month,
                                pickedDate.day,
                                pickedTime?.hour ?? 0,
                                pickedTime?.minute ?? 0,
                              );
                              tanggalController.text =
                                  "${dateTime.year.toString().padLeft(4, '0')}-"
                                  "${dateTime.month.toString().padLeft(2, '0')}-"
                                  "${dateTime.day.toString().padLeft(2, '0')} "
                                  "${dateTime.hour.toString().padLeft(2, '0')}:"
                                  "${dateTime.minute.toString().padLeft(2, '0')}:00";
                            }
                          },
                          validator:
                              (value) =>
                                  value == null || value.isEmpty
                                      ? 'Wajib diisi'
                                      : null,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 56,
                        child: DropdownButtonFormField<JobApplicationStatus>(
                          value: selectedStatus,
                          items: statusList
                              .map((status) => DropdownMenuItem(
                                    value: status,
                                    child: Text(status.label),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedStatus = value;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Status Lamaran',
                            labelStyle: TextStyle(
                              fontFamily: 'PlusJakartaSans',
                            ),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator:
                              (value) =>
                                  value == null
                                      ? 'Wajib diisi'
                                      : null,
                          style: const TextStyle(fontFamily: 'PlusJakartaSans'),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          controller: catatanController,
                          decoration: const InputDecoration(
                            labelText: 'Catatan',
                            labelStyle: TextStyle(
                              fontFamily: 'PlusJakartaSans',
                            ),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: const TextStyle(fontFamily: 'PlusJakartaSans'),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primary500,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textStyle: const TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: const Text('Simpan Perubahan'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
