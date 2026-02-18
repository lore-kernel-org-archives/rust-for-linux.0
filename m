Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE053126A1
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771407611; cv=none; b=HPHkq04WgqTsJwAqxb3PwefE1hYzcm4FvwkgIYnppE/FcDtE/ODh0GTarud9fZowrQMfk0L8otQoBD4dF7DBJ/NY5k3Juc+FatqOJHE19DIaCboDF2pHYN34m8EuVewWNLISf4jk33SPUGgSdtOCXbo8qIM4WGQb0G8ctiKI4TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771407611; c=relaxed/simple;
	bh=xDMC0hVVm2NNH6STxgzemy2o3/+UeAEh8X9k1CBm1n0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qnrqPMh8Il6tBZp99natnbEuSmR61mVIsVxdHI6998+74KmpID3FGZUPl1KVYtoCiIrHHmoVEgASsrbSz8qnty+kNAc+QEyp5J70n1sMiCLDuDWLaEYz25Cs6AWml8qqmK/yQWBnfZoHs0LTVLcdISoX6pDNHwc9vASdZWsPCfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ty/XDGI5; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ty/XDGI5"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4362456500eso4892285f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 01:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771407608; x=1772012408; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+qgmQYzq/LwIvRAllD7t9G5Xcp/7gpl+R9gFqsKAeyw=;
        b=ty/XDGI5sf8ooG3BgE7md8dQXJ28xefPwGRLv/2FjUv+RtdYUDdQ9t8P/dmsk6v5Fe
         be2K2ezwSKBLmE7/BsP5IfuhpKyUi+7V2ofyYMFWtU+5clo8NA9I5JuZB1+Hs93o/yHW
         dmzlwlDnkXPlWaqqmUYFhSi/WQz/bJ7cK4+f6QQGAzNuOvj+BFjc85lYV6eJ6/VW73Nl
         sBAbWESdMcbd762A3zfCHce0GAKl8GkUQvcEu/dwHQLRUSrTnL5BCioIi7L/WeljKBUA
         diBc4FgbO6V/jqJ4+iO5fAgGAxRtKf351wZ7YOW7Omb97svjObB7EoufhdUZDW6hxTSp
         LNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771407608; x=1772012408;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+qgmQYzq/LwIvRAllD7t9G5Xcp/7gpl+R9gFqsKAeyw=;
        b=OX5NC5OkNcEEpJPCo8kc89/AfWkshPIsCkAitIU3jPum9BKLEDRdcBJOljiCff2P7/
         ZQOtgBrcihyB5y37/loJnvlPgcrzwg7H1v+4+YY+n+xpLKaKzcnA46lJWhBRv56Hu3GV
         Lo6wU39DyypVyJG6DPlEPXojmpEdtOKzET8ALMOLxU05qPW6FbnGxrthSHoJE6S97bg9
         JPzpq1kplqehXMscJOC+xahumr5WDfSQJt5T5HEYTnjMn7Qu416lsPg5Vm7UVWRS5BFc
         +1v1Zy9x9D3O5igIEVHu2bSX+edijWWzjh6YdQtBnSMVdR7gOUaJcrbxMj43SN0Q5aOo
         Tprg==
X-Forwarded-Encrypted: i=1; AJvYcCX6k7GMXcaDlYT1V7jfk2G8utQMegPoESvFbIM/8ilRN1Os231009ppiJcnrh0nRY/88itRx7mQ5GGFt3uUaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv40pz7FX6SQfP6m5y7abph6tha1EdAAOgVBmFSyKltfUwKGqH
	LUKVLAb/Ki1YGW6YDgMJe5ENUTQ3G4og0gCrurqQPcaDPJx1M2P88bsie7cGfIMnaYJ5PoGQ8m9
	WRXrmUn0VYWq7OGHagQ==
X-Received: from wrbdr6.prod.google.com ([2002:a5d:5f86:0:b0:437:6ebe:6e58])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2dca:b0:437:6e63:9172 with SMTP id ffacd0b85a97d-43958df3516mr2229518f8f.4.1771407607843;
 Wed, 18 Feb 2026 01:40:07 -0800 (PST)
