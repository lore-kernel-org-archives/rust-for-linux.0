Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB39C8F77
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Aug 2024 07:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723017100; cv=none; b=JdnP10Ud4768rtAmK1d288eM7p4PSpeCEs1+Lsy0Na6wo6rNYrl7rZHXUvU4oyzeAdGAW+pqKpeRuwKRCtSedJleP5/AEXAwOMF0BsZqJmwxKlO78ZCZ32qUduLeN4bWQmNBEazpQejSUmGTXuXUowHqleHLx6Viphy5tFM1RF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723017100; c=relaxed/simple;
	bh=XAiRAs/m/7wsxVRJZL+4qAmUiSib8RmKUr91/3HFBjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SjMDjK2AcI9wXDmF0TABIaBH0ZS99+FJNp0/DpxticYiBA2NvSWCxsc2xrOrK2ib/hXAFxrHwUtxAnZ5WDkAliTYLg7fX/Wbf2nmEsf85ZTouRfRpjNdcFxZv4RRWerZ9jxi4CCPnH7zbdqSmbRUWs84oaIohTEAFYz/up39vLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QMLMAr6w; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QMLMAr6w"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52efc60a6e6so2311637e87.1
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Aug 2024 00:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723017095; x=1723621895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kgkxSJJtX+i0uwxp2Vuf2sl/Eh4EdSC4VZ41Tx19D8=;
        b=QMLMAr6wO+ZFmMPLoFib/C6hoIMUV03OCEV2DY9WwfVFCD6HcGQttrwE1z2eJQXkAi
         zQUkr3sfgdkcQadQjPDhlT8N4G+hl13tSL/RFwpq9MO8sNHDNfgDmB85xthDxUG+oO1A
         xImDG46GV/NPcFBDQvrWYHiUNw35sEm4boR2HSYzuytzzAKTdYUyjBNY15WnuULhWTqP
         hoDl1HEDtL14uSZTLYzZ4qfuLgliBb4z7yaf3Gnsm3VQEznKYicZ+tsGPnSPpVHHyGRe
         RBvGjBJbyOI7o1a2bMx0gqDcw5eLLrTzJGglaxZZvdOR/7sHEPD+Qn0PlmJNOTaqfVkx
         2vRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723017095; x=1723621895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kgkxSJJtX+i0uwxp2Vuf2sl/Eh4EdSC4VZ41Tx19D8=;
        b=qUDRdYK6W/EZNNmfD2e2v85d20jFtMTp25xwQMA3hRgL79N+ynEFQ4EuT7DaZhSJe5
         nsao3I1W3EFH6ZL1g3zKx2zgneZRZyhAAgmsqi37rxA5deMgwbNIQxRp/DoinCmQ5ibW
         xep/GBthj+7SCnaVBqAkKWp4akKhOYCL8NbQucqZ8u8hv2V54FStcrDGnRjJrHVUmsWI
         qEMx7EU7nAjrH7Do/uNCcj6mK7zQh2fHwioBtbEbRNXEyTFrZsH+2RL9hz7hi1mINvSW
         NIwtNeLCyk3lIEKBuQKiAr8oFUDi53Fo8i51Z6Z0CfMMRE9KjWCbKrNSe7aBxpQvBZiv
         swBg==
X-Forwarded-Encrypted: i=1; AJvYcCWDb2dmxHnxK0JWklRHs7zAQnsmiVUQcV1Qq3Lf2AE5S3uNkKkcnyEKfsokNh0TBYufDcf3xB9dz4S9+/4oSRyzP9SOUS7LgQSWeSrVy1c=
X-Gm-Message-State: AOJu0Yy2xAG8kGWseRLxSl+wOfP5Io7g4o1i7p7/zPIf/iH8mqz6KHW4
	4ys60Be3mNwXu+2Mye1Q6yulT94TN4Sh78c9AQTU28Ltn1vxSqk5cZPvZkkcjYQWUGQ/FI5kGUC
	inyRQ7nciFk5hJf3NdumODl0O+PfgAg9nZgaW
X-Google-Smtp-Source: AGHT+IHruncHePIupo9yq1u4fta3n5iewGgTM8VzbemIepCFSh1BTVHxUXDU0upst6N3POcqPWdxcfUo0H+qYtXZImU=
X-Received: by 2002:a05:6512:ad1:b0:52d:8356:f6b9 with SMTP id
 2adb3069b0e04-530bb39d25bmr13124754e87.38.1723017094463; Wed, 07 Aug 2024
 00:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-10-dakr@kernel.org>
 <a1c1e273-2d40-4114-b3b9-f27c73e3d122@proton.me> <ZrKrMrg5E85y7jkj@pollux> <012f5a12-2408-4658-8318-55fa8d4285e1@proton.me>
