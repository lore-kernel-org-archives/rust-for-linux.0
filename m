Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3021DFFD
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Aug 2025 12:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754397086; cv=pass; b=F+htC0CEaFbtQtLZFllvBL4y2BZqdNHHA1rLiHKUinqgHQwLN1mJ9aYty+RZlqFU8yyfq5zlEGZx/6K8jO/fWpZ4B230zTWdvQscI/vLdR2Zxs9GQubPDuFM6YRZE0RqFN6CPSrX5Pi0G3WJoi8XiAa8u7ophSQO4Ka5OpeVjnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754397086; c=relaxed/simple;
	bh=mbPLZjYFaicLGtOyV7J/eC1X39SME3PKZplyx8OsZ50=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=KIIipzRicmcsblwXtZRfY9P/e4RPEIEgPsD1ROjn5yd6yf71uitsU8CL0XUTOUjPMr0yC+3a+40nZ9oRlV0zdgSSz5D1zsaocrZp5YCU0158n/V8Hzo3Qj+cwsEDlocT89X52jzD3KFfj9gOK69jsCtVe8bBLBJ1niPR5TENQhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=jmFm7T1B; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="jmFm7T1B"
ARC-Seal: i=1; a=rsa-sha256; t=1754397068; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fGJHAD7ELWfa/A7f5CQBy9+ed+Rr83FTYHlECxl+wql6wggL+pSTm68puk00QIIo+qKLdfu+6Yxtb8TzzZXDU886ha1c3YoemrnXxL9pqglu8bQCaptlid2xsL/9sVH1Dw3RjGTZxlW9WHtTiS5kAoEizXZ/ZqAeC/VpXUlFgLA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754397068; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bPrlvWYFehmpc7zjxlavDqJ6SexRnniJrnzFCxzUu5w=; 
	b=mHEddPafS7Jk67ZyiBPHRa8MTB+ChgIfDYEPhwAQZlSlX22LNS/evNJ7zfbkxlLk2fToKRjstJlMh9wc7ZB5cmI7peXyedPwKhjY6Fx1j9Hotq1K/1F1mIw1L3NqlSBMThP+y6RERIYgL+UC4lyyYWaKlvVzdAUNXMgVL7XFSlc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754397068;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=bPrlvWYFehmpc7zjxlavDqJ6SexRnniJrnzFCxzUu5w=;
	b=jmFm7T1BtPGRAUqf/Yd51t0MQwLTK1doeEQ/gDAyUjiH7xZkgCz/Y2JcCGM1YZgU
	1PVpgiaGTgZwvlrFC3RoDwJdsopkjn+CurXL9cOZCX5qJlYmBnjdrunlhBwBbGXRJoV
	RRogFRvqUx/PUoETGmOsPPXRnSwd90AyJzu+LxoI=
Received: by mx.zohomail.com with SMTPS id 1754397066442589.0599719754156;
	Tue, 5 Aug 2025 05:31:06 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] rust: page: implement BorrowedPage
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250804195023.150399-1-dakr@kernel.org>
Date: Tue, 5 Aug 2025 09:30:50 -0300
Cc: ojeda@kernel.org,
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
Message-Id: <731A34A7-92AD-47EA-A17A-C25FA94A5144@collabora.com>
References: <20250804195023.150399-1-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Danilo,

> On 4 Aug 2025, at 16:50, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> Currently, a Page always owns the underlying struct page.
>=20
> However, sometimes a struct page may be owned by some other entity, =
e.g.
> a vmalloc allocation.
>=20
> Hence, introduce BorrowedPage to support such cases, until the Ownable
> solution lands.

I guess it=E2=80=99s a good idea to expand this part somewhat. Taken as =
it is,
there is no way to know what =E2=80=9Cthe Ownable solution=E2=80=9D is.


