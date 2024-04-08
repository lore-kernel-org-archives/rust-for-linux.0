Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76893838A
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Apr 2024 08:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712563223; cv=none; b=vCv0r+N7veuvka+7LJjyjVy+ERuWi+MffBgmTsHiN/i9Ua7+Pa292mRES5s6h8LWlt3UrP/BuZwe01L4RgAAW4/6Bg3XOcZONOygkSboCz6qI1YO6MzUGiU2nwm7S+dwfDKC303xxA7/NRr5ovEdonx3V9Uaou037wW0CrwGIb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712563223; c=relaxed/simple;
	bh=pHxB3riv3KUMXEfOU50W6lVzqahm4AeiTdlYhjEfnVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPpZoO6ML0NtivH+zenlcbnpiwTW6Xqo5rahlZoWmCC9lLcpdMq8mGDxpHBKvutfyB3Z0VFpD2/DIS6gMq7UAj9heS4pQnLtxbubleNnvYZEwtSNgCtjy6QPcuS7PtbI0DAsHyNgW6QqB27B25Uj+TO0b54xaOQ4NuzssVP4FT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0oh3UYbB; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0oh3UYbB"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-7e6756ec17bso473452241.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Apr 2024 01:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712563221; x=1713168021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FOsPTWHaEE82X2na8AskRgQpO9sFazpZ1ejud61f9w=;
        b=0oh3UYbBE/TVgrUyytsY8fcFo6RmLL6xpYjrBXmwBvK7XpZ47onGS/HInhxpSKP/09
         PrtZysaJPIApVNQkDhuNyOJgaMnYNgvZGstPTXEJzU0XyE4wHr7jVMNQu7eiiEd2ACEA
         FdOZ4QIaE9jit489wRDh9jMV9YTLorC0VaVaF5pzgM1TGErqiM3yqEMk7qJMMhgfq3KO
         0ij6vPVsQv5okTSxhuaV2s2HXgqMgmrc4oI2t+jnTaDMKXPEAz6jHLbTRx2iLwotBrvL
         IstA9vqbV3sGreYz7tr3miaMvZ3NTBb24Yn1YI3kth9fVFxjbcZWwnV5lHNW5PZ/vKFt
         lRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712563221; x=1713168021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FOsPTWHaEE82X2na8AskRgQpO9sFazpZ1ejud61f9w=;
        b=hQsTYRBLdGAA/Vez0C4T00O7qyQzHoPabpEqfDs2AAW5S3Whz5Y6xs5Y2haD7L67X6
         yC9YcG0oddz6DqajhZdgKVHXcHUht/26uPoE7xIJkxYt1UILx8bhvFaQqAWAaXsVuXlq
         rgLN8BGE6dv+nx+kaalPOXGzhN/cZX8+reBA/TR1HptRsom3BF6NBVeygCmYKcYCPfLC
         B+ydh3xxz5g+VMAVCZ6wS6PpZpIggWNF9RRoIBNxSClXr12oI/LfT59ghMpytgPYh5Pq
         QgGFsBkmy3DLi5b/1zJjBjr6cRa8ubVm+xgwM2KuH6oWPqDFaz0KCt2NPilwgi2nPj4y
         zd3g==
X-Forwarded-Encrypted: i=1; AJvYcCUwpDmVbxJCb2gHWv9vlgLpLRUlerWNEyzWoFUmADa6Epo0mzH3iKttH+q/AlXwwXg0z0NkhYLPuXKMrphR4WPT0g7PKO8fKA20b+9A6gI=
X-Gm-Message-State: AOJu0Yxiz3ir1zv3Skj/MLSCqvWoOTVtriOuophlyoLNJnYVvlYGTrSa
	gcvD8R8bzyCtIdELrQoxyMToDTy/wYnuIiJAmrnEzr1quNAk0c9P7NApXiXGdvnV1sguyk5kDcZ
	ZfZDjX/ht/i9m+8VvqhM951PmFQ4KYgZcE7qz
X-Google-Smtp-Source: AGHT+IF9f5jmOEJWTkd9kdJrUZmHW+LueigVkR1pev1XTzP7AugYDbMFKGqlkAiec8GAn8o+OvC6BVcvOD7CUKwA3Og=
X-Received: by 2002:a05:6102:c54:b0:47a:72f:981a with SMTP id
 y20-20020a0561020c5400b0047a072f981amr1007451vss.26.1712563220314; Mon, 08
 Apr 2024 01:00:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402-linked-list-v1-0-b1c59ba7ae3b@google.com>
 <20240402-linked-list-v1-6-b1c59ba7ae3b@google.com> <98449574-4c1b-4281-bbd3-3ac2767020cb@proton.me>
 <CAH5fLggS3qtCy20Y=kuxULUY9Q_4dSzJN5n2WitU362cYuqPLA@mail.gmail.com> <4045af19-05a4-48f0-9ca1-0d8d4d2b865c@proton.me>
In-Reply-To: <4045af19-05a4-48f0-9ca1-0d8d4d2b865c@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 8 Apr 2024 10:00:09 +0200
Message-ID: <CAH5fLgiYfU91QqCs+9L=9y76PKAYiDVva3WNoQE=Ja1ASzua7A@mail.gmail.com>
Subject: Re: [PATCH 6/9] rust: list: add iterators
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Marco Elver <elver@google.com>, 
	Kees Cook <keescook@chromium.org>, Coly Li <colyli@suse.de>, Paolo Abeni <pabeni@redhat.com>, 
	Pierre Gondois <pierre.gondois@arm.com>, Ingo Molnar <mingo@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Wei Yang <richard.weiyang@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 4:52=E2=80=AFPM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> On 04.04.24 16:41, Alice Ryhl wrote:
> > On Thu, Apr 4, 2024 at 4:36=E2=80=AFPM Benno Lossin <benno.lossin@proto=
n.me> wrote:
> >>
> >> On 02.04.24 14:17, Alice Ryhl wrote:
> >>> +/// the end of the list. The `stop` pointer points at the first valu=
e in the same list, or it is
> >>> +/// null if the list is empty.
> >>> +#[derive(Clone)]
> >>> +pub struct Iter<'a, T: ?Sized + ListItem<ID>, const ID: u64 =3D 0> {
> >>> +    current: *mut ListLinksFields,
> >>> +    stop: *mut ListLinksFields,
> >>> +    _ty: PhantomData<&'a ListArc<T, ID>>,
> >>> +}
> >>> +
> >>> +impl<'a, T: ?Sized + ListItem<ID>, const ID: u64> Iterator for Iter<=
'a, T, ID> {
> >>> +    type Item =3D ArcBorrow<'a, T>;
> >>> +
> >>> +    fn next(&mut self) -> Option<ArcBorrow<'a, T>> {
> >>> +        if self.current.is_null() {
> >>> +            return None;
> >>> +        }
> >>> +
> >>> +        let current =3D self.current;
> >>> +
> >>> +        // SAFETY: We just checked that `current` is not null, so it=
 is in a list, and hence not
> >>> +        // dangling. There's no race because the iterator holds an i=
mmutable borrow to the list.
> >>
> >> This (that the iterator holds an immutable borrow) is not true (there
> >> is no `&List` field in `Iter`), but you can make that an invariant
> >> instead.
> >
> > What I mean is that the borrow-checker will consider the `List` to be
> > borrowed by `Iter`. Whether or not there is a real reference or not
> > doesn't matter.
>
> Yes, but that is implementation detail of the safe function
> `List::iter`, so I think it must also be captured by an invariant.

I will add an invariant.
