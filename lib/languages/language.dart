import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  ///************** Common String get  **************///

  String get isLoading;
  String get appName;

  ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= laungauge screen =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  String get chooseLanguage;

  String get english;

  String get saudiArabia;

  String get arabic;

  ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= Intro screen =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  String get skip;

  String get next;

  String get living;

  String get weAre;

  String get weAlso;

  String get getStarted;
  String get pleaseFollowToBus;
  String get errorOwnReport;
  String get errorOwnMsg;
  String get errorOwnFollow;

  ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= Login screen =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  String get signUp;

  String get loginTo;

  String get email;

  String get password;

  String get forgetPassword;

  String get login;

  String get continueAs;

  String get clickHere;

  ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= forgot password screen =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  String get enterYour;

  String get demoMail;

  ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= OTP screen =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  String get enterDigit;

  String get codeSend;

  String get didntRecive;

  String get resend;

  String get codeToNumber;

  ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= Reset password screen =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  String get reset;

  String get enterA;

  String get newPassword;

  String get confirmNewPassword;

  ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= congratulation screen =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  String get congrats;

  String get resetSuccessful;

  String get yourProfile;

  String get back;

  ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= Reset password screen =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  String get welcome;

  String get business;

  String get user;

  ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= signup screen =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  String get signupFor;

  String get iAgree;

  String get termsAndConditions;

  String get privacyPolicy;

  String get createAccount;

  String get orCountinue;

  String get google;

  String get apple;

  String get confirmPassword;
  String get pleaseEnterCoin;
  String get pleaseEnterValidCoin;
  String get notsufficientCoin;

  ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= create account screen =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  String get upload;

  String get fromGallery;

  String get takePhoto;

  String get tapTo;

  String get chooseGender;

  String get male;

  String get female;

  String get firstName;

  String get lastName;

  String get dateOfBirth;

  String get gender;

  String get done;

  String get mobileNumber;

  ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= Set location screen =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  String get setLocation;

  String get thisData;

  String get yourLocation;

  String get allowLocation;

  String get editLocation;

  String get address;
  String get urlNotFound;
  String get urlIsNotValid;
  String get guestError;
  String get storyError;

  ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= home screen =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  String get location;

  String get discount;

  String get friends;

  String get trending;

  String get hotel;

  String get restaurant;

  String get cafe;

  String get hospital;

  String get vegan;

  String get veganFood;

  String get follow;
  String get following;

  ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= hotel detail screen =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  String get twoK;

  String get fiveK;

  String get foodDrink;

  String get followers;

  String get coinsValue;

  String get coins;

  String get bio;

  String get storiesBy;

  String get message;

  String get offerDetail;

  String get moreInfo;

  String get media;

  String get amenities;

  String get freeParking;

  String get freeWifi;

  String get petsAllowed;

  String get swimmingPool;

  String get kidsAllowed;

  String get onterInfo;

  String get addres;

  String get getDirection;

  String get call;

  String get phoneNumber;

  String get viewMenu;

  String get visitWeb;

  String get webSite;

  String get reportAnIssue;

  ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= story screen =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

  String get avaGill;

  String get avaGill123;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Setting  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get setting;

  String get myAccount;

  String get myQRCode;

  String get updateInformation;

  String get previewProfile;

  String get blockUser;

  String get changeInfo;

  String get changeLocation;

  String get changePassword;

  String get changeLanguage;

  String get billingInformation;

  String get paymentMethod;

  String get wallet;

  String get membershipCard;
  String get membershipCardValidetion;

  String get termsAndPolicy;

  String get termsAndCondition;

  String get support;

  String get suggestion;

  String get reportAdvert;

  String get accountActions;

  String get deleteAccount;

  String get logout;

  String get advertisement;

  String get cloudPromotion;

  String get adsMangemant;

  String get verifyYourAccount;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Setting - My Qr Code >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get scanQRCode;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Setting - My Qr Code >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get idNumber;

  String get bioData;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Setting - Block User >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get allUser;

  String get blockedUser;

  String get searchFriends;

  String get noUserFound;

  String get block;
  String get cancel;

  String get unBlock;

  String get changeYourLocation;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Setting - Change Password >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get oldPassword;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Setting - Billing Information >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get addNewCard;

  String get addNewCardTitle;

  String get otherCard;

  String get addBankDetail;

  String get cardNumber;

  String get expirationDate;

  String get securityCode;

  String get cardHolderName;

  String get saveCardMsg;

  ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= search screen =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

  String get searchFor;
  String get searchForCountry;
  String get search;
  String get searchType;

  String get popularStore;

  String get viewAll;

  String get hotGrill;

  String get hotGrillTag;

  String get loveCookies;

  String get loveCookiesTag;

  String get indianFood;

  String get indianFoodTag;

  String get amyKelly;

  String get amyTag;

  String get alexander;

  String get alexanderTag;

  String get benjamin;

  String get benjaminTag;

  String get burger;

  String get burgerTag;

  String get foodLover;

  String get foodLoverTag;

  String get searchStore;
  String get searchCategory;
  String get searchStoreFriend;

  String get noOfFriends;

  String get brandon;

  String get brandonTag;

  String get claire;

  String get claireTag;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disount Screen >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  String get indianFoodTwo;

  String get indianFoodTwoTag;

  String get promote;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disount Screen >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get promoteStory;

  String get uploadIn;

  String get mentionThe;

  String get sendPrivately;

  String get andSend;

  String get send;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< friends Screen >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get findYour;

  String get stories;

  String get share;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< massage Screen >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get chat;

  String get report;

  String get areYou;

  String get thisUser;

  String get thesePhotos;

  String get feelsLike;

  String get thisUserIs;

  String get imNot;

  String get submit;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< massage Screen >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get subscribeMinus;

  String get toView;

  String get subscription;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< duration Screen >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  String get howMany;

  String get howManyDays;

  String get howManyOffer;

  String get bonusWill;

  String get bonusCoin;

  String get payPromote;

  String get duration;
  String get to;
  String get dayss;

  String get budget;
  String get budgetSR;

  String get months;

  String get days;

  String get perDay;

  String get totalPrice;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Settings - Wallet >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get buyCoin;

  String get convertCoin;

  String get transferBalance;

  String get balance;

  String get myCoins;

  String get myBalance;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Settings - Buy Coins >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get largeCoins;

  String get mediumCoins;

  String get smallPack;

  String get aDressPack;

  String get coins150;

  String get coins30;

  String get coins6;

  String get coins1;

  String get cardNo;

  String get checkOut;

  // String get totalPrice;
  String get useBalance;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Settings - Convert Coins >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  String get convertPrice;

  String get totalCoins;

  String get totalBalance;

  String get string10;

  String get string9;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Settings - Transfer Balance >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get country;

  String get bankName;

  String get swiftCode;

  String get iban;

  String get province;

  String get city;

  String get street;

  String get agreeMsg;

  // String get submit;
  String get rolesAndRegulation;

  String get yourPayment;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< second story Screen >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get views;

  String get deleteStory;

  String get shareStory;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< cloud home Screen >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  String get cloud;

  String get specialDeal;

  String get visitProfile;

  String get fashionBeauty;

  String get honey;

  String get promotion;

  String get perfums;

  String get hotelVillaRio;

  String get orderNow;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< preview profile Screen >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  String get keithKing;

  String get keithKingTag;

  String get myStories;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< update Information Screen >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  String get webSiteLink;

  String get menuLink;

  String get category;

  String get selectYourCategory;
  String get selectYourSubCategory;

  String get selectYourAmenities;

  String get cafeRestaurant;

  String get villa;

  String get supermarket;

  String get pharmacy;

  String get fashion;

  String get eventsPrograms;

  String get fitnessCenter;

  String get noSmoking;

  String get movieTheatere;

  String get partyHall;

  String get uploadImages;

  String get yourProfileIs;

  String get yourProfileHas;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< preview profile Screen >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  String get notification;

  String get youHave;

  String get youStories;

  String get yourHave;

  String get yourMembership;

  String get date;

  String get avaGillat;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< your story request Screen >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get yourStory;

  String get accept;

  String get decline;

  String get balanceAmmount;

  String get balanceAmmount1;

  String get howManyCoins;

  String get transfer;

  String get successfully;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Local Promotion Screen >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  String get localPromotion;

  String get promotionCampain;

  String get minusMember;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Local Promotion Screen >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get lastUpdate;

  String get ruleNo1;

  String get ruleNo2;

  String get rule1;

  String get rule2;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Settings - Membeship Card >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  String get name;

  String get dob;

  String get validTo;

  String get membershipNo;

  String get activeMinus;

  String get yourPlan;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Settings - Terms & Condition >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get suggestionTitle;

  String get writeHere;

  String get lastUpdated;

  String get summary;

  String get summaryDetail;

  String get terms;

  String get termsDetail;

  String get introduction;

  String get introductionDetail;

  String get managingInfo;

  String get managingInfoDetail;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Settings - Report Advert >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  String get nameOfAdvert;

  String get typeOfProblem;

  String get shortDetail;

  String get attach;

  String get reportJpg;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Settings - Delete Account >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  String get reason1;

  String get reason2;

  String get reason3;

  String get reason4;

  String get reason5;

  String get reason6;

  String get deleteMsg;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Settings - Logout >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  String get logOutMsg;
  String get loginFirst;

  String get logoutBtn;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Settings - Logout >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get selectTheCountry;

  String get c1;

  String get c2;

  String get c3;

  String get c4;

  String get c5;

  String get c6;

  String get c7;

  String get coinsConverted;

  String get transferMsg;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< promotion Campaign -= text filed >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get yourOffer;

  String get noteMessage;

  String get uploadImageAndVideo;

  String get uploadImage;

  String get saveLocation;

  String get enterYourLocation;

  String get thisDataWill;

  String get yourRequest;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ADs Mangemant >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get AdsManagment;

  String get offers;

  String get offersRate;

  String get release;

  String get tapToEdit;

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< cloud promotion -main ADS - upload license >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String get uploadLicense;

  String get uploadLicenseMsg;

  String get addDocumentMsg;

  String get displayYourAd;

  String get myAD;

  String get mainAD;

  String get pickDateMsg;

  String get budgetMsg;

  String get payPromot;

  String get trendTitle;

  String get yourProduct;

  String get t1;

  String get t2;

  String get t3;

  String get t4;

  String get t5;

  String get t6;

  String get verificationAccount;

  String get uploadCommercial;

  String get uploadCommercialMsg;

  String get update;

  String get promoteOnCloud;

  String get tapToImage;

  String get tapToImageAndVideo;

  String get profile;

  String get typeSomthing;

  String get site;

  String get locationSpel;

  String get enterNumber;

  String get pleaseChoose;

  String get ok;

  // =-=-=-=-=-=-=-=-=- FeedBack =-=-==-=-=->>>>>>

  String get unitedArabEmirates;

  String get kuwait;

  String get bahrain;

  String get qatar;

  String get oman;

  String get selectBusiness;

  String get indiaFood;

  String get delete;

  String get phone;

  String get addresStr;

  String get postalCode;

  String get state;

  String get bankAccount;

  String get routingNumber;

  String get updateBankDetails;

  String get identifyNumber;

  String get externalAccount;

  String get externalCurrency;

  String get frontImage;

  String get backImage;

  String get teaSite;

  // =-=-=-=-=-=-=-=-=- Error Strings  =-=-==-=-=->>>>>>
  String get pleaseEnterEmail;

  String get pleaseEnterValidEmail;

  String get pleaseEnterPassword;

  String get pleaseEnterConfirmPassword;

  String get pleaseMatchConfirmPassword;

  String get pleaseEnterValidPassword;

  String get pleaseEnterFirstName;

  String get pleaseEnterLastName;

  String get pleaseEnterdob;

  String get pleaseEnterGender;

  String get pleaseEnterPhoneNumber;
  String get pleaseEnterIdentityNo;
  String get pleaseEnterValidIdentityNo;
  String get pleaseEnterCity;

  String get pleaseEnterCountry;
  String get pleaseSelectCountry;
  String get pleaseEnterState;
  String get pleaseEnterPostalCode;
  String get pleaseEnterBankNo;

  String get pleaseEnterValidPhoneNumber;

  String get pleaseEnterProfile;

  String get iAgreeToTerms;

  String get agreeTermsAndCondition;

  String get agreePolicy;

  String get pleaseEnterWebsite;

  String get pleaseEnterNoteMsg;

  String get pleaseSelectImage;

  String get pleaseTagUser;

  String get pleaseEnterOffer;
  String get pleaseEnterSite;

  String get pleaseCardDetails;

  String get pleaseEnterExpiryDate;

  String get pleaseEnterSecurityCode;

  String get pleaseEnterHolderName;

  String get pleaseEnterCardNo;

  String get pleaseEnterNewPassword;

  String get pleaseMatchPassword;

  String get pleaseEnterOtp;

  String get pleaseEnterValidOtp;
  String get pleaseEnterValidUrl;

  String get pleaseEnterBio;

  String get pleaseEnterIdno;

  String get pleaseEnterSuggection;
  String get pleaseEnterMsg;

  String get pleaseEnterAdvertName;

  String get pleaseEnterLocation;
  String get pleaseWaitLocation;
  String get pleaseEnterDetail;

  String get pleaseEnterProblem;

  String get pleaseEnterWebSiteLink;

  String get pleaseEnterMenuLink;

  String get pleaseEnterRouting;

  String get pleaseEnterRoutingNo;

  String get noDataFound;
  String get noStoryFound;
}
