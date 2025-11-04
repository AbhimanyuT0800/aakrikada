import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ml.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
    Locale('ml'),
  ];

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'AAKRI KADA'**
  String get title;

  /// No description provided for @slogan.
  ///
  /// In en, this message translates to:
  /// **'RECYCLE FOR A BETTER PLANET'**
  String get slogan;

  /// No description provided for @selectLang.
  ///
  /// In en, this message translates to:
  /// **'Select language'**
  String get selectLang;

  /// No description provided for @poweredBy.
  ///
  /// In en, this message translates to:
  /// **'Powered by KSMA'**
  String get poweredBy;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'GET STARTED'**
  String get getStarted;

  /// No description provided for @hiThere.
  ///
  /// In en, this message translates to:
  /// **'HI There'**
  String get hiThere;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Aakrikada !'**
  String get welcomeMessage;

  /// No description provided for @phoneNbr.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNbr;

  /// No description provided for @enterPhnNbr.
  ///
  /// In en, this message translates to:
  /// **'Enter your Phone Number'**
  String get enterPhnNbr;

  /// No description provided for @continueTo.
  ///
  /// In en, this message translates to:
  /// **'CONTINUE'**
  String get continueTo;

  /// No description provided for @phnNbrError.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid mobile number'**
  String get phnNbrError;

  /// No description provided for @verifyOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOtp;

  /// No description provided for @resendOtp.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resendOtp;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @hi.
  ///
  /// In en, this message translates to:
  /// **'HI'**
  String get hi;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Our categories'**
  String get categories;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @iron.
  ///
  /// In en, this message translates to:
  /// **'Iron'**
  String get iron;

  /// No description provided for @newsPaper.
  ///
  /// In en, this message translates to:
  /// **'News Paper'**
  String get newsPaper;

  /// No description provided for @electrolic.
  ///
  /// In en, this message translates to:
  /// **'Electronic'**
  String get electrolic;

  /// No description provided for @plastic.
  ///
  /// In en, this message translates to:
  /// **'Plastic'**
  String get plastic;

  /// No description provided for @others.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get others;

  /// No description provided for @myProducts.
  ///
  /// In en, this message translates to:
  /// **'My Products'**
  String get myProducts;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @myAc.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get myAc;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// No description provided for @myAdress.
  ///
  /// In en, this message translates to:
  /// **'My Address'**
  String get myAdress;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logOut;

  /// No description provided for @myOders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOders;

  /// No description provided for @accepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get accepted;

  /// No description provided for @created.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get created;

  /// No description provided for @createAd.
  ///
  /// In en, this message translates to:
  /// **'CREATE AN AD '**
  String get createAd;

  /// No description provided for @latestList.
  ///
  /// In en, this message translates to:
  /// **'Latest Listing'**
  String get latestList;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get selectCategory;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @briefSummary.
  ///
  /// In en, this message translates to:
  /// **'Brief summary of your items'**
  String get briefSummary;

  /// No description provided for @approxNbr.
  ///
  /// In en, this message translates to:
  /// **'Approx. no. of Items'**
  String get approxNbr;

  /// No description provided for @priority.
  ///
  /// In en, this message translates to:
  /// **'Priority'**
  String get priority;

  /// No description provided for @userInfo.
  ///
  /// In en, this message translates to:
  /// **'User Information'**
  String get userInfo;

  /// No description provided for @chooseAdress.
  ///
  /// In en, this message translates to:
  /// **'Choose Address'**
  String get chooseAdress;

  /// No description provided for @preferrrdPickup.
  ///
  /// In en, this message translates to:
  /// **'Preferred pickup time'**
  String get preferrrdPickup;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'CREATE'**
  String get create;

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get orderDetails;

  /// No description provided for @quotes.
  ///
  /// In en, this message translates to:
  /// **'Quotes'**
  String get quotes;

  /// No description provided for @selected.
  ///
  /// In en, this message translates to:
  /// **'SELECTED'**
  String get selected;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'UPDATE'**
  String get update;

  /// No description provided for @addAddress.
  ///
  /// In en, this message translates to:
  /// **'Add Address'**
  String get addAddress;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm !'**
  String get confirm;

  /// No description provided for @confirmLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure to logout from the app?'**
  String get confirmLogout;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'NO'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'YES'**
  String get yes;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Login Successful'**
  String get loginSuccess;

  /// No description provided for @town.
  ///
  /// In en, this message translates to:
  /// **'Town'**
  String get town;

  /// No description provided for @district.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get district;

  /// No description provided for @area.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// No description provided for @saveAddress.
  ///
  /// In en, this message translates to:
  /// **'Save Address'**
  String get saveAddress;

  /// No description provided for @fillAlltheFields.
  ///
  /// In en, this message translates to:
  /// **'Fill all the fields'**
  String get fillAlltheFields;

  /// No description provided for @errorAddress.
  ///
  /// In en, this message translates to:
  /// **'Error getting your location ..Try again'**
  String get errorAddress;

  /// No description provided for @noAddressFound.
  ///
  /// In en, this message translates to:
  /// **'No address found'**
  String get noAddressFound;

  /// No description provided for @chooseProfile.
  ///
  /// In en, this message translates to:
  /// **'Choose profile'**
  String get chooseProfile;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterEmail;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @enterValidemail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get enterValidemail;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterName;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameRequired;

  /// No description provided for @nameHave3Char.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 3 characters'**
  String get nameHave3Char;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi', 'ml'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'ml':
      return AppLocalizationsMl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
