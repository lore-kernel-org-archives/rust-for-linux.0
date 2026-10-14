Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27109440A3D
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 07:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962456; cv=pass; b=d1W9z9mG6WnnyRZAZ0/eqpt/ufdhxDsjfniBh2WEEOu+h72MlXu6sJSHvAQvlqHUL0FeLjYbrBxy6r2z+XCB9jPzKgkO27yn5nz3BvkdbjsXfnVqwk6cJ/E57T9jEWBKYbdQOkf+ujfNVdzTYKsqHZoJEGR7bOIBN4ckHO0DB94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962456; c=relaxed/simple;
	bh=ZSFyhZX8e3oYp0Y9peUXElWgxKBbVXnXhuO2gHmZ6uY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qw9sN7iJN9feRQWUC+eB1B8EFAil3FgCJ+nshKv8tAzuzwz8sN4IBNdWqLdMDg4WBpTpCv3eCOcXeg7LcKKx/pxTg1wQBEjVndORqrkvp9l79Yp7Gxiu+GvU0Xykk9v9KmEwdFw4/ujGfWcL2e6TnoeIRVUnwm64lCyazz05ybY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuRs2VJv; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuRs2VJv"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-353804b591eso6670002eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 00:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791962454; cv=none;
        d=google.com; s=arc-20260327;
        b=mHNr46yBHmymTujSz3bTp1tCbnPSjxrrrqFnnIzwxDnh4gUl4AM5en9BjE7Tk0IKqQ
         3quNjyXFM/XUMdFZwO7p3BzqVxO/yOOyPmXQ0qnX5hUicM7I6u33zT2GNSffr7HN1k8L
         80GubzliJa0m6+9pxtWehoNViR1e4zyRn7FwS0IY2TIEzaz6AG6Yvw0KN7M3a6nosdxH
         2RhY/eLYZaZ6TU6k5ZRvvWBXMb3ilUxUSTbRrhzxIlBFJjdvGPqAxxKoO5QfuCJbtdOw
         xM7DBZuKwwdSrVuPiNaRMJbC/BmKIDIc2CsX+/PuLZS791oOlYmgodi0vPkQsqdXXwGh
         v3wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lOqIiE4c6ssXVSy50LPJhAKLmMDJn1HolGWfMJ3me+U=;
        fh=D6fsxJcCf6/V53JibxvM30as9Bg3a0m0S2I73hUM+sY=;
        b=KDl7bYqULVawqDWvNjqtOdhU+8ozyqShsGeL/SJrL2izQ8pB0v5LhV5VUPghftJHX8
         KFhKUQj1D4Ih3D2ZimgyRR3x0sUg5CCVwNAHOV5NEo4uMhBLUdIfE4aOzM5bT0oQ01aw
         S0ylqJ5+ssP3vyphGfmGGHJxdWocQQtfkxQEezihj1WycODuGaB6MniaQxVfTM2SpE/c
         1yXgFLNljUMb1ZPBSgTDLKkKQB/TkjlOzORoP7rq8NHrjwkSvanxMdbzZOidr7eYkMPZ
         aC3WtIm+I3scVUofOHw8oB0bprMipkriO+4W4tG16tsRROQnQJko+qjI/fgh10BYEaD2
         h4Zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962454; x=1792567254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lOqIiE4c6ssXVSy50LPJhAKLmMDJn1HolGWfMJ3me+U=;
        b=RuRs2VJvZxLANh/ORmvB/5NxzkYwHUWHmnaWpJt1gQkIuO9qnGIpwSDcPMknCFYiyo
         RTBFlVT8cCsT5Vt8ZFKVs7qNQJ+D82q9dyAybLjQxUA0d+kU4SpZgV16px+2Lu26Lj++
         AZ2KI+ojrUrzppln35OCEgoiA04nyt9yqhWrvyM4LHRsRkREOG3v+VfZtu7nbDk6DEPo
         iyEkszwNBSv0pGqjjfI0nQBexXLVweQuD7MdMpKWz8/I8zLzCwlLtL/NWl0Wa0x1zG97
         gINvICN32xCsiZqJBdTddmD4NmmkW1HaJquvyWEHLbOtIKD3FaR5hZxO/8yvpVOkCzRo
         eFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962454; x=1792567254;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lOqIiE4c6ssXVSy50LPJhAKLmMDJn1HolGWfMJ3me+U=;
        b=hOsBTpszv2VlSTFMX+pm0n5feFvZTTiu35FexUZbysppI5xsiBe3rHGwtBU9ti6HMq
         noW/5obXPELDqE7t/0u5E1hYWSdZNercVQ40shsl1LHI6fUF3YWAX6/XfRvmNqj67Vv/
         5IE+tyTamgMqcLHg+NhusQ48xcSbs01sq24TjyRC668KP12K/lSu2Tkskr26f6iIjTIL
         VX2AzuBJHkD8lM8vBTf/vgjAFWryVtI3Fu/E6kBS3E62cV7o6IZ16lucpQnEnjGV+/IZ
         eJ5bei4TCG2FZRPPO4hYAuWvDnRxaqlY4AKc/K4t5TQOF94uDmmUvJZKVMAUsV644/fv
         9dDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwm1+e5o+aNKN+UvRyntYemqygEzc8996MVPZ1sLV2FzycSc3NbsxRLb4wPGc71rjxwUwzRQMgvq02SREAGKQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKp8zHfYZ8dcT7P7H7tIAMOcxihsMqPGi12q3ql/r4m5rToqFGV
	I/1j8uyPTk6U1K6Dcf7Cx8cVb34OZysrIpj8QeUSZW88ICBPBQl7trsKW/GRYP/WrGg0Q849qYs
	6/MahHnG8qZ+TqUHkP0jWsjiFC3Zg9zM=
