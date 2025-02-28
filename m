Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFAA1A8F9E
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 17:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740762388; cv=none; b=eAaD9a9YAR8YRieL2A/cRSx/dqKK/GZaZIMUrYa86Ligu+6bltfF92LHPsZFdLMzEH4asx2HYDGveZtHYmr1ZaSnjYRQ0mvZIzIB+nuxW3m5cnD2WCEeSCe+hcbe45RmytjuS/IQsi7ovb5wxYr6SmUvsHeyqOA5QMaLJYoHPuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740762388; c=relaxed/simple;
	bh=VWmFGCABa0pv1TCNeYp/ZP8I5mJzFRwaPNyu0lUh9CU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tWhrPgAqwFyj1nZS3a5pXiHBDM4CX+esbDEOtVtbt1KjJJdu5IEiZxz1owq+dN+L7K8PoVFouMroDnRRAVWCIdv5rGn7ZvXbJ4H0mDVRCq6do+wUiSsaEnS7F70571+uHbGEHhXaAlXOgkr/qNhgG4LOjxzplp+bkz26/Yo+0GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LxXPIVMj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LxXPIVMj"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-439946a49e1so15785745e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 09:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740762385; x=1741367185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8J7XRbUO8s3OMSTjgDPwmLEa55ajEPIZbcN5bhy+Zm8=;
        b=LxXPIVMj8XGdZr1vEXLSGd1Ha0QNOk+3yL5fgRl9KT0B0c9fOgjZOzkbRAnaXW7FJE
         6EB5eJyT/KgqYVQrYtwhC1eYsR+fARo7FCqsvNUjgQm2HLuqMXQVsH3NF5WlaGS7e//h
         9gmfe0PgEocQkgieZaUqZDTQ+1ZtYgpB1T4nDGOlRB9dddkmE6d2ZZWPqv5wgnjH1IOU
         f9gTEW1zWMiAuITyfx68nvRi6eIYz17d6KStnlGG1fYElo7j0ceQsv2jOfGUONs1kQpj
         OxXDMa8eayOiXfFrok+QrDzkeAhq/70X+rHT80cLzc5HwNrPylGzU02ep0wUkT9BWX2X
         oc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740762385; x=1741367185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8J7XRbUO8s3OMSTjgDPwmLEa55ajEPIZbcN5bhy+Zm8=;
        b=ZK5DYf7qSdsQIsmctsyE2ILlMAIY0E23KQiSj+ACe13lqMEJkZL53wYIcnbhBH/NS3
         wSew/7BZ7UKQe+njae1VoUza8w3qzh8bH9Vg/QQHEpNHB60pzSqhwQZIfVFO1N7wdRYa
         qMHR3qYqd1s3Vc2h/TXhIB29eeMZYbw6olKBIlveYnS75SkVTQVGwvWebQy4z4vWyDUC
         KRyCsUd5hr3NfLCJtHiEvVcABkLypHf3o63aiGB57Vz5UkRnAWIqhHj5lkK1dlOqWWHR
         772iIAaRvUH3wWlSp8fxhLWFAv9tK9ZLd1Vk0RWH1Qp4SPwEMt29mBFbSZIKVCwRQXiV
         8JYw==
X-Forwarded-Encrypted: i=1; AJvYcCWo4A15Nj7blINZGDPwLfhSKKBCorIPi1Qjbgs/AnSyMlrs/p4RPHzwiqjZte6IxVv6cYcW7LfsjG4X8E93qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/sHrzncmwE5pbJIevRGtffQ2LVdGzmVMXU2js2hgal5fWtHPX
	ZJhJghlySag4EZhw/OKiZ+0wcdBt6ov/f3Tk+eQo19i8JBbxuKoOiXkpb+BfK7Ei/Z5+y6kPp7z
	fNT9VQbRhzlJ/goWvMPnFJwT4abo7/ia/vNRE
X-Gm-Gg: ASbGnctaADRn8XlamXNHZ03wp8zzMMgzOKISsSV8WJuXD1LNUajrnpFPlZ8KA5+1xIm
	myBtuOtB5zkRfZb5oh/HZ/tl2pUHw5qEBo+Z+l2ZKs7Xnl9PC0t8KJ3bQiWEaUZLGd4YwODCXP3
	2kHFBuYepLlNlnRx735HIw7iKibkt9Z1+0ZOoPMw==
X-Google-Smtp-Source: AGHT+IGlaOMRAb3FBENNcM1UpxAeatCxuxY4R0HU08j6zwUOfzVpBddZU5SLuHwSVik/ichM9YhZ8FQYMw2m3XlZA44=
X-Received: by 2002:a05:6000:156d:b0:390:ea19:d182 with SMTP id
 ffacd0b85a97d-390ec7c9728mr3305637f8f.6.1740762384884; Fri, 28 Feb 2025
 09:06:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-5-569cc7e8926c@google.com> <Z8HXkmtrMMD1dATZ@smile.fi.intel.com>
In-Reply-To: <Z8HXkmtrMMD1dATZ@smile.fi.intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Feb 2025 18:06:10 +0100
X-Gm-Features: AQ5f1JrjAqJMHRTMCmPZewHqljlFejgu-x6ogb8CTEif1RrVq7g5QcIIk07OtMo
Message-ID: <CAH5fLghO2BhDqs50_ke1ci7kR0ze66qAWQUxzX5-M4403Yc-8w@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] panic_qr: use new #[export] macro
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 4:34=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Feb 28, 2025 at 12:39:34PM +0000, Alice Ryhl wrote:
> > This validates at compile time that the signatures match what is in the
> > header file. It highlights one annoyance with the compile-time check,
> > which is that it can only be used with functions marked unsafe.
> >
> > If the function is not unsafe, then this error is emitted:
> >
> > error[E0308]: `if` and `else` have incompatible types
> >    --> <linux>/drivers/gpu/drm/drm_panic_qr.rs:987:19
> >     |
> > 986 | #[export]
> >     | --------- expected because of this
> > 987 | pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len=
: usize) -> usize {
> >     |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^ expected unsafe fn, =
found safe fn
> >     |
> >     =3D note: expected fn item `unsafe extern "C" fn(_, _) -> _ {kernel=
::bindings::drm_panic_qr_max_data_size}`
> >                found fn item `extern "C" fn(_, _) -> _ {drm_panic_qr_ma=
x_data_size}`
>
> ...
>
> > +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> > +extern size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
> > +
> > +extern u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data=
_len, size_t data_size,
> > +                             u8 *tmp, size_t tmp_size);
>
> Is extern needed?

I doubt it. I just copied the declaration without changing it.

Alice
