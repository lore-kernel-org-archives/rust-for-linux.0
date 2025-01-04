Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8681D5CCD;
	Sat,  4 Jan 2025 22:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736030746; cv=none; b=j2rVT3xakHP2nazwU3TVokcA2Dn5ZF5pQfv8ieZm40SJFWowKpFS34orIIrKLrnrunU4kphPWM38OyQABJjdV5mswkhHTGNQ2H4gs3eDt3+7ch5Weg/BeWemHXNgCSCk5Y9L4vNmxT0kB7N5NVXm+nU1F6rS7BuMe5ZhuCqDP1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736030746; c=relaxed/simple;
	bh=qcikyWA15fK9jdBCh80Yq9BvRwwiqyehSTsW3NvssKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9Pk2KIOEv9XVEE5mOcvhLif0vrK9b6coTXC49QONB6uK+c6fDRrupb7KkMCMqTJWxiAQfDDdwDRwoqxYgigQwqIJJZ3uc063+v7wSOIy1KFBms8B4IRkpOm4H++J2Gm0SZRAgVpM88UxmMIZilbg8vIqwC8qaFBqyUKfV7CozE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/WI3oWD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/WI3oWD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D5EC4CED1;
	Sat,  4 Jan 2025 22:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736030745;
	bh=qcikyWA15fK9jdBCh80Yq9BvRwwiqyehSTsW3NvssKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L/WI3oWDvpZWLEyBQbkoPBDqcHATTTQ86J0pcl3eVqlKXhL/hL6KMSkFBOn2YK7PF
	 muZW+Y1GYRcERr64WCHmQw8lhvsY15hqmv7XkltCGItWViZ37FIINN8tcmxAPPrfzK
	 GVl+y8XQGBaSz5uPQsUgWXoNKm75JsM3nM7srphHXu1Mt6u3GeLiKyZQo2RrB57cmp
	 HY8vKx6gN4M9Lc1owUnEFMX8jxh1diK49R06AbEvrW7nvP0uAJMncXkIFC8qEp33q4
	 Gecdqw+GfP2me5KZmosG2WxqtdjeD7st6KFm+4DBJ9LXXciYB4mQuPPr9FEz6UIQ/I
	 lDSzHVqvRnyrA==
Date: Sat, 4 Jan 2025 14:45:43 -0800
From: Dennis Zhou <dennis@kernel.org>
To: Mitchell Levy <levymitchell0@gmail.com>,
	Hudson Ayres <hudayers@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH RFC 0/3] rust: Add Per-CPU Variable API
Message-ID: <Z3m6Fx0-I59NfmUX@snowbird>
References: <20241219-rust-percpu-v1-0-209117e822b1@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-rust-percpu-v1-0-209117e822b1@gmail.com>

Hello,

On Thu, Dec 19, 2024 at 01:08:25PM -0800, Mitchell Levy wrote:
> This series adds an API for declaring an using per-CPU variables from
> Rust, and it also adds support for Rust access to C per-CPU variables
> (subject to some soundness requirements). It also adds a small test
> module, lib/percpu_test_rust.rs, in the vein of lib/percpu_test.c.
> 
> ---
> I am sending this patch as an RFC to gather feedback on the API as well
> as get some input on correctness. In particular, the unsafe getter macro
> is somewhat cumbersome, though its safety requirements for pure-Rust
> code aren't too difficult to verify (interoperation with C code is
> certainly much more tricky).
> 

I've been thinking a little bit about this over the holidays and fwiw am
not really the right person to evaluate the rust side of this. I did
briefly discuss this with Hudson (cced) who is more familiar with rust.

In addition to Christoph's comments:
 1. This implementation seems targeted at static allocations and the
    safety of this api relies on the end user doing the right thing.

    There are many percpu variables created dynamically via
    alloc_percpu() and the lifetime of those variables are tied to a
    larger object. So access to those variables is safe via the
    understanding the larger object exists. I feel like there is room
    here for rust to do this checking somehow? Maybe in rust-only percpu
    variables, but something better nonetheless.

 2. As Christoph mentioned, the percpu api relies heavily on macros for
    architecture specific optimizations. Your implementation seems
    asm-generic correct, but we should find a way to export the
    architecture specific percpu macros.

    `this_cpu_off` is a percpu variable that helps x86 `arch_raw_cpu_ptr()`.

 3. Maybe a good use case to start off with would be percpu_refcount and
    how rust can use it or how it can make something like that safer?

Some of Hudson's direct comments about the Rust implementation:
 1. DerefMut for PerCpuRef is ultimately constructing a reference from a
    raw integer without preserving the provenance of the original
    pointer in any way (since this integer is being constructed from raw
    register reads). I believe this violates Rust's pointer provenance
    rules for unsafe code.

 2. The safety requirements of unsafe_get_per_cpu_ref seem like they
    would often not be possible to verify at the callsite of the macro
    without global knowledge -- especially for percpu variables defined
    in C code. Is this a misunderstanding? Can you show an example of
    where it would be straightforward to build a higher-level safe API
    on top of this unsafe one?

> It was suggested that I base my implementation on Rust's thread-local
> storage API. However, this API requires that for a thread-local T, any
> particular usage must be via a &T. Thus, many times it is required that
> thread-local variables be in the form RefCell<T> or Cell<T>. This has
> some pretty severe disadvantages in the context of per-CPU variables.
> Namely, RefCell<T> may panic if .borrow_mut is called multiple times at
> different points in the call stack. This is similar to the problem
> inherent in my current implementation (that is, unsafe_get_per_cpu_ref
> must be used carefully so as to not create aliasing mut references), but
> this implementation flags this potential problem via an unsafe block and
> the resulting PerCpuRef can be easily passed along and used fairly
> easily. Cell<T> on the other hand requires a copy any time the
> underlying value is used, which is entirely avoided here.
> 
> Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> 

I think this is a cool topic and has helped inspire me to learn a bit
more rust. Hopefully I can be more helpful in the future.
 
Thanks,
Dennis
