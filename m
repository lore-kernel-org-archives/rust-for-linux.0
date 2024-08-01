Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA65A15252D
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 09:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722505146; cv=none; b=JP3i0j7M3NUbjzcMmZteYI3WEItM5x1IHolTM6wpapUX8MMrYAmU/WY4WvfsXdeBmsnBvfHnzIMjHKVMPGpb2MMuc+9R7zi2rOq5I+urbmqayKH6J+uETCfPi9tYa1lqvrKLZ4HCRKHnIGuMRo1tFhrbYK1y1dq0xU8v8ue4HPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722505146; c=relaxed/simple;
	bh=oApA0qznxaHEE4A8R8hgJNhN2ArNXKYa4oVQONhFyNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FUHy0QPzWpB/mvXymTCp9XTbhLdWYhWZWDlOJ/xD8jt+yti05g8evfeDvEYo4hxpxcaReIVEM8gckSjLN3lb3mbvl6uOZdPradmtKJ7/ap4G4rNkHFLognZU/bYzcTXXTTA2iY/t4QPbOLKSpSUYVhJrYXGnpnK6WA2Zy5/NyXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DM2yAlNF; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DM2yAlNF"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-36844375001so3058465f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 02:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722505143; x=1723109943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQdGA7GJE2VgdG2QsBIACC0GGavEy5/6TiWZnrghIfE=;
        b=DM2yAlNFOH3v32S8roDbhB1p2pIU7YJOAem6WmYFZWHbT/trYdRbAAlieV8FKu4ayH
         qK/5kHmhGQRs48PGh2WIjyU5w8ml8AkTzrtmuhgnk+QHpU28SYAzQU56aWyzCjrKz2d1
         QpeaPH51g8CWhYC8CnvU3WCdRnsTDNd3Q+ASuNBEnE+fBXqURUau4RO/bGd4g1YvHdvw
         3OXjdmQh9+JrG5Cz3K1swActaHjA2TV3m4F9RdpsaEwGbpeelIfsPsZ0gIEmG/Oh81qM
         hERu4eJNO4hc/odsmUv8c5+n1HEc2V05+AZE1ZOM2aiL0MClqLyhrVjh3J4h0zTaYVh/
         nMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722505143; x=1723109943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQdGA7GJE2VgdG2QsBIACC0GGavEy5/6TiWZnrghIfE=;
        b=R49cIQ6y0gMlP/ycUuYEuwPkThUMJfO0ureVvrRpp6z4sdgsWU19gWNCTzntTukljt
         1W2MyInMs9IBx7GTQnWYHzTLVU6oZyOFHLiMa7N/gxYKmGSlANmZhtydE9WseZx03Yj4
         ZQUsmkEWwp3uQ2VX6rdYULsrBJhRgnu4wFq373lYWBGOO8kWrVsccSoHjkwwlaUAB2Br
         6ixpGPqcG7RV4KuRSmCunb8Fj0Lw8v2xvPRfEVQMZk0aNOQup6LkZt3QYDHzyyvFILJ9
         cOfgNoPjOcvWh9rOURatEXMjkY0Lhd4uZwbO4psPKCwcF2sd919xwkigzFlwxHW1aWgo
         onEA==
X-Forwarded-Encrypted: i=1; AJvYcCVIO9UHuvXoi8PcHF6n9YxPUFlCXZGowwGu2xx8GIdnECkAARQo2fnyTFuE0GLwXue/RlXrvvyAp9PSCgErs2PIkK7vLg4edpEsnuqLmVA=
X-Gm-Message-State: AOJu0YzmujStTOet0KAe0J19erkeVDLpKklZu6IJKCvm8N9XEnQV9nvi
	p7vZRslZbRnUIEueKoyG1MqJD13sX3TIM25Gzw0HkS0ngF1Sg67mW8R/SrZfko2+2hvcrzi0YV9
	LsHNEZTAH8yn07VWfDSkSd0ddsj5bQ1+6UXg0
X-Google-Smtp-Source: AGHT+IHNeIRKHEDLTaSlMEckCTl/havP+o8WgKH8eXCZheQ+hbQIUOGOrwY0qf/8SqbtvZCCyhr7GP8Uz0b/v6290so=
X-Received: by 2002:a05:6000:910:b0:368:48b1:803 with SMTP id
 ffacd0b85a97d-36baacbda56mr1204853f8f.12.1722505142506; Thu, 01 Aug 2024
 02:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723-linked-list-v3-0-89db92c7dbf4@google.com>
 <20240723-linked-list-v3-9-89db92c7dbf4@google.com> <2b548226-e323-466d-9f6d-762f6cbb5474@proton.me>
