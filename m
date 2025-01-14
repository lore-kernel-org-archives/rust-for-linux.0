Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEBB24333A
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jan 2025 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736848220; cv=none; b=X5SLaLT/U6IiaQlpUeTFU9awgKFDhh+hr3j05kosDK42yNRXbSHYGIi7omYHPuTKy2wwhy4fRsU+KaYZn9VevlkTFhy01qSoTvQkf4g89reEFcJKp+eUJ6Vb84rW0VP0lJJMfECqqn0UDN73JetSnDpo66xh6MF1A1r6TBFZwuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736848220; c=relaxed/simple;
	bh=KTwukl8uOiX4y5FD75Tj1+wGTsO1S/cvv2mZ6R8n1/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xa+iDDKxEFMkGBi0TXmDywol+lK+dbBXQw1UidHN1jIFpbPXQKayNu+YP6MjAEBVCTcXddPtuEuPKJiE+T3bxRkmODO3DSke7JY6F9QgDp48m5wHnUCZ5cEv5R2ClTedsJrAZyAlJa3EGd3kynZFDojkcGFPlwkM2MFmp/CV4Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=umYUeCxW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="umYUeCxW"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385e06af753so2641401f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jan 2025 01:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736848215; x=1737453015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTwukl8uOiX4y5FD75Tj1+wGTsO1S/cvv2mZ6R8n1/c=;
        b=umYUeCxWee+sBNvFrrHoAqConvt9wSptHckIcmLMxdlyivX4Ao9l26uwlwp5SlbPKQ
         FoCAe6SKi8eqTyGBEQEcmNG0eg0KOllInem/J5YcACyGmvC9k9LSOrWNuwqTmYjmrnsN
         4QLn+bwMCWqckQoOTPPy/krf/fpHF97GvIRNO9LPEVDkSM+Y0YQUDlcFyB9AUJBAFkDG
         Ha+3vNw3nim7CMc7Tahku08ebo8wnKlmkutJwC8EbHNTs/WagAqtAKycYJ2uTBPwkEfe
         bfVIjRKoRSeJadMRsaqtJEUVZCDTEXTRmMwYE3yffXt1xqdUHSt8TM6akRdvRby/FpeN
         YWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736848215; x=1737453015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTwukl8uOiX4y5FD75Tj1+wGTsO1S/cvv2mZ6R8n1/c=;
        b=UOSzdWBdsnbtWqCTqAKgQjBktOop5zDrwSWTfUxw54OM8jCxDsa2AUU4tNX2/uHkmO
         GKudYs9J0tVsfCDkp1zUUDJktLFNEMgHPwHmd783tX2kewl71MN9y0zA8gQLCu8M+jYF
         oG8Z8l3xPtdV7xs+xu8UexFPNTfi07m87sLEimzJjrfCyoWh4kCWxa+zeK0ngPjHcs0H
         s2QHYlaICnIrQFHKi5GFRU1zA9LFvxLGh7isYp3h5zia0kKTCkudD5zEFn+4zpjg/y14
         q37mspdi6WTEvIhzJJAGe1IhNBCKJEsdzXAHrxfgnQVjrqLk5fVMhFucJRZmcZnQ6J6c
         r64g==
X-Forwarded-Encrypted: i=1; AJvYcCVdlsIBrUAJ8C2fOv8ds8gmIok7/pipEjSaHsQYQUHe6fozh2aHOaZMdJifeGIT+MU8NOB7DGbIgcG5zv4Pnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Sg96yIAiAegVvNcvGMAu2YpNyqttcMAiiNdKE3zlwNWV/BoY
	6FNVkaxYXQbbCWBRJVfRUgEIK1e2arvAYMr0cQQCX6e+N1ukfKxMf0dk7WypzyFHBtqtKY4mxN9
	atkhedxfGfhRHyonR4jFphuqhyATVI2gjBkIG
X-Gm-Gg: ASbGncvGRZ0NsXq4YAbHYnNpLBcBeSn7BqzfXKEk/Kmrckr/qhhOhdR/3Fo6H2Wv0NG
	bZLiDtei1uUhITQNtIH2bhxzj5Bzmy6v+uwQ4r8SLQreDGojhQwbTZ13JPPG/IOKLrdu2
