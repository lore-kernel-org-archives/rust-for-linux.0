Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394002E610F
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Jun 2025 11:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749640109; cv=none; b=moOR695uwKkvnl72c/yjRRThdabx9R9ZmhrP3v+mbuOeq2ACyhbuVBy0w4jxeaABWt2QZYD9imY8EKDgCqTPONRFoIzst47KnxZt3fXg6YHc6d2rCrZBlRl8JhJSNTebJf+GfSlefn8kBQ/vdT5zMtLCHgoDB7z2Djt9tjcm4sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749640109; c=relaxed/simple;
	bh=nQJgpmtv7zcgAGtn8AlbcuWRPUUGIKAGBeLfuWQzNng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hmzSTeUC3MWuu8gwyZG1M3gyjBrms0ZZqqtlJOHBJZvF6Ppfsju7LRp14hvi+GNBjma/JA9JVxahH74YIek/ZOfW0Sb4EFUiLicc8j+6IfbBC5hIhp29UAtIPPWGQnLmI0Ep8yVczvJZ2FypoGyQihHUYSH7O72Kkl7WvxUuGVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E9eGK7eA; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E9eGK7eA"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so557551f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Jun 2025 04:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749640105; x=1750244905; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fltmcdJR5+uSFB/BOttsMheYiBXzeebgxnOpmYcK9IM=;
        b=E9eGK7eA9VjjXtaaehngukszalr0LpFIRCtLfrNKmqPb01GtBKeGBNdeNJvohjQIyX
         0WAsnJ/M8z8bg9ipmahD5NKeRlcqL+Asb6621D41MHW3hF/9ik9S/wO8nrCnf4ea7eVi
         pom9YEuB8BaRj6rHwN0Fr4xWWzwNw+3GARTpKHKXhC53nGR8n2i/zMgASFF7n6Dtt4CY
         pe7xbir/Y8TRCeVUBcPENZNcaafws3DoZmep8Aw/48cUC29SXEpCh/ZnmDW0d4kisBcO
         GZ4jRTcS+KbFiWL+9Vf042lsFPrYZ0wCSJukFoYgRQhwJZC1h097h6RVEoMZDUCz7Loi
         JuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749640105; x=1750244905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fltmcdJR5+uSFB/BOttsMheYiBXzeebgxnOpmYcK9IM=;
        b=v+cHVFF0DNyRFA7xrxeRLKj9CqLR3Aio0i5iPpM4BxiEuC5vQJlGDSda1aGZKZar7S
         lfGFYDHGoqZrrgbu+ljmMxjganDsNUcMboupHs0xVgE6Zi3f755wUd9nZh9N3KQyWcWI
         YoG3wJ5+6e8y4r56bHnOovso6MuMtGzPGwNlWjAo2lEgPEyvYhithbbZ7deKAOowImur
         fmbkbCMHbQaZwXBq2Xis1AeT7kJOz8VJFV7GalsVajwGIp8gMZVSZ9M0bHR0GgRce2jZ
         AQVmmUwVf7FM+NatZEMwUnJD0a3vYYAmnpEaw49yaW/Bzrv9AcSqpqVf8A3o7gC/G1/K
         VHRw==
X-Forwarded-Encrypted: i=1; AJvYcCWJt7vHMHYrvLZ75SHOKGKk0ROjpCZwtzOV35SyKE6umwQp3L8fd8a7aqCFnZuDE9ekoZVs+0C+8YNrPUce2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+e6+Z4749aB9ynjBIP4sXNW8/hMrYItt9Z1fYHsVeGZnfsLlH
	pYVQksI+RO5esNXVCWNXCFFIBzM6aU8kCEpCmz06q6bhV3j7luNw+ak6Pazp9ZKBgpZ9FK8P91A
	1HpqHbnPkS/pwBD7HRu9GQe8A6skgu/3hJHrgkqdr
