Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA002773C3
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 02:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767493721; cv=none; b=eJzGigOPMObJWfjdWww4ouXbLaWYOCLwkllAuwN2frpZiOYd7Gp6q9iQ2N3DUvcKKHJeHav3mU1QRnv/lNOvwu48luzXaTuYHJLq+F8bMO/yCFil0vyXOH42ZchRCWilpTuyIGABdsfnP+V4yQTUqGL3lLFa6b2lHKvDdGaLSig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767493721; c=relaxed/simple;
	bh=deRE+0hVKWknXjss2Bzqfymfq3UsZYrSKK4yRJjbGTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/WK0bQyFQfP7WicHIqCMDg6HW6iPolAxBo+MPG4gd13jvOtACBurS4gsThDpPgc/Vdnconn0iuFTEi4DTFCwWqAqxxajrEuuhlMW+xjDrrQ8/MbzbPKHWat2J6MwHGKLrnSEEsgYiK9dwrHThMZDQaVEx/wtbzQG/jpp52BlaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkNJW+WR; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkNJW+WR"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37bbb36c990so8950131fa.0
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 18:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767493718; x=1768098518; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjDpHmeXmCNVdMjK8YLIYIvWH5gOso+feNMTbxoeNp4=;
        b=bkNJW+WRfjYUkA/PSN/Z8Cx0RsWvQid7IUpLfh7WA0Z2bANvGFMvXQwziHXQLrY2Qh
         8Wfg/is1RLVfYLonPyMnGFiRSNRoK1vKUp+/aBzTy2SszGHRrBKNtOMmXLJYK7jmaO9O
         Ygc2osTQnta46MilntNzwprRTCF7oT90bVFBW5q30apIv2aUQifuyMR5KJq0xzhSfPmH
         IzJrQUj8X+/3cicrvGEUEsjLpchBYzn3emJDQOkD6XWwk222D5o8z4pH8TgxE8XgtHhj
         9D4era6CZ10tL0oAdsahC3nFoWQQDok+RCBnwgxNzMj+043Y4PJ27EJnxaZzmnf3K+gp
         XUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767493718; x=1768098518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjDpHmeXmCNVdMjK8YLIYIvWH5gOso+feNMTbxoeNp4=;
        b=X5CtOVXJ4BZZCusJ/shMlQ50i52L16jWUTstjrfW7YD9rC1zwdnJHSQ2nh5Rp7OnV3
         jNImACAkpzrcz83etK9p/mDj5rnktS5sfk7Zn1Cra0MP5xRrPLLmim2Hyrcn3Gdi6jeJ
         ubuG22i6UF76YhuUHzU3ldGZZ0xN/ryZVvyhZ7yf8P47BZ0Kjeed9909fFeGIFKtrG5i
         RJUqaFQvC6BelxUFZS07wqMqdfDGtt4yrUw1UO4JM6XMq42Nl9baYfLD1+e6L8Ir9Ctl
         LEK1NMZ2nQ75xjcqpYlVQkKFUFEs1qb7ZRKxoHnt63ntWtt8XRnRlmkqIX7g1548wNKH
         Q8ng==
X-Gm-Message-State: AOJu0YygwDoIheb9pw3mCokZ+DQ1e0lux4S633Ocj1+IWw5b4mOXdOXN
	DOKc4PtMdUhU74s42KxAM1DNbZfrErtYCVH5EtlmDXSiWXJf6Db18ZIEJIr+7RjB5yLNalG7wM/
	GLOS7k/g+kUikQCpQMTbAnhVeraPTM6g=
X-Gm-Gg: AY/fxX6IpunKGy5mZxJHmSB4Lk0+xrnO94GpNFgkAlMuk9mDISGkYw9wW3mFiXYtY0F
	XuV8SzOV2SEgQIRkvHErSgpVL+2CXbKSdGdJ5/FB5qguxI1ZnjRIAEIcZLHhsOJpFiuCnUipQeo
	6CFkBF0p7/OvOYR1Uffzkp8zZIdipUoIevIjlc/lgmdrsc7Zpf5xgMIlFrhtPnJmxr+pOEHLI4s
	XMxC3/dRLNlcBezRxYCnW4yQJU83UX6AVgjyxzYjMr8odZGFMrAUBGbBB1zMqe+BL3pOODNas89
	WoHMLLNUh79gUwcOthnQGVw/k/4pT/O542sDNuNeHsSpYovyhPCq9cPMU39b9Bb2VsH4qsgMuBU
	L2v4Ss8o4sq6Vp+5TQiPC5EE0Edw2zen9iQ79e1uf8A==
