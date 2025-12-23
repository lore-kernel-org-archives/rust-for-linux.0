Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021096.outbound.protection.outlook.com [52.101.95.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458743376A2
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 12:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766492302; cv=fail; b=AKUhVMfRRjRaAlQ9GJrS2TfZB51CFO4BqjoZxScVQ2zsXNmG3lYW6YVer41IZI0IuTXYF8eTVW28+9omUx/0LY5qww+D7FgAgEdQZUnmr/MqllciuE+LV6Q/Z3Ey1AO8+aJgWJdgokPRYyTjoXq37RQzPGuy72brG+nsvTCIIkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766492302; c=relaxed/simple;
	bh=2j8fO1sShKpvg2K26xXHaRfzaoSYo5SibVqPWruQppU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ejB2yDRZVNZEuYoC5zVRQIDJiJevdMJazTutLg7oiG8l8GGfjsviIhRPnSeeIw1KnxFAg3aYro28l+/4wCiCst08obCcaCLcwXgjpoxLaXSreERDR/Fy4kBb7/jSXxFjgrSgLXqVySPDF+lchXY069fFrK3mwYi7VKZQ6suaugE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=YYDx5s1T; arc=fail smtp.client-ip=52.101.95.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="YYDx5s1T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQX1oOV0JFccBNKf/aBtvkRAajz2HseUGjvYLzNkCPf1rJe7y/W9i1HsHePdGvIZp6YgFwmRbeBr1O3yFPh7lWwc0n+vo0xFiaxoEGuXl03RIXRz8Q7N1rDu2IVzZHnUNuuQxO5Eaqffo7IrnYc4AJnGjFTT71VgA8bZi29tO/W6TAlHuNATIgPyz0BhhPq6Jx3jgatY+WSRlpWkjhGe61UpVliCwkhtcHctHCj3CrkpluVomj5GpAKgJgEarHz3R0C1E5a6YP0uYhFzfEJum81Ugc8rNiD9B2PUue9WifxW527xPU4nn9nW7MMDcmVbvfKD6i5ijHx6AyjLB/0edA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ns/IbQIOBjKrbCg4ZZTqTBHIfLPTsByx7v/nHl/FFrI=;
 b=b06BiK/Dzrnk5QA5dZXKkZY7jJw3G0FXXwuI52y8T6gcMqcAPCAQMij6n9NEvnt8Wj18zTsJ3wnenNBwkYVpyvRbWjfTov66+N5KxOfyYrDEtMzV10wrsWx5uBcrHrRjqdelemBN/u6HA9iOYbKdlY2rV4AToFC4tVFju5099CwKk7nu2vXhy3wBWt4oScPi/HTpNv7weUUiKKDSNMEOuAOhAYGepkgJ1+/41/D5MCILUj8bNpkG58onv/YYRT5t9JSqRZHQAhkC27kMj0iVwOrAaTFA/cU/OKSaHeipINSVKNsEqD8nGtWgBh69kh/NsQrS9wLowhXVmHqVqC9RkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ns/IbQIOBjKrbCg4ZZTqTBHIfLPTsByx7v/nHl/FFrI=;
 b=YYDx5s1Twz6UGZopbVOY27UWFkspyiMIkvQYS/sP0twP0Jp9aBGYKoxYcCDTLjNhk/qU2kcOOVvPtyxpYG0VzEEJlGAqyoKWpm6sLXMt9Nr36xEjxVxjIpdgzp9Mc9jIeTBRL9OPATx9HZ3i1eCpjR8PEfa+WQqhGAcHYnrLu5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by CWLP265MB5706.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.10; Tue, 23 Dec
 2025 12:18:16 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a825:7b26:a82f:d041]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a825:7b26:a82f:d041%6]) with mapi id 15.20.9456.008; Tue, 23 Dec 2025
 12:18:16 +0000
Date: Tue, 23 Dec 2025 12:18:14 +0000
From: Gary Guo <gary@garyguo.net>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: alex.gaynor@gmail.com, ojeda@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, boqun.feng@gmail.com, bjorn3_gh@protonmail.com,
 dakr@kernel.org, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v3 1/2] rust: Add support for calling a function exactly
 once
