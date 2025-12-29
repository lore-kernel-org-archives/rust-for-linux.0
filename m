Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D87824BD
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 12:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767011476; cv=none; b=dPhwUbAjUk24vewL2BTT2g6aYI1ZgeZMX2LOZ1nBEmvDE3Okz900Km09ejxrtKwSaFxMFMRPNYuI5Aj4WD7ohieVBz5zoWdcvbzEGXLgVqMSLagMYyQZO+xztL6womGwK/ZeOeaYne47eoefmKpRk05+qTTdU/khfqFxEZ8O6wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767011476; c=relaxed/simple;
	bh=xfYI1Yf9yHBXxm2JnHiR2fuXlsRqVTmDRHcJ5hfM9PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9rD/vIYukoO/bgko6HG6agHHnTy7HU1xkq3g3LG1UgfHgZsc1LjS8Q1OSQBXlG/xOtujIblCwxcG0WI73dOwM0bdPvsmdsBT+BM+MxebP4UFXB66+MeRgfQgMEZH6YBvVGKAQ4DMgY9jYMr/K87b+30xSh9sSqcbQg4VulPpKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y93KXOi/; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y93KXOi/"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b2f2c5ec36so1034014685a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 04:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767011473; x=1767616273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOtsyn7aq1K+DNubm31+7aAVKV+SyiiRdi3Irr1KXiY=;
        b=Y93KXOi/9h6HptKuMLROg9ZSMRItkuYZ7CMYSurRd92NZ6P199U+LSPmx5OI069GU1
         0tJR5P6744ovJC3vnCZBv10Ud5N/0ljdI1ceuwYgOJafIlLtgJsnTwrpWALV3vZOSIiJ
         TWf9MKOFjCJN7suefk8s80rL/bUgcF/VQC4YiBJYp8CkmUQ3gA6tJ6EZB2TVPGkUB6IN
         gb+3Q07Wp9mLXF1OlefnxVAemxVCtV8tnYrjNtovYAJ5Qm53z6Djlh1raVXATfJFD7Tx
         RpcYhr3/WFMoIy7NtAmyeUREyC1bkdRRPMBzm3mDN9KJ0DqFcqiqXCuttqhrPnj1b7Tu
         sh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767011473; x=1767616273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aOtsyn7aq1K+DNubm31+7aAVKV+SyiiRdi3Irr1KXiY=;
        b=MrGvwxl/eehQloQMX8kXTpMaJ95olUX07V9pVI8bm/slPR0ZXsn8Ek4FylJ7FdXwis
         9X0MfmkOP/oR4TusQfCe+c1McP/TINqfsqtlQZK3+KQKyXznPlyZENywHpfnZHpJRtxh
         GRE89jJr6tzOU6q9npOQ1WLa01ncDyPpeIofEigW7TmOOD1BOtcaC317pMSXNnOcDB3e
         /VRxU1DZOsGhZL1axl4OCOkGkGeQduDSY+5W06cWYpHomm6mOQEVwtZRnefA6u8tQM0P
         RSXnGWhm9QHvZXpQ5RYZD9TFWDTQ1OcIQQ3747hlZjhcoxDhU59qb9t4cEfIOjtgZMOJ
         GESw==
X-Forwarded-Encrypted: i=1; AJvYcCUByc/wFwBQZrCSP4jAivuLCsRg7kSMvFac5UUXrTvOIn3+/3qK0wZs2fmXvI1VGOrb4Lksg5pul2HDf9uQ7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjLKfF+JAekKY7YnIluP+c1AOOEcPWuyiKYTkg7Gt75gSqz2aV
	AAtmjPU78BBjUoheq44fD6Nd8SEvJuGeACd6MZBGx28dUIUrYC/iUoYe
