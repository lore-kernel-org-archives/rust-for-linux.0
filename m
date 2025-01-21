Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0010A81ACA
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Jan 2025 15:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737473897; cv=none; b=FI2H/VHj7NGlUzTeW1SDnKgsgAtB/HqxseRplmfOlhu2y1PcQj9aFfUlZMabOTZs4MoibS5fVA/1VXmMlFhSi+Pan++T/Q6D5Ks25fKR4vPOV840PHlpuStUVP+mM/JYnGC5aqjntj+0YdcwumyyCHHfmqYl6lgIvpIzKkvEM4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737473897; c=relaxed/simple;
	bh=2fYo0797enVLMBcCEJBO6XYvAUIeePjEj5vEOep7YQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mW/I2wAzGyFsHUOyRKbXr1ZLIOSdxbFYOY7RB9iQFWZliUUBfcM1FejvCbTgWC478178SPH109nxXXsubh5/WC0OwcbVcWPLSvKWB63jcFtPHb99ZCrJI2GOpWAkqceQhzeG4TGbLX+iBGXG9NU/ewFXe5RN/kFhOLzhYZ+1+0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o34Sh0Dw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o34Sh0Dw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38634c35129so4892011f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Jan 2025 07:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737473894; x=1738078694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQHYssZz6s99Iyy0P7nqE+juJaCqBgjhGcVJbXQjkso=;
        b=o34Sh0DwKGrYVCIct8ahrJL6oLsjxMi+uQuqKqO2bOMnLeN5OfNZXF8LsT4Q+3qEUg
         xeIwjEqzaeYzTYJEf6sj8XSa6wa+HR58ZXMB+k/66YW8EM8lZWIN3f+xRQEG0sKs8aL+
         pofhcqD6l2HMkBRbwXQQ2fNlI4VdunCg1No7as/V2PXkM9davto1t7mDvdAzrV8YHxal
         WwCx1ZLT1Aq5DQ3Qrj0huhjEhJbDoPCis2Ng13G3Gk3MSEfgUOA7n9fJmNFBOHaijJwy
         BbrOzIwF6bwtl/XSfFEtjSq7NW+T8iKBMfYFlPTTuuv0xg4L9Fn0Ygvw6jyGQPcZrCcN
         n8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737473894; x=1738078694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQHYssZz6s99Iyy0P7nqE+juJaCqBgjhGcVJbXQjkso=;
        b=AVoLWn56DwcpMsOwOUN8Vi6MlowlQx5U5L0Bfmi122LL888fTAZRGTOJuGA17B2uvd
         N+mIJV4ey/3GIqeqDnUN/T7SsilHh3HEP4MHYMTSIJ2RjzjRewYxw8FiZ9U+ArXm6U9d
         nOxm/JeekHnX2JRJDuI/IkU6qXIkAxRMzg1XpjNmgOTizCkHbaAQMxMD9BQO5tmQuikd
         pjWu5L2sEbBPpm6F4k/bzWrYDZ0AlkhBwObEuTh9CMJmelpUMujS9wFqa3fHegkti9JU
         a8kiyUvGsqRU7zPx50blb+2/MMexoviGIZaGRCzXwd+aev55uEdvcATQ//2RRBkZMjcP
         fQcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoSCImSL0WZkxc4A1DSB0J5LsRd5amyIpiLAqr5you2rKHYdeArEy8mz9CwVs14kMV4UGa2ym/a7mP82FcQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhmLDmpZnGDYu6LWrXY/xflA7I3qEysXULQyzkEeqnsgZkyJL4
	YoPX2AmXDf/pZGJQwhhalWTGs927Ml40zzs5E1H0QUBJIV4xb8xeW/JDw/EjDGXez6+ZX8CfB4D
	xVF4B8GuoQh7+FUStNPIOz9ZF9HZJSNR4FoQv
X-Gm-Gg: ASbGncsZRHOVQfu+x9VymFWgBtuuy/MtoXfOT/O0QJC5Bfqm7QjXWLz4TLo8y3k3vrM
	JEy4EMGAcquo8V8g2BTDheOJpq1/qchOar5wY/ZXgLq6ObFcEec3wz4KAlH2K1SnZ41zEZ+WHbc
	foMAmmMA==
X-Google-Smtp-Source: AGHT+IF+b7YHYCsFxxPdv8+TrGsAW1awptOFyWk8wr9T6DjqnwYNXdvH7QjgKM7BAzNLK5U2nV7onBuA2mHeU+DWHFs=
X-Received: by 2002:adf:f504:0:b0:385:ecdf:a30a with SMTP id
 ffacd0b85a97d-38bf57ab510mr14586943f8f.33.1737473893839; Tue, 21 Jan 2025
 07:38:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121-topic-panthor-rs-genmask-v3-1-5c3bdf21ce05@collabora.com>
