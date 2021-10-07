Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29996C433EF
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 21:42:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F4033610C7
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 21:42:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241753AbhJGVoq (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 7 Oct 2021 17:44:46 -0400
Received: from mail-eopbgr110099.outbound.protection.outlook.com ([40.107.11.99]:20178
        "EHLO GBR01-CWL-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238388AbhJGVop (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 7 Oct 2021 17:44:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeQxm2ySKWNtVJUdzaxU/F8+gTNCM/fMi+XOXMJIl3aSn8njPaPYBiKvTYUp1vNsmj30791e+/qCfl/BK8Gwz3psETd+GT6Z8zi+AQTwmE1grjm3FutFG/XzTa2e+Qma+LLhZYvxyo3vQ93YDoWhYV/8m8HobN37+MEEO+vpElIPfParoo519CkRdepcaAHZ+LaTFp5p1ec14bYv3Cetse0d6ZhqOiPJQ8fYukfhiZJaWyEYzxxaUsglE3Ffa7G4xCvD0XMXbp3QBqvEuHnY0Z8bmt0KbWzznZMyjqxXJrQaNlA/5LpNmBxoQmzs2yevWHraRUppDZc3Pd89TPDZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAdivLrGs64yf+hN3Bq98ZBtqSsxp11GzfmYDo4jUoo=;
 b=JbypDqWvbOtXk9OR7i02eGL/tUZjyGuuYD0eheRUCvdbklmXgIMF8kSRrZ+rnp5DbnpJujBcOFJf4fcucQRW/wIXcHxfYySXz1XXZoTM02ITCjkgFWEsoGP64eiThQbuvJRVoEmqDKBLIexJTXgBXAO3+8dNLWnKPkMt6ZwHdBJaJLvI/c9Ah0wVMdKXCXOdNCZT7/BUedwo0pHB5IYDkHNYzz6t79XA8jaMEj2UVH+1B/2x+KW08XPY3raK8qq/2tQUfP6rrce2SeqZ0BO1tr+R3pxuy9xFtdVU+6Wt6GqTsupjjU2cuUvSuF/RQTx0kNzZLbN7AR1e6jFN4kgn0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAdivLrGs64yf+hN3Bq98ZBtqSsxp11GzfmYDo4jUoo=;
 b=Mn6Y2KeC9N3whYqTTpbtRrWMQNj7BwhxxLxldEFc4SDHNhB8ptT3yvaw7pNMNJ4oLG5Z0afI56y6PCT0RpTS1ewru+e7L3RIPbGuUjSP31EV07PJp9tYaEWPgK/8vdY0zK3sS2C121JsO2YrqHWA3MZdfkb5reWfsyoHpzlL0fg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO2P265MB4303.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:200::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 21:42:49 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::35d4:eb8e:ecdc:cc89]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::35d4:eb8e:ecdc:cc89%5]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 21:42:49 +0000
Date:   Thu, 7 Oct 2021 22:42:47 +0100
From:   Gary Guo <gary@garyguo.net>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <20211007224247.000073c5@garyguo.net>
In-Reply-To: <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1>
References: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
        <YV8A5iQczHApZlD6@boqun-archlinux>
        <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
        <CANiq72k2TwCY1Os2siGB=hBNRtrhzJtgRS5FQ3JDDYM-TXyq2Q@mail.gmail.com>
        <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0397.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::25) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
