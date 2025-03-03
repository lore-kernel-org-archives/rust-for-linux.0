Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E4A20370D
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 12:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741006132; cv=none; b=saAkMIlck6rwiVMIr2Xsq5qtHK6m1oyc+q37e8LuZdnMMO5SAktQndRLOpleFuOMNYeI+pDmxCQB6+gWpQ4g6utyeKVPqvJ7lgXtzunspTZU2pXL/T088pgx8afovxoia3SWF9NqVRC/PW5op0CnusLPncgyLfFtRFfvBNwC5tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741006132; c=relaxed/simple;
	bh=Ap7VISPehZ1h8ChiLkhYDH0PDt5hllEa6WLWSKPZBKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OBo2ircbT/xgp9GLP4HZiPRGuJzWQM9lYHqxjiz2GERmq0IEKi8032eZjX2wZypNZ0JMH+M+G7D1ta2gJs1k8pH5k3WZeXA/k9Z3yM9qdxEV+rccX6Kb3keA+fFV3F2ICSII+f73csIXnlXnqv7CUJ5E2kD+Aahlz12Jm9rvrko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EvmY2Wuj; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EvmY2Wuj"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f488f3161so2672708f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 04:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741006128; x=1741610928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sg3WZnTZz41X0QAeEaOxyqoNAk2XAyD7Gnugh2nZNK8=;
        b=EvmY2Wujp8n9m5NZ8SZbLOsc25LYID4foPsJnnS4fZRWCGZaH9DLlj8z2YMAJXvN4p
         n9hRDlcHkz99qPJx1kg3K09taZdSPzi08K1f4bTyM8aNTZo0ENWn/hLDK3xLEZJmxTQy
         zvNkQ2to/2DXeg5cyf/UBXYtsG2nP8ucoKD1aassC3aIjgzgVhzk+yTI398C37HyE1Mz
         n9cvrt4UAmmWtccdkLmvehbFS13F+/KPyraU4O04eHiVHcexx5zIsHb2IRO2C1YH7mP1
         aaXydIowYtFc+JWTDYZ1IKbjU4h3LL3jmDAnniZIjdMUTp5DbCe6HFXFzcKukdQMfLfS
         Tg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741006128; x=1741610928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sg3WZnTZz41X0QAeEaOxyqoNAk2XAyD7Gnugh2nZNK8=;
        b=I0idIc70we1oZ4vQTTR3f4CGLzvkU/5g/kl7+K7P9KsaCt+t7qVhATLP4+LddhXrs/
         Qu8Ipwu+o0VK65J56M7VLDW948G3gML1/XU6ANX2cUoEBMeySlxDiulPhiwwcsv4KZVB
         Ln1mRy9gephlyeUtsGW3F7ZaoEf6bK2j1owgvO7fW5CWvwSeZ/sYanu5ipxD9CYS2FRb
         BVykJlp1jx/cjg9L+sAHzeb62JL/WTutKSecpFMZHfU8nsd4QU9S6LMEM+YU73vHFlXK
         rTwhCQFJ0d/NQpasaUevIx5xTS/oSIIB4Mx5FBnomu05k35RKDgn/XFm729HZ8jCHrFv
         InMA==
X-Forwarded-Encrypted: i=1; AJvYcCXetRlMtYNxi3On+1YebSKowR0aLCkVf+X6aguTrafpyZEUZIo0BEPFDMcq1oO/meZkJOfwXes9nbbiCExHfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIe1/lg7yYAYKK2OkmoUjbSiBZXz8gOhsLAOMHJAvDOLuSUkA2
	+JO/gaJ4AH5BnFU76yQyuS5dsguHxHm3gzN+KVFdquf7OpQ4jbP2giA0qQnfZO4RMV9jp8iXJdX
	ESoKnpUgvv9Hx3Ju+Hmzy4pja4yWXjIdlTiJE
