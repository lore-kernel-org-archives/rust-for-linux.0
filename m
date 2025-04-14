Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211C5289352
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639990; cv=none; b=ShInrtNiMRqCQGuZk9zGTvugTshRG9MFwhWB8buLxFeYk/h59/H0MSjSfGsTjpCHLIogJNQonx7S0xGxl8uQXTeUYGl//qwUn9qHoIPQmE/7Oe84LXlNIpT3JZqw09uVAzy7201nc1JNQj3eAIo1SAuPEEPujal6kqIjIEOsm7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639990; c=relaxed/simple;
	bh=JGu0at/RD2vqhxqMJrfihAdf+64Bi0oxbT0As0hZ3HY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HmkiTUOWTUGgbLRtOD3Leu1afMmvLBmEYIkgfEH+DA9zszYHBMkThJ1dq0E4JWQQQFbJc5TrZJDYYMj3VLFqudxWbwQHVLdwgmNnmTrqQBZ4WIaJtddRcg01olrJqJOhkxDvBn5ibN9Q/OK6zrzY94r0EIJYKfxDzNYwWXjtXdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YNMujR3+; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YNMujR3+"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43efa869b19so30850805e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 07:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744639987; x=1745244787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qyjN4QQdDtsuyJsBJ3ZLaKa0PbRDX12PvwRR8lghAo=;
        b=YNMujR3+p4ff51BEkga28F4VXcAAVFZCyDm7rCz251qHawXoyqhojpHzMQ1b37bApr
         4y94c8KssTAMICFDL84CIDjP5ARxv91j5ocsIfNuxbC7VFHrmmfBnRV7FsDPJGopbj0k
         LZCaRAI0LEMOSbmx2eak4ECfEXHbqJ1OKxVeASGcsTJFtJvLx8LWeVlNXNmn8kQ8ZWPL
         2bIOWBry48uZGaBNKMr02FuM3WFsMevbZ5NnlJ+8iqkQTjp/xkRHSw5EjcQwcYpSBcYV
         8prgcN82tqV7DRvJpYNIHpgqRMMHMDgYEdIWOhoZ6LIMJekpYbK2pjj5PNLcx+GRyC0X
         USIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744639987; x=1745244787;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9qyjN4QQdDtsuyJsBJ3ZLaKa0PbRDX12PvwRR8lghAo=;
        b=Y//qSvdce6ZemAD1HZNdi5inJu30INccKYGbLmEQ1Oa8YFjuil0vJr7QVcg83enTTX
         DIe/vJpYEAP+WVVzMUek8lh0pRgT61VPRkGYaHMP6q+I4dEEgd9IyMtEQyvMM7S0PEt1
         mL512UlbiFqtgCz84WREBNKvGd1EoAXUJchB/pbX7LkW42xbUzVB5ARdjNcLIeX8bzJl
         qLiAMVJ4IsEEjuIxXQLJEtffBdrn1ATfnLt3lFWjQcqJSwZq/lCymt4bbd6eqvvH7S9V
         FybgQ8z6YwTchjK0D7UT/oQldhfgs24nBuNJDF+ACqXzjCuFqIHyaSyen2D8COSfDhYz
         uUmg==
X-Forwarded-Encrypted: i=1; AJvYcCVnl24kkjarEPQR+Hr8/O4dpO4l063G8X4u9s8+TndaffwMxg90js9k1Mk/gtir84a3ej89goSoJEKolFg7yA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtl8rsBPvRpakfeOU6zLIFdyi4oHvxBkExC+bVvXk3nHI/Os5b
	zkA5bei6q4xZOISKKyv6pv2CnI8D6nOM75nHE7mGQ06Z2TsITTMqExBp4DCmawJTGBYJJhJk+As
	6dIprZVvvy27b/Q==
X-Google-Smtp-Source: AGHT+IGft2n73Jgd/n7sFueItrFb4zEsB1AkLjdcXqlT5WpXoWdbJLqYxkVeAdfukXvsCm+OlwDWnyhr39heiQY=
X-Received: from wmhu23.prod.google.com ([2002:a05:600c:a377:b0:43d:1d5b:1c79])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83c6:b0:43d:b85:1831 with SMTP id 5b1f17b1804b1-43f3a7d8c5emr126843825e9.0.1744639987578;
 Mon, 14 Apr 2025 07:13:07 -0700 (PDT)
Date: Mon, 14 Apr 2025 14:13:05 +0000
In-Reply-To: <CANiq72ngfTJ5PTYaJOOQ2NedERrLYzA62hL8Fgw5C4QkuZ2R-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250413005650.1745894-1-ojeda@kernel.org> <CAH5fLgiF0kZdOYaQi18_LTNx6Onq-5PBomA=bwS0m0z+C0wtvg@mail.gmail.com>
 <CANiq72ngfTJ5PTYaJOOQ2NedERrLYzA62hL8Fgw5C4QkuZ2R-Q@mail.gmail.com>
Message-ID: <Z_0X8Z9M2H0mmcK8@google.com>
Subject: Re: [PATCH] rust: add C FFI types to the prelude
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 03:22:44PM +0200, Miguel Ojeda wrote:
> On Mon, Apr 14, 2025 at 10:47=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > I wonder if it would make more sense to rephrase this section to first
> > say that rfl has type aliases for the C integer types called c_int and
> > so on, then mention that they are available in the prelude, and then
> > at the end of the section have a note that we don't use the type
> > aliases from core::ffi. I think focusing on how to use C integer
> > types, rather than technical details about how they are defined, is
> > more relevant for a reader who is just looking for coding guidelines.
>=20
> Hmm... I see what you mean. In other places in the document, we start
> comparing with userspace Rust in order to establish a bit of context.
> But, more importantly, in this particular guideline I think it is
> quite important to say "do not use the usual ones", because they are
> actually different types, i.e. it is not just a style thing.
>=20
> I have thought a couple times about perhaps changing the overall style
> of the document to have a 1-liner short summary on each guideline --
> some books do something like that consistently. And perhaps an
> example, before a longer description. So something like the following,
> which is closer to what you are suggesting:
>=20
>     To refer to C types, use the FFI types (aliases) available from
> the `kernel` prelude, e.g. ``c_int``.
>=20
>     For instance:
>=20
>         ...
>=20
>     Refer to them with a single segment path: e.g. ``c_char`` instead
> of ``ffi::c_char`` or ``kernel::ffi::c_char``.
>=20
>     Do not use the `core::ffi::*` types -- they are different and some
> do not map to the correct C type.
>=20
> But even with this style, I think it is important putting the last
> sentence in the "1-liner summary". Otherwise, someone may skip the
> guideline thinking "oh, OK, it is just a style thing about using just
> small paths, I will fix it later", without realizing they are actually
> different sets of types unless they read the entire section, no?

Hmm. Maybe, but I think having it at the end is okay. Could we catch
core::ffi with checkpath instead of clippy? Just search for core::ffi?

Alice
