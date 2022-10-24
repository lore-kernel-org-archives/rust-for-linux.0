Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE39EFA373D
	for <rust-for-linux@archiver.kernel.org>; Tue, 25 Oct 2022 00:51:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbiJYAvj (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 24 Oct 2022 20:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbiJYAv2 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 24 Oct 2022 20:51:28 -0400
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (mail-cwlgbr01on2117.outbound.protection.outlook.com [40.107.11.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A7991C19DE;
        Mon, 24 Oct 2022 16:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSTMwFzquBCt7Ux/0s0pv0u/0GvKq3MDS/ivHes6K0cyAnpGB/AjDrKSHtd2TJpZNRhu99nCsO83gnTggp3/kH49nlZ/rGGOAsYVxf9GoZWQ3mKxgEWHX/oUbW5aCV8h2ILzCkrQwc1230d09awGVavQVcSbrq4OjMWh8C7dLOj5GgCWQU5vaaCgvh/nR9v5a3il4TpAY09qJHKQ7S2HYCS447aO/nPbRlWBl6BZRvxKwxTwnby9P7dxhQ6CWtketqhRRYzPVrZrKb7s7+lWj886J1+Nw5CrJpDSaVMteSV7wC08QJ+v13a9t55OhIpRnkvvF0BbMrFx3vwQ+Kk7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8vWng6n1DStMz7i3hXdK4jmQQWwd6o5hsP3FsLq7o8=;
 b=FIn4SM6oJPckTGGCQ3r6T5hEja4856HVxFqjwZ4aek9RqP/7f7xN9QgzyfqEfpBoolkmsjJxhG2v+u03vgjj7qGa26WfPdLVGr7Ja9TQZyYz7H9ZBVPqGRZPwmNJAHglYFm/b1tQgOmuJdfl2kGA4xlZmBOMcLsAMbCCO34vdu9v+XyxfGpy6cT9gwDzpWm9/Iegsx0ijGaoZd7dR3WTLPIRCU3efovuwHuMnZkN3gprgsqPfuMCXJVVFgz2kBlLnksRSPalhVscJrftV0bmOffx3Q0IAfAnlNWHUfwM91yIaI8yBLq3HBSiHmcnfAFj00q/zBucdshh5D73VjtKMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8vWng6n1DStMz7i3hXdK4jmQQWwd6o5hsP3FsLq7o8=;
 b=EGBp9JLHuTwXiImwZ4yrjMVv/3NaMuxbHSbbfOtktYnAki9JWkO0BsB9KmDcSBg0bDdQX5jC3p2m1Z1dYJXB4HyuKKABZt0xhx9dTBIvamZan727Zn7QuyA7dBUMbox2kXBm5bYtfxFuHjp/w0QD6wRu3seDSs95Q4ObxK8uJvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LNXP265MB2539.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:126::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 23:31:24 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cf2b:281:50ee:3304]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cf2b:281:50ee:3304%6]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 23:31:24 +0000
Date:   Tue, 25 Oct 2022 00:31:21 +0100
From:   Gary Guo <gary@garyguo.net>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        bjorn3_gh@protonmail.com, rust-for-linux@vger.kernel.org,
        bobwxc@email.cn, wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v2 4/5] docs/zh_CN: Add rust/coding-guidelines Chinese
 translation
