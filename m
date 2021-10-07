Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960F4C433F5
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 23:06:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A2E36135E
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 23:06:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233938AbhJGXH7 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 7 Oct 2021 19:07:59 -0400
Received: from mail-eopbgr100100.outbound.protection.outlook.com ([40.107.10.100]:23661
        "EHLO GBR01-LO2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233354AbhJGXH7 (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 7 Oct 2021 19:07:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1mNlM5hzrXPcbUpQqWQo5GtReWSFm173cYfDM3JYGX7yBEobPZLjWMq9B1uzJ7zYSNVZ+AMIbZ/1IpKAehHb+d1pLOMUDIn6PGW+feRzwbe9gt30rlL/nabg5YFEoUyfQsSUeEZzB1zrhrTvAgsS9XJpb7pQhobiwByXvKHfYjvjCewl//viAZizgqVa+6bU+tzKqlN6hNSWfyhyHz1YZtRcOo55Zd6qhpAV8ElfmUE1uv5YBqT4nRQvy8VgEeQ27tUOBj4vEq69jgMVwdX6GwwryxNStDtJK7Qf/WfLd0Ntu5VU714Vem9+rbt4qcuJYLSli8FLO3TZiKMmwRvGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJMBNx0B4rWO3WrispxtgACcdMNGWEFkOPJO8ka0Q8Y=;
 b=Qb0fs271ewUhz36NRiFPPu9AstAWi1wXULX24pcnGMqBpsmtDgtm4IxPgRH3u+a/SdDSRSlMOEk2EltboFbhpkZFFNXaL+RyGYBJWhFGkAULbreQoXyY/tJpis4yQhP1u/r0mhdscpMe3WAmz+n/7KokK62WoI1q8vawoZHzgvaAiinpjG7bBee0RZjmieaIyIsZ07nlCHyP5ZvZvrQuyqVcvKc68jRAkVlZgmCLuhtfBTuBacjjiCrOpYM46YRbvS+e8Yi48uqh1RX3UF1ZRDLTV9Bq9tu0a6sw6euIKs7MXUOFRLlUsEFgOMpzW1yczhYuavdcj+3xJboyxWBZtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJMBNx0B4rWO3WrispxtgACcdMNGWEFkOPJO8ka0Q8Y=;
 b=UzmnwL2t+XeOpEU83u2QzdN9crjGwTH9WjUZXM8jij+9qjCwXOSM3ZzymtRspAIM8u0IivRXJOPTaN1R/tqTdF8j/O2yugS/dgkUiGObgEPFhEJYw1Iwy5H5841PA/1wdDXX83nwZDWOU3JS3eBPQ952AoGQxkgxJ6+m4qMsbH4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO0P265MB5310.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:280::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 23:06:03 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::35d4:eb8e:ecdc:cc89]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::35d4:eb8e:ecdc:cc89%5]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 23:06:03 +0000
Date:   Fri, 8 Oct 2021 00:06:01 +0100
From:   Gary Guo <gary@garyguo.net>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <20211008000601.00000ba1@garyguo.net>
In-Reply-To: <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1>
References: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
        <YV8A5iQczHApZlD6@boqun-archlinux>
        <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
        <CANiq72k2TwCY1Os2siGB=hBNRtrhzJtgRS5FQ3JDDYM-TXyq2Q@mail.gmail.com>
        <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1>
        <20211007224247.000073c5@garyguo.net>
        <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0462.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::17) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