X-Google-Smtp-Source: AGHT+IG3Uz0p8G7Gi68caBHYZTcWwYDQPpNQmgMp2z+MU3xxcIiQXvqhBAYgl5n2KCrKNUtoDgbyyDZ11uWrUdInaZY=
X-Received: by 2002:a2e:b88f:0:b0:37e:508f:81d4 with SMTP id
 38308e7fff4ca-382c514e6d9mr9161761fa.10.1767493717594; Sat, 03 Jan 2026
 18:28:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-configfs-v1-1-cc1665c51c43@gmail.com>
In-Reply-To: <20251222-cstr-configfs-v1-1-cc1665c51c43@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 3 Jan 2026 21:28:01 -0500
X-Gm-Features: AQt7F2paJpYtOLZVQyWVMlDc-KsntY0JmVtvLsvHvE_q4F6_kqL4IWhesgbguW0
Message-ID: <CAJ-ks9nDDceVKjLengGsjJvxTT9Mc5SqRfyteuOw4AsO1KWhLQ@mail.gmail.com>
Subject: Re: [PATCH] rust: configfs: replace `kernel::c_str!` with C-Strings
To: Andreas Hindborg <a.hindborg@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 7:12=E2=80=AFAM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> Acked-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/configfs.rs       | 9 +++++----
>  samples/rust/rust_configfs.rs | 5 ++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
> index 466fb7f40762..2339c6467325 100644
> --- a/rust/kernel/configfs.rs
> +++ b/rust/kernel/configfs.rs
> @@ -21,7 +21,6 @@
>  //!
>  //! ```ignore
>  //! use kernel::alloc::flags;
> -//! use kernel::c_str;
>  //! use kernel::configfs_attrs;
>  //! use kernel::configfs;
>  //! use kernel::new_mutex;
> @@ -50,7 +49,7 @@
>  //!
>  //!         try_pin_init!(Self {
>  //!             config <- configfs::Subsystem::new(
> -//!                 c_str!("rust_configfs"), item_type, Configuration::n=
ew()
> +//!                 c"rust_configfs", item_type, Configuration::new()
>  //!             ),
>  //!         })
>  //!     }
> @@ -66,7 +65,7 @@
>  //! impl Configuration {
>  //!     fn new() -> impl PinInit<Self, Error> {
>  //!         try_pin_init!(Self {
> -//!             message: c_str!("Hello World\n"),
> +//!             message: c"Hello World\n",
>  //!             bar <- new_mutex!((KBox::new([0; PAGE_SIZE], flags::GFP_=
KERNEL)?, 0)),
>  //!         })
>  //!     }
> @@ -1000,7 +999,9 @@ macro_rules! configfs_attrs {
>                      static [< $data:upper _ $name:upper _ATTR >]:
>                          $crate::configfs::Attribute<$attr, $data, $data>=
 =3D
>                              unsafe {
> -                                $crate::configfs::Attribute::new(c_str!(=
::core::stringify!($name)))
> +                                $crate::configfs::Attribute::new(
> +                                    $crate::c_str!(::core::stringify!($n=
ame)),
> +                                )
>                              };
>                  )*
>
> diff --git a/samples/rust/rust_configfs.rs b/samples/rust/rust_configfs.r=
s
> index 0ccc7553ef39..a1bd9db6010d 100644
> --- a/samples/rust/rust_configfs.rs
> +++ b/samples/rust/rust_configfs.rs
> @@ -3,7 +3,6 @@
>  //! Rust configfs sample.
>
>  use kernel::alloc::flags;
> -use kernel::c_str;
>  use kernel::configfs;
>  use kernel::configfs::configfs_attrs;
>  use kernel::new_mutex;
> @@ -35,7 +34,7 @@ struct Configuration {
>  impl Configuration {
>      fn new() -> impl PinInit<Self, Error> {
>          try_pin_init!(Self {
> -            message: c_str!("Hello World\n"),
> +            message: c"Hello World\n",
>              bar <- new_mutex!((KBox::new([0; PAGE_SIZE], flags::GFP_KERN=
EL)?, 0)),
>          })
>      }
> @@ -61,7 +60,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<S=
elf, Error> {
>
>          try_pin_init!(Self {
>              config <- configfs::Subsystem::new(
> -                c_str!("rust_configfs"), item_type, Configuration::new()
> +                c"rust_configfs", item_type, Configuration::new()
>              ),
>          })
>      }
>
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-configfs-3e5e5092f187
>
> Best regards,
> --
> Tamir Duberstein <tamird@gmail.com>
>

@Andreas could you please have a look?
