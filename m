Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E297340D8A
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 12:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755608355; cv=pass; b=ejpMwZE2VxEgfjFMqDq8OUx2jI/8ENpCEeHNcup4GqiZgya3Q0U2oStd26aNZKZZpe1C4PMMtuNXD9GtogtaWoJ8GTSEu20/JGPMXNo0sgpeySIELjuCyEEAhf3JAFtPPzVyb8oVDRJS6ZxUT8ukLo56gROoRz6rbv1R8d1Gv50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755608355; c=relaxed/simple;
	bh=3WzHYms5RLMNdcSAKtFn+pj5lyKr0E2Zb9hJhyh5Qqk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=M+q8b/X03LWkQ3KM9G0zakhMDMYVHVT3/2yh5aRXuhoK6onrPLtR2JZ1/XdxhdnlgqnIBKqDt4c3PBWDdGtce6FhNJYd6U+h2ToYtGIh48d9SkVh9ZMlI2ASdoFZJU1O3mlrYTSSm7viuPRIrdYNM3WPhT8OCkbTz0pv3knyxUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=eP+gJQOf; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="eP+gJQOf"
ARC-Seal: i=1; a=rsa-sha256; t=1755608332; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GcVBRWgl5o5tkM4wLnSMRKSeNWRxLGOqvlaIeJopoyMoOzvHcie3lsYP4EdQIjvRkRhL+boVFcjwZ7wsqFsYBihyqPc2pVBOBz3PlZj+M0eqtl6UHZzg7V0DYjr1Y3TQ75fS1AufPXO6ua9zmNzdPfdLJj45om/x98/whoD3Lhk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755608332; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EWcDFRp+gqvTj5mlCgrE9lFbAXVj3Do4ClbGcOnro/Y=; 
	b=KyfBckPUMQkziCloXzpmEwS7eX2XJBhio/1sIvDltRsN/jbBr8k5A2EmhVyuTvb7o+dNjepgKcL42dq3rPTPWApZ3jr340pSVabC1UX3T3bw+ZBURpaXNvLtNViHAirE6qupO3mk5+TsIvUoNQonax2M84jY9jpotPv1MSjOlGU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755608332;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=EWcDFRp+gqvTj5mlCgrE9lFbAXVj3Do4ClbGcOnro/Y=;
	b=eP+gJQOf1S6RWJAy4xtjtRvWzqQ3lagY24AlvmMYypJRZtDqktPWo9ym9kfSwqeO
	ZRu+jZqStgB5tF6NK3lU5wnEZAvH9ONGE+UhzJrvv1LXKiL1r+U3f0viwXDPVWYUJ0V
	MLRCPUHPxHg2lKGt9YzbabeJ0Zeq1sQ3fErPFDwQ=
Received: by mx.zohomail.com with SMTPS id 1755608329676665.4676579868251;
	Tue, 19 Aug 2025 05:58:49 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 3/7] rust: alloc: implement VmallocPageIter
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250814093427.19629-4-dakr@kernel.org>
Date: Tue, 19 Aug 2025 09:58:33 -0300
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
Message-Id: <E571C9BD-C3CD-4C74-9873-1B6C0FB95548@collabora.com>
References: <20250814093427.19629-1-dakr@kernel.org>
 <20250814093427.19629-4-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 14 Aug 2025, at 06:33, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> Introduce the VmallocPageIter type; an instance of VmallocPageIter may
> be exposed by owners of vmalloc allocations to provide borrowed access
> to the backing pages of the vmalloc allocation.

nit: =E2=80=9Cto its backing pages=E2=80=9D reads better and avoids =
repetition.

