Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7C942049
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Jul 2025 17:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752685471; cv=none; b=AYIwbfZD96ranJA0KXt+EEctOzN1retF/61MJ0NoHFUlEW0iI8aORXbpPepfPRTupIJX93slEruEIRABTDFG3AvFj0FAPT+UAI7m5AFEQqgoQHbau2lVeXt2uUog+2Ord7gt4EIzGOS15QoXjHyYTaYCOpMfNtJ7/gSmHQ8iGjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752685471; c=relaxed/simple;
	bh=JjlAfthi00ocbVjlEpO3FDnsasQKvPCOhV9K+WlcWlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lrUuku/PPy33Hcb4pRUZqdu+KaDpSVFofoj90XbXze/e0j0KUVSM1WkiGbcxmwyPcLcN4oKDGWSajlYcKOa+FFT49/+MVqSGFn357OGhi4FbTzyuoEfB/rYtmTaWLpsgS1nWiiQXNlC+KiGkgLsG/umDgnIMD56s/DK5rc7afh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tVYhfcAo; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tVYhfcAo"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so644655e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Jul 2025 10:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752685468; x=1753290268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdZpNOLabO8DeswvXperi80nyiWpJf3rmbhZVDGE4+s=;
        b=tVYhfcAoem/bVWee1mRep8sP9tIfiMYYtN5SYHDahZIsGuqI72AsiZ1zd0tea0wUjd
         5EPZxvBogtSkVDce4Om0QUYdQiDyY4sy+1pK7qU0uxmd0nm3w5QPTGDpa+WWrRSBGCCD
         5dw9CkxAKT8QuWS42gutFfnmwuK4CsqwyQS+cK0DHaMT0qNq2BXH8Z99W37CRYyvgy+G
         Fv+ttgO/xTYV4iR865/B/bZyTfCJ1Sr+CpONEThTXMuixDWdWCV6LtMJTxhJthklqW1u
         W0Y30cfKj1pDpOCFI3LXI/EMrqI2Ae8ICcK/FiVNyYd9AvPGGuObJ3SugPGvBz1lfq9w
         w11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752685468; x=1753290268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdZpNOLabO8DeswvXperi80nyiWpJf3rmbhZVDGE4+s=;
        b=pD9Ihf5k+gD9XdG8KRpEGBc0BapUOrf7BhGFU3LdwtBQhOnXCEYK7eJTGpvu08JJEa
         wkKKZsyLMcIHUiWkBwyYzCulC8v5kfnxaQtQxu8E3wuYGNPUI+5Cip3Jm/E0GqwuhuC/
         I0KPP8aiEl/xCJ/fvrsl9hEo9kctD/KvR9bLLiAb2eSamT2BATLmu9BhjtvoqYHHQykH
         VjjlKml4yrXhBd7IFmDIwH/i6Sa+xm2n8FdW5MFbGcVi+++t+LeubpHdSWBqmth8Xzr/
         53y2/VYJuKCZd0ebGErngNZRpzubOQGh2eQLCCXrJioQxCIov5IExGGHAb26A/xiGOAK
         qLJw==
X-Forwarded-Encrypted: i=1; AJvYcCWDwfgv+PPo9DVXb5/2JN4XR+j+WeWtBuDSFdrKvGn4XoYDPVNSi6LPPOe+Grna+W7pRKO7cYXwP6So/ztDNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvLRNK3qdZoqwTWjaEHR1FCSIUjLDGi+cJoi73AlSmAbNt2L1D
	VJa51OcAi3y3Ua4GOc69ak/+oF4xd2jM8RRUH2Ox9QlCrT2UkEqLqJOD5X4VzQPxdH6taKUTgs7
	b6aLiOtI1fYRLd/v5m0DvrAAA83L/eSXC24ocHUpy
X-Gm-Gg: ASbGncs62cDwSDahirjV2hDn5SyJreH2S3gYerBmCzvdXgr62R+IzXYb3rgPGB2OZ5D
	0IXcLZWkfLX3rYMuQNKplQsjHi5z0oJ/d04DU8lwOr3zLAdfPisKrO/ds3W2mM0HoVnn08nQqGq
	e4Wd93kt+w66YF9eg4/8YKuw+OhBSoE7RhbU4s6TXESUZorjqfHwhUUNgMWoZXtzAPwJXCud72f
	TnNTIJx