In-Reply-To: <20250121-topic-panthor-rs-genmask-v3-1-5c3bdf21ce05@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 21 Jan 2025 16:38:01 +0100
X-Gm-Features: AbW1kvbQ3uck9nsS9yliQ1CML7FOCFGl7R5uAdoFhH74FohLWy_f_10oYDi37_A
Message-ID: <CAH5fLgjKgAB9vC-XxW5jCaJ5yGaHuDK3po9y2PmzC6kALR8J3g@mail.gmail.com>
Subject: Re: [PATCH v3] rust: kernel: add support for bits/genmask macros
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 4:30=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> In light of bindgen being unable to generate bindings for macros,
> manually define the bit and genmask C macros in Rust.
>
> Bit and genmask are frequently used in drivers, and are simple enough to
> just be redefined. Their implementation is also unlikely to ever change.
>
> These macros are converted from their kernel equivalent. Since
> genmask_u32 and genmask_u64 are thought to suffice, these two versions
> are implemented as const fns instead of declarative macros.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> Changes in v3:
> - Changed from declarative macro to const fn
> - Added separate versions for u32 and u64
> - Link to v2: https://lore.kernel.org/r/20241024-topic-panthor-rs-genmask=
-v2-1-85237c1f0cea@collabora.com
>
> Changes in v2:
>
> - Added ticks around `BIT`, and `h >=3Dl` (Thanks, Benno).
> - Decided to keep the arguments as `expr`, as I see no issues with that
> - Added a proper example, with an assert_eq!() (Thanks, Benno)
> - Fixed the condition h <=3D l, which should be h >=3D l.
> - Checked that the assert for the condition above is described in the
>   docs.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Seems like this got mixed up? You may be missing a --- line somewhere
in your b4 cover letter.

>  rust/kernel/bits.rs | 42 ++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs  |  1 +
>  2 files changed, 43 insertions(+)
>
> diff --git a/rust/kernel/bits.rs b/rust/kernel/bits.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..32049abd2078525be25b57b8e=
6b5948d1eecbf9f
> --- /dev/null
> +++ b/rust/kernel/bits.rs
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Bit manipulation macros.
> +//!
> +//! C header: [`include/linux/bits.h`](srctree/include/linux/bits.h)
> +
> +/// Produces a literal where bit `n` is set.
> +///
> +/// Equivalent to the kernel's `BIT` macro.
> +pub const fn bit(n: u32) -> u64 {
> +    1 << n
> +}
> +
> +/// Create a contiguous bitmask starting at bit position `l` and ending =
at
> +/// position `h`, where `h >=3D l`.
> +///
> +/// # Examples
> +/// ```
> +///     use kernel::bits::genmask_u64;
> +///     let mask =3D genmask_u64(39, 21);
> +///     assert_eq!(mask, 0x000000ffffe00000);
> +/// ```
> +///
> +pub const fn genmask_u64(h: u32, l: u32) -> u64 {
> +    assert!(h >=3D l);
> +    (!0u64 - (1u64 << l) + 1) & (!0u64 >> (64 - 1 - h))
> +}
> +
> +/// Create a contiguous bitmask starting at bit position `l` and ending =
at
> +/// position `h`, where `h >=3D l`.
> +///
> +/// # Examples
> +/// ```
> +///     use kernel::bits::genmask_u32;
> +///     let mask =3D genmask_u32(9, 0);
> +///     assert_eq!(mask, 0x000003ff);
> +/// ```
> +///
> +pub const fn genmask_u32(h: u32, l: u32) -> u32 {
> +    assert!(h >=3D l);
> +    (!0u32 - (1u32 << l) + 1) & (!0u32 >> (32 - 1 - h))
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index b5f4b3ce6b48203507f89bcc4b0bf7b076be6247..4f256941ac8fbd1263d5c014a=
0ce2f5ffb9d1849 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -27,6 +27,7 @@
>  extern crate self as kernel;
>
>  pub mod alloc;
> +pub mod bits;
>  #[cfg(CONFIG_BLOCK)]
>  pub mod block;
>  mod build_assert;
>
> ---
> base-commit: 91e21479c81dd4e9e22a78d7446f92f6b96a7284
> change-id: 20241023-topic-panthor-rs-genmask-fabc573fef43
>
> Best regards,
> --
> Daniel Almeida <daniel.almeida@collabora.com>
>
