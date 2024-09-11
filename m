Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBF719E97A
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Sep 2024 13:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726061294; cv=none; b=Ij+XdBXkI0Gx7NVbign+6bLUjzdJt3yi9DKy5SnGpCwuekw4t/B+WRIJ+DasGDwL8pk3i16ITKFHSPWtAEiYEtDa/ip1Kn9RjOKnl8jzwuH7Qtkt4aLgEoPhPdOyerypG2TRU/vG6ojoNkHaOW4vXdgWMWfp2mm6eL55+z9rKKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726061294; c=relaxed/simple;
	bh=px4cSD8HQGH2wO4T6TnkDTDsLBmuGTU3jnHSj51SJ2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSuU2TRqFcYSQBVnpjfgHu7YaJX6eOoXnNTQ5FpRmacOIm4MdaUtTToDT/rF2AqcSdquII4pIrCk9e1q6vzxUFgxHFphHYK/BrO6i7x8Ok9MHIyznyKT/Lzd5hKbdWktjm7IviEK4FXwqFnK52f7UY+VgVxWABtlHv8VC3mGrdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bnB53X8V; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bnB53X8V"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-374c5bab490so584390f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Sep 2024 06:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726061291; x=1726666091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=px4cSD8HQGH2wO4T6TnkDTDsLBmuGTU3jnHSj51SJ2E=;
        b=bnB53X8VxXIBcNZ/8mcD1FjYGExRq7iiBlyb6+tCu8rBeCAGIBbpGhfu+PUZgxK9LN
         7l2fYpyQDt5Z7Xf6716dTwz3pSZEPy1Eafj7NW3QKz3tmCxIRkAmPa0dj1PVJEsDcQ24
         XEQub6gLyEn16rwYLyM2Rjdmoe+EsLNB6CgjtyvsqEG2HR5T1NSH3dT89cNnaORTewQe
         hp5j0oKiu/7u2HgpDjFC8zua+moRgOI8mDfs5ONe/Ait8QhZqSuW2QnpxtuT3KsD5XWG
         /0eHAFfKiCEJPnDWlkDK9gDbgaK/G2XWKAE0BCbtIf7eRP/DR/bue7lLOMZ/PePPmon4
         FCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726061291; x=1726666091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=px4cSD8HQGH2wO4T6TnkDTDsLBmuGTU3jnHSj51SJ2E=;
        b=lCzkwy/0/YKsrJDNgliDU0posC1sBMEsPWlgdH1MyJfjtK1VGE4f24Rz4AckcsgS2p
         8G0MBdzGVIkrhfN2VfBdpkUwbktkdHgkoLYpQN1xmf+mXgHbpqxvZkaZTf/ZJ1Wh3Q/7
         foWx9Efmr6/IuGDmDgHxOussj0oRcxrqk20pyDJU8Cg+C+8BfAp65KE+EI8VXiRRcyE+
         UN5uDm0RZz5L4GQ8rLrQx9m6tJp6zg90huQRu+geXlSmBuiCyld9CHJAMdbVfxmZJK6Q
         hS6MAcUImx9AmK9btfUOQRXuvD1m3Mpi6G0o3CtdkJdEwfdZuKjRG4LbubFkJJeVUVky
         ZFww==
X-Forwarded-Encrypted: i=1; AJvYcCVHA0oPsBv4AizO0XTOkc9VpKF3z6f45olT2nmRi1w0hebl31Qafx+/Wz2akT3eCZX/4O6ZYKKawrCeJRtnmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yysg43HyktDe2tyeaZ1P/ibOIHnVU3b+NyCDNnJeff+gQm7iO7j
	hnS+gNBcCsr/YuNLeatcFkPIKhByjaT8UbTXUwb+ud4ZnVi5UrxAa18sCgunbmOzxHnFV7aEohR
	qgKwcBKIw8npDIGrHYRCO8UzcrEAuV7PB3HOA
X-Google-Smtp-Source: AGHT+IF7/qa6erGSnEBi7fIAOrWoIKy5LBtKxYx46O8lTaD8uJY5tg4G2Y2qvcaMrtOl7y3nlkrlm3fI+Ca7t7jxV0U=
X-Received: by 2002:a05:6000:511:b0:374:cb8e:4b43 with SMTP id
 ffacd0b85a97d-378a8a8405amr3432838f8f.32.1726061290584; Wed, 11 Sep 2024
 06:28:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240816001216.26575-1-dakr@kernel.org> <20240816001216.26575-10-dakr@kernel.org>
 <0146cb78-5a35-4d6b-bc75-fed1fc0c270c@proton.me> <ZuCEneJeXcRo5qs8@pollux>
 <19d81a27-9600-4990-867c-624104e3ad83@proton.me> <ZuDVekRzfeBkWmKz@pollux>
 <77b91448-a21e-4e1b-9a8e-3d2052d79a78@proton.me> <ZuF444VO8gK8l7UR@pollux> <b80cb238-5fcc-4bbb-8b03-42e173c28653@proton.me>
