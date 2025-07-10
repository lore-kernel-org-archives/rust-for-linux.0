Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8F719D8A2
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752153886; cv=none; b=INqQKphYcmqf4SQYm82uG19nUOrmWZ7CvuL8Fs1Tsct1BUsVFKJS6j+zBY1Q16ZvS2qWUa9apMFL5/Tpfy9wBjq2tHs8UDJlf5GufzB15iFCfs2k9hg0TbBByuQe79swMc2jcFYiIrMKN3ukBkDW6CBMHUgJ6cFwy+XgD1pXb58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752153886; c=relaxed/simple;
	bh=0lZER0YsOdsgUsMyG0eelhSWqdVgnWXzTW5vrH5Chqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=isXx3fyPJ+1M0r9eAgetKjZyd9zIGJS6NFFsymlibic7Oy386Q4dM7t2UiU9B2Nh6bWmvTA6xfH/MEV1zLc0RsWRmch1yneVo3r5IVQmRpQfvC7XeyhxFlEqKFJX3hidt/hGXGh9x21MjEQzlvFpOj33ojFqdjrcKwY/vncN++Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bGTYL41O; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bGTYL41O"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so964064f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 06:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752153883; x=1752758683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOzZI8nwjN1BdAUiFGa5oGbSqqmiUrxoW/ObZNPwb5A=;
        b=bGTYL41O3FV1oTI+WLIvlBwZAHSuRnIZGHeb350gieVx4ug2BDqjGckrtPIuGYtNqQ
         X0N4isfOy1EQQqRoDS7Zf1jAlZo6GigMzZfshLHUxFRhp/aESA3M615ZXAksi02FarBW
         ngpBlUFCpK6lMLAaZpqJjc6PJBrdb/a8iytBwrnZ80EBGejdx/lQ1JXdZZUSPNbLbmwW
         3nb9RMfQ2ovahRZrh3l8TYosgZgNWwa9eZhYkkKlaTobhd9pt1LFy2OwxNpPkTWQhZaE
         FsScKDKFtDoS2i+qdEtLiG6MjS6yWV/wNkO36Xzt34ozED7FojAdrxyuMrrxy5T9oPKd
         /+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752153883; x=1752758683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOzZI8nwjN1BdAUiFGa5oGbSqqmiUrxoW/ObZNPwb5A=;
        b=Ihcg3meUI9/oY5tSniminJTp0uBZnqj8s1IdKQK/89tfFLI5FnE+WDaTrp5lMw0s67
         EXiLdKB23v6oucS0e60UYfdC+wJle43Oe62ZamV3INhBwffv7rMwY5MOYKvT9pec+PdT
         16GvNTqt9xhySAMxczAOSXPsHSE+qzyjMq2K+g5uz9wOPb+YgVdK16dFyIuchRBgAyvZ
         a3YznBIZ45Xl87VLFMMlOwoNKVrxEI3d2vEr/gMiDj7g++EQHSreGCFODGJCDJJWJ4Vg
         WWiT14s3RwqFxgsigT2xlDwGmcDthiptt7dKTZnGwzHSqcZw7WVT67UjiRe4L+AAgOCe
         wZ3g==
X-Forwarded-Encrypted: i=1; AJvYcCXF2P0felNA6hqvtTtt6tkwfdlWm/1pDbZEkgmMsg/fqPyn7EsbM7lgpzrea80K1hhMI6pF4gOdb0JSnxm/BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN+C5kHXtna1REWPiWI/uK7g7Tw4No1NzDx1W/l+5NQlkAzvUL
	P7SeeX+TqFY1gqTm4+qEhpn2g7dco6/iqeOs4PnziSOa1fYzzpEK+yaT+x1v2Tj3ZtpKPilw/kY
	2Vk0gqE76kTmRU6ZQcLTFO7vHHBiupis8tObpLZy3
X-Gm-Gg: ASbGncuc/ukxb6QImKsI630rnJ4I/wVyYfxQ7SmZZOIOu7s3siNymfEYQyP9Uwqmdm1
	EsZeSM1FFDhQK3KPj2hnTLVwpib+LUwmPOdSb4x8bfQHHt/FVOq/Xg2vZ4FoV6Dl2VEpIlo77vq
	VwF7J8r1lIFTceLE9JQKimh4+44Q3q+Y7xbUuC/WjVHfd+Vs+fBo+oSPHHxflc83a7xjEJBryXt
	g==
X-Google-Smtp-Source: AGHT+IGTOGXVet50spxQ8UB0i3z2/GXNnHjLpChP0OonDZKe4QRR02sCDV3qt2xMz0CTN2csaEjbPSliur3/SF50biE=
X-Received: by 2002:a05:6000:22c8:b0:3b1:3466:6734 with SMTP id
 ffacd0b85a97d-3b5e78d8e4dmr4323322f8f.44.1752153882869; Thu, 10 Jul 2025
 06:24:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704-topics-tyr-platform_iomem-v12-0-1d3d4bd8207d@collabora.com>
 <20250704-topics-tyr-platform_iomem-v12-1-1d3d4bd8207d@collabora.com>
 <aGt6CZAUeuK0XnmP@google.com> <8A2EA665-F738-4C5D-914E-11380422038A@collabora.com>
In-Reply-To: <8A2EA665-F738-4C5D-914E-11380422038A@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Jul 2025 15:24:29 +0200
X-Gm-Features: Ac12FXzlexagSsiLDCYZGksBTABnulDDAEIfZUoBgVnAcSZLbz79wUfV9rstBCc
Message-ID: <CAH5fLgg_11gFtGG=0zjhyYhK1JvChFxdXvwxKkAEUGxOpC-Ljw@mail.gmail.com>
Subject: Re: [PATCH v12 1/3] rust: io: add resource abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Ying Huang <huang.ying.caritas@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 3:16=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi Alice,
>
> > Is this name used for a lookup or stored? If just a lookup, then it
> > doesn't need to be 'static.
> >
> >> +        flags: Flags,
> >> +    ) -> Option<Region> {
> >> +        // SAFETY: Safe as per the invariant of `Resource`.
> >> +        let region =3D unsafe {
> >> +            bindings::__request_region(
> >> +                self.0.get(),
> >> +                start,
> >> +                size,
> >> +                name.as_char_ptr(),
> >> +                flags.0 as i32,
> >
>
> JFYI, this is stored:
>
> static int __request_region_locked(struct resource *res, struct resource =
*parent,
>                                    resource_size_t start, resource_size_t=
 n,
>                                    const char *name, int flags)
> {
>         DECLARE_WAITQUEUE(wait, current);
>
>         res->name =3D name;

I think it would be useful for the safety comment to say something
along the lines of "it's okay that __request_region stashes a copy of
the string because it is static".

Alice
