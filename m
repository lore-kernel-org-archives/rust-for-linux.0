Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DD8FA3743
	for <rust-for-linux@archiver.kernel.org>; Tue, 25 Oct 2022 00:42:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbiJYAme (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 24 Oct 2022 20:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbiJYAmQ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 24 Oct 2022 20:42:16 -0400
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (mail-lo2gbr01on2117.outbound.protection.outlook.com [40.107.10.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF4D2C6E1A;
        Mon, 24 Oct 2022 16:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+RTX2Y3Gpdei2Umngw2xnT46oL5anw9hlqaWxFPSLGv9Ae9E+jQoK1bMRhMeIvBJ79Tj97/7r5ow5hpQEs8MSun9JqYfHBpeEeLYr3qntIy+LmplpbsDAc53cbrJ5IHZnLcmSbzzol+sP40Wbtt/TMYPMaw4bghMGaVySiq+FWh9e30Wvp2+TAgmuyYL98abtzbSbGG6qVjcqXjwgSZoDbMZR/9ybsAxdaPZt3P9ew14WGhaKoBDOeuoO5DNAHqJEqTaGMv8AUPPQVGb5yPtPbvlCSb5me9yfK1RSX3EMBOkxli7H0ouRvBgrWGYE2JHVDiOiKqB6Zqyui/z9DlNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKH/Y58EBWfEvkNZiZxWzNcT/PwLAcEXrzCGaZYC1KA=;
 b=B82VolqxI1K/K+M/YBYbHcoLMgDguXsHdutvGvo3Mn3/MY/7kPVXeSaeVFgMSd26ZXSWUdK6GZQwR99uPJNzHGJGdgj4Ew4hO6x4DkOtEPQju/Em6qOl62al78d6IsUFNh81l4ydPtnVMOZ8Iv95KpbZ25nsm+CQ1cs4ypgjLmkQi8Qe1snYLfC1c+MuEujotT9cMzyMu7W+HCOncNfwJO3VbLzwY2sz4NOYc+595Q/Eaol+g+UXZxa5iTbKHM5WvAcT0/Z23F1QB8E9rXrlsQo1b5go1m0dkRbQ0Fly/LMBMBoDRrD4JrjVkYKSYQFBVVMM7I6ICqfAEUTXOAaDjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKH/Y58EBWfEvkNZiZxWzNcT/PwLAcEXrzCGaZYC1KA=;
 b=h+8V058GZQxu3l5W/VQobpeQSCfeGocBHaecCOiQyB5upIjkeA1j8YMvHqIOT6n8zpo3dk+zmUBF6xunzJXUTejZNe+Wz5HfRMmPQPwF1cgNl3ODlf3Z1ENqCKqQTEjZ6xrW2wcGgehXTZjp0IZiEoEWzX1fD5wLOsevrFMK+gU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO2P265MB5774.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:26d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Mon, 24 Oct
 2022 23:13:48 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cf2b:281:50ee:3304]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cf2b:281:50ee:3304%6]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 23:13:48 +0000
Date:   Tue, 25 Oct 2022 00:13:44 +0100
From:   Gary Guo <gary@garyguo.net>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        bjorn3_gh@protonmail.com, rust-for-linux@vger.kernel.org,
        bobwxc@email.cn, wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v2 1/5] docs/zh_CN: Add rust/index Chinese translation