Received: from localhost (2001:470:6972:501:7558:fc3c:561c:bc74) by LO2P265CA0397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend Transport; Thu, 7 Oct 2021 21:42:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efd7a9fc-7317-4001-7b60-08d989db6878
X-MS-TrafficTypeDiagnostic: LO2P265MB4303:
X-Microsoft-Antispam-PRVS: <LO2P265MB4303EE520826FF56D7847B66D6B19@LO2P265MB4303.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bAc9XhbHDkuso9RNcK0eNurL17X7P4oO8IXwE3h+fAEYCtJ8AW2K3Lv3Q+8NjZsSIkiFUm5sfPjn+FnPDiEz7Uj2HsRviZwadatoUIAmmGKhjyn/dKRMBTgZZzPYXwRdJHlY7tGnEdrfy3VXoi21q/lCN7g1K/zewp6MUb9/7JLyBZaOAD/HjF2rhjlv9iJgF0PmFMvQtfbsPPPe0qLfLKh1XE+nut48Ot6xOAIBoDlcNOJTO43uqXCXGd8GTM20swU93DiLUWqEcF92GgjgD1GHNy9nUADTLci6m7LnsVUg4PV/rTffjZnQ3U0+siiL2XDFCMrNVrKLECj9ueo3CKDDTF02y5pwCB18ma4Vxv7mnEyZ2scvtKcuQCKuvlpYi5zOYnx5xaEGKN6TcGeiwuaomCLsye1uCfizQ7g1FVy+b1TOgdYeLYxZbWCGyS+o5ln0jFSDnZCwkrzLm7H1XSCDudzAz54TnkvBb5g80Y/laONLqU5fZDsbwW93ejp7Laol0sxQ6FBm0mR4hV5O0Ofd458PYGUoKw/qUCTU2KVLmTrHAEYIBAns84+TP9Sgz3tGmJhXUmuuSvUCgfX9AvnyxhBd9dR5Qgb62boibvVXMWjdtOK4FGCSrOFMvdGUgGHYj3R+MsFQzCd8dg5ciYlsv7sR16AH9jA156f046C9KCW/8Gj1GUlDNrOpiLsJi8yz/Sd9Ys9VhmYqA5FJJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39830400003)(136003)(396003)(376002)(346002)(366004)(2616005)(83380400001)(2906002)(1076003)(6916009)(186003)(66556008)(66476007)(66946007)(6486002)(86362001)(36756003)(5660300002)(4326008)(54906003)(8936002)(316002)(52116002)(6496006)(8676002)(966005)(508600001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uVSjc14oHQ7ywUTyfsLfxDjuQzkkmMcEVecCaUxp6ZmslGluKDEYyza3tK8Z?=
 =?us-ascii?Q?LEqDOSitffHAgEp/98sC7eQZcjl3a1jJ5cgxvIXYAP+Viu7PcFa461pyvain?=
 =?us-ascii?Q?wJfs2g9j7auhT5+mcFNlj6TE/ZDPM7WXFAoVqS6Ulh0Pvp8247EbWoIiNJSJ?=
 =?us-ascii?Q?EqrOCJwFkWYbmEsI1n1mtM5Frp6kcmgJt8H0WC8pUvR1jSeCuK3Tp9zTtpnb?=
 =?us-ascii?Q?8MkYP5M2iiKwC/YIgZ1wEBcRVG/GTgFxhaOSdHein1kAqD9H3tnSjM/i95Fh?=
 =?us-ascii?Q?d6GI5SdMY5EMzA/bmV6WxktweVaQrGlzB3Uj6kRLQxKvtzly6EHeuYRdaRRO?=
 =?us-ascii?Q?GgXD2aB91VdyJJMiMzYf+knzMVfubZXYH4/4aLp2JAByZNcvRxUC3lpVtVlh?=
 =?us-ascii?Q?s6L9MPz4QnG0CfFzgChVnHyRs+tG7/01p2BJK8iSBmHmIdqkXoxsdXuaUfWU?=
 =?us-ascii?Q?g76wDqRV2FWejiVHIafmF0qXyIZqrKG6yVMZn3/v/Ol0wi9fdGM9aOU5ZYpd?=
 =?us-ascii?Q?+9pVrp8Eicb5G6gSELqqhM6/TZP0Wnv3gKVHuf6Vl1sej/Facbs0H5kO8GY4?=
 =?us-ascii?Q?GcstyLRYSPONPuEq43OOqssxxJlPuTg7YCLlO0ZQTBoPfzLmM/iLbZ2bJC8l?=
 =?us-ascii?Q?J898Cuf2GOZDtnsTirGFDyauR8vLDkHZ0i4WCdG9ITD+6JdxNgoFu7tPElWm?=
 =?us-ascii?Q?jXmE8PAlp4cau7uk5cFbvWD6U5ZrAURtJQnGF46UkiJRqXANtwnme1peYenV?=
 =?us-ascii?Q?SBzUZyJYa5KY63rXmjjwZcdpv/D54NTrnG8mar1CuioYlRBrr1Nh0C7jg23a?=
 =?us-ascii?Q?d0r+xLC5ytGp9QUGliXMa32UTsZ9TR9KgppMPdW1nvyUB4PrbfUKpgbYlae0?=
 =?us-ascii?Q?XFhShJ+KWedg4WnYIdYm1e4tEU5/aT3shLcp5IraWMIYWyStVlKBE/FlU61r?=
 =?us-ascii?Q?bv5CxuYDqNdNaRzziCubWi9fVFRINuM6cF2oeXwtr7HEClWsgrc/7XWgVumh?=
 =?us-ascii?Q?EXzyR3sJjjjKQhOPOxxsUiAcSWpBEbDIYE4VE4YD6CCOMS/H84lK1TLgzmor?=
 =?us-ascii?Q?HpPsDRHlfXkH4c5l+9gkVvwDYPwC010JWFvpsYndjZNt8EBCI3Z3MeIPEHxI?=
 =?us-ascii?Q?1PRY7STLRSYl+NZ5LYZVoMcLjTEtKWVCR8OMKyF4s1FaDfgqjCp/HkBAB7A0?=
 =?us-ascii?Q?/S3pR6evqJYiGvuh6lablHcCJOqIPqwoTlmritOPLyZlWc5DyYeuQhnv3aye?=
 =?us-ascii?Q?1hHQD5g0/+pyrBjwiiX5nViutWRxrc1iUlvOQ7sfzaFzfQXZ6H2VfPq+A6cu?=
 =?us-ascii?Q?ASXaiyLDzkGxE+KfhE/yuMhI9Hp7MYJxzdB9D7uiNQOmeUuAJV1lqs1HA4mC?=
 =?us-ascii?Q?B1SBWEQBQczkZnjrDvGxr429T0Nj?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: efd7a9fc-7317-4001-7b60-08d989db6878
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 21:42:49.7904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSqDVLwZCMqlq/WHvFHlpYiJ50QTPS0wMD3pk1lhqLouqLAFfeR1kAsdPgQ2g8z0txsFARXXUH/NPqnVD6fNrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB4303
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, 7 Oct 2021 11:50:29 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> I have updated https://paulmck.livejournal.com/64970.html accordingly
> (and hopefully correctly), so thank you both!

The page writes:
> ... and furthermore safe code can violate unsafe code's assumptions as
> long as it is in the same module. For all I know, this last caveat
> might also apply to unsafe code in other modules for kernels built
> with link-time optimizations (LTO) enabled.

This is incorrect.

The statement "safe code can violate unsafe code's assumptions as long
as it is in the same module" is true, but the "module" here means [Rust
module](https://doc.rust-lang.org/reference/items/modules.html) not
kernel module. Module is the encapsulation boundary in Rust, so code
can access things defined in the same module without visibility checks.

So take this file binding as an example,

	struct File {
	    ptr: *mut bindings::file,
	}

	impl File {
	    pub fn pos(&self) -> u64 {
	        unsafe { (*self.ptr).f_pos as u64 }
	    }
	}

The unsafe code assume ptr is valid. The default visibility is private,
so code in other modules cannot modify ptr directly. But within the
same module file.ptr can be accessed, so code within the same module
can use an invalid ptr and invalidate assumption.

This is purely syntactical, and have nothing to do with code generation
and LTO.

And this caveat could be easily be mitigated. In Rust-for-linux, these
structs have type invariant comments, and we require a comment
asserting that the invariant is upheld whenever these types are
modified or created directly with struct expression.

- Gary
