Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB971381BD
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Apr 2024 05:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713246815; cv=none; b=pQFvWsEzls3gXIkc5WBgMFBshfw/k1CowCPT1tSCjk8dazReB4R49CHpl/ZqGOMOi2mVIdqfl4Y0gpFpKhc4nPgDIx9IloptqVJOHsoWPbNzNwc6EgDE1s60X5ypRoMnSsyxwJmNoGqsvCK8nf0HccTLPHbTCWYZLeiWXHcjsy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713246815; c=relaxed/simple;
	bh=YHXTxo+dMZMqRkcn1P10yAEdeONTVjYOCpBdu90ZcBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyNJWF+Tf0FuFZgvgxQL7Wi3FepZi53rdsAB9VX19JId4lw380hu26jXJ0h8VzefW6rbJXlOjIN/zw3Ttajz9OQFDS1J52XOhDlTXOBgZ126SCNo8AfjsZPLVnqnQ+DbGkgOAXcH4qrmzvKLAmjKEicUOc6n1Uhx/kIz/KDCLQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=IQiSqnAT; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="IQiSqnAT"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so4657718276.0
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Apr 2024 22:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1713246813; x=1713851613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOqlvnKucywUEZPZVlRG+mSpGLeAjqCUUNbMfAp62nk=;
        b=IQiSqnATipRUDpTjkbms8g6PFOyCeg4j7QSq4Eer6O59AsqcTxOVyHzN66yo4+sb1d
         /P4njxSPo8oFD/Szwh07keyJzjk5eCUaPStRK2QhL+FkL5GAQIKbKeQb6ogU6PnPJB48
         6aQshPfvRgp9w7W9xqT822hoIeI/V8ErcoRSchdPiYaqzkgaAPNFPmmGo+zmScmR57p9
         rfnuTd5j9OHZy+Ln2r05qAfNZ+NdBcEMg7T4KAU26UV1Kv70nRSs8VXORxa2kdWBJEuH
         X/KymTWhgCaw0dOODuhUfiIgPb7ASimr8kIuB34jOmXVG8yPlErCq7JC9y8wpjzJLXD3
         wULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713246813; x=1713851613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOqlvnKucywUEZPZVlRG+mSpGLeAjqCUUNbMfAp62nk=;
        b=VIk3XSaZaTunFixl3Xl//zcnDe/z27ZXZjqbTwN4RUCllSU0FbQQBiJLedTdHdG1UW
         7+PURpC5i7XzYB3Y+gQOyFG7hjMygj/VCBuRxym4Z5LYLvkwhVhvTFOwcdVkGSteS0Rg
         UjQw0rnNsSl2h+ltljCwQH91T4+yACHZNEsz8Epusj7IZJ1sztMo5bVUfoBc8chnzSrF
         YapBdNudF3r++wA2AAk3WPIZd9If8HWlv+aVkSH9nwRka1HSEQ6DcdXc3YfgYE8G+m/h
         sZ5DdUZ94ipIgpTUn8rrcPbsI6F8O37dSShWTNlmnrwpegtToH67ECwe+Cb1DdVCz6xF
         bPIw==
X-Forwarded-Encrypted: i=1; AJvYcCXKQqPGvoHxIUnVi6ZL1xUfpTHq2vE2250qQ5IuFek04lKnSrQM5qeGXpcyYv35XVtsuAqIgZIjs4zTi30fVwIkUyqbc54gh3eqjgVT6l0=
X-Gm-Message-State: AOJu0YzIMLl5AXt1gS7SogXhk+cwKhFFWZpViiA8JzVpMB8l3yp64cbU
	WRItzT4k08n9V1fjL3kNSUaIS075lw48b2Pdi5N1tZym2Ce7GzkrOQDmw70kuXhjjjF/c7UOYu9
	RETjB1fIauh04TyBVdfG70ofpdrPvCRXnyXWgpQ==
X-Google-Smtp-Source: AGHT+IEk4cS/dQD+EYvxY5dx55Tkwtvot6iZduodfKV8e4eY/Ded+reARURG0wd/8TQWyTEpiJDKGNwvHHvzNoyWrEc=
X-Received: by 2002:a25:1fd6:0:b0:dc6:de93:7929 with SMTP id
 f205-20020a251fd6000000b00dc6de937929mr1415768ybf.26.1713246812640; Mon, 15
 Apr 2024 22:53:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415-alice-mm-v5-0-6f55e4d8ef51@google.com> <20240415-alice-mm-v5-3-6f55e4d8ef51@google.com>
