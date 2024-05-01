Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7328C39FFB
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 08:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714553101; cv=none; b=iQP110k9AUm6hUWDdOqn7zYKrjGgXUIJ5QDEc5IcGHGuP98ewJuWJ/2e8LRa7XiuHRSb/v9gC9LvKMoro8IVXfJkAl/Hx7tpfJEnb7TWmiyyqyj8tk+w7E5rTli/jMWOjELSHp/XLqHsso+wlMddlH1cHClLd4cpy69usyHSMaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714553101; c=relaxed/simple;
	bh=3JF0tq/l0W4lM8W5h7zSdOhuBdVBmo6XsanXSlsGD/g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bKF/6CgFfLjp980aLcb7EnW7QuqrWjEAXwu/cRzM0X/KGot/JhuOwtvMZyhW+CggwJqwximLiKILTQQVOn4aJz1pqwDUt/xMd9xLfiqE9bNYsxqCoXgTJ6yIadNSlWWPB7w6uX1Jctv4sJjtVHKn7Z0IRTNt3fG8w4dNgGMOe98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=PEW2BHjs; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="PEW2BHjs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=7pd6f6sclnb4fkpgf5w422xrmi.protonmail; t=1714553090; x=1714812290;
	bh=jR49Fw8B7gmjFldH2f3oEg6MZxWWp6Bcb7x7cxUeYjE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PEW2BHjsI5Al8l2s00Cf3vkEV2BueLmAhTOVYupfjWSz2pkB3J6lQCnltipqMJRKA
	 L+2GoUT94bVla/lPpFyOKdwhl6AJpw1e2qe8CGPnB+pUMe4qy6Aq1lM86HqfPJUtoM
	 z6hZtBhRdvDx1qq0jrVlU7kz1sLEt+QiuW6enNBKJ5QhTE8f3II52i/NRgRYXIt9ss
	 00beeo14D5HeuIE3azrD3EuSCi03lENGRBEK5YtW6cLRyF/YktJJ4QQO1uW9FuHQ1j
	 zc0sSjlVK6FSZECTkSHro1WR1IDTvowhHRsdm2I9494UIMgymCl5uE9C8EZyHA1+Yk
	 oAfmkYcD0fMcg==
Date: Wed, 01 May 2024 08:44:46 +0000
To: Danilo Krummrich <dakr@redhat.com>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, ajanulgu@redhat.com, zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH WIP 5/8] rust: alloc: implement AllocatorWithFlags for KernelAllocator
Message-ID: <d08e2061-3f6b-403a-8bcf-6527ec2443cf@proton.me>
In-Reply-To: <20240429201202.3490-6-dakr@redhat.com>
References: <20240429201202.3490-1-dakr@redhat.com> <20240429201202.3490-6-dakr@redhat.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 9c8aa541264f6831a457048ad38ad5a5d385d533
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 29.04.24 22:11, Danilo Krummrich wrote:
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  rust/kernel/alloc.rs           |  2 +-
>  rust/kernel/alloc/allocator.rs | 38 ++++++++++++++++++++++++++++++++--
>  2 files changed, 37 insertions(+), 3 deletions(-)
>=20
> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> index ec45ba8f77ce..12c6c4e423f5 100644
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
> index 236100649ae1..173347ff018a 100644
> --- a/rust/kernel/alloc/allocator.rs
> +++ b/rust/kernel/alloc/allocator.rs
> @@ -3,12 +3,14 @@
>  //! Allocator support.
>=20
>  use super::{flags::*, Flags};
> -use core::alloc::{GlobalAlloc, Layout};
> +use core::alloc::{GlobalAlloc, Layout, Allocator, AllocError};
>  use core::ptr;
> +use core::ptr::NonNull;
>=20
>  use crate::bindings;
> +use crate::alloc::AllocatorWithFlags;
>=20
> -struct KernelAllocator;
> +pub struct KernelAllocator;
>=20
>  pub(crate) fn aligned_size(new_layout: Layout) -> usize {
>      // Customized layouts from `Layout::from_size_align()` can have size=
 < align, so pad first.
> @@ -89,6 +91,38 @@ unsafe fn alloc_zeroed(&self, layout: Layout) -> *mut =
u8 {
>      }
>  }
>=20
> +unsafe impl Allocator for KernelAllocator {
> +    fn allocate(&self, layout: Layout) -> Result<NonNull<[u8]>, AllocErr=
or> {
> +        self.default_allocate(layout)
> +    }
> +
> +    fn allocate_zeroed(&self, layout: Layout) -> Result<NonNull<[u8]>, A=
llocError> {
> +        self.default_allocate_zeroed(layout)
> +    }
> +
> +    unsafe fn deallocate(&self, ptr: NonNull<u8>, layout: Layout) {
> +        unsafe { self.dealloc(ptr.as_ptr(), layout) }
> +    }
> +}
> +
> +unsafe impl AllocatorWithFlags for KernelAllocator {
> +    unsafe fn alloc_flags(&self, layout: Layout, flags: Flags) -> Result=
<NonNull<[u8]>, AllocError>
> +    {
> +        unsafe { self.realloc_flags(ptr::null_mut(), 0, layout, flags) }
> +    }
> +
> +    unsafe fn realloc_flags(&self, ptr: *mut u8, _old_size: usize, layou=
t: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError>
> +    {
> +        let size =3D aligned_size(layout);
> +
> +        unsafe {
> +            let raw_ptr =3D krealloc(ptr, size, flags);

I looked at the safety requirements of `krealloc`, it needs that
`size` is non-zero. But who guarantees that? I could call
`KernelAllocator::allocate()` with a zero-sized layout, since it is a
safe function.

--=20
Cheers,
Benno

> +            let ptr =3D NonNull::new(raw_ptr).ok_or(AllocError)?;
> +            Ok(NonNull::slice_from_raw_parts(ptr, size))
> +        }
> +    }
> +}
> +
>  #[global_allocator]
>  static ALLOCATOR: KernelAllocator =3D KernelAllocator;
>=20
> --
> 2.44.0
>=20

