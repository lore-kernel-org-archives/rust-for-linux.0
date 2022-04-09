Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A935C433F5
	for <rust-for-linux@archiver.kernel.org>; Sat,  9 Apr 2022 16:12:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbiDIQO5 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 9 Apr 2022 12:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232701AbiDIQO4 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 9 Apr 2022 12:14:56 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn2103.outbound.protection.outlook.com [40.92.98.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF28210
        for <rust-for-linux@vger.kernel.org>; Sat,  9 Apr 2022 09:12:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4vXS4dtCqtnYKjEWLmSbYu0TOY7+CMxJaolvGA2KhQtouus5r9bFH1tF3nNPpaKAeDMrXv4omwUrJDZipQWTSgcNIyGUBXyNZFxVNl96MM5youOw7EhPTWVjWBQNeRbbqhU6iFh+op62T8ZLDCjuYI42gAFhEGs0FNyKBIirnompzMM1Uhexn81qna0/DEOcrDf9DXBq6zKU/RuqqE4FqrVEmE2V/vujwr240CqbmH8ckXfeME28TuFArpoBtGpq9VA9E6ZtHVDL34yxuVSw/d5B9Gj9po8r6aLlZ31jdEk6e5OYCkyYlKVXnuMRzNSgs2N3DNM1Uvq28WuUAtaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ej7uXba8fHrH33vhEnQH1pnSFW4DDYLPEBXbswo6N48=;
 b=FdTgwVQu11CVb+OXGHzDxP+Ydb1UnS89zBEfpCy+FA+ZYkeWNQcvMZW32Jk68D206eSnSujElTRMBb8YDM8X+EKojCONEgxH0ECgPtDWKLHdTpSbZH7d67UvP/D0jzjFusePlOsehs7sBA9wChcVu9T5UzV7WkjUr6n6s2r6iSOmmvqq9wguM28n+onZ1RVBXKLBpjMmM1s5vsgbjCdha6CC2wNedfPJGju8mnvbpJGt2LGeLJs3Co/vJmGKFMdrWpAdA3PLB33iG94jAFM3B7xrDywA7qKR/tUkSPwT2mN5gzmkZRtnHyZd+frZIRQjGCvk9y4RgOvUCtvVmoml4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ej7uXba8fHrH33vhEnQH1pnSFW4DDYLPEBXbswo6N48=;
 b=SsebdhLcd7mmVBGBSbpsUj56gQzeSt9pWaXhXM8gUyXx986m+xZBamhv0zR4PNjJM6eWulPd2ZT8gEA5DcbXOdg0ITa0BWH6dxZHc8Hucee4/7Sk6XqZlaS22Xea02gn/WFo2TxhsAcsqQhm1DiPQh/ufqhVWoBkDlg6Cct3KwzjkqosCp+/P7IXPRNpu3arofTKX//++N5o68M9AXzuhh/TAm2mP0AkDuQg17aeWQpa0+HU10lBxeWxNVKP8rBNTuGkCuIIdaeylFLKgg8lCXHbtsIYfEiiDEGFw90YOLHrKwh/yEzddAMUcw9ZhNhVmoJPuHXRq0FQ8S1NFAmNcQ==
Received: from OSZP286MB2128.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:189::6)
 by TYCP286MB1513.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:17a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.28; Sat, 9 Apr
 2022 16:12:45 +0000
Received: from OSZP286MB2128.JPNP286.PROD.OUTLOOK.COM
 ([fe80::d5c3:652f:583f:fca8]) by OSZP286MB2128.JPNP286.PROD.OUTLOOK.COM
 ([fe80::d5c3:652f:583f:fca8%3]) with mapi id 15.20.5144.028; Sat, 9 Apr 2022
 16:12:45 +0000
