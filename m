Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFE1FA373D
	for <rust-for-linux@archiver.kernel.org>; Tue, 25 Oct 2022 00:52:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbiJYAwV (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 24 Oct 2022 20:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbiJYAwJ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 24 Oct 2022 20:52:09 -0400
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (mail-cwlgbr01on2106.outbound.protection.outlook.com [40.107.11.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 905CAF6C02;
        Mon, 24 Oct 2022 16:33:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpBw3TkD/hTvlVfnIpH6IcbIQPq76MMID/cnUlgzuxXhYtDH2bl4RyIGwnNGaIfsVk/N1oMtkd/jQCNcBwtu8uy/vhf4He6Tgnj6td8ZDDz3t+wW0PhsMKSWLuSmadyUlZECEEugtpMYUU4BwDL7nnqMi0q0qwC5CLrMNkyAP778VNzn4RBDzSZ+60IN4xPl6cFUbqQNd4BRAN7i1KVF2lK0w/qMpkCZ2ctAf7TDSRUkndh/0+V2JdK4Ya6DmWaOAlKQgr64h5axOl2SzRqfZVap0m0VSle7lx5V9coE4YdmShDsc+zvkMu38prWYrEUfE29xud7pu6xUaxAT+h1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUpoHYhPPiTmgSq/CS6ac14zVe/c1teh2vJ/0vNJDqE=;
 b=IxCmEQyEZjED25WZcjaspprBiMAeMXiXMlDRT/T5QAhc7o4ajO0gLMGsIyONOqd4KDNvV7RuAEctawP1W0x1pZ5FGqosyJ4jPQAeGwHnh/k29Yj9SzSo+8eP7jBfw3fI4LzymCxOyWFffwZWqxTCCvF2cR/oZKZl4zkFlxcNitCOZfuCLQCWPtv9qNlC4d12Psy4v+10lbPw0G11NG/N0n9YvHNVUPOYYa66PRXCmb3YLfe7r3SfAjUOpiVBZ1vAOCxWDqk+E1LgZHGeRT4qAx5AqiUnRx4laG+6gpW1zHxIIjL7E7Bwga3cvk+herk1celwbaz43C1lD6HoV4YaJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUpoHYhPPiTmgSq/CS6ac14zVe/c1teh2vJ/0vNJDqE=;
 b=Cry8AlD02SQSFQ8lVGdYUeTCaDYBoabKcfLmGFk+zJX2PLX5+3+c8G3pnaubn+xwZG+JVV0JPZ+TMA6NAMqAYHmI6aTU8vn1DZrSS2GZwU28PwC/ApStk0hqDTZ8U8F1CIxDpzJ8yNXnUroxoHXIF8rui7U+TrTWBDZEya+34XM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LNXP265MB2539.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:126::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 23:32:58 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cf2b:281:50ee:3304]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cf2b:281:50ee:3304%6]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 23:32:58 +0000
Date:   Tue, 25 Oct 2022 00:32:55 +0100
From:   Gary Guo <gary@garyguo.net>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        bjorn3_gh@protonmail.com, rust-for-linux@vger.kernel.org,
        bobwxc@email.cn, wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v2 5/5] docs/zh_CN: Add rust/arch-support Chinese
 translation
Message-ID: <20221025003255.162d126a@GaryWorkstation>
In-Reply-To: <69462d6bf842950080c56d1e51adc318e79c9a19.1666097959.git.siyanteng@loongson.cn>
References: <cover.1666097959.git.siyanteng@loongson.cn>
        <69462d6bf842950080c56d1e51adc318e79c9a19.1666097959.git.siyanteng@loongson.cn>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0617.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::18) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LNXP265MB2539:EE_
