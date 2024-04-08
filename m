Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE562C695
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Apr 2024 07:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712563192; cv=none; b=Ics0/fbJ9K0qx0gfjR2zClYFrR+X1Ce/1t7OHkBThNhzVg3bWBclW52uy4svJk4DyM9o/wLjPYLBT6DoL3aNVDvFPd21ouSauLjpxTz1TlYsZVesPG274llTLP37GAaRPP+bnLvHcuOjiNIjv2yLNftJ8WPN6yvGySyNY6/4UDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712563192; c=relaxed/simple;
	bh=gfPu8CWZl3E7Z4ROJvqIJZLka/gChnqmeOgsGF6qUas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcxpfIONTgWZfeZ+HS6WKBLQ1NwH3LZ2TIVZh+br7VuKjSxjZol2mC/ViZjoEXAbfMVU2Cl1syoVhbnEVQhp4Mm6npnwdBeW5lzeU6AuSLojS8D3/AzRkhYDm2lc+3Fj5Wgpaf1VowQ3nAi+BB4RNeBrYwRXZV2ypO9PLlskpcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a2LpuEzF; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a2LpuEzF"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4dac5a3fbeaso518282e0c.3
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Apr 2024 00:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712563189; x=1713167989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PbG/Cv7DGpt7tAVi1gqaOi//Mh/4FAflEt7ny+NUGq4=;
        b=a2LpuEzFh+1zrDKHS9Qgvdy+fcXpBktWbM/dc2JyfeklFRcuNlthqgqXYvu2PTBmMv
         ayP5JPnBoY/8UwsBmRKcUDLV37YW2jlksRS+k0vhHBfnQHE3tynSAoAjSgw62fjUFVLR
         uxMOO3jmUnREc1Ipi9yQUvLn3LSMBiGTzYdHcxoUoCS+P744E2LSA3w/7AS/Pcc10x89
         4mWBahhwXObNrHSO7n1iauqdjpQ2ToaWhPHYo5bjV99G9A0/qaM+mqwTXWL6bIBVe6d8
         K63POCp75/XlcgQFLlybimKPuZuaD1IxZR9LUBtMp3D1K37b41vC7slpRqGBGQw+DZKx
         7FvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712563189; x=1713167989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PbG/Cv7DGpt7tAVi1gqaOi//Mh/4FAflEt7ny+NUGq4=;
        b=G+qqMYWjhirQEcNtTC6HXSlajD3CxECUB+50jUMhvGGuNRRRQPiDhELqxyvjtLHdsO
         eus/KjeDFnILr+wYuOK9ncv16yzOcAn9dmY3+3s0shbL7RGPXUdUSaaJhnVzAZxdSoU/
         682sjjPrPTBMHXTIyu01KY4M/enubNAutjyjXIBg3n92YnHeBtteIVzBsWN2Kmg8Dutd
         pWbeTnfVv3I35vqTaLv+VwuBfbXwvkabm27/uASpq5LRhQvAawjwSnQinnzcN6WOcTDq
         RGWlVwzXAm7JbFNEk1DMBxqgiERl7mPUWLCGntCimZ07GACElN6yfp0gD4YGB5v7IsXx
         50Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXF8+FuR0EWYh46ExLGHByjzKpi5+4AP2ay4BEv4QIMn/82QklQ0oci3FXDstR7wZOdR+R48MpRBvH+8JugM9ZFfcAke0kj0gyeKc1YRvE=
X-Gm-Message-State: AOJu0YyhBAC/MIMQ8Bt2piiq/VrDv9ULKt+gv6cfwxXereXPtL9VQx3l
	3NKJHuLdYWKLlKrowP2MdwkPdz9datMeDB4X3QH96c7LwfYaosYebwMnxIy00QO49k+ohX5C2RK
	TpA3ygKBO3GB/4heHQw7hpAAMyVWB6qjGUX83
X-Google-Smtp-Source: AGHT+IHzMEs3mc0QgxIUxBRNAl9cFA3qfBpyb9XiwEy6iZE0WfiGTdmgyT70awZTbI0csylv+uSMp8XjirCS7fIeG90=
X-Received: by 2002:a05:6122:685:b0:4d9:218e:3fdd with SMTP id
 n5-20020a056122068500b004d9218e3fddmr3695276vkq.1.1712563188580; Mon, 08 Apr
 2024 00:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402-linked-list-v1-0-b1c59ba7ae3b@google.com>
 <20240402-linked-list-v1-8-b1c59ba7ae3b@google.com> <18698be5-fe4b-44ed-a12e-444ebffd4b32@proton.me>
