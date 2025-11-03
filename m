Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650F5126BF1
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Nov 2025 02:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762136260; cv=none; b=uIl8ViUvKrqAcSrJJFfrrnBPT4BAhfg+0fxZFDEo8BbB9tV+UYj/WG5JJ2BowDRe3udJjOsGjGgBass05bdm9HlSpUiX6+l7Or1XDvZutvZeyJRcp2Pn2piEG82EH59fnMssTVkfOeO9rgBWMJo+OIvTxVSDPkvUsWinSx8IZac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762136260; c=relaxed/simple;
	bh=F3ZgcfA13fgnBgxNIff9RS73VUalxiZK9ts7h3+HfQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTonkAghdp3SZJ1M3pJ75Gx7YOErLvHC5m4q3++hXfPTwg3LzXgnY2yc7nhbFCaH4PjcS8PS/Ygk8Izs2W0Cdbbeyxk/mnFIZ/2ZGLv+Sd/j4x7+AKlhKSlnrINZXK4ouHbuSLeZ3SDy0ew71bL8FilB28MVfsdeRaT2COzY5QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELtI6Hb/; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELtI6Hb/"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-63f5c80eebdso3983985d50.0
        for <rust-for-linux@vger.kernel.org>; Sun, 02 Nov 2025 18:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762136257; x=1762741057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ctjnEIikXqfv5kNJxXpYhtFaIeFEVp3JcIWOGnMwmcc=;
        b=ELtI6Hb/JVzTZwoLGlY2ycBDnhl7eTln7H+KyoAdkN/CFCHHdy/tTtsWiM9HECrdDv
         XQznIfvGkQhqpMz02gNur7ZV2qnfulWEvxSYpzpPX+zQjBzHM0SASWrdgTzKv3vNkFKH
         yOmwVixQOWmUf2WFMZ7g800jH1TpF2/E+o9zmGxrd7ZUaJuLRZTwd9ns/st7V9jyVDrB
         I4wsEZ6kVLOgrkSdaUvDrBK6S+oDMndFM/m1FRbeANnxOG6IOrqa5spnT27tXQaeKv7c
         9bViiM7k4gcqS07+CIrCeZmuliOgg1PMPLloyn9gCKLPCsBj3u0x6mVKPNx6BooUeQUb
         XWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762136257; x=1762741057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctjnEIikXqfv5kNJxXpYhtFaIeFEVp3JcIWOGnMwmcc=;
        b=TKnjo6yM1Dnd5+EMT3xr/LVtaQrDyKZxnKTLsxQxyL3yXulm5rqzxIJCktw35ecebF
         A29wDGusX3P4n7WvjW9PDpeY/2j8NFQevgFINkGEAJgJrStIqN0GXBt1+DHUPk8UG34P
         JcsIljiUQHaeahsQOZ0wJafxM5d6sNA5ncAbcS7ea8xNd2jwEmOk1RYjWlAsq2eqn87a
         w67mKXBWtBenOFfR65PSax4qKCaS4uF3melWWd+IoL4TQMN+qrPsMVCZFc9A1BP1Z+j5
         XixxiZBxoD7fwUtbpPPRsWW0uy0d4S8yRM/U0+CftHNUqKqadYT5iyJP0UL/jdqvzCn1
         C/ug==
X-Forwarded-Encrypted: i=1; AJvYcCXnNRGuAytsWr+NGbGpzmKWJyWEJ4KOutwCcB6OIr+qDytBITSQM3e75T0dB9sO12nlLFCvaTbwH9+ipnYpeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6oMYAF5D2dp1IZSw951581zNhMPHyrdsmRLYyC0LU9+1UOx9f
	PJB1OYoyImqNryZ3msMe8yuNRVb9YjtsbLNEmn0u4AYcv3+4tELN02P9+ybq8Q==
X-Gm-Gg: ASbGnctHUpE8uVTiJZvRe2bijwFwHVGIei1bdS4cAjzwG+U9INSMKnmpDRgVuUTdu2M
	UHvzLV0Md/RC5euiUhU7bApoEBvThS+6ezYq8koR0QAAht5WRvS7GmWoSVKFxOPmcGQ1KpFTbo9
	SnzVNT2VEo6r0NFzZikYo3bPO/NzFEu+L0UVbyM01MasQ+dBkzhegqCCey3TVdmDV8VSdwzC3c3
	8xyeohv1uyirwl5vs9Ie2KKtQpDoTa3N99dz+nwb+bk5peN38FvoFHtFrhfY3LNi0DzpqyfoijE
	OGM2DRj9GrlmLADrlfCxWFJBptpPwRfkSrgMKHYKpBReZtSATCuwd9Mtj3xXOE9jSbJUv6YD0DX
	rzN/CXu3akK/7ddoREi5r1ZtBIGqNOV+YUQT+krs5M2wSr8WfU7k6tgFTgF63/oTpQReHRbbChU
	dAaRkgf9u3QLH7hdxkdfE9Qdw9H+gH7hv/b5X+5SqCsVSFiYdapbUtKQ==
