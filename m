Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471852528F3
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 08:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740732278; cv=none; b=Tqq/BBtVv3la5ksKlz5hnoZGbMBzn0beTtLjszT8nitQsNT0lDrbpt0gFaxX5Lu7FRQDGXu7U901Yyz73Wa8ZwnuGnJloaNKZF8oAAeutPvuwEWGcjBGVU+IP82XAY+EEPHTRrDRFXJlCqB8xyOu8XeSFSg9Douuqbnqe0LRffk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740732278; c=relaxed/simple;
	bh=rJ99Rgrwd48M3vkF+RIcpmzBAXe1RpM3mGRPgHCqcdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SSUTRLkRbaPj+d1l6PQcgozNYAG/Acce8ayv5JNcvDM/L6u44K2rc+MphLisxBcIvHEiOa+E2iwsetgm9QfH7ZuYgpLCCymHh5Kd38VqQ67HZtSwgvkFHXjrGoI+j14tg8SA+INMIcm2/1dnn1w/za6cpMa5e1mdCNcemJmMQGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TiJspgGN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TiJspgGN"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-390df942558so1404779f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 00:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740732274; x=1741337074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOxiVL/4Is0kUFnkic7+UTCC19Fblnv5O4EMApXB9Gc=;
        b=TiJspgGN/6I7qmGXhwBlwNLFcGGVlcHs2VgJHn2CCpQC/M0i531r5IHJEZtJdcDEiq
         YFSYFOmDSgjTmg+kWe/wu7D07H+ZzvO8259oSjz/0D60hp0FZle3RJ96P9GVSTrVPn6B
         ZkILfEabNvq70U/kFjG6s2nJ/tNc367xYzLbid3ioRpyp5no+qQxOrOzUSAx2pg/H1DG
         8Hx8VmOf8ZNe7GNUJh8fLkpVYpwI2M7YBdvBA0ZbarPf9P0JLEXqFHZBOMNfodTDIKKz
         pzBcbYN9xM8CG7hw5ACvH/hbtgVkBh7sG174sUUhkQERJRUYZCferHudsY2rc2Df1N2n
         ZgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740732274; x=1741337074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOxiVL/4Is0kUFnkic7+UTCC19Fblnv5O4EMApXB9Gc=;
        b=gGemWHplPAoGeOp5rJxXAFce+NF5iQQP2uCk+HS7HaP4OEv5kI5lvk+n2/qiyzezPa
         T9QeebHFowAEjfl67DEM4iQ7JRmRAO4pDXTvH+CHgLyfCiqAFU08rRn8iMWiT8NJWPLa
         sM8VBe2cJIX+8S7b85U1AmXC3kF9CfzIUlPZzEm8slXOdBns6Bov2paOXxRCrmZWGsZA
         3AEjbgP3FDkE5uUCh4hW5exUyzl0/AgTXRQYLdZvb9z+TD3M25i47eY22ZRLilAglkDs
         V2I88MZj5ctu5bJ7Xmv5GzUCdCQdF4tUvI55jQCZehrecjWrYI3iIHpYknNc9+a95E0q
         IPNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6O8Ycah1uPk2el1P6plPksZPzGXh8+CuReYbLMMhSoHspa7zDRGafnukBm6BjGHoVtZuABLhu+cX9WVaHEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkP3Z67v1Y7SHZmxuvlHtsCK6M2YWlUrAV2ALdJnsVdLKOGe7X
	ZgcejF/HA8zsoG4G7hw8NpxiKK7ojx0TAXRlvsGVDdE+He5JcUELY8bMzk3oUZSJ6xLfaHvipIU
	+JRsH+dFh+lCkgRuqdnPBQ+aM8m/2J13IQyEo
X-Gm-Gg: ASbGncu7tlhSwpOy6KH5jlFGLv2xX7BeOZlTxRol6zF9h0ZXqOlbirsELueXhtxliL+
	WA7q+gyiuVfkJIUWfNhEY4xy8msT9Q5sWe87Uynf7C16gMRWSntrLh2jgtbTvUveOlEBX6vaMKA
	SB6efY7/+8iN2NlPgyEnF4Ui5MQwZzT+AjG9fQ
