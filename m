Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD40B1A3BC3
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 14:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722521238; cv=none; b=r0nQGS98NT1UrvgnCijzAvy/UDMSacZt/QjVxGEy04IbL1nZJKHTdUB7zlsFVy5EFYD+84Q3MSn4MV629b8YENBZO/7bxwQGlUUhzKc3Kauih7aBVPeGN+AguUOsQ6tm/GDxetJKVkgIJBzOa14TEs403r/hE8G8MCIuyOcsVo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722521238; c=relaxed/simple;
	bh=+p16S8GS0ouZfd2TsKNdCxP8LYTgusGnamhyrVa/Ofo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UsxaPpcCqcJu6aoTyKOxMllkKPBNucGWI660P/O+uc62CpZj6MLZV8+OXpgxXAjtqX5/Q8Vp55CDiA4ybqMNcFJwI4oDpHN1Q+DgjT5s8Ir9x4m7XeG9vQTazqNHWPjUd/ZSQGDy9sM+MJT3mn/qW7BebZyk3THvTBKyxkXPaCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VlPxlJyK; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VlPxlJyK"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2cd48ad7f0dso5401209a91.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 07:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722521236; x=1723126036; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyBBuohO0Hs+IuvszCA+reGtTKvxPWc+GPkqz6wW5/c=;
        b=VlPxlJyK+wSosYAtgZsX2PUGv41jHdZQmOsi8AWg7Q+1KcB0UKRB7R64BsjLoOs7C6
         tlULqEBw0+wXBAQE4PcSI061XUD7rgYV/cGVOe7K8ekHcbvutjHs3ljFg+YxlJ5WE3oa
         l4Hm7nECd/7mBZQ7CNWyfvD25fqkNz8zVsTQYDxO0Xj26BY3e7jt7+/WWwqTI/YYmkPA
         XHFHnSr5dZAaC02jlkdDrD4eL0t5QXQYh/PRaVeKcRHXH8LPuXsUdaei9IQYC3gZ6NGd
         tAbDXNyNmpklBCyYzjNMgSSTqqbe3tuhDYx8Pu6CVzkAEmVt5VtJ2a/2EB0hPYkwkPeC
         esjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722521236; x=1723126036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyBBuohO0Hs+IuvszCA+reGtTKvxPWc+GPkqz6wW5/c=;
        b=VbCo5qZ81w6httDFr0X3M28YQ+30myYaMu6RlJiTrDDUq4En292EHqCjAXZqjO6FCG
         YsiFaU6mTnvDgesEaiPx0xGOWe/OWYqCakXbqOPpc8f0nbVt3LZS9SFouUt9l+48vB5B
         +iQUKoGAdlhvO9P0LwzXYcpm4aiFKJfnDG7ds69hGPznz/+hEoYiyqz5biklqeH2IcxC
         5b/uTcRj+wjdsvDSrJwsvz3niTVkjONiL237ldSU6ygMm4+1iOXqIuaWCownojwSb1Dl
         Q/pCDxqc0gPaHZUD8ypadjv0cpnu53cwKic6Zt1fDFdpxioXxywEXS7VYPJlWshBFyul
         RrRA==
X-Forwarded-Encrypted: i=1; AJvYcCViWu8ZfESjXeCmjoE1MpYABXgfRQNpE4xnV0cnxn9b5SYjIOYXFyWB8oTJmLGQ1SVUqjZ/hN8IYoIFuaMwU1+LHIpTICbxQQ0P3600K9M=
X-Gm-Message-State: AOJu0YxbfxT/cBmpHAam37oNFDPB2WDL5JlMAi/QeCbsNnYnmYUR7yKw
	P5hNfwxngDbg/Xt3hQSPPXfNaoDCS3yawJ6Hpq8WaCJx4Zz7j5QQILO3lzZ113KFDFT8J7m/MnK
	jwXKfe0xKgW8Pdu0+xyeqtgWTWfb5GQBgOktss4wqusra39veANpur48=
