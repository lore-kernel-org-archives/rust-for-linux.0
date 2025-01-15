Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B0720AF61
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 11:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736939113; cv=none; b=bJ341XnekvbDuQeqtYJBInwpE7x1YEIpiupv9j9r0oDsVO6xDX148kpas6F0LLUmYc2nnpUEIkZYIpdezx4cUrzjqgPumkm2L6YsFZNdXG6arrYeNGrnZkSmGYxVvrz3VbOzPii1rgpaaNS0l7DZKGEKU2oBTjFMtNC/rTt7sV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736939113; c=relaxed/simple;
	bh=fw2NuiSUZiESYrNqPbihqFsk7tcBYqw0a62Ou7xyGL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0sPZNeO6UyqT5XyP5lr1N1/W5zY0MJTNgZ6eQWom7oH2AMPwa+A8kcy8pcO6D1k3Ci/1psZcWMpii+aFyTAN5tWtzZodLWuYPevHNS5W1/zxZsUvat/0ZCiz/jvNkXGmKug6KngLkis/BeaExvQ/8gKjfb3BzVj3LV0GODAFm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y6iMYhCu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y6iMYhCu"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43690d4605dso45521645e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 03:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736939109; x=1737543909; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw2NuiSUZiESYrNqPbihqFsk7tcBYqw0a62Ou7xyGL8=;
        b=y6iMYhCu+bDkDyuVMUqZnHiyUepM6CivntU180tir3u8Da+xJzmTtHL8j85wkZZJTn
         s7vNSQvpfLe2vGiOMUre8cLbjtHesbjGE39b42aUiO96Wag2NQpHaO/GD/VVwsUGWaHn
         1o69G3rck6LXmkR2OdMwtsLKf2eBOKea59fxmb92xzKJQhMbVyR4XniN6eSFsZCxOmvb
         onaXWvPipHjhmJXdxamRwrvcC7jZ9uqbzWjUI6SBlKNn4oEBggKRrYd6DWPuBkdg1aQH
         boVdzYLJNz5Ox5LHsOQE3XkngqInB2Ga59bhjswGiu/iEgjTE7xcitrVUKVMxCsac7jw
         h5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736939109; x=1737543909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fw2NuiSUZiESYrNqPbihqFsk7tcBYqw0a62Ou7xyGL8=;
        b=Hr/AwRKjIh5jdrFebn0Gpm+eb8wjndmreJIPEETUzmzvxrCW1JbecKPEBZwy5iAqks
         /HBIMGoYJijFik0HMEPirh6AfQqIch3qIMIIrgUkigW+mNjTbkOAFUOaeCI52HnpQNbC
         P7tS6ODXd7Xq5A29olFiMgVoTe1pTV3oxQUgmRL173LI5DRPVhQS0q4QR7VphqNyQ/Fi
         AFQmUccKNyguTULs71Ozm2az+nsN+9eA1yrZgGE/WQoIWvPTEcbk5HhRRnG/D/hX8lGz
         6EGIsydgkvbWdm2ZqPUuWp0x2zvU7KsUKEisQCqSkVwuLa1oSOFktYFRj58jKbTSaZfS
         L3fA==
X-Forwarded-Encrypted: i=1; AJvYcCWwykzcq/KVYtk33QMfB/p5S+oBMkx8UhQUpC356nZZkgAiHOGqvxPwyvPIH75QVRx4BNT8MbMDCzB2p0/W1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFSyA31gMlky1oXxK0S6FJ8tbcFJQPFWH0wG61MN1ux+kPK6fX
	JaipfrHTwEI8jihivbQK+khr7j/ExqFhTZnjUsBkqZZT8v6oQHBSMO3gBldVoKaDIFhE64ZCcyy
	Fq16PsXUWT4w2EdXuV74fYgu/S8YaxSo9flw3
X-Gm-Gg: ASbGncsEqOJ38hN9at9tY8p0eMVDVIdeY8LvLxasghsYydFGEFQ8zrGpTt3roIiZXVx
	QR62lOMqruho2Xz4niT5pbXcsINCvVcxymT+oisY=
X-Google-Smtp-Source: AGHT+IHQlkpmJ4SoCrhT3u1y4CSjWAKIL28MBjTX2lVvYBBLzc5GMtrDu7feK4jaKpPa94ivV5baH+7BMYhxyxFr8iQ=
X-Received: by 2002:a05:6000:4008:b0:38b:d8a5:df3f with SMTP id
 ffacd0b85a97d-38bd8a5e15emr11123415f8f.0.1736939109052; Wed, 15 Jan 2025
 03:05:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH5fLgiS_=MiMcnyC2z8kXQW0Kpn36h6EaHs9g7Zaw85mLn2jA@mail.gmail.com>
 <87frlsbekc.fsf@kernel.org> <vH_JjBon9WfW7x7OzrUfhGFluWCiBwsPZDkHbFt77nth4SFWJ-4W2vXXBYmE8WEaEJsibxx2N4iXS8Vx6RbAQA==@protonmail.internalid>
 <18bc911a-ede5-410b-9955-5382bcef975c@lucifer.local> <87msg09uzu.fsf@kernel.org>
 <qG6w11OwPsgdMa-EKR7V-NiBoOsQocuJDWurazcGSwtN601gK8RP1_un0Gx5MF0pPoKPnEL4ssYKiJUUIkF_Hw==@protonmail.internalid>
 <8b803030-0ca3-4591-b2f3-bb9bcc2aca21@lucifer.local> <871pxcgg02.fsf@kernel.org>
 <ec1e87e9-2d84-435a-8e2a-1d426a9c13a0@lucifer.local> <CAH5fLggntnvMLoZHTm6zx3nSP4nq7iruK2c6iXBX-CXtVPYbcA@mail.gmail.com>
 <ft9bqx-YTXpiym3AWq1aScaB44OScx2nUbYOA2Aw7H54H_-cxSwrb4FhwIy9eIS5LIhqZZBDbyXAnzujUkbA-w==@protonmail.internalid>
 <195559a2-8c5e-40f7-b60a-8534dc177d9b@lucifer.local> <874j20e3wp.fsf@kernel.org>
