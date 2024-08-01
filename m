Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480CB1A0711
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 13:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722520083; cv=none; b=QsZe6KCkdR/YcNemko+YNhCG3YUVYjizi46dlUTg8mLcTII3/gH51wqojiGsKK0tocgcPp10iiDeGUzfE300L1SF6l7F+Dq3nTiTTZLidtpjXLynELDZIqHVH+l/y/NrltCPWCvkSpOI2EBrFAH7TfkJhsZitwnsIdwotjfiehI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722520083; c=relaxed/simple;
	bh=I8mLr35avLJdYa5i7pz/GhJwCL/IL9MLbct5aeIbHD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSzn/xhNgOguin2gx4ZSnE0ji26x9n6panuDVs6teSHDx5HoVBJ8QtpHKvi8fmKBdNEXA3wDymAJnzuLtuJm5CrmRIXjWa58R6jPa6Pf56S6Wc1pHU86LcTSymfelcCsNWmEqfFG5BbliHbQ7w6+sSOXvgGDbsy4bBHTRjReK+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pjFJSW3C; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pjFJSW3C"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-427b1d4da32so12639865e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 06:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722520080; x=1723124880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ce/grfeGfBpe3OOUAK5aLiv0sObRbOqHlQfr8NziK34=;
        b=pjFJSW3CoNSd9tC1yFgxg94t9xvBgMM/7PRs176m9Ya67NqnNNNJ12B3gccpql3quc
         wldVNUIlfL5HJA5x7zGYCGV426dFGlltSoJYNnUa1CN5nfhuOJ4elElxWcS5FznlVso7
         /AwGubqe0jJG64KVS4GtpRldCHXMb1d94WC3drP1mghpiPVgehv+QlLnx6a4/slpK+/6
         Vr4NJK/12ENPcZcGM8ULoVIYk71khUkGcdVKs/Ke8sywp/PHYelcldguXqs2J362CJtg
         wuTsH7hFr00Ut7RsYOzVx5t5N5Sc21/EAxvGvLhdpjpwgU5lCezQXjRIMzfVGjUP9QZl
         m2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722520080; x=1723124880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ce/grfeGfBpe3OOUAK5aLiv0sObRbOqHlQfr8NziK34=;
        b=hIoanExbn5/r16OAHv//AjfUwKUSRGDejerO/w5Wt76v8UGocr0UBzQ2MkZZlmzt+x
         Jcy0lgxTLMo66PPPYr0pN9X5GcXCzPcPNS7KHojSLGczmOKZhaTz28qC3CiO8n7x2V5u
         SOI7+L1uSjowTNRVpKnE3f4k1GU91U0xmsMV4AY1GyW7wXKlMaejkGp/Cch7bWI7MKdw
         8I+a2WgX2qymIOjdYs2tsKaEwC9kOYxH926xv7VYUCB/Te/lwP93/y66Ntaocpf0yQRM
         atujMDx7y/lMIL8GJahpBsK8UvXMcOlY+Csn9bWi7AS42dCVFBXCrX5gFLxCCkB/iRIa
         oBVA==
X-Forwarded-Encrypted: i=1; AJvYcCVguqEwI2T83+WQcgPfHYb7zKgAWK5CnNcoRZom/8e5fZDjUVQv17iNPcRYXSgt3wb+UXjyD3jdCt7FOgj7lCMLVVElBO9kp7kmaNOyq4g=
X-Gm-Message-State: AOJu0Yx6Dk6VwWhu4qKL8IQKmCNNS/rEmUMfvMBmEPfwyTOqPxfw35aS
	BxykH/YQ7wvwECQBgSgSt1yNCn8FfI4vILukwBFwn9oXRd1lLiGuOWGF6pCW36sMKvN/QZrmjZT
	DP/Xg4A7X5fi+x0kIuhbFSOMCG3e6DrWT/SMX
