Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF2FC433B4
	for <rust-for-linux@archiver.kernel.org>; Wed, 21 Apr 2021 07:29:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D2FC6142E
	for <rust-for-linux@archiver.kernel.org>; Wed, 21 Apr 2021 07:29:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234716AbhDUHaJ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 21 Apr 2021 03:30:09 -0400
Received: from mail-eopbgr30070.outbound.protection.outlook.com ([40.107.3.70]:65248
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234885AbhDUHaI (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 21 Apr 2021 03:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rv0eaGxnRwq3btUFEsXhfYEpR6LkLE0AYrW+hIA3ei4=;
 b=wrvh69054x/gkpkVDeKatOMfItGLf1k4NpXN2UfBFnTuhCbyD6GEdWg/kRNusunajpwWHg6nn1bs2RqKfBNgK+i9IqKhbVIrhdbriJJowprFb8yIpeYYZR9xXHfP3anLqpod2HlyuI2KkEi7eRgFv2ss2OMq7VxMYDiegVArh9A=
Received: from DB6PR0202CA0010.eurprd02.prod.outlook.com (2603:10a6:4:29::20)
 by AM0PR08MB5457.eurprd08.prod.outlook.com (2603:10a6:208:180::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Wed, 21 Apr
 2021 07:29:32 +0000
Received: from DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::aa) by DB6PR0202CA0010.outlook.office365.com
 (2603:10a6:4:29::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Wed, 21 Apr 2021 07:29:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT052.mail.protection.outlook.com (10.152.21.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Wed, 21 Apr 2021 07:29:32 +0000
Received: ("Tessian outbound 700fd1fc53d5:v90"); Wed, 21 Apr 2021 07:29:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 12e693abd5dc5139
X-CR-MTA-TID: 64aa7808
Received: from 4f7baf83c6a8.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7FACA3BB-A5E8-45C4-9452-310F61E2341D.1;
        Wed, 21 Apr 2021 07:29:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4f7baf83c6a8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 21 Apr 2021 07:29:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HykfrR5asMQIwTAlfQEMGryeQq2rTYV/6bMSCG3jasGBmSjpoNDIs1FaExno+J3xrSaiVO2iOxDNaELrrj/KEdI+ff6A4zcEqh2DvLznVVIg8rDTxdORqPC7DOe4MfIeEH3RrG27aZuo9mRZs7co95zza2wd6LlfEuwnmicKJbqkZ910WWB0kPNljlKkUBwlbOk16YwcZGM0t/j2xLyXQFczoq1qe9cXHIFDake3PjIp48ZzaqRAv6POOKX5wBdVJINJ+A6G++6x+uSKsM3LQgAnd+LBhRJpAznjrHR6QQmVg7ky1P5MXTEONrtvvdCrqfpzXZ0p6RbdgVGHvwriuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rv0eaGxnRwq3btUFEsXhfYEpR6LkLE0AYrW+hIA3ei4=;
 b=feoRCTqnOc7lKyJY8uhTMHLK7+FABqbpiW5zYF34cUiCe88m3ZEOphZ8+/mnk92+sPWSKbxUWe3v/36tQQl6zR6Dv7cDtnpTMkZ0GHLy5UzkTutnOPGCAiDEOD7EA2EgalMOSXCaAHKpKE8Q32jMMNmpBgJX+pGCi8+3e6A+On0xJ+XmM+7Su29FIRYQ/HPmNYkNeAN9rOlxk8LCP02MmikgY1h8w4pYA8Z9pMsinWqTuBiGZcJSC3kEXWkZJlW5+bHSytPa3SrvkQPcSviUdoj61NJOuh3V7L4c3g04t9+cwgqBJ8j9jeazKFZ3VFOv1oe8vxRvRH9UDWYHKYRVEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rv0eaGxnRwq3btUFEsXhfYEpR6LkLE0AYrW+hIA3ei4=;
 b=wrvh69054x/gkpkVDeKatOMfItGLf1k4NpXN2UfBFnTuhCbyD6GEdWg/kRNusunajpwWHg6nn1bs2RqKfBNgK+i9IqKhbVIrhdbriJJowprFb8yIpeYYZR9xXHfP3anLqpod2HlyuI2KkEi7eRgFv2ss2OMq7VxMYDiegVArh9A=
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Received: from PAXPR08MB6943.eurprd08.prod.outlook.com (2603:10a6:102:135::10)
 by PAXPR08MB6623.eurprd08.prod.outlook.com (2603:10a6:102:155::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 21 Apr
 2021 07:29:21 +0000
Received: from PAXPR08MB6943.eurprd08.prod.outlook.com
 ([fe80::ec33:bc81:5918:2d09]) by PAXPR08MB6943.eurprd08.prod.outlook.com
 ([fe80::ec33:bc81:5918:2d09%7]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 07:29:20 +0000
Date:   Wed, 21 Apr 2021 08:29:18 +0100
From:   Robin Randhawa <robin.randhawa@arm.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>, nd@arm.com
Subject: Re: Poll for call
Message-ID: <20210421072918.kytkx2adgqxgyq5y@FVFF77RQQ05N>
References: <CANiq72mDu=Tijr1mmpLNRoR7H4eqTH50FcaQmbKM9BAHDOahHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CANiq72mDu=Tijr1mmpLNRoR7H4eqTH50FcaQmbKM9BAHDOahHA@mail.gmail.com>
X-Originating-IP: [78.105.195.18]
X-ClientProxiedBy: LO2P265CA0296.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::20) To PAXPR08MB6943.eurprd08.prod.outlook.com
 (2603:10a6:102:135::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (78.105.195.18) by LO2P265CA0296.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.21 via Frontend Transport; Wed, 21 Apr 2021 07:29:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 642d36de-af04-4234-0eb2-08d9049734df
X-MS-TrafficTypeDiagnostic: PAXPR08MB6623:|AM0PR08MB5457:
X-Microsoft-Antispam-PRVS: <AM0PR08MB545767E906D048DE08733B6D9B479@AM0PR08MB5457.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: P+WsWzK9gJEF/uGkRdKNmMndFBBEK9SnOlWBX5bxJqf+uZASmoIGtausJqtJCCWBqY7med+DoLE9PLfZbv5Dq8qB3q5MwIK270mrjLZyh8VoeIm1qbTt1tmUX6ZvDpjFEWm8+DWf7akpOTIn18r7LcDT+hS3MPMbyVlUq+gkJljRlAU00WZceaEyJykRC6c2Wawjr4k6AxZiISZ544QLuTP+V/0vmU3izu9VaIDs0FOCSAUh2+kYn4dlo1njihrb4CpLWQhjflZtlTQTb1GxqgGA8K5vbGc1/BtXdIxHibvnWWRalnJK3MJbXuf9kq5ZAmobRjz9nFO+ZIRs5IWu+CRqxkApDW7kCRWO+M1As/ZcHfSoEgbjPCUjs+xMuL3TLRfLZFuATUdYKYgrmHcmaFldpt+wdCw3CmZQDzX9NqEX9EsdwxYMaDg1SXidS3cQ84A4RazGGcywlKP3vUfbGjRIpsU2cAb4k//sXg9e26FButvEysjgDeOGw8SUUNfIt94ltNrvuAQGhFPHLJdlkBzN4oTRq+S3N7ERyOytWCVYBDX+cO9jZUKhs2qNegbnQIXnigQwkVdQUCbrlYtZtCguXH5VEH3mcsMzHCT7huNxlJuoLBL66pbNrv5rVZfx1YK8t1WPSggc6O3raax4+RD2eJqZAeNiNHTzMvB4MHM=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6943.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(346002)(396003)(366004)(376002)(136003)(4744005)(66946007)(44832011)(5660300002)(8676002)(316002)(66476007)(478600001)(52116002)(53546011)(66556008)(6486002)(33716001)(86362001)(6496006)(186003)(6916009)(38350700002)(16526019)(38100700002)(1076003)(26005)(2906002)(9686003)(956004)(8936002)(4326008)(7116003)(3480700007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MTB6NWNVWGJpcC9mc1RlYktnLzBWOExLS0xLc21QUTVIekl1YnBDU3V6WkV0?=
 =?utf-8?B?N1NyNEhSejN5VE9rdEFpeWhEY3BXWjc3TGRTVXlTMkFKT3lnS0dVdkoyNnlL?=
 =?utf-8?B?K1VSOGp6ekRXQnpvVktzaEUxUmRnU015TzhhY1hEZU01ZWc4RFFSbG1RZjJM?=
 =?utf-8?B?bG9vOEt5ODdTdHJRSXZnTWlSTUxUdy9PNW1ia0luSmJKZUhkNGhlSS9UazA0?=
 =?utf-8?B?cEJkdlMvSGRGVDhIME5kcC83d3V1amxpZnJRb3Q4MG5ZZ0hxL1lwMUEzREp5?=
 =?utf-8?B?RWsySDFzRWxrRElkbjA3WmgzKzA3RlB4UEtFVXhxUTFwdDk4WjE3NFFtOG8z?=
 =?utf-8?B?VUZ4bUVXOVlqZ0ludzhkQUtnaUVVVVRDdUc1dHBtL1VnUjc3U01lbXo3eHVU?=
 =?utf-8?B?bzRUUU4wODQxUzdrcjZrd3hjb25kbnFwT1h0QlU0T0VkZTNLWThWOGxzanYw?=
 =?utf-8?B?Wi9pa05iTTNwRysyMml6RkIvVTYzQUhCc3lUNW5hKzlGbCtOck9zTjdVSzdK?=
 =?utf-8?B?WkhGemdwaENPRXI5UVczRVRQWVlndE5OSjVZWHliQVl5aUFKeHpKbGMwbWE0?=
 =?utf-8?B?bEdHM2RBanR5cXc3b2ZTMnBsUjBYejA0WlZ0L0RHVVBObVUrWEY0bzY0Z2I3?=
 =?utf-8?B?T3EwdXIrcXBmYUtPaldmdlQ2VnZ0LzYwcms2eEhmc0pOVVc2Zk9kTjV1RkFE?=
 =?utf-8?B?VW5aQnBPRWs2alZLUTF2MmRlbGpKZTdtNllKd0x5aGlVZDBPNnVRbVVsS0Zp?=
 =?utf-8?B?bmUwbjZiT2VHd0IvU3RLNjErZXBUeGRKRkl5VWIwMkJkNDZMQlkvTWlWZjhr?=
 =?utf-8?B?WUtjTFBQRG0wWXJuR0IxcnFZbEJUci9CSDJkYy94K0lsNVp2SGNhR2FXbU1Z?=
 =?utf-8?B?WHZ3cVE4ZDJLRlprR3lCSnNtU05zcmEvbUNocUNURDI5ZGxWMVBiVEZvZ25n?=
 =?utf-8?B?MTJsWVlEdHhqZzY5amQ0MTVvUWY2eWdhTUN6M1VUOVZPWXlad0x6Z3RlMTE5?=
 =?utf-8?B?dVBIZlVUZ05UZ1Z5ejFLUmFSZUhyOE9yVm81T0xIUlVOcnVJK0xHZHVRYU10?=
 =?utf-8?B?UjNxL3c4QmlPM3RNUXZ5MjM2bXVSSjZnQXZuZnRjcEd3ajBzQzZ6d0E4cUow?=
 =?utf-8?B?TnVzcFdzK2VKZWVEWXQwbEtnYm93S0pncnJEaS9UUFJvbnVZZG9GT0pFODFi?=
 =?utf-8?B?aXpBemZzeTZQSTBUWTQvSHN0eDZsWnFzcUZ2cHlRMVdNY05RU1h5cGF1MHoz?=
 =?utf-8?B?RkdPQzBXMHhwS3VkZW9oeUFtWTVpRlMzZ1JzNERpS1hlV1JTUmZ4SzVrWUEx?=
 =?utf-8?B?MFNSRlJSN0piWmtHMFg4SlM3RGhyRUZQejdzVC9OVjIwYXdsdjBhUkNIN1hu?=
 =?utf-8?B?N3pRV20wRTBBTnFpTTE4TmZDNXVFNjZrN1k1UzNVM1phN3lNUjNrMG5FUG42?=
 =?utf-8?B?ekpxNzBxSStCVk1TYmtIZFVTMzN2S3Z0R1JRTzJTRW5va1FKUmNXVFJVWmpT?=
 =?utf-8?B?eXViQ3kvdGpzaWtZRHFYZ3Z3NlBaUFdkOTM0b0pHRUNaWlVWT0xkcHRuVFJY?=
 =?utf-8?B?N2FyRVZtUFY0bzdxTUg2OTE1QUM2bWE2eVRwRmt5RHlnS3lLano4RkdDMEFX?=
 =?utf-8?B?MTd2K3gyLzlpSHNhV2ZUMEhGeFBHeitWajl4ZHk1MU9MT25udk4vZlhCTzlk?=
 =?utf-8?B?Vlp1eklZMnFxaTh5MlkvVmUycHNrQW8wY3hIa2Qva0NvUjQxZ3B1WUZtTkxU?=
 =?utf-8?Q?PNBQw+3lbwDQiLiq1D6nwu63Z+70Z/vyAQsJ4i0?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6623
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 94eb39b2-bcb0-482f-5623-08d904972d70
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KSmWMf4J/of/mdSG/p15I+PC1btRkofvHEjrx/jt7/Jh8+1jZB2xkbFrsGWx5tO881KhiQPHwFZ764vkLkUkwda92/mbP0q1neVUy5NT+w1OLFnUKC61BCADxWSrtnq/EPhp/xS+IQ/+UkRWKHEVnSJFZ9Ui5NcTNTt/SUTMRwsXc8tfyi1DwWALpPjiivqYY29GmIHgfNXTbRRWO6o39b8p5Ux0deCuvoCTv+RMMUv7GyZsyuO+6bfvcVfXu/BVKb2gY2vufxVlYXiICMYn5vN7sajkY+EJuO4s9nMRH83RrOaZbQkvc8WWYN+gGulXZ0yEIYgZZTu0HSQxyc/InjCWqkGNMh/vC01MaDFJ04MqInMfbfQRztM4QSilb/BFk5Jn15+runmHS59pPYbKobEv0FMWS+/Win0rND3jJbDaqvNKMfnK4RBgQ5JCowPTVTp6nhQPcXZyk8qBCgxs7607xBWoV1ZoL9Xt8JHe61E6rpjbQOZtIjQaTlBNLS9v8p2Ww97Y+KLL7s1Z+0bRQOaD0ATFoeL6zLgabBuSTUggNZKofJxJiPRR05SyK4DvXK0yY/ptbDBnOaH7+o+Mi7+qoXxasyi6hjltbLEmQ5IkvkNS9Rpoz/+XHbEiJ2/JXj4SfDrMzVlBrcMEgph55qnDdI+R50APfjA9T676Imw=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(396003)(136003)(346002)(376002)(46966006)(36840700001)(16526019)(82310400003)(33716001)(86362001)(186003)(70206006)(6496006)(336012)(4326008)(6862004)(9686003)(7116003)(70586007)(2906002)(26005)(6486002)(316002)(44832011)(5660300002)(36860700001)(47076005)(356005)(3480700007)(53546011)(8936002)(8676002)(82740400003)(81166007)(956004)(1076003)(4744005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 07:29:32.3112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 642d36de-af04-4234-0eb2-08d9049734df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5457
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Miguel.

On 19.04.2021 18:14, Miguel Ojeda wrote:
>Hi all,
>
>Now that some days have passed since the RFC, let's have one of our calls.
>
>I propose next weekend Saturday 24th or Sunday 25th at 18:00 UTC like
>as usual (EU evening / US afternoon). Please let me know which day you
>prefer, if any.
>
>As usual, anybody is welcome to join. The meetings take place on
>Google Meet. The invitation link will be sent later on to those
>interested.

I'd like to join please. Both days and times work for me.

Thanks for all your efforts!

Robin