>=20
> For instance, this is useful to access and borrow the backing pages of
> allocation primitives, such as Box and Vec, backing a scatterlist.
>=20
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> rust/kernel/alloc/allocator.rs | 98 ++++++++++++++++++++++++++++++++++
> 1 file changed, 98 insertions(+)
>=20
> diff --git a/rust/kernel/alloc/allocator.rs =
b/rust/kernel/alloc/allocator.rs
> index 2315f5063011..5cff3069bff4 100644
> --- a/rust/kernel/alloc/allocator.rs
> +++ b/rust/kernel/alloc/allocator.rs
> @@ -10,6 +10,7 @@
>=20
> use super::Flags;
> use core::alloc::Layout;
> +use core::marker::PhantomData;
> use core::ptr;
> use core::ptr::NonNull;
>=20
> @@ -236,3 +237,100 @@ unsafe fn realloc(
>         unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, =
flags) }
>     }
> }
> +
> +/// An [`Iterator`] of [`page::BorrowedPage`] items owned by a =
[`Vmalloc`] allocation.
> +///
> +/// # Guarantees
> +///
> +/// The pages iterated by the [`Iterator`] appear in the order as =
they are mapped in the CPU's
> +/// virtual address space ascendingly.
> +///
> +/// # Invariants
> +///
> +/// - `buf` is a valid pointer to the beginning of a [`Vmalloc`] =
allocation.
> +/// - `size` is the size of the [`Vmalloc`] allocation `buf` points =
to.
> +pub struct VmallocPageIter<'a> {
> +    /// The base address of the [`Vmalloc`] buffer.
> +    buf: NonNull<u8>,
> +    /// The size of the buffer pointed to by `buf` in bytes.
> +    size: usize,
> +    /// The current page index of the [`Iterator`].
> +    index: usize,
> +    _p: PhantomData<page::BorrowedPage<'a>>,
> +}
> +
> +impl<'a> Iterator for VmallocPageIter<'a> {
> +    type Item =3D page::BorrowedPage<'a>;
> +
> +    fn next(&mut self) -> Option<Self::Item> {
> +        let offset =3D self.index.checked_mul(page::PAGE_SIZE)?;
> +
> +        // Even though `self.size()` may be smaller than =
`Self::page_count() * page::PAGE_SIZE`, it
> +        // is always a number between `(Self::page_count() - 1) * =
page::PAGE_SIZE` and
> +        // `Self::page_count() * page::PAGE_SIZE`, hence the check =
below is sufficient.
> +        if offset < self.size() {
> +            self.index +=3D 1;
> +        } else {
> +            return None;
> +        }
> +
> +        // TODO: Use `NonNull::add()` instead, once the minimum =
supported compiler version is
> +        // bumped to 1.80 or later.
> +        //
> +        // SAFETY: `offset` is in the interval `[0, =
(self.page_count() - 1) * page::PAGE_SIZE]`,
> +        // hence the resulting pointer is guaranteed to be within the =
same allocation.
> +        let ptr =3D unsafe { self.buf.as_ptr().add(offset) };
> +
> +        // SAFETY: `ptr` is guaranteed to be non-null given that it =
is derived from `self.buf`.
> +        let ptr =3D unsafe { NonNull::new_unchecked(ptr) };
> +
> +        // SAFETY:
> +        // - `ptr` is a valid pointer to a `Vmalloc` allocation.
> +        // - `ptr` is valid for the duration of `'a`.
> +        Some(unsafe { Vmalloc::to_page(ptr) })
> +    }
> +
> +    fn size_hint(&self) -> (usize, Option<usize>) {
> +        let remaining =3D =
self.page_count().saturating_sub(self.index);
> +
> +        (remaining, Some(remaining))
> +    }
> +}
> +
> +impl<'a> VmallocPageIter<'a> {
> +    /// Creates a new [`VmallocPageIter`] instance.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `buf` must be a pointer to the beginning of a [`Vmalloc`] =
allocation.
> +    /// - `buf` points to must at least be valid for the lifetime of =
`'a`.
> +    /// - `size` must be the size of the [`Vmalloc`] allocation `buf` =
points to.
> +    pub unsafe fn new(buf: NonNull<u8>, size: usize) -> Self {
> +        // INVARIANT: `buf` is a valid pointer to the beginning of a =
`Vmalloc` allocation by the
> +        // safety requirements of this function.
> +        Self {
> +            buf,
> +            size,
> +            index: 0,
> +            _p: PhantomData,
> +        }
> +    }
> +
> +    /// Returns the base address of the backing [`Vmalloc`] =
allocation.
> +    pub fn base_address(&self) -> NonNull<u8> {
> +        self.buf
> +    }
> +
> +    /// Returns the size of the backing [`Vmalloc`] allocation in =
bytes.
> +    ///
> +    /// Note that this is the size the [`Vmalloc`] allocation has =
been allocated with. Hence, this
> +    /// number may be smaller than `[`Self::page_count`] * =
[`page::PAGE_SIZE`]`.
> +    pub fn size(&self) -> usize {
> +        self.size
> +    }
> +
> +    /// Returns the number of pages owned by the backing [`Vmalloc`] =
allocation.
> +    pub fn page_count(&self) -> usize {
> +        self.size().div_ceil(page::PAGE_SIZE)
> +    }
> +}
> --=20
> 2.50.1
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