Message-ID: <20251223121814.0b00f725.gary@garyguo.net>
In-Reply-To: <20251117002452.4068692-2-fujita.tomonori@gmail.com>
References: <20251117002452.4068692-1-fujita.tomonori@gmail.com>
	<20251117002452.4068692-2-fujita.tomonori@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0109.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::13) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|CWLP265MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: 11f5571a-f71b-458c-65ea-08de421d59a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rEt7WEjJb3RGtIQA5AscOebLdxYb3apoaKRFUpg3Xcii/pGWI4ACQ4RtV8qZ?=
 =?us-ascii?Q?7nXp+A1brZaly2s3qpSmDlakroPJg45z1h6tdnz9Cd+vuMT0mwOeeEEF8j7m?=
 =?us-ascii?Q?rtG2lWcG2kgXEKcCSeGzQAQGrr0TfnaJq5CpP0NQ3paDDQ3WpS0WanHd8j3p?=
 =?us-ascii?Q?U/hKVYbBmPXZjypWh4CU5cusTmQqRLwmxMfX5EE3zGoarf1jq1Uv1MNYUDEG?=
 =?us-ascii?Q?BDeguLhiw1x8KwJRaf1Edfb8xT+FDUNicS9LjVOhJlgHommkjPjxW8fuqk85?=
 =?us-ascii?Q?9g5ztzi67mqR50p1VizjqjB9p2B9E8U16RC5F8cg/YQ09cU6NE+pCqWgpWLj?=
 =?us-ascii?Q?i+GOY/wf17oC7oCwKZXVpRCBCnQO1C7SNXNHMXw/kTSmuBmBiqq+K9bkB1gU?=
 =?us-ascii?Q?0MAPsUZ6nMJHUgBAYsw8bSHbM7D0z6F68Kqvti+BZTTmF5HWFMg4uDnvINwe?=
 =?us-ascii?Q?P1ZYXGQVsDKBQN19QOAreRUU/DbDMJqRPaCiqdZVkcGQP6fY0JPbM3erQfbz?=
 =?us-ascii?Q?DhNGBS2Odr5kX+R+Iwc6e3MYfg0xVh8EGcS/ol/iypZ+VcNZDIsCNA+kobnz?=
 =?us-ascii?Q?VxYjm52QlJvR1+outlm1WzD7Bce/tVpbQ24GTpzOEd7E4Cl1bNP5opgI+ggC?=
 =?us-ascii?Q?PG1oM4IEKQkJftblH3GRhsuim+BcMM+wKPQ05oP8E6f1VuVkDlKgFLp0q8AV?=
 =?us-ascii?Q?XTJNlOmgllM4YKujvwanhO+8OcTh8xLezNLTotebRnZdnU3MLeylfJ4KEihi?=
 =?us-ascii?Q?ONJQrCJjrIC4ezGa1xJNeLyZvR1NKzP6YmERn2CZWyscfxD67swvJmgDEJ+b?=
 =?us-ascii?Q?y2s3f/SgvVE5ydjJZIo7u9Xz815FOjJww2u55LHJ5DIqQtchngarypUyEruq?=
 =?us-ascii?Q?vLbLQ96ieCNm3VgqLia183vaV8sjDSvHkf5lVqk3bbc4DhoK9uMbzdOGPf/+?=
 =?us-ascii?Q?NMtnLCOSnqPkbnOYrbVb8TYVvbcYXfCKftnCJv1+beT/Jdu8c6iL/iKKc8wh?=
 =?us-ascii?Q?qkfb4Wm4qkW3bBex51MdKql8o19fvtDH401V5Aw9AfGh6aYgCw6BfLhWTqKQ?=
 =?us-ascii?Q?N137RWPEk8PO0/H/2qE9zpKUJ4qJcZh89J41ClY5veIxZg9bylUWkDOTuh7w?=
 =?us-ascii?Q?vu/g16oAxiIerBzE88oWSh1DCynndv2HCG5MRLa98qZ0U/p3RprMNpuvuWK8?=
 =?us-ascii?Q?G7G8xG6W0zU6k6a6z6ttoKmw4HD+RcmF2DmGW3mI5oSInpm4+duHOBb4JFsp?=
 =?us-ascii?Q?RYx658San+yVMLyr1XN/HotS+rgklEbhcUxa+y15jIXiP5G3Fm/t8VR3gygb?=
 =?us-ascii?Q?w3s5HEOSeL9vXqAEuLbZbQHYI8au1Mq7UVNyvyA93cs2JlbnFhh3pAZckM/e?=
 =?us-ascii?Q?3EgbLXGMIsWYB/imBhWSnlX6f5qMEkxvvf4z68WxwPI7bACyExbRQFDoBCmT?=
 =?us-ascii?Q?CP+u1A2H2MJrJqUP6eRH+GwcMmFDccRC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LcdclL2qxNmgLypioolBZa3v/JU/46++u9rkAu2dcmKOi1kl7nwOKcNytS9+?=
 =?us-ascii?Q?tMnw8mLZ8qyOIvwySctK1l1gwi/hjfZEj1EpVM51UwE+DWAfSc3xg8pdPe4r?=
 =?us-ascii?Q?gw1DRQx7XPpLF8Wy6u8ewJ73AlHQwnmVM/tp/O/lAtbgeKOhheTbodo9z0/B?=
 =?us-ascii?Q?GnIuWazsXHwySUjWbfQHAyb1lKIBbDrqKUiogtA+0Ks7iJKnszxqzH9fUicT?=
 =?us-ascii?Q?V5/YrvpFVCFkjNFx+43oe+wDVBSnh85PxU2TN7dmpa2Q1UnuC0l+6VLM2Z3c?=
 =?us-ascii?Q?p5CfiYfCtnDy+VDj2CePDXmg47021Rom9M44dYCbRrbRTCBJxTlR+1c5rRld?=
 =?us-ascii?Q?DPDYb1HW9GB5aDpC3B7AOtredtoUGM0j46UrI+wQp/lmpK0CWDYn4AEkHSl5?=
 =?us-ascii?Q?FS8BfxGAJsKHjf+MB4Cfso9wGNdjUel+jVu1Yn5pLA1k3ZcvMm1R5SFqJS7L?=
 =?us-ascii?Q?xbonKVRbjSfADUQWgNIX+6lP7fC935W3U7zCVjxie5REzZZ3GLq1YFmSOi/p?=
 =?us-ascii?Q?jM+Iqe1OcuWVmRCbQgiDZ00YPQ16zWX0c2EDeJhQMAYXmpyQPP0t9Z6DzyXJ?=
 =?us-ascii?Q?Ayq76oFYXNdr3OLaCmHrgGsRoiTpkPMjA2USnQpX7ZsmnOfGxcbixZl3nJFw?=
 =?us-ascii?Q?uUUbiWmUP4FkyN8PqeNuucwkEwxlGHvT+z6VgPJmjw1i6G9cCkRf1jmFa8m9?=
 =?us-ascii?Q?Bbwi5H8jpKOiLuW3odVmeu7kEXMx/4Z1uaFFwoyR+pEu/iPiSJ5W7ZEzsN5k?=
 =?us-ascii?Q?Gl7ygqtio/rCJ4nUkJ+dtV7xN4rk73tlN7LX9OPo8j1DZ6DdGPB9QtpWeKbO?=
 =?us-ascii?Q?FcK3FoKcR+1BpAary8fZVRYKSrtDRG0wpUfJI+JM0dzie9zsZrnRw2Iyw8Ma?=
 =?us-ascii?Q?p/upDoErIEE7f67ITtfZHsay1Seb3pykMATslE64ET/E0dZFNgCJQ2de8YMN?=
 =?us-ascii?Q?+KHoyoWyPt2Wf6by5Cz+eBuot8fCgNSc828FwRGJq3GcsAmjPAIRY/9C8Dds?=
 =?us-ascii?Q?oO830x1NfioBV7FNBrtM5npph1pu2lwfzZWyEczXvhi4RUmopFrOhL1tnWjR?=
 =?us-ascii?Q?fzhQ2RmzZ349GzUUhZlFxmdXSUnvL4gEXyiOc/F47EJemDNcFvD8/a5RXbDL?=
 =?us-ascii?Q?YZM3/cY6pi3z4D2TTj4mpxpVD0BjY4SjTXrZN4YdTUI8cxjDnlpn2AY7AP+j?=
 =?us-ascii?Q?6TO5z1FlNo2soHpWgJ0dxHErVSYts2WQndUnSb4x8hahNMDtuDx2VqAfWYVr?=
 =?us-ascii?Q?tcXqd2VxTZgoscaaV+2b1DNvgi6tqYbg27mj2si4l0TOtjZgbtN2VPOL++sb?=
 =?us-ascii?Q?CtU6n+7/E2L7vOAqt6b9feAL+grkoCANVk7Nupwwbng21Rf2YKagSGnrDCKZ?=
 =?us-ascii?Q?356g4LjTpEzOXlQZIK+qDUXLXaOXvhBw0Vy+Bf5Mr++9LKQSD2f13kr5m2jV?=
 =?us-ascii?Q?VW0yJUIxBcOsKXHwBv7OX5lTnKKaKrB9NnsLrYriuT5Ed3vjOS/dboWb+9NZ?=
 =?us-ascii?Q?LlV/pJENDmhFjwVtxXrwz2Y1QwUidECwE8Fg/gppjb3uyzHBXSYfQ3eo6f8/?=
 =?us-ascii?Q?TWoyWIzHJWV0FXkTqtGSXc9tl9nLRLEEnA4sgNEpqRjGVfWN8aXbwlFo8SOL?=
 =?us-ascii?Q?gf71sckPJYkO6va61yQ/6i/q5RHoMRmPxk4t2Lf8bx+jUHmQNZmnm4c35SXX?=
 =?us-ascii?Q?PfDjMOYD0g6eTtimDQur2g+QBLWz5KpwoYxM/v3BmG6nQbiVNPJveJa0MLc8?=
 =?us-ascii?Q?3sUqNmej/g=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f5571a-f71b-458c-65ea-08de421d59a8
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 12:18:15.9742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFQq/PZ9AHv4Q2weSrWY6UHUNt2P3Xs9HkMYFL/L2X7AW243pIQvItfVcpUGe9ZcOTo+WhFqtgJNnd2LBd4GeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5706

