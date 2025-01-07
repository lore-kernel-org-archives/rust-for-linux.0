Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEA1273F9;
	Tue,  7 Jan 2025 23:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736293154; cv=none; b=RqqhKSmpdZmGxhvy9ja53iLmXw3nqBTU2oKafamW2b7S3WkZNFcXdkVhU0D2RqaWNn/m9nceRLTM2tcsEK3wvro1jjtJr1OHgDy9bxLacvVHRUFbCw5gIkWpKzEQde85Qp2JbK/xrwmoqS+BKAnlXJEAIjqXyV1WLMcQ8cvYIRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736293154; c=relaxed/simple;
	bh=5wilqBC7uVaWFwuW3Tiwq1gDtzvf9rebTYq6iGUHz6Q=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dze0V9OvOm2cNCj5RyVhZqRvw5DZj8qY0BmZv3k74OkhRIRujTPf9G+zBc4LLeau4XBxp4qtPmBXHiyh0y8m0JixMqSLbFWYJ5jbqsI9ShpqN9mgM+ae1oEl9oXVs9hQJVe4W552C9zn2PKSmrzIfFDwZZ0hoqcQAIa05WaBwFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZdo1Y+Y; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZdo1Y+Y"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21a7ed0155cso18752815ad.3;
        Tue, 07 Jan 2025 15:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736293152; x=1736897952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nRG2Q26lwxOG4ZhPhifd7QSAEVOV9ie22DwNBCukzpA=;
        b=hZdo1Y+YUmpWVzTQuunaWQI4WA5QVn9TjNSPgaS7diwkJv9TgdpI8wQ3OE/Nkgu6vO
         pxxJzw/ybxRg7aUkq4Y2V07cznq2r8hJBKvgQDQkBLxh4F+0I2YcaMaZva3PKoc0c5f5
         zw4KXlFlk0xMzKF3XaBCEGAWIT/T/RGiRXw70i0Wgipu6CPjGk/poHQ3theYBO87gm1e
         fOlbUEwVl0A67qGrPAYWPyJKz6OLjd8tWC7+UcRAJmIXp++JhoLTQbGp9r3w1p1s5Ohr
         VPKRkeRl75ZRVPOuZYqv2d2k1Hfj06qaOgmhZRmCsM66OAkTZba46MJQ1iS3gMahPDD6
         ezKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736293152; x=1736897952;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRG2Q26lwxOG4ZhPhifd7QSAEVOV9ie22DwNBCukzpA=;
        b=RQ7XDOxrk6Mj6+F12HbOmFQNLtSFzwQi6n7K11/VzOIf/IVMd6bCGLodKIihii2LQF
         oMFuADIxZjxOcZoNHKRlEyyPYvYCdhDIbknUvY7fGwkf44jrWKe11jdwmAIRzawudV++
         F/XFXfmmVlZZxc1GTUWffTcFToLvgJug2leU6x+ZaWBQlpFVehbE3+ExqmXfcTHznIir
         eD9Kv5XdoLfsIb9FnBKGuFySwcVm7RKqzWGD+q+U/Kn+/JYVOM2JP2fdAnu29yvbinLR
         ibOz828HdPIOjYpEqIoO4KZIAVUxOBGart+JREegI7vESeFcWSSvnAXLNQrRWKr6pHtg
         o4mA==
X-Forwarded-Encrypted: i=1; AJvYcCVunW+vqDaO8sv4hiuCMSq9P2Gce/ZY6po3omyNeupkYNsytEOROzdPFvadVhtX6ImG2JQZZEfPr/sMsUVCKuM=@vger.kernel.org, AJvYcCXd4ThJ53B87gs4LORFMHT6tx6NqLQRwhd2vKd4XYqiCPzydK1XoD7VcPi8gYStzzESAdWWFYDfFpjO6Hs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzri5CfwVazdwKUKvQBBmsBfzgvOiECszApj1XU0Mn10bAGrB5m
	PE9ZtOOKfYyRaGyIyO/6lF0mAjcs8RHFsd1XmbznrSREE+e8U5Me
X-Gm-Gg: ASbGnctEEfJPfJxqPC17WNXUIQu0TRlrEUbQpx/0Lf43qsPUM53CKIke0UuLEmmnIUz
	LtPv/oHhtfjfpXT8Z3b4QyM5HGqIK6POt0raGIPPHu5XmlSJR+CNMp7dHCUO7mAVVQkz2mPCIac
	5XKuLyCpiyV6Amj4OLQXace5narC+iPny66Msnq9ZZOqYBDWtYNdAYehqlAqyyLUN7RoiQHpKoM
	f/Dyxg15+CkljfobvMsBHbVOnkqCptrSAgKUWqP8ZJ4zhalnI9QLMJP42IeGgBiZl1HqfiTPYj+
	0QBFYow5xEo=
X-Google-Smtp-Source: AGHT+IEFKWH9blqwhs5UIzeKV2UjiBvuwYrNIKw3yW57Smk9dySUEDMO2gKtAXjXY7kl90vWv3tYTQ==
X-Received: by 2002:a05:6a20:6a0a:b0:1e0:d380:fe71 with SMTP id adf61e73a8af0-1e88cf079f0mr1780991637.0.1736293152195;
        Tue, 07 Jan 2025 15:39:12 -0800 (PST)
