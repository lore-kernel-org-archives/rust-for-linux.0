Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE31329A9C3
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 15:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921226; cv=pass; b=MQEYx0tLNVoTEXCaYvyRb0ChTcSAeWPGne2ryrZAPQYphTW2s0pBWkLMHUOA6uQk7I7rz8nSF5yuqQxc4VDnS/NCsVUMg/d/P/CWxTbt6ZX2vtAz/7OCGriwL9M5uXTj6dt4ven2B6Nls8qFMBChOl+EDv3L+VYCRRcbheDrZp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921226; c=relaxed/simple;
	bh=eCRx2JPQZx3ZvKTps6ymy9n1zPP8OVOc8iEEBj86Fzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+VR1RkqXQbEWJek1brgF40RuxQ04uVUKe1vij74L0cTWzniqhAjqa2It9sdMPSMrAIHl+25Bn7s9wY62tG3LP0Fmp0rh/mMVoFTTZmzGxUMML9hX2T8UeTmrykUICS+IT0l4biU7g5C520GAIbGfvEbMR/XPeGO/RxErcEVHmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5NDBiUX; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5NDBiUX"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c3e921afad1so2295408a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 07:00:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768921224; cv=none;
        d=google.com; s=arc-20240605;
        b=D8KCuAM4/aX0PTqja+RpwJUXhId3EmRDAsxr1xB0IpcFVqv6174cNoZL72j3h9v17L
         Vyc9Inb2lJttTfC+CeHZFbh6xBG/yMftEnolGYAzCHuiB5Up5zEjfjnV8rsvuJatYNDW
         UXkteqpp8whoIMX5iIWrTVB/gcvmJY1vW5G2hGdvhKkfigUwHof0BBX52FimCY2+U39J
         psFoqn3dHTcrCXWekpuwSbrqqjqGTwAxsWREXTnC+8gd6pP+OvVvIaMGtOcNElU1aAGh
         hNXEcPCbtBZu/qlghAFESBU7EDgw3ai08IboXCT4u/B/mIrnR5o9iMUusLCTFYOSWzdx
         47jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ntN0FZOXCuO4g6oSeU/oj/orWdbf+RbpRvRGbr360pw=;
        fh=sdl9p+zPLWbAe95Wg8dCcOd8wkwVCRyWFaYr2I90dOM=;
        b=RJN9hcrCEIAK/gIJtsFjEAwhuXUl7sUgIAyrs0kvW767SlPaE5yqfPSHw6qkdXE9wc
         BxWzPBjM0xNzmjQjjOvOguCSwGGbKuNUgQZmimEElnetD0ijSjHwnnGjHTNh7JNjZHoL
         ZFNdyT0IBf/eAdR9kJazRaYTsRDe4g4j/Ymy8NMP3p1X3c/YtK+kT5sbrMqlQHRvpd8L
         l2pel17pvletscx+PPhIKxqtpG6HnMWaO4MUvvz6qiDxQj1vmjVdd2sgyK/Wd2A5F3uz
         RjfVVeCBss+pDAXNadsuSkNgFtwvD7cBiUvyptPxj4xShf86S+rZGLmrLq+RBqPLfKLL
         hWZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768921224; x=1769526024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntN0FZOXCuO4g6oSeU/oj/orWdbf+RbpRvRGbr360pw=;
        b=a5NDBiUX5vtJT8lC3C9aqlC/zrbHGf49Llqi87uGCrJO1f7rdfJmPQJrZ9SsjEiU7E
         n31NAkFJ/ly2IDC4ESYdia7emawlZRYfltLg40qSNku/wwaVTtPfdXmC57uU8rUQKsHn
         byiB6FekTYZ4/DnyPq6M3hmLQnmD9pafnryDs3FTg1CSu2RJGw9S0LoVFI26xOPx7qVH
         qYIFMk3Wj3lfjZkyCQ4rPM8QnyeoSgZs7tloM9cKWhIcqGkP51+m3wL6LkuyOaADJ9mg
         RzKzKwOq4pciAL8fGDKqTDpkMtFlNbehMi3ObcUGZ2bR0bkuUU8dEEVI/EJ0I68w79cf
         mlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768921224; x=1769526024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ntN0FZOXCuO4g6oSeU/oj/orWdbf+RbpRvRGbr360pw=;
        b=n0o5+7C2KSQH6jZp3I94U5nmJamM2Keom2RqHFoYe+cmug8SxLFbsCNzJ4bV+PXJ3j
         uLVEvVJSiRCV+XdXZGQjPysIC//50ck43OK9T1BVD7t0YsO4CiKMkIyWRAIPdc1S1zuD
         8Zk5LCjMZLXB9AA4HF3KtW60bAHGVLwmn7mrDKJQsC3LspQwyDxJ0LvpzMvxqJpWQBVX
         dIzNhtsfJsYY2mWyB/me7Y4BX1fvuhzI5PuGJ0JnaWFokF7BaQ6KDbQhVnQPXXnv6bhD
         9nCXsRam4Oi60bHikPBoQSpst6JgCpzXisjXNBeu3bKPT3o3QaYd/E6TzsYM1fLePz9A
         QBhw==
