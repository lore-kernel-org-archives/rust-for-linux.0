Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEEF2BDC0A
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 17:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767633614; cv=pass; b=iQqZD/tycotsyZBraryaceMMBX+wSoKkwKKOJO6t2PrpalPpmvDB3f4rWIu9004r2P8v523KWXO2hDxb38zKWEa59DXTwHTbek4UJpq/DeRWOjGszoMzvf0I/+WsZck9jZlzOaL+VBmZRiZ7j1yrIl/4KZNVLGxxS3DT24Vwjd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767633614; c=relaxed/simple;
	bh=20t+uIUNadQ+g83t6C2wzBUiKeilT2/Hh5Bw6e4cx7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TxXIX56MQu7WAn00xpn3d3mm9w9VWUVv+XHEb6say2lJp6Cu+EzGDquJXCfdX4cUxrA/ZhmYj113jK7hpBCh9EQr5yyUyEmfFZYenasCBzhphN4fYd61GuX0nyEd6h5BEPzBdEZc60ZuAgOOPAvg7N+UgqB6bbONmY+Ykc4/7Zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b/Vt69X9; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b/Vt69X9"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64b72793544so14504a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 09:20:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767633606; cv=none;
        d=google.com; s=arc-20240605;
        b=CP4JYjAxvYUo7SM9sfz5+DEBDE41YzZVrFlKU7d3kQPLGUyzDBLv2nnjr5LQETc4EF
         dvNf8zJWxU+mzxo5SNhon8vq8XWbJdlVX9YSxq3B3drwpJdIpxoh4NIgjj7dPkuKIwJM
         dr0fQQYT2m06w9+D+KyDL2GzZLYjhl0xMzjQkKAf3CHIQ40FzBXXp01wN9txiZtqlfgm
         wqyuSRcL+g4IoTmnMdDvO5IH7it0pybtYUQ6vWUdZEEqBD4ef6xMn1CDNrjuY5O85SAZ
         mKNa92LZhdqyFjJAxHXO8bOFSFWcrOD55tTth9gOjaLMvno8bq7gLU5ZStKblr71alUX
         Yn5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=12jbI98TW9YB+cI008SD1SH6/vdQZNyXwCTKREAO0Eg=;
        fh=7VtrddhaGLZ6SHEXH0hF6TVUtwljCMtwEnT603vgsz0=;
        b=K8ak+ZJmzfXofAyVl93dazDXswD52pAPT2yQKoRMyAqS++8ipAfLM95VXqGK+Xr2nP
         ppqzC/Y/SHsM4jle0yZ4DRFyo78OEWsHzmlamG+UN5kuCEAjAjx81abIaCVafjtBhQ52
         GyacXyQFYfPyIZRwezLdV7RqbS43FCr1XQWWYOEAmvlaTSFxLZ7cRimk5KgwhvHWMZDd
         muUWY41ka8LUGnT6f5HjFhMr5DAyPhdeQoId4H04bocFQgJ+nWsj+s0tWkxjkRMtpn0J
         6HshjCN41iEU//yplbJCkkKpC3MGZbFnfN41S3xO6qtSajShaieqd5MF7h7O5DfgAT98
         Cnzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767633606; x=1768238406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12jbI98TW9YB+cI008SD1SH6/vdQZNyXwCTKREAO0Eg=;
        b=b/Vt69X9lgAxIQWP5PsUWOrq06HQlTIygsIy6smH9Qv/p5BfT1prbyfBK7arGhpk24
         XAV/tUs7Rly2gxlWJTExPjea4h4UYeLQook0TGJ9idT/koaV0tG9LhyKeHPsW+ywiFPa
         l/DEin/ESqeaND7ZWG66HUwZRBYlBBXAI+E0U7FVztZzcBU0JmwWyP6KWx5QJClgSi6W
         4jjLkDuB/Vp5Y0+0QGRdLkceXTLd4kG6jXnE3By1Wq7nWJfklFt0fxhyh5lt7b+mMWZI
         /WFnja4rOoi80hHEHFhYvg8P92WAdgiE+dUh8e/wklAf6/MH37hSlcqyV6cXtBTH0/o8
         alZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767633606; x=1768238406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=12jbI98TW9YB+cI008SD1SH6/vdQZNyXwCTKREAO0Eg=;
        b=wkwPH8Wm/jopjVYhq+v6u3GYtXo45sFpKQD2XW+SCVGShHyF5fZLuM++ltYHm0mNjI
         UgEKUxpE7dxWunwB8NJNF9/uK9WUWw3ZLHcLT4IEHP5StRROY8eR39vU4eRcFZg8tYho
         8pDY8Lcy6wpvpUVpOSf3VPRkzjiswMXurwQiLgB+uNe0Voab2N1SSK3V7+hrj9yBayaQ
         efniPB0dgY5UHQfgYH6B0eEped7RO3XopjKMh9M7CSYqNRy0dEgnFPIAz/0KJ5KSZp3L
         bk4vm1PKYK77vkUDHigATR8TswNW0nknqcKHvvq2taHizHgANcq6J5sYw4QcnvyzXZkb
         W5nw==