Message-ID: <20221025003121.527b872c@GaryWorkstation>
In-Reply-To: <c2795f10c65b4ff11c028a1f1f3cc9e2a55e520e.1666097959.git.siyanteng@loongson.cn>
References: <cover.1666097959.git.siyanteng@loongson.cn>
        <c2795f10c65b4ff11c028a1f1f3cc9e2a55e520e.1666097959.git.siyanteng@loongson.cn>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::20) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LNXP265MB2539:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee7341b-4e0f-418b-1b7e-08dab617dd50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wuZe2iYvcI4OTYlsbteIl4KIYmQUxTOe7fZVyPbLADvL1exzYjzClOmesPbXImqaDwiJuXmQKbmMbXHdW2fPNuf/6LeuKM0AvJ84bw6rlSKkc+sMPsaAwZ9ASpZ3PUD1gcv5W6OCmNgDY+Y8NzU31v9LAxoBE2hKn2UyIe8Hyq9uZqLEVFcujmJrhJ4jmlU8+XX1+tePpZGfnSMai0kbf9xawdM15jrTWMuA2dYeXnn7FwGQeVBbCAFVjqTkVHuAWUg7/My8/n/l2Dj4d7SsJ1wXOihyGQ+OqScnq+LbIJaIkDJALN1urFth/jN/p2PL1s8LO1agO5TesDNnrBCF6RhWWmB3ykmHNqw9O6U0mvjw0f8iX2/A2GRdn1cpdMkO5oK+lxAGeaJtE36qyDPpnx8uCxPodzoxGuZNRm5lWNXCrhuu34I/XoDs3GlrhNNbE2nv9X+877qG66UpRU0FcO9afwwTQrDabUKsWGcCenCleD6MRnip8otGwZZ/ucYcVn28Kyh5ugYjXmpb3R2TCbkFk8CkbOke6MLmf4XcWDGrSZDIt77WCqlkNmvszQgKczsEJQ2l1SET9iExnvlseX6NPQcJouMEALjXNS24JvhA4jL60l9jhql5FT6znBW0zG448DNyUsSF2XyQdjyGtQ7/PpzgbY3ZaWS8ELFCEIsuMl5ppTnatHj7LOiXLxH2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(39830400003)(136003)(376002)(396003)(366004)(451199015)(4326008)(6506007)(66556008)(6666004)(8676002)(66476007)(66946007)(316002)(6916009)(86362001)(7416002)(4744005)(2906002)(41300700001)(1076003)(5660300002)(9686003)(186003)(83380400001)(6512007)(8936002)(6486002)(478600001)(33716001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TOiGUT7W4XZtibvpKSZqKFniohTZblYOzXL0DAID5bcLNokq+p9GobLwGjxs?=
 =?us-ascii?Q?NdHoQz2kturSOCcqLOxQOAvwMusOMMU6mkTUFHdFLveEdzerlW6gMCTrBsZk?=
 =?us-ascii?Q?18kLIm5pkM+kkUC73ocUP1S+dyB8spIjd/EL4VlPGl1FqRVLCWukUG7ZsOLI?=
 =?us-ascii?Q?tWdifDIY2AmcjuDHyBQmRBERKXiYlVhOBY6Hx13QNaXiGjRkZ35R3SDIp926?=
 =?us-ascii?Q?K6SJHR1YaZ0SZZXcVxIY3Sfd+V6YRBOmyJyrJM4OW/19s+Wp6rtRo5DDIKCt?=
 =?us-ascii?Q?IQqeogldOg63g4caU54UJUJxQHObXLzA//pUb3+RuN0PdRYBb7vqmL1oG1xq?=
 =?us-ascii?Q?BxJV07S6fQYBBldHH2jc9tQqohzGShs7AS/wwE0ppUynfPbZ9Puhoc2RP7zK?=
 =?us-ascii?Q?i+hheo27Q3xcuq72CymeyzMBfGY5AyRlc44Quvlusz/ywWEydrAj3sH3BrK9?=
 =?us-ascii?Q?edN5/OQlwdSoMaj7U6Z39iyTTFdngzFG86qKZl9CGeY8QRw4DuNMabTtWNiv?=
 =?us-ascii?Q?Mno6X2fC84WHZQHbp4O99tYVFIknUmOFixXWGe3cz3o29vu2eIylkecrpKHH?=
 =?us-ascii?Q?lGj7d2ZOr4jZxUlvrLYMxBDw9Cv6efn3PRncIQurLD6EGTZsTwojiWwTjoeG?=
 =?us-ascii?Q?wSbhVUCU/JYSyl5XbVmdnGiJAcve6vnNzxNhwCyFENnIwHhAUGfMaXmThYAX?=
 =?us-ascii?Q?G7isetaoSA6INd4+8t/zeHjZGtBhcWIktifHoUpHY4gtpj4hWdo3hG/9L80a?=
 =?us-ascii?Q?hRtx9VlTRaOZp5P4FRE6YCbqbBJt5MbwWS0q7j/tF241JBAMUthEDcreKRKF?=
 =?us-ascii?Q?DEQV09SNN0h3wkm5+sJhVddCctnDmpP/7wgCcVBN6dPk4G7wRXnNR4H7GTTJ?=
 =?us-ascii?Q?4SzOO8O86zIe0W01Xrrim5BOcS9+PHUTRgyBv4CsuDjfH2GsC15X/JRgkOSn?=
 =?us-ascii?Q?7UBavpAq7F2XDh8ILxX4VUbHU2kfbuVoJMXo82tWqADkTPkdbQvPSiAtUgxO?=
 =?us-ascii?Q?6yHVOenCkP0ml6Mw317jrcY7Uuqd52T+bwMRL7BxDib5sipouRkvjIA4YDnR?=
 =?us-ascii?Q?1YPMUp40yFweGO8SDxxyIcDhq7g12e+MlbigkqILn18FP9IDEXczkW56qJoH?=
 =?us-ascii?Q?MqIxQA3a6tm+eTxKXtsZ8riWVKSf42Gfe2mwnI17Te83A0mSwbzQujRpTP96?=
 =?us-ascii?Q?/mrws6oncSFvAni9oem2NIMIHFGZmlt4m1DbagQ+FNJx0zjZ3u2q7kZfPfLn?=
 =?us-ascii?Q?FsRRY4WT9wZ9HqTBOwsCtKdDnGvDaAfJ9THbv21cWCI5T+yfuz3fTkequ4R/?=
 =?us-ascii?Q?XFhgA9+oqUrNQDkPUycMDJLtcgMAf3cdpQd11URKmccZq0FcfDhJKHWoGRdN?=
 =?us-ascii?Q?BcPaQKatIYeSscvuPt9GvASGwC4JznktfFWmZ2D+HeI8+CL+oDu02ZVLcU39?=
 =?us-ascii?Q?bRNgGKjRLvrfuwFtM2BGqfh/iBFltPNkj15zF00quC3q1W5ZHCQHtcA2vb6M?=
 =?us-ascii?Q?XMHatX2K1Rb/f15u4BDEqooUDiAMG2T6Rl3ZaAqXU2n1bg23+iT8/6E8zKR4?=
 =?us-ascii?Q?U8yQlugZ+cUZGxKIURUCUGLZKxffe+ox+FFas8AEF1sO/Z6nGq2/Cb5idMmd?=
 =?us-ascii?Q?QlRmXKnddl8Q4xO4y9MjHXmMbb7Nk4163FYm9nLlQKxA?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee7341b-4e0f-418b-1b7e-08dab617dd50
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 23:31:24.0801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HjgPa1PKFEr3ZrguDmdVgGvLs4fB6zomJnlUOsxXG4mn4/Xx59mOKr6da+pxyrLDGAKiM427KieDQEczZowzhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2539
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, 18 Oct 2022 21:07:00 +0800
Yanteng Si <siyanteng@loongson.cn> wrote:

> Translate .../rust/coding-guidelines.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  .../zh_CN/rust/coding-guidelines.rst          | 192 ++++++++++++++++++
>  .../translations/zh_CN/rust/index.rst         |   2 +-
>  2 files changed, 193 insertions(+), 1 deletion(-)