X-Gm-Gg: AYBFou2EthT9L8/glGSiDIKd3SAvPlEpt5C+YaXCCXpwuDTuERv9FxaXgrjRIdvNFDw
	AqNs4yIpBJQIkt33BvB6tik+MEnn3OY/1Uv1f4L3sigaxckKvk8PBu7EExh9yg/6awoILT/9AwP
	Iam1aaDRjwC05KdXCVjp3U0H3ryJsohOkUTkDf0702Hnx4g417SHdg5Luc+/6sdBnj4objHEvRo
	Kqaa9uUrcTeFF3ZNFOi1fHbf3w5vSDpg+lqEOmhVWXaBeWMrDyNgRW85Jp01pj2rcPbceRYYNog
	4M6OmEgP5LMSzSvCqmYucK4bVJbn3/N02BfOESDND9tKG7H312BKjoXTw+AufgA0k6LFGTuufez
	qllKn4U9UcbK5dk1BrKQEAK5jF+XacoX11+3/mtqqJ09IMKcOoXW7D6DZlPW8NWZeT1pVsHxEgr
	3r6/gWFO1uokvVZbqq/7LBog==
X-Received: by 2002:a05:7300:7f21:b0:34e:f5f1:2f46 with SMTP id
 5a478bee46e88-3537e03ef03mr21519176eec.6.1791962454025; Wed, 14 Oct 2026
 00:20:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-chid-v9-0-0d6cca376cff@nvidia.com> <20260930-chid-v9-8-0d6cca376cff@nvidia.com>
 <aryYkkB9j14xnWo3@yury> <DLTA93JE6VF2.37UGB3SWU6ID6@nvidia.com>
 <ase7IBtZjQsPVWSN@yury> <DM0D75ZTTQXJ.2XADVI38UGH7C@nvidia.com>
 <CABwQupMVzUOsqP_fTZQdwUU+xEO1k2Q4=RQQuq2qd5HCYY0ZUg@mail.gmail.com> <DM46Y905AJVV.1K0F8AK1ZP4IO@nvidia.com>
In-Reply-To: <DM46Y905AJVV.1K0F8AK1ZP4IO@nvidia.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Wed, 14 Oct 2026 09:20:41 +0200
X-Gm-Features: AclHuK9j0P8UdZSidrrjx2Ojz1IkBJh5CagOtrg90NI1i0FixMsvpGr1DSVhkR4
Message-ID: <CABwQupOYBBev5WkQry3oOoX5tGCs-ggDE4L_nK8BBYvrO=81bA@mail.gmail.com>
Subject: Re: [PATCH v9 8/9] rust: id_pool: do not round capacity up to BitmapVec::MAX_INLINE_LEN
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Alexandre!

On Wed, Oct 14, 2026 at 4:04=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Hi Burak,
>
> On Sat Oct 10, 2026 at 3:48 AM JST, Burak Emir wrote:
> > On Fri, Oct 9, 2026 at 4:07=E2=80=AFPM Alexandre Courbot <acourbot@nvid=
ia.com> wrote:
> >>
> >> On Fri Oct 9, 2026 at 12:47 AM JST, Yury Norov wrote:
> >
> >> > If you still think that you need 0-length bitmaps in Rust, can you p=
lease
> >> > give the clear and thorough explanation why rust needs those 0-lengt=
h
> >> > bitmaps. Are there any in-kernel examples? Any language concepts req=
uiring
> >> > it? If not, it's still a NAK.
> >>
> >> I don't know of an in-kernel example, but please look at the
> >> `bitmap_vec_new` test which has been here since the API was initially
> >> merged last year: the first thing it does is create a zero-sized bitma=
p.
> >
> > Well, yeah: I wanted the behavior that the implementation rounds up
> > documented so it can be recognized as intentional.
> > Later, the `new_inline` method was added, which is a clearer way to
> > get the largest non-allocating BitmapVec.
> >
> > I think the problem in this discussion is that we want to treat
> > capacity like length, which is maybe suggested by the BitmapVec name
> > and its len method.
> >
> > With the minimum capacity behavior documented, it is as if we have a
> > specification right now that no IdPool instances can ever have less
> > capacity than BitmapVec::MAX_INLINE_LEN bits. This patch here proposes
> > to change that.
> >
> > It is not clear though why client code would be happy about *less capac=
ity*?
> >
> > In other words, why should the client of the IdPool have the right to
> > control the *exact* initial capacity, even if it is below documented,
> > free-of-charge minimum capacity?
>
> The ID pool is used in Nova to track the number of hardware channels, of
> which we have an exact, fixed number. For this use-case rounding up is
> not "free-of-charge", it just allows to allocate IDs that are invalid as
> there is no hardware resource to back them up.