X-Google-Smtp-Source: AGHT+IH8wLTy4OfUI1N/iRPbfsy9jlveCpM3VPGUpvU5ua9Ijad6Tf3V2cLkv7wRzPOiYho4OXsD/vmRzOEqdosk0dw=
X-Received: by 2002:a17:90a:9e5:b0:2c7:c6c4:1693 with SMTP id
 98e67ed59e1d1-2cff9487f9emr346403a91.21.1722521235525; Thu, 01 Aug 2024
 07:07:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801-vma-v3-1-db6c1c0afda9@google.com> <ZquVcyeLqGGRbgx-@pollux>
In-Reply-To: <ZquVcyeLqGGRbgx-@pollux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 16:07:01 +0200
Message-ID: <CAH5fLgjd47eK=+k1vB2h6gDnZyVBOUi+KAr2L1Htoq3hPnqbqg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: mm: add abstractions for mm_struct and vm_area_struct
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Wilcox <willy@infradead.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 4:02=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Thu, Aug 01, 2024 at 12:58:45PM +0000, Alice Ryhl wrote:
> > This is a follow-up to the page abstractions [1] that were recently
> > merged in 6.11. Rust Binder will need these abstractions to manipulate
> > the vma in its implementation of the mmap fop on the Binder file.
> >
> > This patch is based on Wedson's implementation on the old rust branch,
> > but has been changed significantly. All mistakes are Alice's.
> >
> > Link: https://lore.kernel.org/r/20240528-alice-mm-v7-4-78222c31b8f4@goo=
gle.com [1]
> > Co-developed-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > Changes in v3:
> > - Reorder entries in mm.rs.
> > - Use ARef for mmput_async helper.
> > - Clarify that VmArea requires you to hold the mmap read or write lock.
> > - Link to v2: https://lore.kernel.org/r/20240727-vma-v2-1-ab3e5927dc3a@=
google.com
> >
> > Changes in v2:
> > - mm.rs is redesigned from scratch making use of AsRef
> > - Add notes about whether destructors may sleep
> > - Rename Area to VmArea
> > - Link to v1: https://lore.kernel.org/r/20240723-vma-v1-1-32ad5a0118ee@=
google.com
> > ---
> >  rust/helpers.c         |  61 +++++++++
> >  rust/kernel/lib.rs     |   1 +
> >  rust/kernel/mm.rs      | 337 +++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  rust/kernel/mm/virt.rs | 204 ++++++++++++++++++++++++++++++
> >  rust/kernel/types.rs   |   9 ++
> >  5 files changed, 612 insertions(+)
> >
> > diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
> > new file mode 100644
> > index 000000000000..ed2db893fb79
> > --- /dev/null
> > +++ b/rust/kernel/mm.rs
> > @@ -0,0 +1,337 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2024 Google LLC.
> > +
> > +//! Memory management.
> > +//!
> > +//! C header: [`include/linux/mm.h`](../../../../include/linux/mm.h)
>
> NIT: srctree

Ah, thanks. Good catch.

> > +
> > +    /// Returns a raw pointer to the inner `mm_struct`.
> > +    #[inline]
> > +    pub fn as_raw(&self) -> *mut bindings::mm_struct {
> > +        self.mm.get()
> > +    }
> > +
> > +    /// Obtain a reference from a raw pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The caller must ensure that `ptr` points at an `mm_struct`, an=
d that it is not deallocated
> > +    /// during the lifetime 'a.
> > +    #[inline]
> > +    pub unsafe fn from_raw_mm<'a>(ptr: *const bindings::mm_struct) -> =
&'a Mm {
>
> I'd just call this `from_raw`, like you call the counterpart `as_raw` abo=
ve.
> Same goes for `MmWithUser` and `VmArea`.

I've been using this naming convention since this discussion:
https://lore.kernel.org/all/20240401-marge-gepaukt-9a1972c848d9@brauner/

> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> > index bd189d646adb..143a2bf06941 100644
> > --- a/rust/kernel/types.rs
> > +++ b/rust/kernel/types.rs
> > @@ -366,6 +366,15 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
> >              _p: PhantomData,
> >          }
> >      }
> > +
> > +    /// Pass ownership of the refcount to a raw pointer.
> > +    pub fn into_raw(self) -> NonNull<T> {
> > +        let ptr =3D self.ptr;
> > +        // Skip the destructor.
> > +        core::mem::forget(self);
> > +
> > +        ptr
> > +    }
>
> I think this should be a separate patch.

Sure.

Alice
