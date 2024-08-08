Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF9578274
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Aug 2024 09:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723109757; cv=none; b=qHlAJCPC9+utevOLvnwqycqvmu4MyQkWux++U7bemIfViXEn2+efy8rSnE09XanEcVCNjc6WZbz+Ui0GNH5k7rwzJs8FuJUeW44GvJFGzb+jTfPUYbvAw0v3V/tF32642CYBz4ECqMeihHwFfUtLtxPSOe5eBf67zz1Hs9WsF7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723109757; c=relaxed/simple;
	bh=kRvATRznCe03tSFG6V3ijYfz8RPS8n231nCakUDuoqM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cocPrm9ev2xpF8GmggppE+L0v/iGHtH7parFdTtPd0OUu55CWLTfe10N2hzo6d3zW5SKi/clXpMDUN4KfyiRvHo6zbIP5UdhXEisp9pvDJXOU0ksl+y12c/dVDSjCP3ppM9V+Cpx85efyRGFH25qR51CLvwrny1bBDbsPVh3OTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=UiI+1r2c; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="UiI+1r2c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1723109753; x=1723368953;
	bh=US9rdegIAc82V+TxLOcDfuwNwPnLu8Gw+YCaNvm2ark=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UiI+1r2clQTQFyaNr5MqdhEmaBHjHn7hE7yax0pfTEoqmTsdvH4b8Qd0icM68k3XY
	 +T+NmDm6Z1IPuU5qLjb3eSG405g3xIrxLpGxOG/SlQKjWiDucmrxS1bd58pC9IaZl6
	 ss9QxxwLPyO5qLorGmEuJXO+ThF3h+aGdA08J6N93QSOhZEL4+0IAcmL7m2ApQyfMj
	 SLswfTEANqg2GTYGUtZWUwo4cEmCFQdvw6tVhdQVdzgf+vYPxQ89vbGX7gUOn3y52R
	 sKflRXsCsBFLbYPIW9J5C3jW71hd0a9S6KjYGRF9uriFgxYwIU6Ee9KCbycVKkE+Ww
	 qiOjLMsDWN1wQ==