X-Google-Smtp-Source: AGHT+IGpCNaC58ho8o80auVphfmPSSlAJH6fVTg274zNDGIUaLEfSNZWe6ti3sRvLr9LT85HGZwDLWSUeXCKst3PbuU=
X-Received: by 2002:a05:600c:4e8c:b0:43d:4e9:27ff with SMTP id
 5b1f17b1804b1-4562efa4ccdmr28268175e9.7.1752685467576; Wed, 16 Jul 2025
 10:04:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711-topics-tyr-platform_iomem-v13-0-06328b514db3@collabora.com>
 <20250711-topics-tyr-platform_iomem-v13-1-06328b514db3@collabora.com>
 <aHYLWc_KkMHj_jF-@google.com> <D9C5D4EC-FA24-47DB-BE89-609713F093FF@collabora.com>
In-Reply-To: <D9C5D4EC-FA24-47DB-BE89-609713F093FF@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 16 Jul 2025 19:04:14 +0200
X-Gm-Features: Ac12FXyEr3-nxp8z5gzCKUduKa58-13cIw3r7nJu8XJQ_dpW_KpxDB1_UZkq0hc
Message-ID: <CAH5fLggLm-N1m1CRqfpwAVaX4QnRCA980_GWtzP=uiXgfSsTjA@mail.gmail.com>
Subject: Re: [PATCH v13 1/3] rust: io: add resource abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 6:53=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi Alice,
>
> >
> >> +        let inner =3D self.0.get();
> >> +        // SAFETY: safe as per the invariants of `Resource`.
> >> +        unsafe { (*inner).start }
> >> +    }
> >> +
> >> +    /// Returns the name of the resource.
> >> +    pub fn name(&self) -> &'static CStr {
> >> +        let inner =3D self.0.get();
> >> +        // SAFETY: safe as per the invariants of `Resource`
> >> +        unsafe { CStr::from_char_ptr((*inner).name) }
> >
> > This is 'static? I would like this safety comment to explicitly say tha=
t
> > the string always lives forever no matter what resource you call this
> > on.
> >
> > Alice
> >
>
> Actually, we have a bit of a problem here.
>
> First, there appears to be no guarantee that a `Resource` has a valid nam=
e.
>
> In fact:
>
> #define DEFINE_RES_NAMED(_start, _size, _name, _flags) \
> DEFINE_RES_NAMED_DESC(_start, _size, _name, _flags, IORES_DESC_NONE)
> #define DEFINE_RES(_start, _size, _flags) \
> DEFINE_RES_NAMED(_start, _size, NULL, _flags)
>
> #define DEFINE_RES_IO_NAMED(_start, _size, _name) \
> DEFINE_RES_NAMED((_start), (_size), (_name), IORESOURCE_IO)
> #define DEFINE_RES_IO(_start, _size) \
> DEFINE_RES_IO_NAMED((_start), (_size), NULL)
>
> The non _NAMED version of these macros will assign a NULL pointer, so we =
can't
> derive a CStr from that at all.
>
> On top of that, although some call sites do use static names, i.e.:
>
> struct resource ioport_resource =3D {
> .name =3D "PCI IO",
> .start =3D 0,
> .end =3D IO_SPACE_LIMIT,
> .flags =3D IORESOURCE_IO,
> };
> EXPORT_SYMBOL(ioport_resource);
>
> struct resource iomem_resource =3D {
> .name =3D "PCI mem",
> .start =3D 0,
> .end =3D -1,
> .flags =3D IORESOURCE_MEM,
> };
> EXPORT_SYMBOL(iomem_resource);
>
> static struct resource busn_resource =3D {
> .name =3D "PCI busn",
> .start =3D 0,
> .end =3D 255,
> .flags =3D IORESOURCE_BUS,
> };
>
> Some appear to use other, smaller lifetimes, like the one below:
>
> struct pnp_resource *pnp_add_resource(struct pnp_dev *dev,
>       struct resource *res)
> {
> struct pnp_resource *pnp_res;
>
> pnp_res =3D pnp_new_resource(dev);
> if (!pnp_res) {
> dev_err(&dev->dev, "can't add resource %pR\n", res);
> return NULL;
> }
>
> pnp_res->res =3D *res;
> pnp_res->res.name =3D dev->name;
>
>
> I guess the easiest solution is to drop 'static in order to account for t=
he
> above, and change the signature to return Option<&CStr> instead.

Using Option<&CStr> sounds good to me.
