Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFD116F8F5
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 09:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722505273; cv=none; b=Diol++ib9TGazDfWnKkS5QsU7mif5YS3E3iMPn2vOcuKPHHHhGgTLaZOkT0y3jH/ReWd/lnl57OTIcgYnmy4+0vM5IcXZJBvcD7ZThzys7NCVlryP5h4Pf/Y0A3QbyHMEWNqQwMalJkv5DtuHYuHu2ABKOytLFl4SxuzgwPJegQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722505273; c=relaxed/simple;
	bh=/BLAB4f9eTGSa53jMgdMY4/Br/ckgAGBrPgFlO0KA0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V499LInu6oB4YCZf2I20lLR1RW0AEWvqmll9ZXTx3OzSZHJp1IGkimLnPLLr/7nzgxuIBrOD68YVgRXrZzq9S2YGQLuEV/RKtbHkvWLjathluaBgEQjrk+rKJgtgz85j0pHeeynpQgcVgtVfp1oLy6xVDXJ9V1TMwTEwBgJa/fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NgaoTjZD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NgaoTjZD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-427b1d4da32so11021615e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 02:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722505270; x=1723110070; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPveitWmO+N9kxLc1dzekrzbMSrfwutxH91QWfQ7YZs=;
        b=NgaoTjZDSY/ETCdLKrFZDJbefMvbpVH7qjxDleJFrOvZCRc4uDERZsLD7kH65QvnTe
         5sogg6D96dVvku2jkGJR50ve2FKpSjlG5vB4PIWIgq2jn+t0n9BK1xhvjZjbvza+Lrwa
         mdkqvUagQz56CxU3wxME5TqzLTLqlJUL2eQ0amClgiFfmCa40Wz38g/nNRmFIY5y41Qu
         2H5E4QEk/CDq47IyxCTcGEqXndeqlmA/8FLQ5zyeRG+Wm74d0AMbAFoY8MBF3iuwj+yb
         QngroSk0UvPVUV+80s+CaqktYHKRX2xEIks9S7x0SnsAaBIk6lR6JHsRNfeHjkRIF/O1
         KBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722505270; x=1723110070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPveitWmO+N9kxLc1dzekrzbMSrfwutxH91QWfQ7YZs=;
        b=eXcovki0/i847ETGAyMC4ikEtBOarJCjWD0Ab03kaCPEByA5NVwwlvSlpXl6QOQqZh
         XbjRAYxC9Ma9aoau0E4P6ykf1CCH3IpHJwVu/h6ldqAZbomI2LbjDQTY1aEFWhDyajAR
         N6KXkAYLYRUSbq3FMbMJcPEoUc7Q8jGXBH33y33upnKqTAow3/h1GTKucK4Fr6dCsP55
         /+YVYrK9nDibY+fUf2WaKsgSgrxECinYu5Rl/goX2A9QmF3dZeqlTcnIFo0fjHfY9r4D
         AwIQfX8TupGN4IiVwmQ+fpCHuK/Jzv7rvjBsp2I47zv5qV5mFIm8kAmrtESzEQjpJal6
         9i9w==
X-Forwarded-Encrypted: i=1; AJvYcCXXlupMN3mLDgrr3mjU7b9My4aNf3YInFzFWshIFvYPNRHUJeMwFCn3nr5qAfBkI6cyOKDsCSFZS7+NTxXGIrkZQDSmww2KxUYK+vFxyqk=
X-Gm-Message-State: AOJu0YxB8IxJrV6h652aEjvvADEUexwY6kjCO5ZUzIJg8dnXC4FXHIXQ
	7aCV66ZO528ckMg5OosLaD3Ob+knKou/gWUc56eByxjEXCA/u12BySIy8yZZFuo3mQqvUqgNSF9
	tNlbs/HTG0zc33ka9ET6xj2M1BPp0QqGfBGFR
