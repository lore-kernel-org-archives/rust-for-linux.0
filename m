Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46CC1D61B1
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jan 2025 19:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738092594; cv=none; b=sNJCuMSclh9/P0myjd4li9JhFLIyWFvT9c8Y6VE14xR5Lh1r7QXSuT6ZZ+4TSCN4b89c5LO7YJ1/KkKhCAg5wiwSpTb+vVBon/+Zuai0UHCZiLE2pzNq2jkoHPqeOvstH6IADMXHqibtxP64076XPB5zwroPp8Bt81oYUEib5LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738092594; c=relaxed/simple;
	bh=XZDSZDvTjJLJ2HmGqWdO9GWhj7wfB4VxHKiTQA+5WPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OVS8uOl+pbVUPSpnRuJtZmEi/W83pMnIXdu6ws7saRrHBZeE+ZGxS0Td+AdjMSHm85M5Ev1Uy6n+7K/AKcjipXyuRj8vB9QqzrgfN9HVME+ewoTg3pWznjHpnEG98+Zb9GEf0yjOHrZSyI++ae5MccKGvtdcXWXAIock7nujk6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=u8Jz6Djv; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="u8Jz6Djv"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaf6b1a5f2bso1422128166b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Jan 2025 11:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1738092591; x=1738697391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AgyKNhdhEc6YNqdyt39WyTdk5mKqwPFUjqr9KV2Vglc=;
        b=u8Jz6DjvLaDGR8BXJ+C0DRXUCQiomaB5PyVeHZ3tMm1xoFPT2STtPLBckQDi5Fs0/X
         kVZ1Mo51yt+6KoXjURBoHkrRDs9SRnlRxfOSejdezscdwkkpUvA6yT3kEL2bI8DLacnE
         MLfPKNIa7FLmLBXzJbCpM3oLalya4eMS7cSCSPlcIWqBRewy7OGOt/ejIxpu9gW6HXLl
         Z8Yt3ZKrU4hVp4S7g250+mxtFTyaj3LJqwAtXgqKArzPj8Yd68BTJJ2JwanjurWncnOK
         daouxKEmPsH9YcrCxrwCz6PqFoUcySr06NNfLX19TGM3Bv9fDMKcpjh+3S+dKyLJA4aG
         nfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738092591; x=1738697391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AgyKNhdhEc6YNqdyt39WyTdk5mKqwPFUjqr9KV2Vglc=;
        b=hZC6mdGPsjMH5CVO89nqmKhyNqRjGzU12S5VQtRxnBh6RtcdGWwhbFLRQcQnGnBOE7
         RzCJnbhwOs94fRl1GwTgzMsj1+vaHpStpOFDmdVlDBifJ3Us6wmfNbV9UhoqkRcx8X2p
         334A0QW+0Dtml4gODZkdnPWMgGEBJLKTZgaMGOl+LUZO6nhlfsT5ejynkfOFoMwJN1M9
         vIcGMukUYbYKDkoFFGyqOfI42UM9EgxMnoVH3Bc0Gq6IjwdG8MGJBUSTtcbxdApCdfzu
         Acs+Qh08xuIdPYuRqA07ol8BDCl7GkRJ5EVkfXBbaJhhTMoH5zaSIReb+j0g7C7CggZ9
         hYgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSp3jZWsoOXEv7xGiaPHK98mmm61lXLfUdGmnwRKFakOgwlJmDZDRmqzzUZzmMZMirsQzxZ3wqGWM3ZCPXug==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb7BFOchxzWSirQ9BOjw2a0E1lD9giRvP/Ue4T8uRDfLOQ5DYL
	1bepJGVW2NhRmTtqp4ZrsBEMM+464PBnXzcy6W/ZLl+uoqPvO7UYGOQtAKwPkZc=
X-Gm-Gg: ASbGnctQbIcnY7UMfnAcFWPW1SvKYHWVYDNOwydd2avgvzkk8bJO7qUCCz0bCbyvnzV
	4jWcVGvS7QQD5PPs+O5GVQMVixAtyzj7NJGiaYGYnHy3napOPO6AHQW6U8YdLg8s6Ogy+L+XxcE
	3DPjra1mhRjnBKmxQSr/jwLLlxZ+8wXIwXO4cnlQH21uxK0QeKwOf1bHuXIRzSwAcMgxw97ApIi
	+NMrS7tcnFomPZ7bowdMg43WgpLtQ0Gum4XcY59iaWx27t5/CM5fduExpPvc2l9J4PjPjT5Kxdd
	mCeLbJwKfTIU+IVg