X-Gm-Gg: AY/fxX6X68GuMEXg+NTlpNaKvFJU/RHB0MTKSmaMiVux0i27H/1H2GJL46PvfyMw5V3
	1tQobAtwXa1M/Vtao3o2Xc7sYTW+NvoHqeWAGe2+7ZF5o/5QLb+S747+G7VlVSdsS/FgburYqXv
	Mi0FR0csUCfIzXDPgCK4/wgdYQukV4n97or6IUPD+XVKoltDRgvlEYM9cq1b327QsDukY6ypjlg
	TjNH6zOpAQz2voPs6VrnZitCHLXtLbU2gqyDYGZaNTVogk2qd/YrCXWaHSmy4CtxItIdBjJtExy
	/yUFtPIAtEJ5b6q9V059EKyoZWssrtKkyHq79MabV2lP+w4dJB/nBSvEF3khmTyrwKEVY0XARTO
	ZVVQ4KzhRs9iKYpEyjg+PdnGSLjPUzTIPV3xtogtTMwWpft9RD393RdOQfwfnJRoql+6vZgJTVq
	lTyi76fsu+CDB5rFJ+Hb1eQETiwURltiQqOQxJDyBCX7K/7XsvOM2e5EI54ssG5JxkV9u0B4JPh
	VyQjsW/9HyBLKXemuze+8AGbw==
X-Google-Smtp-Source: AGHT+IEhYjOCkQEzSJqCVdHi1SPZJ12UkCaHTRSn6IVFtQOkm5SJ1Ixn7r9PWJiwfTUDOHlGwZxbxQ==
X-Received: by 2002:a05:620a:444d:b0:8b2:33f5:fa49 with SMTP id af79cd13be357-8c08f6586camr4370968985a.14.1767011473524;
        Mon, 29 Dec 2025 04:31:13 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890105c3b34sm54938736d6.48.2025.12.29.04.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 04:31:13 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id CB95EF4006E;
	Mon, 29 Dec 2025 07:31:12 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 29 Dec 2025 07:31:12 -0500
X-ME-Sender: <xms:kHRSaVqidMABfHQUp8uMu423BFTlgR_wh6vj7-B5Hhoqo5MYxCKchw>
    <xme:kHRSaeKb69cHrVJAzgU3kmY6F26q5brA4FIewpFnacNk_Ii_bKQORrufTxqiiB6az
    _NVL7kdICDBVvVaVooqw7GiZ7-gcDhAjX-RZCC1fGSj3c7OucPnhis>
X-ME-Received: <xmr:kHRSaQN2oOZ5mNDhWjOFEHnqA9Mb4_8dnW1-8yf5mE3VIDTYk2dbM7hTug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejjeduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepfhhujhhithgrrdhtohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtth
    hopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhr
    gheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglh
    gvrdgtohhmpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgt
    ohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrg
    hrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:kHRSaTo9x87c4OzD2dGTcnj_lgLaxZnmEswDXIMRTTqpClSdA-x4Rw>
    <xmx:kHRSabIQPUPcPxucBLus56yVAq9arnBFwdAolGoSRE-zl75nigzWtg>
    <xmx:kHRSaS373dvbzxw-4Y0V7UM2brzFPYxr24tGsLv74vMETXQrmtQIIQ>
    <xmx:kHRSacWtIWiZNPe_ILyjexDszssu7HmUtZ8sCLUGw-fd0bNxovlTbg>
    <xmx:kHRSaVxCktAo3ol-qKFVb5RQTtgQ9lGMPKBPXVzE4gAeMQIZSuGv61l1>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Dec 2025 07:31:11 -0500 (EST)
Date: Mon, 29 Dec 2025 20:30:58 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, tmgross@umich.edu, acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v1 3/3] rust: sync: atomic: Add i8/i16 xchg and cmpxchg
 support
Message-ID: <aVJ0gvxe0nYtOXAO@tardis-2.local>
References: <20251228120546.1602275-1-fujita.tomonori@gmail.com>
 <20251228120546.1602275-4-fujita.tomonori@gmail.com>
 <aVJzlTWx4ybMi1ym@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVJzlTWx4ybMi1ym@tardis-2.local>

