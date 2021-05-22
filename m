Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D33CC2B9F2
	for <rust-for-linux@archiver.kernel.org>; Sat, 22 May 2021 08:22:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 387C8611BD
	for <rust-for-linux@archiver.kernel.org>; Sat, 22 May 2021 08:22:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbhEVIXx (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 22 May 2021 04:23:53 -0400
Received: from mail-eopbgr100130.outbound.protection.outlook.com ([40.107.10.130]:62776
        "EHLO GBR01-LO2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230023AbhEVIXx (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 22 May 2021 04:23:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdDF91mAwPiqSnSVgm3WSZDLOkTRU1R1MYHkMFFSL3nO2aqrlWbZObPxsSiDLc+5VyE2a64LhROrZy1eB4VS6aT9WaPCTNTx8kFKZpuFryrlS5DuC0dKXK4/dpLWGa1O3X8nPfqZXvBlfmkxf+WLeql3JxB4RjN8SvT03k00zJfMwQac4KeIn5wc0sNcugzObg0+O/WHfC9Xd/xTzsCLZjolyK+vIfIUY1zJU8bZGEsNU6Y349CHYwYYKhdX7MwlSmA6cDJqcmk+1FEPS1Eoo2BmRiFqLJBhbgpNM3UFD1OpGM2CGXFjP0vDGbAXZ1xbz0nAwP88S8ximVdNHBWgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ClHEO4OCw3FFXS7k7QihZ6qiumI03wYuRNX4AdBT7k=;
 b=XFXbOmRqKBG3a9FaDfIhBf7q33imnc6WwFgyyhSn5uTsHQb3JOTMjH0YFtfbsN3O4M/+K6kS2oXZGCcr4JLmBU3vRdZ98G4zGiKXWfro2w+Uq3iGi25hJn3BD+q3LI6gQX4BI/svApf/zJPkOi291UjOAGqdxcycry7iP4TWJ/P8Ug9CsASFPTT1MGhmFxyHuNNenrUTVJeMJU026Cw46SEoZsPze+/2BUq42qaB2c7kUzd6S17E9wyDfUn+Mrd8GUIOwRroIRmudahqqJd3YoiSz3pPDMEMCgeun5ZmoxcXlOhU8YUQ3lc7mB0fddQJY9ZeT/Qyc7Iks/bvmLylPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ClHEO4OCw3FFXS7k7QihZ6qiumI03wYuRNX4AdBT7k=;
 b=EuKMkUG0nlK2d/Vs8neRSaLE4aIinculR8/099cGwTsvrq2VTX/h9cf7LEZwX3w0Wwu9ATZkAQ/JIzrOoMMzToYc7Wx2baCWI6feQ3qeUAzJ4ke6bNd7X74hrMx5RFnK79Hxfi1ac4Oq6bEJTARHcTtBPLcNJWpvpByxBmlJwXA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=garyguo.net;
Received: from LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16::23)
 by LO3P265MB2282.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:100::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Sat, 22 May
 2021 08:22:27 +0000
Received: from LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
 ([fe80::944f:5a46:312d:8099]) by LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
 ([fe80::944f:5a46:312d:8099%3]) with mapi id 15.20.4150.025; Sat, 22 May 2021
 08:22:27 +0000
Date:   Sat, 22 May 2021 09:22:24 +0100
From:   Gary Guo <gary@garyguo.net>
To:     Hanqing Zhao <ouckarlzhao@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: [KernelAllocator] Usage of GlobalAlloc
Message-ID: <20210522090942.0000158b@garyguo.net>
In-Reply-To: <CAKmvQ+WEAFJCAn2my8iRUZBDvREExsFCydUxZxUxfSV51MK_Uw@mail.gmail.com>
References: <CAKmvQ+WEAFJCAn2my8iRUZBDvREExsFCydUxZxUxfSV51MK_Uw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2001:470:6972:501:68e9:dbb0:f303:32d6]
X-ClientProxiedBy: LO2P265CA0279.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::27) To LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:16::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2001:470:6972:501:68e9:dbb0:f303:32d6) by LO2P265CA0279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Sat, 22 May 2021 08:22:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4728077a-9aad-4252-c63c-08d91cfabbed
X-MS-TrafficTypeDiagnostic: LO3P265MB2282:
X-Microsoft-Antispam-PRVS: <LO3P265MB2282AA46BD260E02B1666FDBD6289@LO3P265MB2282.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VM0A8TLOqrHKDwBRzxbwgSX511fNCv8o4Vi8ddpeKNlpeZ82wdqmg1k8WpGo4JLLrzlXotBVBmZzetObuqHbVsKMdMe3EGcAu3VsqyRUh7rYsrqM4tQoPXSaqKT1sgyLPw+5B6ieuAhN8jPOhV2VgBfcwTOs/rK+AvfHdoJzRupl4CIwzP7rPXN2w4f8NOwpHCJjlildbWEil+3Mjes3Fku6MhDVdlajF2RKlhsOXWf6U5i460GpTJjPUG27Ex57zJTjgCig/AXXTRFdliHPbO5j6TH/wNzPnHGMLYIlo1EveTXxbl8JXVf7hVqjyLDbYGZVuV5lEh0OCP5gnBgKPMy663IkgY9wJa79rlw97Um2K4Spn6qb3szQ9adncGOttn1HCPPn+zWqkzL+S1GPQFxQ48bwIBN593GeEtPhreWsKv5ra2D/qLp5PIz8yeV/GOvu5BGfjvyQ63h6PVLjB/sPV3MRp+HUIIPEW8IaFShBW+zyqjONMn+i0yHQS5xEMdzkkHoxF3oNl42B8QN+v1p1v0wvRYx/LUuYC3ZBYxRTIFnUEEstD5g5rM4HkBMHx91KsfBIHuoi+U/S50Jypf+tsvDndYFL9F+EQkqjf+zRsUQQboAgHnsTfB1/Ji0uKFcq/8xO/ASZzwOnmysmoqV0KD93bxkIv1XzGU10/8hFqXSJeIiZXJo5oscTCMewlr+EXUxhbRYuBSRi/D1uTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(136003)(376002)(39830400003)(366004)(346002)(396003)(16526019)(186003)(4326008)(83380400001)(36756003)(6916009)(8676002)(316002)(8936002)(2906002)(2616005)(1076003)(5660300002)(66476007)(66946007)(966005)(38100700002)(6496006)(6486002)(478600001)(66556008)(86362001)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yujTN/twCQISqd/Yza5+oMyIljGrdz+4RYJyStUFEpJ2yg7Lxr9uEfYnB9CL?=
 =?us-ascii?Q?PGye6xylHfhhTtayMJraKFc5FjxLahjzGqZC4zFj4sx2jPCpKHxUxHGITJB2?=
 =?us-ascii?Q?jKx1Z6+WtL8yM5Tpg5uLcaLxC/WXbfu/q1VwMr5qdwBSpB0YJ7M2KT8NN7N8?=
 =?us-ascii?Q?tod/le0z+zR6ORhMqPTme/ywvr5knecsWUzHE5OKTUX+6YKIel39+WcGhpbH?=
 =?us-ascii?Q?gf2ZkUk4kkk/4DC71cpDdTAc3MAubJ5I2h+npXRBuwpBKOCJfwxvf+UJlmhe?=
 =?us-ascii?Q?SidSFRQ/LUj0GiWlo/SqfuadSFGQdRnTB8i2aXb3/8dFWU5TKqUQXRCHjC7a?=
 =?us-ascii?Q?jVoDYQcjCSmx9xKhv7mKmx26XArQMMpllNLhwzmozHICNCJhkhXu1qAqBos/?=
 =?us-ascii?Q?K+6qY8F31Itrp5RCY3DVzPFUkXbljY5ju4T5vvktu2+s3f0orj1TX6wO8kCM?=
 =?us-ascii?Q?q8Bh8wo0uwWOlihNafSVdBzlFaykzDo55VfNLo7yLQxHddOKtMUp8TWHPO8g?=
 =?us-ascii?Q?8pLyw+7VXdvF7Te2D/kSSFGPmFBozYppSPeCDlbhBA6BWMQjDlmKMDlKfIU/?=
 =?us-ascii?Q?Jk7JyDzgbEOn77V6+JZbd4IPC2h24tGLUMZSkb3x07eWuQr+zZmz3+B2lMxM?=
 =?us-ascii?Q?liTh9sMc6DPxBcMEm1LdBjrE2nka2CwrBmdX6SPcqnjSMqNlwu5HBjIzj0qJ?=
 =?us-ascii?Q?/GnQFnHMlyXSTC1Ij5VrUbbdncFmzwZvcV7B+HgkILe8IFzdRzXE+KLVptxT?=
 =?us-ascii?Q?EuI1t1KlOQFR+/qVT5xwVr51QfS8ePxS61Vb3vZVbi7eqGzxdOmcRGN7gwKC?=
 =?us-ascii?Q?wQ/PoPhybr0LbIn7K6KDeLB/LK20k6viXCWru1K36ymAg9UvdGEQEcxsB+Sq?=
 =?us-ascii?Q?5DygKdsraoMUXHNR7LKhnwCvp5bwJVEJP5Ww1I+ldgzJSr9833S1bSA44Cvh?=
 =?us-ascii?Q?TFo0Yi04gICHQ/FAzsAbV/1ZXFaZJyGStLPuxbE7aX2A8Esj6GWQr9qv/Gv7?=
 =?us-ascii?Q?JVdZ5aG6MY11zZvlLuOK4fKZQzVro3Slb7Avz4hjA3KlRDNENEqdmLD214K1?=
 =?us-ascii?Q?itkER+mEHdhkiFmGbcyRuX/A9UDAoujQpomqSFPHbrZa5yJlt/SGR7qGc76D?=
 =?us-ascii?Q?+uRC7pcQlIM5+qsxCE4D7qsb85PbcFBjDYchsoC0cCvrD9QQHp748ehWdQMp?=
 =?us-ascii?Q?DOMda/PTvSlzEb9Qb5pVMyUqiEu9AFMAYYXJmRVOemtbtZaFwpuVezENYCAu?=
 =?us-ascii?Q?o6ifyBWJ1HSGrFpRXpJbEgF5symbFkYXMKoOzJWrvn47k+xZfnRxzxuKFt7k?=
 =?us-ascii?Q?ifXXM64Q73LPAIEALdMjVk751gBf/F9aPWiYw6PWk7Pv4Arn2Y7XN+honUw2?=
 =?us-ascii?Q?Oqzik71GKDWzTw3VcoTlhS2HbSS7?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4728077a-9aad-4252-c63c-08d91cfabbed
