Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BE6329C4A
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 09:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209516; cv=none; b=QmHKkY9/j51aPiEnJbMZEnrT3+1ZwaSsWQ2M/t8EiDlHGGiB2UeLxBZTovthbH0NHo8b3hMLgD7HDHBoEaf5ID7R3QTcGa5CwabP3nM0zwzXFx8/mrw4z33bk0COeNbabaAIzSgA3CHhU8kE0wFt22dYpmDkFRbdPy1pgwfwwHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209516; c=relaxed/simple;
	bh=muSbkQ12zbdFUX8PVFp3x7DgkRRLrb0MrzF3H7VaRLs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DTZl7lclspqPclMYD0IV7uIJwVLgUop5OeYjJaAWPVBh01wFbmsatS/WveiVQVqlOP7ZBCyIGA9h1RhcKvPt7/gFrB3u8AMp7X2UuGWbgLAZqIWePn3SOUn21Dn3aMCfdx2RATsnGutK4pbWnDlYEajPJmeyeynRVav2zfwbaJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tD6fRz2I; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tD6fRz2I"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4775f51ce36so57585945e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 01:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768209513; x=1768814313; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HTOj/PuVeWUrSXHYJcDcZO+WiL158bNyQ1pnyZ4ieWY=;
        b=tD6fRz2IjnDwpzuqdc2n+LlplHnVK2l0qMbN0+t5N13a7egSUsL8ImC4TlRSs5UEJ+
         V5df5EOvGLo9oGFAkOvV/oEWQYhm1fIMCEv4zf0LCEy7PdCbW+yI+6q5n16pkl/ypPwo
         K+QLYt9h+3euisLk1b3uOya1JzHOeceCwcjg2yFiQkg0ssiKNsW0oH/QBiSCcrXB9ZPn
         wtEWR/emVjKclccOUPHGKPsleaMVTFVamPej7A5RLxu7oUq6huSglJKWiWlLFYWonfZW
         7lRauuLlMkIikXBuw/jsWUxfOGobl0DK8pvDsVVT9AIOiMudinXgrZh5+Gdv+mQVkhvP
         XseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768209513; x=1768814313;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HTOj/PuVeWUrSXHYJcDcZO+WiL158bNyQ1pnyZ4ieWY=;
        b=taME4TSLDTamhL/Px7cS2WdPg0+hHKJyzN5EdyaERRNPLV6DLWEDyApNAEPaKbi8xV
         ZIQoBOgLbautjiNluchGPkF2r5mdG6Oe+UrD36XbZP032X4SqJ+jFG6G8V2V/XRrlFol
         qS4sjTmwRkvgn16zdu+GJ//s6j+k1T15N4oVLT/RDzoem3hYGDCWAu5l9CRr62YnZ5+R
         F1C83AGAyDuKAeq/E5sG0nd3aHdNQjnE18JbTKfeHbntxG0+L3MhmK0HDN+8d7GnkH4X
         vGDlTRLKQOaSHe9hP6nnXwozgWS4BQWSU3gorhhDvExkda/jgEeVsQPCUvPFS4zbooZw
         9YyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4hA9IzkicZuc8ZQegBX4MotrL0SWRQq9P1WNqMStGe5S7EGVSeJMU1IWVUJ1gfQshwk1Sj8dnIpFM6IyJ+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx38t89AkDrNfXxN5vJekvfOT21rvYXCMb8FC8wW1dLt450kOq
	u7S75r7ZBd+6BL5UGkk3YbSPVqZ1UV+Ff6gIKbDoz7xFdLmytUug2NMVCwvM4gWwhHDUtwfz+eL
	YiTNnr127sP8BBOypNA==
X-Google-Smtp-Source: AGHT+IGVFBUwaaa/F7bzovvs5bi07WRrtlErBamaJXDnsQpNl3azykN7jpk5GtfI5Ut0vaY+zfMAi1mzj4KxOn4=
X-Received: from wmne21.prod.google.com ([2002:a05:600c:4395:b0:47a:98a6:7c41])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3152:b0:479:1a0a:ebbe with SMTP id 5b1f17b1804b1-47d84b18db4mr198669435e9.14.1768209513178;
 Mon, 12 Jan 2026 01:18:33 -0800 (PST)
Date: Mon, 12 Jan 2026 09:18:32 +0000
In-Reply-To: <20260111050558.3147975-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260111050558.3147975-1-fujita.tomonori@gmail.com> <20260111050558.3147975-2-fujita.tomonori@gmail.com>
Message-ID: <aWS8aPuBRTKIjTZu@google.com>
Subject: Re: [PATCH v3 1/2] rust: sync: atomic: Add i32-backed Flag for atomic booleans
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: boqun.feng@gmail.com, ojeda@kernel.org, peterz@infradead.org, 
	will@kernel.org, a.hindborg@kernel.org, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, mark.rutland@arm.com, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Jan 11, 2026 at 02:05:57PM +0900, FUJITA Tomonori wrote:
> Add a new Flag enum (Clear/Set) and implement AtomicType for it, so
> users can use Atomic<Flag> for boolean flags.
> 
> The backing integer type is an implementation detail; it is currently
> i32 but may change in the future.
> 
> Document when Atomic<Flag> is generally preferable to Atomic<bool>: in
> particular, when RMW operations such as xchg()/cmpxchg() may be used
> and minimizing memory usage is not the top priority. On some
> architectures without byte-sized RMW instructions, Atomic<bool> can be
> slower for RMW operations.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/sync/atomic.rs | 56 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> index ca9cab77abf0..473d3c07e234 100644
> --- a/rust/kernel/sync/atomic.rs
> +++ b/rust/kernel/sync/atomic.rs
> @@ -566,3 +566,59 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
>          unsafe { from_repr(ret) }
>      }
>  }
> +
> +/// An atomic flag type intended to be backed by a performance-optimal integer type.
> +///
> +/// The backing integer type is an implementation detail; it is currently [`i32`] but may change
> +/// in the future.

How is it, could we make it u8 on some architectures without penalty,
and have it be i32 on others? Or is i32 better always.

Alice