X-Google-Smtp-Source: AGHT+IFyhffQN/OsYoNQw/aTM5fFiWaNlpw+2vgiqNf5QXtfK47aBOAj2zws7o6C51hIPgdyO2FgzA==
X-Received: by 2002:a17:907:97d3:b0:ab6:cdc2:3417 with SMTP id a640c23a62f3a-ab6cdc23436mr129567466b.15.1738092590920;
        Tue, 28 Jan 2025 11:29:50 -0800 (PST)
Received: from [192.168.88.249] ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e653c6sm838718266b.64.2025.01.28.11.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 11:29:50 -0800 (PST)
Message-ID: <79283554-ce12-4812-be1d-af8b420c1053@sedlak.dev>
Date: Tue, 28 Jan 2025 20:29:49 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC WIP v2] rust: add bitfield_options macro to create
 bitfield wrapper types
To: gtimothy-dev@protonmail.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20250128-add-bitfield-options-macro-v2-1-d65349b389fc@protonmail.com>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <20250128-add-bitfield-options-macro-v2-1-d65349b389fc@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
I do not have a strong opinion on whether this patch is actually needed 
thus I only do a quick review of the code/documentation part.

What I think is actually missing is an another patch integrating this or 
showing usage of this somewhere, for example in samples/drivers.

On 1/28/25 4:48 PM, Timothy Garwood via B4 Relay wrote:

> +//! Trait and macro to build bitfield wrappers.
> +//!
> +//! A trait and [`kernel::bitfield_options`] macro to build bitfield wrappers with
> +//! [`std::fs::OpenOptions`](https://doc.rust-lang.org/std/fs/struct.OpenOptions.html)-like methods to
> +//! set bits and _try to ensure an always-valid state_.
> +
> +/// A trait associating a bitfield type to a wrapper type to allow for shared trait implementations
> +/// and bitfield retrieval.
> +pub trait BitField {
> +    /// The bitfield type, usually `u8` or `u32`

Missing period at the end.

> +    type Bits;
> +
> +    /// returns the bits stored by the wrapper.
> +    fn bits(&self) -> Self::Bits;
> +}
> +
> +/// concatenate sequences using a comma separator. Uses a a `, and` (oxford comma) separation

Capitalization of the first word.

> +/// instead between the last two items.
> +#[doc(hidden)]
> +#[macro_export]
> +macro_rules! concat_with_oxford_comma {
> +    ($last:expr) => (concat!("and ", $last));
> +    ($left:expr, $($right:expr),+ ) => (
> +        concat!($left, ", ", $crate::concat_with_oxford_comma!($($right),+))
> +    )
> +}
> +
> +/// Builds a bitfield wrapper with
> +/// [`std::fs::OpenOptions`](https://doc.rust-lang.org/std/fs/struct.OpenOptions.html)-like methods to

This might be opinionated, but it may be better to use positional 
parameters [1] as it is not that noisy to read in the source code.

Link: 
https://doc.rust-lang.org/rustdoc/write-documentation/linking-to-items-by-name.html#valid-links 
[1]

> +/// set bits.
> +///
> +/// This wrapper _tries to ensure an always-valid state_, even when created from a bitfield
> +/// directly.
> +///
> +/// The wrapper implements the [`BitField`] trait.
> +///
> +/// # argument types
> +///   - `name`: the name of the wrapper to build.
> +///   - `type`: the bit field type, usually `u32` or `u8`. Must be an int primitive.
> +///   - `options`: array of `{ name:ident, true:expr, false:expr }` options where name is the name
> +///     of a method that will set the `true:expr` bit(s) when called with `true` or else the
> +///     `false:expr` bit(s). In a standard bitfield, `false:expr` is set to `false:0`, but sometimes
> +///     different bit flags designate incompatible alternatives : in these cases, set `false` to
> +///     activate the alternative bit(s).
> +///
> +/// # Examples
> +///
> +/// Call the macro to create the bitflag wrapper.
> +///
> +/// Here we create a wrapper that allows to set `RED`, `BLUE`, `GREEN` bits independently,
> +/// and additionally either the `BIG` bit or the `SMALL` bit.
> +///
> +/// `BIG` and `SMALL` are incompatible alternatives.
> +///
> +/// ```rust