X-Forwarded-Encrypted: i=1; AJvYcCXoIc3/SRXXFZ8QWEigT4oEMycut2mWl450yAyN66/tRdYMw4YxBbZ9N9rP4Ic6Cozzr9mR2fdm7blpYbVAZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlvvNAPjA6HCrXfh2v46BqOXxj7YkOv3qkt/7ZE1FhCbbD7rgi
	vhga+4VHaCVXR6QoIturIyhPk6EITr7jsFFRc6+Frb/fvr/j7J+Urtxt3MSFR3fSvzN7Drjt0zS
	jF8pC59dk0grq3q+emHmQmncRYJDIxtX3hvJixtfp
X-Gm-Gg: AY/fxX4Q4gC9cNr0+UEvkOGhCHCbJXwZlNe4twniuVOoTn9jyTrlFVtAuHZVSrQR8E/
	w+eeGMEsP75thIr8OjAkH+bt++Ab1DtOyeNgsI63jWgPflTz4hrgKjzKs+jGs1IHURl56QL2VvS
	wWgspf0kOHxVhnvJLBcPJap3TfLJp6fxVUV7UjgRdEIUfbvaLfwNLKeNTp+fxFJbpyy0T56Kkp4
	ZZOf9QD//TZOx64G8gWQdgHsZ7lNipkF6Xo4tf56UqIJh94qFeM5Ci4ERggWE7J26xaGgp74GYV
	1DVW1o7udWM49yOTExocqz941w==
X-Google-Smtp-Source: AGHT+IGjjKaErDL7A+fWbAHftip4JKn1MVZMgTP1/QvJtc72Vj4lo5zmDYNS9qhGJMvjo0kZV0nYlGDxNxx0yQ8zNZk=
X-Received: by 2002:a05:6402:5345:20b0:649:9266:5c68 with SMTP id
 4fb4d7f45d1cf-64fdab57dc2mr48858a12.4.1767633605697; Mon, 05 Jan 2026
 09:20:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-cfi-lru-status-v1-1-0b2401f7c5b2@google.com>
