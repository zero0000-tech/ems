import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ems/core/config/app_config.dart';
import 'package:ems/features/authenticate/controllers/login_controller.dart';
import 'package:ems/routes/app_routes.dart';
import 'package:ems/shared/widgets/form_input.dart';
import 'package:ems/shared/widgets/nitro/nitro_breadcrumb.dart';
import 'package:ems/shared/widgets/nitro/nitro_button.dart';
import 'package:ems/shared/widgets/nitro/nitro_row.dart';
import 'package:ems/shared/widgets/nitro/nitro_scaffold_sidebar.dart';
import 'package:ems/shared/widgets/nitro/nitro_sidebar.dart';
import 'package:ems/shared/widgets/theme_switcher.dart';

class FormComponent extends GetView<LoginController> {
  const FormComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return NitroScaffoldSidebar(
      isExpanded: true,
      navIcon: "${AppConfig.assetBaseUrl}images/logo.png",
      navLogo: "${AppConfig.assetBaseUrl}images/logo-full.png",
      navItem: [
        NitroSidebarItem(
          icon: FontAwesomeIcons.houseChimney,
          name: "HOME",
          onTap: () {},
          child: [
            NitroSidebarItem(
              name: "Dashboard Light",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Dashboard Dark",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Dashboard 2",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Projects",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Contact",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Kanban",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Message",
              onTap: () {},
            ),
          ],
        ),
        NitroSidebarItem(
          icon: FontAwesomeIcons.gear,
          name: "CMS",
          onTap: () {},
          child: [
            NitroSidebarItem(
              name: "Content",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Add Content",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Menus",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Email Template",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Add Email",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Blog",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Add Blog",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Blog Category",
              onTap: () {},
            ),
          ],
        ),
        NitroSidebarItem(
          icon: FontAwesomeIcons.user,
          name: "PROFILE",
          onTap: () {},
          child: [
            NitroSidebarItem(
              name: "Overview",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Projects",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Projects Details",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Campaigns",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Documents",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Followers",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Activity",
              onTap: () {},
            ),
          ],
        ),
        NitroSidebarItem(
          icon: Icons.window_outlined,
          name: "ACCOUNT",
          onTap: () {},
          child: [
            NitroSidebarItem(
              name: "Overview",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Settings",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Security",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Activity",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Billing",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Statements",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Referrals",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Api Keys",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Logs",
              onTap: () {},
            ),
          ],
        ),
        NitroSidebarItem(
          name: "COMPONENTS",
          onTap: () {},
          isDividerLabel: true,
        ),
        NitroSidebarItem(
          icon: FontAwesomeIcons.globe,
          name: "Bootstrap",
          onTap: () {},
          child: [
            NitroSidebarItem(
              name: "Accordian",
              onTap: () {
                Get.toNamed(AppRouteNames.accordianBootstrap);
              },
            ),
            NitroSidebarItem(
              name: "Alert",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Badge",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Button",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Modal",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Button Group",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "List Group",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Cards",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Carousel",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Dropdown",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Popover",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Progressbar",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Tab",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Typography",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Pagination",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Grid",
              onTap: () {},
            ),
          ],
        ),
        NitroSidebarItem(
          icon: FontAwesomeIcons.scroll,
          name: "Forms",
          isActive: true,
          onTap: () {},
          child: [
            NitroSidebarItem(
              isActive: true,
              name: "Form Elements",
              onTap: () {
                Get.toNamed(AppRouteNames.formComponent);
              },
            ),
            NitroSidebarItem(
              name: "Wizard",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "CkEditor",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Pickers",
              onTap: () {},
            ),
            NitroSidebarItem(
              name: "Form Validate",
              onTap: () {},
            ),
          ],
        ),
      ],
      headerTitle: "Form Element",
      headerNav: [
        SizedBox(
          width: 300,
          child: FormInput(
            isPassword: false,
            suffix: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                overlayColor: Colors.transparent,
                alignment: Alignment.center,
                fixedSize: const Size(50, 50),
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const FaIcon(
                FontAwesomeIcons.searchengin,
                size: 15,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        const LightDarkSelector(),
        const SizedBox(width: 10),
        NitroButton.largeButton(
          onPressed: () {},
          isShowBadge: true,
          badgeString: "18",
          child: [
            const Icon(
              FontAwesomeIcons.bell,
              size: 20,
              color: Color.fromRGBO(113, 117, 121, 1),
            )
          ],
          style: const NitroButtonStyle(
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            borderColor: Color.fromRGBO(238, 240, 247, 1),
            badgeColor: Color.fromRGBO(0, 116, 255, 1),
            badgeTextColor: Colors.white,
            elevation: 1,
            borderRadius: 10,
          ),
        ),
        const SizedBox(width: 10),
        NitroButton.largeButton(
          onPressed: () {},
          isShowBadge: true,
          badgeString: "27",
          child: [
            const Icon(
              FontAwesomeIcons.envelopesBulk,
              size: 20,
              color: Color.fromRGBO(113, 117, 121, 1),
            )
          ],
          style: const NitroButtonStyle(
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            borderColor: Color.fromRGBO(238, 240, 247, 1),
            badgeColor: Color.fromRGBO(28, 36, 48, 1),
            badgeTextColor: Colors.white,
            elevation: 1,
            borderRadius: 10,
          ),
        ),
        const SizedBox(width: 10),
        NitroButton.largeButton(
          onPressed: () {},
          isShowBadge: true,
          badgeString: "2",
          child: [
            const Icon(
              FontAwesomeIcons.calendar,
              size: 20,
              color: Color.fromRGBO(113, 117, 121, 1),
            )
          ],
          style: const NitroButtonStyle(
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            borderColor: Color.fromRGBO(238, 240, 247, 1),
            badgeColor: Color.fromRGBO(1, 189, 155, 1),
            badgeTextColor: Colors.white,
            elevation: 1,
            borderRadius: 10,
          ),
        ),
        const SizedBox(width: 10),
        NitroButton.largeButton(
          onPressed: () {},
          child: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "${AppConfig.assetBaseUrl}images/user.jpg",
                height: 40,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "Administrator",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Color.fromRGBO(254, 255, 254, 1),
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              FontAwesomeIcons.bars,
              size: 15,
              color: Color.fromRGBO(254, 255, 254, 1),
            ),
          ],
          style: const NitroButtonStyle(
            backgroundColor: Color.fromRGBO(0, 116, 255, 1),
            elevation: 1,
            borderRadius: 10,
          ),
        ),
      ],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: NitroRow(
          gutter: 5,
          children: [
            const NitroRowContainer(
              normalCol: NitroFlex.flex12,
              child: NitroBreadcrumb(
                naviList: [
                  NitroBreadcrumbItem(title: "Form"),
                  NitroBreadcrumbItem(title: "Element"),
                ],
              ),
            ),
            NitroRowContainer(
              normalCol: NitroFlex.flex6,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
