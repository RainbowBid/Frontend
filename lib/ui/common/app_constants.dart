import 'dart:ui';

/// The max width the content can ever take up on the screen
const double kdDesktopMaxContentWidth = 1150;

// The max height the homeview will take up
const double kdDesktopMaxContentHeight = 750;

const double kdFieldBorderRadius = 12.5;
const double kdTitleSize = 25;
const double kdSubtitleSize = 15;
const double kdButtonTextSize = 15;
const kButtonSize = Size(double.infinity, 50);
const double kdFieldValidationFontSize = 12;
const double kdFieldLabelFontSize = 15;
const double kdFormWidthFraction = 0.5;
const double kdPagePadding = 40;
const double kdFormPadding = 20;

const String ksRegisterKey = 'registerKey';
const String ksLoginKey = 'loginKey';
const String ksCreateItemKey = 'createItemKey';

// validator constants
const int kiMinUsernameLength = 3;
const int kiMaxUsernameLength = 30;
const krPasswordPattern =
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{6,}$';
const krEmailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

const int kiMinItemBriefLength = 3;
const int kiMaxItemBriefLength = 30;
const int kiMinItemDescriptionLength = 3;
const int kiMaxItemDescriptionLength = 255;

// sidebar
const int kiSidebarHomeMenuIndex = 0;
const int kiSidebarRegisterMenuIndex = 1;
const int kiSidebarLoginMenuIndex = 2;
const int kiSidebarCreateItemMenuIndex = 2;

const double kdSidebarPadding = 10;
const double kdSidebarShapeRadius = 20;
const double kdSidebarItemPadding = 30;
const double kdSidebarSelectedItemPadding = 30;
const double kdSidebarItemShapeRadius = 10;
const double kdSidebarSelectedItemShapeRadius = 10;
const double kdSidebarSelectedItemBlurRadius = 30;
const double kdSidebarItemIconSize = 20;
const double kdSidebarSelectedItemIconSize = 20;
const double kdSidebarExtendedWidth = 200;
const double kdSidebarHeaderHeight = 100;
const double kdSidebarHeaderPadding = 16;
const double kdSidebarAvatarShapeRadius = 30;
const double kdSidebarHeaderImageWidth = 100;
const double kdSidebarAvatarImagePadding = 8;

const String ksSidebarHomeMenuText = 'Home';
const String ksSidebarRegisterMenuText = 'Register';
const String ksSidebarLoginMenuText = 'Login';
const String ksSidebarLogoutMenuText = 'Logout';
const String ksSidebarCreateItemMenuText = 'Create item';

// assets
const String ksLogoAssetPath = 'assets/images/rainbowbid_logo.jpeg';
