Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAA232AAD8
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 12:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329784; cv=none; b=Lh45oKJaFseNeDXZRhi9Mf+mTY7lp7MmIoSGUwwZ68efRg7yWAzQAtOAu9NHrhqp0nLRKjrBV4un35ErJ3t9WbWa64EfZZKSUSvmXyiXfl4wSGFrfiUqhkNAnchTII3gVqms4rlZzhQtY54eZB1VIkL3vm/+dR+0Cj09Of5RL7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329784; c=relaxed/simple;
	bh=ogvcM3YVVSnpICEmLK4/rJ6QzsT063cOhBKoejMapyM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MpU+nVz1qLjhES+zXkT3YXKzL5Hq37qP15MpfkFsn0yUHCXdxzj56ZNGMsvkp/EESOpxUnPPig5kkZL4EOml+1uh7Fmo4lvk81STNGL4v+c8AOUsZ495uQJw79wDRji0S76xTobgwiNUZ2VaojNTyboLwubbX/bRbUhQ75s2KpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vx7XCkIQ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vx7XCkIQ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836fbfa35cso25382835e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 04:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771329781; x=1771934581; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cSYPA86nwp+xl2HbEhm6RzJ3nbGdQs2CfGN2qiozLlw=;
        b=Vx7XCkIQVr22njyMt6RLc0CcU9LIwI9VDCOgO+0R0HlVw45H/XXduSUjQDPc5AuRal
         k5fQPDNSSZqQTgF4V6U2WNocdZ4CQrvkEX7bePmDDWP7J9TZ7UP19llm8p/WkX287O9z
         gBp0GkAVs7xZXMS3fnmuBUN6b02XekEtVIN/LKtFTjYx7mHYVuNTOdaK8uNV3actOtSh
         roKwC92go5XAMJ+/KP4vjJ57vctUCLxAKD+mynALMBm5MrVW5jv9Rkkx9MgXN1VyRGKo
         nrD3xFwFOAZEx9h5+zQ0+/D7Ax8+Q9h6eC/FBKRGAVYBwgQdmqmRZ/m/I2vy4su6qcuY
         FuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329781; x=1771934581;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cSYPA86nwp+xl2HbEhm6RzJ3nbGdQs2CfGN2qiozLlw=;
        b=wlL/7oIG69+4oCdB76OPaXAWAYHEm98U2fqmNEO0BpyXFdmQZnrHtRXAH44Xica1R2
         TVeKc6L5B1xgV6xOI0qS8ncqKbUAKswXTmqSlelv8ryyA5Usm2mOLE1RbdQnz49mpRT3
         9lDUvRnu0P/kIPwkxuOpT1B11a6OScliZl3bAShovbWi0Z7XuSpcnHDbnPJHsdBG9Oox
         8VpHOD5IOVe+ZVF9LRFJ17r08egXGyb0je+60yD8OKzBz4g5ANRDNX5EydUp5021h117
         dZqwDBaVdQlm33uxTXUgZ3s2NqYV2ieFWbrjydMODmUP9n74d9xhOkSz4ZO9rfqsrAMo
         oWmg==
X-Forwarded-Encrypted: i=1; AJvYcCU501DTdcCD8G+UPWbrV2gLMdYfq0NDA2o45PO5bxBcnkPXqLVx/iC0sa1Akeowh5zDGvjwuOT39/hiddKDBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl71DeJR2IXqzQKGsjDY709NLDhl2cAG8FsJN8qSnXwjDVG+wk
	e9Nku1fqiKW15FXlqgaK05QsJ3pfZzmh0CMMR2g0nSmqdiyUhOWa50vSicUk1kG0KtCt7z67tNI
	SEiO9pLJ3j9kvS3GkjA==
X-Received: from wmdd14.prod.google.com ([2002:a05:600c:a20e:b0:477:5a4b:d57f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e8e:b0:483:6f82:9719 with SMTP id 5b1f17b1804b1-483739fc775mr180697485e9.2.1771329781211;
 Tue, 17 Feb 2026 04:03:01 -0800 (PST)
Date: Tue, 17 Feb 2026 12:03:00 +0000
In-Reply-To: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
Message-ID: <aZRY9HthKwVJrAf1@google.com>
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 13, 2026 at 07:42:53AM +0100, Andreas Hindborg wrote:
> When copying data from buffers that are mapped to user space, it is
> impossible to guarantee absence of concurrent memory operations on those
> buffers. Copying data to/from `Page` from/to these buffers would be
> undefined behavior if no special considerations are made.
> 
> Add methods on `Page` to read and write the contents using byte-wise atomic
> operations.
> 
> Also improve clarity by specifying additional requirements on
> `read_raw`/`write_raw` methods regarding concurrent operations on involved
> buffers.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

> +/// Copy `len` bytes from `src` to `dst` using byte-wise atomic operations.
> +///
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

Are we sure that LLVM will not say "memcpy is a special function name, I
know what it means" and optimize this like a non-atomic memcpy?

I think we should consider using the

	std::intrinsics::volatile_copy_nonoverlapping_memory

intrinsic until Rust stabilizes a built-in atomic per-byte memcpy. Yes I
know the intrinsic is unstable, but we should at least ask the Rust
folks about it. They are plausibly ok with this particular usage.

Alice
