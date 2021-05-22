Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C097C2B9F2
	for <rust-for-linux@archiver.kernel.org>; Sat, 22 May 2021 19:18:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FA7661073
	for <rust-for-linux@archiver.kernel.org>; Sat, 22 May 2021 19:18:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbhEVTT2 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 22 May 2021 15:19:28 -0400
Received: from mail-eopbgr100094.outbound.protection.outlook.com ([40.107.10.94]:19808
        "EHLO GBR01-LO2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231310AbhEVTT1 (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 22 May 2021 15:19:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HW9hSGAvGye7SP8EFb+HgwsYsNYfIdfYslXQsONtqGcmEtRYcbWMqECvlN5zkkzPOHonNiISW0g0/HL2Kdnkchi/am8V11GPvJCcBFvrEy03VeSPIrCZV5Zim0TwYjBBsbUTLNzq2bAHoy0MIAlIcvZspDIYoUMqRxLS96v+FvKrK02+jOQ7Pv5+skb0ejXegWZK7z4S0ojHltiwghIFtZ1fV75CRZ8ODlbz0gAlwwRRvx3kUq2HOGTgpzFTZtGfEHWwGv2OHHuX5D3Rgy8qdYjU/Fqie8afgIP7/tQ7aebzPCwKIETdM5fj20FZjQaJ3QftDGXllVrYEm6YGVrQsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubSMQlu0M1i/oBthgOwobtjlq7Zn89wng3VHZ2ucCX4=;
 b=S3MQeA97FvOp82sbeRccQHOo6quvzvCqYTSacPrDd+Nk/K2o7LqpZjRAHkbnPwFmRlb4G/F3/3YsWJgkGcHGc3wsh2wP7wsP9pB+IcfBcFJ76wOwFyarNc9B5OLoVtRbdCNl3NDRn3ZKDwRkMQZ42ZwSBqQHnpgtwskU+8uVNA7PagtbbwzaG5JutUtDVQe/wAd34LHr7yzcp0rzRr6InDVKi8oYJOVUB5KvU7nfRANf/XCNHAwMo0AGXs1dvwa464aeDsZMWS++jPphfV/auoJmdQjySUkJmxzHZn1dlkEGE9YEkxus+Fu68fTp5wChcMHC8SZukYhiew4BgwrESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubSMQlu0M1i/oBthgOwobtjlq7Zn89wng3VHZ2ucCX4=;
 b=g9g9k90xWXTyTL6nzY6OJOIR5t9yFF2eGdlQtMBZq9dlgxyRZNkjzXDYZYkcXU5QsJ5IqUIt7p9/1OWcZmhmt9WMHeVSDuZnuuoTOM3GAVS+v5kMx2XT7kHyTfeiA/QZ706xpTiW/0vajquCQVQW2L7oEnVEbVMx+M71lzBQj1k=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=garyguo.net;
Received: from LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16::23)
 by LO3P265MB1932.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:10b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Sat, 22 May
 2021 19:18:00 +0000
Received: from LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
 ([fe80::944f:5a46:312d:8099]) by LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
 ([fe80::944f:5a46:312d:8099%3]) with mapi id 15.20.4150.025; Sat, 22 May 2021
 19:18:00 +0000
Date:   Sat, 22 May 2021 20:17:58 +0100
From:   Gary Guo <gary@garyguo.net>
To:     Hanqing Zhao <ouckarlzhao@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: [KernelAllocator] Usage of GlobalAlloc
Message-ID: <20210522201758.00006b1e@garyguo.net>
In-Reply-To: <CAKmvQ+UpHb0tBbYo9pR-YJa=SC3bd2T8pE_R8tLkOqKCsK9kXA@mail.gmail.com>
References: <CAKmvQ+WEAFJCAn2my8iRUZBDvREExsFCydUxZxUxfSV51MK_Uw@mail.gmail.com>
        <20210522090942.0000158b@garyguo.net>
        <CAKmvQ+UpHb0tBbYo9pR-YJa=SC3bd2T8pE_R8tLkOqKCsK9kXA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2001:470:6972:501:4022:6c6a:7176:f381]