Date: Thu, 08 Aug 2024 09:35:47 +0000
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 25/28] rust: alloc: implement `Cmalloc` in module allocator_test
Message-ID: <dcf75b19-9900-4aaa-8ff7-36b08baa18f2@proton.me>
In-Reply-To: <20240805152004.5039-26-dakr@kernel.org>
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-26-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 48c105257adb4a139f79522835a3d1711dc33b2f
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05.08.24 17:19, Danilo Krummrich wrote:
> So far the kernel's `Box` and `Vec` types can't be used by userspace
> test cases, since all users of those types (e.g. `CString`) use kernel
> allocators for instantiation.
>=20
> In order to allow userspace test cases to make use of such types as
> well, implement the `Cmalloc` allocator within the allocator_test module
> and type alias all kernel allocators to `Cmalloc`. The `Cmalloc`
> allocator uses libc's realloc() function as allocator backend.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> I know, having an `old_size` parameter would indeed help implementing `Cm=
alloc`.
>=20
> However, I really don't want test infrastructure to influence the design =
of
> kernel internal APIs.
>=20
> Besides that, adding the `old_size` parameter would have the consequence =
that
> we'd either need to honor it for kernel allocators too (which adds anothe=
r
> source of potential failure) or ignore it for all kernel allocators (whic=
h
> potentially tricks people into taking wrong assumptions on how the API wo=
rks).
> ---
>  rust/kernel/alloc/allocator_test.rs | 91 ++++++++++++++++++++++++++---
>  1 file changed, 84 insertions(+), 7 deletions(-)
>=20
> diff --git a/rust/kernel/alloc/allocator_test.rs b/rust/kernel/alloc/allo=
cator_test.rs
> index 1b2642c547ec..05fd75b89238 100644
> --- a/rust/kernel/alloc/allocator_test.rs
> +++ b/rust/kernel/alloc/allocator_test.rs
> @@ -2,20 +2,97 @@
>=20
>  #![allow(missing_docs)]
>=20
> -use super::{AllocError, Allocator, Flags};
> +use super::{flags::*, AllocError, Allocator, Flags};
>  use core::alloc::Layout;
> +use core::ptr;
>  use core::ptr::NonNull;
>=20
> -pub struct Kmalloc;
> +pub struct Cmalloc;
> +pub type Kmalloc =3D Cmalloc;
>  pub type Vmalloc =3D Kmalloc;
>  pub type KVmalloc =3D Kmalloc;
>=20
> -unsafe impl Allocator for Kmalloc {
> +extern "C" {
> +    #[link_name =3D "aligned_alloc"]
> +    fn libc_aligned_alloc(align: usize, size: usize) -> *mut core::ffi::=
c_void;
> +
> +    #[link_name =3D "free"]
> +    fn libc_free(ptr: *mut core::ffi::c_void);
> +
> +    // Do not use this function for production code! For test cases only=
 it's
> +    // probably fine if used with care.
> +    #[link_name =3D "malloc_usable_size"]
> +    fn libc_malloc_usable_size(ptr: *mut core::ffi::c_void) -> usize;
> +}
> +
> +unsafe impl Allocator for Cmalloc {
> +    fn alloc(layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, Allo=
cError> {
> +        let layout =3D layout.pad_to_align();
> +
> +        // SAFETY: Returns either NULL or a pointer to a memory allocati=
on that satisfies or
> +        // exceeds the given size and alignment requirements.
> +        let raw_ptr =3D unsafe { libc_aligned_alloc(layout.align(), layo=
ut.size()) } as *mut u8;
> +
> +        if flags.contains(__GFP_ZERO) && !raw_ptr.is_null() {
> +            // SAFETY: `raw_ptr` points to memory successfully allocated=
 with `libc_aligned_alloc`.
> +            let size =3D unsafe { libc_malloc_usable_size(raw_ptr.cast()=
) };
> +
> +            // SAFETY: `raw_ptr` points to memory successfully allocated=
 with `libc_aligned_alloc`
> +            // of at least `size` bytes.
> +            unsafe { core::ptr::write_bytes(raw_ptr, 0, size) };
> +        }
> +
> +        let ptr =3D if layout.size() =3D=3D 0 {
> +            NonNull::dangling()

Why do you call `libc_aligned_alloc` when you return `dangling()`
anyways when size is zero? I would move this check upwards.

> +        } else {
> +            NonNull::new(raw_ptr).ok_or(AllocError)?

Would also make sense to do this above the null check.

> +        };
> +
> +        Ok(NonNull::slice_from_raw_parts(ptr, layout.size()))
> +    }
> +
>      unsafe fn realloc(
> -        _ptr: Option<NonNull<u8>>,
> -        _layout: Layout,
> -        _flags: Flags,
> +        ptr: Option<NonNull<u8>>,
> +        layout: Layout,
> +        flags: Flags,
>      ) -> Result<NonNull<[u8]>, AllocError> {
> -        panic!();
> +        let layout =3D layout.pad_to_align();
> +        let src: *mut u8 =3D if let Some(src) =3D ptr {
> +            src.as_ptr().cast()
> +        } else {
> +            ptr::null_mut()
> +        };
> +
> +        if layout.size() =3D=3D 0 {
> +            // SAFETY: `src` is either NULL or has previously been alloc=
atored with this
> +            // `Allocator`.
> +            unsafe { libc_free(src.cast()) };
> +
> +            return Ok(NonNull::slice_from_raw_parts(NonNull::dangling(),=
 0));
> +        }
> +
> +        let dst =3D Self::alloc(layout, flags)?;
> +
> +        if src.is_null() {
> +            return Ok(dst);
> +        }
> +
> +        // SAFETY: `src` is either NULL or has previously been allocator=
ed with this `Allocator`.
> +        let old_size =3D unsafe { libc_malloc_usable_size(src.cast()) };

Citing man malloc_usable_size(3):

    CAVEATS
        The value returned by malloc_usable_size() may be greater than
        the requested size of the allocation because of various internal
        implementation details, none of which the programmer should rely
        on.  This function is intended to only be used for diagnostics
        and statistics; writing to the excess memory without first
        calling realloc(3) to resize the allocation is not supported.
        The returned value is only valid at the time of the call.

While you don't write, you might read below, which might not be OK?

---
Cheers,
Benno

> +
> +        // SAFETY: `src` has previously been allocated with this `Alloca=
tor`; `dst` has just been
> +        // newly allocated. Taking the minimum of their sizes guarantees=
 that we do not exceed
> +        // either bounds.
> +        unsafe {
> +            // Always copy -- do not rely on potential spare memory repo=
rted by
> +            // malloc_usable_size() which technically may still be suffi=
cient.
> +            ptr::copy_nonoverlapping(
> +                src,
> +                dst.as_ptr().cast(),
> +                core::cmp::min(layout.size(), old_size),
> +            )
> +        };
> +
> +        Ok(dst)
>      }
>  }
> --
> 2.45.2
>=20

