Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1996934CDD
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 09:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839079; cv=none; b=XasI4KfjZtf50A/HxXSsk2VoCGGIVCHefZFG7Bp7T0BFhhTz5sNVjJOUPg40XovLqAFFo032wz5c5C9qQgX0t1VOHTvuEXzwXZliyA3K6bSpBD3v8syRlgibp5GSK5F0LBkuogRok35GdWv4OKOed+YZ0U64kA8SYgiZgIZL/ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839079; c=relaxed/simple;
	bh=MstDplDoTRIUEORY/6bLoD4DwGh6jpBhgUt8nNCdMy4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gDKcSGBdTtGHS00Fl+y0YNNrSJ/poaFLp2p00R12+lALj+k3pnmT6T60IeGplwI11YB01CGvFm3UaHCPdx1kAq3UJ2B4/eKt6lY6ik+XLuULD0a5czyOpRfQqqV1Zg4IE2dmQbkbQ6WxdVGK9OdrIKga3JmORp079Xz8zyx8xzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aDita2wP; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aDita2wP"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47775585257so4555175e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Dec 2025 01:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764839075; x=1765443875; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7sTPUp/OWbW90tydkouFv4yEa9SD/Z7hXDOvCNp2ptc=;
        b=aDita2wPw/kMjRucwHhmVDcxfEbyGsBTqht6eaxZfbBMD1fiwT1C1ljaud4oNTaGUf
         Hav9ouM+C++SGR76DW6mRtOSI/dPewlIQC1EE0ag5yc3u8EodmPtRj2yUNxryRMBkcnb
         K+Vv8AN1ZKFYLr+NzTPKjITKdvy8CM4Onm4jySlyNj1S1UDeQB19dTgFUsyx4Z+al3hn
         W+pUTMdK1hh4MgPtuRb5HsQO1E0frkekHtEGfCPS3iX7/p2M3kvYdi81lpDp3BbVhL2Q
         ai9l+CG9UyaSx4St1o15VFt9MAiVQYqAzPomVaDLsZoDdSdfHNPmiBuSm/7mt1cB0AMY
         C5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764839075; x=1765443875;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7sTPUp/OWbW90tydkouFv4yEa9SD/Z7hXDOvCNp2ptc=;
        b=hj7KnjxEvULJUYIKo6lefpbYzzYIBDi8PVadTL39aZK6O14tFG862LedoRcwPmZgrP
         8bo8p7s6xVR5lX7WvnDNspxymSsP5EN0+p+DmJLv+FnYBPH3JHYmQXOxdjBAWnGnC1ca
         B+wSaf/SkNN9F1dH+gLPd66Kh/v6CM0Was2guFv3Nksj854UFRSrp55sChRDiolo/dMC
         bIU+Z1AygkfphoKNsK4iJX1QcLPc28VeFXnoE0XxM933G3LaFhsfOJW4koa41Z1VyCBy
         CuYuI24cloUVAYwowKEYLg0s3tI4BGC9M9wwsD8GdQcXpy9BCu3TMgV8xrRHyAvD1Obf
         TBqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTYxwlNeA/C2guLacOrM5089qf3A9jmXkP/v1McEWmKlVTnwM62lcbeOtyUD5A3vwRHtA1PrFcDl0Shd//7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVdlDCyAK2Ln9efJz9faERCMsWEYJ+Ixo8E+QTEuTytB5tt5vC
	k8tFdCKnAx/P5xhfTzrtl74RrY4h/zdZzcN+qAdp174ttcON+mvTcx36Hh9FjDNGVbdqq5LUm+I
	R8xtG5mvEbn/G4l3iAg==
