Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F54019FA93
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 01:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767232017; cv=none; b=DXuFcahjOZtMWw8GD85Pd/iW4VIBAzTVH/hZOTdkeRibtAJmAcLL7Cs3zkdgC18pIEg+gflhC3bYkXoOfOgpZZGTJJpxrUu7W2fUZfFan+VI14J0twOxq9iebevmglXDZWHii90bNl2YBodzaqiDetO+6jwm/Ed6BsKje/mDAhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767232017; c=relaxed/simple;
	bh=OwAEoP6xOTP+zVAos3P25BD8p5EUUy0svN+As5Uvd7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G0W21K0C39rMjzWYeWRuiLFbO2qwS2881mifM0GUcf8nNyMIAvS0MLkuTAMLYChdwBQWQKKHLO8sc8yVbxABJIxoY+CSSy3ggxV/vhcS4kzrVZlzy2HNVDzh5iqNWqQmUevJf288DZOgnVZnnBQnEbEtHa9vbzcX0dMIsc8T2iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sv2DQcS8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sv2DQcS8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so81829665e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 17:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767232013; x=1767836813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUFQ3r9vRm9PPhHEl5qDSm4YBwEc3b9uWNALfgNAvKA=;
        b=Sv2DQcS8nrrv7CJ0sJ2J/ZHV4L8bz5yyCZ6QrxfPAS+ZjbA+r2qvyeVyV4acRg1TUR
         nxcoM7hmYb5X2MHa55LOkiy2ZpI0FP3dUV8JqMkw7pjEL/PTvBy+eXGkRzrSH8VaXd98
         uW9EohhL2By1qKtsTH4O6hRmNW+2NrDCEuEIuc2IKNc3eFIjO14QBLR+yVunHLr7Oqtj
         8u/rDh1iKcbsGHohTMLEyt5AKz0HRc6OQl1CpIFQIR2nvgoMQLZns1mU+15rps11yHYJ
         B7ooNY3V9LJBNlL+vbbuReE43vxlw1AsfvQQc9PJpBwi1nZAOHsYC8UaqUdYJFZhAFK9
         O1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767232013; x=1767836813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JUFQ3r9vRm9PPhHEl5qDSm4YBwEc3b9uWNALfgNAvKA=;
        b=XR+Ki9kmr5Jajb0b+KQbfi8HobblW38N76VhIoDoyJUlEipeQy7XGq7i1PtBIJVwQJ
         XoMnU25Nyf55dnweeZ7bYmhkPTsONL+e/WYt45Et0OCUUPlNsu7w/Gv0Mi0hBGxw9vyA
         FLU3f71KyrGGgj1e7rQA/m4o4/ODA6Eije4Q2fikeu1BjgxCAQd2D3b8Zx97UpR3i6Ri
         HPkpn8+Y1s3o1N4si+OqsPmRc7MKbXM32zVhumqa4aJh6gmiN5PKy+srHDUB1/qjvoiD
         CzskvFA+WLdqt/qny3KJvc18KXPLMM3Ld9ns/xg+4LeC7wwUMRSWmu7Bnt8sxCQpLicL
         3czg==
X-Forwarded-Encrypted: i=1; AJvYcCVOsAM9DFyDBfxb9/oZ2iwOxDBHyxT4uBNfdTeXj0hTHj/3KdFAtJrFy2nG51RQdy57Fcz7ufFH1vHjML7T+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQoUP9iwDz0ZrBbYyRUlThb0QKBpfC6u+uiSdmgGPznvxGlnO
	fyW81gnMVyZPf0BAqVdr2MYfUwlpxWJPnxUiDaUc5JAhBHIV7yKJ9IlEqUohfGuoPPiDBuLcf3z
	1IqHLPOyfUqYO57dw6iHejy4n57AMnPKJR3KRr1kg
X-Gm-Gg: AY/fxX566iKToSjCUHlErnb9CTjN1iwrEBWfmmd3Pv/S4zJakIPg/ZKphNEbylPE4cS
	uxCANaiNlQcoTfivMMgC6vLaEtCcr0mVIx1MWebY8n+B945B9+WxKx7e5tKj9OnIRHd1K8KAOYO
	6RgLuMGHZoBk5LAOa4WJKjhAhmvT5BXVUiwj45ufBBzVQp6QCgrQQh32+JLq/XK7k8C0C9Qse2T
	WyyR848e8Lm/8lgmmHZ4zq2FgF7UiY6gxX6kkR7OashnKbYMn0IBI6LSm89HT/KuImn6bFVdDyC
	pfhXOm4bYgQw6ZljWj4CPR2YLIYGmR5yf3N+
