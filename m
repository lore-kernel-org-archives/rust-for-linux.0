Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590F3338F54
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 12:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763035581; cv=none; b=M/s60HOCUFhDjEvxfqMiw99ZisrGkhu8zmR8GeUHBJoeCwpmski7q2RmgbvDIaSuvKY9PN7ybWPoW39rumMJIsghDKJfFDAzmBbexby0rzf7PE7RZihAtz+jVUk24f1CNnBLz1bx7Bh0n9fmbgTAUsHx63VU00YWkl6YGwbeBYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763035581; c=relaxed/simple;
	bh=IAtW62gURyREpUalfFbzcKDfW6kSFiTM/Y9A/jTHcbc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NFNBcoVcBBH9pr0mXsiWIlqHVmkwEroksY9rxvjPZmyUPpxjnNdkC6DREhDOeilRqsdAKg1FHT5cUvwKzDPFMAtJuASctHMw2t7syAszidWSH6tXrZZQ8/+x4f6Io7xH5ZYvJVujiDgNTBgSojGrHCHIses6GCXJuIsfxLsw5ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=trFWe0fb; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="trFWe0fb"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b7270cab7eeso56033066b.1
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 04:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763035579; x=1763640379; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DrSwWUUS8EG5A5vNOucgA9G+KYKAzfFTIdyoG9AXKcg=;
        b=trFWe0fb+66yvL9Kh73vm/mO42gnr95UJVmBAPEx6qXFqeYiGDZ8qA/sA96iHniBxd
         85HyTq4G9K/soZsmSrf90AZq2L65Wc7dAKeMLsGDTmIPbd5NVRALTzGaLBnPP1CDD+ns
         rRJlHwSjhMau3tYHyaCnSIX/uQB+6ZBNhXl1h4quIKSEDK7pHNfEGqs63tdI6LSGXLJd
         kXTKT2zO/l4ASjo0z3OKS5Mf7gJJucOcuBtSUKGQNxQON9liuQhS1/HePQaPaVXx3Rpd
         1gVnXWoly3QVSeHopt56OZkml0y48tVorf858UfGBAxIEejd0ggYBIoqL784wMM/R4aU
         QfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763035579; x=1763640379;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DrSwWUUS8EG5A5vNOucgA9G+KYKAzfFTIdyoG9AXKcg=;
        b=mmqoaGf9mpwlwaqGGceSFO9LZF10VUe15+iHrNWC/DjZSHPrbEQbtLHbap1fqdE2Qr
         O/y00WnabGeaUlA3xAP/Y2ZWwL7EXivNJgRt36GjEeQFyZnAGIYTYSG8pbe5WZn8mxg/
         QHkvWGvK+yNt+yffCcT7G+pIdMXtaUJAm/LtB1kb0FCVIaWSAnCH62z0uQ5eq51dM18D
         2CmeUe94r1cLe9Zx330+7n3GOnxtj9aebZxQkPwr7NzmXX9RaWuNGTPTuYTiaSBqj+lb
         q+mjzYMisyH3yAy4VAAifyQHh0LSrtpHFQZI2L81XTxB6IpdBIElXwZOOGdHiu219W64
         6Snw==
X-Forwarded-Encrypted: i=1; AJvYcCW22Q1x5E4dk3m1Ipe3y7GMSIhIKgMKr4Ysw34oSESELYoH2zYPEFGuIMOOlKMHI5TVMNjMh3/tGNr9vhthWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAW8c4ttceftVNSiCLbX2lZBEHnSOyTc1YAfcFQ2WNb5f2hrXU
	7VGYDev882gY3oQ9ydElQP4U1AiDTCDK28tSZpqS+4wy8Vl+PTg9kgiIxRMM8X738DXBvrFTmNH
	WakylmGE142gE2U9aAQ==