X-ClientProxiedBy: LNXP123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::23) To LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:16::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2001:470:6972:501:4022:6c6a:7176:f381) by LNXP123CA0011.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Sat, 22 May 2021 19:18:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4af5c0cd-8f2f-42bd-d337-08d91d56507f
X-MS-TrafficTypeDiagnostic: LO3P265MB1932:
X-Microsoft-Antispam-PRVS: <LO3P265MB1932C0A830211FCA0B417A7ED6289@LO3P265MB1932.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ZGsMfmKNQ2oBe3Jl1znzrI7iQDla4n978bVKI/Izm1HWYJXvvzKPn4hiaNCmm6EqCaLGTi20yPhsb0D3xWUvSCTtU+an5eP+zmDP45ufgYT4KHW7wPedt/0qnVFjCn85Toxk13E4hnRDefKIqgYzZFQejbwFhzLAhbyeqiFoUxiQccT80U/wj89Xu3UiKof72qHaE35E/0ChrhYhhtid2wwcsRcEZCuu8pAZ7/PyU7CStUcv91w1Mt1aNlpC4NYUEX23jVAgCt2Jq0Hmjcju406Ze42Ovf99EIDK+Rir5T+sdYu3XTVrmDftQzL6ABvoDlR6TONbtjLnikY+pHyN4qd4iTo8fd5NotD6y11wxpcuoot74ksu5j8JB29YcjKYO25boi0EvbvD+vSfe8JM5U9jYIVko2zqCoRJ/oN3zBEATjbKj8V3ee/7RCKtfdbOZcRLOmIT6xpT+IO2h3ZzGluTRYQTLfHreeP7S3wflATjQO789PoHzMJ3e8JxYV7Os5fZf0PzXRp35eISCiKN2jlZrPZYYL/1+Hhhr5xZYndM4gM1vjGWB1h6SvfeUt4t3BKBmz6qRjyHl3nBv0wpEq4BQO7W1Tc2ji0B3Bd1Uny2vCYl+XVRQxHFyfx/zu2lsf7JvqOVynuUSogW0Rrl5dHwBhUfGIKpu6qMGT20vu0mRJ2dYpdZ0xWMj7jcCZvFraFE4VN/kubTDzeWkHgNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(366004)(136003)(396003)(39830400003)(346002)(478600001)(4326008)(53546011)(2906002)(86362001)(966005)(316002)(66476007)(66556008)(5660300002)(16526019)(52116002)(66946007)(186003)(6486002)(6496006)(36756003)(38100700002)(2616005)(8676002)(83380400001)(6916009)(1076003)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DutP9x1gyZLw3i7bJKvORSXgP637a+feqjNFiOKI2GGzIWRdjVyE9DZpFWPm?=
 =?us-ascii?Q?t6fWG+UWKfeYr9L10LVvF2TPhGT/1MzA/OS2I7bf133AGsv+7MEsqB/Ca1Uw?=
 =?us-ascii?Q?qXgmYIAXxkvcq602eCcqWelmE3Ng1OqRUl92uSSzmNzK0K+6QDbo6drIKGde?=
 =?us-ascii?Q?Xz3AEwxzzr6PKB8pIFA2CxFZEC0/5fKpVL8RlR6IoXWJqsapM+UWo/ulombr?=
 =?us-ascii?Q?jFFB/eSyqdljhKmEVWKV6SKgMETeOSvup55mnPf0nymTtN1n9HrlY4TnvG1f?=
 =?us-ascii?Q?8dE/NzKJzDAr9xEgISy4XqocQP7HcCpJU0iZ9e2P2hHuUnFBHxv2nd+XsxcB?=
 =?us-ascii?Q?jHcUwkd06RHZfyWTjAM8iftkiY02Yf4uqKoGFYC+SwpEYCSHKwbCquKNG0aA?=
 =?us-ascii?Q?yREnXg3qURcSb9u1fuIjPswmffGZ3onad9tZRq6cfwhVt2DTTFfIP9MehQ+g?=
 =?us-ascii?Q?msX3Q5sfWbvFVn5PYj/4XrpyXAMyyEn1dIV9WxyWDaUajRJLhOqIcFyfL5IR?=
 =?us-ascii?Q?kWyNDHEcBMUE9TtMR9qpw7+17Q+rDH2Z/yRW28NuzAvtWJ+8d8LnJxIVD28j?=
 =?us-ascii?Q?JMyzHxiJyw31M0a0yCT29Voh3uujCN0g2MqBvaFuLTSVK2fZJfkq1wPknRBM?=
 =?us-ascii?Q?NnwkDlbfMZB4DHLSoV+HtOubaBQApHDGyLQlvM2SCIqavnVd7KIKLlDx5ouC?=
 =?us-ascii?Q?jnvRh+RUrxFqJqNMTC0A0ZZ1xfizY3O9EgXORgEQ4kFvh2s4kb6rMJpE8/e+?=
 =?us-ascii?Q?ZsPV4U9F4G3jwTS7AzRiM1acE649MPdyeC620bDnsWkdBi+9vOooxrEZuKpw?=
 =?us-ascii?Q?r4E6txlmd6dpNwXyMnJcpNwxFjbdop8BTDwMv9ljo7O6g4zuPonPyyYg3vAt?=
 =?us-ascii?Q?UYzsMmv0tEEDT3EbWnCAH04NqDwtV2Pqw+jsFqoD8uHm6ZMW8XcCt2GN+G09?=
 =?us-ascii?Q?4+5gu4CxIWLpbl4nYzv2iABL6vx7DnTBHkqCS3DQokS4hvXbLaPDIcetOWFo?=
 =?us-ascii?Q?lThgsNeJFXVoFzkXkX6EetkZA6ZecXd8F+taWbthVQnPJbxdYX4Pjsg52i++?=
 =?us-ascii?Q?Uzr5z/Nje64X4BmYqxkgCvHCNH3DTgWqoKqIjUF4CIKSUb6GS7AN8NxaqlBa?=
 =?us-ascii?Q?vurH3Adn1tfaQGt9bxt4BghIFwMXs80q+PIgvvXClisRcm2yzpRNdLk74WbX?=
 =?us-ascii?Q?39ett/ctEgRQr8daUw4nIul7iakztcwma3BQ0PkzKfO1nqsw7L8nlhYPnUiY?=
 =?us-ascii?Q?f6pL42kXtL+FK3gN18vfznRZgQJd5+Xi8XoHBquJHTBPMPZSffHpAse+kcw8?=
 =?us-ascii?Q?Zts5LGF5TIivs37n+hemWtCbSpIjQmS8uFkyvy64avalCrq+E3XZuXUpX5jk?=
 =?us-ascii?Q?e3sVKzTveoCRtBGoKAl+w0Ib01et?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af5c0cd-8f2f-42bd-d337-08d91d56507f
