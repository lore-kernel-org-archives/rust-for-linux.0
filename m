Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AC6170A31
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732262159; cv=none; b=HPKawmar1Tv8+8QZ2RrxmMSuLRBdwX1VbWsHlVYjBs54+zu7HJ8zY461orBqnDlIOONI82i1yRMvsRhMd1rcq49X8tPHCwkvy0kUQIhs6PFulA9tK7tdp+V0i9akvbJWqm+z/AOAMyHHMghKek5K8eOIWvihTkG2S4wejOCQ5AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732262159; c=relaxed/simple;
	bh=xVGcxLcjSynzoAVzrOsFTd0jLpmncSnphm899Xcd02g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXDAVtxuyViWXHc+KI6y/oSkpsFvd8LoVMwceVcZjHKgJBR3wfkADuVPlnW2Ra4WIt5IWJqtwBHRSOyr+Kf55MvS8EXS3cE2R2SXmLO46cVsn3fySz57VXRKojnCrc+79KaCAh9SgXC6dRL8JBOWdiuFAdlYagKab54ccTogstY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W5qUZw8I; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W5qUZw8I"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-382610c7116so389482f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 21 Nov 2024 23:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732262156; x=1732866956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4vKBieIfUnfP5rb/GIVJx7pJ7hMdseAArRaDJN1LAw=;
        b=W5qUZw8ICXhpwUfKMNnezDi4hu9nbiy8SzLIwe1dtsS9KasBDWWj0fIC/f2DEmKxkl
         BTgZJXCZgaMvQRrgw6YuliCsv2utUiXuWzkJhtLDi3Iuol6vzABgrcxaPR72btnjz6MN
         mpxusd7nLaPGKaNUM/zV2E5XFiQ9yKwR0fvCLscUmU2qqUXDuXLWmDyE7G9SgdsjBwoi
         wIOzqYxeQ5mVNg9VsbfImVSkF/sdhdSKz+29jB9YZ+zWpUWZy+92xJeUUgrtCbdj2n89
         ZZSyy5P7iU674IXen7YPPAxJfcah+oMAACjMRmgc16dl877CtMwrXsVIDRMIcBsUdSSI
         eIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732262156; x=1732866956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4vKBieIfUnfP5rb/GIVJx7pJ7hMdseAArRaDJN1LAw=;
        b=bPJHTHRe1JL1Ehxz663xBhWS74C+lFhWBuJCyC8+vMS5lJMaa2ngIw/LRWQ+1mMZoV
         3Mh0T9scWwideyydhQHUPPvtAXi1aFNK1ITAqh9uX/jRs1dRNLjECDx4M87AHLFGjfE+
         5yic2jvJ2hVg+RGuqp+4f0nWMkLcai9xK25NexkyS2qAj2XPH+qTJPnwPGY76+gXKCvZ
         CxC1HYbrtueqixItIFxOC+ui9sYUlRRsKtztTrTwq0fBjwl7LoZhSekCmPzG5/ELLqnG
         QvKQM3zDY+wtT9GOrAXsLvMt1Qgj6VroTm22n6EaXb1ZLY7bBKRWTYbs6BTGPXUz2Y2t
         GJYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbMJyaISLBES2SsUSjZp/JI0laiTeBug5y+/DCXHoeuHNv2WkbqvtxKUXvKknrXjjAcyWiI0yFe6dywk08cg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1/Luyc3EUDfwu3uiwnocZWUyOemqFuxBCUuUFQ8/cd0x2dUKs
	zKtRe52rWQZ5qqmfERVRt9YLI83QGaq9xd/cgoOC+JA321Dg2vZBnbfOUO0XxHgTh7f1a/ubhnq
	2kat76fG6qoXMxuP05kOAK2dNyeIan0LSGTq+
X-Gm-Gg: ASbGncsuuCFHwTJxUtiSIopXaTxnRJ48Hx81hN8nWxQ2wghoUCug2mFi34UygNHRAm5
	YddnK5wrsb5ZZbyxqpgufVUhRTi2hGvt4