> This is required by the scatterlist abstractions.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> rust/bindings/bindings_helper.h |  1 +
> rust/kernel/page.rs             | 83 ++++++++++++++++++++++++++++++++-
> 2 files changed, 83 insertions(+), 1 deletion(-)
>=20
> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
> index 84d60635e8a9..0e140e07758b 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -57,6 +57,7 @@
> #include <linux/jiffies.h>
> #include <linux/jump_label.h>
> #include <linux/mdio.h>
> +#include <linux/mm.h>
> #include <linux/miscdevice.h>
> #include <linux/of_device.h>
> #include <linux/pci.h>
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 7c1b17246ed5..bea7f0ab91f4 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -9,7 +9,12 @@
>     error::Result,
>     uaccess::UserSliceReader,
> };
> -use core::ptr::{self, NonNull};
> +use core::{
> +    marker::PhantomData,
> +    mem::ManuallyDrop,
> +    ops::Deref,
> +    ptr::{self, NonNull},
> +};
>=20
> /// A bitwise shift for the page size.
> pub const PAGE_SHIFT: usize =3D bindings::PAGE_SHIFT as usize;
> @@ -30,6 +35,82 @@ pub const fn page_align(addr: usize) -> usize {
>     (addr + (PAGE_SIZE - 1)) & PAGE_MASK
> }
>=20
> +/// Representation of a non-owning reference to a [`Page`].
> +///
> +/// This type provides a borrowed version of a [`Page`] that is owned =
by some other entity, e.g. a
> +/// [`Vmalloc`] allocation such as [`VBox`].
> +///
> +/// # Example
> +///
> +/// ```
> +/// # use kernel::{bindings, prelude::*};
> +/// use kernel::page::{BorrowedPage, Page, PAGE_SIZE};
> +/// # use core::ptr;
> +/// # use core::ptr::NonNull;
> +///
> +/// trait PageOwner {

What is this trait for? Perhaps this assumes some previous discussion =
that is
not in the patch itself?

> +///     fn borrow_page<'a>(&'a mut self) -> BorrowedPage<'a>;
> +/// }
> +///
> +/// impl<T> PageOwner for VBox<T> {
> +///     // Borrow the first page of a `VBox`.
> +///     fn borrow_page<'a>(&'a mut self) -> BorrowedPage<'a> {
> +///         let ptr =3D ptr::from_ref(&**self);
> +///
> +///         // SAFETY: `ptr` is a valid pointer to `Vmalloc` memory.
> +///         let page =3D unsafe { =
bindings::vmalloc_to_page(ptr.cast()) };
> +///
> +///         // SAFETY: `vmalloc_to_page` returns a valid pointer to a =
`struct page` for a valid
> +///         // pointer to `Vmalloc` memory.
> +///         let page =3D unsafe { NonNull::new_unchecked(page) };
> +///
> +///         // SAFETY:
> +///         // - `self.0` is a valid pointer to a `struct page`.
> +///         // - `self.0` is valid for the entire lifetime of `self`.
> +///         unsafe { BorrowedPage::from_raw(page) }
> +///     }
> +/// }
> +///
> +/// let mut vbox =3D VBox::<[u8; =
PAGE_SIZE]>::new_uninit(GFP_KERNEL)?;
> +/// let page =3D vbox.borrow_page();
> +///
> +/// // SAFETY: There is no concurrent read or write to the same page.
> +/// unsafe { page.fill_zero_raw(0, PAGE_SIZE)? };
> +/// # Ok::<(), Error>(())
> +/// ```
> +///
> +/// # Invariants
> +///
> +/// The borrowed underlying pointer to a `struct page` is valid for =
the entire lifetime `'a`.
> +///
> +/// [`VBox`]: kernel::alloc::VBox
> +/// [`Vmalloc`]: kernel::alloc::allocator::Vmalloc
> +pub struct BorrowedPage<'a>(ManuallyDrop<Page>, PhantomData<&'a =
Page>);
> +
> +impl<'a> BorrowedPage<'a> {
> +    /// Constructs a [`BorrowedPage`] from a raw pointer to a `struct =
page`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must point to a valid `bindings::page`.
> +    /// - `ptr` must remain valid for the entire lifetime `'a`.
> +    pub unsafe fn from_raw(ptr: NonNull<bindings::page>) -> Self {
> +        let page =3D Page { page: ptr };
> +
> +        // INVARIANT: The safety requirements guarantee that `ptr` is =
valid for the entire lifetime
> +        // `'a`.
> +        Self(ManuallyDrop::new(page), PhantomData)
> +    }
> +}
> +
> +impl<'a> Deref for BorrowedPage<'a> {
> +    type Target =3D Page;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.0
> +    }
> +}
> +
> /// A pointer to a page that owns the page allocation.
> ///
> /// # Invariants
>=20
> base-commit: d2eedaa3909be9102d648a4a0a50ccf64f96c54f
> --=20
> 2.50.1
>=20
>=20

The rest of the patch is fine.

=E2=80=94 Daniel=
