Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020097.outbound.protection.outlook.com [52.101.196.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713C528688C
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 11:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767352010; cv=fail; b=bBHhdKFdF6DsqN2UE710CKo7jOmS06bPV70FEkC3WWIWPagoVhmougYAZGAW2kGFy5gzKEzLj+z+jY3UyRGYWuP4BdZaJnaj6+EtEycG3Ee0ESv6oT9z1K+LuK6NGhJdE5k/jV778YhJwytLQ+lj62q8gCrxJWxinKeGUeidqzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767352010; c=relaxed/simple;
	bh=el1T01O9HXIenoabVFfP9ow5xyDCllqeoKTbwpZahnc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Eo4EWXYuwsXzMF9JZctq5zyPk4adn/Xf2NPgob7+r1eXyd8ccHfTW8keqvuB3SBUapBIcm+e2YAZbbtNRf5woa9vzrF8F1cuOLBIJUN5CECQt295acY0+qCiYfEH+Dym5JOr7ADbFEOZ4Nvs2ewBzQHAOpmOqoLWfbhH6e8qGtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ycadqYK0; arc=fail smtp.client-ip=52.101.196.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ycadqYK0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sU28mOHQnXUbtELUGxKysRmuj3mw4WiUds4ZMhbdlKmSzmoLs95/rBwm+m0XrgysX5kCV84vXdJ9MMSSh75WPArfcHJolhSDrlwvVnR37TukUwkmZSFmo2dj+LAAwgIKfu2D6iKL6w31tJv5NyG3o7HHk8EnVv9NsvTmojVY8gIe2iuZ01+t7t/7H5HV/hQFNh+JhjcLEC7YdjZL5DRRhXsGVNPwE8mFizFQXCoYibI6r3HUzkd7tiN5tMKBXHtjHqzFYIebHX5V3NifbyThWqq7wbgjBIAQ0g3d3eEpZTSDy4GBc5QllZ9yI01IG5PR86wfc/Kjd/dT2x6gHinRzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rx5rzetDyE56Dkw+YR8CIscB8sYmATYxW34Af/wL6n4=;
 b=g8z6QtmE1ij4qL9xIjiKZkUwFm7O8bcyrHgLuoGTBifsW/GpcSJmhKW7uxQ0y+p8ycKnGHk8QkzHch4qtPO+BZxNmDq3vklmXlTfbX81MqZzYBTWf9RUHH27owaQcmB8gPOQ8a+NuC8lO6vhe1iSrdVKg5HCPa0bOYCXZVTzfsH4cVxMV8SLYKWTtE6p5UUtgX5Xt3aY6TZELtWlbA5DMxc4XqUQRyXjkZNGUjT2e7YpS7Eo1Pai+UkgjAlFpFKhURIaiuxce2OwrJ8yfoK8BXSZKpC5vHu/MvqPSOL9nb6L2+kMr+FN8hEag2oo59s5Gp3NbwVADgYh+0uyo4KwWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rx5rzetDyE56Dkw+YR8CIscB8sYmATYxW34Af/wL6n4=;
 b=ycadqYK070EaGRrW3JYfnNpDShkHDlPGGWipS0GInz8Xjvy57zz/QaxZepdmaKzjUt2yvvJSTzlkLwHAVMDcvl/40BRqHcr50OB7I4LqLkOyd006RLiwYieNZrxsTJz/WYieXz00ARHNdeVnMwuo9LRaTd0J3DbBRe9rSidoLuU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2912.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:172::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 11:06:43 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0%7]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 11:06:43 +0000
Date: Fri, 2 Jan 2026 11:06:41 +0000
From: Gary Guo <gary@garyguo.net>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Ke Sun <sunke@kylinos.cn>, Dirk Behme <dirk.behme@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Timur Tabi
 <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin
 <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, John Ogness
 <john.ogness@linutronix.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg
 <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, Tamir
 Duberstein <tamird@gmail.com>, Ke Sun <sk.alvin.x@gmail.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v8 2/4] rust: kernel: Add pointer wrapper types for safe
 pointer formatting
Message-ID: <20260102110641.2ba34967.gary@garyguo.net>
In-Reply-To: <4ef1abd2-e9df-4e75-b203-5b7fece3bb7e@de.bosch.com>
References: <20260101081605.1300953-1-sunke@kylinos.cn>
	<20260101081605.1300953-3-sunke@kylinos.cn>
	<4ef1abd2-e9df-4e75-b203-5b7fece3bb7e@de.bosch.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2912:EE_