In-Reply-To: <18698be5-fe4b-44ed-a12e-444ebffd4b32@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 8 Apr 2024 09:59:37 +0200
Message-ID: <CAH5fLggBVNYbP1tWSFH+cmkAtXv=2Nzm1fWyF+1-NWgHBDwq6w@mail.gmail.com>
Subject: Re: [PATCH 8/9] rust: list: support heterogeneous lists
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

On Thu, Apr 4, 2024 at 5:35=E2=80=AFPM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> On 02.04.24 14:17, Alice Ryhl wrote:
> > @@ -180,6 +184,41 @@ unsafe fn from_fields(me: *mut ListLinksFields) ->=
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
> > +}
> > +
> > +unsafe impl<T: ?Sized + Send, const ID: u64> Send for ListLinksSelfPtr=
<T, ID> {}
> > +unsafe impl<T: ?Sized + Sync, const ID: u64> Sync for ListLinksSelfPtr=
<T, ID> {}
>
> Missing SAFETY comments.

Will do.

> > +
> > +impl<T: ?Sized, const ID: u64> ListLinksSelfPtr<T, ID> {
> > +    /// The offset from the [`ListLinks`] to the self pointer field.
> > +    pub const LIST_LINKS_SELF_PTR_OFFSET: usize =3D core::mem::offset_=
of!(Self, self_ptr);
> > +
> > +    /// Creates a new initializer for this type.
> > +    pub fn new() -> impl PinInit<Self> {
> > +        // INVARIANT: Pin-init initializers can't be used on an existi=
ng `Arc`, so this value will
> > +        // not be constructed in an `Arc` that already has a `ListArc`=
.
> > +        Self {
> > +            inner: ListLinks {
> > +                inner: Opaque::new(ListLinksFields {
> > +                    prev: ptr::null_mut(),
> > +                    next: ptr::null_mut(),
> > +                }),
> > +            },
>
> Why don't you use `inner <- ListLinks::new(),`?

Because I wasn't using the macro at all. I was just using the fact
that T implements PinInit<T>. But as discussed on another patch, I'll
replace this entire method with init::zeroed().

> > +            self_ptr: UnsafeCell::new(MaybeUninit::zeroed()),
> > +        }
> > +    }
> > +}
> > +
> >  impl<T: ?Sized + ListItem<ID>, const ID: u64> List<T, ID> {
> >      /// Creates a new empty list.
> >      pub const fn new() -> Self {
>
> [...]
>
> > @@ -94,5 +137,45 @@ unsafe fn post_remove(me: *mut ListLinks<$num>) -> =
*const Self {
> >              }
> >          }
> >      };
> > +
> > +    (
> > +        impl$({$($generics:tt)*})? ListItem<$num:tt> for $t:ty {
> > +            using ListLinksSelfPtr;
> > +        } $($rest:tt)*
> > +    ) =3D> {
> > +        unsafe impl$(<$($generics)*>)? ListItem<$num> for $t {
> > +            unsafe fn prepare_to_insert(me: *const Self) -> *mut ListL=
inks<$num> {
> > +                let links_field =3D unsafe { Self::view_links(me) };
> > +
> > +                let spoff =3D ListLinksSelfPtr::<Self, $num>::LIST_LIN=
KS_SELF_PTR_OFFSET;
> > +                let self_ptr =3D unsafe { (links_field as *const u8).a=
dd(spoff)
> > +                    as *const ::core::cell::UnsafeCell<*const Self> };
> > +                let cell_inner =3D ::core::cell::UnsafeCell::raw_get(s=
elf_ptr);
> > +
> > +                unsafe { ::core::ptr::write(cell_inner, me) };
> > +                links_field
> > +            }
> > +
> > +            unsafe fn view_links(me: *const Self) -> *mut ListLinks<$n=
um> {
> > +                unsafe {
> > +                    <Self as HasListLinks<$num>>::raw_get_list_links(m=
e.cast_mut())
> > +                }
> > +            }
> > +
> > +            unsafe fn view_value(links_field: *mut ListLinks<$num>) ->=
 *const Self {
> > +                let spoff =3D ListLinksSelfPtr::<Self, $num>::LIST_LIN=
KS_SELF_PTR_OFFSET;
> > +                let self_ptr =3D unsafe { (links_field as *const u8).a=
dd(spoff)
> > +                    as *const ::core::cell::UnsafeCell<*const Self> };
> > +                let cell_inner =3D ::core::cell::UnsafeCell::raw_get(s=
elf_ptr);
> > +                unsafe {
> > +                    ::core::ptr::read(cell_inner)
> > +                }
> > +            }
> > +
> > +            unsafe fn post_remove(me: *mut ListLinks<$num>) -> *const =
Self {
> > +                unsafe { Self::view_value(me) }
> > +            }
> > +        }
> > +    };
>
> The paths in this macro should use `$crate::...` to prevent import
> errors.

Will do.

Alice
