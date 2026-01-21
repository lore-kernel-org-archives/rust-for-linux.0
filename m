Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6917E3B95F6
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990232; cv=none; b=XdZHZ4mMjxvhB/XKbWTI07S/NPe8Tv51zb3CurKs4+hpfH4orZ54zDQq5FV1JjpfswzIi9gibps2bqINXa5OQt4bT+PSCZy2z9FCAGbkeB40LWTwuTz5UgMjzFUyuXDwkaGPuGohnYbeFtvDHGgLPn68/qUl23q2/ZHO68EStN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990232; c=relaxed/simple;
	bh=jOYqjIeiIw1YTA5eQEBufSqdLY2oCyAkCwH8FtItF6Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oHwzwq8+ciYG9OeQZCzmiVSupH6Jp9sxWkgS9A56wNcoKJaF50Vu8wEPVCyzE90P4p+hHGhwaY2HexVRjO3m3cfZpTmqPv53af95fhgJU31g2e6gE9EvNU4KtF+FB9OZJuG1h9GUY8qZ4n8yZj6AiqAezTD/4Hi+Do8TBdgUORg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c7bLGcei; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c7bLGcei"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43065ad16a8so4600143f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 02:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768990229; x=1769595029; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vjjEQotnj2Cyv4eb296qwZWd2dvM6FaXMgU0Htmcu9Y=;
        b=c7bLGcei1ZZ+s9GOm+DslogoKKDIxFdyNKC9faeclzm2//ZEfXId/BRT6Am3SWW0V8
         8hk9NJ1udPvC9LaHrl6zBKKyWz+dnRKLHRjNGjeUCC8tAtMgRB/R1+Er5OjfbdqBwanl
         YqqoeOzDRN31in7Fc87gKdn0TTfbsjHyOwA9Tixs5ieBuY7Pa3KRAHCLwf3jAO5xV+RK
         zAqZwEdrcYaLoVh/aiM3Ixg5CHW7gic7hatijvsNPwvAVasVfM7VbKH5btjDqCKW0WL7
         +KyDmih8lZ409v1cd/h/CWpBsI6hVPSXmMTL7IS+C9oDOFMGGoWX5kWJqPoNRUWsBJnA
         z5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768990229; x=1769595029;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vjjEQotnj2Cyv4eb296qwZWd2dvM6FaXMgU0Htmcu9Y=;
        b=Md7kJxqrbXugtfDinwybaXtZevMcEY6fMl8iOBDc8m2c+Wn//vVaAABtnNUxgBwT5k
         AILBMiD1eNaXhO179L9nzYsMiijJAqNus2D+LtXUbMRxzmnWZunSr2GtyanmTgbZUxT5
         Msnc6dD056eCO//yqx5rNa6v+z3/WeBCGQCYlQUGO+824DG0wAbDKuOOpvhsScMjmzit
         rPiuN+CDN3IQnfFE5klglO+f26B0DC5BW1PFDQ7t6+6VaCE5L8Gmu581G04uOG4APMOh
         wCUcR6OxmYpJdPzn18UBOiWg3IDqG5KK8ZjeMf5/CC3cbHziqY9jceHje7rmJ5h2X4jW
         n46Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9KymQOqQ6j7o0VyqMGzb0c4ToSmHhpBbxZKFGTwlCrYcKZFeIW/99/b5IDmgyi/D32ZWIEs3EMnTcVf6aIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpwA3BsXDfBUVRl0l48wQ8CG/BgSPBI8P3Z28UUC/YAfM6aJNy
	spQ401XknMSnHiCLI3RjEfLJk5iwS7tsseLAKP8nsW28ZkEF4XTn8gupEb7mLWNiAvss4QQb38t
	/4HsKzSwEsH5SSUm75w==