X-Google-Smtp-Source: AGHT+IFmJEXD8Y+48yREcmRCznLGT9AO3ztvCI5onkhBTwzSaX1WEuvemOJCdpKnfwEJjbln7jTJNA==
X-Received: by 2002:a53:d008:0:b0:63f:ae41:fbbd with SMTP id 956f58d0204a3-63fae4207f3mr3470702d50.8.1762136257216;
        Sun, 02 Nov 2025 18:17:37 -0800 (PST)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7864ba82d3bsm26409417b3.4.2025.11.02.18.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 18:17:36 -0800 (PST)
Date: Sun, 2 Nov 2025 21:17:35 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Jesung Yang <y.j3ms.n@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: add BitInt integer wrapping type
Message-ID: <aQgQv6F0Ao4DH6U0@yury>
References: <20251031-bounded_ints-v1-0-e2dbcd8fda71@nvidia.com>
 <20251031-bounded_ints-v1-1-e2dbcd8fda71@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-bounded_ints-v1-1-e2dbcd8fda71@nvidia.com>

On Fri, Oct 31, 2025 at 10:39:57PM +0900, Alexandre Courbot wrote:
> Add the `BitInt` type, which is an integer on which the number of bits
> allowed to be used is restricted, capping its maximal value below that
> of primitive type is wraps.
> 
> This is useful to e.g. enforce guarantees when working with bit fields.
> 
> Alongside this type, provide many `From` and `TryFrom` implementations
> are to reduce friction when using with regular integer types. Proxy
> implementations of common integer traits are also provided.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/lib.rs        |   1 +
>  rust/kernel/num.rs        |  75 ++++
>  rust/kernel/num/bitint.rs | 896 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 972 insertions(+)
 
...

> +/// Evaluates to `true` if `$value` can be represented using at most `$num_bits` on `$type`.
> +///
> +/// Can be used in const context.
> +macro_rules! fits_within {
> +    ($value:expr, $type:ty, $num_bits:expr) => {{
> +        // Any attempt to create a `BitInt` with more bits used for representation than its backing
> +        // type (i.e. create an invalid `BitInt`) must be aborted at build time.
> +        build_assert!(
> +            <$type>::BITS >= $num_bits,
> +            "Number of bits requested for representation is larger than backing type."
> +        );
> +
> +        let shift: u32 = <$type>::BITS - $num_bits;
> +        let v = $value;
> +
> +        // The value fits within `NUM_BITS` if shifting it left by the number of unused bits, then
> +        // right by the same number, doesn't change the value.
> +        //
> +        // This method has the benefit of working with both unsigned and signed integers.
> +        (v << shift) >> shift == v

In C it doesn't work:

        int c = 0x7fffffff;
        printf("%x\t%x\n", c, (c << 1) >> 1); // 7fffffff	ffffffff

Neither in rust:   

        let c: i32 = 0x7fffffff;
        println!("{} {}", c, (c << 1) >> 1);  // 2147483647 -1

Or I misunderstand something?

> +    }};
> +}
> +
> +/// Trait for primitive integer types that can be used to back a [`BitInt`].
> +///
> +/// This is mostly used to lock all the operations we need for [`BitInt`] in a single trait.
> +pub trait Boundable
> +where
> +    Self: Integer
> +        + Sized
> +        + Copy
> +        + core::ops::Shl<u32, Output = Self>
> +        + core::ops::Shr<u32, Output = Self>
> +        + core::cmp::PartialEq,
> +    Self: TryInto<u8> + TryInto<u16> + TryInto<u32> + TryInto<u64>,
> +    Self: TryInto<i8> + TryInto<i16> + TryInto<i32> + TryInto<i64>,
> +{
> +    /// Returns `true` if `value` can be represented with at most `NUM_BITS` on `T`.
> +    fn fits_within(value: Self, num_bits: u32) -> bool {
> +        fits_within!(value, Self, num_bits)
> +    }
> +}
> +
> +/// Inplement `Boundable` for all integers types.
> +impl<T> Boundable for T
> +where
> +    T: Integer
> +        + Sized
> +        + Copy
> +        + core::ops::Shl<u32, Output = Self>
> +        + core::ops::Shr<u32, Output = Self>
> +        + core::cmp::PartialEq,
> +    Self: TryInto<u8> + TryInto<u16> + TryInto<u32> + TryInto<u64>,
> +    Self: TryInto<i8> + TryInto<i16> + TryInto<i32> + TryInto<i64>,
> +{
> +}
> +
> +/// Integer type for which only the bits `0..NUM_BITS` are valid.
> +///
> +/// # Invariants
> +///
> +/// Stored values are represented with at most `NUM_BITS` bits.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::num::BitInt;
> +///
> +/// // An unsigned 8-bit integer, of which only the 4 LSBs can ever be set.
> +/// // The value `15` is statically validated to fit within the specified number of bits.
> +/// let v = BitInt::<u8, 4>::new::<15>();