X-MS-Exchange-CrossTenant-AuthSource: LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2021 19:18:00.6232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wEpbejgNz7cju6zWCQw56/7lE6pKrOF5iCpqJPsDTGxXJW8xna927fHPZgwXlK9fOZ/r1SsQv1BipQcrRgNcvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1932
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, 22 May 2021 06:46:41 -0400
Hanqing Zhao <ouckarlzhao@gmail.com> wrote:

> On Sat, May 22, 2021 at 4:22 AM Gary Guo <gary@garyguo.net> wrote:
> >
> > On Fri, 21 May 2021 13:42:40 -0400
> > Hanqing Zhao <ouckarlzhao@gmail.com> wrote:
> >  
> > > While implementing an alloc crate, I intend to pass custom
> > > parameters and extra parameters such as
> > > memory flags (GFP_KERNEL, GFP_ATOMIC, etc) through the `Layout`
> > > parameter.  
> >
> > This sounds very wrong. `Layout` should only contain size and align,
> > but not other stuff. `Layout` is part of libcore, and it is a lang
> > item (aka part of the Rust language, tightly coupled to the
> > compiler), so you shouldn't change that.
> >  
> 
> Yes. I actually modified the rust library for some experimental
> safety features.

`core` is tightly coupled with the version of rustc, so unless the
feature you are suggesting will likely ended up in upstream Rust, I
doubt that we can use the modification.

