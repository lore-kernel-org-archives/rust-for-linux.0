Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50841C433ED
	for <rust-for-linux@archiver.kernel.org>; Wed, 21 Apr 2021 01:26:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 118CF61409
	for <rust-for-linux@archiver.kernel.org>; Wed, 21 Apr 2021 01:26:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233879AbhDUB0k (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 20 Apr 2021 21:26:40 -0400
Received: from mx0b-000e8b02.pphosted.com ([148.163.152.188]:63162 "EHLO
        mx0b-000e8b02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233874AbhDUB0j (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 20 Apr 2021 21:26:39 -0400
X-Greylist: delayed 2705 seconds by postgrey-1.27 at vger.kernel.org; Tue, 20 Apr 2021 21:26:39 EDT
Received: from pps.filterd (m0095968.ppops.net [127.0.0.1])
        by mx0b-000e8b02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13L0cgE5030994
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Apr 2021 19:41:01 -0500
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
        by mx0b-000e8b02.pphosted.com with ESMTP id 3828rd0268-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Apr 2021 19:41:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzeyFZiRs0qqHkipxoVQ4kVU3IzmeWp2MTs4IVculM7Wygfg7yWIdJIWz6iuo/wsvqOKtH4Uc75MVJ4gwu/mnrKg0zzA3davS9C4Cnll2u22B2pUdwec0WdBkdfW2TdRlF9nZBP3Z6ByaH6fsLTwR45FQkVfSqlac/PZDBbWV+cA+wZX0uu6EgfC4s+XMKfxq6ki49sFWJDc4TLF8iLDj2DAAa4RQoeAp4ybbKE4sMOPVIWZ0e+NW0oH4Lv4+yaDkMMFN+5Av1P4Sqs04Fsq8xgXocw8PTmD/4rud1F7co5qep+ZwQkrdfUolMFJey7Z/TKm88L9LJpT8mxxV9ZMXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drBE7jF+yHqxmm/1mpROjEpv+hFgiH++6nPEJcmwTjw=;
 b=RyFS+hXOgN+Khtn6Y8XByMLmtbA/Og1Ki0w5wc8eMZ16caoGyzUIKFWImsGMpEvbGIW/BFOXkS/B9vqu2J+O8aP0FKR0mN+cczOit3t/ZgS+xOvlJXLddp+FCXolru2BCxK0TFdPzRBxBZbeHgJSw80T4fuqEPNujxjdHDutxlp3EVhqrlBqi3HXBEJ0J4uZoIwCy8c/IahshvWlHHE7y7axWbcD7/uUG7ri1IITEK7RLgGtts8FB35flq73HRFsfTUAKF72wMo3NpUjVyVO0H29Vo17wxoJ3xXkWWQqKgHOg4gtrzbJYAJZg8s2oFs/8REtBYleFpEdAbSD6QUgqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=activenetwork.com; dmarc=pass action=none
 header.from=activenetwork.com; dkim=pass header.d=activenetwork.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=activenetwork.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drBE7jF+yHqxmm/1mpROjEpv+hFgiH++6nPEJcmwTjw=;
 b=L1dEW89gOUi4ri8+Ob+9kZk7w3ZjjfWlNqWvB8nXzsfmEWlfO2hTQmcSGodH+cqGFyrnyHgT5VQaUxSLuA32Q1oHcor3Jnm2+lAXOvTeF1iJZgxouIQ7dykMuw3P1L/jrUjnx7BTJCdYQRCKdiFv+m4zTQsUhkfaMVYGusoRT2w=
Received: from BY5PR16MB3110.namprd16.prod.outlook.com (2603:10b6:a03:185::24)
 by BY5PR16MB3427.namprd16.prod.outlook.com (2603:10b6:a03:194::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 21 Apr
 2021 00:40:59 +0000
Received: from BY5PR16MB3110.namprd16.prod.outlook.com
 ([fe80::5847:a20:6e29:d1b7]) by BY5PR16MB3110.namprd16.prod.outlook.com
 ([fe80::5847:a20:6e29:d1b7%5]) with mapi id 15.20.4042.025; Wed, 21 Apr 2021
 00:40:58 +0000
From:   "Chen, Herbert" <Herbert.Chen@activenetwork.com>
To:     "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: hello
Thread-Topic: hello
Thread-Index: AQHXNkbU73qH3H0qn0699cLqnwKVuw==
Date:   Wed, 21 Apr 2021 00:40:58 +0000
Message-ID: <BY5PR16MB311024F4BD76CAC678CE647F97479@BY5PR16MB3110.namprd16.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=activenetwork.com;
x-originating-ip: [182.149.135.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2e106fd-867b-4d53-1f5e-08d9045e21ab
x-ms-traffictypediagnostic: BY5PR16MB3427:
x-microsoft-antispam-prvs: <BY5PR16MB34278B9A4D3BBD1692042EA197479@BY5PR16MB3427.namprd16.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JkEH+dm7aDD7YGLCa+3lRMyhxwcYSbRNEay1LmnAPFJt8wz1O1GcOzKA7n2hwvHNfkNvcjpI2CeeS1l7cf7rAMT3wpwnhZvRxy2gOcOAEo1VIH7MD/NkGh3lcCVx7qlHn88hF71vVASYSmM8HAnACyQy/KRY2ra5iEIHyOILJ02wVLPmftJU1MMsI/ae56ITMcsCf5ReTEOpevIj/jR3gS8hwwUBl44slXJ8+zvM3ji3JfZ7E8KRTOW8AKHbQytC+QdcncfMfEWf9l5xcKXS40YyxayNyxIrpeRJIrIW9RgIaPGcGqQ/MDuop164fuhewGkdD3FhVWLe6aPMTvczU1hJWDHJ3FAjvtFGIMYz9DxUIlsEuQYEG1SgjCKynWz5JGNnRTxy5/LV8f4hqJrilL3fmGglh1HeL/y+7ldom/Np5TqnU6HCwX3hDub9ZxVXQUs4G7M59nTcAM7mrjcJSTXTztyGbF5aIcDSemyiP2JPZnrHIPDfw+2wwb/0C3UVdtkbbNcjlndIPQMnxhpF76bnLlN2hwJeOgOP/87uCzzzfwDZ5z0k1GcpE2bxit8qJMFLqf3v72ahysUgzIDhjMEpjQLmYX7H+KYZgyS2A0EV6K9xh17qGaIy8dKtpHyL9ZQdevabNTTwu4LO+ux4VF/GH1Er/aC0zWGGD4YPkg+2u71ERZytmwiW14eatlsuaZO9iQiSclOqyYaoLJLQoA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR16MB3110.namprd16.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39850400004)(346002)(136003)(376002)(366004)(5660300002)(122000001)(558084003)(8936002)(8676002)(19618925003)(66476007)(52536014)(9686003)(71200400001)(66446008)(66946007)(7116003)(64756008)(86362001)(3480700007)(33656002)(66556008)(7696005)(2906002)(4270600006)(38100700002)(55016002)(316002)(76116006)(26005)(6916009)(6506007)(186003)(478600001)(91956017)(14353004)(220243001)(204593002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Wr7FegcUUDaiWecC5iwe9B4EGzcGml0aJ9xMZdVKmzm1bxa5IscXyo9UHExe?=
 =?us-ascii?Q?d2Z9UlbCb+NfOwRTYjw8b8G1AhmLLqsZ7zop8DeviPVC+xeLzNy2F8Bc+jxf?=
 =?us-ascii?Q?3BHMu0OI8phwVDYbetgo4JtLt4FY1m+GEOKRf7nIAmWqBnrQ/9jPHg6l86yQ?=
 =?us-ascii?Q?fLLbeTM3OgW4jppnGiE+Wc/IhJr3F2sgEvJUNB6Y1nOApcL22Gn131yYxUYb?=
 =?us-ascii?Q?TPCNJZivSEgjyeuQd16e0UtNur83SmQwuZEVK8SUDN53bXCrdhK9MpbFvjPN?=
 =?us-ascii?Q?b+053TeHiYfC+B4jibKnMIZWzg/IwFceU7Ha4l8ggi1fw8FpjS1VRCq7xEIJ?=
 =?us-ascii?Q?isfCod+bKR6Ux5pv9hsd+/i0hDNCoAz1ZreVs2x7FJxPxcqpqzvsut7bDYDf?=
 =?us-ascii?Q?GDk6e/utODaurRg+CUZ+5fTWlQ7Vnu6jN2VDVN3TJcd7xmljIydJ354aLnVV?=
 =?us-ascii?Q?76mGfRqM9R3Yb1eg/NmTbIgb/uakR8QCBCsQv8Fsi6yDd75mNXQ1FeOsIuEz?=
 =?us-ascii?Q?pjb1ikUr9K9ZBZUalN6j3yK7p3hTfSMy9Ag1orycg9027bsOYeJNddLG1CsO?=
 =?us-ascii?Q?0i3eTcBL6dh7OYasr6neJ/E3RcUShxf4dT+AEklxOXaVezzbam2sggRezSZK?=
 =?us-ascii?Q?3ChFozrt3Y/KnDZ0XGlw6lh8BJ8BatVuiiRYKuT+ExwP606b4ZifnAOnvSd7?=
 =?us-ascii?Q?kne/TNY0qRzbvbWehh884ZWpnWfOWA2tmetYU2JEyI3qXEzcwcLEr6IAP2Hc?=
 =?us-ascii?Q?xGkzy/oh5rGYw5U0rBk86MngC2q4Sbb3fAgCigEblp+CabFADDN1ergt4x6q?=
 =?us-ascii?Q?5fpzdjkrYTLxox9izq++Gs8RRHhRFRHVQqVFcSsUMREauO/ZFwo+PS/Ioz4n?=
 =?us-ascii?Q?TkUGJmjLZkgiR3jjEb3Du59j6DLduYevAXfwIpx6qwcwhTqGIbhxiFIIXjmh?=
 =?us-ascii?Q?tvOD9/4YdBi/u6YkqzKjPSZZImAbU63PmpVeN1QpKsusYtdbcnU8EMiK75Ax?=
 =?us-ascii?Q?twvxX62k1/j2GlXmYUSaWTWLN4oyrvS0lLykePUN5guT54hnFfkrzFwdlGur?=
 =?us-ascii?Q?TEIsFaU1i+SwwZJMGdqq7WBjHrs1wfNuWl3IffvQq/APjBFsVY8jleWBmyUj?=
 =?us-ascii?Q?vYlBN/qUU1aXiU95dlw027YBj5BnIayids8LkQgc9mxyR8/xE2QiNGgI+6F4?=
 =?us-ascii?Q?iqZYfniKmXoUfZ9X0V5rwzbhnwPN6MKkSbmp5Uc5Bok8FHCjUN996ErtuG4F?=
 =?us-ascii?Q?LdXZHK1cdWSHO2ow/7YfbG09M4WxRhuUqtgLkHgWrRHuyjxFsqNioeApF3U3?=
 =?us-ascii?Q?L16yWU+st3P5uWSW7CoAJigcAfxPLaI+NUUK+CF4SytIrg=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: activenetwork.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR16MB3110.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e106fd-867b-4d53-1f5e-08d9045e21ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2021 00:40:58.6986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0c349e3f-1ac3-4610-8599-9db831cbaf62
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QQhOijtJedmMA7o7klu+qTvLJf7Bh+zok116awB5SlrlvlhF3YEjjbYnfv86omcHWMi96w4np98jDRkrfxJaAWp2o1qDSM9yfnUu40NUGd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR16MB3427
X-Proofpoint-GUID: C5HXssrWgPQ1Z5Gt8HpqLX-Q2xxkKoOX
X-Proofpoint-ORIG-GUID: C5HXssrWgPQ1Z5Gt8HpqLX-Q2xxkKoOX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-20_11:2021-04-20,2021-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=276 spamscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104210003
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

subscribe rust-for-linux
