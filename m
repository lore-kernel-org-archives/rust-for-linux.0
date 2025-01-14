Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB962309B4
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jan 2025 13:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736862141; cv=none; b=dDVyo+vsYWezOe3jjRxIXafDOL9L30K7CCREcjm2P6slzWInKGnhgeEf9bR2QTcJHC4xP/jo4ThlBKhQN9fNKXy5u9NYnv4IVznL4RnBBrOWzak5sNJ3VQl/yjAINedVKy02rPyVvHWQrZ044pIjz62+qyca718Gz9DILASIB14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736862141; c=relaxed/simple;
	bh=W797SlhZRezIDTbO73i8Q0Q5i2usqolq33m4T/Z6rco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HiAKbN277b7dnmgfArIruA8GqIjlJYaryqZ8GxFZyNVEXB71qNbhmYTVPg4l0fMXSFYjzGJYnm6A3103H+pquI5wB3TrwJ6Sic0FhkBiTdZPFvLB6t/FJI4rgxVJYO4F31shyfxS//Etxrtxp8xEVJDMlXWIp/xELnFwOIeYyCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vq4BKKhx; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vq4BKKhx"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3862d6d5765so2948738f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jan 2025 05:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736862137; x=1737466937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W797SlhZRezIDTbO73i8Q0Q5i2usqolq33m4T/Z6rco=;
        b=Vq4BKKhxK5QSXCjrVh3lsjjG1pu9ej/Bdu/7EiFt0LhUT/2w8ucQuceZ8r3RIfkgWt
         PJH7j2iUcqIEi+MZq04VE881eLq3dFf9prCQg3UlQdangQQ5pEz62rAyg1rxKAkOgwkk
         A29O/JWEampLDSY4f4RRp7Kp4kZUs+4Uzlms8Qx8P1UuAZchQzaW46KgP3xDKSZtgA5I
         Lo+iLe1Ibh9B4vhSEZX3PT0FHYm7pmyOsdsyvdJs0LSwACvt2lad5zbMBGkEwJZup8yx
         6Q1oVgsAquFpRQiUQquxAY1bb9hCaVU3A13+KyjvIAnJFC+sKNMDlwaEnmRdabIid7/N
         5XtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736862137; x=1737466937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W797SlhZRezIDTbO73i8Q0Q5i2usqolq33m4T/Z6rco=;
        b=PJjdo3TKj+hVN7J1dFl1739sNgzde1+eLhV7q+7SSZxXW7eOoR2YBwo4dQ4WAQ6usv
         MTT0BCRlwpzeQ1XGZ1itdE2NIEssX/nmCpainT0H8PZ1b9URa4p8imhfIjRomFHK60Fx
         FcL81i81ytjSr4lTz3Vc5DLg1mLc1ixm+gDoCQqUwKJLzOdZPnK5AhgXFtLi1y0/ihWY
         7Ey+38rObf76MbaAw3pciW/7H53eSI2qRuk+6xXkkqXaYEnonEgCQL/MRL/pjpg/lgrV
         s756qLYAkV72GP3Mxw2APQqP82FVQKFtaF791ylKmSjfQ5Jlr3CQHtbHimBOOu5ik1ki
         zviw==
X-Forwarded-Encrypted: i=1; AJvYcCUoGD5GXfXEmR6ZH9WHYSz7zf6K8qPuMFyLZ1MMIseH3qtmDqDRBu5FfT7QOKFKM+jlt86MHcVAIakMwwC2gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVwjpJ3xRWW2AZnFIFhvfHEV68lzi6mdZ0GSKOQP6mt2hS2tlc
	pDTHzP7WlVgSnP/+OFOqiBzrgVThP1pfdO+O+Gdx4mitS2CiJaBbkFQMMHcDcDIZd0RgvMK9Cz4
	MIESh8CI5CXkU4aQpx+XFoiQ8iolDezdzaj7E
X-Gm-Gg: ASbGncsRziRLTqSJ+Xhv1p1MPWwhsovcIuu8bVtIqG6dVS/ky8xKamppH5sYa/m43J9
	NLShc10P6KijkvaAeDAbiYQxX1JzP+KTWHBDb8a2MNfJgfqUPnpbwzJH7FoLyDQrpgF+U