X-Gm-Message-State: AOJu0YxjE9q3REo4V7/kGD3nBfMgg/PC3FbXqISMn2qoT/1cpqw3ClRV
	PoZmc4UKDLqCleIU0J6vrE8ps9VuBXPzCF5E4cAWmDWOZBrPd2cjjTcjfJ1y0IGMiesOliQutrn
	UJWmBbtxkmkCIwsEL8CcrhpYYFKd6ahk=
X-Gm-Gg: AZuq6aJPqyZHJqzh6rU+kmVR+RbTXgXu6qM4p9r2P9rDtFj2D2DYzHY/xrHCP5i+R6X
	C/RaDYSKts1pRBpsQQGD5iT/ZsgZ2eQ5GtzWbNaes8k3eYjLaadOThsvTnOCdX+ARHiQXMRoZdZ
	ClVE4H8F8kB2mmFh4B6R/qMdFbr6ktLhYkAdtkxoZ5NnBqQHYUXzKvPa0NGvw7B4DDiQEedlgTF
	WWNsaRtMhrUqZPzTYPvQHBIj55J4qMrfK4iKHjg/NpZ4B6VavoHYwgc5Thu2hjCj+HvpVEDQQfe
	d7iaiDifNZ3WHiiVoX6XhWlDnlZKFjY5vv2e8PLaGw==
X-Received: by 2002:a17:90b:248f:b0:34c:fe7e:84fe with SMTP id
 98e67ed59e1d1-352c4078ce9mr1038446a91.28.1768921223677; Tue, 20 Jan 2026
 07:00:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120140235.126919-1-foster.ryan.r@gmail.com> <DFTI0P4F3UR9.14CA9H3I19GCB@garyguo.net>
In-Reply-To: <DFTI0P4F3UR9.14CA9H3I19GCB@garyguo.net>
From: ryan foster <foster.ryan.r@gmail.com>
Date: Tue, 20 Jan 2026 07:00:11 -0800
X-Gm-Features: AZwV_QjeGRbyhZcETrF_TlxFkw6vcha9H78rOCj2rh-0zrtc3n41bt0LtnhvBhY
Message-ID: <CAHtS32__f9=ndqaueWUB1SuuppR2L+ye8b2XeNP4qOindTSoSA@mail.gmail.com>
Subject: Re: [PATCH] rust: replace `kernel::c_str!` with C-Strings in seq_file
 and device
To: Gary Guo <gary@garyguo.net>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, boqun.feng@gmail.com, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, gregkh@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gary,
Thi is now fixed, great catch thanks.

Best ,Ryan

On Tue, Jan 20, 2026 at 6:50=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Jan 20, 2026 at 2:02 PM GMT, Ryan Foster wrote:
> > C-String literals were added in Rust 1.77. Replace instances of
> > `kernel::c_str!` with C-String literals where possible.
> >
> > This patch updates seq_file and device modules to use the native
> > C-string literal syntax (c"...") instead of the kernel::c_str! macro.
> >
> > Signed-off-by: Ryan Foster <foster.ryan.r@gmail.com>
> > ---
> >  rust/kernel/device.rs   | 5 +----
> >  rust/kernel/seq_file.rs | 4 ++--
> >  2 files changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> > index 71b200df0f40..1c3d1d962d15 100644
> > --- a/rust/kernel/device.rs
> > +++ b/rust/kernel/device.rs
> > @@ -12,9 +12,6 @@
> >  };
> >  use core::{any::TypeId, marker::PhantomData, ptr};
> >
> > -#[cfg(CONFIG_PRINTK)]
> > -use crate::c_str;
> > -
> >  pub mod property;
> >
> >  // Assert that we can `read()` / `write()` a `TypeId` instance from / =
into `struct driver_type`.
> > @@ -462,7 +459,7 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Ar=
guments<'_>) {
> >              bindings::_dev_printk(
> >                  klevel.as_ptr().cast::<crate::ffi::c_char>(),
> >                  self.as_raw(),
> > -                c_str!("%pA").as_char_ptr(),
> > +                c"%pA".as_char_ptr(),
> >                  core::ptr::from_ref(&msg).cast::<crate::ffi::c_void>()=
,
> >              )
> >          };
> > diff --git a/rust/kernel/seq_file.rs b/rust/kernel/seq_file.rs
> > index 855e533813a6..518265558d66 100644
> > --- a/rust/kernel/seq_file.rs
> > +++ b/rust/kernel/seq_file.rs
> > @@ -4,7 +4,7 @@
> >  //!
> >  //! C header: [`include/linux/seq_file.h`](srctree/include/linux/seq_f=
ile.h)
> >
> > -use crate::{bindings, c_str, fmt, str::CStrExt as _, types::NotThreadS=
afe, types::Opaque};
> > +use crate::{bindings, fmt, str::CStrExt as _, types::NotThreadSafe, ty=
pes::Opaque};
>
> As you're changing the import list, can you also convert it to the new ke=
rnel
> import style?
>
> Best,
> Gary
>
> >
> >  /// A utility for generating the contents of a seq file.
> >  #[repr(transparent)]
> > @@ -36,7 +36,7 @@ pub fn call_printf(&self, args: fmt::Arguments<'_>) {
> >          unsafe {
> >              bindings::seq_printf(
> >                  self.inner.get(),
> > -                c_str!("%pA").as_char_ptr(),
> > +                c"%pA".as_char_ptr(),
> >                  core::ptr::from_ref(&args).cast::<crate::ffi::c_void>(=
),
> >              );
> >          }
>