In-Reply-To: <20240415-alice-mm-v5-3-6f55e4d8ef51@google.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 16 Apr 2024 01:53:21 -0400
Message-ID: <CALNs47vkeAeU5jGk2AV_w0oRfPCiXzcWTGO_bauCnSsqQTX-iA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] rust: uaccess: add typed accessors for userspace pointers
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 3:15=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Add safe methods for reading and writing Rust values to and from
> userspace pointers.
>
> The C methods for copying to/from userspace use a function called
> `check_object_size` to verify that the kernel pointer is not dangling.
> However, this check is skipped when the length is a compile-time
> constant, with the assumption that such cases trivially have a correct
> kernel pointer.
>
> In this patch, we apply the same optimization to the typed accessors.
> For both methods, the size of the operation is known at compile time to
> be size_of of the type being read or written. Since the C side doesn't
> provide a variant that skips only this check, we create custom helpers
> for this purpose.
>
> The majority of reads and writes to userspace pointers in the Rust
> Binder driver uses these accessor methods. Benchmarking has found that
> skipping the `check_object_size` check makes a big difference for the
> cases being skipped here. (And that the check doesn't make a difference
> for the cases that use the raw read/write methods.)
>
> This code is based on something that was originally written by Wedson on
> the old rust branch. It was modified by Alice to skip the
> `check_object_size` check, and to update various comments, including the
> notes about kernel pointers in `WritableToBytes`.
>
> Co-developed-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Couple of docs nits but this looks good to me.

Reviewed-by: Trevor Gross <tmgross@umich.edu>

> +/// Types for which any bit pattern is valid.
> +///
> +/// Not all types are valid for all values. For example, a `bool` must b=
e either zero or one, so
> +/// reading arbitrary bytes into something that contains a `bool` is not=
 okay.
> +///
> +/// It's okay for the type to have padding, as initializing those bytes =
has no effect.
> +///
> +/// # Safety
> +///
> +/// All bit-patterns must be valid for this type.
> +pub unsafe trait FromBytes {}

No `UnsafeCell` is also a requirement in zerocopy/bytemuck

> +/// Types that can be viewed as an immutable slice of initialized bytes.
> +///
> +/// If a struct implements this trait, then it is okay to copy it byte-f=
or-byte to userspace. This
> +/// means that it should not have any padding, as padding bytes are unin=
itialized. Reading
> +/// uninitialized memory is not just undefined behavior, it may even lea=
d to leaking sensitive
> +/// information on the stack to userspace.
> +///
> +/// The struct should also not hold kernel pointers, as kernel pointer a=
ddresses are also considered
> +/// sensitive. However, leaking kernel pointers is not considered undefi=
ned behavior by Rust, so
> +/// this is a correctness requirement, but not a safety requirement.

I don't think mentions of userspace are relevant here since the trait
is more general. Maybe a `# Interfacing with userspace` section if
there is enough relevant information.

> +/// # Safety
> +///
> +/// Values of this type may not contain any uninitialized bytes.

No UnsafeCell

> +pub unsafe trait AsBytes {}

> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index c97029cdeba1..e3953eec61a3 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -4,10 +4,15 @@
>  //!
>  //! C header: [`include/linux/uaccess.h`](srctree/include/linux/uaccess.=
h)
>
> -use crate::{bindings, error::code::*, error::Result};
> +use crate::{
> +    bindings,
> +    error::code::*,
> +    error::Result,
> +    types::{AsBytes, FromBytes},
> +};
>  use alloc::vec::Vec;
>  use core::ffi::{c_ulong, c_void};
> -use core::mem::MaybeUninit;
> +use core::mem::{size_of, MaybeUninit};
>
>  /// A pointer to an area in userspace memory, which can be either read-o=
nly or read-write.
>  ///
> @@ -238,6 +243,38 @@ pub fn read_slice(&mut self, out: &mut [u8]) -> Resu=
lt {
>          self.read_raw(out)
>      }
>
> +    /// Reads a value of the specified type.
> +    ///
> +    /// Fails with `EFAULT` if the read encounters a page fault.
> +    pub fn read<T: FromBytes>(&mut self) -> Result<T> {
> [...]
> +    /// Writes the provided Rust value to this userspace pointer.
> +    ///
> +    /// Fails with `EFAULT` if the write encounters a page fault.
> +    pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {

Read & write could use an example if you are up for it
