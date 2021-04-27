Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BE9C433B4
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 10:30:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93703610FA
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 10:30:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235442AbhD0KbT (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 27 Apr 2021 06:31:19 -0400
Received: from mail-eopbgr80083.outbound.protection.outlook.com ([40.107.8.83]:48115
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237862AbhD0KaG (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 27 Apr 2021 06:30:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5WySc3RcVGcdDPQYDBfiNkb0vrpaxA32CtCVWwS8zc=;
 b=oifY0lu9xOgrdNEM5LjPkjSQUsnlC1iLBh9GYLSN/NUbc8DqLj6c/qNeS63bdr8K1ybzSAZ76Ypz5NaA9VYfDyr1Oy8bHfknk94pbmwgqc0qhPtWCSoGyLJ7hutStE70NQrP2hkEFsH2Mbov3qFKK5eHU3DAOOWyWSszU7fbaQ8=
Received: from AM6PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:20b:6e::39)
 by AM0PR08MB4532.eurprd08.prod.outlook.com (2603:10a6:208:145::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Tue, 27 Apr
 2021 10:29:18 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::1e) by AM6PR02CA0026.outlook.office365.com
 (2603:10a6:20b:6e::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Tue, 27 Apr 2021 10:29:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Tue, 27 Apr 2021 10:29:18 +0000
Received: ("Tessian outbound 82c2d58b350b:v90"); Tue, 27 Apr 2021 10:29:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a419eb3742d8cda
X-CR-MTA-TID: 64aa7808
Received: from 455dd0baaf34.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1FABB103-429D-4C13-BF08-E29B97CAD258.1;
        Tue, 27 Apr 2021 10:29:12 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 455dd0baaf34.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 27 Apr 2021 10:29:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Db3Kf9s2J87TJ1yce1cAGYXwNCjGSMnaTpHOYpKrH9sObEx5jSFM1AdBMmERiFTLiG96+d8EfXgNFBnZdhXIqcAJO/ICqf+8wGKZNpNoPm3BeMj6Qvf2loHzxXH7EgWtCGgytH2mWf+5ALHGruiYijcz9+UmIpLhZ7XC2uq7obZXuVVjywKjhpCAjB+heVUWzLC23Zz8z112b+zhCbyq8QkZsHJ6Vfghk1IWcW6KFZHVK7tlszFRokxzKoI2XRvXaEuwZsUQ6CweH7qcEeT6hdKNWeV07k94FzLHjN7R8UdpkbVknafjLTK+o4P1Lj7wWak02KqXgINlTfi8jEb8Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5WySc3RcVGcdDPQYDBfiNkb0vrpaxA32CtCVWwS8zc=;
 b=i7OsCwMWURZDwiIiiClS5jR15d+pbSFYc8dsUtBh/yptPjNX8XrLE1rAhiUQoU0795tYDg2rXftzab5ZyiHG8oaJAeT1NwLUkDxgAD5TcZi6Gneu+xUqAqdw+7lGwe/vPbPi0Lj3X18xzJNONbBqd3HEv0XGaMdxd+fK8QBC88OQeD7u2ZuOI0DAcd0mtJSekEXpmhrImaDCRUO+5QjmH8TRiyGMKhDpEFmAopmoWTlEugQkrN0KcO1KMNm80hrHhRvIdzv8q3LiaTKKSb4PbMll2n7zkEEp8R5zYQcgr9cCmpSDl4BiWsaQ4MFYm4UVzjxWcexoe4vwIJq4XyxBlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5WySc3RcVGcdDPQYDBfiNkb0vrpaxA32CtCVWwS8zc=;
 b=oifY0lu9xOgrdNEM5LjPkjSQUsnlC1iLBh9GYLSN/NUbc8DqLj6c/qNeS63bdr8K1ybzSAZ76Ypz5NaA9VYfDyr1Oy8bHfknk94pbmwgqc0qhPtWCSoGyLJ7hutStE70NQrP2hkEFsH2Mbov3qFKK5eHU3DAOOWyWSszU7fbaQ8=
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Received: from PAXPR08MB6943.eurprd08.prod.outlook.com (2603:10a6:102:135::10)
 by PAXPR08MB6942.eurprd08.prod.outlook.com (2603:10a6:102:135::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Tue, 27 Apr
 2021 10:29:10 +0000
Received: from PAXPR08MB6943.eurprd08.prod.outlook.com
 ([fe80::ec33:bc81:5918:2d09]) by PAXPR08MB6943.eurprd08.prod.outlook.com
 ([fe80::ec33:bc81:5918:2d09%7]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 10:29:10 +0000
Date:   Tue, 27 Apr 2021 11:29:08 +0100
From:   Robin Randhawa <robin.randhawa@arm.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>, nd@arm.com
Subject: Re: Future calls
Message-ID: <20210427102908.f766pgn6jga6idbl@FVFF77RQQ05N>
References: <CANiq72mhL_i0RpdEoyBcfBm2HS21o5_KY74PGFH81EVFbXN=Gw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CANiq72mhL_i0RpdEoyBcfBm2HS21o5_KY74PGFH81EVFbXN=Gw@mail.gmail.com>
X-Originating-IP: [78.105.195.18]
X-ClientProxiedBy: LO3P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::15) To PAXPR08MB6943.eurprd08.prod.outlook.com
 (2603:10a6:102:135::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (78.105.195.18) by LO3P123CA0010.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25 via Frontend Transport; Tue, 27 Apr 2021 10:29:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70600e14-b3df-46da-0a28-08d90967506a
X-MS-TrafficTypeDiagnostic: PAXPR08MB6942:|AM0PR08MB4532:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4532A5C073E193F2AB6A66EC9B419@AM0PR08MB4532.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 60RX/UeJmBySKJUGoIpLLkdyBle6ueNHDnFQyuBjysQ0pUPtq94sFz/sXv1YKDV7APLVhhaCZh9qEsB3Bi5VDKU7gwmEcwTKhK2TEEEyhc2YPT+IG4hX4V4VFCTjdk2fQc/VVXGreOkbgaQJX3yvUuNauquW/4f/nv3OefnD7YmQARMVwucCGSzSy+tY8izKCkZp+os/5HPkg7/lt5p2NspB4xJU8S4JjxcNUPTOD6OjGsXS1BCNWnBGsTTKJQ3YgdC6z9xO8JLIbCrmwdI/iVoMHZ+Vis5sNzM8h2lKNVHyc/oC2NSkxDb91Shf6D83fm9Q38mosBwRcDsMavTACClxf//YEKjjjp9XrRBlg8tIse41WVOPlhny37ykfipq5cY34RBQQ/VAmYAGwNON2nRHjT1zUDBMy+kHS/JW6P1tWLb7EfOAjotSVYEd44D+XPV4wBtj1RTdo8nRMHSGnX1AKHWBKTIYTY+17IiZyMNC5LSEeO8GAX2igvk4DDhjlHjGNPEVom+mq/nvJvbjEtgv6CPv1y5B7sLuDqHIkAOmZqjtcWfTpln08B+lh/eILgVwjsN9lURjl8GximsDjbKz2r+Ejuj5BbZunmD4+wa+GECS2Ea7cbiscgBpB6FxniVoRYmdmZsm77cAVCqx4UdpcVfacBIpZxyugKQo4ms=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6943.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(396003)(136003)(346002)(366004)(39850400004)(53546011)(16526019)(26005)(66946007)(38350700002)(8676002)(186003)(6486002)(38100700002)(4744005)(5660300002)(44832011)(86362001)(6916009)(478600001)(2906002)(4326008)(6496006)(9686003)(3480700007)(7116003)(1076003)(316002)(66476007)(33716001)(956004)(52116002)(8936002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TzJ5WFk1WDlQa3ZQRGJUbVVWWnZQbFh6WG5sVmJGb3lBa3huKzgwSHhBcGdE?=
 =?utf-8?B?TXpHUmdiZzFCL2w0a3plNnBNZTA1TTF5L21WdlVQU2h1SDk2NXRwMW5kcTZh?=
 =?utf-8?B?dTBVOTZ3N0UyT3Q1b1FrRVNKTE0zL3lGSkgvMXV0VS82SHU4SGVweGJmV05a?=
 =?utf-8?B?cXEwVXhQeVRtbUZLNCtzQ2pHalErelZCeEsyRlBjZG9qL0ZyV2U5N24walRy?=
 =?utf-8?B?U2lWR01kaWNoQ1gvektTdUd1VmpjWUlUUzJSdE95cFI4NVBsZVRYeFdpS0ZV?=
 =?utf-8?B?b0ZjL015ZXBjcFZ6dlVOUVRIenc3RmExSFV6K0g1SldCWlRRR2lNdnI5QkIx?=
 =?utf-8?B?NXhacFQrdENBN3hscUNDbitWbEVGVTVlN2hRa1NZenJXT2h5bVJua1VFdGdl?=
 =?utf-8?B?L3ZKeFovWUMvejNPOERMKzVJQkpXRFlaa2o1SlFvSkVsUGd1c0IraWZPYU5m?=
 =?utf-8?B?c0t4OVJ2RHRxb2JUYXBOTlRrcSs1bXJLTEVnNmR5YlN0a21IMGRRY2FZcm5i?=
 =?utf-8?B?b3NFc1djL09hbVF6WnpLSGNydXhPMHdPM3hEaUk4M1pjNkl2Q2FNWFRGYTB3?=
 =?utf-8?B?TEtldlA4VU1uTDJBL0R2VHBZVC85NzF2TlBpMlM0cXhJcGM5QVZrWVppNWJB?=
 =?utf-8?B?UjlkbmNlRFQ1WXFjQyt1MDg4V0JUVzArcmZqd0k1bjFVVXRBbGFJWG9qVlRX?=
 =?utf-8?B?cUtxdjhOS1VzYnZNaDdoNzVRcHEreGtkUHBleVR3aDFycm1lUmYvNk91Z3dk?=
 =?utf-8?B?Y0lFVWlXQXdNcjQ5aG84S0QwQ1NTbXUrUk0rZlVPV3htUktxTHEwZlFYL2tM?=
 =?utf-8?B?R2dCa014ODA1Nk5RQmVLdXEwS1IwSTgyNDF2bERKSFJORW1ZN3A1Q2Z3RGF6?=
 =?utf-8?B?dzRHTU9QQU02RVJnKzNjeG9NQ2p1cWd4dVZGQUpBMkZBY01NQ0p3bXVCM09I?=
 =?utf-8?B?RTNsODJyM2Nob0w5dW5oMU1GcHFaQnk3aFA0eDRlbFI1Q3F5VjREdDNwaFhp?=
 =?utf-8?B?MTZlQmkrMUdBeisrdVJwN1BIdFNselhLQ28rQ1J3MVhTNFR4czJGY2RFSC9s?=
 =?utf-8?B?WVNLNkRHdlBmZ2R1K0F5QzlJSzhzZG1SSHg5SVNyVnp0eEswUTZvRGpqVkky?=
 =?utf-8?B?N21pdDZwRkFSNmRmcUV5MWtTQTlrcy9SOTdueHBlYVhjM2E3endXQ1AxcmNR?=
 =?utf-8?B?RlRMZ1lqR2p4TXJMRlFxV0M4YVdmbWhsSmdzaWR5NDVvYU82WFIwVE80aGk1?=
 =?utf-8?B?WTlQdktxa0NHcnVtSlNZc1pNUUt5S0s2R01lNS92YVJtbVdzYnlxTGJSVXk0?=
 =?utf-8?B?Z3FQU09CWDZZTEJrTHVKYlFBaFRteVF3Z2pOVy9FV0QxcWhmOEpaVk1rOUlk?=
 =?utf-8?B?ODFsamtFdUY0QjRHWldYUko5OUs0SkhkTmczM1NFR1crZjlMQlJ2bGhrTm1r?=
 =?utf-8?B?cDhoNFpUajFhU1E2Z0J0QVNsZU5sOFVYRkhhY2dLd1N2ZGQ3M2ZLMW1FdlN6?=
 =?utf-8?B?UUdFczREamlwdTJOdDdKWGlFTC80R3FFMWI2SHIzMzhxeUpqQXdidEJNbytm?=
 =?utf-8?B?SzlZZ1ZJQmNpSUtaK2F1bGk1ZDlwS3hBVGhFRC9sVmZ3UldBZUNYRHp3d213?=
 =?utf-8?B?b1hnbHpyZGlabXp2ZmlZZGQ0YnExOUs4Sy9Sa3NnNlJWVVdwbEhoOGdoYzBB?=
 =?utf-8?B?cktUYUVNcjhtZFNvb2RSZjFFN0tXWVZTcWNlQlcvWTdidS9XbG4xeXMyUFA1?=
 =?utf-8?Q?WGcN04TbarfaJwCCKfFzHXGw+Ac3Myu+YnOd8Bw?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6942
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: c76771a6-3a83-4dc2-ce8f-08d909674b40
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c8/O9aCmFJT83hX9njlqW5elNFzZ0bqiG8hYyWxs/lkEcgUSv+OqTEg7+eZdApwEQS5GQTf11jKwgBBi6rN9UWKOr+jxFqaemeX5TLfj9TGW/Hu4i9bFpRygbwqwWPsgSH5fUotfIpbR2oODvZpSbbh6gs4Evg0tgXXUaLpSPVGb/V1/bEvLGbA8i8dnuJyPdrP9AxeieGnau8IymiulNiIvuk8JSh2gsKyp8bbAjptoe92yOLFQFADIZpuXYyAxLQ1UOjwJ6jT4wGS6GxtysM/qCdveSml6i8/16BjBK0fEW8yiYbND8A9PVyImPD0/sfQj665NQTxqfUL+htFgpVcE43CGxL4+DxboX0968isLswTT8AeFn+22WLUnpKrnUsFINg4/ua5wlVZEPLTfCr4kdL+449bXWG0BPTS+MpKPDxuaUYn1KIxQsClVX0nZ/KXpBUAp1yAJwx+HzCOCRnE3km6oeaMAVKczvyBB02g4EGdiejs5cCfriBOTevjJ9I1ywmcwWxtdndqS6TEKwjYfvqkSB1gtsrrJ1RQWWjsV3veIY2SUA7LU6/MJ7jrUQiCv0fA+0//CnY5RkpQzxmVfn4ClVzx18ZSIJn91qR4yuU89UatTIN4Wn279HenGMKardA0adGN2I+1N0EVuvnE/8ITpSeEpqNOryMHGlTRc7bV8/igBxkai6FcdWKq2
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(7916004)(4636009)(39850400004)(396003)(136003)(376002)(346002)(36840700001)(46966006)(4744005)(1076003)(4326008)(8936002)(478600001)(34020700004)(8676002)(2906002)(6496006)(82310400003)(81166007)(33716001)(7116003)(82740400003)(356005)(53546011)(86362001)(36860700001)(26005)(316002)(186003)(16526019)(956004)(3480700007)(70206006)(70586007)(336012)(9686003)(5660300002)(6862004)(44832011)(6486002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 10:29:18.3804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70600e14-b3df-46da-0a28-08d90967506a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4532
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Miguel.

On 27.04.2021 12:05, Miguel Ojeda wrote:
>Hi all,
>
>Given how many people joined last time, that we ran way over the
>allocated time (which was impolite on my side to those that needed to
>leave), and that some people are now working on this as a day job; we
>think from now on it is best to split the meetings in two kinds:
>
>  - Monthly informal ones on a Saturday, similar to the last one. The
>idea is to share news, welcome new contributors, discuss ideas and
>issues, etc.
>
>  - Focused technical meetings, held as needed, on weekdays. These
>will have an agenda/topic/context announced in advance, and we will
>strictly control the time so that people can schedule them on their
>job day.
>
>Please let us know if this split does not work for you.

This works for me and I personally think this is a more efficient way of
balancing both equally important tracks.

Thanks,
Robin
