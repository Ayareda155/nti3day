import 'package:flutter/material.dart';

// ═══════════════════════════════════════════
//  ProfileScreen
// ═══════════════════════════════════════════
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController(text: 'أحمد محمد');
  final emailController = TextEditingController(text: 'ahmed@example.com');
  final phoneController = TextEditingController(text: '01012345678');
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        elevation: 0,
        title: const Text(
          'حسابي',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => setState(() => isEditing = !isEditing),
            child: Text(
              isEditing ? 'حفظ' : 'تعديل',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                _ProfileHeader(
                  nameController: nameController,
                  emailController: emailController,
                  isEditing: isEditing,
                  onNameChanged: () => setState(() {}),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ProfileFields(
                        nameController: nameController,
                        emailController: emailController,
                        phoneController: phoneController,
                        isEditing: isEditing,
                        onChanged: () => setState(() {}),
                      ),
                      const SizedBox(height: 24),
                      _ProfileSettings(),
                      const SizedBox(height: 24),
                      _LogoutButton(),
                      const SizedBox(height: 30),
                    ],
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

// ═══════════════════════════════════════════
//  _ProfileHeader
// ═══════════════════════════════════════════
class _ProfileHeader extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final bool isEditing;
  final VoidCallback onNameChanged;

  const _ProfileHeader({
    required this.nameController,
    required this.emailController,
    required this.isEditing,
    required this.onNameChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.symmetric(vertical: 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green[700]!, Colors.green[400]!],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadiusDirectional.only(
          bottomStart: Radius.circular(32),
          bottomEnd: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          _ProfileAvatar(isEditing: isEditing),
          const SizedBox(height: 12),
          _ProfileName(
            nameController: nameController,
            isEditing: isEditing,
            onChanged: onNameChanged,
          ),
          const SizedBox(height: 4),
          Text(
            emailController.text,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _ProfileAvatar
// ═══════════════════════════════════════════
class _ProfileAvatar extends StatelessWidget {
  final bool isEditing;
  const _ProfileAvatar({required this.isEditing});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
            color: Colors.green[200],
          ),
          child: const Icon(Icons.person, size: 50, color: Colors.white),
        ),
        if (isEditing)
          PositionedDirectional(
            bottom: 0,
            end: 0,
            child: Container(
              width: 26,
              height: 26,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.camera_alt, size: 16, color: Colors.green[700]),
            ),
          ),
      ],
    );
  }
}

// ═══════════════════════════════════════════
//  _ProfileName
// ═══════════════════════════════════════════
class _ProfileName extends StatelessWidget {
  final TextEditingController nameController;
  final bool isEditing;
  final VoidCallback onChanged;

  const _ProfileName({
    required this.nameController,
    required this.isEditing,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (isEditing) {
      return SizedBox(
        width: 200,
        child: TextField(
          controller: nameController,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          decoration: const InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white70),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            contentPadding: EdgeInsets.zero,
          ),
          onChanged: (_) => onChanged(),
        ),
      );
    }
    return Text(
      nameController.text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _ProfileFields
// ═══════════════════════════════════════════
class _ProfileFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final bool isEditing;
  final VoidCallback onChanged;

  const _ProfileFields({
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.isEditing,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'بياناتي',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _ProfileTextField(
          label: 'الاسم',
          icon: Icons.person_outline,
          controller: nameController,
          isEditing: isEditing,
          onChanged: onChanged,
        ),
        const SizedBox(height: 10),
        _ProfileTextField(
          label: 'البريد الإلكتروني',
          icon: Icons.email_outlined,
          controller: emailController,
          isEditing: isEditing,
          onChanged: onChanged,
        ),
        const SizedBox(height: 10),
        _ProfileTextField(
          label: 'رقم الهاتف',
          icon: Icons.phone_outlined,
          controller: phoneController,
          isEditing: isEditing,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════
//  _ProfileTextField
// ═══════════════════════════════════════════
class _ProfileTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool isEditing;
  final VoidCallback onChanged;

  const _ProfileTextField({
    required this.label,
    required this.icon,
    required this.controller,
    required this.isEditing,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        enabled: isEditing,
        textAlign: TextAlign.start,
        onChanged: (_) => onChanged(),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 12),
          prefixIcon: Icon(icon, color: Colors.green[700], size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsetsDirectional.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.green[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.green[700]!, width: 2),
          ),
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _ProfileSettings
// ═══════════════════════════════════════════
class _ProfileSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'الإعدادات',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _SettingsOption(
          icon: Icons.location_on_outlined,
          label: 'عناويني',
          color: Colors.blue,
        ),
        const SizedBox(height: 10),
        _SettingsOption(
          icon: Icons.notifications_outlined,
          label: 'الإشعارات',
          color: Colors.orange,
        ),
        const SizedBox(height: 10),
        _SettingsOption(
          icon: Icons.lock_outline,
          label: 'تغيير كلمة المرور',
          color: Colors.purple,
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════
//  _SettingsOption
// ═══════════════════════════════════════════
class _SettingsOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _SettingsOption({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _LogoutButton
// ═══════════════════════════════════════════
class _LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          showDialog(context: context, builder: (_) => _LogoutDialog()),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsetsDirectional.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.red.withValues(alpha: 0.2)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, color: Colors.red, size: 20),
            SizedBox(width: 8),
            Text(
              'تسجيل الخروج',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════
//  _LogoutDialog
// ═══════════════════════════════════════════
class _LogoutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('تسجيل الخروج', textAlign: TextAlign.start),
      content: const Text('هل أنت متأكد؟', textAlign: TextAlign.start),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إلغاء', style: TextStyle(color: Colors.grey)),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('خروج', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
