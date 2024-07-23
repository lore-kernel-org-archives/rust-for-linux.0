Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E951369AE
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 13:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721742317; cv=none; b=oqM+WAVjp8JGLE5sWBDYDSSOxSV7UgXvenPXhpwyBKBNH3YpEQ1OsNMAlkiuO2BiL91HsU8DYa0X6MKGfqPc1dy1nYG9irmoSSV4coksn7f2TlcfUgnMuMAAM+zYBJrWBJkKEIi9qKiJd8ai2sxLnz8n1a5E/XnIF4GkwtF+D70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721742317; c=relaxed/simple;
	bh=6xkjqOLIBWCUTPE9oBNQS4lln363uqAs32mI8+U9f9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4pepTy9dEDkv5kOA+UwprqLEVT8uNjacmfKj0vU1hGbKItE9K7TnnF/TxrtPcNxTmXqr+zSnSY0KNb0XqYomDZlEZGTwgpAE2xdTUnOiAqQaXEkQypyFezxgRlXAtJGJODu5S8nFCfNGZQhjXpeFwEqTFdPs4T3gc7KbLvQRaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dyFtVrgD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dyFtVrgD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42797bcfc77so41313715e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 06:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721742314; x=1722347114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUdMWNOBxPL41aWSwiOcRVd4loEgCh7RfPYqclIT7HI=;
        b=dyFtVrgDQT4HGJy7mwMP45yt9KHjTz1iQRKwXv3LXF6XVBP6QvKPhK5a9xIXPyLMDw
         leLdVFDUpOLOTReqFgDT58OlZ75HDlKZdzwlm1U2ypjwBF3jiBwm6BO0rFSJm0wzRf4X
         FzVAXsQ1UJ9i/P2T3PDei3AiIkkUBiHDXHZHyScUC+Dt7SsIl0XNZ5azUKayfCYBbzpt
         cQlNRgBHJQUm6bLg68dK2kyW3jP4Ax0QSHGcDdqYhvqfCmf5wSiS/14lrYNSVB530507
         RzvTcpwsPEzVfed8SHFbWVfgeqmgNC23z7jxeFFW9hvpJIOIPFw3UefaE944qYLHqGjp
         n0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721742314; x=1722347114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUdMWNOBxPL41aWSwiOcRVd4loEgCh7RfPYqclIT7HI=;
        b=WDr7maxZLcD3phUxOtHypzggRYMxwxXc37SIglCz6G8Ce/L+xvLeJFWSEd0KcImqfL
         KJb+2OsBqywDbfHOFDDwYKU7ivl8vSFlE+NXwC7FDs5fYLzfw6ycoFqhFr/6LbGv0Xhy
         korcFaXC8FDlb/QdWwvxFfKfEBP83GTO3ervG8hniJV286biutyVdoBLfwExz5Cw8nfq
         j+FaG13C7RQ+DLVHBr5UhJDsI5noLh/eiqyqC5XNUlOHgoSLoGF3+mi+lBnjRCxcV7Gs
         mXGNNKItSZjutgQn737ffq04BiD1U5Jy/MOLzbc3Vrqqqk1ny3YbBJ7JzOVwc0ECrziu
         pwoA==
X-Forwarded-Encrypted: i=1; AJvYcCVjVAqvhziHHuenib3dqHW0+sE8eh5sTAyG29olaPvsKt4IeXIdOGCu9O6srQNLHeBh37FJ+3e2EwqIuy+P4a0a0umVcHkxgFYJDVJUuVE=
X-Gm-Message-State: AOJu0YzxCK8wuEXHvPpOinzpEfoWbUQx0cdqQkkaVTCTudiRe/3sNZcM
	ju+cGUUSoCCIzmiEBlKu16fvSy3AJWDzRE3j/V33V555FSxK7zWe3YYIQ/UoYWDo7c5dwMYa5WL
	000kY/VEDYxfX2+uOL+k+Xwmd1S1t5YGDP3ig
X-Google-Smtp-Source: AGHT+IHE07qpK67Cz8iYBi6jnbzau27/24LxetDWy9auAduK98VBHyUDWeLTN4ggypdv1nYqnHsdiccef4R76g+qUzk=
X-Received: by 2002:a05:600c:5493:b0:426:6ea2:31af with SMTP id
 5b1f17b1804b1-427dc5753a9mr56168485e9.37.1721742314015; Tue, 23 Jul 2024
 06:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <CAH5fLghWQQfrKWFr+vd0B4YjxKwEd+pMV5zeiTCnRtX3_1oRYQ@mail.gmail.com> <4A1B4B2C-7FAB-4656-90AE-B30DC636349E@collabora.com>
