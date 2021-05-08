Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417B6C433B4
	for <rust-for-linux@archiver.kernel.org>; Sat,  8 May 2021 20:23:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11A38613F2
	for <rust-for-linux@archiver.kernel.org>; Sat,  8 May 2021 20:23:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbhEHUYQ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 8 May 2021 16:24:16 -0400
Received: from mail-eopbgr10064.outbound.protection.outlook.com ([40.107.1.64]:28862
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229520AbhEHUYQ (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 8 May 2021 16:24:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zU1GMsAbsIjzfi9tYITOIMZw1keSItLKZcpLtY1XJnY=;
 b=phcH4cS1urirsS9A9HpFQ7RdSokpMU6LVRLr1TK7lKO6RO1cFoyyFPKkPm8Vvj8SEHbgIMXztGpxf1j6iCxjO3fB0cGGoWo3O0RSRu0Bz/U96ujgaXKEtvpIALLq71SYlwInjQBQmUM514l3aqRV5j/1YQlqIkWqdZQrtHn4Y9I=
Received: from AS8PR04CA0129.eurprd04.prod.outlook.com (2603:10a6:20b:127::14)
 by PAXPR08MB7262.eurprd08.prod.outlook.com (2603:10a6:102:211::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Sat, 8 May
 2021 20:23:09 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::10) by AS8PR04CA0129.outlook.office365.com
 (2603:10a6:20b:127::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Sat, 8 May 2021 20:23:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Sat, 8 May 2021 20:23:08 +0000
Received: ("Tessian outbound 9a5bb9d11315:v91"); Sat, 08 May 2021 20:23:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fa08b5a466fd8bf2
X-CR-MTA-TID: 64aa7808
Received: from 4f2a74b3e3b4.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id FBF7CDEB-57FE-4C20-ADCA-8D135D1BC14E.1;
        Sat, 08 May 2021 20:23:01 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4f2a74b3e3b4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 08 May 2021 20:23:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrapnhZNkqjUd2aniSsYP1E4KXsL7nFEsPWFy3wzGrCo8x+thvqvK1EOECaDHTX05bIl1qOFIEyltJLiVNKSPLETlp2pZHlL7E8ghfDR8s+DovRHLkCzjZw3PYZ5ARQUQdX3dNDfrFkl/v9IqBKO4olP8LWIJ4tmVvMgbamDgeFrxVssliFt6zvn8a833hRaP3vd32kkUVbSO/55W6EEGKgHof1oKyKQMaa5MpaN97PUtkdzRzYtCA11tYVdd2pbCXtkfcPDQNiHRmVT4wLdYWFIt5PnCcLP4lzT54McNK2RZ4hFxBV8JqHzfzIBO1LozwOre2qRKLoeb8BUV4J6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zU1GMsAbsIjzfi9tYITOIMZw1keSItLKZcpLtY1XJnY=;
 b=GdzhtCk0UAnfWcTJOwPtD39aBd3pDooRPBTPv6LvIpWEKFuOuOEtImYjA5x/fnRDekfvhvVkc42UYk0wJW9WgL7/mcoSCYsXXfaDWi30VgpMKeBxiYYc3e6S/DmV1sZvAcWhageruQk45BYVEBt6w58c6VS1Dpy1376zQqT0bEDI0KOCK8dAWQo2NsnamOpOUPwNUE9/0fCYr+OI1Mffbymlg1UxpwoyiSz5ciEjm5Mbcx0aLmqcHUmto5Vp9lDn/JNHoA7WW1WtBABX6Oome/48js5rVx3VoF2HRuf2gk44AbOjf8mV6Ob2Rf/VExb47HUkXNfGdCeUQCR3YFuWiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zU1GMsAbsIjzfi9tYITOIMZw1keSItLKZcpLtY1XJnY=;
 b=phcH4cS1urirsS9A9HpFQ7RdSokpMU6LVRLr1TK7lKO6RO1cFoyyFPKkPm8Vvj8SEHbgIMXztGpxf1j6iCxjO3fB0cGGoWo3O0RSRu0Bz/U96ujgaXKEtvpIALLq71SYlwInjQBQmUM514l3aqRV5j/1YQlqIkWqdZQrtHn4Y9I=
Authentication-Results-Original: vger.kernel.org; dkim=none (message not
 signed) header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=arm.com;
Received: from PAXPR08MB6943.eurprd08.prod.outlook.com (2603:10a6:102:135::10)
 by PR3PR08MB5835.eurprd08.prod.outlook.com (2603:10a6:102:8e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Sat, 8 May
 2021 20:22:59 +0000
Received: from PAXPR08MB6943.eurprd08.prod.outlook.com
 ([fe80::ec33:bc81:5918:2d09]) by PAXPR08MB6943.eurprd08.prod.outlook.com
 ([fe80::ec33:bc81:5918:2d09%7]) with mapi id 15.20.4108.031; Sat, 8 May 2021
 20:22:59 +0000
Date:   Sat, 8 May 2021 21:22:58 +0100
From:   Robin Randhawa <robin.randhawa@arm.com>
To:     rust-for-linux@vger.kernel.org
Cc:     nd@arm.com
Subject: Meeting minutes (Sat 8 May 2021)
Message-ID: <20210508202258.m7uk6cfxzyghzu7f@FVFF77RQQ05N>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a00:23c7:85cb:8401:c486:932a:c039:bcdb]
X-ClientProxiedBy: LO2P265CA0075.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::15) To PAXPR08MB6943.eurprd08.prod.outlook.com
 (2603:10a6:102:135::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a00:23c7:85cb:8401:c486:932a:c039:bcdb) by LO2P265CA0075.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Sat, 8 May 2021 20:22:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d07b25a-eab6-4a40-d332-08d9125f1853
X-MS-TrafficTypeDiagnostic: PR3PR08MB5835:|PAXPR08MB7262:
X-Microsoft-Antispam-PRVS: <PAXPR08MB72624A940B91F813B546CCF59B569@PAXPR08MB7262.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: MHOYUp9Absy+gyuQ0B/gn43cpAssziKdL33li+zca7aOZStblTRM1WNpwB/ARmJfYOHRoJhE6KdZYwkr5bGAZZ4wAAo2NWEjjEK2fIJ4oIw2zWTuXb3tvNyagXvN8wQWx+Em7G5RxdK15C+BbbZwqiL/XaDiHgBLM0okTMcSAp0ON4hJPjNK3xFn7RWLUsvGRRT1OcUl1YAYbx7JM+DRMwtItVVJlRaoT4wANDVNLl4+xhKSNDVj72lzRJLGgdpmZQwLa9zHHc+gmOspgyz3Rjg+BYsxj+YdOgWSKFkYxvuex5MRPqsJ+6CNSTL/jpLO/ylg7TShA2iBd+UYMjS5CquAsCFbfx1tedy4VVXs7ytV50bzapaOO4RS2XjF14ctznjmc1UnAsaP2xWBXiO7YJbYjMkWEOuFL9A3B666LIi5FYku8Efn5TzwEKM2hyjuyaW8LfZE8tU+RhH0UlyNpTg2pT/9xCozpHsYZHsL/syEXodRgTUEI7fL9l0Ib/eT/B6hAdPnkmMQv0LzF8uoj7cDFuslhkTqmvR7zf/eReIrqt8woUsNiRE1PJSZQhRewwnW7+WflYyu/iA3AvnMVPZkNNZM44K7kgqppKWZSqdNE+DlzPuWlMjhWVq4uNanlXXybKPSFUTgzthzHxeuKEJGkSOfm8REZlbhs9y3kWHORyg7FjhOw91SKQ8DPeh7
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6943.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(136003)(366004)(39850400004)(376002)(396003)(38100700002)(2906002)(6486002)(6916009)(4326008)(316002)(66556008)(66946007)(66476007)(33716001)(8676002)(44832011)(86362001)(966005)(478600001)(1076003)(5660300002)(52116002)(8936002)(16526019)(6496006)(9686003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mnpkd09vU1pCZVBuVjlsMEs5MmwyRDhJaU1ERVY2aVVRWEg4ZlhEc1JlVzdk?=
 =?utf-8?B?RXdZV043eURNQnIzalMvWThqaDI3Um05d2gySjZ5RFlHdEc2OWtKQnJ2NjhS?=
 =?utf-8?B?cCtXNDE0QXlFZ0dMYWltODQvczgvRWR1STdNWlNDcU0rWFNJczErNmhCeWgv?=
 =?utf-8?B?Uk93WllvU0VOOVRlL3U4emlRUElUUFRucHVncUg5bFA2L1pFR1NIYlpmdkRy?=
 =?utf-8?B?Z1hxVG1vbTNibG1LUUh4b09wditWMVZudWI3VVdQQkVCN1R5cjlwK3hDd3Qw?=
 =?utf-8?B?a1BVUktrSEtxVkZzOTY0ZDkvWDRxa2NRVDNmdzZvdTBTRUp5cjcvRU5oTFU0?=
 =?utf-8?B?Z1kvaXdrM0t5YTlYMXMxNWl0eWV6cVBHbkhJdmxzUWVES0xBMmIvellyUHJK?=
 =?utf-8?B?S0J3UVEzWm4vNXJ6SytGek9wTUpHQ0paejdLbjN1MjJXZEprRTJVaXRtbFRn?=
 =?utf-8?B?RmhmZndldnBDdFJKZ0JyQ3pwOForMU01ZTc0YW5Wb2YvVjJCZTJ0ZVFYU2pz?=
 =?utf-8?B?TVlaZ3FvNFhvcjdHNURrNGdaNys0WVJ1YXhiZTFXQ0g1a3VLQTJSWVJSSFVl?=
 =?utf-8?B?clJ1RWhncnEvQ0dhaEVCZEtaOTZnTy9EK1EwaW16czBRQmthU3BjbVJWdHVV?=
 =?utf-8?B?azdtSjZWbVJUZDc3KzhQYnZkMWdXMnZveGgrNDdCeWlnekMvcFlmVE5ZT0RP?=
 =?utf-8?B?M3lpV1V1c1hQcDA2anR4UklUOWxEZjFxTlJZdWhISDdkN3U0a1lLeHZBNUJM?=
 =?utf-8?B?YUtjanhNa3k5bTgveW94OUNBS3puMjFrTXkrTkJxUmN1R0w0R0MrVzdpRW5y?=
 =?utf-8?B?L2E1dGJRVXJQekhnNzh0d21ySFRDVGYwTGU0VS9lejFveUJoSG9MdHRzYlhI?=
 =?utf-8?B?RHVpRUZvcUdKMjI0S3BmS0ZhaUsvSE9ZWkpFT2NnU1crVXUxRWNFTW5SMis4?=
 =?utf-8?B?akZoMXJha0crMzZTRnJTTXBPQWkyRlZ3MHpyUkMvMkRxV2FVUzJvNFg0OHlk?=
 =?utf-8?B?Ny9pWXkveGhFUWRidlRXRzJoNytSeGcvc1RlMjBsaWNSemViU1V6bTcrcWVq?=
 =?utf-8?B?TEhHai9oM2gzeUlkM0VPRlpnVDk4ZjdNYVFHdUlRdXZGQnl5U29YMGtkUFZT?=
 =?utf-8?B?UTdpYi84OENGQjNTZzhlMll6V3prdjZVRDFwMXFlbHpUOE9qWkxRbmgzMjFt?=
 =?utf-8?B?QmdidDVXU3ZsN2Y0c0dDRVFuKzdpZVAyWkFMQldid2NEOUhPTitFeUZ1MG9V?=
 =?utf-8?B?bzdrZ3FDR0Q5K1FOWTMveVhkM20xNGgrZ0dEUEdNbmZHakdqc3gwczNwc3lr?=
 =?utf-8?B?d2tNVVBTVUNKbUtOYi9jdnJOOEhiQmdxM3RHSWpOd1JRZUFnaHpBc0ZVOHRO?=
 =?utf-8?B?WEFRT2tEYWZNbmpVS0JGd1U0Vm1mNmhGbE1ZV3RTTVVBMVhQNmRYdFdTcld0?=
 =?utf-8?B?clFhSzlIS2ZWU0JHc1VUQUkrSzM2d0xhT09nYml0UU1TMWdpOVNBT1NXUXdu?=
 =?utf-8?B?a0lVWG16UUcxVTMwaG5PakM2TkNKdVNyczBQYWlmbGMzdlBpOFUwNkJ4UlE1?=
 =?utf-8?B?cDREUUo4eExoeFNRbC9mRVh0N1BLaGEzQU9MVllFakdaQmdPb3JZM2hDRDk2?=
 =?utf-8?B?QXY4SWYwY2FwWXF0bEx4VDA0OENDYXB0d3JRUmNST0lZUUVtalBqdFhtcXVp?=
 =?utf-8?B?QTI5QTNPbmpQS2ZnbmFHMThhSjU2R0dVT1JKT2FuUm1wOEZiTWR3bU82eWpv?=
 =?utf-8?B?clUzd0FTbkkvazZjRjM5TEhSTUx5aThlblNBRmpxYjc1N2p1Y09OQlFvazFo?=
 =?utf-8?B?Rm5jTDVqeTYrSEtsY3FPTTdPSERLVGFvOWd1K3RtZWZGSDZtSzV5RTBabWJp?=
 =?utf-8?Q?QPe8zxdNLst9m?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5835
Original-Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e29bdb1b-95f2-4478-4c12-08d9125f12a8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e9w11qorovdNr6pu1Q4eA7l3zgwbms2vJBtOApxjtD2JpejEXYq34wKVMzUOL4yEbo/RnGW3oPcpnfV3ovFOZ10/fMUtRlECx9v3uHplnxVuiJEHukgwrf5EbFBCd94Sj7MK5tq8jCC9iFky+oRAlszI1niChoFff+SVtp618vTyEMUZ3IEbscEuriVTZ4mqyWkXmMdB3Pb873luC/pfkydeSdc+owbqPXLoJuoEh3ebmGZ/ismkN6mCIyjUELh8QKlZT435lWsYq7oOKM3lfODafNO1GOH9sJ0W4N/R7Q8SjCI53FFHas0brC+MJjKGA3Pj6+70EtdKIhEG4D0DzZd4LWwCRmfF1yqra6GPht64U6IZnRWz+RTch0kYUXeai1+5ef+wZuaKsDDQ9H9HafuhFj2ijh9flE0TlZAO4S3HafUJU2tfcPZ+xYc1/OSAeLb2YiLEBz8KFexU+qoR65dPd16kUQhVpbpMYlj2EzuYu1c5ZG00SXc9nYtwJQmCjcwHIjYqtnH/fwt4nPzyGsj+sVmRSPQZw9NDClvlyZwya8Sy0VqLohYFv5zGIb1wuBb9+yQkjfWsm4uIyAKDxglzgocf0gmyxc2UMOF7uXtHRIPrOZ7bmRhkboxNpvcL+n2YnA1ceT0pfMr3fhKBjpupMrI089se5RTAc4oJKnODlkzellFiRN+q/fB1Xj3OIEWIB9NByJ9+Z5AsO42XTrBu4495bx4+ndnp+ZrPiSI=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(7916004)(4636009)(396003)(346002)(39850400004)(136003)(376002)(36840700001)(46966006)(186003)(16526019)(44832011)(82310400003)(86362001)(36860700001)(2906002)(47076005)(9686003)(6916009)(336012)(966005)(478600001)(33716001)(1076003)(81166007)(356005)(82740400003)(8936002)(5660300002)(70586007)(6486002)(4326008)(316002)(70206006)(26005)(8676002)(6496006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2021 20:23:08.8355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d07b25a-eab6-4a40-d332-08d9125f1853
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7262
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi folks.

Summarised meeting minutes (Saturday 8th May 2021)
--------------------------------------------------

News
----

* "Good-first-issue" tag added to current issues. We got a contributor as a 
   result!

* A question came up: What fields do we need in the module macro ? Some mods 
   made to the macro as a result.

* Rustdoc feature that is used by the project is now stabilised in Rust. Also 
   @argfile.

* RISC-V support added to CI.

* Thanks to Finn and others, we can now use rust-analyzer for all the crates 
   used by the kernel and dependencies.

* Improved nixOS support.

* Driver contribution: Dummy network driver, contributed by Finn.

* Driver contribution: RNG driver for use on RPi, contributed by Sven.

General comments
----------------

* As discussed previously, there shall now be 2 meetings moving forwards. One 
   every alternate Saturday and another one during the working week. 
   
   The former is for a free form, informal, general catch-up. The latter is a 
   technically focused one. 
   
   Apart from these 2 meetings, if anyone has any pressing matters to discuss, 
   please send an email out to the list and folks can decide if they want to meet 
   to discuss. 
   
   For all meets, please try and share an agenda ahead of time so folks can prep 
   accordingly.

* Generally speaking, PRs should be the way to go for any code that needs 
   discussing.

* When using qemu note that most distros as of now do not have a sufficiently 
   new one. Eg Working with RISC-V will need qemu v6. 

Questions and Answers
---------------------

Q Should wrapper structs use repr(transparent) ?

- No

Q Should everything that wraps a pointer implement the PointerWrapper Trait ?

- If there is an intent to pass a pointer from Rust -> C and then back, that’s 
   where the trait is used.

- There is a DenyList feature in bindgen that can be used to deal with 
   problematic structs. Also OpaqueList. 

Q Can we not use cargo ? It would help with dependency management etc.

- No. Reasons enumerated here: https://github.com/Rust-for-Linux/linux/pull/52.  
   Cargo has a bunch of problems that need resolving (output interleaving with 
   Makefiles, cargo workspace issues).

Q Why are we using Cstrings that are different from the std lib ?

- Because they need to be null terminated. Alternative strategies that guarantee 
   null termination welcome.

Q What about the previously discussed use of the Zulip chat platform ?

- Not done yet. Should happen shortly. ** Action: Miguel **

Cheers,
Robin
