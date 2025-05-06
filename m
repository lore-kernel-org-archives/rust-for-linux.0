Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EF5267B15
	for <rust-for-linux@vger.kernel.org>; Tue,  6 May 2025 09:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523127; cv=none; b=Cu/vye0JkCK7EfzpDVQ2sIE4azII9hi74kNQeuaGeVTr7jpHayr2YYDpBV0cPXaRalTfshq+P/HE+ymYxyTQDq1jBdAaGn6f1Da0pOqvDObLa/dD74ajpW+8umho6JJ+cea8xipT6JJiav3RS+7LcutsRlZos2XfaMLG+LIMZLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523127; c=relaxed/simple;
	bh=E17ZjcvNnE3gAHLsWjbhAU+S/T/HGrIZaGnxTG4pkM0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JiJH0cG+EcTBVxRpN993EnixA1SJ8eTCW2f8jzz7WOkttRxjgwFW5ooxCL4Y9oltgjEYXUnGQuL8CQgqzADQtXpYNZQBqwHkvIG8OGJ7TQpCImIkC4RrcdEvTXez2fTKBdS1jY9LBwXo1axCr/kIxzEM+3RXtwHBQgwdkQw1XHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PbnFn24S; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PbnFn24S"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d08915f61so27530205e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 06 May 2025 02:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746523124; x=1747127924; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AiYBfuBPq0PKabiO1M3oY2RQ97WInUw/jmCaL8pZJF0=;
        b=PbnFn24S6qB0mavg4HYzbbEZ0E0Q3aL4cQx7wrXMOPfw2jmYRtnYPqvWKw6bWht7xc
         FSU9wJt1vTkD0DDnHMPT52p4jCGJnUqPVKCHFV1JSiDZ+rG1OrRh1QkvJM9q9ML2GNWn
         RCEjgEQYt0riXvoJWl4apS1hbYDDWQDkXAjNBt6MiGV1Mxkgtk6gAm0wGaCRi2kaXW5O
         ziks9CXQZTEl1xgX7Doq9j7x5u2gidR1Kpa26ObaBdrc3VNO17gV/dJVdcmEMGDIykaO
         m943z5svna4nP3aM0rTGmVRVGfwUC4tnkA2vPXIjcqPOBM6K2zlRwhUfOdYuRJ0pH0Fm
         Q+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523124; x=1747127924;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AiYBfuBPq0PKabiO1M3oY2RQ97WInUw/jmCaL8pZJF0=;
        b=dRi2N+xQQsefZeT9NHhd3Nutevvy7QsRvJkpRoVbjxWqN/5AJv8q2zjT+Je58Gue2k
         WO0ryKdQLP+y2q7/EONE0zZe2WyDkHZd06pgag3F9A3EtVxqzSVKGH49vreOG4hTFcW+
         8LSuDELBvwqmSjlAvZwapxyLmwBlFbhIc+7KUn14Dh1Qo8aXz2jos5XEGiaWc2TtryZ7
         JReOp6YtFn8ChgU20Y4qPUEy3YsQVrIEaQV4EnWuRXEVwKIPF0H2fhWqEgekuiLTVQGG
         TriHPJt2XtoFYVQni5nlFagfYoeSSrAMkARL1vslpfa7EROlrNBZ7oIR40LKJUjRHb4I
         M/Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUC/zkMJrIL00OzQLjs9FOn4gfavJH720fso7p0Oq19AkMSmySwZt1+bZEE38YGPVbcOSaBTLLXzAdYkC+wwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo2zTodhfzT3ZRx/8vHS4QGnqGWmb5gqOX6ksAJ6WH5u36O3Wa
	LoTfLNQRlfxQAt4SggD+Mshbq5O33CW+WkM17TBxuBsv7pUF0enarhM0+D5nDMGKRsn/Fejn8tt
	6/Xk+Fp3plLdl0w==
X-Google-Smtp-Source: AGHT+IFUIi/aIrJ+YBlE4GZq9QhM4TQhjCYLMqpNPEPZ/dnhztAF0TRSuK+vVuzlXWZ0B183nyofXeU+L1JIfzI=
X-Received: from wmsp15.prod.google.com ([2002:a05:600c:1d8f:b0:43d:56fa:9b95])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3c90:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-441c48bdfdamr99780575e9.14.1746523123132;
 Tue, 06 May 2025 02:18:43 -0700 (PDT)