X-Received: from wmor14.prod.google.com ([2002:a05:600c:458e:b0:477:a678:a39a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3d8b:b0:479:2a09:9262 with SMTP id 5b1f17b1804b1-4801e30b49emr196650895e9.9.1768990228838;
 Wed, 21 Jan 2026 02:10:28 -0800 (PST)
Date: Wed, 21 Jan 2026 10:10:28 +0000
In-Reply-To: <aXCLNRVGGqsYeiBM@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <20260120-register-v1-1-723a1743b557@nvidia.com> <aXCLNRVGGqsYeiBM@yury>
Message-ID: <aXCmFNMGkfBYEIjG@google.com>
Subject: Re: [PATCH 1/6] rust: num: add `shr` and `shl` methods to `Bounded`
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jan 21, 2026 at 03:15:49AM -0500, Yury Norov wrote:
> On Tue, Jan 20, 2026 at 03:17:54PM +0900, Alexandre Courbot wrote:
> > Shifting a `Bounded` left or right changes the number of bits required
> > to represent the value. Add methods that perform the shift and return a
> > `Bounded` with the appropriately adjusted bit width.
> > 
> > These methods are particularly useful for bitfield extraction.
> > 
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> > ---
> >  rust/kernel/num/bounded.rs | 40 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> > 
> > diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> > index 5ef8361cf5d5..6e3f4a7a5262 100644
> > --- a/rust/kernel/num/bounded.rs
> > +++ b/rust/kernel/num/bounded.rs
> > @@ -475,6 +475,46 @@ pub fn cast<U>(self) -> Bounded<U, N>
> >          // `N` bits, and with the same signedness.
> >          unsafe { Bounded::__new(value) }
> >      }
> > +
> > +    /// Right-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, { N - SHIFT }>`.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// use kernel::num::Bounded;
> > +    ///
> > +    /// let v = Bounded::<u32, 16>::new::<0xff00>();
> > +    /// let v_shifted: Bounded::<u32, 8> = v.shr::<8, _>();
> 
> This syntax is really confusing. Does it work for runtime shifts?
> Is there any chance to make it just v.shr(8)?

The ::<NUM> syntax is how you pass a build-time constant value in Rust.
The syntax 'v.shr(8)' implies that 8 is a runtime value, and not a
build-time constant. I agree it's ugly, but that's how it is.

For runtime shifts, we can make it 'v.shr(8)' or even 'v >> 8' using
operator overloading, but see my further reply below:

> > +    }
> > +
> > +    /// Left-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, { N + SHIFT }>`.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// use kernel::num::Bounded;
> > +    ///
> > +    /// let v = Bounded::<u32, 8>::new::<0xff>();
> > +    /// let v_shifted: Bounded::<u32, 16> = v.shl::<8, _>();
> > +    ///
> > +    /// assert_eq!(v_shifted.get(), 0xff00);
> > +    /// ```
> > +    pub fn shl<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
> > +        const { assert!(RES == N + SHIFT) }
> > +
> > +        // SAFETY: we shift the value left by `SHIFT`, augmenting the number of bits needed to
> > +        // represent the shifted value by as much, and just asserted that `RES == N + SHIFT`.
> > +        unsafe { Bounded::__new(self.0 << SHIFT) }
> > +    }
> 
> So, it protects most significant bits when shifting left, but doesn't
> protect least significant bits when shifting right.
> 
> It also makes impossible to left-shift Bounded::<u32, 32> at all, or
> shift Bounded::<u32, 31> for 2 or more bits. This doesn't look nice.
> 
> At this layer, there's seemingly nothing wrong to loose bits during
> regular shift, just like non-bounded integers do. (Lets consider them
> naturally bounded.) At higher layers, people may add any extra checks
> as desired.
> 
> Even more, you mention you're going to use .shl and .shr for bitfield
> extraction, which means you want to loose some bits intentionally.
> 
> Let's design shifts like this. Plain .shl() and .shr() will operate on
> bounded integers just like '<<' and '>>' operate on non-bounded ones,
> i.e. they may loose bits and the result has the same bit capacity. (But
> shifting over the capacity should be be forbidden as undef).
> 
> If I want to adjust the capacity, I just do it explicitly:
> 
>     let x = Bounded::<u32, 12>::new::<0x123>();
>     let a = x.shl(4); // 12-bit 0x230
>     let b = x.extend::<12+4>().shl(4) // 16-bit 0x1230
>     let c = x.shr(4); // 12-bit 0x012
>     let d = if x & 0xf { None } else { x.shr(4).try_shrink::<12-4>() }
> 
> For b and d you can invent handy helpers, of course, and for a and c
> you can add 'safe' versions that will check shifted-out parts for
> emptiness at runtime, in case you need it. 

This 'shr' method came up from a discussion that Alexandre and I had at
plumbers. The entire point of them is that when you shift right by a
compile-time constant amount, you can change the bit capacity in the
type, and doing exactly that lets us remove BUILD_BUG_ON calls that Nova
has right now. (Right now Nova does a shift-right by a compile-time
constant, then uses BUILD_BUG_ON to assert that the resulting *runtime
value* has the desired target bit-capacity.)

So if we want a shift right method that doesn't change the bit-capacity,
we can do that. It can even use the ordinary '>>' operator. But the
purpose of this patch is precisely to support shifts that:

1. Shift by a compile-time constant amount.
2. Change the bit-capacity accordingly.

All that to say ... support for left-shifting Bounded::<u32, 32> and
similar certainly makes sense as something we could support, but that's
not what this patch is trying to achieve. Ultimately, the end-goal of
this patch is to allow us to get rid of BUILD_BUG_ON() calls operating
on runtime values, while still performing the same check that the
bit-capacity is as expected at build-time - just using types instead of
compiler optimizations to check it.

Alice
