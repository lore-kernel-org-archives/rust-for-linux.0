Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A698C305688
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 14:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026285; cv=none; b=h72hAw0Qb8CmrdJghpFOFPmVtlnmBy74Gcayhrklh5c8QsLUcod1rnH0ajXCi+OphwOYxB5WFmA/kWQvYXYSVqehMOMo6nM7JLA+owtINHh91Z9zLKfAot1CwAGc1+WoQg+dpV9ndmmxLCnhGlHs2vuBAdMASzos/0BrPH+Vt+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026285; c=relaxed/simple;
	bh=V1OzdbPQVh6pqrtinUjJiZF9LyYorh+LLUgmlUkctW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKCxvT2g0uAlm5b9iT0cF77TbuP0kWhNnzi49pjyt8o7spv2gquo91e9RP2onEzx4qLd3fk4pIwCm19hVJ8+zZ+XVT6WzGItiv2e6eQ30EnY8W6LZPvRvL7vMryi54J40HwkvPRWFp29Ud1mkyvu8zDrICvRXl0+yEQKZ7o6fcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id EE87170A2DB8; Thu, 06 Aug 2026 16:24:35 +0200 (CEST)
Date: Thu, 6 Aug 2026 16:24:35 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Ke Sun <sunke@kylinos.cn>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RESEND v13 2/2] rust: fmt: route {:p} through HashedPtr
 to prevent address leaks
Message-ID: <anSZIy78YzTH_CAb@desktop>
References: <20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn>
 <20260706-hashedptr-v13-2-377a07f2f78d@kylinos.cn>
 <anLxCshIflMu-1zI@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anLxCshIflMu-1zI@google.com>
Jabber-ID: linkmauve@linkmauve.fr

On Wed, Aug 05, 2026 at 08:15:06AM +0000, Alice Ryhl wrote:
> On Mon, Jul 06, 2026 at 01:18:44PM +0800, Ke Sun wrote:
> > Define a custom `kernel::fmt::Pointer` trait and `HashedPtr` wrapper
> > so that `{:p}` formatting uses the kernel's `%p` hashed format instead
> > of printing raw pointer values, preventing kernel address space leaks.
> > 
> > Signed-off-by: Ke Sun <sunke@kylinos.cn>
> 
> Overall looks good to me, but one thing:
> 
> > +impl<T: ?Sized> Pointer for HashedPtr<T> {
> > +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> > +        use crate::str::CStrExt as _;
> > +
> > +        let mut buf = [0u8; 32];
> > +
> > +        // SAFETY: `buf` is a valid, writable buffer of 32 bytes, sufficient for all architectures
> > +        // (max 19 bytes for 64-bit). The format string `c"0x%p"` is null-terminated and `%p`
> > +        // matches the pointer argument.
> > +        let len = unsafe {
> > +            crate::bindings::scnprintf(
> > +                buf.as_mut_ptr().cast(),
> > +                buf.len(),
> > +                // Rust's `{:p}` includes a "0x" prefix, the kernel's `%p` does not.
> > +                c"0x%p".as_char_ptr(),
> > +                self.0.cast::<core::ffi::c_void>(),
> > +            )
> > +        };
> 
> When given a null pointer, this will print 0x(null), which seems a bit
> weird. It may also print 0x(ptrval) or 0x(____ptrval____) during early
> boot.

I’ve also seen a bunch of 0x(ptrval) during testing.

This series resolves a mystery where I thought I was crazy since
addresses of pointers and references were never what I thought they
were, and instead were always on the stack, thanks a lot for resolving
this!

Tested-by: Link Mauve <linkmauve@linkmauve.fr>

> 
> It seems like it'd be nice to special-case these to provide better
> output in those cases.
> 
> Alice
> 

-- 
Link Mauve