X-Google-Smtp-Source: AGHT+IHDP/ePi7mwq3gsT2tRGQmEKN5QbhPrzmJecK/Cc8Qaxs/dRzG4EdOI5gGc0kmcCKTLxYrUcTJ33iDzFlxzDKk=
X-Received: by 2002:a05:600c:138e:b0:424:71f7:77f2 with SMTP id
 5b1f17b1804b1-428e47a0825mr16187465e9.16.1722520080274; Thu, 01 Aug 2024
 06:48:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723-linked-list-v3-0-89db92c7dbf4@google.com>
 <20240723-linked-list-v3-4-89db92c7dbf4@google.com> <1b2078d8-d93b-4626-a73f-edc5616a2357@proton.me>
 <CAH5fLggKphE3f=Jv+pfXc+_qjsGBVpXw_F4fOJiAi6vNtJ5x+Q@mail.gmail.com>
 <5b13793c-3ec8-40c2-b0c6-e7b10883d0cb@proton.me> <CAH5fLgjntr81+OFxzVqvb+zL4RqHCap9LZnNxNvN_gzF8AKrRg@mail.gmail.com>
 <ea3ef06b-8c4c-4883-867f-b68f2eb589af@proton.me>
In-Reply-To: <ea3ef06b-8c4c-4883-867f-b68f2eb589af@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 15:47:47 +0200
Message-ID: <CAH5fLgg-q6VEsGd7p16ZEkWj6HoydFJKB-jYN6ZT=8sT6FNE7A@mail.gmail.com>
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

On Thu, Aug 1, 2024 at 3:46=E2=80=AFPM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> On 01.08.24 14:51, Alice Ryhl wrote:
> > On Thu, Aug 1, 2024 at 12:45=E2=80=AFPM Benno Lossin <benno.lossin@prot=
on.me> wrote:
> >>
> >> On 01.08.24 11:42, Alice Ryhl wrote:
> >>> On Wed, Jul 31, 2024 at 8:41=E2=80=AFPM Benno Lossin <benno.lossin@pr=
oton.me> wrote:
> >>>>
> >>>> On 23.07.24 10:22, Alice Ryhl wrote:
> >>>>> +/// The prev/next pointers for an item in a linked list.
> >>>>> +///
> >>>>> +/// # Invariants
> >>>>> +///
> >>>>> +/// The fields are null if and only if this item is not in a list.
> >>>>> +#[repr(transparent)]
> >>>>> +pub struct ListLinks<const ID: u64 =3D 0> {
> >>>>> +    #[allow(dead_code)]
> >>>>> +    inner: Opaque<ListLinksFields>,
> >>>>
> >>>> Do you really need `Opaque`? Or would `UnsafeCell` be enough? (If it=
 is
> >>>> enough and you change this, be aware that `Opaque` is `!Unpin`, so i=
f
> >>>> you intend for `ListLinks` to also be `!Unpin`, then you need a
> >>>> `PhantomPinned`)
> >>>
> >>> I need the `!Unpin` part for aliasing.
> >>
> >> Oh good point, do you mind adding a comment for that?
> >>
> >>>>> +}
> >>>>> +
> >>>>> +// SAFETY: The next/prev fields of a ListLinks can be moved across=
 thread boundaries.
> >>>>
> >>>> Why? This is not a justification.
> >>>
> >>> What would you say?
> >>
> >> While trying to come up with a safety comment I thought about the
> >> following: this impl does not depend on the type that is behind the
> >> pointer (ie the type containing the `ListLinks`). Thus this `ListLinks=
`
> >> will always implement `Send` even if the pointed-to value does not.
> >> What we could do (and what definitely would be correct) is this:
> >> `List` can only be used with `Send` types, then we could implement
> >> `Send` for `ListLinks`. But I haven't actually come up with a problem,
> >> so there might a more permissive solution.
> >> Do you have a use-case where you need `!Send` types in a list?
> >>
> >> Here is a part of my reasoning: If the pointed-to value is `!Send`, th=
en
> >> the `List` item type must also be `!Send`. Thus all list operations ta=
ke
> >> place on the same thread (since the `List` will be `!Send`). Therefore
> >> nobody can access the `prev`/`next` pointers from another thread.
> >>
> >> But this does not justify that `ListLinks` can be made `Send`. (althou=
gh
> >> there isn't actually a problem)
>
> I think I confused myself. The paragraph above actually explains why we
> are allowed to make `ListLinks: Send`. What do you think of the
> following comment:
>
> // SAFETY: The only way to access/modify the pointers inside of `ListLink=
s<ID>` is via holding the
> // associated `ListArc<T, ID>`. Since that type correctly implements `Sen=
d`, it is impossible to
> // move this an instance of this type to a different thread if the pointe=
es are `!Send`.

I will use that, thanks.

Alice