Message-ID: <20221025001344.19eb4e6b@GaryWorkstation>
In-Reply-To: <ff9b07cc36c3e32b3ee5cd1a04be45851a3272e1.1666097959.git.siyanteng@loongson.cn>
References: <cover.1666097959.git.siyanteng@loongson.cn>
        <ff9b07cc36c3e32b3ee5cd1a04be45851a3272e1.1666097959.git.siyanteng@loongson.cn>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0436.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::16) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO2P265MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c21b10-804f-4e0f-18db-08dab61567fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kVo76KoBxQhKFbnvbZhH/BytEOhBZ1EO1+H7/RB7ovweBFdq64fIWw4OBq+nBRL/6Cy+9ueultMFCv/gNSqk21/VwtC1CxoMho7LMMr1rLTgOox+aYjCVzKbQhLjWu+1AWI+jFxwGtNrNCGa60M2WXDkJblEtZ+/RW6lTGivwY4UGpEfTnVWF54yLHkt9/M3hKoR7ezhIlYmSElSySVB6eE3V/AQhEWQZQ0dj9Jx/kI5HC5dajPFksGC8avu/k5MtaetFasRsOkdHk5ltNm7Zd5ITH6xu9G80PoPZ13X+HfKEhynGvLe2taAPoL1UKWCktaUw5xf/9yXTQlSwE53N2/qq+gMHSQco0GtoUO5kRHtMwyWc/bSiAOPH51Ngj8EL0xSxSr6SImBIZTpjFobQoOJVIItlA0o4DKTYGQnc9uDh9l3U1OTu80cVZiqI6VG8tXRoQ0OHYkMVVphihSmYJWVvWpHFee6pFGYiA+BC/KyExpZ2D8ywqXE+L356rkZWBe+0CL6Ean8s9tEk7lDJ9+loBjFD2F9blak0iOT/i85/brmUqzAtKiFjottppU27v4aLdVATZY6bt+eEZqUSt1AhBtn4K255Zs3m59VYJnya2a5EO1f6J+fJJR8PZ6QJUBG0kNGVP1L/ttrv2DxedapH1WviWFRC6vPC7wh80B1Y1vthiIB7cqboa2DvjVFKtqQONNaylgIWz8fkiL7Xg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(39830400003)(346002)(366004)(396003)(136003)(451199015)(1076003)(186003)(6512007)(9686003)(2906002)(38100700002)(5660300002)(6916009)(7416002)(41300700001)(33716001)(6666004)(6506007)(66556008)(316002)(8936002)(66476007)(4326008)(4744005)(86362001)(66946007)(8676002)(478600001)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O1vGVkW5Df1qwtYGq9f2XBBR5oXJdRrKAHXO/FxDuQHFd2BWvLs3eu4e13t+?=
 =?us-ascii?Q?iDXuIkGR90PkHB/daR2c36eipDee4lXuYXlqQGho24CWi+aF9VIsTFNvYeUq?=
 =?us-ascii?Q?LZQhsJSqrWLoTiP7F9ghzntN8H64BJI4HrSppw/slNlmQ0DigdRSOwkSTTkU?=
 =?us-ascii?Q?mgjHqDnnpx0ib2SnEMLEai8j/BinlWx252q4TP435BttgkHVZz7JP3Q2iuVT?=
 =?us-ascii?Q?uI0Fkj4ei9E7K0oZM63m0pr8YfdELb5h8pbMjFqB8rFMCkBxfUs2l3GJZiVm?=
 =?us-ascii?Q?1LNf4WweIqVYHUFmp5p0EkrRr+bnZxfXFXKrQ+l0cayic1t+TYlCKHhExdgw?=
 =?us-ascii?Q?t8Jnfz6GoKWpOqSh33NsbDT+WqQjNRk3Wxdrg0u4fq8RgurgRY+X380C8vrJ?=
 =?us-ascii?Q?0OuBSt8oMKm++2ChwIdLH8xZM2LhXJUIpu43mg/ZdWvEu/A7MSlML8efiMmD?=
 =?us-ascii?Q?0s8LW08YGT480ZGYBmrUFNW2aBO/mamHrFFCbyU95/DL/gs6GmvB6+d9eqbH?=
 =?us-ascii?Q?T1pkWKeEBCylmVz1JvXeoAPE7ouRNdZiGfbCCjeizG/DXRZHZgMGgVFSZQzX?=
 =?us-ascii?Q?vUwMy397VlXECYk0DFIkfUQbSmiKnEjVSMs2Mo8sKE3De1Drtu0gGnm6J8nT?=
 =?us-ascii?Q?voxYgClzySSb/QZP+XQy7mtciiZhWHzV443DRTWjkMLuLV/T62PycK7lHmw0?=
 =?us-ascii?Q?dAtCnmSeolf0X9UTtFz0CsP709TrwTuM94A7EKZkMdiNNgbtSy13vwIpXKvU?=
 =?us-ascii?Q?bOaC+QO7eKzcSS9W/TNkiXwU5IT9yV7UT05WnPvgSsOUC3otiTVMpuKTVzFK?=
 =?us-ascii?Q?0rsCMr72tZhNWee4rlpc1thOkUAMRTzancQ2OUslDyfNZuTV7zLJwYTFBKr5?=
 =?us-ascii?Q?JeyIoCsWCIFw6m18UhpuNxAns3JzRo9khmjPXx/THQV5yMbziBJMrdW+QD/1?=
 =?us-ascii?Q?1qVsVPYNWXyjBouVYzNI3Wpyub96dGny64t8MPkm0LhxomsWARxYOiHy1sax?=
 =?us-ascii?Q?s7AfuxJ1r5mKIbrAFxitQ/eaKnVX2yYmBfuW5345x6Vz/PY77hwOreiv/yuj?=
 =?us-ascii?Q?ANx+Xkgg2Nc+FAUtBTTzdQ0H6OFL71xVmdTVnTXXoWQPTmGL380k1CM1frB/?=
 =?us-ascii?Q?tigoGS0H6D08vPwy+I84Ji72yNdQRbtU2wz54VzAcmhp7WcsjM0KGB49L9f1?=
 =?us-ascii?Q?XICcNZklycjcIpVSyv5DFiE0TPGnT9KasM4UWl8tn2BMlaB/7cFXkBunq3Mf?=
 =?us-ascii?Q?oWPDaimHySN9enTfonDz+zqJ8UNMVOQ+fhPIXnBhIFsmwsDHTM8tYARUWXqr?=
 =?us-ascii?Q?jQ02+/wlpDF05GxFP9EpnCiPctxzZj+FfFbht42OBbSnAULMJ9NBGZwkAQxV?=
 =?us-ascii?Q?nabxaMH/9HdOUcvhsuVKQZR6l4lZeYIJsQ1cONXGwQriKWFuDvzzaedGRPrP?=
 =?us-ascii?Q?f86lh8/padTZlwXAO8SGfrXw5qE/Fq0XQRlajCpNs/RqiAY+Y7YBboLEH4py?=
 =?us-ascii?Q?KHTowVxRjVdJlC+uax47EC/NFnT7U2L6hIXK9Bvc8S1yTwL6/Q5C/Wvwk+OW?=
 =?us-ascii?Q?hjqi1ugs6cfDHn0t3/nylAv8fbMONmpkpvG95rNCANbFZMV6yBPgaiEJsGkt?=
 =?us-ascii?Q?BcDvi3pgWAMq3YINysXP3O2Ad+FJzucRbXixYwIcLrpE?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c21b10-804f-4e0f-18db-08dab61567fa
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 23:13:48.2452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zko85sQdXS0l65/9nHxlq/xaK1qaqzqftpQzoVPQ0Z0TGosHp1PEWhApCSE25G0xIz7usU5L4PV6vMC29lV9xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5774
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, 18 Oct 2022 21:04:21 +0800
Yanteng Si <siyanteng@loongson.cn> wrote:

> Translate .../rust/index.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  Documentation/translations/zh_CN/index.rst    |  1 +
>  .../translations/zh_CN/rust/index.rst         | 31
> +++++++++++++++++++ 2 files changed, 32 insertions(+)