X-Google-Smtp-Source: AGHT+IGKzl5z5Ha3pO1yRtNB3GUeQr+rw3Ekmo6cq91+iIv18Us3DjGDX/jVaDV82Hu1TqkdZrRFwHqkHA0xgmPfkxY=
X-Received: by 2002:a05:6000:156a:b0:38b:e26d:ea0b with SMTP id
 ffacd0b85a97d-38be26dea6dmr1638433f8f.25.1736848213829; Tue, 14 Jan 2025
 01:50:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <874j33ddxt.fsf@kernel.org> <51PsGz5tctBZlyC7TWAGRwZbM13r71BM1gtm1Y8F4j2w3FtKSXtkVrsvwILAqvSBPrFJzahyUVDum-JXO3yZUw==@protonmail.internalid>
 <CAH5fLgiS_=MiMcnyC2z8kXQW0Kpn36h6EaHs9g7Zaw85mLn2jA@mail.gmail.com>
 <87frlsbekc.fsf@kernel.org> <vH_JjBon9WfW7x7OzrUfhGFluWCiBwsPZDkHbFt77nth4SFWJ-4W2vXXBYmE8WEaEJsibxx2N4iXS8Vx6RbAQA==@protonmail.internalid>
 <18bc911a-ede5-410b-9955-5382bcef975c@lucifer.local> <87msg09uzu.fsf@kernel.org>
 <qG6w11OwPsgdMa-EKR7V-NiBoOsQocuJDWurazcGSwtN601gK8RP1_un0Gx5MF0pPoKPnEL4ssYKiJUUIkF_Hw==@protonmail.internalid>
 <8b803030-0ca3-4591-b2f3-bb9bcc2aca21@lucifer.local> <871pxcgg02.fsf@kernel.org>
 <ec1e87e9-2d84-435a-8e2a-1d426a9c13a0@lucifer.local>
In-Reply-To: <ec1e87e9-2d84-435a-8e2a-1d426a9c13a0@lucifer.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 14 Jan 2025 10:50:01 +0100
X-Gm-Features: AbW1kvZk9d573jFK8FkPwpKd3ZWRv8D3huYFVncUO-UnxuorvJMOstGtGDK6cu4
Message-ID: <CAH5fLggntnvMLoZHTm6zx3nSP4nq7iruK2c6iXBX-CXtVPYbcA@mail.gmail.com>
Subject: Re: [PATCH v11 2/8] mm: rust: add vm_area_struct methods that require
 read access
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 3:45=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> > >> > For a series at v11 where there is broad agreement with maintainer=
s within
> > >> > the subsystem which it wraps, perhaps the priority should be to tr=
y to have
> > >> > the series merged unless there is significant technical objection =
from the
> > >> > rust side?
> > >> >
> > >> >>
> > >> >> How about this:
> > >> >>
> > >> >> This clears the virtual memory map for the range given by `start`=
 and
> > >> >> `size`, dropping refcounts to memory held by the mappings in this=
 range. That
> > >> >> is, anonymous memory is completely freed, file-backed memory has =
its
> > >> >> reference count on page cache folio's dropped, any dirty data wil=
l still
> > >> >> be written back to disk as usual.
> > >> >
> > >> > Sorry I object to this, 'clears the virtual memory map' is really
> > >> > vague. What is already there is better.
> > >>
> > >> Would you like the proposed paragraph if we replaced "virtual memory
> > >> map" with "page table mappings", or do you object to the entirety of=
 the
> > >> new suggestion?
> > >
> > > I object to the suggestion in general. The description is fine as it =
is.
> >
> > Ok. I'm raising a flag because I had more questions after reading the
> > docstring than before.
>
> Sure and so I think this is valuable information, and indicates it's
> probably worthwhile adding a little extra information on mentioning page
> tables.

Sorry, I'm a bit lost. What would you like me to add? Perhaps there's
an existing file in Documentation/ that I can link to?

Alice