Date: Tue, 6 May 2025 09:18:41 +0000
In-Reply-To: <2025050544-sneak-compactor-d701@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505-strncpy-from-user-v3-0-85c677fd4f91@google.com>
 <20250505-strncpy-from-user-v3-1-85c677fd4f91@google.com> <2025050544-sneak-compactor-d701@gregkh>
Message-ID: <aBnT8Y3lJqd6J40q@google.com>
Subject: Re: [PATCH v3 1/2] uaccess: rust: add strncpy_from_user
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, May 05, 2025 at 04:30:05PM +0200, Greg Kroah-Hartman wrote:
> On Mon, May 05, 2025 at 12:17:31PM +0000, Alice Ryhl wrote:
> > This patch adds a direct wrapper around the C function of the same name.
> > It's not really intended for direct use by Rust code since
> > strncpy_from_user has a somewhat unfortunate API where it only
> > nul-terminates the buffer if there's space for the nul-terminator. This
> > means that a direct Rust wrapper around it could not return a &CStr
> > since the buffer may not be a cstring. However, we still add the method
> > to build more convenient APIs on top of it, which will happen in
> > subsequent patches.
> > 
> > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/uaccess.rs | 35 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 34 insertions(+), 1 deletion(-)
> > 
> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > index 80a9782b1c6e98ed6eae308ade8551afa7adc188..a7b123915e9aa2329f376d67cad93e2fc17ae017 100644
> > --- a/rust/kernel/uaccess.rs
> > +++ b/rust/kernel/uaccess.rs
> > @@ -8,7 +8,7 @@
> >      alloc::{Allocator, Flags},
> >      bindings,
> >      error::Result,
> > -    ffi::c_void,
> > +    ffi::{c_char, c_void},
> >      prelude::*,
> >      transmute::{AsBytes, FromBytes},
> >  };
> > @@ -369,3 +369,36 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
> >          Ok(())
> >      }
> >  }
> > +
> > +/// Reads a nul-terminated string into `buf` and returns the length.
> > +///
> > +/// This reads from userspace until a NUL byte is encountered, or until `buf.len()` bytes have been
> > +/// read. Fails with [`EFAULT`] if a read happens on a bad address (some data may have been
> > +/// copied). When the end of the buffer is encountered, no NUL byte is added, so the string is
> > +/// *not* guaranteed to be NUL-terminated when `Ok(buf.len())` is returned.
> > +///
> > +/// # Guarantees
> > +///
> > +/// When this function returns `Ok(len)`, it is guaranteed that the first `len` of `buf` bytes are
> > +/// initialized and non-zero. Furthermore, if `len < buf.len()`, then `buf[len]` is a NUL byte.
> > +/// Unsafe code may rely on these guarantees.
> > +#[inline]
> > +#[expect(dead_code)]
> > +fn raw_strncpy_from_user(ptr: UserPtr, buf: &mut [MaybeUninit<u8>]) -> Result<usize> {
> 
> Nit, the parameters here are backwards from the C version of
> strncpy_from_user(), which is going to cause us no end of grief when
> reviewing code between the two languages :(

I'll swap them.

fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> Result<usize> {

> Also, it's not your fault, but we don't have any type of __user tag for
> data coming from userspace yet to track this type of thing?  The
> compiler (well sparse) can catch this type of thing in C, any hints on
> what we could do in Rust for the same type of guarantee (i.e. don't
> touch user data before it's been copied, and then we need to treat it as
> "unverified" but that's a different patch series...)

The UserPtr typedef is intended to do that, but since it's only a
typedef to usize, the compiler won't detect it if you mix up a user
pointer with a length. (It will detect mix-ups with pointers since we
use an integer type for UserPtr.)

What we can do is replace the typedef with

#[repr(transparent)]
struct UserPtr(pub usize);

That way, it becomes it's own separate type (this is called the newtype
pattern [1]) so that it can't be mixed up with anything else.

The #[repr(transparent)] annotation makes the compiler treat it like a
bare long for ABI-purposes. I'm not sure if any function ABIs actually
treat a long differently from a struct that just contains a long, but if
such ABIs exist, then the annotation ensures that the long ABI is used
rather than the struct-containing-long ABI.

Alice

[1]: https://doc.rust-lang.org/rust-by-example/generics/new_types.html
