// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cook_app/core/common_widgets/text_field.dart';
import 'package:cook_app/core/constants/app_colors.dart';
import 'package:cook_app/core/constants/app_svg.dart';
import 'package:cook_app/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ManageProfilePage extends StatefulWidget {
  final int id;
  const ManageProfilePage({
    super.key,
    required this.id,
  });

  @override
  State<ManageProfilePage> createState() => _ManageProfilePageState();
}

class _ManageProfilePageState extends State<ManageProfilePage> {
  final nameController = TextEditingController();
  final bioController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: onPressBack,
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 14,
          ),
        ),
        centerTitle: true,
        title: const Text('Manage profile'),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Change your name',
                    style: theme.bodyMedium?.copyWith(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  MyTextField(
                    hintText: 'Change your name',
                    controller: nameController,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Change your bio',
                    style: theme.bodyMedium?.copyWith(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  MyTextField(
                    style: theme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                    radius: 18,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 19,
                      vertical: 12,
                    ),
                    minLines: 2,
                    hintText: 'Change your bio',
                    controller: bioController,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Change your photo',
                    style: theme.bodyMedium?.copyWith(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  state.image == null
                      ? GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            padding: const EdgeInsets.only(left: 18),
                            width: MediaQuery.sizeOf(context).width,
                            height: 93,
                            decoration: const BoxDecoration(
                              color: AppColors.backGrey,
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(AppSvg.camera),
                                const SizedBox(width: 10),
                                Text(
                                  'Upload a new photo',
                                  style: theme.labelSmall?.copyWith(
                                    color: AppColors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          width: MediaQuery.sizeOf(context).width,
                          height: 93,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(18),
                              ),
                              border: Border.all(color: Colors.black)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: FileImage(state.image!),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: _pickImage,
                                child: Text(
                                  'Change photo',
                                  style: theme.labelSmall?.copyWith(
                                    color: AppColors.orange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(height: 300),
                  ElevatedButton(
                    onPressed: onPressEdit,
                    child: const Text('Save changes'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void onPressEdit() {
    context.read<ProfileCubit>().onEdit(
          name: nameController.text,
          bio: bioController.text,
        );
  }

  void onPressBack() {
    context.read<ProfileCubit>().onBack();
    Navigator.pop(context);
  }

  void _pickImage() async {
    context.read<ProfileCubit>().getImage();
  }
}
