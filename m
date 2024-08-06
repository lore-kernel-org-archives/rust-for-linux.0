Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D18341C72
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Aug 2024 16:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722963099; cv=none; b=Tn3DCGnMPw0TVwrB8uJ50zrjVX2mcDi+uvO4WMoyA/QTxgpBUpKFwpE9gqK7Z/0rsmyh72QGb/m2fzSu02aproWKD0RCe+L3LedBCCDpXdO3r0eIcAF83B80O25P5nHp+1VYUEDqowt/ja88D3NabDVgxLpximywGkG+PnpaWCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722963099; c=relaxed/simple;
	bh=3B/cS1HixqiX0LatxuFzAo9x5ehrvJQai1VFU+GFkbs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pTYlmbCHfFOaqqu3eMXlStTs8utCpkAU/VaRNwb0kV5ND8CnN+F3rhKcNkc2dLM1S9kC0z+CB1348TsOCbNbwOg+0OWb/6ROI7qqMGyVsPOZBqC+P6VMSrTF7TV4cohPeEnJeaWIfBl/sRauFzuW5mnbx6ykI4yjE3E+r55tPtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=lzweRFsj; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="lzweRFsj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1722963094; x=1723222294;
	bh=j+sH+MxUzfSpzuSfOiW6jt862OOTAwTU+CEagi5eEQM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lzweRFsj7ZhgrySbT1kblqrMe7241NZ2TAcVRcW3CrdMBFx37UfWYaYaYUjA95p9v
	 R/MOKjHBSsZeolLhFK3HmgMsxlz6TUrqCfReAPh3aXB2+mjM0KvU8re9JQXJJyoXT0
	 x86EFZ+bSr9epilX+yPdg+De1rOwIf5aNSyH7WCAtoox/ztKv3/1hhki/K+xOJuv9F
	 nfd5Dqjirta6y8bg87B0+MAqgyz/vExjIMarRsZ7jFTPv9t9yQbNQUU4+pgF2foqEC
	 2U5nCbkgT0X+yUDYhLKEVXYLAnmg4uKnuxmjuHexeDTD1e5vFhlIIUuCgdSNiC9+gy
	 XvsJa2XKIBbtQ==