Date: Wed, 18 Feb 2026 09:40:07 +0000
In-Reply-To: <67aea464d25c8cafb3113eea62c8221b@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <aZRY9HthKwVJrAf1@google.com> <67aea464d25c8cafb3113eea62c8221b@garyguo.net>
Message-ID: <aZWI9zGIO6rtlCCg@google.com>
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 17, 2026 at 11:10:15PM +0000, Gary Guo wrote:
> On 2026-02-17 12:03, Alice Ryhl wrote:
> > On Fri, Feb 13, 2026 at 07:42:53AM +0100, Andreas Hindborg wrote:
> > > When copying data from buffers that are mapped to user space, it is
> > > impossible to guarantee absence of concurrent memory operations on
> > > those
> > > buffers. Copying data to/from `Page` from/to these buffers would be
> > > undefined behavior if no special considerations are made.
> > > 
> > > Add methods on `Page` to read and write the contents using byte-wise
> > > atomic
> > > operations.
> > > 
> > > Also improve clarity by specifying additional requirements on
> > > `read_raw`/`write_raw` methods regarding concurrent operations on
> > > involved
> > > buffers.
> > > 
> > > Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> > 
> > > +/// Copy `len` bytes from `src` to `dst` using byte-wise atomic
> > > operations.
> > > +///
> > > +/// This copy operation is volatile.
> > > +///
> > > +/// # Safety
> > > +///
> > > +/// Callers must ensure that:
> > > +///
> > > +/// - `src` is valid for reads for `len` bytes for the duration of
> > > the call.
> > > +/// - `dst` is valid for writes for `len` bytes for the duration of
> > > the call.
> > > +/// - For the duration of the call, other accesses to the areas
> > > described by `src`, `dst` and `len`,
> > > +///   must not cause data races (defined by [`LKMM`]) against
> > > atomic operations executed by this
> > > +///   function. Note that if all other accesses are atomic, then
> > > this safety requirement is
> > > +///   trivially fulfilled.
> > > +///
> > > +/// [`LKMM`]: srctree/tools/memory-model
> > > +pub unsafe fn atomic_per_byte_memcpy(src: *const u8, dst: *mut u8,
> > > len: usize) {
> > > +    // SAFETY: By the safety requirements of this function, the
> > > following operation will not:
> > > +    //  - Trap.
> > > +    //  - Invalidate any reference invariants.
> > > +    //  - Race with any operation by the Rust AM, as
> > > `bindings::memcpy` is a byte-wise atomic
> > > +    //    operation and all operations by the Rust AM to the
> > > involved memory areas use byte-wise
> > > +    //    atomic semantics.
> > > +    unsafe {
> > > +        bindings::memcpy(
> > > +            dst.cast::<kernel::ffi::c_void>(),
> > > +            src.cast::<kernel::ffi::c_void>(),
> > > +            len,
> > 
> > Are we sure that LLVM will not say "memcpy is a special function name, I
> > know what it means" and optimize this like a non-atomic memcpy?
> 
> This "treating special symbol name as intrinsics" logic is done in Clang,
> and won't be performed once lower to LLVM IR, so Rust is immune to that
> (even
> when LTO'ed together with Clang generated IR). So calling to bindings is
> fine.

Ok, that's good! Then I'm less concerned.

Though I guess it means that even if it's known to be e.g. an 8-byte
aligned memcpy of length 8, then it still can't optimize it to e.g. a
movq instruction.

> > I think we should consider using the
> > 
> > 	std::intrinsics::volatile_copy_nonoverlapping_memory
> > 
> > intrinsic until Rust stabilizes a built-in atomic per-byte memcpy. Yes I
> > know the intrinsic is unstable, but we should at least ask the Rust
> > folks about it. They are plausibly ok with this particular usage.
> 
> If we have this in stable, I think it's sufficient for LKMM. However for
> Rust/C11 MM
> says that volatile ops are not atomic and use them for concurrency is UB.

I'm well aware of that! Yet, Rust currently provides no alternative
whatsoever, even on nightly, and has already told us in other situations
they're ok with Linux using volatile for this purpose in limited
situations. That is why I suggest doing this temporarily, and after
asking the rustc compiler folks about it.

> I recall in last Rust all hands the vibe at discussion is that it's
> desirable to define
> volatile as being byte-wise atomic, so if that actually happens, this would
> indeed be
> what we want (but I think semantics w.r.t. mixed-size atomics need to be
> figured out first).

Yes, that's right.

Alice
