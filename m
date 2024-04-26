Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F8A13BC0A
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Apr 2024 07:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714115612; cv=none; b=KBmVCh+wyeiPlTDomcJlqa/E7YJ2GtEiItxqV4XTHSZg3OTiOSuR3ftbvswCMvhbXdeg3id9O5mVo8SHQaiQpt70pQnEycv4CZuiUjT+N2SOhTM1lq2/gJ7qSRC9kLTAryEdHLNMPk9F/cTK0FX8O7rQt1sZ2cVwkR7naykfgYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714115612; c=relaxed/simple;
	bh=k+NB7JMmOJfVGxCrRyXHvyTuixX/Pa9rlRYhz6PsS38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VW+BapWBfw1E85kdSU9W3aWDZbFnmEIZCAFxciBwn/Z/S5vlSujXWP4N/TxZYqX7pfQC9t+qpSZ04gPlMDZFtANSRZXgVMXCXTY/8vq3qaySyknYr8WPxV6dAs1xguKI/J9q+rc3oStrBWNmc2Uk0he6frC4Ure5J6y4irMvr1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ttPfssHo; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ttPfssHo"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-479ef9db155so563112137.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Apr 2024 00:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714115609; x=1714720409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PteTKUkLdI4YjMSnQZKKT6B1AyC9xLcHreBvLXZqBtc=;
        b=ttPfssHodpNnFSOAG610UTxAbpTX/WGrAZErlEBtJfgnKCB2nM+kZj5QoBn6kZ+YpR
         xnBeh88saSs49nB4QFZ2U3ZXd7QwnD0/SGSQL4kjQWHa4BMZYwQVq75NVUAWxBruUVjO
         5oKFc3Jr4G2qqi7Zv2SGyuEmWN1dPqXPEuW8XWKJ1RqFtMX5vWW3jECh+1r0ulcS715F
         BmKbJb6zoQfJFKVc4l1H8JnG6Cg0g31ubkeoRg2o5R3BYkimwLspXKkf5yOL8MSOqktr
         Rvsollo1Mbw0kGncke8VyJglURojXw7JuU4PRAS22k8O/rRHfLyTIVcgwjR1pZ65KRHD
         NJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714115609; x=1714720409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PteTKUkLdI4YjMSnQZKKT6B1AyC9xLcHreBvLXZqBtc=;
        b=VuSYohIybT5MotdZxtAGyXyXZHE9wo13rPav6itOZ+FmMqQWwlQvKSQFgngWDWd3VY
         BA0FJMX0Nx0tquY2cJIrXLwa7cEVlKnTYr4eByAuHU2VQAzhEXCwOke62fNhfv/Gtc30
         Lptx7J7Pv3FDfBn6y1yCvA100DJ6bTH3dgg5bekgyuUolkaqxMb7pp3NoQ/HSQWbSr4g
         sCljueVPbUOMqF4otFdppIY7/34GQvfqV6ANsjdFHPHD5xMlP8ot60bVqsindikGMqCg
         ybh2S2lOi7uJVV+oH9wOMJAHE5uhrtveh6AaD5NuJKqjT9yOCs9gktLxEgtrg2iMEwcH
         s3tg==
X-Forwarded-Encrypted: i=1; AJvYcCVnBAgeFeUKe8ZLmYAK1GG2Dfg11k94L9zZL7hnESicc22Thixm7yOc1hVpvEx1rCyFWJnbPOXhWkpexOoKYACY1mtJmM5k0vTlYSCZHlE=
X-Gm-Message-State: AOJu0YzEO+VDJuShHCjOKgAKRgJW8m/zxiBGZOVOTEFv41JMqfcKlNya
	JGvN9IkkudatyohwfpbiMog/+ahQjyGJf6WOjMY8YwUQqV+5y7QXLB5SCrxHlxiP04g0qqbhLUe
	gmrYwY7GnFgV/dMwQDVZhGu6vOgmmuEG5jKpg
X-Google-Smtp-Source: AGHT+IEY6tPxGSAoyXAMZ9xl7MkAtpE3MXWty6FU1VWiNNbdMvog3QBTWAS/HBT1lxBzTi/ClX+7Jxe7L8pspE2mwbU=
X-Received: by 2002:a05:6102:457:b0:47b:614e:cbd with SMTP id
 e23-20020a056102045700b0047b614e0cbdmr1763298vsq.31.1714115609277; Fri, 26
 Apr 2024 00:13:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240418-alice-mm-v6-0-cb8f3e5d688f@google.com>
 <20240418-alice-mm-v6-3-cb8f3e5d688f@google.com> <20240425171358.54dc96e4@eugeo>