X-MS-Office365-Filtering-Correlation-Id: f51a9f67-ce2d-41ac-6b7f-08dab6181582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3HLmPspkxZ6K4jVjZlsykg43NuHvPF26FFkqm5ALVosYOwCR+DYeW/PsmL6C0Cn25bz8f6WL/8rlS8QuUjQ0nzu8SjLYbC6PhY1OoY8v0faZdkcZ5r4zw8e8oYm6ZptL7vouMuPLmLtoQ0nEWCKGt7txAh7zD+s7dWFVCbtbXjtF4aTO1WYv8P3AUAHTBtZMmoYSW3tVkfN7kf3Zgq4oieS2fKbqrvzjIKM9TB+DC859HG15ODhnieA6JTbLzHcrz9IPc+qS35Uzz1JrzmMw8cDVqXS5xruvc0Ub2SAu8D58YQGUqvoZ4nIVYOU8H2lo4W2j4PgcoL+Amjg85TyveADfgPncBNEbYZ7zYJOcobI+yu3godSGeRCPboSrnKM1gJp2E9xLl4fAKH9Z6LN6ffodPax0mi/mKG3b4UlvXSaFw2yrkSKvcFVeRqyXuXk+/ZPafhfGsZQwkVcXdtQiAu++XdNNUTkpzt/iZIG+G+QNe2BGLW83FMKXXs3fpYqh4b7Qp0Fuj6V3gjuBFp8FNKKtmJAXuvvv38V15iGKocA1hHP81FMfu9p923px2L1455OQJoGVCV+dUTjI4nQHb92FnDUkXZAuNtZh6OKT+2YIJgIc8fxZVc6lXAizLbhYrLmjW/BkWtyY0shS0GSBv4BMulzrD6BCLUMJ6yIWXaUTe175FtUp9349Qv3nd5TqNUcGRIlwKmuZMU9HM5mdOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(39830400003)(136003)(376002)(396003)(366004)(451199015)(4326008)(6506007)(66556008)(6666004)(8676002)(66476007)(66946007)(316002)(6916009)(86362001)(7416002)(4744005)(2906002)(41300700001)(1076003)(5660300002)(9686003)(186003)(83380400001)(6512007)(8936002)(6486002)(478600001)(33716001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A+/7ahE89courpHab65zU3Sb+Zxd0OVWZvAJlw01i7xB/wc8ct0jXnS0urq3?=
 =?us-ascii?Q?ZbrnXQr4JXPjdNMyMKCrFNqVmq3MuLYPBKbHMFEWAVEDY2G12Y18QD42Gowa?=
 =?us-ascii?Q?KHK+COSMTyREEy64sYBmEaMkOQCVI+4coP3Jo+jGBaT6+B4lBZdUvKGlnddc?=
 =?us-ascii?Q?AWA+oQY0/6eBpqGLdv99Kw25MLEsQ3mWl0/1GYkB20uAa2/CgYUuKFbMhZDZ?=
 =?us-ascii?Q?uUdkbqTw5drbio4ug/wmq9DVd9P/K92AgBy7BfLKrwEoNJaUaZobfVTVNBhO?=
 =?us-ascii?Q?feJIuyoJYX2cRqNqgRe83iKL2ukOvcQxeYVrv9nOlmFbBjp2yqLeSt9ehq52?=
 =?us-ascii?Q?j85v6gELBW4QQmhD9H/xv+WvP5atLvJY37iSOAQEeOhToo7BntNYfB68CQMm?=
 =?us-ascii?Q?V3uCXCvj1gBRULIm/Xcxq0tKa56+5fYw5QRJeReJr7jLNiQF1Twa8GqGx+mA?=
 =?us-ascii?Q?eZWQbpthWRHN2SePLaUz+TNMx5OUIfmM8diGpq0XQ3Kxy5joRsMm0gX+tFTT?=
 =?us-ascii?Q?fGOHjmekJn5ocrnWcX62pPnm4NRwpKIXh/uJy46YsKM3OV/R3/LhbfBKH1UP?=
 =?us-ascii?Q?634e7j4+M3KnJOUzv+Zh6PE9UKLiL7HeDswMrPommftLV4j3M4svZVEqfp7/?=
 =?us-ascii?Q?tvPJ8jKz253sV3dcNwMyc1W/26MVqaBjcYAiJ+tW0ZPa6zftVukbsXbw4XBo?=
 =?us-ascii?Q?JOKZA+Cbqb1ip/Xmrwsq6eIjLKVbcNiEpXhjM4Awg1cZY5Tp6ySTL7LXGu/X?=
 =?us-ascii?Q?kLISBipOiPa80Kyj8P0b32asSoozzOIkfZrAo/2sFKyL03fcEAgp27Elr5sH?=
 =?us-ascii?Q?UPArdHP0/55PVk0lbHj8JXc5peVBtolnm3sHeh9Z040zh6zBrb5E6g0q4E1w?=
 =?us-ascii?Q?l1bs5rX4VqFAb/YQedI3tNVvPNMmt2B85Z4IS+jcr0Pbf9ufMWycQQJytgAd?=
 =?us-ascii?Q?5+jNhumt9Fh8UFoKCD7hfmF9LGlVFioTjcDLYX/Mane32ytiXL8C3jF7blFg?=
 =?us-ascii?Q?Lc4xqZ478vrL/cZ+eE0UbpLOultLRTMOKYW5l/WKg5H3f071QpWCsPs/QRNj?=
 =?us-ascii?Q?LFGQchBsE4M/fMkZyuOhhpDl/ObMVh2p0cqzf8cw2oZ9w1ePfQxH2uEEitml?=
 =?us-ascii?Q?Q8RRRhqhsc4H5hQhU7CZyOKDNfwRuRMuKXUt8ppYVHOkb9lFLxL+OBDfAb7P?=
 =?us-ascii?Q?uLHjK7aOyfaGR14MF0oWetuKkbqQsTdu52jzFBi9dsduUmyVGOYKEl1SWeca?=
 =?us-ascii?Q?W814/iJBVG4Gww9RfnO6m+DG9rtQyvJBx2RB0In9aEIp+QbPFpOE96VAZnYw?=
 =?us-ascii?Q?C2vYqVIT7/YZ57aKyzKGU0u0a7iNrgFI5wqE/gxLKV7ugD+lXM5nYH6Nz18F?=
 =?us-ascii?Q?e1yaO8lHqTR7cq2mylG5SILsBN/j3EUaLifKv78+Ka9fxu9Ppg5R9e3hsgdV?=
 =?us-ascii?Q?aC9q4AyP+yLmUo7HGiGraUf5jKyHADxNomhtsPjDmZ4uu24tIz+rCyb3Gein?=
 =?us-ascii?Q?EqDArpj76FZFljkKituxgGBdCWC5A9C3Jjr3jVcKsu9hoR8zHVgCXBUP1ZaT?=
 =?us-ascii?Q?wAauz/CqmsBwXGxo2ijV1aZuLyRj5AiwaIb+bTZUueHtK/N82nkB69FahpDB?=
 =?us-ascii?Q?8hieH/cV61TTEVb7U9cHB4Ix5TqZibS9as3++vLhoNXg?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f51a9f67-ce2d-41ac-6b7f-08dab6181582
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 23:32:58.3466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c55CiW72qNGfurLlxiEmNJrgwCf5R//b3pHsHAzkg44bT5a6cmvfiKJ4PXrVLhIcxkqCbpte3cl+shlQjysGJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2539
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, 18 Oct 2022 21:07:19 +0800
Yanteng Si <siyanteng@loongson.cn> wrote:

> Translate .../rust/arch-support.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  .../translations/zh_CN/rust/arch-support.rst  | 23 +++++++++++++++++++
>  .../translations/zh_CN/rust/index.rst         |  5 +---
>  2 files changed, 24 insertions(+), 4 deletions(-)