X-Google-Smtp-Source: AGHT+IFkzG3/qxSMU//RMD7jHCtgcpHQJ+DTwGvLNDlSxbRcCSQe+8OMIoK+cYjmebrEz5l80i1lbp8WkF/Cant0Mek=
X-Received: by 2002:adf:e18c:0:b0:382:3894:346c with SMTP id
 ffacd0b85a97d-38260b76c31mr1646813f8f.27.1732262155734; Thu, 21 Nov 2024
 23:55:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119112408.779243-1-abdiel.janulgue@gmail.com>
 <20241119112408.779243-3-abdiel.janulgue@gmail.com> <CAG48ez3fjXG1Zi=V8yte9ZgSkDVeJiQV6xau7FHocTiTMw0d=w@mail.gmail.com>
 <43a07c04-2985-4999-b6d6-732794906a36@gmail.com> <CAG48ez1uzoEcsFG7Tsfj2WCXor9-mhffoWO8VFoit3j_mUC7-A@mail.gmail.com>
In-Reply-To: <CAG48ez1uzoEcsFG7Tsfj2WCXor9-mhffoWO8VFoit3j_mUC7-A@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 22 Nov 2024 08:55:42 +0100
Message-ID: <CAH5fLghUb8dEV9GVtJj497cJ5sp4Gg7=qeijfnV_w4BNd70qxg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: page: Extend support to existing struct page mappings
To: Jann Horn <jannh@google.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, airlied@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 9:18=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>
> On Wed, Nov 20, 2024 at 11:56=E2=80=AFPM Abdiel Janulgue
> <abdiel.janulgue@gmail.com> wrote:
> > On 19/11/2024 19:07, Jann Horn wrote:
> > >> +    pub fn page_slice_to_page<'a>(page: &PageSlice) -> Result<&'a S=
elf>
> > >
> > > Sorry, can you explain to me what the semantics of this are? Does thi=
s
> > > create a Page reference that is not lifetime-bound to the PageSlice?
> >
> > This creates a Page reference that is tied to the lifetime of the `C
> > struct page` behind the PageSlice buffer. Basically, it's just a cast
> > from the struct page pointer and does not own that resource.
>
> How is the Page reference tied to the lifetime of the C "struct page"?
>
> I asked some Rust experts to explain to me what this method signature
> expands to, and they added the following to the Rust docs:
>
> https://github.com/rust-lang/reference/blob/master/src/lifetime-elision.m=
d
> ```
> fn other_args1<'a>(arg: &str) -> &'a str;             // elided
> fn other_args2<'a, 'b>(arg: &'b str) -> &'a str;      // expanded
> ```
>
> Basically, my understanding is that since you are explicitly
> specifying that the result should have lifetime 'a, but you are not
> specifying the lifetime of the parameter, the parameter is given a
> separate, unrelated lifetime by the compiler? Am I misunderstanding
> how this works, or is that a typo in the method signature?

No, you are correct. The signature is wrong and lets the caller pick
any lifetime they want, with no relation to the lifetime of the
underlying `struct page`.

From a C perspective, what are the lifetime requirements of vmalloc_to_page=
?

> > >> +fn to_vec_with_allocator<A: Allocator>(val: &[u8]) -> Result<Vec<Pa=
geSlice, A>, AllocError> {
> > > Do I understand correctly that this can be used to create a kmalloc
> > > allocation whose pages can then basically be passed to
> > > page_slice_to_page()?
> > >
> > > FYI, the page refcount does not protect against UAF of slab
> > > allocations through new slab allocations of the same size. In other
> > > words: The slab allocator can internally recycle memory without going
> > > through the page allocator, and the slab allocator itself does not
> > > care about page refcounts.
> > >
> > > If the Page returned from calling page_slice_to_page() on the slab
> > > memory pages returned from to_vec_with_allocator() is purely usable a=
s
> > > a borrow and there is no way to later grab a refcounted reference to
> > > it or pass it into a C function that assumes it can grab a reference
> > > to the page, I guess that works.
> >
> > Yes, I think that is the intent. I appreciate your help in pointing out
> > the issues with using refcounts in slab memory pages. As you can see,
> > page_slice_to_page() only returns a Page reference (not a refcounted
> > Page). Hopefully that addresses your concern?
>
> Does Rust also prevent safe code from invoking inc_ref() on the
> returned Page reference? Normally, the AlwaysRefCounted trait means
> that safe code can create an owned reference from a shared reference,
> right?

In principle, no, you could invoke inc_ref() directly. But the correct
way to do it would be to use ARef::from(my_ref) to obtain an actual
refcounted reference.

Alice
