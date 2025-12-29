Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431AC319857
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 14:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767017291; cv=none; b=BzuDJ86YV9/PwvAa4mZyAayloNypImzN0iHhbMSfO1Y+Mdxxk1zh0k3Evg1inSX9xHVJwEMyoPCrwlLi8eu5bpHncjw05rkL1dgxMZZ3BmDWnod2EJygEBdGWA5Cs9pCHHYpW0SnrxGc5Wn8HH9gP69jyUbP3Zi5eSHC9WoUsho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767017291; c=relaxed/simple;
	bh=w3g33D6m5mY9SYi15Ucbs6Qt601NFTwqUdJP97SPO8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dXDYoWKukHl1///ydVHdTgkLaHT+/yb5Cw+T8d6tPDCA2AjGIrXMWWJSEiWVi18QvWfvf6ehLb49gLXLjrRTtbkfKp7iEkINYPmVUkB0mdqWZstuxN+1FrTBS2dqZznRrsLnzLh3ms5sgcqv8uYRnpHokDVoLyd0LpXYO/+cxJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c462178ae4bf11f0a38c85956e01ac42-20251229
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:1710bf8e-59ae-4fd9-a4d3-43f0b6287d47,IP:10,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:0
X-CID-INFO: VERSION:1.3.6,REQID:1710bf8e-59ae-4fd9-a4d3-43f0b6287d47,IP:10,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:3390d886b828a22c213249c4b1fcfdce,BulkI
	D:25122917033559B9J2CK,BulkQuantity:9,Recheck:0,SF:17|19|64|66|78|80|81|82
	|83|102|841|898,TC:nil,Content:0|15|52,EDM:-3,IP:1,URL:0,File:nil,RT:nil,B
	ulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:
	0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_IBB,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c462178ae4bf11f0a38c85956e01ac42-20251229
X-User: sunke@kylinos.cn
Received: from mail-lj1-f179.google.com [(209.85.208.179)] by mailgw.kylinos.cn
	(envelope-from <sunke@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 518974710; Mon, 29 Dec 2025 22:07:53 +0800
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37b999d0c81so76427681fa.2
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 06:07:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0nlMff9MU4bjb/TbMne8ttMpFj9BM3MiIml1ocOURnr6JePpUxK82FJph6v7l2smzZH6/7rcOSR7TqRiJ/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj5eox1wNwZNXZt9zmSvfUHWGP96fNF/ttMMGtTBDJCtGYyJM/
	lsFDPp7uNsqwtU+fDh1E0MxOaMDz5LUWC6/21w9CgW0+P2RULMMEARR6Qq0C/oNQfxD2o7myBYT
	8HiUo6epYVh9UG4jQR8w9E9VsOnnEsQA=
X-Google-Smtp-Source: AGHT+IHM4WyMYOwoYwTTMD+wEjHMrNWK+YI4bECi11iPGTIQwxPShgRRZZxCAMvkWek1qxuQ+MV4Vpfh/U0VtihLyJ8=
X-Received: by 2002:a05:6512:3c91:b0:597:ddd8:cd02 with SMTP id
 2adb3069b0e04-59a17d1806bmr10731296e87.4.1767017263167; Mon, 29 Dec 2025
 06:07:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251229072157.3857053-1-sunke@kylinos.cn> <20251229072157.3857053-3-sunke@kylinos.cn>
 <aVJD2z7p93NlEg0o@google.com>
In-Reply-To: <aVJD2z7p93NlEg0o@google.com>
Reply-To: sunke@kylinos.cn
From: Ke Sun <sunke@kylinos.cn>
Date: Mon, 29 Dec 2025 22:07:31 +0800
X-Gmail-Original-Message-ID: <CALpAb9Op4QwWFd+6k2s1Ni8iCTHkq2mWk9Zmgvysz431Bs6thA@mail.gmail.com>
X-Gm-Features: AQt7F2r8yIBhTBzhylSA1tA5p4FJ6KnmFSd5WTwbglH18OW_y0nJO18O2bCY5ew
Message-ID: <CALpAb9Op4QwWFd+6k2s1Ni8iCTHkq2mWk9Zmgvysz431Bs6thA@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] rust: kernel: Add pointer wrapper types for safe
 pointer formatting
