Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA531DE2C4
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Oct 2024 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730128691; cv=none; b=DpzTh6OUrP9JfoB/rnLJOzz3rcAVrAQwdeUyqFHDgAOvOSpnuhi2Q7KJ0qeuB/FXrtzhHl6DnqlZZCxYnBH5kGMW4igI6NQdAoXv4qq6m6LZpUZumCed5iBf2amhyNYnaFRGwH3GH5+DqxcEFbjYGW3/G9HxxAmJIpn8c5vCiD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730128691; c=relaxed/simple;
	bh=q/0+tkYI5bNjwo8HanO/z9VdvEfdgc33WYasp4apUs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uds13tUyidteuhDFIl4O8qhLdTwP3Ah4YbhQ6XEoxazlzk7Wm+2U127ZnP3u+oKnz/e0akmWSdjLI6cjQf4ZYT6PZobsdxLlBWzCiuBvErYxWfJet8w8XmdeANpjYtAcdGbgGOTXNEprz+Q3Katy579qng8p5g/hYkzx58E7qHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ogg5Krat; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ogg5Krat"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so46401785e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Oct 2024 08:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730128687; x=1730733487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9UYqjv3kpCsvVaf+yhQYbY8eaOWe7oMd7SNEJNj1Mo=;
        b=Ogg5KratyIH4B74dHxB0cctGWcx+XS44D5880cMuEfVcAqGr16q/63SWetqqOyTnDW
         /kSXH2Q2uZz2nyYZ3fZckaDqfSnOtyLxtJnHBXlabh8vQVI/UcQOhiwLEMg56uFe8Lhf
         EMmN9PHQ5tbUihjsdFFwg5VzA9/YLS+qu/kMG9J+/A1L4LAF0ft35D1jO8KUglsreRsX
         zBqnZAxwqkLWhMjPZ671kbCEW/u8eQn5TAk9FNKnZHYUosEZBWtxO75Hv5YWvn4ny40A
         xB1fmfdronOC/L5XWXVGoT+hYzjyeYQPY3i6i/IFuej/nkbj+gNH2/ykpRFdVOWSnVRj
         x+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730128687; x=1730733487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u9UYqjv3kpCsvVaf+yhQYbY8eaOWe7oMd7SNEJNj1Mo=;
        b=QmGDXYCgHWbyMAKleWc5eenK9VO2zo/bomtuLP1Lok8dhSlAjXXjOxN58I3AuhS5Io
         MoK4pbE6podOXfiRo+XNh42rWkv1N170ABH0/ZRiUEWqefdf4+FKy4iCEzx1g93Z7AQI
         nHd3FeNiktHS541geZqRGRvTTtYz14m2gJ6WOD95kDLBddYthYbr0CaJseCZlvvzCP7p
         kDpzbH9SxeuNw/Ac8XgIWnfrvBRMx3+fJTVDB88HHDgRmkXwpPsz/M8YBDs1q8XmYyHd
         Cnd81YFLuQemBuptKwM20rA+b9OsKjlVXBYTU1sy1IG/zuRGbRQl/CefRHqkyzrEJSkk
         1u1w==
X-Forwarded-Encrypted: i=1; AJvYcCWlr4HvsFXq8flOwHMM53RKL1n0uFBzvqWE6nw/GduYq4pV+T1QPLwsUqTGWM7L6SEH/fb1NGHWLOYWJ50xEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWNEA7dx9QFxeFUs2cVfe7u6tw9NNXZu3URc8NiOgwNZWDMUCF
	vO4T0zJx5j7TzkCtOG8OVDgX6lPmT25V+eJoCBF+3TJjF2eOA4S3L7NwR1UTbHiPvd/ZfYNS55D
	c1mBxdYT5+uEHF4daBfMGbJEUeqSXkVt1rpb8
X-Google-Smtp-Source: AGHT+IG8IlRulUeU8MVBvRA5xQ95yrZVFmxS8Of+zdiWkSTJFGX3IxuumGa4sA7FEuCwTbT/e6K/Nvse82eAIrlfIfI=
X-Received: by 2002:a05:600c:4694:b0:42c:b7f9:4bbd with SMTP id
 5b1f17b1804b1-4319ad0aefbmr85861345e9.26.1730128686556; Mon, 28 Oct 2024
 08:18:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024-topic-panthor-rs-genmask-v2-1-85237c1f0cea@collabora.com>
In-Reply-To: <20241024-topic-panthor-rs-genmask-v2-1-85237c1f0cea@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 28 Oct 2024 16:17:53 +0100
Message-ID: <CAH5fLgjOKQdKViAGArMjvXjVmYpbo_sA8xoQGwu+DCW1FDFRXA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kernel: add support for bits/genmask macros
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 4:18=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> These macros are converted from their kernel equivalent.
>
> ---
> - Added ticks around `BIT`, and `h >=3Dl` (Thanks, Benno).
> - Decided to keep the arguments as `expr`, as I see no issues with that
> - Added a proper example, with an assert_eq!() (Thanks, Benno)
> - Fixed the condition h <=3D l, which should be h >=3D l.
> - Checked that the assert for the condition above is described in the
>   docs.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

My main question here is whether this should be a macro_rules! or const fn.

One factor in favor of a macro is that if you need it to work in const
context, then you can't use generics, which means that you must
restrict it so it only works with a single integer type. On the other
hand, genmask! already only works for the u64 type, so that argument
doesn't work for genmask!.

Either way, I'd like to see the reason for your choice in the commit messag=
e.

>  rust/kernel/bits.rs | 36 ++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs  |  1 +
>  2 files changed, 37 insertions(+)
>
> diff --git a/rust/kernel/bits.rs b/rust/kernel/bits.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..479883984f995f6b44272fa45=
66a08f1c1e6b143
> --- /dev/null
> +++ b/rust/kernel/bits.rs
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Bit manipulation macros.
> +//!
> +//! C header: [`include/linux/bits.h`](srctree/include/linux/bits.h)
> +
> +/// Produces a literal where bit `n` is set.
> +///
> +/// Equivalent to the kernel's `BIT` macro.
> +///
> +#[macro_export]
> +macro_rules! bit {
> +    ($n:expr) =3D> {
> +        (1 << $n)
> +    };
> +}
> +
> +/// Create a contiguous bitmask starting at bit position `l` and ending =
at
> +/// position `h`, where `h >=3D l`.
> +///
> +/// # Examples
> +/// ```
> +///     use kernel::genmask;
> +///     let mask =3D genmask!(39, 21);
> +///     assert_eq!(mask, 0x000000ffffe00000);
> +/// ```
> +///
> +#[macro_export]
> +macro_rules! genmask {
> +    ($h:expr, $l:expr) =3D> {{
> +        const _: () =3D {
> +            assert!($h >=3D $l);
> +        };

Based on the error reported by the bot, you probably need to use
`$crate::build_assert!` here instead of the stdlib `assert!` macro. I
don't think the stdlib macro works in const context.

> +        ((!0u64 - (1u64 << $l) + 1) & (!0u64 >> (64 - 1 - $h)))

The implementation looks okay. I tried it:
fn main() {
    println!("{:03b}", genmask!(0,0));
    println!("{:03b}", genmask!(1,0));
    println!("{:03b}", genmask!(2,0));
    println!("{:03b}", genmask!(2,1));
}
prints:
001
011
111
110

Alice
