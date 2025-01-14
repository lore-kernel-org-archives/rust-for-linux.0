Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7E515ECDF;
	Tue, 14 Jan 2025 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736869922; cv=none; b=e+dd9Jc+omQF08A/QDxz9GETLmYo0SlQWYNMuBxY4KiVfLOeWbj9h41GYqTVoUdoPO39qZUtmMHoWnaZ4+4AGo7C9KiNM5s7K2bkKW/etiEnpv0yq4LcYNl4Xw49rEkMxzBqfIOsUqMpjWxxQ29WUGWH/iOcNbQc++t1Jy6b6UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736869922; c=relaxed/simple;
	bh=VuDI8gaXPtJ0h1qKEvM8NRNZi/S6Ba+bK1BQzdiomvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObaqyUz4ayA5Yax0LirTEDkD+brRfie3O/3xwgWAfMFP2/HbrbTkwnt5dSsFR7p7addUIA9ATsQor8AAFCy2JIOyMEqWJFmSn+Iwvq30Mx5juXJkWea9ArsjecoZRIRPw8DdNb3Ft1XDoRsvPk5qLOzl/O0eiWP4e1S2RhHIAD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZ1wHdMP; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZ1wHdMP"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6dd049b5428so45526956d6.2;
        Tue, 14 Jan 2025 07:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736869919; x=1737474719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrN/XIDqZQ1PfOXKErSTYKQ3Rt3IxRwrBOukCrfpSF0=;
        b=RZ1wHdMP3vwbUkAgqcyPmotuG8xhevjjDRmU77VvJLAgLg1jqgOnXuL6aHj5qrWUmk
         b1BGfBMeZ0HOxBL7gQLAvdmCnlpUfl0ZW37ToTGFrASoaA9YO3vjU5A3C40QcWj1RCh4
         OE6kDNWqmMLMlsBUSFgOuYEI2gBPQ1qF1IVJ9gUsV8iPgqjC8TYIM75bQhbNa7bCcwMH
         WyismVwhoP2B/CZGBO7SbUc/Kx8SlJ3QN0t3QllhPcgGVAERfMam0qrECZt66pEu78hE
         ayfarWVLMfkS103oPXoNXffHygujaCm+DlOwOnYNIxHHgxb++siZXyTM/qTCEtzBfd2W
         RD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736869919; x=1737474719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrN/XIDqZQ1PfOXKErSTYKQ3Rt3IxRwrBOukCrfpSF0=;
        b=UMkOPmtrbDzpbXKX8clRkCueM3JIX7yqIuoFg0qiPsl8XGS3lq7C8wi6HRWSXpKEAu
         dXoTS3ic3qTvEXjbxM9vpk639itynGeTIDv6ey0eLGIKxZOkae5OeZRtRFdSGlyneuGE
         nCvX34VGHN31l52xlVdZbM4VgLDL0gv7hT1IwqkzQMn+ZgSsoqmI7oSdlyCpSmvnFOxa
         YrPZAtsTUqM1YeEoIVkLoEJugUekywQy3iliW9BVFLBfxxQs9XQA+9lq1zeu9Lt1De2X
         mhBrq+MZlumJMYno7L0iJnyQ5dDIuF0KosWMsDY2JHke4miEryt8+4gls7PLiZTIUuQh
         leog==
X-Forwarded-Encrypted: i=1; AJvYcCUqv8P4TBCzrgu+jFmZG+J2y0uSQpGM5x+oByj50SPtpAl2rI1ARz8SlOfd4WsS4HGT20I6Vbcb8SIjQAI=@vger.kernel.org, AJvYcCWTlWiaNf28pxEJxwvMxz6r6CR65k3RHem4ZHvanZhfNzTulYx1Ui9gkVrHFkqgBDX9qYKc0k/+aYpReonPFNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb2zqnurAkghFmjhUnJSNEEyp+aIzhENcBFMomecb2onkhieVn
	UO1r1TR7A/gvkKhCMu8y1IQHGetkY7SNly9KbYBt9OjJ+W2pjIyB
X-Gm-Gg: ASbGncsyLSLv9tFn89sdO2w5umxlPEhfCe/PpmAs+mgLnz5XIGsmtiog1BJMt+ABeg6
	HvvvdnQK/ujXKfZQGRuqMU+adm4h7mFxBKmnKw/vft3vKlND9Qf95LLg+EAW42hKvVskgix/6JI
	jEOgyqgwRcjwbHFJCxg3axBIbrNUaQGimuNKrera1PkEOK4HOkKJgXi56ymB2yJaXysTwqOxtxj
	c4R8o3Fb1NPfSZilh75OTb8LvM0V4OOeH1l4VLMHiuIwwwJNwTkyCW4GUC+JybijyycSeD485cY
	gi2LTmuzXWWJnHnTzw71MyKpZssSM8lQCex2pJzgY++kod8=
X-Google-Smtp-Source: AGHT+IHAFAvHGRJjhXPt5XHN3c4vaglQkvaOGNpl9SXgdeJla3GT/gB8GRzf2j/Gk8E7sS45ut82cg==
X-Received: by 2002:a05:6214:dca:b0:6d8:9ab7:adcc with SMTP id 6a1803df08f44-6df9b1f6c6cmr388988546d6.22.1736869919170;
        Tue, 14 Jan 2025 07:51:59 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dfade89283sm53783396d6.105.2025.01.14.07.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 07:51:58 -0800 (PST)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 289BC120006C;
	Tue, 14 Jan 2025 10:51:58 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Tue, 14 Jan 2025 10:51:58 -0500
