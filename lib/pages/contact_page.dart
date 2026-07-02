import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../content/company_content.dart';
import '../layout/site_scaffold.dart';
import '../theme/app_theme.dart';
import '../widgets/section_container.dart';
import '../widgets/site_footer.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      currentIndex: 2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _ContactHeader(),
            SectionContainer(
              child: _ContactBody(),
            ),
            const SiteFooter(),
          ],
        ),
      ),
    );
  }
}

class _ContactHeader extends StatelessWidget {
  const _ContactHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.deepBlue,
      child: SectionContainer(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              CompanyContent.contactsPageTitle,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 12),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Text(
                CompanyContent.contactsIntro,
                style: const TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = AppBreakpoints.isMobile(width);

    final infoAndMap = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        _ContactInfoCard(),
        SizedBox(height: 24),
        _MapPlaceholder(),
      ],
    );

    const form = _ContactForm();

    if (isMobile) {
      return Column(
        children: [infoAndMap, const SizedBox(height: 40), form],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5, child: infoAndMap),
        const SizedBox(width: 48),
        Expanded(flex: 5, child: form),
      ],
    );
  }
}

class _ContactInfoCard extends StatelessWidget {
  const _ContactInfoCard();

  Future<void> _launch(String uri) async {
    final parsed = Uri.parse(uri);
    if (await canLaunchUrl(parsed)) {
      await launchUrl(parsed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Informazioni di Contatto', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          _InfoRow(
            icon: Icons.location_on_outlined,
            text: '${CompanyContent.companyAddressLine1}\n${CompanyContent.companyAddressLine2}',
          ),
          _InfoRow(
            icon: Icons.phone_outlined,
            text: CompanyContent.companyPhone,
            onTap: () => _launch('tel:${CompanyContent.companyPhone.replaceAll(' ', '')}'),
          ),
          _InfoRow(
            icon: Icons.email_outlined,
            text: CompanyContent.companyEmail,
            onTap: () => _launch('mailto:${CompanyContent.companyEmail}'),
          ),
          _InfoRow(icon: Icons.schedule_outlined, text: CompanyContent.companyHours),
          _InfoRow(icon: Icons.badge_outlined, text: CompanyContent.companyVat),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const _InfoRow({required this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.deepBlue, size: 22),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: onTap != null ? AppColors.deepBlue : AppColors.textMuted,
                    fontWeight: onTap != null ? FontWeight.w600 : FontWeight.w400,
                  ),
            ),
          ),
        ],
      ),
    );

    if (onTap == null) return content;
    return InkWell(onTap: onTap, child: content);
  }
}

class _MapPlaceholder extends StatelessWidget {
  const _MapPlaceholder();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 16 / 10,
        child: Container(
          color: AppColors.deepBlueLight,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.map_outlined, color: Colors.white70, size: 48),
              const SizedBox(height: 12),
              Text(
                CompanyContent.mapPlaceholderNote,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactForm extends StatefulWidget {
  const _ContactForm();

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text(CompanyContent.formSuccessMessage)),
    );

    _formKey.currentState!.reset();
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(CompanyContent.formTitle, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: CompanyContent.formNameLabel,
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  (value == null || value.trim().isEmpty) ? 'Campo obbligatorio' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: CompanyContent.formEmailLabel,
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) return 'Campo obbligatorio';
                if (!value.contains('@')) return 'Email non valida';
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _messageController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: CompanyContent.formMessageLabel,
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              validator: (value) =>
                  (value == null || value.trim().isEmpty) ? 'Campo obbligatorio' : null,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submit,
              child: const Text(CompanyContent.formSubmitLabel),
            ),
          ],
        ),
      ),
    );
  }
}