This makes sense, and I'm glad you can reuse the code.
The origin of the bitmap IdPool to isolate the Binder-specific
spin-lock-compatible resizing functionality.
In the Binder use cases, an "allocated ID" corresponds to a bit that
is set to 1.

> >
> > The IdPool, despite being backed by a BitmapVec, is not meant to be
> > used like a vector: it does not grow by itself but client code calls
> > grow and shrink explicitly, and client code has no control over how
> > much that growing and shrinking happens.
> >
> > Like, you cannot grow to 65 and expect to get a capacity 65. So why
> > insist on exact small sizes?
>
> Actually with the current code you can call `IdPool::with_capacity(65)`
> and you will get exactly 65 IDs. And if you call grow the new capacity
> will be `65 * 2`.

Touche, I was too anchored in my "IdPool is just for resizing" thinking.
I meant, when starting from a no-allocation size that one only gets
multiples of word length.

However, I do understand that you would like IdPool to track for sizes
below 64, so ChannelIdPool does not have to.

> The point being that in the current code the initial capacity is exact
> for every value *except* those below `MAX_INLINE_LEN`, which doesn't
> come across as consistent. All this patch does is remove that exception
> for which I don't see a justification.
> I think we are conflating capacity with length to some degree. Actually
> the code does exactly that:
>
>   impl IdPool {
>       pub fn capacity(&self) -> usize {
>           self.map.len()
>       }
>   }
>

Yes, the original IdPool is "conflated by design", since for Binder ID
allocation means something different.
- "length" for BitmapVec is length of the underlying bitmap in bits.
- "capacity" in (binder-specific...) IdPool means "we can allocate
this many IDs in total without resizing.

> >
> >> It is also easy to imagine a user starting with an empty pool and
> >> growing it on-demand. Having the ability to create a zero-sized pool i=
s
> >> convenient to avoid special-casing user code, and in this case I'd say
> >> expected, just like you can create a zero-sized vector. Again a size o=
f
> >> zero does not trigger anything that a larger capacity cannot trigger, =
so
> >> I don't see a reason to forbid it.
> >
> > With an initial capacity of minimum MAX_INLINE_LEN capacity, it is not
> > about forbidding, it is that the added capacity already comes for
> > free.
> > You could say "not enabling" instead of "forbidding", but pretending
> > that the capacity is somehow not there does not seem to buy us
> > anything.
>
> The capacity is not necessarily there when allocating IDs for finite
> resources. I suspect that's where the misunderstanding stems from, as
> Nova is using the ID pool for a new use-case. But I think we can agree
> that this use-case is not particularly specific and matches what one can
> expect from an ID allocator, so it makes sense to support it, especially
> as it doesn't affect other users (`with_capacity` has no caller in the
> tree at the moment).

It makes complete sense to support it.
IMO it is less of a misunderstanding, but a design decision to juggle
the requirements.
This IdPool thing was not meant as a general-purpose ID allocator.
But I do see the appeal to generality.

> >
> > Do the other patches in this series need this, or can we just drop this=
 patch?
> > If they do, maybe a demonstration of how significant the special-case
> > handling is that can be avoided with the exact small capacity could be
> > part of the commit message?
>
> The next patch in this series needs this to implement `ChannelIdPool`.
> The alternative would be to track the actual length of the pool and
> return an error if `IdPool` returns an ID after that value, which is
> what v5 [1] was doing (see `num_chids` in the v5 code).
>
> That's the special-case handling that this patch is designed to avoid,
> and I hope we can agree that it isn't a satisfying workaround,
> especially when the backing `BitmapVec` *does* support exact sizes and
> that artificial limitation is introduced by `IdPool` itself.
>
> [1] https://lore.kernel.org/all/20260812-chid-v5-5-6c767770b3f4@nvidia.co=
m/

Thanks for the link.
To me, having IdPool support exact size seems nice-to-have.

We are changing the design in light of different requirements, it is a
defensible but not critical generalization.
I was worried that we may need to have proper separate length and
capacity fields (which contradicts the binder use case), but that is
not the case.

I checked the grow_request and grow dance now, it seems that even with
exact small sizes we avoid allocating a bitmap.
So I am not opposed. Like Yury, I find the 0 case slightly odd, but
unlike Yury, I find that tolerable.

The phrasing as "dropping an artificial limitation" does not
adequately reflect that IdPool was done for a specific use case where
the design made sense and is not actually a limitation.

I wanted to highlight this perspective, because notwithstanding the
name, IdPool was not meant to join the set of kernel's dedicated
supported ID allocation mechanisms.

cheers,
Burak