X-ME-Sender: <xms:HoiGZ73LfGz3Nc089rvXD0l4D4qBO63FY2wIJu_sq0yRcPq29lYcSA>
    <xme:HoiGZ6GpYFBNwf-AApkl2wre2TzOhlwavZsnVx7NqCzf-bq-gQHa2Sc53atkiGaQ_
    TjRgsp1jqZagsdtSg>
X-ME-Received: <xmr:HoiGZ743WwfVxaoM0_HArcn-gOBMMfAXizShpq2-7q6NnbvULsxL57PrjFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudeipdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprh
    gtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidr
    ghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghjohhrnhefpghghhesph
    hrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehp
    rhhothhonhdrmhgvpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphht
    thhopehtmhhgrhhoshhssehumhhitghhrdgvughupdhrtghpthhtohepthgrmhhirhguse
    hgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:HoiGZw3c9oFP9RIBz_6Hpo3YWK6K5qpIqrS92DWy3c66D_BMRTKeog>
    <xmx:HoiGZ-EjD36YEWkvdVi0dZTUjKLpEPQnynEx-GHHtHjOJ-xZAos1AQ>
    <xmx:HoiGZx8JAfmm0T6Y50fNBbRsCAD4yJQex67EaUvL7WjV6wBJoDLmoA>
    <xmx:HoiGZ7lN1LBtKberl0aOXDsAihd0O9S2P0qckW49fZn5OAnRrsl3pg>
    <xmx:HoiGZ6EadiWj1iqSMDL4AQAcHyv5rLudwUmv4b7ieJC3I6sde5gCNi5W>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 10:51:57 -0500 (EST)
Date: Tue, 14 Jan 2025 07:50:41 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] rust: implement `kernel::sync::Refcount`
Message-ID: <Z4aH0aK1IA7_E2ix@boqun-archlinux>
References: <20241221183024.3929500-1-gary@garyguo.net>
 <20241221183024.3929500-2-gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241221183024.3929500-2-gary@garyguo.net>

On Sat, Dec 21, 2024 at 06:29:44PM +0000, Gary Guo wrote:
> This is a wrapping layer of `include/linux/refcount.h`. Currently the
> kernel refcount has already been used in `Arc`, however it calls into
> FFI directly.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/helpers/refcount.c      | 10 ++++
>  rust/kernel/sync.rs          |  2 +
>  rust/kernel/sync/refcount.rs | 97 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 109 insertions(+)
>  create mode 100644 rust/kernel/sync/refcount.rs
> 
> diff --git a/rust/helpers/refcount.c b/rust/helpers/refcount.c
> index d6adbd2e45a1..d175898ad7b8 100644
> --- a/rust/helpers/refcount.c
> +++ b/rust/helpers/refcount.c
> @@ -7,11 +7,21 @@ refcount_t rust_helper_REFCOUNT_INIT(int n)
>  	return (refcount_t)REFCOUNT_INIT(n);
>  }
>  
> +void rust_helper_refcount_set(refcount_t *r, int n)
> +{
> +	refcount_set(r, n);
> +}
> +
>  void rust_helper_refcount_inc(refcount_t *r)
>  {
>  	refcount_inc(r);
>  }
>  
> +void rust_helper_refcount_dec(refcount_t *r)
> +{
> +	refcount_dec(r);
> +}
> +
>  bool rust_helper_refcount_dec_and_test(refcount_t *r)
>  {
>  	return refcount_dec_and_test(r);
> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> index 1eab7ebf25fd..b76b04e16eac 100644
> --- a/rust/kernel/sync.rs
> +++ b/rust/kernel/sync.rs
> @@ -12,6 +12,7 @@
>  pub mod lock;
>  mod locked_by;
>  pub mod poll;
> +mod refcount;
>  
>  pub use arc::{Arc, ArcBorrow, UniqueArc};
>  pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
> @@ -19,6 +20,7 @@
>  pub use lock::mutex::{new_mutex, Mutex};
>  pub use lock::spinlock::{new_spinlock, SpinLock};
>  pub use locked_by::LockedBy;
> +pub use refcount::Refcount;
>  
>  /// Represents a lockdep class. It's a wrapper around C's `lock_class_key`.
>  #[repr(transparent)]
> diff --git a/rust/kernel/sync/refcount.rs b/rust/kernel/sync/refcount.rs
> new file mode 100644
> index 000000000000..2198b1598b60
> --- /dev/null
> +++ b/rust/kernel/sync/refcount.rs

Could you add this file into the entry of "ATOMIC INFRASTRUCTURE"? I
would also suggest you to add yourself as a reviewer or maintainer in
that entry (given your expertise on atomic and related compiler
behaviors), but that's totally up to you.

> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Atomic reference counting.
> +//!
> +//! C header: [`include/linux/refcount.h`](srctree/include/linux/refcount.h)
> +
> +use crate::types::Opaque;
> +use core::sync::atomic::AtomicI32;
> +

Could you move this "use" into patch #3, where it gets used?

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

[...]