X-Google-Smtp-Source: AGHT+IF2dyZIivJ8BCuSDrfTGmE8WIbECL2lNCS9H+ea1+piC75ZdOf8YlosETo2w+4ZG49OfYw6o1bYoGh329A=
X-Received: from wmsm36.prod.google.com ([2002:a05:600c:3b24:b0:477:a4d4:607a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:45d2:b0:477:3543:3a3b with SMTP id 5b1f17b1804b1-4792aed9d13mr47575865e9.6.1764839075411;
 Thu, 04 Dec 2025 01:04:35 -0800 (PST)
Date: Thu, 4 Dec 2025 09:04:34 +0000
In-Reply-To: <87ikenw5v9.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251203-bitops-find-helper-v1-1-5193deb57766@google.com> <87ikenw5v9.fsf@t14s.mail-host-address-is-not-set>
Message-ID: <aTFOouqQ3-PbN0Kk@google.com>
Subject: Re: [PATCH] rust: bitops: add helpers for _find_* functions
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Dec 03, 2025 at 11:35:54PM +0100, Andreas Hindborg wrote:
> Alice Ryhl <aliceryhl@google.com> writes:
> 
> > On 32-bit ARM, _find_next_bit does not exist because ARM provides that
> > function through a #define instead. This means that Rust, which calls
> > the underscored version, fails to find it. This triggers errors:
> >
> > 	ld.lld: error: undefined symbol: _find_next_bit
> > 	>>> referenced by bitmap.rs:459 (rust/kernel/bitmap.rs:459)
> > 	>>>               rust/kernel.o:(kernel::bitmap::tests::kunit_rust_wrapper_bitmap_borrow) in archive vmlinux.a
> > 	>>> referenced by bitmap.rs:459 (rust/kernel/bitmap.rs:459)
> > 	>>>               rust/kernel.o:(kernel::bitmap::tests::kunit_rust_wrapper_bitmap_set_clear_find) in archive vmlinux.a
> > 	>>> referenced by bitmap.rs:459 (rust/kernel/bitmap.rs:459)
> > 	>>>               rust/kernel.o:(kernel::bitmap::tests::kunit_rust_wrapper_bitmap_set_clear_find) in archive vmlinux.a
> > 	>>> referenced 10 more times
> >
> > 	ld.lld: error: undefined symbol: _find_next_zero_bit
> > 	>>> referenced by bitmap.rs:479 (rust/kernel/bitmap.rs:479)
> > 	>>>               rust/kernel.o:(kernel::bitmap::tests::kunit_rust_wrapper_bitmap_copy) in archive vmlinux.a
> > 	>>> referenced by bitmap.rs:479 (rust/kernel/bitmap.rs:479)
> > 	>>>               rust/kernel.o:(kernel::bitmap::tests::kunit_rust_wrapper_bitmap_set_clear_find) in archive vmlinux.a
> > 	>>> referenced by bitmap.rs:479 (rust/kernel/bitmap.rs:479)
> > 	>>>               rust/kernel.o:(kernel::bitmap::tests::kunit_rust_wrapper_owned_bitmap_out_of_bounds) in archive vmlinux.a
> > 	>>> referenced 6 more times
> >
> > To fix this, add Rust helpers in this particular case.
> >
> > Fixes: 6cf93a9ed39e ("rust: add bindings for bitops.h")
> > Reported-by: Andreas Hindborg <a.hindborg@kernel.org>
> > Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/x/topic/x/near/561677301
> > Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/helpers/bitops.c | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/rust/helpers/bitops.c b/rust/helpers/bitops.c
> > index 5d0861d29d3f0d705a014ae4601685828405f33b..84061af591a261f7268ffe6535282bf3c7608e2d 100644
> > --- a/rust/helpers/bitops.c
> > +++ b/rust/helpers/bitops.c
> > @@ -1,6 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  
> >  #include <linux/bitops.h>
> > +#include <linux/find.h>
> >  
> >  void rust_helper___set_bit(unsigned long nr, unsigned long *addr)
> >  {
> > @@ -21,3 +22,34 @@ void rust_helper_clear_bit(unsigned long nr, volatile unsigned long *addr)
> >  {
> >  	clear_bit(nr, addr);
> >  }
> > +
> > +/*
> > + * Rust normally calls the single-underscore-prefixed version of these
> > + * functions, which are not inlined. However, on some platforms, they do not
> > + * exist. In those cases, provide a rust helper for the underscored version.
> > + */
> > +#ifdef find_next_zero_bit
> > +__rust_helper unsigned long
> > +rust_helper__find_next_zero_bit(const unsigned long *addr, unsigned long size,
> > +				unsigned long offset)
> > +{
> > +	return find_next_zero_bit(addr, size, offset);
> > +}
> > +#endif /* find_next_zero_bit */
> > +
> > +#ifdef find_next_bit
> > +__rust_helper unsigned long
> > +rust_helper__find_next_bit(const unsigned long *addr, unsigned long size,
> > +			   unsigned long offset)
> > +{
> > +	return find_next_bit(addr, size, offset);
> > +}
> > +#endif /* find_next_bit */
> > +
> > +#ifdef find_last_bit
> > +__rust_helper unsigned long
> > +rust_helper__find_last_bit(const unsigned long *addr, unsigned long size)
> > +{
> > +	return find_last_bit(addr, size);
> > +}
> > +#endif /* find_last_bit */
> >
> > ---
> > base-commit: 54e3eae855629702c566bd2e130d9f40e7f35bde
> > change-id: 20251203-bitops-find-helper-25ed1bbae700
> >
> > Best regards,
> > -- 
> > Alice Ryhl <aliceryhl@google.com>
> 
> I messed up when testing this patch. It actually does not solve the
> issue.
> 
> It appears that bindgen will emit an extern "C" declaration for the
> missing C functions, even though they are not in the symbol table. When
> we add the rust helpers, the declarations emitted based on the
> non-existent C functions will mask the rust helper functions.

Yeah, when Rust sees both a helper and real function, we configured it
to pick the real one.

> We can circumvent this by using another name for our helper. While it
> works, it is not fixing the root cause. I am not sure why bindgen emits
> these functions even though they are not in the symbol table at the end.

I think a much better workaround is to adjust the header file:

#ifndef find_next_zero_bit
unsigned long _find_next_zero_bit(const unsigned long *addr, unsigned long nbits,
					 unsigned long start);
#endif

Alice