X-Google-Smtp-Source: AGHT+IHevME7fVU8JPQJHDQK9jpt4f9SROzwQ5aKvKTPVW39ErLfAxPLIwpt/iHyRAOUUmZVH0hc474krn4woZMuhSA=
X-Received: by 2002:a05:600c:3b21:b0:428:6ac:426e with SMTP id
 5b1f17b1804b1-428e4713fe7mr8632005e9.5.1722505269467; Thu, 01 Aug 2024
 02:41:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723-linked-list-v3-0-89db92c7dbf4@google.com>
 <20240723-linked-list-v3-6-89db92c7dbf4@google.com> <3e6a37d1-2460-42ce-8bc3-0b210759efa8@proton.me>
In-Reply-To: <3e6a37d1-2460-42ce-8bc3-0b210759efa8@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 11:40:57 +0200
Message-ID: <CAH5fLgjNCXwhUaHh7dxm-5LmFe-TtiizK2cWscSp9bkdknRywQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] rust: list: add List
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

On Thu, Aug 1, 2024 at 11:11=E2=80=AFAM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 23.07.24 10:22, Alice Ryhl wrote:
> > +    /// Add the provided item to the back of the list.
> > +    pub fn push_back(&mut self, item: ListArc<T, ID>) {
> > +        let raw_item =3D ListArc::into_raw(item);
> > +        // SAFETY:
> > +        // * We just got `raw_item` from a `ListArc`, so it's in an `A=
rc`.
> > +        // * If this requirement is violated, then the previous caller=
 of `prepare_to_insert`
> > +        //   violated the safety requirement that they can't give up o=
wnership of the `ListArc`
> > +        //   until they call `post_remove`.
>
> I don't like this negative phrasing, what about "Since we have ownership
> of the `ListArc`, `post_remove` must have been called after each
> previous call to `prepare_to_insert`."?

I think we just need to argue about the most recent call to
prepare_to_insert but ok.

> > +        // * We own the `ListArc`.
> > +        // * Removing items from this list is always done using `remov=
e_internal_inner`, which
> > +        //   calls `post_remove` before giving up ownership.
> > +        let list_links =3D unsafe { T::prepare_to_insert(raw_item) };
> > +        // SAFETY: We have not yet called `post_remove`, so `list_link=
s` is still valid.
> > +        let item =3D unsafe { ListLinks::fields(list_links) };
> > +
> > +        if self.first.is_null() {
> > +            self.first =3D item;
> > +            // SAFETY: The caller just gave us ownership of these fiel=
ds.
> > +            // INVARIANT: A linked list with one item should be cyclic=
.
> > +            unsafe {
> > +                (*item).next =3D item;
> > +                (*item).prev =3D item;
> > +            }
> > +        } else {
> > +            let next =3D self.first;
> > +            // SAFETY: By the type invariant, this pointer is valid or=
 null. We just checked that
> > +            // it's not null, so it must be valid.
> > +            let prev =3D unsafe { (*next).prev };
> > +            // SAFETY: Pointers in a linked list are never dangling, a=
nd the caller just gave us
> > +            // ownership of the fields on `item`.
> > +            // INVARIANT: This correctly inserts `item` between `prev`=
 and `next`.
> > +            unsafe {
> > +                (*item).next =3D next;
> > +                (*item).prev =3D prev;
> > +                (*prev).next =3D item;
> > +                (*next).prev =3D item;
> > +            }
>
> You have this pattern several times, maybe make a function for this?

It's just two times. I think it's fine.

> > +        if !next.is_null() {
> > +            // This is really a no-op, but this ensures that `item` is=
 a raw pointer that was
> > +            // obtained without going through a pointer->reference->po=
inter conversion rountrip.
> > +            // This ensures that the list is valid under the more rest=
rictive strict provenance
> > +            // ruleset.
> > +            //
> > +            // SAFETY: We just checked that `next` is not null, and it=
's not dangling by the
> > +            // list invariants.
> > +            unsafe {
> > +                debug_assert_eq!(item, (*next).prev);
> > +                item =3D (*next).prev;
> > +            }
>
> How bad do you reckon is this for performance?

I don't think it's a problem at all.

Alice