On Mon, Dec 29, 2025 at 08:27:01PM +0800, Boqun Feng wrote:
> On Sun, Dec 28, 2025 at 09:05:46PM +0900, FUJITA Tomonori wrote:
> > Add atomic xchg and cmpxchg operation support for i8 and i16 types
> > with tests.
> > 
> 
> I think we also needs the following, otherwise architectures may
> accidentally enable Rust but don't have the correct atomic
> implementation for i8 and i16.
> 
> diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
> index 248d26555ccf..a4e5bbd45eb2 100644
> --- a/rust/kernel/sync/atomic/predefine.rs
> +++ b/rust/kernel/sync/atomic/predefine.rs
> @@ -5,14 +5,22 @@
>  use crate::static_assert;
>  use core::mem::{align_of, size_of};
> 
> +// The current helpers of load/store uses `{WRITE,READ}_ONCE()` hence the atomicity is only
> +// guaranteed against read-modify-write operations if the architecture supports native atomic RmW.
> +//
>  // SAFETY: `i8` has the same size and alignment with itself, and is round-trip transmutable to
>  // itself.
> +#[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)]
>  unsafe impl super::AtomicType for i8 {
>      type Repr = i8;
>  }
> 
> +// The current helpers of load/store uses `{WRITE,READ}_ONCE()` hence the atomicity is only
> +// guaranteed against read-modify-write operations if the architecture supports native atomic RmW.
> +//
>  // SAFETY: `i16` has the same size and alignment with itself, and is round-trip transmutable to
>  // itself.
> +#[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)]
>  unsafe impl super::AtomicType for i16 {
>      type Repr = i16;
>  }
> 
> I can fold it into your patch if that works.
> 

OK, the right place should be at AtomicImpl instead of AtomicType:

diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index ac689ce8ee8c..f4760e3a916e 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -37,10 +37,16 @@ pub trait AtomicImpl: Sized + Send + Copy + private::Sealed {
     type Delta;
 }

+// The current helpers of load/store uses `{WRITE,READ}_ONCE()` hence the atomicity is only
+// guaranteed against read-modify-write operations if the architecture supports native atomic RmW.
+#[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)]
 impl AtomicImpl for i8 {
     type Delta = Self;
 }

+// The current helpers of load/store uses `{WRITE,READ}_ONCE()` hence the atomicity is only
+// guaranteed against read-modify-write operations if the architecture supports native atomic RmW.
+#[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)]
 impl AtomicImpl for i16 {
     type Delta = Self;
 }

Regards,
Boqun

> Regards,
> Boqun
> 
> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > ---
> >  rust/kernel/sync/atomic/internal.rs  | 2 +-
> >  rust/kernel/sync/atomic/predefine.rs | 4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
> > index 1b2a7933bc14..55a80e22a7a0 100644
> > --- a/rust/kernel/sync/atomic/internal.rs
> > +++ b/rust/kernel/sync/atomic/internal.rs
> > @@ -274,7 +274,7 @@ fn set[release](a: &AtomicRepr<Self>, v: Self) {
> >  );
> >  
> >  declare_and_impl_atomic_methods!(
> > -    [ i32 => atomic, i64 => atomic64 ]
> > +    [ i8 => atomic_i8, i16 => atomic_i16, i32 => atomic, i64 => atomic64 ]
> >      /// Exchange and compare-and-exchange atomic operations
> >      pub trait AtomicExchangeOps {
> >          /// Atomic exchange.
> > diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
> > index 51e9df0cf56e..248d26555ccf 100644
> > --- a/rust/kernel/sync/atomic/predefine.rs
> > +++ b/rust/kernel/sync/atomic/predefine.rs
> > @@ -149,7 +149,7 @@ fn atomic_acquire_release_tests() {
> >  
> >      #[test]
> >      fn atomic_xchg_tests() {
> > -        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
> > +        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
> >              let x = Atomic::new(v);
> >  
> >              let old = v;
> > @@ -162,7 +162,7 @@ fn atomic_xchg_tests() {
> >  
> >      #[test]
> >      fn atomic_cmpxchg_tests() {
> > -        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
> > +        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
> >              let x = Atomic::new(v);
> >  
> >              let old = v;
> > -- 
> > 2.43.0
> > 
