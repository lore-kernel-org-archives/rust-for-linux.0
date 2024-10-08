Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F02C1D043D
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Oct 2024 06:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370753; cv=none; b=GsVuFZ1xvnkvteIitCDcuXZm0eFJc6ZhM0t96+o61aZTOGTI2HlNiJFDBwOajT4alwRwucPZhWDQu7ZNIicMSkd9x33ntKm2EzL4XXHfr5U4i9EZ+1Cd313m0Mlc/VPsNwAdyQJuSr5xEz/Kj4TDvGGmQ6FxfAyXn44w1b7kza0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370753; c=relaxed/simple;
	bh=oJR3Cvsj4mdY9Zhj2HptFiVVCgBa1IFIoW1TZ1Qile4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHRx8pCvxBG016Q8xptEQmlHgRMTAJHHBn5MUgWyiCeS0hn2T6N/ZeuEQKG8U4JR/fhtZGDWmihLyMXbO2UcXotTuvlpUB1THUYbgJ/tmC6G/Dh7PTKQIG2k/D7ZUVZ1X7I/Ptp6185T9yog2PS0wv93tdfJzlDLmFLwpjRdrHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q8XsOr7v; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q8XsOr7v"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cae102702so41949595e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Oct 2024 23:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728370749; x=1728975549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wDPVRuF+gE8nk3bfD8PSNaGMAcOxTIyBlL3AkxHFE0=;
        b=Q8XsOr7vRs4YNXYf7ZnfTa/Mbc8GKF2FJQv8VAW8vdlaeXz3w/nRmZEjcUDT0fFSYD
         JBc095+M+LI/ja2XuSFm0upmEEVzTKjGXCrfZT2OqeG3IE8tOKc0ZjfeJ+zyBpYST2E6
         umhCrFwxcttIn67Z7ACbaxY+Cq/s/71uWSu2burrv/kN/rKXEj0cXxDeaKzYGKlErAci
         6c5b0RWxuXb1clqf5+vAVNtrGjO3oFQZV6l3ttEqmb/vRWrLDoLCRJgoyc8ujU/wp755
         GgYuetxKi0Uvx3gBPPN4KSM+UPlLOHIt3X1lv3OvJg24ICOAPcW+vFkGNlTKnnHg8CFe
         wBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728370749; x=1728975549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wDPVRuF+gE8nk3bfD8PSNaGMAcOxTIyBlL3AkxHFE0=;
        b=k3V16MNPxxN2lJt1FWHM+kY2z8KODNBP11LzfZHnBu6dHKlBJTNQpQWB6+V/psqb/u
         GNHgrP8y2xLKG4pjodppcUnbygM8enrArN256hzNSB3qXnHgU4knI3RIzTYNTSbOW+Yz
         cS04AbynGQ7C/yXycv+nhkqdlQRxwoQ5cyh3lYC58bU4UH/74pron8nN2bSsccfLRzaj
         EggwZR7b6fk7TcVpqGiB6Pxd1agpLwBX4usqtaZDcOLvOVWe+X0etBPZ2jPyizeYQopV
         48HuOkAQW9TNlA0ddqhaf6HnA/+mtJnXHveGTaajSYandKNfjr/PkwlwjXoRePn6iWhC
         vrUA==
X-Gm-Message-State: AOJu0Yy4fF77E2mAnD9AA+IrC+DUd8BizJrY7McxgK584/S5LLf5/yOS
	xfqu+avT3km3mPLrMXeRCkAPiNAoRM26ilK02jPBpzeEGbb6B7dGucJ9MApVrJ2upsOYN9kcM9g
	BAENqjkm2l1Iavh3/DPgPbhRQwDQBJJ718cA9
X-Google-Smtp-Source: AGHT+IGDwsCEyyEhhOql38T5suKWRdwQAZlmJjv88CFz+8dzkPID5Y6WRgfUL2vVw0fwOh08hpe6EPk0b4SvpueBzLE=
X-Received: by 2002:a05:600c:3acb:b0:42b:af5a:109 with SMTP id
 5b1f17b1804b1-42f8f59bce9mr51399435e9.24.1728370749355; Mon, 07 Oct 2024
 23:59:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007202752.3096472-1-abdiel.janulgue@gmail.com> <20241007202752.3096472-2-abdiel.janulgue@gmail.com>
In-Reply-To: <20241007202752.3096472-2-abdiel.janulgue@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 8 Oct 2024 08:58:56 +0200
Message-ID: <CAH5fLggkpELOx2mfz32d2C0xE_aSWs3GQHAkufq5H=30xB3MUQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: page: replace the page pointer wrapper with Opaque
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, dakr@redhat.com, 
	linux-kernel@vger.kernel.org, lyude@redhat.com, airlied@redhat.com, 
	miguel.ojeda.sandonis@gmail.com, boqun.feng@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 10:28=E2=80=AFPM Abdiel Janulgue
<abdiel.janulgue@gmail.com> wrote:
>
> Replace NonNull with Opaque to make it possible to cast to a Page pointer
> from a raw struct page pointer.
>
> Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
> ---
>  rust/kernel/page.rs | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 208a006d587c..08ff09a25223 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -8,8 +8,9 @@
>      error::code::*,
>      error::Result,
>      uaccess::UserSliceReader,
> +    types::Opaque,
>  };
> -use core::ptr::{self, NonNull};
> +use core::ptr::{self};
>
>  /// A bitwise shift for the page size.
>  pub const PAGE_SHIFT: usize =3D bindings::PAGE_SHIFT as usize;
> @@ -25,8 +26,9 @@
>  /// # Invariants
>  ///
>  /// The pointer is valid, and has ownership over the page.
> +#[repr(transparent)]
>  pub struct Page {
> -    page: NonNull<bindings::page>,
> +    page: Opaque<bindings::page>,
>  }
>
>  // SAFETY: Pages have no logic that relies on them staying on a given th=
read, so moving them across
> @@ -65,15 +67,20 @@ pub fn alloc_page(flags: Flags) -> Result<Self, Alloc=
Error> {
>          // SAFETY: Depending on the value of `gfp_flags`, this call may =
sleep. Other than that, it
>          // is always safe to call this method.
>          let page =3D unsafe { bindings::alloc_pages(flags.as_raw(), 0) }=
;
> -        let page =3D NonNull::new(page).ok_or(AllocError)?;
> +        if page.is_null() {
> +            return Err(AllocError);
> +        }
> +        // CAST: Self` is a `repr(transparent)` wrapper around `bindings=
::page`.
> +        let ptr =3D page.cast::<Self>();
>          // INVARIANT: We just successfully allocated a page, so we now h=
ave ownership of the newly
>          // allocated page. We transfer that ownership to the new `Page` =
object.
> -        Ok(Self { page })
> +        // SAFETY: According to invariant above ptr is valid.
> +        Ok(unsafe { ptr::read(ptr) })

Using `ptr::read` on the page is definitely not okay. That duplicates
the contents of the `struct page`. You'll need some sort of pointer
type around `Page` instead.

Alice