In-Reply-To: <20260105-cfi-lru-status-v1-1-0b2401f7c5b2@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 5 Jan 2026 09:19:53 -0800
X-Gm-Features: AQt7F2ogmyZ6f75trQvomyET5hJCWinROLEzbwiTR5YAAam7tLDaDArngRrF_Js
Message-ID: <CAGSQo00Vz54=3tgw8z3DtEqtXZGbk3SbJoautuD2pCgw4aswLA@mail.gmail.com>
Subject: Re: [PATCH] rust: declare cfi_encoding for lru_status
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Ramon de C Valle <rcvalle@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 8:12=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> By default bindgen will convert 'enum lru_status' into a typedef for an
> integer, but this leads to the wrong cfi type. It's supposed to be a
> type called "lru_status" rather than the underlying native integer type.
>
> To fix this, tell bindgen to generate a newtype and set the CFI type
> explicitly. Note that we need to set the CFI attribute explicitly as
> bindgen is using repr(transparent), which is otherwise identical to the
> inner type for ABI purposes.
>
> This allows us to remove the page range helper C function in Binder
> without risking a CFI failure when list_lru_walk calls the provided
> function pointer.
>
> This requires bindgen v0.71 or greater.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/Makefile            |  3 +--
>  drivers/android/binder/page_range.rs       |  6 +++---
>  drivers/android/binder/page_range_helper.c | 24 ------------------------
>  drivers/android/binder/page_range_helper.h | 15 ---------------
>  rust/bindgen_parameters                    |  4 ++++
>  rust/bindings/bindings_helper.h            |  1 -
>  rust/bindings/lib.rs                       |  1 +
>  rust/uapi/lib.rs                           |  1 +
>  8 files changed, 10 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/android/binder/Makefile b/drivers/android/binder/Mak=
efile
> index 09eabb527fa092b659559367705fd3667db6cb2c..7e0cd9782a8b24db598034e15=
e5a36eca91b3fa9 100644
> --- a/drivers/android/binder/Makefile
> +++ b/drivers/android/binder/Makefile
> @@ -5,5 +5,4 @@ obj-$(CONFIG_ANDROID_BINDER_IPC_RUST) +=3D rust_binder.o
>  rust_binder-y :=3D \
>         rust_binder_main.o      \
>         rust_binderfs.o         \
> -       rust_binder_events.o    \
> -       page_range_helper.o
> +       rust_binder_events.o
> diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binde=
r/page_range.rs
> index 9379038f61f513c51ebed6c7e7b6fde32e5b8d06..eb738e169525839a199132dd7=
1e69e0b9cc69053 100644
> --- a/drivers/android/binder/page_range.rs
> +++ b/drivers/android/binder/page_range.rs
> @@ -642,15 +642,15 @@ fn drop(self: Pin<&mut Self>) {
>      unsafe {
>          bindings::list_lru_walk(
>              list_lru,
> -            Some(bindings::rust_shrink_free_page_wrap),
> +            Some(rust_shrink_free_page),
>              ptr::null_mut(),
>              nr_to_scan,
>          )
>      }
>  }
>
> -const LRU_SKIP: bindings::lru_status =3D bindings::lru_status_LRU_SKIP;
> -const LRU_REMOVED_ENTRY: bindings::lru_status =3D bindings::lru_status_L=
RU_REMOVED_RETRY;
> +const LRU_SKIP: bindings::lru_status =3D bindings::lru_status::LRU_SKIP;
> +const LRU_REMOVED_ENTRY: bindings::lru_status =3D bindings::lru_status::=
LRU_REMOVED_RETRY;
>
>  /// # Safety
>  /// Called by the shrinker.
> diff --git a/drivers/android/binder/page_range_helper.c b/drivers/android=
/binder/page_range_helper.c
> deleted file mode 100644
> index 496887723ee003e910d6ce67dbadd8c5286e39d1..0000000000000000000000000=
000000000000000
> --- a/drivers/android/binder/page_range_helper.c
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -
> -/* C helper for page_range.rs to work around a CFI violation.
> - *
> - * Bindgen currently pretends that `enum lru_status` is the same as an i=
nteger.
> - * This assumption is fine ABI-wise, but once you add CFI to the mix, it
> - * triggers a CFI violation because `enum lru_status` gets a different C=
FI tag.
> - *
> - * This file contains a workaround until bindgen can be fixed.
> - *
> - * Copyright (C) 2025 Google LLC.
> - */
> -#include "page_range_helper.h"
> -
> -unsigned int rust_shrink_free_page(struct list_head *item,
> -                                  struct list_lru_one *list,
> -                                  void *cb_arg);
> -
> -enum lru_status
> -rust_shrink_free_page_wrap(struct list_head *item, struct list_lru_one *=
list,
> -                          void *cb_arg)
> -{
> -       return rust_shrink_free_page(item, list, cb_arg);
> -}
> diff --git a/drivers/android/binder/page_range_helper.h b/drivers/android=
/binder/page_range_helper.h
> deleted file mode 100644
> index 18dd2dd117b253fcbac735b48032b8f2d53d11fe..0000000000000000000000000=
000000000000000
> --- a/drivers/android/binder/page_range_helper.h
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Copyright (C) 2025 Google, Inc.
> - */
> -
> -#ifndef _LINUX_PAGE_RANGE_HELPER_H
> -#define _LINUX_PAGE_RANGE_HELPER_H
> -
> -#include <linux/list_lru.h>
> -
> -enum lru_status
> -rust_shrink_free_page_wrap(struct list_head *item, struct list_lru_one *=
list,
> -                          void *cb_arg);
> -
> -#endif /* _LINUX_PAGE_RANGE_HELPER_H */
> diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
> index fd2fd1c3cb9a51ea46fcd721907783b457aa1378..1358f3348ffdd31f9bef6c04e=
e9577d0f6a0c5a6 100644
> --- a/rust/bindgen_parameters
> +++ b/rust/bindgen_parameters
> @@ -23,6 +23,10 @@
>  # warning. We don't need to peek into it anyway.
>  --opaque-type spinlock
>
> +# enums that appear in indirect function calls should specify a cfi type
> +--newtype-enum lru_status