Received: from localhost (2001:470:6972:501:7558:fc3c:561c:bc74) by LO4P123CA0462.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1aa::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend Transport; Thu, 7 Oct 2021 23:06:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d84e12e-2971-4a03-653b-08d989e708f7
X-MS-TrafficTypeDiagnostic: LO0P265MB5310:
X-Microsoft-Antispam-PRVS: <LO0P265MB5310B5E5D6EFE8130031A0ACD6B19@LO0P265MB5310.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FV4sZwzBE4SOEDEDCR8CNmgt5SuoKvipXgF0u/IUAAbSvI+CcVhFZJWv5VGs9SmmVfc3MydXWbskAlMNZY5R63XwO3rCFXAowJBeAbdrA6Af/gDNB6zdeHfT+5xyhvq60pBCHy4l+wERluP/1aw5axLz2dL+3zwO+Ax/69YFPh+h2GVaXdJ7XB344nIWWvm9F9p5DFFhSpnTKOg/iybQMX+M2u+Jxw9GRTyvqCkndhZHoul2M9lW62zx9aa+F0KuFNnyvEyp6jGBKAESNPMZw4GF3DTD7hll3/MPOtipW/bAyxW+eSBAKNuME+XjAZ4yTT68xxK4PhgnFKNf6060P9153a9RCdUcs/Qhh1DofSTraJgUHWnRvChEADpDl/K8MyoGlaRM0gR2D6U3hdhCzIGp7Y5vQk2Q/EUdc7twoV2xUy0swfhr7DTyMiZi/dWhcJnaukZDNH/JvVXbj64FR0Wx4zjsMmv7kiOGKU6af+QW0kmX+6Hx7SRF03e7wD7SwJkHcGk9R7P0tunW+lM40KM8WCBc30lGP2cRUIP7L7Rjq/fM9x/po5UPYMZ93NtCByGdj8VX/NQU7zpSHg17EExgBjoRWzmAefnIe090DfEgCbcyMyLIaO6VKRkCbXkzXloW4IaYypGiueOVDet1Zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(376002)(396003)(39830400003)(136003)(366004)(1076003)(316002)(66476007)(6486002)(508600001)(38100700002)(186003)(36756003)(8936002)(52116002)(6916009)(86362001)(66946007)(5660300002)(54906003)(66556008)(6496006)(2906002)(4326008)(8676002)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pE8FNPWkaynwb54j3Smf5xfPU2VQInyPqYgpg1pCybInUI1EjnPdoy0l9hsn?=
 =?us-ascii?Q?6/AjwD68yduqx7O0Bnu3pZ816EcEs04E4sn/hG63RB9hzNbvFyeaZtIPl0xK?=
 =?us-ascii?Q?I15rBvTDVCm93t1gtFDUd7P0aPySlv0t22N7KFA9JLHgWXnjeAuVYqdwrTEG?=
 =?us-ascii?Q?NksIejKokeRywCJ1PcVAmxtVHoz3WSu7eYvBAIPjlQfYHsGQj4P2ZSDdsXOf?=
 =?us-ascii?Q?jQPqRtMJCauPLcvGPN1up4c7sR0tc9w5NL5OaF5v7wgpJ/KwRLVGEOQUR1Ni?=
 =?us-ascii?Q?Cn5rHJE+BmOO6VtwCs4Dv1ycYNWYPMtCaM9Nk9n14DATYIcTt8p1MUGtzgVD?=
 =?us-ascii?Q?hGAgXWBOiq5fibC52RkhYGydzqXIWIEp0uSdZ/0g6V41mC71LeGZ8hjAeqVI?=
 =?us-ascii?Q?XQwMkD+fAgPNoviHCuYIO0MeDN9pVkoZRvxihZATOUxAx7LmwcXRf2f09kGL?=
 =?us-ascii?Q?GMGx3j7t89gQmiCanwsSUL0PGaxxi1XXE8+aKJPxqNQ4W2qO/WbxRtSeu9er?=
 =?us-ascii?Q?8ANRfitAiX5YLrNkR5WswJMJAe3GcYVjnSHZApCaqJhxMwoxBr4vGnXRdT4S?=
 =?us-ascii?Q?VUvvXFRhLJn7R8HXl5EoU1bTwBlrwzYjfbTPfa33lQtPol6lvuwc4V4z+Ecg?=
 =?us-ascii?Q?G5jN85nut9X6x6dvxeBaCJfEYOUe84pt1KncBEJ0ErLoO6qwLBojJEkOeI7f?=
 =?us-ascii?Q?biLbgFeW4jW2bFae5JCfhE8aeqZqXje2OuQVZhV3yF+XmcEzRvt9EXXu1SNw?=
 =?us-ascii?Q?RcfKD+69QxvEcTyjdXuJ913K2otri67aem0NZ3ihAWHmGKzN38A4T2HZkrgc?=
 =?us-ascii?Q?/a8xA7GPcYVeeyNe/HgZUNVn/bw4Tq60qX9900n66AF9NpLcDhRnjyBk2WDt?=
 =?us-ascii?Q?8JHB76VIOS2N/DLLTRqHC1UwaqNyQ3F6gBIInxn2ulfS1G3I4EMcM2nq0VNa?=
 =?us-ascii?Q?9RXgikkgaTTs8lnG0hOMYF/XifAQv7brW00yxaQZi8xs1lSTArz0tTseBQ/K?=
 =?us-ascii?Q?FbCShYT0ZdtTrN50YKO3QVjkCw2cJNJtSrcD4YO6X2KLK2BmgiAqR9GphEcO?=
 =?us-ascii?Q?ig5uQ85qUkuypFAsBV05uHUja6vmVynkXJ8KQ0Rv3XLKYUb4m8yuKwcPN1GE?=
 =?us-ascii?Q?NtB5QfYRxUJNMlW3geexmKGTx0qIP4PBWm8d4CKB9EZf91n14ZkdNh118EBp?=
 =?us-ascii?Q?3TLyGPtXk41XXK8GPXmZ3CgqAGHURZOkfCiJ00HeTJ2fOBmc0rNC9u8zAx7v?=
 =?us-ascii?Q?zrOHGucMeXtq97kahyzS6ELketCMslQ8JnFGdxEF4DU/M5b97l5NXLiG1h0w?=
 =?us-ascii?Q?61b35DDWhpKoJ2VD0NRtpA4LJunn1SESE2NLAVxBSJsFDpDlx2hMC3K0RGnT?=
 =?us-ascii?Q?xDcGlzPe181CZ4Gf2zAt6757/Zh/?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d84e12e-2971-4a03-653b-08d989e708f7
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 23:06:03.1523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7T3HunlmJaG9PIt2tAuG4d1OYqxVdlL9/KxFOjkAfmX0j6UFikdFU8nDMKYsf6LPiXwqSKV22sjf+fdpPQqalw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5310
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, 7 Oct 2021 15:30:10 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> For C/C++, I would have written "translation unit".  But my guess is
> that "Rust module" would work better.
> 
> Thoughts?

