Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13575274668
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755609107; cv=pass; b=Zeb1rl6jkmc/y8xle5s7kGJaJJbw0PWsVqDRRIoKhKb6XGrNNI808z/frm8gBzc+2rkK3DgaeXKK0RNsMX1l0cEmQv1dg9vFsylkq2CEYgXoiSDfC2fQHFpCwWGcHcFbF0TRfC73VQMuvcc07KGNg3OFzoGD03AaKMRq+Q9tWdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755609107; c=relaxed/simple;
	bh=EIgF90ImqvfqS0k4WD+Hzy+ceT8qOeHdYyOmbMuEBJs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=l1hDU31GBbAE8TMrSMtNqPNhijtyY1JzECE4XWX/Lwou5UTD+7hCliFhHcWsObHlBvOrUcCLJhbYDGx+NDE4Vodmvpa5Bxxf7DUVx9xbxRV2Ys0/EY7LluOgz3vzqOIVCDmLi/xfsWZEXNl5Heg0118EBQeQLg1GNmdvrQbSkoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=lZtC8ZUw; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="lZtC8ZUw"
ARC-Seal: i=1; a=rsa-sha256; t=1755609087; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mv9xJPpvXsG1/AEHTV636nm53sowhC2jn1TiUEBN9o/86KnNftDnXmXAJ/Ho7aQXUJl4ylO3VaDr526M3Ub01I7A1FH7tM0PGOoHKKwfbxZJXQ1W6SnQHQ2fC29gga88kvPHS8KQqmSBXB6o0/d5+8bxAs8nY2ed/VWfDBukP8I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755609087; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VwsIT/jEVkzjhPNGwOT3MXKFS3HWlc3OfIZTDs273/M=; 
	b=m9qxoSuU4qpA01GNDiM3EIK/h8FTcBnDOed6/Kb1gI9iLw3vcNhOitrX6vAwJ+gVk+nEcW5VGUxet5hTPIK9SdAnbSEbUCj1Nmt4wNMNKP4wreLxuFz4gd1lfUj8Zgqm4/lnIOdH0FYM7M85Ki/qDoY30XcSdd7rxOgAmF6QWnY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755609087;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=VwsIT/jEVkzjhPNGwOT3MXKFS3HWlc3OfIZTDs273/M=;
	b=lZtC8ZUw9b6/juchBKHzF9FphD7JXHSxGjJu7NM+qx7FHveSBkBmp+Q+zI0WxWvW
	rpF1CCTinXn/JemqP75845twgJuOkO07FFhHFXfywEiOa1OShaWil6Uvs2lb7Bhk4iE
	fxwtaEsc3Hg9Y5WyjxR9FW1QOSbUbBopHxwJ3U1k=
Received: by mx.zohomail.com with SMTPS id 1755609084678611.1748740546791;
	Tue, 19 Aug 2025 06:11:24 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 7/7] rust: alloc: kvec: implement AsPageIter for VVec
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250814093427.19629-8-dakr@kernel.org>
Date: Tue, 19 Aug 2025 10:11:07 -0300
Cc: lorenzo.stoakes@oracle.com,
 vbabka@suse.cz,
 Liam.Howlett@oracle.com,
 urezki@gmail.com,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 aliceryhl@google.com,
 tmgross@umich.edu,
 abdiel.janulgue@gmail.com,
 acourbot@nvidia.com,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <38EE2630-B4E7-4256-B8BF-7179836420C1@collabora.com>
References: <20250814093427.19629-1-dakr@kernel.org>
 <20250814093427.19629-8-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 14 Aug 2025, at 06:33, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> Implement AsPageIter for VVec; this allows to iterate and borrow the
> backing pages of a VVec. This, for instance, is useful in combination
> with VVec backing a scatterlist.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> rust/kernel/alloc/kvec.rs | 40 ++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 39 insertions(+), 1 deletion(-)
>=20
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index 3c72e0bdddb8..ac438e70a1ed 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -3,10 +3,11 @@
> //! Implementation of [`Vec`].
>=20
> use super::{
> -    allocator::{KVmalloc, Kmalloc, Vmalloc},
> +    allocator::{KVmalloc, Kmalloc, Vmalloc, VmallocPageIter},
>     layout::ArrayLayout,
>     AllocError, Allocator, Box, Flags,
> };
> +use crate::page::AsPageIter;
> use core::{
>     borrow::{Borrow, BorrowMut},
>     fmt,
> @@ -1017,6 +1018,43 @@ fn into_iter(self) -> Self::IntoIter {
>     }
> }
>=20
> +/// # Examples
> +///
> +/// ```
> +/// # use kernel::prelude::*;
> +/// use kernel::alloc::allocator::VmallocPageIter;
> +/// use kernel::page::{AsPageIter, PAGE_SIZE};
> +///
> +/// let mut vec =3D VVec::<u8>::new();
> +///
> +/// assert!(vec.page_iter().next().is_none());
> +///
> +/// vec.reserve(PAGE_SIZE, GFP_KERNEL)?;
> +///
> +/// let page =3D vec.page_iter().next().expect("At least one page =
should be available.\n");
> +///
> +/// // SAFETY: There is no concurrent read or write to the same page.
> +/// unsafe { page.fill_zero_raw(0, PAGE_SIZE)? };
> +/// # Ok::<(), Error>(())
> +/// ```
> +impl<T> AsPageIter for VVec<T> {
> +    type Iter<'a>
> +        =3D VmallocPageIter<'a>
> +    where
> +        T: 'a;
> +
> +    fn page_iter(&mut self) -> Self::Iter<'_> {
> +        let ptr =3D self.ptr.cast();
> +        let size =3D self.layout.size();
> +
> +        // SAFETY:
> +        // - `ptr` is a valid pointer to the beginning of a `Vmalloc` =
allocation.
> +        // - `ptr` is guaranteed to be valid for the lifetime of =
`'a`.
> +        // - `size` is the size of the `Vmalloc` allocation `ptr` =
points to.
> +        unsafe { VmallocPageIter::new(ptr, size) }
> +    }
> +}
> +
> /// An [`Iterator`] implementation for [`Vec`] that moves elements out =
of a vector.
> ///
> /// This structure is created by the [`Vec::into_iter`] method on =
[`Vec`] (provided by the
> --=20
> 2.50.1
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