Date: Tue, 06 Aug 2024 16:51:28 +0000
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 04/28] rust: alloc: implement `Allocator` for `Kmalloc`
Message-ID: <fe982cb6-4910-4ba2-ae4d-892514c9e7f7@proton.me>
In-Reply-To: <20240805152004.5039-5-dakr@kernel.org>
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-5-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 60940ad762dd5fe06aa5d084a0527ef2e1169f23
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05.08.24 17:19, Danilo Krummrich wrote:
> Implement `Allocator` for `Kmalloc`, the kernel's default allocator,
> typically used for objects smaller than page size.
>=20
> All memory allocations made with `Kmalloc` end up in `krealloc()`.
>=20
> It serves as allocator for the subsequently introduced types `KBox` and
> `KVec`.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/helpers.c                 |  3 +-
>  rust/kernel/alloc.rs           |  2 +-
>  rust/kernel/alloc/allocator.rs | 68 +++++++++++++++++++++++++++++++++-
>  3 files changed, 69 insertions(+), 4 deletions(-)
>=20
> diff --git a/rust/helpers.c b/rust/helpers.c
> index 92d3c03ae1bd..9f7275493365 100644
> --- a/rust/helpers.c
> +++ b/rust/helpers.c
> @@ -193,8 +193,7 @@ void rust_helper_init_work_with_key(struct work_struc=
t *work, work_func_t func,
>  }
>  EXPORT_SYMBOL_GPL(rust_helper_init_work_with_key);
>=20
> -void * __must_check __realloc_size(2)
> -rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
> +void *rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flag=
s)
>  {
>  =09return krealloc(objp, new_size, flags);
>  }
> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> index 8a71a589469d..bc01a17df5e0 100644
> --- a/rust/kernel/alloc.rs
> +++ b/rust/kernel/alloc.rs
> @@ -4,7 +4,7 @@
>=20
>  #[cfg(not(test))]
>  #[cfg(not(testlib))]
> -mod allocator;
> +pub mod allocator;
>  pub mod box_ext;
>  pub mod vec_ext;
>=20
> diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator=
.rs
> index 2c1eae25da84..c6ad1dd59dd0 100644
> --- a/rust/kernel/alloc/allocator.rs
> +++ b/rust/kernel/alloc/allocator.rs
> @@ -5,8 +5,16 @@
>  use super::{flags::*, Flags};
>  use core::alloc::{GlobalAlloc, Layout};
>  use core::ptr;
> +use core::ptr::NonNull;
>=20
> -struct Kmalloc;
> +use crate::alloc::{AllocError, Allocator};
> +use crate::bindings;
> +
> +/// The contiguous kernel allocator.
> +///
> +/// The contiguous kernel allocator only ever allocates physically conti=
guous memory through
> +/// `bindings::krealloc`.
> +pub struct Kmalloc;
>=20
>  /// Returns a proper size to alloc a new object aligned to `new_layout`'=
s alignment.
>  fn aligned_size(new_layout: Layout) -> usize {
> @@ -40,6 +48,64 @@ pub(crate) unsafe fn krealloc_aligned(ptr: *mut u8, ne=
w_layout: Layout, flags: F
>      }
>  }
>=20
> +/// # Invariants
> +///
> +/// One of the following `krealloc`, `vrealloc`, `kvrealloc`.
> +struct ReallocFunc(
> +    unsafe extern "C" fn(*const core::ffi::c_void, usize, u32) -> *mut c=
ore::ffi::c_void,
> +);
> +
> +impl ReallocFunc {
> +    // INVARIANT: `krealloc` satisfies the type invariants.

This INVARIANT comment should be moved one line downwards.

> +    fn krealloc() -> Self {
> +        Self(bindings::krealloc)
> +    }
> +
> +    /// # Safety
> +    ///
> +    /// This method has the exact same safety requirements as `Allocator=
::realloc`.

I would remove "exact", I don't think we want to mean "almost the same"
when we write just "same".

> +    unsafe fn call(
> +        &self,
> +        ptr: Option<NonNull<u8>>,
> +        layout: Layout,
> +        flags: Flags,
> +    ) -> Result<NonNull<[u8]>, AllocError> {
> +        let size =3D aligned_size(layout);
> +        let ptr =3D match ptr {
> +            Some(ptr) =3D> ptr.as_ptr(),
> +            None =3D> ptr::null(),
> +        };
> +
> +        // SAFETY: `ptr` is valid by the safety requirements of this fun=
ction.

"`ptr` is either NULL or valid by the safety requirements of this
function."

> +        let raw_ptr =3D unsafe {
> +            // If `size =3D=3D 0` and `ptr !=3D NULL` the memory behind =
the pointer is freed.
> +            self.0(ptr.cast(), size, flags.0).cast()
> +        };
> +
> +        let ptr =3D if size =3D=3D 0 {
> +            NonNull::dangling()

If we call `realloc(Some(ptr), <layout with size =3D 0>, ...)`, then this
leaks the pointer returned by the call to `self.0` above. I don't know
what the return value of the different functions are that can appear in
`self.0`, do they return NULL?

What about the following sequence:

    let ptr =3D realloc(None, <layout with size =3D 0>, ...);
    let ptr =3D realloc(Some(ptr), <layout with size =3D 0>, ...);

Then the above call to `self.0` is done with a dangling pointer, can the
functions that appear in `self.0` handle that?

> +        } else {
> +            NonNull::new(raw_ptr).ok_or(AllocError)?
> +        };
> +
> +        Ok(NonNull::slice_from_raw_parts(ptr, size))
> +    }
> +}
> +
> +unsafe impl Allocator for Kmalloc {
> +    unsafe fn realloc(
> +        ptr: Option<NonNull<u8>>,
> +        layout: Layout,
> +        flags: Flags,
> +    ) -> Result<NonNull<[u8]>, AllocError> {
> +        let realloc =3D ReallocFunc::krealloc();
> +
> +        // SAFETY: If not `None`, `ptr` is guaranteed to point to valid =
memory, which was previously
> +        // allocated with this `Allocator`.

What about the other requirements? (they should be satisfied, since they
are also requirements for calling this function)

> +        unsafe { realloc.call(ptr, layout, flags) }

If you make `ReallocFunc::krealloc()` into a constant
`ReallocFunc::KREALLOC`, then we could avoid the let binding above.

---
Cheers,
Benno

> +    }
> +}
> +
>  unsafe impl GlobalAlloc for Kmalloc {
>      unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
>          // SAFETY: `ptr::null_mut()` is null and `layout` has a non-zero=
 size by the function safety
> --
> 2.45.2
>=20

