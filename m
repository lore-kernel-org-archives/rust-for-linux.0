Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631F51E98F2;
	Wed, 15 Jan 2025 11:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736939022; cv=none; b=tRCZIFfeLLlrd0cqwNH+5WX/GXeH/z9IXO+wnKLYiccJL0isgVboeevWppBaF1HB3SF/tv13iVDcdAf1djJoi0NrF5LsL4fWIcj7wAq+YAB2d33/STdZ2Sn/KhVwGrG3rQ8dVsaIYXI4mEPtH1O6HX7yCoy46DQiMoKoVeH713E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736939022; c=relaxed/simple;
	bh=bZF9qYZjTl2qAZfueZxY25UdxHzQzc1tBlZt6AOUrKw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lK5QFN9wqchDfAei9MTlk1moIC0cK1VfMZISDv9m/GVQb00a6KpnzicKIW1hJTbqXMKIWmdjSphBYL9X1iGd3+fAqlRb6M7bdG7Ojp+OiZsznOzelMbORyln74zBBOTp9sgJUpHV+oDsg+Znc+BhblmfOUf8vYnyyzgDfOcIKJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JMYT7ldS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMYT7ldS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA57C4CEDF;
	Wed, 15 Jan 2025 11:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736939022;
	bh=bZF9qYZjTl2qAZfueZxY25UdxHzQzc1tBlZt6AOUrKw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JMYT7ldScx4SnmhBtVbPoHO/pcHEHtTyIrh3477NpQPk0BEwAK0UJxHIo+KxflQWC
	 qkHQ3XIJolOkU25tLDoF340aTnYHlIgDRq7DQmRCdyxXOahYniSpsFA96RVUvCy0gL
	 u606RIVVGdvyqkmJ0L1dEqqCvubkQ88DwIJ6rLE3pxez/Ha44FsY5jUtU/RfXXV/vm
	 Es8kVZ8TCpoNICndnQBysEGI9iTwO/OehJuk0ftL/BuS2KNyDy7uOQgBy+eJ5a1PW7
	 AKaaqV1a1fqr01ufAdHMWwa2n8CvQ2YvwdCHEw5qOvQidBaeRaA91CrMmTmFLwmyLM
	 F2LBBhtCLiCFQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>,  "Miguel Ojeda" <ojeda@kernel.org>,
  "Matthew Wilcox" <willy@infradead.org>,  "Vlastimil Babka"
 <vbabka@suse.cz>,  "John Hubbard" <jhubbard@nvidia.com>,  "Liam R.
 Howlett" <Liam.Howlett@oracle.com>,  "Andrew Morton"
 <akpm@linux-foundation.org>,  "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>,  "Arnd Bergmann" <arnd@arndb.de>,
  "Christian Brauner" <brauner@kernel.org>,  "Jann Horn"
 <jannh@google.com>,  "Suren Baghdasaryan" <surenb@google.com>,  "Alex
 Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,
  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Trevor Gross" <tmgross@umich.edu>,  <linux-kernel@vger.kernel.org>,
  <linux-mm@kvack.org>,  <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v11 2/8] mm: rust: add vm_area_struct methods that
 require read access
In-Reply-To: <195559a2-8c5e-40f7-b60a-8534dc177d9b@lucifer.local> (Lorenzo
	Stoakes's message of "Tue, 14 Jan 2025 11:57:23 +0000")
References: <CAH5fLgiS_=MiMcnyC2z8kXQW0Kpn36h6EaHs9g7Zaw85mLn2jA@mail.gmail.com>
	<87frlsbekc.fsf@kernel.org>
	<vH_JjBon9WfW7x7OzrUfhGFluWCiBwsPZDkHbFt77nth4SFWJ-4W2vXXBYmE8WEaEJsibxx2N4iXS8Vx6RbAQA==@protonmail.internalid>
	<18bc911a-ede5-410b-9955-5382bcef975c@lucifer.local>
	<87msg09uzu.fsf@kernel.org>
	<qG6w11OwPsgdMa-EKR7V-NiBoOsQocuJDWurazcGSwtN601gK8RP1_un0Gx5MF0pPoKPnEL4ssYKiJUUIkF_Hw==@protonmail.internalid>
	<8b803030-0ca3-4591-b2f3-bb9bcc2aca21@lucifer.local>
	<871pxcgg02.fsf@kernel.org>
	<ec1e87e9-2d84-435a-8e2a-1d426a9c13a0@lucifer.local>
	<CAH5fLggntnvMLoZHTm6zx3nSP4nq7iruK2c6iXBX-CXtVPYbcA@mail.gmail.com>
	<ft9bqx-YTXpiym3AWq1aScaB44OScx2nUbYOA2Aw7H54H_-cxSwrb4FhwIy9eIS5LIhqZZBDbyXAnzujUkbA-w==@protonmail.internalid>
	<195559a2-8c5e-40f7-b60a-8534dc177d9b@lucifer.local>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 12:02:14 +0100
Message-ID: <874j20e3wp.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Lorenzo Stoakes" <lorenzo.stoakes@oracle.com> writes:

> On Tue, Jan 14, 2025 at 10:50:01AM +0100, Alice Ryhl wrote:
>> On Mon, Jan 13, 2025 at 3:45=E2=80=AFPM Lorenzo Stoakes
>> <lorenzo.stoakes@oracle.com> wrote:
>> > > >> > For a series at v11 where there is broad agreement with maintai=
ners within
>> > > >> > the subsystem which it wraps, perhaps the priority should be to=
 try to have
>> > > >> > the series merged unless there is significant technical objecti=
on from the
>> > > >> > rust side?
>> > > >> >
>> > > >> >>
>> > > >> >> How about this:
>> > > >> >>
>> > > >> >> This clears the virtual memory map for the range given by `sta=
rt` and
>> > > >> >> `size`, dropping refcounts to memory held by the mappings in t=
his range. That
>> > > >> >> is, anonymous memory is completely freed, file-backed memory h=
as its
>> > > >> >> reference count on page cache folio's dropped, any dirty data =
will still
>> > > >> >> be written back to disk as usual.
>> > > >> >
>> > > >> > Sorry I object to this, 'clears the virtual memory map' is real=
ly
>> > > >> > vague. What is already there is better.
>> > > >>
>> > > >> Would you like the proposed paragraph if we replaced "virtual mem=
ory
>> > > >> map" with "page table mappings", or do you object to the entirety=
 of the
>> > > >> new suggestion?
>> > > >
>> > > > I object to the suggestion in general. The description is fine as =
it is.
>> > >
>> > > Ok. I'm raising a flag because I had more questions after reading the
>> > > docstring than before.
>> >
>> > Sure and so I think this is valuable information, and indicates it's
>> > probably worthwhile adding a little extra information on mentioning pa=
ge
>> > tables.
>>
>> Sorry, I'm a bit lost. What would you like me to add? Perhaps there's
>> an existing file in Documentation/ that I can link to?
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
> /// of the page table structure used to map physical memory into a virtual
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
> /// implementation detail as to whether the kernel goes further in freeing
> /// unused page tables, but for the purposes of this operation we must on=
ly
> /// assume that the leaf level is cleared.
>
> Alice, Andreas - please let me know if this makes sense/is clear or needs
> further clarification.

Sounds good to me - thanks.

@Alice - can we add PTE, PTE entry, PMD, PUD to the vocabulary at the
top? Not sure if it should go here in virt.rs or in mm.rs. If you have
no cycles I can try to add it down the road.


Best regards,
Andreas Hindborg