X-Gm-Gg: ASbGncvRRbymiYYRErfzVkJyvFF4NUoiF3VdLE78Jo3sv+Dd1MnmPWJIr+HUdzm9r+Z
	JMMU4beyB95wFcEulsCmOegVVwKWBiyKIQuGcj7nQB1fQo2/N5KwalC86LORNaPL0qafaBhij5U
	BnfqIrkaYcBscryoC9MWu8YeEbJpEa9RylruvNknYGg++V9zAsZ+G5Jy1h
X-Google-Smtp-Source: AGHT+IFSNqyiTsXEzEylonbWx0Nt3XFtDDDstfy8lcTXYKxwKMVV/Mq0RSuT7hLj7UkIDd3X8btpzwiDKWIzXDrJfOk=
X-Received: by 2002:a5d:5f84:0:b0:38d:dffc:c133 with SMTP id
 ffacd0b85a97d-390eca06e39mr13390327f8f.44.1741006127541; Mon, 03 Mar 2025
 04:48:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303114037.3259804-2-bqe@google.com>
In-Reply-To: <20250303114037.3259804-2-bqe@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 13:48:34 +0100
X-Gm-Features: AQ5f1JoNkOLtsMM-Hsh2X4PIJyTLHKCZJI2T5Y7kzVQDWsF9dVMT7_0M2AfJjmc
Message-ID: <CAH5fLgjPTvXzcSVDWeYN7nLgxMZgeHUbHiDOv4R=uRBG=50UNQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: add bindings and API for bitmap.h and bitops.h.
To: Burak Emir <bqe@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 12:55=E2=80=AFPM Burak Emir <bqe@google.com> wrote:
>
> Adds a Rust bitmap API and necessary bitmap and bitops bindings.
> These are for porting the approach from commit 15d9da3f818c ("binder:
> use bitmap for faster descriptor lookup") to Rust. The functionality
> in dbitmap.h makes use of bitmap and bitops.
>
> The Rust bitmap API provides an abstraction to underlying bitmap
> and bitops operations. For now, we only include methods that are
> necessary for reimplementing dbitmap.h. It is straightforward to add
> more methods later, as needed. We offer a safe API through
> bounds checks which panic if violated.
>
> We introduce bindings for the non-atomic variants __set_bit and
> __clear_bit, and use the _find_* variants instead of the find_*
> wrappers. The C optimizations enabled by the wrappers does not carry
> over to Rust.
>
> This series uses the usize type for sizes and indices into the bitmap,
> because Rust generally always uses that type for indices and lengths
> and it will be more convenient if the API accepts that type. This means
> that we need to perform some casts to/from u32 and usize, since the C
> headers use unsigned int instead of size_t/unsigned long for these
> numbers in some places.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Burak Emir <bqe@google.com>
> ---
> This is v2 of a patch introducing Rust bitmap API [v1]. Thanks
> for all the helpful comments!
>
> Changes v1 --> v2:
> - Rebased on Yury's v2 patch [1] and Viresh's v2 patch [2]
> - Removed import of `bindings::*`, keeping only prefix (Miguel)
> - Renamed panic methods to make more explicit (Miguel)
> - use markdown in doc comments and added example/kunit test (Miguel)
> - Added maintainer section for BITOPS API BINDINGS [RUST] (Yury)
> - Added M: entry for bitmap.rs which goes to Alice (Viresh, Alice)
> - Changed calls from find_* to _find_*, removed helpers (Yury)
> - Use non-atomic __set_bit and __clear_bit from Bitmap Rust API (Yury)
>
> Question to Yury: we could remove `bitmap_copy` helper and instead do
> the memcpy in Rust. Should we? If so, should we expose a helper for
> `bitmap_size` or duplicate the nbits-to-aligned-nlongs logic?
>
> [1] https://lore.kernel.org/all/20250224233938.3158-1-yury.norov@gmail.co=
m/
> [2] https://lore.kernel.org/all/cover.1740726226.git.viresh.kumar@linaro.=
org/
> [v1]: https://lore.kernel.org/all/20250227101720.1811578-1-bqe@google.com=
/
>
> Thanks,
> Burak
>
> ---
>  MAINTAINERS                     |   8 ++
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/bitmap.c           |   8 ++
>  rust/helpers/bitops.c           |  13 +++
>  rust/helpers/helpers.c          |   2 +
>  rust/kernel/bitmap.rs           | 191 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   1 +
>  7 files changed, 224 insertions(+)
>  create mode 100644 rust/helpers/bitmap.c
>  create mode 100644 rust/helpers/bitops.c
>  create mode 100644 rust/kernel/bitmap.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6d6e55d8593b..8f42fb1f24c6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4032,12 +4032,15 @@ F:      tools/lib/find_bit.c
>  BITMAP API BINDINGS [RUST]
>  M:     Yury Norov <yury.norov@gmail.com>
>  S:     Maintained
> +F:     rust/helpers/bitmap.c
>  F:     rust/helpers/cpumask.c
>
>  BITMAP API [RUST]
>  M:     Viresh Kumar <viresh.kumar@linaro.org> (cpumask)
> +M:     Alice Ryhl <aliceryhl@google.com> (bitmap)
>  R:     Yury Norov <yury.norov@gmail.com>
>  S:     Maintained
> +F:     rust/kernel/bitmap.rs
>  F:     rust/kernel/cpumask.rs
>
>  BITOPS API
> @@ -4054,6 +4057,11 @@ F:       include/linux/bitops.h
>  F:     lib/test_bitops.c
>  F:     tools/*/bitops*
>
> +BITOPS API BINDINGS [RUST]
> +M:     Yury Norov <yury.norov@gmail.com>
> +S:     Maintained
> +F:     rust/helpers/bitops.c
> +
>  BLINKM RGB LED DRIVER
>  M:     Jan-Simon Moeller <jansimon.moeller@gmx.de>
>  S:     Maintained
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 673b1daa9a58..50416c1a3de9 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -7,6 +7,7 @@
>   */
>
>  #include <kunit/test.h>
> +#include <linux/bitmap.h>
>  #include <linux/blk-mq.h>
>  #include <linux/blk_types.h>
>  #include <linux/blkdev.h>
> diff --git a/rust/helpers/bitmap.c b/rust/helpers/bitmap.c
> new file mode 100644
> index 000000000000..4fa4e4f76110
> --- /dev/null
> +++ b/rust/helpers/bitmap.c
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/bitmap.h>
> +
> +void rust_helper_bitmap_copy(unsigned long *dst, const unsigned long *sr=
c, unsigned int nbits)
> +{
> +       bitmap_copy(dst, src, nbits);
> +}

I was about to say that this could just be a memcpy, but ...

> +    /// Copy up to `nbits` bits from this bitmap into another.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `nbits` is too large for this bitmap or destination.
> +    #[inline]
> +    pub fn bitmap_copy(&self, dst: &mut Bitmap, nbits: usize) {
> +        if self.nbits < nbits {
> +            panic_not_in_bounds_le("nbits", self.nbits, nbits);
> +        }
> +        if dst.nbits < nbits {
> +            panic_not_in_bounds_le("nbits", dst.nbits, nbits);
> +        }
> +        // SAFETY: nbits =3D=3D 0 is supported and access to `self` and =
`dst` is within bounds.
> +        unsafe { bindings::bitmap_copy(dst.as_mut_ptr(), self.ptr.as_ptr=
(), nbits as u32) };
> +    }

... then I realized that we're probably not using it correctly. I
would expect this to modify the first `nbits` bits in `dst`, leaving
any remaining bits unmodified. However, if nbits is not divisible by
BITS_PER_LONG it might modify some bits it shouldn't.

That said, Binder needs this only in the case where the sizes are
equal. Perhaps we could rename this to `copy_from_bitmap` with this
signature:
fn copy_from_bitmap(&mut self, src: Bitmap)

and have the function require that the sizes are equal. This mirrors
the standard library function copy_from_slice that takes two slices
that must have the exact same size and copies the contents.

Alice