X-MS-Exchange-CrossTenant-AuthSource: LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2021 08:22:27.0649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3LYQXoCALA7vtPx03Ov4Xv5nZCsvC8+dFMSM/PKswiJ8AMKilxeRVzLPut1tHDoZ46mXJC+UNpQSvFfCfC8hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2282
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, 21 May 2021 13:42:40 -0400
Hanqing Zhao <ouckarlzhao@gmail.com> wrote:

> While implementing an alloc crate, I intend to pass custom parameters
> and extra parameters such as
> memory flags (GFP_KERNEL, GFP_ATOMIC, etc) through the `Layout`
> parameter.

This sounds very wrong. `Layout` should only contain size and align,
but not other stuff. `Layout` is part of libcore, and it is a lang item
(aka part of the Rust language, tightly coupled to the compiler), so
you shouldn't change that.

> However, the current implementation of GlobalAlloc
> (https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/allocator.rs#L13)
> is not actually used,
> because the kernel allocation directly resorts to `__rust_alloc`
> (
> https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/allocator.rs\#L34),
> `__rust_dealloc`, etc.

This is a complicated. Rust will call `__rust_alloc` for all
allocations that use the global allocator. Rust will also generate
`__rust_alloc` automatically if the target is a binary, `.a` or `.so`,
but it wouldn't generate it for `.o`.

So we currently manually implement these functions. Perhaps we should
redirect `__rust_alloc` to `<KernelAllocator as GlobalAlloc>::alloc`,
but since `alloc` also just calls `bindings::krealloc` it does not
matter much.

> While implementing an alloc crate, I intend to pass custom parameters
> and extra parameters such as
> memory flags (GFP_KERNEL, GFP_ATOMIC, etc) through the `Layout`
> parameter.

Back to start. Why do you need to want to specify these through
`Layout`? As for the flags, we've discussed about this topic ~1 month
ago in the meeting
(https://lore.kernel.org/rust-for-linux/alpine.DEB.2.11.2104241558400.11174@titan.ldpreload.com/)
weeks ago in the meeting, and we've concluded that one should
invoke kmalloc themselves and use unsafe APIs to construct any
collections if they want sepcial flags (e.g. GFP_DMA).

A quick grep shows that in drivers/ there are 30k GFP_'s, and 27k of
them are GFP_KERNEL, 3k being GFP_ATOMIC, just 1k for the rest. If
possible we want to automatically detect the context and use
GFP_ATOMIC in interrupt contexts (see notes), but if it's not
possible probably we only need an `core::alloc::Alloc` that does
GFP_ATOMIC and do not need to have the allocator support arbitrary
flags.

- Gary Guo