To: Alice Ryhl <aliceryhl@google.com>
Cc: Dirk Behme <dirk.behme@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	John Ogness <john.ogness@linutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alice Ryhl <aliceryhl@google.com> =E4=BA=8E2025=E5=B9=B412=E6=9C=8829=E6=97=
=A5=E5=91=A8=E4=B8=80 17:03=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Dec 29, 2025 at 03:21:20PM +0800, Ke Sun wrote:
> > Add three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) to
> > rust/kernel/ptr.rs that correspond to C kernel's printk format specifie=
rs
> > %p, %pK, and %px. These types provide type-safe pointer formatting that
> > matches C kernel patterns.
> >
> > These wrapper types implement core::fmt::Pointer and delegate to the
> > corresponding kernel formatting functions, enabling safe pointer
> > formatting in Rust code that prevents information leaks about kernel
> > memory layout.
> >
> > Users can explicitly use these types:
> >     pr_info!("{:p}\n", HashedPtr::from(ptr));
> >     pr_info!("{:p}\n", RestrictedPtr::from(ptr));
> >     pr_info!("{:p}\n", RawPtr::from(ptr));
>
> These ::from calls are inconvenient. Why not just make the field public
> and let users write:
>
>         pr_info!("{:p}\n", HashedPtr(ptr));
>         pr_info!("{:p}\n", RestrictedPtr(ptr));
>         pr_info!("{:p}\n", RawPtr(ptr));
>
> If the only concern is casts, then just make the struct generic:
>
>         pub struct HashedPtr<T>(pub *const T);
>
> Since *mut T will automatically downgrade to *const T, this should allow
> HashedPtr(ptr) to work with any raw pointer.

I'll try implementing these suggestions you mentioned.

>
> > -use crate::build_assert;
> > +use crate::{
> > +    bindings,
> > +    build_assert,
> > +    ffi::c_void, //
> > +};
>
> Please use prelude::* instead of ffi::c_void.
>
> >  /// Type representing an alignment, which is always a power of two.
> >  ///
> > @@ -225,3 +236,240 @@ fn align_up(self, alignment: Alignment) -> Option=
<Self> {
> >  }
> >
> >  impl_alignable_uint!(u8, u16, u32, u64, usize);
> > +
> > +/// Placeholder string used when pointer hashing is not ready yet.
> > +const PTR_PLACEHOLDER: &str =3D if core::mem::size_of::<*const c_void>=
() =3D=3D 8 {
>
> size_of is in the kernel prelude.
>
> > +impl fmt::Pointer for RestrictedPtr {
> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> > +        // Handle NULL pointers
> > +        if self.0.is_null() {
> > +            return Pointer::fmt(&self.0, f);
> > +        }
> > +
> > +        // Use kptr_restrict_value to handle all kptr_restrict cases.
> > +        // - Returns 0: kptr_restrict =3D=3D 0, use original pointer (=
needs hashing)
> > +        // - Returns 1: kptr_restrict =3D=3D 1, *pptr may be modified =
to NULL if no permission
> > +        // - Returns 2: kptr_restrict >=3D 2, *pptr is set to NULL
> > +        // - Returns -1: IRQ context with kptr_restrict =3D=3D 1 (erro=
r case)
> > +        let mut ptr_value =3D self.0;
> > +        // SAFETY: kptr_restrict_value handles capability checks and I=
RQ context.
> > +        // It may modify ptr_value to NULL if there's no permission.
> > +        let ret =3D unsafe { bindings::kptr_restrict_value(core::ptr::=
addr_of_mut!(ptr_value)) };
>
> Simplifies to:
>
>         let ret =3D unsafe { bindings::kptr_restrict_value(&raw mut ptr_v=
alue) };
>
> or even:
>
>         let ret =3D unsafe { bindings::kptr_restrict_value(&mut ptr_value=
) };
>
> > +        match ret {
> > +            -1 =3D> {
> > +                // IRQ context with kptr_restrict =3D=3D 1 - print err=
or placeholder
> > +                // This should not happen in normal Rust code, but han=
dle it gracefully
> > +                f.pad("(pK-error)")
>
> Why can't this happen in Rust code? Rust can run in IRQ context.

You're correct about the IRQ context - I had misunderstood the situation.

>
> > +            }
> > +            0 =3D> {
> > +                // kptr_restrict =3D=3D 0: hash the pointer (same as %=
p)
> > +                format_hashed_ptr(self.0, f)
> > +            }
> > +            1 =3D> {
> > +                // kptr_restrict =3D=3D 1: print raw pointer if ptr_va=
lue is non-null,
> > +                // otherwise print 0 (no permission)
> > +                if ptr_value.is_null() {
> > +                    Pointer::fmt(&core::ptr::null::<c_void>(), f)
> > +                } else {
> > +                    // Print the raw pointer directly (like %px)
> > +                    // This matches C behavior: pointer_string() print=
s the raw address
> > +                    Pointer::fmt(&ptr_value, f)
> > +                }
> > +            }
> > +            _ =3D> {
> > +                // kptr_restrict >=3D 2: always print 0
> > +                // ptr_value should already be NULL, but check to be s=
afe
> > +                Pointer::fmt(&core::ptr::null::<c_void>(), f)
> > +            }
> > +        }
> > +    }
> > +}
>
> Alice
