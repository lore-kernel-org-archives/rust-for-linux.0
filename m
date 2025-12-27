Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA4D2F85B
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 02:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766800956; cv=none; b=JqqzyhyUjpXcYqRV0utvKrAZywW2tYpLZ8mKfskdeLMSSVhU1uQo0IMzP9a0T0xj4hdJdiMFHyV8lxM2RlMsNIKxDsUee+m9afZHPcDC9Ui2zY6Bk4CY6eI9fLVnP00YAhAdrBhefI3Z3BbM6QAvgQvDufJXmvlNzm1iofQEO4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766800956; c=relaxed/simple;
	bh=TQcgD2kmmDUwHTGS2qxC5dggNPAj/qW3upA8dmkUGQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1F11f+qFrdZyjbpwTR3m9ZaBFsdwvJK2nriuHmdiLbl/+8RPPj852sXWUC35Z/MB8yi9enAtqKOvSFMHRpYoCS9C1sagzDFbao9ZlGFrZ2Rp5nzI7cHMI0U8Kqqam4pBpK4jqXEgI3TMaUD6i/hLKZIbHMbSsxypADux6z7DzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 17c190c6e2c811f0a38c85956e01ac42-20251227
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:fb26c926-03af-4c33-a6a8-b2421082e76b,IP:10,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:0
X-CID-INFO: VERSION:1.3.6,REQID:fb26c926-03af-4c33-a6a8-b2421082e76b,IP:10,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:36a6c02318502c6e0beaabdc495af3de,BulkI
	D:2512262310548GIJU3ZY,BulkQuantity:13,Recheck:0,SF:17|19|64|66|78|80|81|8
	2|83|102|841|898,TC:nil,Content:0|15|52,EDM:-3,IP:1,URL:0,File:nil,RT:nil,
	Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR
	:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_OBB,
	TF_CID_SPAM_IBB
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 17c190c6e2c811f0a38c85956e01ac42-20251227
X-User: sunke@kylinos.cn
Received: from mail-lj1-f172.google.com [(209.85.208.172)] by mailgw.kylinos.cn
	(envelope-from <sunke@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1766673576; Sat, 27 Dec 2025 10:02:26 +0800
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37b96cbd875so64969301fa.3
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 18:02:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWivdb/hY+8HaQTM545jAoppDpphg9Eywo8M0Sk5u32WQmiDdA3Jtfm8gK/Q//TkkxiLM1dxmREq1c/pZ/KJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOxjI1CTyw4DW7YVN+ZKByTHI1goQOE06EGlwnmvbfLcZubYFp
	Dm1EgKYT7Adh8utKpbclA2Jjf5MlNpM6ZjqbtVbg8KoXRZef3hR10fqrye69W+sK8+QBNuTkTYm
	qA4HrbDjaRuWljsXct4CGafzTmMOYtIo=
X-Google-Smtp-Source: AGHT+IFhMB8dmxc9qZnNLBPofVXhfsebkYEHgRyF/kG0RtWZHiBNHoeT8l7LsBXgo2rcrm5ub37Go0krAHpIW/wIy4w=
X-Received: by 2002:a05:651c:199e:b0:37b:af2d:13a3 with SMTP id
 38308e7fff4ca-38121552c00mr84625141fa.7.1766800937373; Fri, 26 Dec 2025
 18:02:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226140751.2215563-1-sunke@kylinos.cn> <20251226140751.2215563-3-sunke@kylinos.cn>
 <fb0f146c-8d0d-47e0-82ae-e815eb9bd2dc@gmail.com>
In-Reply-To: <fb0f146c-8d0d-47e0-82ae-e815eb9bd2dc@gmail.com>
Reply-To: sunke@kylinos.cn
From: Ke Sun <sunke@kylinos.cn>
Date: Sat, 27 Dec 2025 10:02:06 +0800
X-Gmail-Original-Message-ID: <CALpAb9O3BF7FAfYav0=WoDyspuEpFRDK9+8XHeaeEHMgxPr4Ow@mail.gmail.com>
X-Gm-Features: AQt7F2rPQPglUgZD0cPR99b73wke8T6MHoRdySFVl1AstKQXN98nBvHee9LJnX4
Message-ID: <CALpAb9O3BF7FAfYav0=WoDyspuEpFRDK9+8XHeaeEHMgxPr4Ow@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] rust: kernel: Add pointer wrapper types for safe
 pointer formatting
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dirk Behme <dirk.behme@gmail.com> =E4=BA=8E2025=E5=B9=B412=E6=9C=8826=E6=97=
=A5=E5=91=A8=E4=BA=94 23:10=E5=86=99=E9=81=93=EF=BC=9A
>
> On 26.12.25 15:07, Ke Sun wrote:
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
> >
> > Signed-off-by: Ke Sun <sunke@kylinos.cn>
> > ---
> >  rust/helpers/fmt.c     |  65 +++++++++++
> >  rust/helpers/helpers.c |   3 +-
> >  rust/kernel/ptr.rs     | 240 ++++++++++++++++++++++++++++++++++++++++-
> >  3 files changed, 304 insertions(+), 4 deletions(-)
> >  create mode 100644 rust/helpers/fmt.c
> ....
> > diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> > index 79c72762ad9c4..b6877fe8dafc0 100644
> > --- a/rust/helpers/helpers.c
> > +++ b/rust/helpers/helpers.c
> > @@ -27,8 +27,9 @@
> >  #include "dma.c"
> >  #include "drm.c"
> >  #include "err.c"
> > -#include "irq.c"
> > +#include "fmt.c"
> >  #include "fs.c"
> > +#include "irq.c"
> >  #include "io.c"
> >  #include "jump_label.c"
> >  #include "kunit.c"
> > diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> > index e3893ed04049d..ed5069c954146 100644
> > --- a/rust/kernel/ptr.rs
> > +++ b/rust/kernel/ptr.rs
> > @@ -1,11 +1,22 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >
> >  //! Types and functions to work with pointers and addresses.
> > +//!
> > +//! This module provides wrapper types for formatting kernel pointers =
that correspond to the
> > +//! C kernel's printk format specifiers `%p`, `%pK`, and `%px`.
> >
> > -use core::mem::align_of;
> > -use core::num::NonZero;
> > +use core::{
> > +    fmt,
> > +    fmt::Pointer,
> > +    mem::align_of,
> > +    num::NonZero, //
> > +};
> >
> > -use crate::build_assert;
> > +use crate::{
> > +    bindings,
> > +    build_assert,
> > +    ffi::c_void, //
> > +};
> >
> >  /// Type representing an alignment, which is always a power of two.
> >  ///
> > @@ -225,3 +236,226 @@ fn align_up(self, alignment: Alignment) -> Option=
<Self> {
> >  }
> >
> >  impl_alignable_uint!(u8, u16, u32, u64, usize);
> > +
> > +/// Placeholder string used when pointer hashing is not ready yet.
> > +const PTR_PLACEHOLDER: &str =3D if core::mem::size_of::<*const c_void>=
() =3D=3D 8 {
> > +    "(____ptrval____)"
> > +} else {
> > +    "(ptrval)"
> > +};
> > +
> > +/// Macro to implement common methods for pointer wrapper types.
> > +macro_rules! impl_ptr_wrapper {
> > +    ($($name:ident),* $(,)?) =3D> {
> > +        $(
> > +            impl $name {
> > +                /// Creates a new instance from a raw pointer.
> > +                #[inline]
> > +                pub fn from<T>(ptr: *const T) -> Self {
> > +                    Self(ptr.cast())
> > +                }
> > +
> > +                /// Creates a new instance from a mutable raw pointer.
> > +                #[inline]
> > +                pub fn from_mut<T>(ptr: *mut T) -> Self {
> > +                    Self(ptr.cast())
> > +                }
> > +
> > +                /// Returns the inner raw pointer.
> > +                #[inline]
> > +                pub fn as_ptr(&self) -> *const c_void {
> > +                    self.0
> > +                }
> > +            }
> > +
> > +            impl<T> From<*const T> for $name {
> > +                #[inline]
> > +                fn from(ptr: *const T) -> Self {
> > +                    Self::from(ptr)
> > +                }
> > +            }
> > +
> > +            impl<T> From<*mut T> for $name {
> > +                #[inline]
> > +                fn from(ptr: *mut T) -> Self {
> > +                    Self::from_mut(ptr)
> > +                }
> > +            }
> > +        )*
> > +    };
> > +}
> > +
> > +/// Helper function to hash a pointer and format it.
> > +///
> > +/// Returns `Ok(())` if the hash was successfully computed and formatt=
ed,
> > +/// or the placeholder string if hashing is not ready yet.
> > +fn format_hashed_ptr(ptr: *const c_void, f: &mut fmt::Formatter<'_>) -=
> fmt::Result {
> > +    let mut hashval: crate::ffi::c_ulong =3D 0;
> > +    // SAFETY: We're calling the kernel's ptr_to_hashval function whic=
h handles
> > +    // hashing. This is safe as long as ptr is a valid pointer value.
> > +    let ret =3D unsafe { bindings::ptr_to_hashval(ptr, core::ptr::addr=
_of_mut!(hashval)) };
> > +
> > +    if ret !=3D 0 {
> > +        // Hash not ready yet, print placeholder
> > +        return f.write_str(PTR_PLACEHOLDER);

Can you try `return f.pad(PTR_PLACEHOLDER);`? I'm testing it.

> > +    }
> > +
> > +    // Successfully got hash value, format it using Pointer::fmt to pr=
eserve
> > +    // formatting options (width, alignment, padding, etc.)
> > +    Pointer::fmt(&(hashval as *const c_void), f)
> > +}
> > +
> > +/// A pointer that will be hashed when printed (corresponds to `%p`).
> > +///
> > +/// This is the default behavior for kernel pointers - they are hashed=
 to prevent
> > +/// leaking information about the kernel memory layout.
> > +///
> > +/// # Example
> > +///
> > +/// ```
> > +/// use kernel::{
> > +///     prelude::fmt,
> > +///     ptr::HashedPtr,
> > +///     str::CString, //
> > +/// };
> > +///
> > +/// let ptr =3D HashedPtr::from(0x12345678 as *const u8);
> > +/// pr_info!("Hashed pointer: {:016p}\n", ptr);
> > +///
> > +/// // Width option test
> > +/// let cstr =3D CString::try_from_fmt(fmt!("{:30p}", ptr))?;
> > +/// let width_30 =3D cstr.to_str()?;
> > +/// assert_eq!(width_30.len(), 30);
> > +/// # Ok::<(), kernel::error::Error>(())
> > +/// ```
>
>
> Is this intended?
>
> [    1.932037]     # rust_doctest_kernel_ptr_rs_6.location:
> rust/kernel/ptr.rs:315
> [    1.932322] rust_doctests_kernel: Hashed pointer: (____ptrval____)
> [    1.933032]     # rust_doctest_kernel_ptr_rs_6: ASSERTION FAILED at
> rust/kernel/ptr.rs:329
> [    1.933032]     Expected width_30.len() =3D=3D 30 to be true, but is f=
alse
> [    1.933892]     not ok 179 rust_doctest_kernel_ptr_rs_6
>
>
> [    1.934097]     # rust_doctest_kernel_ptr_rs_7.location:
> rust/kernel/ptr.rs:353
> [    1.934434] rust_doctests_kernel: Restricted pointer: (____ptrval____)
> [    1.934707]     # rust_doctest_kernel_ptr_rs_7: ASSERTION FAILED at
> rust/kernel/ptr.rs:367

// lib/vsprintf.c
static inline int __ptr_to_hashval(const void *ptr, unsigned long *hashval_=
out)
{
unsigned long hashval;

if (!READ_ONCE(filled_random_ptr_key))   // filled_random_ptr_key might be =
false
return -EBUSY;

> [    1.934707]     Expected width_30.len() =3D=3D 30 to be true, but is f=
alse
> [    1.935156]     not ok 180 rust_doctest_kernel_ptr_rs_7
>
> This is v5 on top of v6.19-rc1 with x86_64_defconfig booting on QEMU.
>
> Cheers
>
> Dirk