From:   Howard Lau <howardlau1999@hotmail.com>
Subject: Re: Does Rust for Linux support kernel socket programming now?
In-Reply-To: wedsonaf@google.com
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain
Date:   Sat, 9 Apr 2022 16:12:45 +0000
X-TMN:  [5tGmM1Fug+ywfmIixJsrBeokI2yDSIwPQjPuzf118us=]
X-ClientProxiedBy: HKAPR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:203:d0::17) To OSZP286MB2128.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:189::6)
Message-ID: <OSZP286MB21285364AD0AF0CB33C45279B8E89@OSZP286MB2128.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8fde611-5b18-464f-bd65-08da1a43c86a
X-MS-TrafficTypeDiagnostic: TYCP286MB1513:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tdvIP1soJyqPgKnyc6SP40h+UReoT54FmAlGxB40AkVfXFqXxkn6jJAyxkooIP1t+GltHSc6BDc3u3W3R+LRW873nBqlBNdbcb5jxjH1KH5vk6jTBHF8QRVwUp8hYoMOdxcSkxnT7SX/mUEE5FLdyfCVWHrK8pswjazSlSGpbxMe3aP6PaxLlUGdIZyn48WMkZL9mKx0/zQImBqsfTjSu4yYGOhMBn6sYT18bnLHQFwijSQFFuDXTsyuDPdXWIbKWj9O9IiJeiPjwl02cZZTmkC9d9Z2HBaGuL7O4UkkmHoIWjsoW7HkvpxXigDj/Xoj14zsdaqvM1B0eIdPfbJGDK/w4FKiJqvdJb9H9jIBJDIMlur1eVzbN6JwNo+KaZqXOSmZBQPs+k2eoStHcYYT0SoETO0y3BJ1Yjr0ZMDeWlGkc3q6vULnqlqmVVo9Q+V5BUJKIDs41tresS/j9nsm6x64b98vWXd8r9iFM77XEc45+5apHAJrdn9FK/XHZMnF+Bv2WQa87p+Oxs/rMceb0R8auXjrUqKFKCH619H4GfuD7/tS/QM5FBnZfbX6RWKIA9tiTAEQ/IimJV88XCojhQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BCA7Jk3JfJKNVjcdwIPmp2XinYCl6Sti6s8r58XuTSQ5gJBC7w+2zC3r1cPI?=
 =?us-ascii?Q?mSTzXHgWfgccfuJWjaUet71l3afOGYfpbveElmE49G+F4Uwj9Ffh+ayJ5fkO?=
 =?us-ascii?Q?GiyBrLIvOUzINJu4+txkGb4r9kOPWhdx0jygiTDbT3Z/c3Oj0AykuF2Jwb+S?=
 =?us-ascii?Q?ezOf/GUoBLCqZIiyAUmJN38VFlNUQiiqrY8ExjmFHJV8ViYfvxWq2cV5ftIe?=
 =?us-ascii?Q?56Ds2J1aQYCayVt/QoZmolvWFDz3nfnZhEI6LA01ZgFKJCSSbymwSQUZ7+/t?=
 =?us-ascii?Q?DZpO49IwuLb02WNS6J3+sBF7tPLQSmF2jvbdlaCz/ysoIBAN5018EXEOlCZb?=
 =?us-ascii?Q?zYUOI5Iib7Nc3G+m2Qbln/dVLWQZrENsicRDKtNsYiqXuJKwYspyGZd5GRpG?=
 =?us-ascii?Q?8mk86thW38QjQInFNfV3OOUEEl5R2B3nDRiI9cwnlx41QsrJkmS/SEA9Yuap?=
 =?us-ascii?Q?NQHYUVu1b1y4gQ3oAaC6yhT0bLYn+M3gMyRHbUkMYO/WOeg1KKdA8HpRWmSl?=
 =?us-ascii?Q?m8M2sTEfg4hCH/2VSSWu2HzZElLQyJF03SP9rZ5BcGfgRtZmNYl7MSY7dixp?=
 =?us-ascii?Q?2hBqS44psApvxrWSNeRtZzsm1+A3UuIie0uo1breMiwSOMz0y12QDVi4E+6N?=
 =?us-ascii?Q?qKPIq4qQYSXgPgsuSr8hymSyHe+CVYM2yUx66Br6brpNBx0iQgKKtMauCpKa?=
 =?us-ascii?Q?yI8PqIcFoh7wEq392LgmhZSSC7Ou/ZzervGmPyDMcduhYYAHDTi6Cimpj884?=
 =?us-ascii?Q?wfO28cY5ru6Zg2lXGi2+aQvBMkPJZEoQOjLWtuDiUDc0am7Mq+5pr1GtVcCW?=
 =?us-ascii?Q?j5vAD5fSnHc+4mwKgo1ptPr3oCbdX782iOb8B2PXsSjOLrUs3vbnfDZ01wYb?=
 =?us-ascii?Q?OJmiRF9ojaZwSifyPf9EZ/b6ekMXZ65357xvxGaLx2FI3ibcIicbxS9OEE6I?=
 =?us-ascii?Q?v7o8RrbGszACO9HFjwdEtHuc8EY7nqeDi0HP4U+0sudhokGIOQuHd61J20LS?=
 =?us-ascii?Q?gw/F4LMN+pSKvuBcNeTiW9Q9iPVV0oxeXAGdkNSSAkHeVVvoYIYLpM1xP2LN?=
 =?us-ascii?Q?J56dM4NtfFTGtb1MaTG8Zr922kJcy/6GAJKlLwEHcN4Bg/Tm9/d8BLmVb72t?=
 =?us-ascii?Q?j4I7GU/DBVeFxYHhalAOOLQdvpOMfCEy7wzYCb8RQbpDw0XrNAB1E1lbV6RX?=
 =?us-ascii?Q?H6bBtAx/f3f4H/ozJ6J2PdR47Xn8onaQIlMp41v8tVdMybq9/37CvCzK1JxB?=
 =?us-ascii?Q?lo0UstG8v6deuZ0NGA59k6ao1TBMK5bS1/mc360sOU+QEEY9dnuR/VAWmIeH?=
 =?us-ascii?Q?DIoZcLkPf4NJTPpqbMocybm6NJUOQMKlsmJtG8z8kTX+56SZIlWZnLIfd9yS?=
 =?us-ascii?Q?pCumm63BNSD4Zoq83ChhHv3pnITwMWkm1bOvpznl2TVRkk6YQ8pNChVpp9dO?=
 =?us-ascii?Q?l90FsZotXW00s0X45sDeQMlI3oaIsUk9?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-05f45.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d8fde611-5b18-464f-bd65-08da1a43c86a
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB2128.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2022 16:12:45.6741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB1513
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

That's awesome! Please let me know when you have published your work.

By the way, by saying 'using async', do you mean that you have also written a runtime like `tokio`?

Howard
