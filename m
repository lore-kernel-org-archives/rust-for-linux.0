Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3B8314B94
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 17:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771004662; cv=none; b=V+w8hNT/8mS0XVxQ1yNrErwaan3sTGsL8TuorfLUh0YICeD3jCao33tuawpGxBfJ7C6YzcJ/gw8rV+NgaZdErSP6I/2feQrwEts0EIRQIQf+Uj7YaZSXX4cYpG8Dg7KnN196k8DNqJpKcQaY5THFbuMG+NWmMLFe18gHVgIKXPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771004662; c=relaxed/simple;
	bh=VFAXBTc9oMi96YIx20U30QjLHc0sOwJECYK1drWpRwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RA7KwWQgYvUrUeAoMt64QekKjflpGpjEMYhuxvUidTysvs7gKRNoS3jUnX8rWckId/L6FxZopy3c6suOjQpTNks6dXrOYvU0+tsxmnkt5VuXGgKQIUSpnQj3mrZ/YH43HLtDu1eNqcLPBHO/o3jTzkZlqrjtXwb+4lZljIuGK14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LaS2/9Ic; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LaS2/9Ic"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BA3C19421;
	Fri, 13 Feb 2026 17:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771004661;
	bh=VFAXBTc9oMi96YIx20U30QjLHc0sOwJECYK1drWpRwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LaS2/9IcMxORLFUlVKygMy56493bI1Pi4wJrtuIkhi88GoLv6tkmTf0kGD3uGWws5
	 /7J5UIBCPUeCduHJP7pGIu0hYk29mHeRqyo/POd69rSlmduHZ33rVMhY35K8HpcpTh
	 tO8dMQMwcJpIrb6zy+Bcbyg4Ar4x9mqfLdP8uQAO3KwJ5/ONQ0IGKSz55KfYPq5Sqx
	 kwX0b+yWmeC3JJ8MJTRoTSttMgbVzmyqtSbp8E1tFsuPL4pBoYx4zvYJVr2yNLhdFD
	 b26RyHrpf34jFa/8TFsvfWvp2Bfh012M/BGSbG12Kzgg2wgn307qWHPwXr1wumo3am
	 mO/474VtBpldQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0C334F4006A;
	Fri, 13 Feb 2026 12:44:20 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 13 Feb 2026 12:44:20 -0500
X-ME-Sender: <xms:82KPackIExudVHz6pkLUWeYWNLJR1NNYzarjIn94YFbKy3CCFSKnKA>
    <xme:82KPaXwSkFH1lToFfOT1YwX4vG8RmZLwXZgFQLtOV5qPbNcfzoN9VHqnoIoAdmAjM
    lEGehJoOyo6vYlNZYEhkZNN54603o-X8Ur2FiMiyX7tSith5xb4UQ>
X-ME-Received: <xmr:82KPaQzjJICnlZsLQAQ0_vn17zC2k_dmfowuc7Y9r4nywClm36bQuCPFaORxvGc3fLgJdSw90uknnmKkxpM_JVdmZMMhmR1D>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdekkeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopedukedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprgdr
    hhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhh
    hlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehlohhrvghniihordhsthhorghkvghs
    sehorhgrtghlvgdrtghomhdprhgtphhtthhopehlihgrmhdrhhhofihlvghtthesohhrrg
    gtlhgvrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrh
    ihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohht
    ohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:82KPae9MZ40FRtc5HKBI4BT7ebR80YEUDyuMucTplEURhImS28IabQ>
    <xmx:82KPaY8uLj_G-SSHzudcdbz1c5U_gMBzmoX0l6ffQzc8Oz9touUFSQ>
    <xmx:82KPaZfoeu8g5YrXZubihdOaFBha1l_j8Wt9tjWlfiu4cw1Vtaj4mQ>
    <xmx:82KPacvRHwxQ-44xaDEJrYl1YYqGtq5MExIHpwHL3-A-WIy0vqz_Vg>
    <xmx:9GKPaa1MR5PAaeY8OxIzmLE8aGXsB3BGGBNaIHOs-nplD-R80MPL7pp0>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Feb 2026 12:44:19 -0500 (EST)
Date: Fri, 13 Feb 2026 09:44:18 -0800
From: Boqun Feng <boqun@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
Message-ID: <aY9i8rbvnxdOA9DV@tardis.local>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>

On Fri, Feb 13, 2026 at 07:42:53AM +0100, Andreas Hindborg wrote:
[...]
> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> index 4aebeacb961a2..8ab20126a88cf 100644
> --- a/rust/kernel/sync/atomic.rs
> +++ b/rust/kernel/sync/atomic.rs
> @@ -560,3 +560,35 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
>          unsafe { from_repr(ret) }
>      }
>  }
> +
> +/// Copy `len` bytes from `src` to `dst` using byte-wise atomic operations.
> +///

Given Greg and Peter's feedback, I think it's better to call out why we
need `atomic_per_byte_memcpy()` and why we use bindings::memcpy() to
implement it. How about a paragraph as follow:

/// This is the concurrent-safe version of `core::ptr::copy()` (the
/// counterpart of standard C's `memcpy()`). Because of the atomicity at
/// byte level, when racing with another concurrent atomic access (or
/// a normal read races with an atomic read) or an external access (from
/// DMA or userspace), the behavior of this function is defined:
/// copying memory at the (at least) byte granularity.
///
/// Implementation note: it's currently implemented by kernel's
/// `memcpy()`, because kernel's `memcpy()` is implemented in a way that
/// byte-wise atomic memory load/store instructions are used.

And probably we make it a separate patch for this
atomic_per_byte_memcpy().

Thoughts?

Regards,
Boqun

> +/// This copy operation is volatile.
> +///
> +/// # Safety
> +///
> +/// Callers must ensure that:
> +///
> +/// - `src` is valid for reads for `len` bytes for the duration of the call.
> +/// - `dst` is valid for writes for `len` bytes for the duration of the call.
> +/// - For the duration of the call, other accesses to the areas described by `src`, `dst` and `len`,
> +///   must not cause data races (defined by [`LKMM`]) against atomic operations executed by this
> +///   function. Note that if all other accesses are atomic, then this safety requirement is
> +///   trivially fulfilled.
> +///
> +/// [`LKMM`]: srctree/tools/memory-model
> +pub unsafe fn atomic_per_byte_memcpy(src: *const u8, dst: *mut u8, len: usize) {
> +    // SAFETY: By the safety requirements of this function, the following operation will not:
> +    //  - Trap.
> +    //  - Invalidate any reference invariants.
> +    //  - Race with any operation by the Rust AM, as `bindings::memcpy` is a byte-wise atomic
> +    //    operation and all operations by the Rust AM to the involved memory areas use byte-wise
> +    //    atomic semantics.
> +    unsafe {
> +        bindings::memcpy(
> +            dst.cast::<kernel::ffi::c_void>(),
> +            src.cast::<kernel::ffi::c_void>(),
> +            len,
> +        )
> +    };
> +}
> 
> ---
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> change-id: 20260130-page-volatile-io-05ff595507d3
> 
> Best regards,
> -- 
> Andreas Hindborg <a.hindborg@kernel.org>
> 
> 