In-Reply-To: <2b548226-e323-466d-9f6d-762f6cbb5474@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 11:38:50 +0200
Message-ID: <CAH5fLghkPgj560a2b_1oRnvuurEugT4TNj+o-fYhGsuSGpywPg@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] rust: list: support heterogeneous lists
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

On Thu, Aug 1, 2024 at 11:24=E2=80=AFAM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 23.07.24 10:22, Alice Ryhl wrote:
> > @@ -181,6 +185,47 @@ unsafe fn from_fields(me: *mut ListLinksFields) ->=
 *mut Self {
> >      }
> >  }
> >
> > +/// Similar to [`ListLinks`], but also contains a pointer to the full =
value.
> > +///
> > +/// This type can be used instead of [`ListLinks`] to support lists wi=
th trait objects.
> > +#[repr(C)]
> > +pub struct ListLinksSelfPtr<T: ?Sized, const ID: u64 =3D 0> {
> > +    /// The `ListLinks` field inside this value.
> > +    ///
> > +    /// This is public so that it can be used with `impl_has_list_link=
s!`.
> > +    pub inner: ListLinks<ID>,
> > +    self_ptr: UnsafeCell<MaybeUninit<*const T>>,
>
> Why do you need `MaybeUninit`?

Right now the constructor initializes it to MaybeUninit::zeroed().
What would you initialize it to without MaybeUninit? Remember that the
vtable pointer in a fat pointer has strict validity requirements.

> > +}
> > +
> > +// SAFETY: The fields of a ListLinksSelfPtr can be moved across thread=
 boundaries.
> > +unsafe impl<T: ?Sized + Send, const ID: u64> Send for ListLinksSelfPtr=
<T, ID> {}
> > +// SAFETY: The type is opaque so immutable references to a ListLinksSe=
lfPtr are useless. Therefore,
> > +// it's okay to have immutable access to a ListLinks from several thre=
ads at once.
> > +//
> > +// Note that `inner` being a public field does not prevent this type f=
rom being opaque, since
> > +// `inner` is a opaque type.
> > +unsafe impl<T: ?Sized + Sync, const ID: u64> Sync for ListLinksSelfPtr=
<T, ID> {}
>
> [...]
>
> > @@ -135,5 +178,91 @@ unsafe fn post_remove(me: *mut $crate::list::ListL=
inks<$num>) -> *const Self {
> >              }
> >          }
> >      };
> > +
> > +    (
> > +        impl$({$($generics:tt)*})? ListItem<$num:tt> for $t:ty {
> > +            using ListLinksSelfPtr;
> > +        } $($rest:tt)*
> > +    ) =3D> {
> > +        // SAFETY: See GUARANTEES comment on each method.
> > +        unsafe impl$(<$($generics)*>)? $crate::list::ListItem<$num> fo=
r $t {
> > +            // GUARANTEES:
> > +            // This implementation of `ListItem` will not give out exc=
lusive access to the same
> > +            // `ListLinks` several times because calls to `prepare_to_=
insert` and `post_remove`
> > +            // must alternate and exclusive access is given up when `p=
ost_remove` is called.
> > +            //
> > +            // Other invocations of `impl_list_item!` also cannot give=
 out exclusive access to the
> > +            // same `ListLinks` because you can only implement `ListIt=
em` once for each value of
> > +            // `ID`, and the `ListLinks` fields only work with the spe=
cified `ID`.
> > +            unsafe fn prepare_to_insert(me: *const Self) -> *mut $crat=
e::list::ListLinks<$num> {
> > +                // SAFETY: The caller promises that `me` points at a v=
alid value of type `Self`.
> > +                let links_field =3D unsafe { <Self as $crate::list::Li=
stItem<$num>>::view_links(me) };
> > +
> > +                let spoff =3D $crate::list::ListLinksSelfPtr::<Self, $=
num>::LIST_LINKS_SELF_PTR_OFFSET;
> > +                // SAFETY: The constant is equal to `offset_of!(ListLi=
nksSelfPtr, self_ptr)`, so
> > +                // the pointer stays in bounds of the allocation.
> > +                let self_ptr =3D unsafe { (links_field as *const u8).a=
dd(spoff) }
> > +                    as *const ::core::cell::UnsafeCell<*const Self>;
>
> A bit confused why you need to do it this way, can't you just do this?:
>
>     let links_self_field =3D links_field.cast::<$crate::list::ListLinksSe=
lfPtr>();
>     // SAFETY: ...
>     let self_ptr =3D unsafe { ::core::ptr::addr_of_mut!((*links_self_fiel=
d).self_ptr) };

If nothing else, the field is not public. I can't remember if there
was another reason.

Alice