The rust is implicit.

> +/// use kernel::bitfield_options;
> +///
> +/// const BIG: u32 = 16;
> +/// const SMALL: u32 = 1;
> +///
> +/// const RED: u32 = 2;
> +/// const GREEN: u32 = 4;
> +/// const BLUE: u32 = 8;
> +///
> +/// bitfield_options! {
> +///     name: SizeAndColors,
> +///     type: u32,
> +///     options: [
> +///         {name:big, true:BIG, false:SMALL},
> +///         {name:red, true:RED, false:0u32},
> +///         {name:blue, true:BLUE, false:0u32},
> +///         {name:green, true:GREEN, false:0u32}
> +///     ]
> +/// };
> +/// ```
> +///
> +/// The `SizeAndColor` type is now available in this scope.
> +///
> +/// It implements the [`Default`] trait where all options are set to `false`:
> +///
> +/// ```rust

The rust is implicit.

> +/// # use kernel::bitfield_options;
> +/// # use kernel::bitfield::BitField; // to have access to the bits() method
> +/// #
> +/// # const BIG: u32 = 16;
> +/// # const SMALL: u32 = 1;
> +/// #
> +/// # const RED: u32 = 2;
> +/// # const GREEN: u32 = 4;
> +/// # const BLUE: u32 = 8;
> +/// #
> +/// # bitfield_options! {
> +/// #     name: SizeAndColors,
> +/// #     type: u32,
> +/// #     options: [
> +/// #         {name:big, true:BIG, false:SMALL},
> +/// #         {name:red, true:RED, false:0u32},
> +/// #         {name:blue, true:BLUE, false:0u32},
> +/// #         {name:green, true:GREEN, false:0u32}
> +/// #     ]
> +/// # };
> +/// let sac = SizeAndColors::default();
> +///
> +/// // the default state, with all the options set to false should be the field with only the
> +/// // `SMALL` bit(s) set
> +/// assert_eq!(
> +///     sac.bits(),
> +///     SMALL | 0u32 | 0u32 | 0u32)
> +/// ```
> +///
> +/// It implements the [`TryFrom`] trait which succeeds only if the passed bitfield is a valid state:
> +///
> +/// ```rust

The rust is implicit.

> +/// # use kernel::bitfield_options;
> +/// #
> +/// # const BIG: u32 = 16;
> +/// # const SMALL: u32 = 1;
> +/// #
> +/// # const RED: u32 = 2;
> +/// # const GREEN: u32 = 4;
> +/// # const BLUE: u32 = 8;
> +/// #
> +/// # bitfield_options! {
> +/// #     name: SizeAndColors,
> +/// #     type: u32,
> +/// #     options: [
> +/// #         {name:big, true:BIG, false:SMALL},
> +/// #         {name:red, true:RED, false:0u32},
> +/// #         {name:blue, true:BLUE, false:0u32},
> +/// #         {name:green, true:GREEN, false:0u32}
> +/// #     ]
> +/// # };
> +/// # let sac = SizeAndColors::default();
> +/// let small_and_no_colors = SizeAndColors::try_from(SMALL)
> +///    .expect("having only the SMALL bit to 1 should be a valid state");
> +///
> +/// // Having only the `SMALL` bit set to 1 is the default state.
> +/// assert_eq!(sac, small_and_no_colors);
> +///
> +/// let big_and_rgb = SizeAndColors::try_from(BIG | RED | GREEN | BLUE)
> +///     .expect("having the BIG, RED, GREEN and BLUE bits set to 1 should be a valid state");
> +///
> +/// assert_eq!(
> +///     SizeAndColors::default()
> +///         .big(true)
> +///         .red(true)
> +///         .blue(true)
> +///         .green(true),
> +///     big_and_rgb
> +/// );
> +///
> +/// let big_and_small = SizeAndColors::try_from(BIG | SMALL)
> +///     .expect_err("BIG and SMALL are incompatible, this should fail");
> +///
> +/// let intense:u32 = 1024;
> +/// let big_and_intense = SizeAndColors::try_from(BIG | intense)
> +///     .expect_err("BIG|intense is not a valid state, this should fail");
> +/// ```

Daniel