In-Reply-To: <4A1B4B2C-7FAB-4656-90AE-B30DC636349E@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 23 Jul 2024 15:45:02 +0200
Message-ID: <CAH5fLgitm2qrGn3BBFyspmTD7Km+pp2qbvA9GN4fjyUnuWffWg@mail.gmail.com>
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@redhat.com>, lyude@redhat.com, robh@kernel.org, lina@asahilina.net, 
	mcanal@igalia.com, airlied@gmail.com, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 3:41=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi Alice, thanks for the review!
>
>
> >> +        fn alloc_mem(&mut self, size: usize) -> Option<*mut u8> {
> >> +            assert!(size % 8 =3D=3D 0, "Allocation size must be 8-byt=
e aligned");
> >> +            if isize::try_from(size).unwrap() =3D=3D isize::MAX {
> >> +                return None;
> >> +            } else if self.pos + size > self.capacity {
> >> +                kernel::pr_debug!("DumpAllocator out of memory");
> >> +                None
> >> +            } else {
> >> +                let offset =3D self.pos;
> >> +                self.pos +=3D size;
> >> +
> >> +                // Safety: we know that this is a valid allocation, s=
o
> >> +                // dereferencing is safe. We don't ever return two po=
inters to
> >> +                // the same address, so we adhere to the aliasing rul=
es. We make
> >> +                // sure that the memory is zero-initialized before be=
ing handed
> >> +                // out (this happens when the allocator is first crea=
ted) and we
> >> +                // enforce a 8 byte alignment rule.
> >> +                Some(unsafe { self.mem.as_ptr().offset(offset as isiz=
e) as *mut u8 })
> >> +            }
> >> +        }
> >> +
> >> +        pub(crate) fn alloc<T>(&mut self) -> Option<&mut T> {
> >> +            let mem =3D self.alloc_mem(core::mem::size_of::<T>())? as=
 *mut T;
> >> +            // Safety: we uphold safety guarantees in alloc_mem(), so=
 this is
> >> +            // safe to dereference.
> >
> > This code doesn't properly handle when T requires a large alignment.
> >
>
> Can you expand a bit on this? IIRC the alignment of a structure/enum will=
 be dictated
> by the field with the largest alignment requirement, right? Given that th=
e largest primitive
> allowed in the kernel is u64/i64, shouldn=E2=80=99t this suffice, e.g.:

It's possible for Rust types to have a larger alignment using e.g.
#[repr(align(64))].

>  +            assert!(size % 8 =3D=3D 0, "Allocation size must be 8-byte =
aligned");
>
>
> >> +            Some(unsafe { &mut *mem })
> >> +        }
> >> +
> >> +        pub(crate) fn alloc_bytes(&mut self, num_bytes: usize) -> Opt=
ion<&mut [u8]> {
> >> +            let mem =3D self.alloc_mem(num_bytes)?;
> >> +
> >> +            // Safety: we uphold safety guarantees in alloc_mem(), so=
 this is
> >> +            // safe to build a slice
> >> +            Some(unsafe { core::slice::from_raw_parts_mut(mem, num_by=
tes) })
> >> +        }
> >
> > Using references for functions that allocate is generally wrong.
> > References imply that you don't have ownership of the memory, but
> > allocator functions would normally return ownership of the allocation.
> > As-is, the code seems to leak these allocations.
>
> All the memory must be given to dev_coredumpv(), which will then take
> ownership.  dev_coredumpv() will free all the memory, so there should be =
no
> leaks here.
>
> I=E2=80=99ve switched to KVec in v2, so that will also cover the error pa=
ths,
> which do leak in this version, sadly.
>
> As-is, all the memory is pre-allocated as a single chunk. When space is c=
arved
> for a given T, a &mut is returned so that the data can be written in-plac=
e at
> the right spot in said chunk.
>
> Not only there shouldn=E2=80=99t be any leaks, but I can actually decode =
this from
> userspace.
>
> I agree that this pattern isn=E2=80=99t usual, but I don=E2=80=99t see an=
ything
> incorrect. Maybe I missed something?

Interesting. So the memory is deallocated when self is destroyed? A
bit unusual, but I agree it is correct if so. Sorry for the confusion
:)

Alice