`Layout` is truly just for layout of the type, so don't put any
irrelevant bits there. You can experiment on designs of a new allocator
APIs, but please don't change `Layout`.

> > > However, the current implementation of GlobalAlloc
> > > (https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/allocator.rs#L13)
> > > is not actually used,
> > > because the kernel allocation directly resorts to `__rust_alloc`
> > > (
> > > https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/allocator.rs\#L34),
> > > `__rust_dealloc`, etc.  
> >
> > This is a complicated. Rust will call `__rust_alloc` for all
> > allocations that use the global allocator. Rust will also generate
> > `__rust_alloc` automatically if the target is a binary, `.a` or
> > `.so`, but it wouldn't generate it for `.o`.
> >
> > So we currently manually implement these functions. Perhaps we
> > should redirect `__rust_alloc` to `<KernelAllocator as
> > GlobalAlloc>::alloc`, but since `alloc` also just calls
> > GlobalAlloc>`bindings::krealloc` it does not
> > matter much.
> >  
> 
> Because I do not use `kmalloc` as a backend, I probably need to find
> alternative ways to
> enable the usage of GlobalAlloc. It would be better if I can find a
> way to pass layout as parameter
> instead of the size and align parameter for `__rust_alloc`.


Just replace the code of `__rust_alloc` with
`KernelAllocator.alloc(Layout::from_size_align_unchecked(size,
align))`, or whatever other type that implements `GlobalAlloc`.

> > > While implementing an alloc crate, I intend to pass custom
> > > parameters and extra parameters such as
> > > memory flags (GFP_KERNEL, GFP_ATOMIC, etc) through the `Layout`
> > > parameter.  
> >
> > Back to start. Why do you need to want to specify these through
> > `Layout`? As for the flags, we've discussed about this topic ~1
> > month ago in the meeting
> > (https://lore.kernel.org/rust-for-linux/alpine.DEB.2.11.2104241558400.11174@titan.ldpreload.com/)
> > weeks ago in the meeting, and we've concluded that one should
> > invoke kmalloc themselves and use unsafe APIs to construct any
> > collections if they want sepcial flags (e.g. GFP_DMA).
> >  
> 
> memory flags are one of my concerns. I am also passing some parameters
> for demonstrating
> experimental security features.


Why are you trying to use `GlobalAlloc` though? Have you looked into
the `Allocator` API? There's nothing preventing you to add a flag there:
```
struct MyAlloc(u32);

impl Allocator for MyAlloc { /*blah*/ }

Box::try_new_in(blah, MyAlloc(myflag))
```

> 
> My implementation actually does not rely on `kmalloc`, the memory
> allocation can be
> managed in Rust independently and does not need to be handled by
> kernel slab.
> 
> > A quick grep shows that in drivers/ there are 30k GFP_'s, and 27k of
> > them are GFP_KERNEL, 3k being GFP_ATOMIC, just 1k for the rest. If
> > possible we want to automatically detect the context and use
> > GFP_ATOMIC in interrupt contexts (see notes), but if it's not
> > possible probably we only need an `core::alloc::Alloc` that does
> > GFP_ATOMIC and do not need to have the allocator support arbitrary
> > flags.
> >  
> 
> Preventing the sleep-in-atomic-context bugs is also one of my
> concerns. For the memory allocation occured in rust, we can
> automatically adjust the flags through some new abstractions like
> something called `atomic_context` that takes as input a clouse.
> Although we still need to come up with a way to deal with sleepale
> APIs.
> 

I had a thought about that recently and I believe that we can probably
make use of static analysis (or Rust pluggable lints) to handle
sleepable APIs.

Please use "Reply All" next time. You didn't CC the mailing list.

- Gary

