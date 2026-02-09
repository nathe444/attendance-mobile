import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:attendance_app/models/attendance.dart';

class AttendanceDetailScreen extends StatelessWidget {
  final Attendance attendance;

  const AttendanceDetailScreen({Key? key, required this.attendance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Attendance Details', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(26),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 39,
                          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.1),
                          child: const Icon(Icons.person_pin, size: 40, color: Colors.deepPurpleAccent),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          attendance.attendee.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          attendance.displayName,

                          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 40, thickness: 0.5),
                  _buildDetailRow(context, Icons.event_available, 'Event', attendance.event.title),
                  _buildDetailRow(context, Icons.description, 'Description', attendance.event.description),
                  _buildDetailRow(context, Icons.business, 'Program', attendance.event.program.name),
                  _buildDetailRow(context, Icons.corporate_fare, 'Organization', attendance.event.program.organization.name),
                  const Divider(height: 40, thickness: 0.5),
                  _buildDetailRow(context, Icons.email_outlined, 'Email', attendance.attendee.email),
                  _buildDetailRow(context, Icons.phone_outlined, 'Phone', attendance.attendee.phone),
                  const Divider(height: 40, thickness: 0.5),
                  _buildDetailRow(context, Icons.timer, 'Time',
                      DateFormat.yMMMMd().add_jm().format(attendance.createdAt)),
                  _buildDetailRow(context, Icons.verified_user, 'Status',
                      attendance.valid ? 'Valid' : 'Invalid',
                      valueColor: attendance.valid ? Colors.green : Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, IconData icon, String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.deepPurpleAccent, size: 22),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    color: valueColor ?? Colors.black87,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
