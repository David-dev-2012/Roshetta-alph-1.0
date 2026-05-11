import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/database/medicine_dao.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/navigation/app_navigation.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({super.key});

  @override
  State<AddMedicinePage> createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final _formKey = GlobalKey<FormState>();
  final _medicineNameController = TextEditingController();
  final _manufacturerController = TextEditingController();
  final _sizeController = TextEditingController();
  final _quantityController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _selectedCategory;
  String? _selectedType;
  bool _isSaving = false;

  final List<String> _categories = ['Medicines', 'Supplements', 'Equipment', 'Other'];
  final List<String> _types = ['Tablet', 'Capsule', 'Syrup', 'Injection', 'Cream', 'Drops'];

  @override
  void dispose() {
    _medicineNameController.dispose();
    _manufacturerController.dispose();
    _sizeController.dispose();
    _quantityController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _saveMedicine() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedCategory == null || _selectedType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select category and type'), backgroundColor: Colors.red),
      );
      return;
    }

    setState(() => _isSaving = true);

    await MedicineDao.insert({
      'name': _medicineNameController.text,
      'manufacturer': _manufacturerController.text,
      'size': _sizeController.text,
      'quantity': int.tryParse(_quantityController.text) ?? 0,
      'category': _selectedCategory,
      'type': _selectedType,
      'description': _descriptionController.text,
    });

    if (!mounted) return;
    setState(() => _isSaving = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Medicine added successfully!'), backgroundColor: Color(0xFF10B981)),
    );

    AppNavigation.pushNamed(context, RoutesName.pharmacyDashboard);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Add Medicine',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel('Medicine Name *'),
              _buildTextField(
                controller: _medicineNameController,
                hint: 'e.g. Paracetamol 500mg',
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),

              SizedBox(height: 14.h),

              _buildLabel('Manufacturer'),
              _buildTextField(
                controller: _manufacturerController,
                hint: 'e.g. Pharmaceutical Ltd.',
              ),

              SizedBox(height: 14.h),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('Size *'),
                        _buildTextField(
                          controller: _sizeController,
                          hint: '500mg',
                          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('Quantity *'),
                        _buildTextField(
                          controller: _quantityController,
                          hint: '10',
                          keyboardType: TextInputType.number,
                          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 14.h),

              _buildLabel('Category *'),
              _buildDropdown(
                hint: 'Medicines',
                value: _selectedCategory,
                items: _categories,
                onChanged: (val) => setState(() => _selectedCategory = val),
              ),

              SizedBox(height: 14.h),

              _buildLabel('Item Type *'),
              _buildDropdown(
                hint: 'Select type',
                value: _selectedType,
                items: _types,
                onChanged: (val) => setState(() => _selectedType = val),
              ),

              SizedBox(height: 14.h),

              _buildLabel('Description'),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  style: TextStyle(fontSize: 14.sp),
                  decoration: InputDecoration(
                    hintText: 'Describe the medicine, usage, etc.',
                    hintStyle: TextStyle(color: const Color(0xFFCBD5E1), fontSize: 13.sp),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12.w),
                  ),
                ),
              ),

              SizedBox(height: 28.h),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSaving ? null : _saveMedicine,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primary,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                  ),
                  child: _isSaving
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : Text(
                          'Add Medicine',
                          style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Text(
        text,
        style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: const Color(0xFF334155)),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: TextStyle(fontSize: 14.sp),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: const Color(0xFFCBD5E1), fontSize: 13.sp),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide(color: ColorManager.primary, width: 1.5)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: const BorderSide(color: Color(0xFFEF4444))),
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(hint, style: TextStyle(color: const Color(0xFFCBD5E1), fontSize: 13.sp)),
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down, color: const Color(0xFF94A3B8), size: 20.sp),
          items: items.map((item) => DropdownMenuItem(
            value: item,
            child: Text(item, style: TextStyle(fontSize: 14.sp, color: const Color(0xFF1E293B))),
          )).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}