X-MS-Office365-Filtering-Correlation-Id: 4097610c-3a4f-4c49-14fe-08de49ef0372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gInOXZkTbeuN7EJWvbHn4qA7VKoeTGnSEbwhHEhqGHX9HTtmL0ED3iaAMO3+?=
 =?us-ascii?Q?oomodFqyWw+uqanBU8yZ78Lu6bGlvJFVuAQ+AGeFPtE6H7wJpAraUlOrod3R?=
 =?us-ascii?Q?7krDKzw3PV0eZ3Q0y8Gfoo4ysQioH6q1Pv8HP5wnUbh6HZecuVDtXNJyxlP4?=
 =?us-ascii?Q?gkzEO6mVfr4N1Q0w2fAvlPaAGIjlPZ65GMoorpiXK8TFD1TLg5Qc5FbqQkdl?=
 =?us-ascii?Q?dFqqLjwBwamOZWXM7gFx5ie9aizs4ffuhNSWJDGPSNcKbiJONSpMMpvN6xXD?=
 =?us-ascii?Q?1N5XVXcszO2xaehUitBynzhM1m0XyRAi/BxvZs+s1xyvf5rrcLHwAHhGnA9c?=
 =?us-ascii?Q?YxTr9PUX5Rutbzt04kfCDkSM/3OuhgzMbgiTAgugxhtKNY+ChHaoA+uXmchq?=
 =?us-ascii?Q?8Kdj8WfByZVe1N81zQPS2axQmiH3gOqYNIo+DcpqnJMlN2FG2R92870aQkYc?=
 =?us-ascii?Q?SvjotjKrxWnI39NPDE0s3A5mvRCFOJMP1gc1HrauU35G6vfvPr1Rm37xQY21?=
 =?us-ascii?Q?/MhEpG39Izc3jLsiAl7hGssD09GRtVKR3oJEDkyEeiJRC7U8mj4tktppP0fm?=
 =?us-ascii?Q?BwwqicYs0QZBIDf8kmIkLV5gzUg8AFBKKQ5RUIvaw15mYI9B8mFUKtOQkRev?=
 =?us-ascii?Q?logIfKyaGaAym3JxyLyOdK81Al8yXZ0Z/w6COb1Ari+BqPrfn1QE4MA7InhS?=
 =?us-ascii?Q?L3caK1F8dponaU/NKFfNc/B5oOaG2rgi1aaPF378fsbX7YiU/EDrknP0FqS1?=
 =?us-ascii?Q?VF8nFMjb7aPdJ3ItG91m7iUvBNzkOkcR4xp9hlyxbcotBNdcaw1wC3vDcWiM?=
 =?us-ascii?Q?H9NkHJZfHECPlIwnxp57G+BFwSR/+ncv+Whe4NstXhhklQBEI3HleioVbSDX?=
 =?us-ascii?Q?oL6AhTJmbP2dg7Nq5LXP2GFtlkewuwVGPAmqZ1FBOzsB5kdrJv24cFbfafzb?=
 =?us-ascii?Q?F7mNte36iZiviRavLtfaRIvEK6kbHmwBt5Q/G+LcslnI15/WYDArTz9NZVmo?=
 =?us-ascii?Q?ZN5lvnhpFE18iT9qD+/HItHePFl4X6CrfeaYQhhaXeHNZzeWZxfilp5H9hye?=
 =?us-ascii?Q?9Ki0GsDnj3mf+kQrC+Q5S2hwpK7L9kt2p+cEbym6kbZCm5efYNebYRBzo1aL?=
 =?us-ascii?Q?fU1nhq6N28dvjbEMi6peKOND3o0IhI1S8oNCSt5uB+kWgm9XiXyVsbbDMJZA?=
 =?us-ascii?Q?4K9MEKpTxScf1MG9WxCqNEdgyBBbLS5KQR2t1/w+FTcsyX73LiqXFNzdsmRS?=
 =?us-ascii?Q?ny2nl+9YHQtp/WVfTrylmoThJLhAMRK7mV2+4YrstGTE/14a0DVr04sCVVNu?=
 =?us-ascii?Q?K1mRDCoo/27GVaeObUhgwB94lzJfJxuprVFMzbNouggZl36PJvpz30o0FGg2?=
 =?us-ascii?Q?9U8IXZgL9uVtofpT8wN56UpDUmFbC+g1bp6WzdKnJWFP3MeAuUJGHudk5e50?=
 =?us-ascii?Q?Wi6o41Ts85AJBNcBGg4bTQKGqOdhgcI4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(7053199007)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C2V5glLkuvDlCrxO2dqkbiJOExgpwnzNKBIm/8LzpuLCgo41YeSsLOogsGCi?=
 =?us-ascii?Q?Tm9QQZNXbqx0aw14SK68yinqCh/oQWq/mT/6n/fzp+DNGh0TZa57OYuA1Huf?=
 =?us-ascii?Q?/t+FD5QXZrGmY9qL8gu++27/q+nC6bHxYTCXh10s4GWsSsz5dHQ1YFxMylSf?=
 =?us-ascii?Q?XCp9TQKqHumSsvQE9pJ/4uV4FYdY4aTXguG1GjXGoqR3vVci3+MX3evxsxYu?=
 =?us-ascii?Q?gFrPjN4bq6a1/AbK6xlEX0mxUX6C0trywGurcT0hxER5dg+26XboJKPVoVl/?=
 =?us-ascii?Q?pZjjoDCFcz8zYA3SjUpb1hL9hvDJZlRQVX+S2itnzGAdVan+6w/jLDnsPo3U?=
 =?us-ascii?Q?e17j9OFwwbuwpbnzmDhW4xQHxK2ef52LSjN326gJRtQH4Tc8EITNzoee8xXf?=
 =?us-ascii?Q?hnhlXO9Skdjrv0+QaAxU4eSZgGZEp0yJ4ruyipb1/zww/afNtWrHj5JpZInm?=
 =?us-ascii?Q?isX0w9rw+swZ9D0ueacSAMlwvT6D8s4XM0Rng+yMhIbS796l3PBP+6Ev7z8A?=
 =?us-ascii?Q?A7VZRdGanPuH7u0stDtGTNjQee4NDOpI/eWcbJRNWnnxAGH2mikm75eNB8hK?=
 =?us-ascii?Q?vxl9YLMez3JpbE+2eHwY+42iZN/xugplsfntGtE6R3sUiMoJb0GgARzWmjce?=
 =?us-ascii?Q?2b2qK0u011Bp5vUKky+33pBsU4YICoKLewCQbo8HmawsSv05JsScsSmgKXpP?=
 =?us-ascii?Q?NgbdoXXh7JWSQoOA8DS6IUpBbBYJ7r4tdr3DcdqJSYa5Wjjcco/JGY3S1u/l?=
 =?us-ascii?Q?YtXquJImJRYgfYPR7T14xMQEAm1pJ8y3NGlahOP/GARnnYKRQJnu2Oz0/NQZ?=
 =?us-ascii?Q?aJ8WOSprOar2ooNrUlZqAgoBohMuNfayVW0ASvbTLp1dNO/snAR7vQWTtOzi?=
 =?us-ascii?Q?6hfAsSWpZNjAjREDBfpbQIYrvWXWdqKjdn+X3s9NKw1cAfdRCP7AgjKplJqF?=
 =?us-ascii?Q?Q5ib8KfrqCNbkMy6WTFOhlpxWEDG+0BZI7Q9BASU6h7JKrkLrpf4mVxyDZxV?=
 =?us-ascii?Q?o64CcMh9qhik5dOfHkrZ51mgFT59EepwdiX0C+OE/zEPHlkdbqeWVumSLNL8?=
 =?us-ascii?Q?i0f7AP/23wGZFAaekiBovdI1jqcxyS/EM/CbM8klP/8AJEjwXSinRQQMQCaO?=
 =?us-ascii?Q?egOdCFLD0gtGS+GBnpdjRNmFYaGQv9eYis1vRAY939vaHtqHGnzvUlYB7FWz?=
 =?us-ascii?Q?Z9A2Qy0jzEhpfHQtS3zBo7rITkyEBNpr8MdrPCliIwpoHFVnmTID9cYWaA+5?=
 =?us-ascii?Q?+s43ho3vUIYE4V29msm6yNqwwUpdogPVn9Zk28+pa3HS6q7mfFxyDKFShHpb?=
 =?us-ascii?Q?VAZDywpLfcaIGkImeSA51kIOSrqFGIK5M+0sZgE+9MxkrcD2LD4kSGahxXnG?=
 =?us-ascii?Q?5DoKigd/kFOe6SGGpMgmxcNnHFKds1PCH2SMj1/TVQW3SofOfZoLOr9LwfD/?=
 =?us-ascii?Q?zW/qd7VxDVYGIA+I5fIVMV4u/vrjKBQ9RxZKXv7oV7kUiyhD0CGlk4gQIZCh?=
 =?us-ascii?Q?pXWW3OHudLFdXKGqV3MB8AIXqH6NTFU/t4Eue+ji6jet1ypTS2hch0tbmsl+?=
 =?us-ascii?Q?Jh+OiyQiA9PAdkCLfwZIFAuNzDBwv8G728zWpU/IQNasllLAs78f5Bh9whPR?=
 =?us-ascii?Q?2y7JK40TMl4NAkGQeWZ7z4T8zllMUO3RgMo5yZhke2QJF39Fk/LNWIZNqoCP?=
 =?us-ascii?Q?C9tMGM4ml3Q9WXVigmtdnmw3N1b/v6RIOhbM4GywlKjN818mAckr+0ETqsYe?=
 =?us-ascii?Q?FDtO9J0MHg=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4097610c-3a4f-4c49-14fe-08de49ef0372
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 11:06:43.7974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NaLFGiwpXCA2xffAGOr41CA9oPDkHm0Z4zRH3sFFpVdI0aWx6lxCyXCSJEKHsXZaORXnCyddQwpgF3tzicpz4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2912