X-Google-Smtp-Source: AGHT+IEXKag0CbWWo65PECFp9zBOKgXX8j46u6G/syxddzWrSbifJz5pLGcORVckqKpIk0Pe0HRVWO97xjj85MYlduw=
X-Received: by 2002:a5d:6d09:0:b0:385:f7ef:a57f with SMTP id
 ffacd0b85a97d-38a872ec061mr22048811f8f.27.1736862137444; Tue, 14 Jan 2025
 05:42:17 -0800 (PST)
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
 <195559a2-8c5e-40f7-b60a-8534dc177d9b@lucifer.local>
In-Reply-To: <195559a2-8c5e-40f7-b60a-8534dc177d9b@lucifer.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 14 Jan 2025 14:42:05 +0100
X-Gm-Features: AbW1kvbF7ASl_7msP-pHOLWL0YVGMPRbRGoz5UT5c8CCAXYl1MdlS1hozZ1UtQU
Message-ID: <CAH5fLgg-f6LvCTejO6f-04cQTRNC4rE8AwnQdN1NGuN_W2HxNg@mail.gmail.com>
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

On Tue, Jan 14, 2025 at 12:57=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Tue, Jan 14, 2025 at 10:50:01AM +0100, Alice Ryhl wrote:
> > On Mon, Jan 13, 2025 at 3:45=E2=80=AFPM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > > > >> > For a series at v11 where there is broad agreement with mainta=
iners within
> > > > >> > the subsystem which it wraps, perhaps the priority should be t=
o try to have
> > > > >> > the series merged unless there is significant technical object=
ion from the
> > > > >> > rust side?
> > > > >> >
> > > > >> >>
> > > > >> >> How about this:
> > > > >> >>
> > > > >> >> This clears the virtual memory map for the range given by `st=
art` and
> > > > >> >> `size`, dropping refcounts to memory held by the mappings in =
this range. That
> > > > >> >> is, anonymous memory is completely freed, file-backed memory =
has its
> > > > >> >> reference count on page cache folio's dropped, any dirty data=
 will still
> > > > >> >> be written back to disk as usual.
> > > > >> >
> > > > >> > Sorry I object to this, 'clears the virtual memory map' is rea=
lly
> > > > >> > vague. What is already there is better.
> > > > >>
> > > > >> Would you like the proposed paragraph if we replaced "virtual me=
mory
> > > > >> map" with "page table mappings", or do you object to the entiret=
y of the
> > > > >> new suggestion?
> > > > >
> > > > > I object to the suggestion in general. The description is fine as=
 it is.
> > > >
> > > > Ok. I'm raising a flag because I had more questions after reading t=
he
> > > > docstring than before.
> > >
> > > Sure and so I think this is valuable information, and indicates it's
> > > probably worthwhile adding a little extra information on mentioning p=
age
> > > tables.
> >
> > Sorry, I'm a bit lost. What would you like me to add? Perhaps there's
> > an existing file in Documentation/ that I can link to?
>
> Sure no problem, I propose expanding:
>
> /// This clears page table mappings for the range at the leaf level, leav=
ing all other page
> /// tables intact,
> /// anonymous memory is completely freed, file-backed memory has its refe=
rence count on page
> /// cache folio's dropped, any dirty data will still be written back to d=
isk as usual.
>
> To include information on page tables. I suggest something like:
>
> /// It may seem odd that we clear at the leaf level, this is however a pr=
oduct
> /// of the page table structure used to map physical memory into a virtua=
l
> /// address space - each virtual address actually consists of a bitmap of=
 array
> /// indices into page tables, which form a hierarchical page table level
> /// structure.
> ///
> /// As a result, each page table level maps a multiple of page table leve=
ls
> /// below, and thus span ever increasing ranges of pages. At the leaf or =
PTE
> /// level, we map the actual physical memory.
> ///
> /// It is here where a zap operates, as it the only place we can be certa=
in of
> /// clearing without impacting any other virtual mappings. It is an
> /// implementation detail as to whether the kernel goes further in freein=
g
> /// unused page tables, but for the purposes of this operation we must on=
ly
> /// assume that the leaf level is cleared.
>
> Alice, Andreas - please let me know if this makes sense/is clear or needs
> further clarification.

That looks reasonable to me. Thanks!

Do you have thoughts on the wordings I proposed here?
https://lore.kernel.org/all/CAH5fLginc=3DuNPVp1-T-oBrgtE1oi_cBMd65sPkDgqSDj=
H_CNfA@mail.gmail.com/


Alice
