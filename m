Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A55D32BF3C
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 12:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755607656; cv=pass; b=SrNik1mxPoubgrfanzvykpI276606GWCf9gPBeJE0+RW5QUfdwOcTrQD1CaAaa6cDfPQTvMoy+zPb6D6wuC4EAYT0jlPJQ7+nWtjUBZblxiCi12kZTyE8Y1GfMzeHsLI5TjYLwmkEHPi8gTUBOeffplq9mEQfRvuZjsLgf87Fok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755607656; c=relaxed/simple;
	bh=MvwQDykEH4wdC5Ltg0yyHd5+ufRMRdNmM/iwhglKpKw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qx4V+7JkizpwY5dtiw8tCjRiemqRrQv352M1i3wyWuo0e6COI0GBCFng8vzpYKf+JMw8lhJtTFRs9G1GLK7YjnZR+iXb88Ru8OAXC9JPEEmXoXEyJSeLkoXGS8IRd8G1563HOqQ1IgQAsFWQxZoxVOboBgwaWaoOTsrUXnpa82w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=WGxGBoKv; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="WGxGBoKv"
ARC-Seal: i=1; a=rsa-sha256; t=1755607620; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SqJ7uQzNvllR+qwcgGdj6EvIz0ocYPhNDhsexi0NLgaMFkzAe+E5JKImwS3tbndXlKCT6GPq2FnRWPW1rGfr80lb6dze8+0sqkuZimvEpFtTDGaPFaWSUD/+egvDVcH0VuRM1ouEZNGlAV+48wmQDfpNmDGwUvkxk1/oBxHKn3Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755607620; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XlKkqw00qXcQFQQtQ7O90qVVORR1lxsaHMIrqpqnL48=; 
	b=Dnam3eQ+f01lyOFy6qMgT0I/Ld+Ecog+8d4/6/CbqZET57d7tc0xPTCi+HgPLvlVf84UJmF16niZxVe/NmKRKRIDz3Vto4NMvd7xL6C7CWILtm2MjiRvRfT84uJ0gXKWqQFCgRzhjWzdnvIv1bbxdm9PlUA1ZCD/N37i47f5FbM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755607620;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=XlKkqw00qXcQFQQtQ7O90qVVORR1lxsaHMIrqpqnL48=;
	b=WGxGBoKvPCKC+PlOvVW2BTUFFtsjlUf66NjPGfJA5IUmcL/xYgK7RUWlRVtmbUwa
	QeY9rlbvCC/0hj4k6LGTWD6urkBLIwjInd+4EtAxiBF7+8VnkMdHumEz8H8aA8P1O0G
	gEMohBfCJGr7iNMnzG5WFsuSGWXREAs4Nu2Y6K5M=
Received: by mx.zohomail.com with SMTPS id 175560761810520.37760305370307;
	Tue, 19 Aug 2025 05:46:58 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 2/7] rust: alloc: vmalloc: implement Vmalloc::to_page()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250814093427.19629-3-dakr@kernel.org>
Date: Tue, 19 Aug 2025 09:46:41 -0300
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
Message-Id: <7710597B-64CF-45EE-8755-0DCCF88AD69F@collabora.com>
References: <20250814093427.19629-1-dakr@kernel.org>
 <20250814093427.19629-3-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 14 Aug 2025, at 06:33, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> Implement an abstraction of vmalloc_to_page() for subsequent use in =
the
> AsPageIter implementation of VBox and VVec.
>=20
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> rust/kernel/alloc/allocator.rs | 49 ++++++++++++++++++++++++++++++++++
> 1 file changed, 49 insertions(+)
>=20
> diff --git a/rust/kernel/alloc/allocator.rs =
b/rust/kernel/alloc/allocator.rs
> index aa2dfa9dca4c..2315f5063011 100644
> --- a/rust/kernel/alloc/allocator.rs
> +++ b/rust/kernel/alloc/allocator.rs
> @@ -15,6 +15,7 @@
>=20
> use crate::alloc::{AllocError, Allocator};
> use crate::bindings;
> +use crate::page;
> use crate::pr_warn;
>=20
> /// The contiguous kernel allocator.
> @@ -140,6 +141,54 @@ unsafe fn realloc(
>     }
> }
>=20
> +impl Vmalloc {
> +    /// Convert a pointer to a [`Vmalloc`] allocation to a =
[`page::BorrowedPage`].
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use core::ptr::{NonNull, from_mut};
> +    /// # use kernel::{page, prelude::*};
> +    /// use kernel::alloc::allocator::Vmalloc;
> +    ///
> +    /// let mut vbox =3D VBox::<[u8; =
page::PAGE_SIZE]>::new_uninit(GFP_KERNEL)?;
> +    ///
> +    /// {
> +    ///     // SAFETY: By the type invariant of `Box` the inner =
pointer of `vbox` is non-null.
> +    ///     let ptr =3D unsafe { NonNull::new_unchecked(from_mut(&mut =
*vbox)) };
> +    ///
> +    ///     // SAFETY:
> +    ///     // `ptr` is a valid pointer to a `Vmalloc` allocation.
> +    ///     // `ptr` is valid for the entire lifetime of `page`.
> +    ///     let page =3D unsafe { Vmalloc::to_page(ptr.cast()) };
> +    ///
> +    ///     // SAFETY: There is no concurrent read or write to the =
same page.
> +    ///     unsafe { page.fill_zero_raw(0, page::PAGE_SIZE)? };
> +    /// }
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to a [`Vmalloc`] allocation.
> +    /// - `ptr` must remain valid for the entire duration of `'a`.
> +    pub unsafe fn to_page<'a>(ptr: NonNull<u8>) -> =
page::BorrowedPage<'a> {
> +        // SAFETY: `ptr` is a valid pointer to `Vmalloc` memory.
> +        let page =3D unsafe { =
bindings::vmalloc_to_page(ptr.as_ptr().cast()) };
> +
> +        // SAFETY: `vmalloc_to_page` returns a valid pointer to a =
`struct page` for a valid pointer
> +        // to `Vmalloc` memory.
> +        let page =3D unsafe { NonNull::new_unchecked(page) };
> +
> +        // SAFETY:
> +        // - `page` is a valid pointer to a `struct page`, given that =
by the safety requirements of
> +        //   this function `ptr` is a valid pointer to a `Vmalloc` =
allocation.
> +        // - By the safety requirements of this function `ptr` is =
valid for the entire lifetime of
> +        //   `'a`.
> +        unsafe { page::BorrowedPage::from_raw(page) }
> +    }
> +}
> +
> // SAFETY: `realloc` delegates to `ReallocFunc::call`, which =
guarantees that
> // - memory remains valid until it is explicitly freed,
> // - passing a pointer to a valid memory allocation is OK,
> --=20
> 2.50.1
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