X-Gm-Gg: ASbGncuF7srrFhNvH1jXtLRfoiYZ/0xSBCqCCxRU2GoLJNoulBh9Lg0juiWLNDllSw+
	sK6LdqtO5E4Th3S7ImP1WgEmkGxNRrkiJnzqN8khNxY79K3kS0q3wqy/TsdLUU3va3eYGmpX8It
	kx5y1ufIy6Gj2WeYz0CAB2iq95EFzHHnLxP9lN2xWcd5tdAKV+b7Vu3hZnDIFeLZzSsE6Zq+d4N
	JROkzUwfJeG
X-Google-Smtp-Source: AGHT+IGbgTDC9R5k+26NNyosxwCjQqzml5rbQBFSYZpq9MUeODCnOy4mDCQ40C2g4MXpjTSoeBZdpdGGzwYy9Bv8Tos=
X-Received: by 2002:a05:6000:230f:b0:3a4:e63d:2f2d with SMTP id
 ffacd0b85a97d-3a5581e7502mr2734468f8f.6.1749640105328; Wed, 11 Jun 2025
 04:08:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-pointed-to-v1-1-ee1e262912cc@kernel.org>
 <Was3UIiWcTBx58JEfoXMB908QEUOWeRMrekA9TD0VWTsA5KU20VwFE9Vo_xefwi_U4UOa5BggjbBby92lP96pg==@protonmail.internalid>
 <CAH5fLggzYQcMhcscuODR7cu__LLKAXhZ0A-tsBGc7gGyAA6Ofg@mail.gmail.com> <87ecvqzhcr.fsf@kernel.org>
In-Reply-To: <87ecvqzhcr.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Jun 2025 13:08:11 +0200
X-Gm-Features: AX0GCFum2Poedya3OpC0KXmOTz2XUTZUwzK2xJUUdfTin56X1ZcOGgOs4wrlE0A
Message-ID: <CAH5fLgjRd5S4owRrZS7ONeb=-Tzq+xQDtWtqii1tCgEoqzr+bw@mail.gmail.com>
Subject: Re: [PATCH] rust: types: add FOREIGN_ALIGN to ForeignOwnable
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 12:46=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > On Thu, Jun 5, 2025 at 10:00=E2=80=AFPM Andreas Hindborg <a.hindborg@ke=
rnel.org> wrote:
> >>
> >> The current implementation of `ForeignOwnable` is leaking the type of =
the
> >> opaque pointer to consumers of the API. This allows consumers of the o=
paque
> >> pointer to rely on the information that can be extracted from the poin=
ter
> >> type.
> >>
> >> To prevent this, change the API to the version suggested by Maira
> >> Canal (link below): Remove `ForeignOwnable::PointedTo` in favor of a
> >> constant, which specifies the alignment of the pointers returned by
> >> `into_foreign`.
> >>
> >> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> >> Suggested-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> >> Link: https://lore.kernel.org/r/20240309235927.168915-3-mcanal@igalia.=
com
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >
> > One nit below. With that and things other folks mentioned fixed, you ma=
y add:
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >
> >> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> >> index 22985b6f6982..025c619a2195 100644
> >> --- a/rust/kernel/types.rs
> >> +++ b/rust/kernel/types.rs
> >> @@ -21,15 +21,11 @@
> >>  ///
> >>  /// # Safety
> >>  ///
> >> -/// Implementers must ensure that [`into_foreign`] returns a pointer =
which meets the alignment
> >> -/// requirements of [`PointedTo`].
> >> -///
> >> -/// [`into_foreign`]: Self::into_foreign
> >> -/// [`PointedTo`]: Self::PointedTo
> >> +/// Implementers must ensure that [`Self::into_foreign`] return point=
ers with alignment that is an
> >> +/// integer multiple of [`Self::FOREIGN_ALIGN`].
> >
> > We should require non-null:
>
> What is your rationale for this?

The rationale is that the implementation of XArray assumes that the
pointers are non-null. If we allow null pointers, we will need to fix
the XArray.

Alice
