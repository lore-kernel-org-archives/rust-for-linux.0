Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B185A172BD5
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 12:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722516691; cv=none; b=fgkEAC/X74epz0Lr3vwEs1hbyZMOMAsWoaGUqI1HvzXFIsBX1N0n3s0UuL9o38+mHjHklmb81pKLnG6bkFhnfqwempUtSUaXUePcweqpfmoVoqN/wHP0dzq1jIvDalA3NMpFGbfg0Y737TIrIzV3nWya/n6ZdvO9sKfSwLp4UH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722516691; c=relaxed/simple;
	bh=fSBUkzUUkWt107EAs69kOFAPLO3pyAPRIAczRvrIq5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sLK6duQmWXpbuzOkTGRVeMjH+SDBEVnYjPjmeFz7lAaMMGv2UQe7AxP6kTThQ0FwlzSQbOe37vOYgGR9F3ZImjGQ6uiL9LGBZBlaEKN+MHJA6G8qlv6qUZz6gdp18q9w5t/DJIuEJZZvnzVx8CJ9n1eYw758tzE/hrGFNnZ5N6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fDuouXDk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fDuouXDk"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4281c164408so38468935e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 05:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722516688; x=1723121488; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QMpYiaUKnQGePeyncUAsOyGyvo4sFuaZoIKakgcqds=;
        b=fDuouXDkFEUNSWEtlelIisa8gBO3deekZ5oIOg2n3ZOVTfZBNtC+ThQ20SzprMx7tZ
         SplvP8QdSfmK1PHCH2tvVO74mJa6/YGBp5zZb+Zt5me4WQWPCGDd6ueJlBvTo9jW91Vd
         nnIOesXV/nTmLx9c2FhbigsBrdqOuLXq92UfkEuKPmD4pTScjzXlOtyxLy8XKO0BL3H2
         NsyMk/kseMN4tAoAr1u/Kfcdq9CSKLo5mAYC8Nbub6pptICtraVonmOtxiHgnh9vG1vS
         GlZU9S8jHg/Qsn96q2R4mrQPFSqgljutl85ur/bM/usw13zyqTogIJ3NQMOLBQIvtZXv
         mQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722516688; x=1723121488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QMpYiaUKnQGePeyncUAsOyGyvo4sFuaZoIKakgcqds=;
        b=nqsoSwCsTD8e8w9DwoTs/4hc1UEJD9Fvt00rGbFbk/+vECJVGya5zmmtYbRx7RXs5r
         3kAtadVFv9Q3/Br+1uVSeUK97O+fiZzkG43jLesKd5IA/JYE0vF4cP9/7Omvw/MAL8kO
         F61+NScB2ATug6cP0zMWIQpFcLhXhJreyyyWmdsYwNK5b2ZAKxk5NXz8t1834CBGvcD/
         oo+YXnNWFM/nsyvWrce3SvseAjdBjw8Qn2yQeqIc2lfN9VLpL4vAfTpuvISKEQ4h9q/z
         0mwCJeFfXFEjd+wCVTYrWXO9Bz44N0LUo9Cn601dCS7BYqikQzOMIMTq+++orOARr7Ug
         GCCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEobnfjiml/mC03YIl8gfZWsc4VRWiRlbrcra2JcLSK1Uqeisz4Pj1FsXgEh7ByN964fFJhESeye1/w6y6ltJio5RQjdwxGkxd5Qx+fBE=
X-Gm-Message-State: AOJu0YygTRiXNraRPJl0EpyczGMX3PHCvt8vJGuhPmD7vunJ3Mb8KQRA
	Vn6bsrwNEHrcx6CcSfUMb4UNCxEIa3d8DU2/uTnykVKtepR39I8Zp8v9hN/2gC70HqIfPy19g/f
	6+uHuV+r8k9rurhdnhMdhuG14lXnCSS6E4XzO
X-Google-Smtp-Source: AGHT+IGFMbQ6YBajivuDZ1k5rIS4yW0tNO+NYuNxc00k9ljQGThK75whHTQu91KdxYsCWAj62TVJQLL+OJJJ8D283gQ=
X-Received: by 2002:a05:600c:46d5:b0:428:e140:88c4 with SMTP id
 5b1f17b1804b1-428e14088d2mr12744765e9.33.1722516687702; Thu, 01 Aug 2024
 05:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723-linked-list-v3-0-89db92c7dbf4@google.com>
 <20240723-linked-list-v3-4-89db92c7dbf4@google.com> <1b2078d8-d93b-4626-a73f-edc5616a2357@proton.me>
 <CAH5fLggKphE3f=Jv+pfXc+_qjsGBVpXw_F4fOJiAi6vNtJ5x+Q@mail.gmail.com> <5b13793c-3ec8-40c2-b0c6-e7b10883d0cb@proton.me>
In-Reply-To: <5b13793c-3ec8-40c2-b0c6-e7b10883d0cb@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 14:51:16 +0200
Message-ID: <CAH5fLgjntr81+OFxzVqvb+zL4RqHCap9LZnNxNvN_gzF8AKrRg@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] rust: list: add struct with prev/next pointers
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Marco Elver <elver@google.com>, Coly Li <colyli@suse.de>, 
	Paolo Abeni <pabeni@redhat.com>, Pierre Gondois <pierre.gondois@arm.com>, 
	Ingo Molnar <mingo@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Wei Yang <richard.weiyang@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 12:45=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 01.08.24 11:42, Alice Ryhl wrote:
> > On Wed, Jul 31, 2024 at 8:41=E2=80=AFPM Benno Lossin <benno.lossin@prot=
on.me> wrote:
> >>
> >> On 23.07.24 10:22, Alice Ryhl wrote:
> >>> +/// The prev/next pointers for an item in a linked list.
> >>> +///
> >>> +/// # Invariants
> >>> +///
> >>> +/// The fields are null if and only if this item is not in a list.
> >>> +#[repr(transparent)]
> >>> +pub struct ListLinks<const ID: u64 =3D 0> {
> >>> +    #[allow(dead_code)]
> >>> +    inner: Opaque<ListLinksFields>,
> >>
> >> Do you really need `Opaque`? Or would `UnsafeCell` be enough? (If it i=
s
> >> enough and you change this, be aware that `Opaque` is `!Unpin`, so if
> >> you intend for `ListLinks` to also be `!Unpin`, then you need a
> >> `PhantomPinned`)
> >
> > I need the `!Unpin` part for aliasing.
>
> Oh good point, do you mind adding a comment for that?
>
> >>> +}
> >>> +
> >>> +// SAFETY: The next/prev fields of a ListLinks can be moved across t=
hread boundaries.
> >>
> >> Why? This is not a justification.
> >
> > What would you say?
>
> While trying to come up with a safety comment I thought about the
> following: this impl does not depend on the type that is behind the
> pointer (ie the type containing the `ListLinks`). Thus this `ListLinks`
> will always implement `Send` even if the pointed-to value does not.
> What we could do (and what definitely would be correct) is this:
> `List` can only be used with `Send` types, then we could implement
> `Send` for `ListLinks`. But I haven't actually come up with a problem,
> so there might a more permissive solution.
> Do you have a use-case where you need `!Send` types in a list?
>
> Here is a part of my reasoning: If the pointed-to value is `!Send`, then
> the `List` item type must also be `!Send`. Thus all list operations take
> place on the same thread (since the `List` will be `!Send`). Therefore
> nobody can access the `prev`/`next` pointers from another thread.
>
> But this does not justify that `ListLinks` can be made `Send`. (although
> there isn't actually a problem)

I don't think there's any reason to forbid lists with !Send types. The
List just becomes !Send too.

Alice