In-Reply-To: <20240425171358.54dc96e4@eugeo>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 26 Apr 2024 09:13:18 +0200
Message-ID: <CAH5fLgjHALMTsWNj_rRBZTgKPTPzWBEo=5VVahS_Vxag-nizPA@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] rust: uaccess: add typed accessors for userspace pointers
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, Trevor Gross <tmgross@umich.edu>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 6:14=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu, 18 Apr 2024 08:59:19 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > Add safe methods for reading and writing Rust values to and from
> > userspace pointers.
> >
> > The C methods for copying to/from userspace use a function called
> > `check_object_size` to verify that the kernel pointer is not dangling.
> > However, this check is skipped when the length is a compile-time
> > constant, with the assumption that such cases trivially have a correct
> > kernel pointer.
> >
> > In this patch, we apply the same optimization to the typed accessors.
> > For both methods, the size of the operation is known at compile time to
> > be size_of of the type being read or written. Since the C side doesn't
> > provide a variant that skips only this check, we create custom helpers
> > for this purpose.
> >
> > The majority of reads and writes to userspace pointers in the Rust
> > Binder driver uses these accessor methods. Benchmarking has found that
> > skipping the `check_object_size` check makes a big difference for the
> > cases being skipped here. (And that the check doesn't make a difference
> > for the cases that use the raw read/write methods.)
> >
> > This code is based on something that was originally written by Wedson o=
n
> > the old rust branch. It was modified by Alice to skip the
> > `check_object_size` check, and to update various comments, including th=
e
> > notes about kernel pointers in `WritableToBytes`.
> >
> > Co-developed-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> > Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> > Reviewed-by: Trevor Gross <tmgross@umich.edu>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
>
> > ---
> >  rust/kernel/types.rs   | 64 ++++++++++++++++++++++++++++++++++++++++
> >  rust/kernel/uaccess.rs | 79 ++++++++++++++++++++++++++++++++++++++++++=
++++++--
> >  2 files changed, 141 insertions(+), 2 deletions(-)
> >
> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> > index 8fad61268465..9c57c6c75553 100644
> > --- a/rust/kernel/types.rs
> > +++ b/rust/kernel/types.rs
> >
> > +/// Types that can be viewed as an immutable slice of initialized byte=
s.
> > +///
> > +/// If a struct implements this trait, then it is okay to copy it byte=
-for-byte to userspace. This
> > +/// means that it should not have any padding, as padding bytes are un=
initialized. Reading
> > +/// uninitialized memory is not just undefined behavior, it may even l=
ead to leaking sensitive
> > +/// information on the stack to userspace.
> > +///
> > +/// The struct should also not hold kernel pointers, as kernel pointer=
 addresses are also considered
> > +/// sensitive. However, leaking kernel pointers is not considered unde=
fined behavior by Rust, so
> > +/// this is a correctness requirement, but not a safety requirement.
> > +///
> > +/// # Safety
> > +///
> > +/// Values of this type may not contain any uninitialized bytes. This =
type must not have interior
> > +/// mutability.
> > +pub unsafe trait AsBytes {}
> > +
> > +// SAFETY: Instances of the following types have no uninitialized port=
ions.
> > +unsafe impl AsBytes for u8 {}
> > +unsafe impl AsBytes for u16 {}
> > +unsafe impl AsBytes for u32 {}
> > +unsafe impl AsBytes for u64 {}
> > +unsafe impl AsBytes for usize {}
> > +unsafe impl AsBytes for i8 {}
> > +unsafe impl AsBytes for i16 {}
> > +unsafe impl AsBytes for i32 {}
> > +unsafe impl AsBytes for i64 {}
> > +unsafe impl AsBytes for isize {}
> > +unsafe impl AsBytes for bool {}
> > +unsafe impl AsBytes for char {}
> > +unsafe impl AsBytes for str {}
> > +// SAFETY: If individual values in an array have no uninitialized port=
ions, then the array itself
> > +// does not have any uninitialized portions either.
> > +unsafe impl<T: AsBytes> AsBytes for [T] {}
>
> nit: I would move `str` to here, since `str` is essentially `[u8]` with
> UTF-8 guarantee.
>
> > +unsafe impl<T: AsBytes, const N: usize> AsBytes for [T; N] {}

Yes ... but the safety comment here talks about arrays and their
individual values. I don't think it transfers cleanly to str, and that
the other safety comment fits str better.

Alice