What for do you make user to declare the storage explicitly? From
end-user perspective, declaring 4-bit variable must imply the most
suitable storage... C version of the same doesn't allow user to select
the storage as well:

        _BitInt(4) x = 8;

I can't think out any useful usecase for this... I believe that the
optimal storage must be chosen by implementation. And it may even be
different for different arches.

> +/// assert_eq!(v.get(), 15);
> +///
> +/// let v = BitInt::<i8, 4>::new::<-8>();
> +/// assert_eq!(v.get(), -8);
> +///
> +/// // This doesn't build: a `u8` is smaller than the requested 9 bits.
> +/// // let _ = BitInt::<u8, 9>::new::<10>();
> +///
> +/// // This also doesn't build: the requested value doesn't fit within the requested bits.
> +/// // let _ = BitInt::<i8, 4>::new::<8>();
> +///
> +/// // Values can also be validated at runtime. This succeeds because `15` can be represented
> +/// // with 4 bits.
> +/// assert!(BitInt::<u8, 4>::try_new(15).is_some());
> +/// // This fails because `16` cannot be represented with 4 bits.
> +/// assert!(BitInt::<u8, 4>::try_new(16).is_none());

Nice! Maybe .is_overflow() instead of .is_none(), so that user will
know that the variable contains truncated value. Just like C does.

Can you please print the exact error that user will get on compile-
and runtime? How big is the cost of runtime test for overflow? If it
is indeed nonzero, can you consider making the runtime part
configurable?

> +/// // Non-constant expressions can also be validated at build-time thanks to compiler
> +/// // optimizations. This should be used as a last resort though.
> +/// let v = BitInt::<u8, 4>::from_expr(15);

Not sure I understand that. Can you confirm my understanding?

1. For compile-time initialization I use BitInt::<i8, 4>::new::<8>();
2. For compile- or runtime initialization: BitInt::<i8, 4>::from_expr(val);
3. For runtime-only initialization: BitInt::<i8, 4>::try_new(val);

In this scheme #3 looks excessive...

> +/// // Common operations are supported against the backing type.
> +/// assert_eq!(v + 5, 20);
> +/// assert_eq!(v / 3, 5);

No, v + 5 == 20 for a different reason. There's nothing about 'backing
storage' here.

v + 5 should be 20 because addition implies typecasting to the wider
type. In this case, 20 is numeral, or int, and BitInt(4) + int == int.

I tried C23, and it works exactly like that:

    unsigned _BitInt(4) x = 15;

    printf("%d\n", x + 5);                              // 20
    printf("%d\n", x / 3);                              // 5
    printf("%d\n", x + (unsigned _BitInt(4))5);         // 4
    x += 5;
    printf("%d\n", x);                                  // 4

Rust _must_ do the same thing to at least be arithmetically
compatible to the big brother. 

It makes me more confident that this 'backing storage' concept
brings nothing but confusion.

> +/// // The backing type can be changed while preserving the number of bits used for representation.
> +/// assert_eq!(v.cast::<u32>(), BitInt::<u32, 4>::new::<15>());
> +///
> +/// // We can safely extend the number of bits...
> +/// assert_eq!(v.extend::<5>(), BitInt::<u8, 5>::new::<15>());
> +/// // ... but reducing the number of bits fails here as the value doesn't fit anymore.
> +/// assert_eq!(v.try_shrink::<3>(), None);

Not sure what for you need this. If I need to 'extend', I just assign
the value to a variable:

        BitInt(3) a = 3;
        BitInt(10) b;
        int c;

        b = a + 123;    // extend
        c = b;          // another extend

How would this 'extend' and 'shrink' work with arrays of BitInts?

> +/// // Conversion into primitive types is dependent on the number of useful bits, not the backing
> +/// // type.
> +/// //
> +/// // Event though its backing type is `u32`, this `BitInt` only uses 8 bits and thus can safely
> +/// // be converted to a `u8`.
> +/// assert_eq!(u8::from(BitInt::<u32, 8>::new::<128>()), 128u8);

'Backing type' is useless here too.

> +/// // The same applies to signed values.
> +/// asserkkt_eq!(i8::from(BitInt::<i32, 8>::new::<127>()), 127i8);
> +///
> +/// // This however is not allowed, as 10 bits won't fit into a `u8` (regardless of the actually
> +/// // contained value).
> +/// // let _ = u8::from(BitInt::<u32, 10>::new::<10>());

If I explicitly typecast from a wider type, please just let me do
that. In the above examples you show that .is_some() and .is_none()
can help user to check for overflow if needed.

Otherwise, user will hack your protection by just converting
BitInt(8) to u32, and then to BitInt(10).

Thanks,
Yury