X-Google-Smtp-Source: AGHT+IHaIUqf59ZT3bq9RthuJQlgZIS+ARA2SK1ons6aFQ74dbO6M8n+yd1MlI13mzCUEK6fVSuvOhZRY05it6OgTiI=
X-Received: by 2002:a05:600c:8b11:b0:477:55ce:f3bc with SMTP id
 5b1f17b1804b1-47d2d273515mr423123715e9.19.1767232013375; Wed, 31 Dec 2025
 17:46:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251229072157.3857053-1-sunke@kylinos.cn> <20251229072157.3857053-2-sunke@kylinos.cn>
 <aVKN0Q-6bsHGq_Gy@smile.fi.intel.com> <aVT1N1NHQDCe2Dn8@google.com> <CALpAb9O0cvg+bPy5tD_BbE9kwHyTy99jvgp=xuwNqefTRWFiVg@mail.gmail.com>
In-Reply-To: <CALpAb9O0cvg+bPy5tD_BbE9kwHyTy99jvgp=xuwNqefTRWFiVg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Jan 2026 02:46:41 +0100
X-Gm-Features: AQt7F2qObr69EM_AUiJN7ttshzhGZtovvAaLvYJgmC6XsogE5cfYH-EJF2K5Vns
Message-ID: <CAH5fLgiPG7M7W+LracNLN7xaVQtwBqK-D07MjCrR_0MZdG6MvA@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] lib/vsprintf: Export functions for Rust pointer
 formatting support
To: =?UTF-8?B?5a2Z56eR?= <sk.alvin.x@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dirk Behme <dirk.behme@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	John Ogness <john.ogness@linutronix.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Andrew Morton <akpm@linux-foundation.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 1, 2026 at 2:43=E2=80=AFAM =E5=AD=99=E7=A7=91 <sk.alvin.x@gmail=
.com> wrote:
>
> On Wed, Dec 31, 2025 at 6:04=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > On Mon, Dec 29, 2025 at 04:18:57PM +0200, Andy Shevchenko wrote:
> > > On Mon, Dec 29, 2025 at 03:21:19PM +0800, Ke Sun wrote:
> > > > Export ptr_to_hashval() and extract kptr_restrict_value() to enable
> > > > Rust code to use kernel pointer formatting functionality.
> > > >
> > > > - Export ptr_to_hashval() with EXPORT_SYMBOL_GPL for pointer hashin=
g.
> > > >   This function is used to hash kernel pointers before printing the=
m,
> > > >   preventing information leaks about kernel memory layout.
> > > >
> > > > - Extract kptr_restrict handling logic from restricted_pointer() in=
to
> > > >   a separate exported function kptr_restrict_value() that can be
> > > >   reused by both restricted_pointer() (for %pK format specifier) an=
d
> > > >   Rust code.
> > > >
> > > > The kptr_restrict_value() function:
> > > > - Returns 0, 1, or 2 to indicate the kptr_restrict sysctl value
> > > > - Returns -1 for error case (IRQ context with kptr_restrict=3D=3D1)
> > > > - Modifies the pointer value through @pptr parameter when needed
> > > >   (sets to NULL when access should be restricted)
> > > >
> > > > These functions are needed for the HashedPtr and RestrictedPtr wrap=
per
> > > > types in rust/kernel/ptr.rs to provide safe pointer formatting that
> > > > matches C kernel patterns.
> > > >
> > > > This refactoring:
> > > > - Allows restricted_pointer() to reuse the common logic while
> > > >   maintaining the same behavior
> > > > - Enables Rust code to use the same kptr_restrict handling logic
> > > > - Reduces code duplication
> > >
> > > ...
> > >
> > > > +EXPORT_SYMBOL_GPL(ptr_to_hashval);
> > >
> > > I do not like this. At bare minimum we should make sure it's namespac=
ed, so the
> > > author of the code deliberately needs to import it (I'm talking about=
 C side).
> > >
> > > Ideally we should have something which is Rust specific, like
> > >
> > > EXPORT_SYMBOL_FOR_RUST_ONLY(foo);
> > >
> > > Can we do that first?
> >
> > We don't have an EXPORT_SYMBOL_FOR_RUST_ONLY(). The closest there is
> > would be to place it in rust/helpers/, since such symbols won't be
> > available to C modules once we land this:
> >
> > https://lore.kernel.org/all/20251202-inline-helpers-v1-0-879dae33a66a@g=
oogle.com/
>
> Does the inline helpers feature also support GCC builds, or is it
> limited to Clang only?

Clang only.

Alice