On Mon, 17 Nov 2025 09:24:51 +0900
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

> Add the Rust equivalent of the kernel's `DO_ONCE_LITE` macro. While it
> would be possible to implement the feature entirely as a Rust macro,
> the functionality that can be implemented as regular functions has
> been extracted and implemented as the `OnceLite` struct for better
> code maintainability.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/print.rs | 83 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
> 
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> index 2d743d78d220..af32054be5a2 100644
> --- a/rust/kernel/print.rs
> +++ b/rust/kernel/print.rs
> @@ -11,6 +11,11 @@
>      fmt,
>      prelude::*,
>      str::RawFormatter,
> +    sync::atomic::{
> +        Atomic,
> +        AtomicType,
> +        Relaxed, //
> +    },
>  };
>  
>  // Called from `vsprintf` with format specifier `%pA`.
> @@ -423,3 +428,81 @@ macro_rules! pr_cont (
>          $crate::print_macro!($crate::print::format_strings::CONT, true, $($arg)*)
>      )
>  );
> +
> +/// A lightweight `call_once` primitive.
> +///
> +/// This structure provides the Rust equivalent of the kernel's `DO_ONCE_LITE` macro.
> +/// While it would be possible to implement the feature entirely as a Rust macro,
> +/// the functionality that can be implemented as regular functions has been
> +/// extracted and implemented as the `OnceLite` struct for better code maintainability.
> +pub struct OnceLite(Atomic<State>);
> +
> +#[derive(Clone, Copy, PartialEq, Eq)]
> +#[repr(i32)]
> +enum State {
> +    Incomplete = 0,
> +    Complete = 1,
> +}
> +
> +// SAFETY: `State` and `i32` has the same size and alignment, and it's round-trip
> +// transmutable to `i32`.
> +unsafe impl AtomicType for State {
> +    type Repr = i32;
> +}
> +
> +impl OnceLite {
> +    /// Creates a new [`OnceLite`] in the incomplete state.
> +    #[inline(always)]
> +    #[allow(clippy::new_without_default)]

Maybe put the reason too? Otherwise a reader who hasn't been following
previous discussions closely might be out of context (like me).

> +    pub const fn new() -> Self {
> +        OnceLite(Atomic::new(State::Incomplete))
> +    }
> +
> +    /// Calls the provided function exactly once.
> +    ///
> +    /// There is no other synchronization between two `call_once()`s
> +    /// except that only one will execute `f`, in other words, callers
> +    /// should not use a failed `call_once()` as a proof that another
> +    /// `call_once()` has already finished and the effect is observable
> +    /// to this thread.

Nice! Thanks for putting this in. If this this insn't in this will
definitely be misused (I won't be surprised that it'll be misused anyway
even with this, though)

Reviewed-by: Gary Guo <gary@garyguo.net>

Best,
Gary

> +    pub fn call_once<F>(&self, f: F) -> bool
> +    where
> +        F: FnOnce(),
> +    {
> +        // Avoid expensive cmpxchg if already completed.
> +        // ORDERING: `Relaxed` is used here since no synchronization is required.
> +        let old = self.0.load(Relaxed);
> +        if old == State::Complete {
> +            return false;
> +        }
> +
> +        // ORDERING: `Relaxed` is used here since no synchronization is required.
> +        let old = self.0.xchg(State::Complete, Relaxed);
> +        if old == State::Complete {
> +            return false;
> +        }
> +
> +        f();
> +        true
> +    }
> +}