In-Reply-To: <012f5a12-2408-4658-8318-55fa8d4285e1@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Aug 2024 09:51:21 +0200
Message-ID: <CAH5fLggiSU9Ossy5gc+S_rSiX8v-JCDKPL_tRDYdjMYGfOt-0w@mail.gmail.com>
Subject: Re: [PATCH v4 09/28] rust: alloc: implement kernel `Box`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 9:49=E2=80=AFAM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> On 07.08.24 01:01, Danilo Krummrich wrote:
> > On Tue, Aug 06, 2024 at 07:47:17PM +0000, Benno Lossin wrote:
> >> On 05.08.24 17:19, Danilo Krummrich wrote:
> >>> `Box` provides the simplest way to allocate memory for a generic type
> >>> with one of the kernel's allocators, e.g. `Kmalloc`, `Vmalloc` or
> >>> `KVmalloc`.
> >>>
> >>> In contrast to Rust's `Box` type, the kernel `Box` type considers the
> >>> kernel's GFP flags for all appropriate functions, always reports
> >>> allocation failures through `Result<_, AllocError>` and remains
> >>> independent from unstable features.
> >>>
> >>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >>> ---
> >>>  rust/kernel/alloc.rs      |   6 +
> >>>  rust/kernel/alloc/kbox.rs | 330 ++++++++++++++++++++++++++++++++++++=
++
> >>>  rust/kernel/init.rs       |  35 +++-
> >>>  rust/kernel/prelude.rs    |   2 +-
> >>>  rust/kernel/types.rs      |  56 +++++++
> >>>  5 files changed, 427 insertions(+), 2 deletions(-)
> >>>  create mode 100644 rust/kernel/alloc/kbox.rs
> >>>
> >>> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> >>> index 942e2755f217..d7beaf0372af 100644
> >>> --- a/rust/kernel/alloc.rs
> >>> +++ b/rust/kernel/alloc.rs
> >>> @@ -5,6 +5,7 @@
> >>>  #[cfg(not(any(test, testlib)))]
> >>>  pub mod allocator;
> >>>  pub mod box_ext;
> >>> +pub mod kbox;
> >>>  pub mod vec_ext;
> >>>
> >>>  #[cfg(any(test, testlib))]
> >>> @@ -13,6 +14,11 @@
> >>>  #[cfg(any(test, testlib))]
> >>>  pub use self::allocator_test as allocator;
> >>>
> >>> +pub use self::kbox::Box;
> >>> +pub use self::kbox::KBox;
> >>> +pub use self::kbox::KVBox;
> >>> +pub use self::kbox::VBox;
> >>> +
> >>>  /// Indicates an allocation error.
> >>>  #[derive(Copy, Clone, PartialEq, Eq, Debug)]
> >>>  pub struct AllocError;
> >>> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> >>> new file mode 100644
> >>> index 000000000000..4a4379980745
> >>> --- /dev/null
> >>> +++ b/rust/kernel/alloc/kbox.rs
> >>> @@ -0,0 +1,330 @@
> >>> +// SPDX-License-Identifier: GPL-2.0
> >>> +
> >>> +//! Implementation of [`Box`].
> >>> +
> >>> +use super::{AllocError, Allocator, Flags};
> >>> +use core::fmt;
> >>> +use core::marker::PhantomData;
> >>> +use core::mem::ManuallyDrop;
> >>> +use core::mem::MaybeUninit;
> >>> +use core::ops::{Deref, DerefMut};
> >>> +use core::pin::Pin;
> >>> +use core::result::Result;
> >>> +
> >>> +use crate::types::Unique;
> >>> +
> >>> +/// The kernel's [`Box`] type.
> >>> +///
> >>> +/// `Box` provides the simplest way to allocate memory for a generic=
 type with one of the kernel's
> >>> +/// allocators, e.g. `Kmalloc`, `Vmalloc` or `KVmalloc`.
> >>> +///
> >>> +/// For non-zero-sized values, a [`Box`] will use the given allocato=
r `A` for its allocation. For
> >>> +/// the most common allocators the type aliases `KBox`, `VBox` and `=
KVBox` exist.
> >>> +///
> >>> +/// It is valid to convert both ways between a [`Box`] and a raw poi=
nter allocated with any
> >>> +/// `Allocator`, given that the `Layout` used with the allocator is =
correct for the type.
> >>> +///
> >>> +/// For zero-sized values the [`Box`]' pointer must be `dangling_mut=
::<T>`; no memory is allocated.
> >>
> >> Why do we need this to be in the docs?
> >
> > Probably not - do you suggest to remove it entirely? Otherwise, where d=
o you
> > think we should move it?
>
> I would remove it, since it's just implementation detail and
> allocator-dependent.
>
> >>> +impl<T, A> Box<T, A>
> >>> +where
> >>> +    T: ?Sized,
> >>> +    A: Allocator,
> >>> +{
> >>> +    /// Constructs a `Box<T, A>` from a raw pointer.
> >>> +    ///
> >>> +    /// # Safety
> >>> +    ///
> >>> +    /// `raw` must point to valid memory, previously allocated with =
`A`, and at least the size of
> >>> +    /// type `T`.
> >>
> >> With this requirement and the invariant on `Box`, I am lead to believe
> >> that you can't use this for ZSTs, since they are not allocated with `A=
`.
> >> One solution would be to adjust this requirement. But I would rather u=
se
> >> a different solution: we move the dangling pointer stuff into the
> >> allocator and also call it when `T` is a ZST (ie don't special case th=
em
> >> in `Box` but in the impls of `Allocator`). That way this can stay as-i=
s
> >> and the part about ZSTs in the invariant can be removed.
> >
> > Actually, we already got that. Every zero sized allocation will return =
a
> > dangling pointer. However, we can't call `Allocator::free` with (any) d=
angling
> > pointer though.
>
> The last part is rather problematic in my opinion, since the safety
> requirements of the functions in `Allocator` don't ensure that you're
> not allowed to do it. We should make it possible to free dangling
> pointers that were previously "allocated" by the allocator (ie returned
> by `realloc`).
> Maybe we do need an `old_layout` parameter for that (that way we can
> also `debug_assert_eq!(old_layout.align(), new_layout.align())`).

The std allocators generally prohibit zero sized allocations, so it
seems sensible for us to do the same?

Alice
