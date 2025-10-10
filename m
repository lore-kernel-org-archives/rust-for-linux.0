Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E28A25A2DA
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Oct 2025 11:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760096006; cv=none; b=uO56+4x/H7cmuJjiPEZ58fAKgnqs8oZ6INRK7WzmLUXrpxxrDMYSgBO+1Q9hA/Q1mY49teQOeWwysv1STvOU4uEvYu3cYFkDpwxNKqYiU7A742xg/skebYiwW5EcWYDjYyId2VxXKYjHhUgUAP9mo/sMIRXPNWRGx+Q+bnvrmKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760096006; c=relaxed/simple;
	bh=r3zKZRotjPWQlgOeKsaLGYW9tbVEWlL8OkX4yQy1Ci0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rDBbF0XUFZA9oUJLiTNz/lzlY7cbSz/Xcs+AYUfTZEuNGE87Ueqf0zSKFrbADNED2kFqUpS8a9tzEAV8HaCRQeozKI1gspQ7klCXNB1Yxfd59X+CQvQRFLiM/PW6Fl02wM4inXvuAno1t7dSGrW9qEZr8eCw4gsF2I6SoGfpYdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OJ6N+oDz; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OJ6N+oDz"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6349af0e766so2232525a12.3
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Oct 2025 04:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760096004; x=1760700804; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IH1YDvYsxX3hjWroQNK0cNnu+sMWw/N2vm++yhHs9VI=;
        b=OJ6N+oDz7xYwWz7sl3zhKIPAxZ0OsVSVWmwMPiQoi3yeb11mUi5sOHmzRCLMIUG/s2
         X8ODB6HL7coo7ZQBu5yziWRKmwg+2W2BExSdtywn4wbpPBfaG4kxKPyp64OX5aHdWSUT
         edJ3bQ8QBdS5TqiW5yAsk8StZqTM0GXOloths6BPBEzGrkjNwLpC3fY+J09yEFotYbRz
         6z9dwwVCdQepVHKmlexWXOnjwl345Kw4mrZjPtBg4b7k/3DenufI+iT4V1bu/G0TEeBq
         czlIL+nptFvt38jqzgnnCDLgoYKDs0pGgdhPFnDpSG1akQO1CM/yWwpMGdvgmWuQ5U9c
         epKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760096004; x=1760700804;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IH1YDvYsxX3hjWroQNK0cNnu+sMWw/N2vm++yhHs9VI=;
        b=jy58NHCljUNakLBrVx6M7SXtYfPQb4nC3TD0d0XQ+uV+olobrM0iXRXpv3B3qjnN7s
         YPjv28dWH00vTB1aTWyeh7/Y4HqqDTBxh9RvRANKLkrsjiQsiFncoKkyGnTovmnWd2dc
         Vm7bQUkj+dqyvmVlPgWP+G59u8epDCvBYXCIyH9Hbw7qECHvn0/rOAZwIfWIyQyzEju7
         8jDQHh6OF5kAuS/j8uTAU8N/3cP7ogmHxRYgzFQ8xA0zSrZe+wLXpIx39SRHiahrsSPS
         k1Pu19fNUFcqsL82/HpExAgDswJP/mDDtiVvgrKT62Nhid4UPaEwGsZmV9AyiNalWELX
         oFuw==
X-Forwarded-Encrypted: i=1; AJvYcCVV/axZhmdNyqKU/fyGHkK2MNXJXEVvZ8THcTFomC0fYoJQNHCdol5jpDhyQUqJ6nPbro/llWrZEnkWkC96og==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdowsbr/8Xk8Rd0IHDebJQtahD56TT0AInekLpjyDDvp/6xLuq
	Q9JhjsUhxR5hk7QYqwh2F1zBLuP0LKvsWreVuFSbF/9qGdwH4+DNBk6hGZGnex6J7s0FLTr4ol1
	CBcW3gxZ4jNx9ymSqNw==
X-Google-Smtp-Source: AGHT+IFV6v++ooPwo8zgY/r4GJHECl9wGwude+Hat/aZ5a07QvQNNKNLo0YbYD1Zbr62UXM08XqQmvhtFgNoZlY=
X-Received: from edbio4-n1.prod.google.com ([2002:a05:6402:2184:10b0:62d:a09d:445f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3483:b0:63a:50e:e828 with SMTP id 4fb4d7f45d1cf-63a050eee43mr4613252a12.35.1760096003647;
 Fri, 10 Oct 2025 04:33:23 -0700 (PDT)
Date: Fri, 10 Oct 2025 11:33:22 +0000
In-Reply-To: <20251009181203.248471-2-markus.probst@posteo.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251009181203.248471-1-markus.probst@posteo.de> <20251009181203.248471-2-markus.probst@posteo.de>
Message-ID: <aOjvAozHB8T2PZbm@google.com>
Subject: Re: [PATCH v2 1/2] rust: add basic Pin<Vec<T, A>> abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Oct 09, 2025 at 06:12:33PM +0000, Markus Probst wrote:
> Implement core Pin<Vec<T, A>> abstractions, including
>  * `Vec::pin` and `Vec::into_pin` for constructing a `Pin<Vec<T, A>>`.
>    If T does not implement `Unpin`, its values will never be moved.
>  * an extension for `Pin<Vec<T, A>>` allowing PinInit to be initialied on a
>    Pin<Vec>, as well as truncating and popping values from the Vec
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  rust/kernel/alloc.rs      |  1 +
>  rust/kernel/alloc/kvec.rs | 86 +++++++++++++++++++++++++++++++++++++++
>  rust/kernel/prelude.rs    |  2 +-
>  3 files changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> index a2c49e5494d3..9c129eaf0625 100644
> --- a/rust/kernel/alloc.rs
> +++ b/rust/kernel/alloc.rs
> @@ -24,6 +24,7 @@
>  pub use self::kvec::KVec;
>  pub use self::kvec::VVec;
>  pub use self::kvec::Vec;
> +pub use self::kvec::PinnedVecExt;
>  
>  /// Indicates an allocation error.
>  #[derive(Copy, Clone, PartialEq, Eq, Debug)]
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index 3c72e0bdddb8..d5582a7f17e9 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -16,11 +16,13 @@
>      ops::DerefMut,
>      ops::Index,
>      ops::IndexMut,
> +    pin::Pin,
>      ptr,
>      ptr::NonNull,
>      slice,
>      slice::SliceIndex,
>  };
> +use pin_init::PinInit;
>  
>  mod errors;
>  pub use self::errors::{InsertError, PushError, RemoveError};
> @@ -109,6 +111,21 @@ pub struct Vec<T, A: Allocator> {
>      _p: PhantomData<A>,
>  }
>  
> +/// Extension for Pin<Vec<T, A>>
> +pub trait PinnedVecExt<T> {
> +    /// Pin-initializes P and appends it to the back of the [`Vec`] instance without reallocating.
> +    fn push_pin_init<E: From<PushError<P>>, P: PinInit<T, E>>(&mut self, init: P) -> Result<(), E>;
> +
> +    /// Shortens the vector, setting the length to `len` and drops the removed values.
> +    /// If `len` is greater than or equal to the current length, this does nothing.
> +    ///
> +    /// This has no effect on the capacity and will not allocate.
> +    fn truncate(&mut self, len: usize);
> +
> +    /// Removes the last element from a vector and drops it returning true, or false if it is empty.
> +    fn pop(&mut self) -> bool;
> +}

Please no extension traits just for this. Just provide `self: Pin<&mut Self>`
methods on Vec.

Alice