Received: from Cyndaquil. (71.sub-174-227-40.myvzw.com. [174.227.40.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c18fsm35371336b3a.184.2025.01.07.15.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 15:39:11 -0800 (PST)
Message-ID: <677dbb1f.050a0220.14d4ee.e7df@mx.google.com>
X-Google-Original-Message-ID: <Z327G683Qn0F7qH7@Cyndaquil.>
Date: Tue, 7 Jan 2025 15:39:07 -0800
From: Mitchell Levy <levymitchell0@gmail.com>
To: Dennis Zhou <dennis@kernel.org>
Cc: Hudson Ayres <hudayers@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
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
References: <20241219-rust-percpu-v1-0-209117e822b1@gmail.com>
 <Z3m6Fx0-I59NfmUX@snowbird>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3m6Fx0-I59NfmUX@snowbird>

On Sat, Jan 04, 2025 at 02:45:43PM -0800, Dennis Zhou wrote:
> Hello,
> 
> On Thu, Dec 19, 2024 at 01:08:25PM -0800, Mitchell Levy wrote:
> > This series adds an API for declaring an using per-CPU variables from
> > Rust, and it also adds support for Rust access to C per-CPU variables
> > (subject to some soundness requirements). It also adds a small test
> > module, lib/percpu_test_rust.rs, in the vein of lib/percpu_test.c.
> > 
> > ---
> > I am sending this patch as an RFC to gather feedback on the API as well
> > as get some input on correctness. In particular, the unsafe getter macro
> > is somewhat cumbersome, though its safety requirements for pure-Rust
> > code aren't too difficult to verify (interoperation with C code is
> > certainly much more tricky).
> > 
> 
> I've been thinking a little bit about this over the holidays and fwiw am
> not really the right person to evaluate the rust side of this. I did
> briefly discuss this with Hudson (cced) who is more familiar with rust.
> 
> In addition to Christoph's comments:
>  1. This implementation seems targeted at static allocations and the
>     safety of this api relies on the end user doing the right thing.
> 
>     There are many percpu variables created dynamically via
>     alloc_percpu() and the lifetime of those variables are tied to a
>     larger object. So access to those variables is safe via the
>     understanding the larger object exists. I feel like there is room
>     here for rust to do this checking somehow? Maybe in rust-only percpu
>     variables, but something better nonetheless.

You're correct; my hope is that adding dynamic allocations on top of
this API should be straightforward. Because we don't have to worry
about aliasing concerns (since we're in control of the memory that gets
set aside), we can just directly spit out a PerCpuRef. The one wrinkle
would be adding a lifetime parameter to PerCpuRef and making everything
line up.

>  2. As Christoph mentioned, the percpu api relies heavily on macros for
>     architecture specific optimizations. Your implementation seems
>     asm-generic correct, but we should find a way to export the
>     architecture specific percpu macros.
> 
>     `this_cpu_off` is a percpu variable that helps x86 `arch_raw_cpu_ptr()`.

Definitely! I'm hoping to add some operator overloading to make using
the optimized operations really smooth. I didn't want to bite off too
much for this RFC, though.

>  3. Maybe a good use case to start off with would be percpu_refcount and
>     how rust can use it or how it can make something like that safer?

This looks like a great idea, thank you!

> Some of Hudson's direct comments about the Rust implementation:
>  1. DerefMut for PerCpuRef is ultimately constructing a reference from a
>     raw integer without preserving the provenance of the original
>     pointer in any way (since this integer is being constructed from raw
>     register reads). I believe this violates Rust's pointer provenance
>     rules for unsafe code.

Caveat: I'm not super familiar with Rust's provenance model.

My understanding is that there are no "provenance issues" in a loose
sense. What I mean by this is that, if everything is treated as the
pointer it "should be" the process looks like:

per-cpu subsystem owns per-cpu area -> pointer is stored in
this_cpu_area -> we create a new pointer (via an in-bounds offset +
shrinking to sizeof(T)) to the contents of the per-cpu variable in
question

It looks like asm! actually supports reading into pointer types (I had
misread the table in the Rust Reference, and thought it only supported
reading into integer types) --- this might help avoid discarding
provenance during a cast to usize? I'm definitely interested in hearing more
on this point.

>  2. The safety requirements of unsafe_get_per_cpu_ref seem like they
>     would often not be possible to verify at the callsite of the macro
>     without global knowledge -- especially for percpu variables defined
>     in C code. Is this a misunderstanding? Can you show an example of
>     where it would be straightforward to build a higher-level safe API
>     on top of this unsafe one?

Yeah interoperation with C per-cpu variables is certainly very
difficult. Unfortunately, I think this problem crops up any time you're
sharing a piece of memory between Rust and C since the existence of &T
that points at some piece of memory is a guarantee to the compiler that
the pointed-to memory will not change. This facility is intended more as
a trap-door for when there's no better option than as an API building
block.

> > It was suggested that I base my implementation on Rust's thread-local
> > storage API. However, this API requires that for a thread-local T, any
> > particular usage must be via a &T. Thus, many times it is required that
> > thread-local variables be in the form RefCell<T> or Cell<T>. This has
> > some pretty severe disadvantages in the context of per-CPU variables.
> > Namely, RefCell<T> may panic if .borrow_mut is called multiple times at
> > different points in the call stack. This is similar to the problem
> > inherent in my current implementation (that is, unsafe_get_per_cpu_ref
> > must be used carefully so as to not create aliasing mut references), but
> > this implementation flags this potential problem via an unsafe block and
> > the resulting PerCpuRef can be easily passed along and used fairly
> > easily. Cell<T> on the other hand requires a copy any time the
> > underlying value is used, which is entirely avoided here.
> > 
> > Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> > 
> 
> I think this is a cool topic and has helped inspire me to learn a bit
> more rust. Hopefully I can be more helpful in the future.

I appreciate it; thanks to you and Hudson for your help!

> Thanks,
> Dennis
