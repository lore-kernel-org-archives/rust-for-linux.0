Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BEC3D5223
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 13:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770212914; cv=none; b=WTdYwCwvhyH7eQNcrSw35IabgUSMI7B2Bwjcw3VsxnnoFHl1tcGDUSBqBpJm8rPbFOPDM7GjczkD62SJ6zSXN390m4NDPhhL7LRlq4nNFBGHYzUMvFgLzGkUNN8qHv41SHcQTXB6uVkszzlbrddDUiKPJQN9cNe5SBx477lomjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770212914; c=relaxed/simple;
	bh=J5nNhiFY4S1OVMzB0NVBJ277MRBMNG/7x8rYwIUvk34=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t76wrR2shcQM5c0kZb5HQP/E+t2cP86A5ASxh49q2sPkXHRHymW2KsGB8vPep7X+2//FXOYNuwlqPUK5D/oIMxsNRqWNY7tDxVnYGeG0Jlmq0UFBGxaJ+XCUmtbzzi9rG3CNkiTsn/f7RC9IgoQQkEHTh9Yo3sE27psRk1VaDuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4oIO2jnc; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4oIO2jnc"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47edf8ba319so74058385e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 05:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770212912; x=1770817712; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LQOU9fiGU/IdG2FA/ukwr6QBBLgngyP+vP4uJb+th2I=;
        b=4oIO2jncxuLSG/d5KD7CjwLim7kgL08zT60KcAHtR6TaoZM8omcsn6dTRKLCvLQKxm
         nZjSooJq5wQ2wylXwQ6GzMRDDLMOX9oNN7D0G+kysH9O5wDycP8OGxFULQ5ApzjzI3n8
         iLLvYu7BUg7PlP44RGAos3heY9ILT2AZRxKpenzAerWJMZu52FrHCHBLFIF6CQQSHRR/
         ujN3lLMVqnMqKklKbPJlmAYYjWr8MtTUqAi/R5A19Vat3i7bdqr/9Nw3Of7ooB3bXWeq
         xJM/SBN59WSyVE0gmsCxksiZcoaN+xHdtCHxvJISZooM3M558KO4IZph0YcSr3MsP91b
         dpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770212912; x=1770817712;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQOU9fiGU/IdG2FA/ukwr6QBBLgngyP+vP4uJb+th2I=;
        b=uhqHzkvNDnUSBqMDcg5VHevo0oHNqwGm7luHD+RsJ/dIJM9rwrsmDvR5JOQACOXX7p
         On01Dp5AYIFCRnYLBhgE+ppgboA3NKYNjRwv8LXW99WbWefLjP8UBI2CTB3zGzUv6Shl
         oFBj5fjGDnmh7iXB4qvf8Z1C31RtfU9yLwPRhe6EaLWX5xjHvItgSDJwluT8CSrt5w1D
         k9bOcSxTBgbNkBnqnXXPrZ/UDVBk6JjtoihjemAEulF4mMtVZeYgIDi8fchDHnIZFwkt
         yfvAkFDxvkGCSwANPWw+dYpLmSKSPumPf8g5VQAJURUUwPZV64uWhJKPLxEYL3lZ+qVN
         Fc+w==
X-Forwarded-Encrypted: i=1; AJvYcCVeeSp+APxWYm4t78WNbwjsXiOEn+po3o6U3kYLfCsUOERQpDy53yvmwb5NXUavQLMdS3ZAun0a3WgErFkGKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWwG8FXCOO6lcosS7cg0RedUaKG+5YEE8k+gS24uA0MIf7rSjp
	ZLupvGewK4OJVPUqFWOBx+S3pKY+QO4OJJdgJceYclH7/oaAoSG/T2qs1s8hvyYfwig0Cgw67bD
	M6iuN+057Z1njHAzdCA==