In-Reply-To: <874j20e3wp.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 15 Jan 2025 12:04:57 +0100
X-Gm-Features: AbW1kvYti3f1YoDCRgS07yTDhT0aKjFEX7txjVrvuXbkRveP56pBQq4uE9IijY0
Message-ID: <CAH5fLgiJrLt7jr9nPDvVps1PeO_53wVtjOvQ2a8dwjSo7=vchA@mail.gmail.com>
Subject: Re: [PATCH v11 2/8] mm: rust: add vm_area_struct methods that require
 read access
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
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

On Wed, Jan 15, 2025 at 12:03=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com> writes:
>
> > On Tue, Jan 14, 2025 at 10:50:01AM +0100, Alice Ryhl wrote:
> >> On Mon, Jan 13, 2025 at 3:45=E2=80=AFPM Lorenzo Stoakes
> >> <lorenzo.stoakes@oracle.com> wrote:
> >> > > >> > For a series at v11 where there is broad agreement with maint=
ainers within
> >> > > >> > the subsystem which it wraps, perhaps the priority should be =
to try to have
> >> > > >> > the series merged unless there is significant technical objec=
tion from the
> >> > > >> > rust side?
> >> > > >> >
> >> > > >> >>
> >> > > >> >> How about this:
> >> > > >> >>
> >> > > >> >> This clears the virtual memory map for the range given by `s=
tart` and
> >> > > >> >> `size`, dropping refcounts to memory held by the mappings in=
 this range. That
> >> > > >> >> is, anonymous memory is completely freed, file-backed memory=
 has its
> >> > > >> >> reference count on page cache folio's dropped, any dirty dat=
a will still
> >> > > >> >> be written back to disk as usual.
> >> > > >> >
> >> > > >> > Sorry I object to this, 'clears the virtual memory map' is re=
ally
> >> > > >> > vague. What is already there is better.
> >> > > >>
> >> > > >> Would you like the proposed paragraph if we replaced "virtual m=
emory
> >> > > >> map" with "page table mappings", or do you object to the entire=
ty of the
> >> > > >> new suggestion?
> >> > > >
> >> > > > I object to the suggestion in general. The description is fine a=
s it is.
> >> > >
> >> > > Ok. I'm raising a flag because I had more questions after reading =
the
> >> > > docstring than before.
> >> >
> >> > Sure and so I think this is valuable information, and indicates it's
> >> > probably worthwhile adding a little extra information on mentioning =
page
> >> > tables.
> >>
> >> Sorry, I'm a bit lost. What would you like me to add? Perhaps there's
> >> an existing file in Documentation/ that I can link to?
> >
> > Sure no problem, I propose expanding:
> >
> > /// This clears page table mappings for the range at the leaf level, le=
aving all other page
> > /// tables intact,
> > /// anonymous memory is completely freed, file-backed memory has its re=
ference count on page
> > /// cache folio's dropped, any dirty data will still be written back to=
 disk as usual.
> >
> > To include information on page tables. I suggest something like:
> >
> > /// It may seem odd that we clear at the leaf level, this is however a =
product
> > /// of the page table structure used to map physical memory into a virt=
ual
> > /// address space - each virtual address actually consists of a bitmap =
of array
> > /// indices into page tables, which form a hierarchical page table leve=
l
> > /// structure.
> > ///
> > /// As a result, each page table level maps a multiple of page table le=
vels
> > /// below, and thus span ever increasing ranges of pages. At the leaf o=
r PTE
> > /// level, we map the actual physical memory.
> > ///
> > /// It is here where a zap operates, as it the only place we can be cer=
tain of
> > /// clearing without impacting any other virtual mappings. It is an
> > /// implementation detail as to whether the kernel goes further in free=
ing
> > /// unused page tables, but for the purposes of this operation we must =
only
> > /// assume that the leaf level is cleared.
> >
> > Alice, Andreas - please let me know if this makes sense/is clear or nee=
ds
> > further clarification.
>
> Sounds good to me - thanks.
>
> @Alice - can we add PTE, PTE entry, PMD, PUD to the vocabulary at the
> top? Not sure if it should go here in virt.rs or in mm.rs. If you have
> no cycles I can try to add it down the road.

Sorry, I don't know these concepts well enough to write about them
right now. If there's a documentation page I can link to that's great,
but otherwise I think it will have to wait.

Alice