I think this may need to be `#[cfi_encoding=3D"10lru_status"]`

> +--with-attribute-custom-enum=3Dlru_status=3D'#[cfi_encoding=3D"lru_statu=
s"]'
> +
>  # `seccomp`'s comment gets understood as a doctest
>  --no-doc-comments
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index a067038b4b422b4256f4a2b75fe644d47e6e82c8..cc12cf1614eac38bcbc1c634e=
6e7e6d8ccfec434 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -147,5 +147,4 @@ const vm_flags_t RUST_CONST_HELPER_VM_NOHUGEPAGE =3D =
VM_NOHUGEPAGE;
>  #if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC_RUST)
>  #include "../../drivers/android/binder/rust_binder.h"
>  #include "../../drivers/android/binder/rust_binder_events.h"
> -#include "../../drivers/android/binder/page_range_helper.h"
>  #endif
> diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> index 0c57cf9b4004f176997c59ecc58a9a9ac76163d9..7f72ab66eebe6ef4227ce1b21=
0d66a7867cbf5dd 100644
> --- a/rust/bindings/lib.rs
> +++ b/rust/bindings/lib.rs
> @@ -23,6 +23,7 @@
>      unreachable_pub,
>      unsafe_op_in_unsafe_fn
>  )]
> +#![feature(cfi_encoding)]
>
>  #[allow(dead_code)]
>  #[allow(clippy::cast_lossless)]
> diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
> index 1d5fd9efb93e9db97fec84fca2bae37b500c20c5..83c4795acbff1da852639bcbd=
9bcf5fb66b7e070 100644
> --- a/rust/uapi/lib.rs
> +++ b/rust/uapi/lib.rs
> @@ -28,6 +28,7 @@
>      unsafe_op_in_unsafe_fn
>  )]
>  #![cfg_attr(CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES, allow(unnecessary_t=
ransmutes))]
> +#![feature(cfi_encoding)]
>
>  // Manual definition of blocklisted types.
>  type __kernel_size_t =3D usize;
>
> ---
> base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
> change-id: 20260105-cfi-lru-status-60d05fe6f93b
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>