X-Received: from wmdq4.prod.google.com ([2002:a05:600c:304:b0:47a:9289:c5d8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5250:b0:480:3bba:1ca9 with SMTP id 5b1f17b1804b1-4830e922965mr37422955e9.4.1770212912043;
 Wed, 04 Feb 2026 05:48:32 -0800 (PST)
Date: Wed, 4 Feb 2026 13:48:30 +0000
In-Reply-To: <87ldh8ps22.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aX0lcVngRcRwqgd5@tardis.local> <SEV7bR_nyQNtvtgoO8X80HMkMTPLW_6roBSxJ-MpKHHNmkZQyVxSS9k1iFV7-bgAlHSLM566L8EqtRBnht65uA==@protonmail.internalid>
 <aX2tyn9nBUEKM-SN@tardis.local> <87ms1trjn9.fsf@t14s.mail-host-address-is-not-set>
 <gKLHFGuJqzRyjCupif-LFYn2ZY6OmhkyYj6idYTOnN4zMmNacFLBD1G9zzsYpTJn13GGvL0i-7JA-lIlBgakgQ==@protonmail.internalid>
 <DG2WLWJD8V5W.2I24LZKS6JG6Q@garyguo.net> <87bji9r0cp.fsf@t14s.mail-host-address-is-not-set>
 <878qddqxjy.fsf@t14s.mail-host-address-is-not-set> <aYFKbWfQmTInYy91@tardis.local>
 <87ldh8ps22.fsf@t14s.mail-host-address-is-not-set>
Message-ID: <aYNOLt_kj6buuhH9@google.com>
Subject: Re: [PATCH] rust: page: add volatile memory copy methods
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Feb 04, 2026 at 02:16:37PM +0100, Andreas Hindborg wrote:
> Boqun Feng <boqun@kernel.org> writes:
> 
> > On Sat, Jan 31, 2026 at 10:31:13PM +0100, Andreas Hindborg wrote:
> > [...]
> >> >>>>
> >> >>>> For __user memory, because kernel is only given a userspace address, and
> >> >>>> userspace can lie or unmap the address while kernel accessing it,
> >> >>>> copy_{from,to}_user() is needed to handle page faults.
> >> >>>
> >> >>> Just to clarify, for my use case, the page is already mapped to kernel
> >> >>> space, and it is guaranteed to be mapped for the duration of the call
> >> >>> where I do the copy. Also, it _may_ be a user page, but it might not
> >> >>> always be the case.
> >> >>
> >> >> In that case you should also assume there might be other kernel-space users.
> >> >> Byte-wise atomic memcpy would be best tool.
> >> >
> >> > Other concurrent kernel readers/writers would be a kernel bug in my use
> >> > case. We could add this to the safety requirements.
> >> >
> >> 
> >> Actually, one case just crossed my mind. I think nothing will prevent a
> >> user space process from concurrently submitting multiple reads to the
> >> same user page. It would not make sense, but it can be done.
> >> 
> >> If the reads are issued to different null block devices, the null block
> >> driver might concurrently write the user page when servicing each IO
> >> request concurrently.
> >> 
> >> The same situation would happen in real block device drivers, except the
> >> writes would be done by dma engines rather than kernel threads.
> >> 
> >
> > Then we better use byte-wise atomic memcpy, and I think for all the
> > architectures that Linux kernel support, memcpy() is in fact byte-wise
> > atomic if it's volatile. Because down the actual instructions, either a
> > byte-size read/write is used, or a larger-size read/write is used but
> > they are guaranteed to be byte-wise atomic even for unaligned read or
> > write. So "volatile memcpy" and "volatile byte-wise atomic memcpy" have
> > the same implementation.
> >
> > (The C++ paper [1] also says: "In fact, we expect that existing assembly
> > memcpy implementations will suffice when suffixed with the required
> > fence.")
> >
> > So to make thing move forward, do you mind to introduce a
> > `atomic_per_byte_memcpy()` in rust::sync::atomic based on
> > bindings::memcpy(), and cc linux-arch and all the archs that support
> > Rust for some confirmation? Thanks!
> 
> There is a few things I do not fully understand:
> 
>  - Does the operation need to be both atomic and volatile, or is atomic enough on its
>    own (why)?
>  - The article you reference has separate `atomic_load_per_byte_memcpy`
>    and `atomic_store_per_byte_memcpy` that allows inserting an acquire
>    fence before the load and a release fence after the store. Do we not
>    need that?

We can just make both src and dst into per-byte atomics. We don't really
lose anything from it. Technically we're performing unnecessary atomic
ops on one side, but who cares?

>  - It is unclear to me how to formulate the safety requirements for
>    `atomic_per_byte_memcpy`. In this series, one end of the operation is
>    the potential racy area. For `atomic_per_byte_memcpy` it could be
>    either end (or both?). Do we even mention an area being "outside the
>    Rust AM"?
> 
> First attempt below. I am quite uncertain about this. I feel like we
> have two things going on: Potential races with other kernel threads,
> which we solve by saying all accesses are byte-wise atomic, and reaces
> with user space processes, which we solve with volatile semantics?
> 
> Should the functin name be `volatile_atomic_per_byte_memcpy`?
> 
> /// Copy `len` bytes from `src` to `dst` using byte-wise atomic operations.
> ///
> /// This copy operation is volatile.
> ///
> /// # Safety
> ///
> /// Callers must ensure that:
> ///
> /// * The source memory region is readable and reading from the region will not trap.
> /// * The destination memory region is writable and writing to the region will not trap.

Ok.

> /// * No references exist to the source or destination regions.

You can omit this requirement. Creating references have safety
requirements, and if such references exist, you're also violating the
safety requirements of creating a reference, so you do not need to
repeat it here.

> /// * If the source or destination region is within the Rust AM, any concurrent reads or writes to
> ///   source or destination memory regions by the Rust AM must use byte-wise atomic operations.

Unless you need to support memory outside the Rust AM, we can drop this.

Alice
