import 'package:flutter/material.dart';
import 'package:minhhung2556/generated/assets.dart';

const kMyName = "Lương Đỗ Minh Hưng";
const kMyTitle =
    "\nA Romantic Mobile Application/Game developer, a friendly daddy, a motivating leader, a funny friend, and a handsome husband. :D";
const kSummaryData = <String>[
  "Making The Mobile Application Development be more romantic is my passion.\n\n",
  "\n\nBased in Ho Chi Minh City, I code and design things for Mobile.\n\n",
  "I have a demonstrated history of working in Mobile Development. With more than 8 years of working experience and deep knowledge in mobile as well as team management skills, I believe I will contribute my best to my next great product.",
];
const kSkillData = <Map<String, dynamic>>[
  {
    'i': Assets.assetLogoflutter,
    't': 'Flutter',
    'd':
        "Researched and learned Flutter since May 2018, hands on developing a lot of big features in one of biggest E-commerce in Viet Nam, at Sendo. Leaded and trained a strong Flutter Dev Team at that company."
  },
  {
    'i': Icons.android,
    't': 'Android',
    'd':
        "Started working on Android since 2013, hands on developing and releasing some Android applications, such as Social Network, Payment SDK. And then started leading a Android team since 2015."
  },
  {
    'i': Assets.assetLogoapple,
    't': 'iOS',
    'd':
        "Learned since 2014, but until 2019 I've released my first iOS application. I'm not have many experiences in iOS development, but know how to work with it :D."
  },
  {
    'i': Icons.mobile_friendly,
    't': 'Mobile',
    'd':
        "Mobile Application development is my passion. Since the first time I owned a smartphone in 2008, my first java mobile phone. In 2012, by self learning in J2ME development. I got my first job by my Dictionary App and Pikachu Kawai game."
  },
  {
    'i': Icons.people,
    't': 'Leadership',
    'd':
        "Leading people is one of my best. Every group I'm in to play or work, everything go on by my requests."
  },
  {
    'i': Icons.model_training,
    't': 'Others',
    'd':
        "Many of my team members and friends are a key member/leader/trainer who got high performance in work. That's is my happiness. Helping people grow up and make life better."
  },
];
const kWorksData = <Map<String, dynamic>>[
  {
    'c': 'HomeCredit.vn',
    'd': '12/2020 - now',
    't': 'Senior Mobile Developer',
    'i': Assets.assetWorkHomecredit,
    'ls': [
      {
        'n': 'Android',
        'l': 'https://play.google.com/store/apps/details?id=vn.homecredit.hcvn',
      },
      {
        'n': 'iOS',
        'l': 'https://apps.apple.com/vn/app/home-credit-vietnam/id1167077808',
      },
      {
        'n': 'Website',
        'l': 'https://homecredit.vn',
      },
    ],
  },
  {
    'c': 'Sendo.vn',
    'd': '05/2018 - 12/2020',
    't': 'Mobile Team Leader',
    'i': Assets.assetWorkSendo,
    'ls': [
      {
        'n': 'Android',
        'l': 'https://play.google.com/store/apps/details?id=com.sendo',
      },
      {
        'n': 'iOS',
        'l': 'https://apps.apple.com/VN/app/id940313804?mt=8',
      },
      {
        'n': 'Website',
        'l': 'https://sendo.vn',
      },
    ],
  },
  {
    'c': 'SenPay.vn',
    'd': '05/2017 - 05/2018',
    't': 'Android Team Leader',
    'i': Assets.assetWorkSenpay,
    'ls': [
      {
        'n': 'Android',
        'l': 'https://play.google.com/store/apps/details?id=vn.senpay',
      },
      {
        'n': 'iOS',
        'l': 'https://apps.apple.com/vn/app/senpay-vn/id1276466893',
      },
      {
        'n': 'Website',
        'l': 'https://senpay.vn',
      },
    ],
  },
  {
    'c': 'iCareBenefits',
    'd': '06/2015 - 06/2016',
    't': 'Android Team Leader',
    'i': Assets.assetWorkIcarebenefits,
    'ls': [
      {
        'n': 'Android',
        'l': 'https://play.google.com/store/apps/dev?id=6752486900782105869',
      },
      {
        'n': 'iOS',
        'l': 'https://apps.apple.com/vn/developer/mobivi/id1097030106',
      },
      {
        'n': 'Website',
        'l': 'https://icarebenefits.vn',
      },
    ],
  },
  {
    'c': 'ME Corp',
    'd': '06/2012 - 06/2015',
    't': 'Senior Game Developer',
    'i': Assets.assetWorkMecorp,
    'ls': [
      {
        'n': 'Android',
        'l': 'https://mecorp.vn',
      },
      {
        'n': 'iOS',
        'l': 'https://mecorp.vn',
      },
      {
        'n': 'Website',
        'l': 'https://mecorp.vn',
      },
    ],
  },
];

const kSocialData = <Map<String, dynamic>>[
  {
    'i': Assets.assetIcMedium,
    'l': 'https://minhhung2556.medium.com/',
  },
  {
    'i': Assets.assetIcDartpub,
    'l': 'https://pub.dev/packages?q=email%3Aminhhung2556%40gmail.com',
  },
  {
    'i': Assets.assetIcGitlab,
    'l': 'https://gitlab.com/romantic_project',
  },
  {
    'i': Assets.assetIcGithub,
    'l': 'https://github.com/minhhung2556',
  },
  {
    'i': Assets.assetIcLinkedin,
    'l': 'https://www.linkedin.com/in/hungldm/',
  },
  {
    'i': Assets.assetIcFacebook,
    'l': 'https://www.facebook.com/luongdominhhung',
  },
  {
    'i': Assets.assetIcGmail,
    'l': 'mailto:minhhung2556@gmail.com',
  },
  {
    'i': Assets.assetIcSkype,
    'l': 'https://join.skype.com/invite/aQ1WVNVCMHIa',
  },
];

const kCopyrightData = <String>[
  " © 2021 ",
  kMyName,
  ". All rights reserved.\n\n",
  "Thank ",
  'Md Sojon Islam',
  'https://www.behance.net/sojonatbe',
  " for an awesome portfolio design.\n",
  "Thank ",
  'Apple Inc',
  " for the idea.",
];