X-Google-Smtp-Source: AGHT+IHDCpdDmfH+NBkGICBqBloSnUKkAJpf/2fdReBq9ra852m/4DtL/k3NCUS+ytHHNljzKRaE7KY5cj/F7p1b24c=
X-Received: by 2002:a5d:5983:0:b0:390:e822:46de with SMTP id
 ffacd0b85a97d-390ec9dad21mr2091104f8f.33.1740732274407; Fri, 28 Feb 2025
 00:44:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227-export-macro-v1-0-948775fc37aa@google.com>
 <qxbD5y-rJZMJDMN1wtODJBCAdNtNdQFsYIDhZUex7KcbPiUvABElh5V8c9EFoAPZ7xQe_L8JS6MzAIqciAb12w==@protonmail.internalid>
 <20250227-export-macro-v1-1-948775fc37aa@google.com> <87v7suo5ay.fsf@kernel.org>
In-Reply-To: <87v7suo5ay.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Feb 2025 09:44:21 +0100
X-Gm-Features: AQ5f1JrXknBQCJv4d6JEhXtJTXzizHml9Tfu42Up3Etyslc_lFl3VblDtZu0QMs
Message-ID: <CAH5fLgjKoHpGS9ugxawwJJbb68trHEVvBCCNWFcNSbScGKpuDA@mail.gmail.com>
Subject: Re: [PATCH 1/4] rust: fix signature of rust_fmt_argument
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 9:20=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > Without this change, the rest of this series will emit the following
> > error message:
> >
> > error[E0308]: `if` and `else` have incompatible types
> >   --> <linux>/rust/kernel/print.rs:22:22
> >    |
> > 21 | #[export]
> >    | --------- expected because of this
> > 22 | unsafe extern "C" fn rust_fmt_argument(
> >    |                      ^^^^^^^^^^^^^^^^^ expected `u8`, found `i8`
> >    |
> >    =3D note: expected fn item `unsafe extern "C" fn(*mut u8, *mut u8, *=
mut c_void) -> *mut u8 {bindings::rust_fmt_argument}`
> >               found fn item `unsafe extern "C" fn(*mut i8, *mut i8, *co=
nst c_void) -> *mut i8 {print::rust_fmt_argument}`
> >
> > The error may be different depending on the architecture.
> >
> > Fixes: 787983da7718 ("vsprintf: add new `%pA` format specifier")
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  lib/vsprintf.c       | 2 +-
> >  rust/kernel/print.rs | 8 ++++----
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> > index 56fe96319292..a8ac4c4fffcf 100644
> > --- a/lib/vsprintf.c
> > +++ b/lib/vsprintf.c
> > @@ -2285,7 +2285,7 @@ int __init no_hash_pointers_enable(char *str)
> >  early_param("no_hash_pointers", no_hash_pointers_enable);
> >
> >  /* Used for Rust formatting ('%pA'). */
> > -char *rust_fmt_argument(char *buf, char *end, void *ptr);
> > +char *rust_fmt_argument(char *buf, char *end, const void *ptr);
> >
> >  /*
> >   * Show a '%p' thing.  A kernel extension is that the '%p' is followed
> > diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> > index b19ee490be58..8551631dedf1 100644
> > --- a/rust/kernel/print.rs
> > +++ b/rust/kernel/print.rs
> > @@ -6,13 +6,13 @@
> >  //!
> >  //! Reference: <https://docs.kernel.org/core-api/printk-basics.html>
> >
> > -use core::{
> > +use core::fmt;
> > +
> > +use crate::{
> >      ffi::{c_char, c_void},
> > -    fmt,
> > +    str::RawFormatter,
> >  };
> >
> > -use crate::str::RawFormatter;
> > -
> >  // Called from `vsprintf` with format specifier `%pA`.
> >  #[expect(clippy::missing_safety_doc)]
> >  #[no_mangle]
>
> The changes in this last hunk is not mentioned in the commit message.

The diff is rendered pretty poorly, but this is just importing
integers from crate::ffi instead of core::ffi, and I do believe that
the commit message makes it clear that this is needed.

Alice