Module is not a translation unit in Rust, it is more like C++
namespaces. The translation unit equivalent in Rust is crate.

> And the definition of a module is constrained to be contained within a
> given translation unit, correct?

Correct.

> But what prevents unsafe Rust code in one translation unit from
> violating the assumptions of safe Rust code in another translation
> unit, Rust modules notwithstanding?  Especially if that unsafe code
> contains a bug?

Unsafe code obviously can do all sorts of crazy things and hence
they're unsafe :)

However your article is talking about "safe code can violate unsafe
code's assumptions" and this would only apply if they are in the same
Rust module.

When one writes a safe abstraction using unsafe code they need to prove
that the usage is correct. Most properties used to construct such a
proof would be a local type invariant (like `ptr` being a valid,
non-null pointer in `File` example).

Sometimes the code may rely on invariants of a foreign type that it
depends on (e.g. If I have a `ptr: NonNull<bindings::file>` then I
would expect `ptr.as_ptr()` to be non-null, and `as_ptr` is indeed
implemented in Rust's libcore as safe code. But safe code of a
*downstream* crate cannot violate upstream unsafe code's assumption.

> 
> Finally, are you arguing that LTO cannot under any circumstances
> inflict a bug in Rust unsafe code on Rust safe code in some other
> translation unit? Or just that if there are no bugs in Rust code
> (either safe or unsafe), that LTO cannot possibly introduce any?

I don't see why LTO is significant in the argument. Doing LTO or not
wouldn't change the number of bugs. It could make a bug more or less
visible, but buggy code remains buggy and bug-free code remains
bug-free.

If I have expose a safe `invoke_ub` function in a translation unit that
internally causes UB using unsafe code, and have another
all-safe-code crate calling it, then the whole program has UB
regardless LTO is enabled or not.

- Gary
