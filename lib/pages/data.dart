import 'package:flutter/material.dart';
import 'package:minhhung2556/generated/assets.dart';

const kScreenPadding = 24.0;
const kItemPadding = 16.0;
const kBorderRadiusSmall = 8.0;
const kBorderRadius = 16.0;
const kIconSize = 32.0;
const kItemColor = const Color(0x08ffffff);
final kColorTween12 = ColorTween(begin: Colors.white, end: Colors.black);

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
    'i': 'https://hoanhap.vn/uploads/photos/40/2-9/5f6ea66fed9fe.jpg',
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
    'i':
        'https://play-lh.googleusercontent.com/1vYJL7AazCUYnp317d4dWb-3Dfa9Mv5IPSPnQh88UAK8ZQE8LW9XkVRpL-6x440Zcg=w3584-h2018-rw',
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
    'i':
        'https://play-lh.googleusercontent.com/29JuGgFCHDnSn_yI3zW68B2U9Qh6LAjuDuu9ZUoovHBfIpKqi8cUhsmmZvs7mKi2GCyI=w3584-h2018-rw',
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
    'i':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShVYoMxykZG_7pKFaj-_61crTPgo0cp5869-ToLROHZvQt3OG9zUWKbaM2jdwPBMlBoBE&usqp=CAU',
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
    'i':
        'http://static.gamehub.vn/img/files/2015/08/17/gamehubvn-diem-mat-gmo-dong-cua-2015.jpg',
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