In-Reply-To: <b80cb238-5fcc-4bbb-8b03-42e173c28653@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Sep 2024 15:27:57 +0200
Message-ID: <CAH5fLghwj-rD8zoPFgp3g1JYm8WrOhuiWnm7w=zStqOfRRZUJw@mail.gmail.com>
Subject: Re: [PATCH v6 09/26] rust: alloc: implement kernel `Box`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 3:26=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 11.09.24 13:02, Danilo Krummrich wrote:
> > On Wed, Sep 11, 2024 at 08:36:38AM +0000, Benno Lossin wrote:
> >> On 11.09.24 01:25, Danilo Krummrich wrote:
> >>> On Tue, Sep 10, 2024 at 07:49:42PM +0000, Benno Lossin wrote:
> >>>> On 10.09.24 19:40, Danilo Krummrich wrote:
> >>>>> On Sat, Aug 31, 2024 at 05:39:07AM +0000, Benno Lossin wrote:
> >>>>>> On 16.08.24 02:10, Danilo Krummrich wrote:
> >>>>>>> +///
> >>>>>>> +/// ```
> >>>>>>> +/// # use kernel::bindings;
> >>>>>>> +/// const SIZE: usize =3D bindings::KMALLOC_MAX_SIZE as usize + =
1;
> >>>>>>> +/// struct Huge([u8; SIZE]);
> >>>>>>> +///
> >>>>>>> +/// assert!(KVBox::<Huge>::new_uninit(GFP_KERNEL).is_ok());
> >>>>>>> +/// ```
> >>>>>>
> >>>>>> Similarly, you could then say above this one "Instead use either `=
VBox`
> >>>>>> or `KVBox`:"
> >>>>>>
> >>>>>>> +///
> >>>>>>> +/// # Invariants
> >>>>>>> +///
> >>>>>>> +/// The [`Box`]' pointer is always properly aligned and either p=
oints to memory allocated with `A`
> >>>>>>
> >>>>>> Please use `self.0` instead of "[`Box`]'".
> >>>>>>
> >>>>>>> +/// or, for zero-sized types, is a dangling pointer.
> >>>>>>
> >>>>>> Probably "dangling, well aligned pointer.".
> >>>>>
> >>>>> Does this add any value? For ZSTs everything is "well aligned", isn=
't it?
> >>>>
> >>>> ZSTs can have alignment and then unaligned pointers do exist for the=
m
> >>>> (and dereferencing them is UB!):
> >>>
> >>> Where is this documented? The documentation says:
> >>>
> >>> "For operations of size zero, *every* pointer is valid, including the=
 null
> >>> pointer. The following points are only concerned with non-zero-sized =
accesses."
> >>> [1]
> >>
> >> That's a good point, the documentation looks a bit outdated. I found
> >> this page in the nomicon: https://doc.rust-lang.org/nomicon/vec/vec-zs=
ts.html
> >> The first iterator implementation has an alignment issue. (Nevertheles=
s,
> >> that chapter of the nomicon is probably useful to you, since it goes
> >> over implementing `Vec`, but maybe you already saw it)
> >>
> >>> [1] https://doc.rust-lang.org/std/ptr/index.html
> >>
> >> Might be a good idea to improve/complain about this at the rust projec=
t.
> >
> > Well, my point is how do we know? There's no language specification and=
 the
> > documentation is (at least) ambiguous.
>
> So I went through the unsafe-coding-guidelines issues list and only
> found this one: https://github.com/rust-lang/unsafe-code-guidelines/issue=
s/93
> Maybe I missed something. You could also try to ask at the rust zulip in
> the t-opsem channel for further clarification.
>
> I think we should just be on the safe side and assume that ZSTs require
> alignment. But if you get a convincing answer and if they say that they
> will document it, then I don't mind removing the alignment requirement.

Please see the section on alignment in the same page. Just because a
pointer is valid does not mean that it is properly aligned.

From the page:

Valid raw pointers as defined above are not necessarily properly
aligned (where =E2=80=9Cproper=E2=80=9D alignment is defined by the pointee=
 type,
i.e., *const T must be aligned to mem::align_of::<T>()). However, most
functions require their arguments to be properly aligned, and will
explicitly state this requirement in their documentation. Notable
exceptions to this are read_unaligned and write_unaligned.

When a function requires proper alignment, it does so even if the
access has size 0, i.e., even if memory is not actually touched.
Consider using NonNull::dangling in such cases.

Alice