On Fri, 2 Jan 2026 08:57:16 +0100
Dirk Behme <dirk.behme@de.bosch.com> wrote:

> On 01/01/2026 09:16, Ke Sun wrote:
> > Add two pointer wrapper types (HashedPtr, RawPtr) to rust/kernel/ptr.rs
> > that correspond to C kernel's printk format specifiers %p and %px. These
> > types provide type-safe pointer formatting that matches C kernel patterns.
> > 
> > These wrapper types implement core::fmt::Pointer and delegate to the
> > corresponding kernel formatting functions, enabling safe pointer
> > formatting in Rust code that prevents information leaks about kernel
> > memory layout.
> > 
> > Users can explicitly use these types:
> >      pr_info!("{:p}\n", HashedPtr(ptr));
> >      pr_info!("{:p}\n", RawPtr(ptr));
> > 
> > HashedPtr uses ptr_to_hashval() to hash pointers before printing,
> > providing the default safe behavior for kernel pointers. RawPtr prints
> > the raw address and should only be used for debugging purposes.
> > 
> > Signed-off-by: Ke Sun <sunke@kylinos.cn>
> > Suggested-by: Dirk Behme <dirk.behme@gmail.com>
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >   rust/kernel/ptr.rs | 133 ++++++++++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 130 insertions(+), 3 deletions(-)
> > 
> > diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> > index e3893ed04049d..77132eaaef73b 100644
> > --- a/rust/kernel/ptr.rs
> > +++ b/rust/kernel/ptr.rs
> > @@ -1,11 +1,22 @@
> >   // SPDX-License-Identifier: GPL-2.0
> >   
> >   //! Types and functions to work with pointers and addresses.
> > +//!
> > +//! This module provides wrapper types for formatting kernel pointers that correspond to the
> > +//! C kernel's printk format specifiers `%p` and `%px`.
> >   
> > -use core::mem::align_of;
> > -use core::num::NonZero;
> > +use core::{
> > +    fmt,
> > +    fmt::Pointer,
> > +    mem::align_of,
> > +    num::NonZero, //
> > +};
> >   
> > -use crate::build_assert;
> > +use crate::{
> > +    bindings,
> > +    build_assert,
> > +    prelude::*, //
> > +};
> >   
> >   /// Type representing an alignment, which is always a power of two.
> >   ///
> > @@ -225,3 +236,119 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
> >   }
> >   
> >   impl_alignable_uint!(u8, u16, u32, u64, usize);
> > +
> > +/// Placeholder string used when pointer hashing is not ready yet.
> > +const PTR_PLACEHOLDER: &str = if size_of::<*const c_void>() == 8 {
> > +    "(____ptrval____)"
> > +} else {
> > +    "(ptrval)"
> > +};
> > +
> > +/// Helper function to hash a pointer and format it.
> > +///
> > +/// Returns `Ok(())` if the hash was successfully computed and formatted,
> > +/// or the placeholder string if hashing is not ready yet.
> > +fn format_hashed_ptr(ptr: *const c_void, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> > +    let mut hashval: crate::ffi::c_ulong = 0;
> > +    // SAFETY: We're calling the kernel's ptr_to_hashval function which handles
> > +    // hashing. This is safe as long as ptr is a valid pointer value.
> > +    let ret = unsafe { bindings::ptr_to_hashval(ptr, &mut hashval) };
> > +
> > +    if ret != 0 {
> > +        // Hash not ready yet, print placeholder with formatting options applied
> > +        // Using `pad()` ensures width, alignment, and padding options are respected
> > +        return f.pad(PTR_PLACEHOLDER);
> > +    }
> > +
> > +    // Successfully got hash value, format it using Pointer::fmt to preserve
> > +    // formatting options (width, alignment, padding, etc.)
> > +    Pointer::fmt(&(hashval as *const c_void), f)
> > +}
> > +
> > +/// A pointer that will be hashed when printed (corresponds to `%p`).
> > +///
> > +/// This is the default behavior for kernel pointers - they are hashed to prevent
> > +/// leaking information about the kernel memory layout.
> > +///
> > +/// # Example
> > +///
> > +/// ```
> > +/// use kernel::{
> > +///     prelude::fmt,
> > +///     ptr::HashedPtr,
> > +///     str::CString, //
> > +/// };
> > +///
> > +/// let ptr = HashedPtr(0x12345678 as *const u8);
> > +/// pr_info!("Hashed pointer: {:016p}\n", ptr);
> > +///
> > +/// // Width option test
> > +/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr))?;
> > +/// let width_30 = cstr.to_str()?;
> > +/// assert_eq!(width_30.len(), 30);
> > +/// # Ok::<(), kernel::error::Error>(())
> > +/// ```
> > +#[repr(transparent)]
> > +#[derive(Copy, Clone)]
> > +pub struct HashedPtr<T>(pub *const T);
> > +
> > +impl<T> fmt::Pointer for HashedPtr<T> {
> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> > +        // Handle NULL pointers - print them directly
> > +        let ptr = self.0.cast::<c_void>();
> > +        if ptr.is_null() {
> > +            return Pointer::fmt(&ptr, f);
> > +        }
> > +
> > +        format_hashed_ptr(ptr, f)
> > +    }
> > +}
> > +
> > +/// A pointer that will be printed as its raw address (corresponds to `%px`).
> > +///
> > +/// **Warning**: This exposes the real kernel address and should only be used
> > +/// for debugging purposes. Consider using [`HashedPtr`] instead for production code.
> > +///
> > +/// # Example
> > +///
> > +/// ```
> > +/// use kernel::{
> > +///     prelude::fmt,
> > +///     ptr::RawPtr,
> > +///     str::CString, //
> > +/// };
> > +///
> > +/// let ptr = RawPtr(0x12345678 as *const u8);
> > +///
> > +/// // Basic formatting
> > +/// let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
> > +/// let formatted = cstr.to_str()?;
> > +/// assert_eq!(formatted, "0x12345678");
> > +///
> > +/// // Right align with zero padding, width 30
> > +/// let cstr = CString::try_from_fmt(fmt!("{:0>30p}", ptr))?;
> > +/// let right_zero = cstr.to_str()?;
> > +/// assert_eq!(right_zero, "000000000000000000000x12345678");
> > +///
> > +/// // Left align with zero padding, width 30
> > +/// let cstr = CString::try_from_fmt(fmt!("{:0<30p}", ptr))?;
> > +/// let left_zero = cstr.to_str()?;
> > +/// assert_eq!(left_zero, "0x1234567800000000000000000000");
> > +///
> > +/// // Center align with zero padding, width 30
> > +/// let cstr = CString::try_from_fmt(fmt!("{:0^30p}", ptr))?;
> > +/// let center_zero = cstr.to_str()?;
> > +/// assert_eq!(center_zero, "00000000000x123456780000000000");
> > +/// # Ok::<(), kernel::error::Error>(())
> > +/// ```
> > +#[repr(transparent)]
> > +#[derive(Copy, Clone)]
> > +pub struct RawPtr<T>(pub *const T);  
> 
> 
> In the thread "[PATCH] gpu: nova-core: bitfield: use &mut self setters 
> instead of builder pattern" [1] Gary proposed to add `#[must_use]`. 
> Would that be an option here as well?
> 
> Thanks
> 
> Dirk

Hi Dirk,

I don't think that's necessary here. Adding `#[must_use]` on a type means
that any function returning it becomes automatically `#[must_use]`, but I
find it hard to find a case where misuse can happen without such
attributes, let alone I don't think people would return `RawPtr` from
function in the first place?

Best,
Gary

> 
> [1] 
> https://lore.kernel.org/rust-for-linux/20260101042851.08576bdb.gary@garyguo.net/
> 
> > +
> > +impl<T> fmt::Pointer for RawPtr<T> {
> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> > +        // Directly format the raw address - no hashing or restriction.
> > +        // This corresponds to %px behavior.
> > +        Pointer::fmt(&self.0.cast::<c_void>(), f)
> > +    }
> > +}  
> 

