import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/route_manager.dart';

class Doctor {
  final String name;
  final String specialty;
  final double rating;
  final String distance;
  final String imageUrl;

  const Doctor({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.distance,
    required this.imageUrl,
  });
}

final List<Doctor> _doctors = [
  const Doctor(
    name: 'Dr. Marcus Horizon',
    specialty: 'Cardiologist',
    rating: 4.7,
    distance: '800m away',
    imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
  ),
  const Doctor(
    name: 'Dr. Maria Elena',
    specialty: 'Psychologist',
    rating: 4.7,
    distance: '800m away',
    imageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
  ),
  const Doctor(
    name: 'Dr. Stefi Jessi',
    specialty: 'Orthopedist',
    rating: 4.7,
    distance: '800m away',
    imageUrl: 'https://randomuser.me/api/portraits/women/65.jpg',
  ),
  const Doctor(
    name: 'Dr. Gerty Cori',
    specialty: 'Orthopedist',
    rating: 4.7,
    distance: '800m away',
    imageUrl: 'https://randomuser.me/api/portraits/men/75.jpg',
  ),
  const Doctor(
    name: 'Dr. Diandra',
    specialty: 'Orthopedist',
    rating: 4.7,
    distance: '800m away',
    imageUrl: 'https://randomuser.me/api/portraits/women/90.jpg',
  ),
  const Doctor(
    name: 'Dr. James Carter',
    specialty: 'Neurologist',
    rating: 4.8,
    distance: '1.2km away',
    imageUrl: 'https://randomuser.me/api/portraits/men/55.jpg',
  ),
];

class TopDoctorScreen extends StatelessWidget {
  const TopDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black87,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text(
          'Top Doctor',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        itemCount: _doctors.length,
        itemBuilder: (context, index) => DoctorCard(doctor: _doctors[index]),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  const DoctorCard({super.key, required this.doctor});

  static const _teal = Color(0xFF1DC6B8);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            AppNavigation.pushNamed(context, RoutesName.doctorDetails, args: doctor);
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    doctor.imageUrl,
                    width: 88,
                    height: 88,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => _placeholder(),
                  ),
                ),
                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: const TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        doctor.specialty,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[500],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.star_rounded, color: _teal, size: 17),
                          const SizedBox(width: 3),
                          Text(
                            doctor.rating.toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: _teal,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey[400],
                            size: 14,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            doctor.distance,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _placeholder() => Container(
        width: 88,
        height: 88,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(Icons.person, size: 40, color: Colors.grey),
      );
}