X-Google-Smtp-Source: AGHT+IFXA9m26lKjNXbTDcwVd9JRQW7Vnnx7mR18bLU1GHC5NE9UdfrDL6zH6RUJHJvTFNNDgWvcG+VmGPQ4Fow=
X-Received: from ejctk9.prod.google.com ([2002:a17:907:c289:b0:b6d:3f2b:2d59])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7f14:b0:b4e:d6e3:1670 with SMTP id a640c23a62f3a-b733195fdcamr649615466b.11.1763035578799;
 Thu, 13 Nov 2025 04:06:18 -0800 (PST)
Date: Thu, 13 Nov 2025 12:06:17 +0000
In-Reply-To: <20251113.201844.1009485179863259148.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251105054731.3194118-1-fujita.tomonori@gmail.com>
 <aRWt6Ah8KuBXff8V@google.com> <20251113.201844.1009485179863259148.fujita.tomonori@gmail.com>
Message-ID: <aRXJuUTR1fnWiBQF@google.com>
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	jens.korinth.tuta.io@kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Nov 13, 2025 at 08:18:44PM +0900, FUJITA Tomonori wrote:
> On Thu, 13 Nov 2025 10:07:36 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > On Wed, Nov 05, 2025 at 02:47:29PM +0900, FUJITA Tomonori wrote:
> >> This adds the Rust equivalent of the kernel's DO_ONCE_LITE and
> >> pr_*_once macros.
> >> 
> >> A proposal for this feature was made in the past [1], but it didn't
> >> reach consensus on the implementation and wasn't merged. After reading
> >> the previous discussions, I implemented it using a different approach.
> >> 
> >> In the previous proposal, a structure equivalent to std::sync::Once
> >> was implemented to realize the DO_ONCE_LITE macro. The approach tried
> >> to provide Once-like semantics by using two atomic values. As pointed
> >> out in the previous review comments, I think this approach tries to
> >> provide more functionality than needed, making it unnecessarily
> >> complex. Also, because data structures in the .data..once section can
> >> be cleared at any time (via debugfs clear_warn_once), an
> >> implementation using two atomics wouldn't work correctly.
> >> 
> >> Therefore, I decided to drop the idea of emulating Once and took a
> >> minimal approach to implement DO_ONCE_LITE with only one atomic
> >> variable. While it would be possible to implement the feature entirely
> >> as a Rust macro, the functionality that can be implemented as regular
> >> functions has been extracted and implemented as the OnceLite struct
> >> for better code readability.
> >> 
> >> Of course, unlike the previous proposal, this uses LKMM atomics.
> >> 
> >> [1] https://lore.kernel.org/rust-for-linux/20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io/
> > 
> > There has been a fair bit of discussion below. Here is my take on the
> > way forward:
> > 
> > 1. OnceLite should be it's own special type, and it should be in a
> >    printing-related module, not kernel::sync. The reason for this is
> >    that do_once_lite! is hooked up to a special section that allows you
> >    to reset the once status, and if someone used it for anything not
> >    related to printing, they would end up with being incorrectly reset
> >    when someone resets pr_warn_once calls.
> 
> Do you mean that only the do_once_lite! macro, which places the data
> in .data..once section, should live in a printing-related module? Or
> should everything including OnceLite struct itself, also be moved
> there?

I think both should live in the same place, and not in kernel::sync.
Whether you call the module once_lite or print is not a big deal to me.

> > 2. I would suggest just using a relaxed load followed by store instead
> >    of xchg. This is what the C-side does, and I think there is no strong
> >    reason to deviate. It allows for a single byte of data instead of i32.
> 
> You meant best-effort try-once logic like C?
> 
> pub fn call_once<F>(&self, f: F) -> bool
> where
>     F: FnOnce(),
> {
>     if self.0.load(Relaxed) == State::Incomplete {
>         self.0.store(State::Complete, Relaxed);
>         f();
>         return true;
>     }
>     false
> }

Yes that is what I meant.

> Using u8 as atomic type instead of i32 would require a fair amount of
> work, since at the moment only i32 and i64 are supported as atomic
> types, right?

Supporting u8 atomics in general is tricky, but I think *specifically*
load/store should not be a problem.

Alice
