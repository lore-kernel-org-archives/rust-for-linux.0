Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B36257AC7
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 12:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755607402; cv=pass; b=tM1LWM8t1LFWMUmMuUX2MLwYOZYbheXTlFAU1AaH/8bQIlMKh0l/cuOsBgRWPYgo3hy17w4gao/7bXx/pvtp0ALqLUaPwcxmGB/tHiEeBonY4OyMmWw7SP+tsF/1LpQSESAbIWoL+lQPqeUWYaTmKwu0OFfO/6toVkpQxEaVmz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755607402; c=relaxed/simple;
	bh=WX+t0JnpKYl+0qasGtINK6yu2jttldwt12dW6AlzWOo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=txc6f3+7kbIOQo6mM6NhCMkFqE9UcbE5CZDTl29JNmwnEOMZcF1La4oPS9eVDDR2b9CodjRe/aeuHjNie6dupSlpCeNBQy1LfqpT9CFXcJFyJ8b3iK0eaU+YuOi4u1jQSzCYTWs9uTVPMZcXKjbyKHqH24cnrGinu55kpNaY4k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=a9l2erA8; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="a9l2erA8"
ARC-Seal: i=1; a=rsa-sha256; t=1755607378; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dftH42NT4lywK0tEcjEcTk8vzjKUNcB7jm9AbvyCznGZT9KvzOIHH85HGA3j+p93kdOOyRBYApZMy+aX7hDnWEl3WFIA8FZUXkqq36zCP7dfUtiL/U9MNwctSFgmsyzrB0ybuKZKOO5sFGQZgMdkOqgfleIAa2388CwBdSP40cg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755607378; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=o5AJroBUKQGqEh3C1Q3wr8x8Rhh1eEYSWuM1eLAu570=; 
	b=E131Y5J164WAvy4yPTOGhTaiVooX4bRVSVrIHw9oQF8zaSf3WO51twQd3KY97Kzpkz5NWSAc8+Rj8WW+hoqbPLN5PFE+/HJtydjGarZXtQ1o8Mp/XCFnin5JiXDglHYEXtNiCRYh9NIMNhmYfNWmbpZfXa0rkTw3BV9cKwZtO7A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755607378;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=o5AJroBUKQGqEh3C1Q3wr8x8Rhh1eEYSWuM1eLAu570=;
	b=a9l2erA8aCMAYnyGHfZR7Ugwy6FVS6aD56e9Sx0lPSMlx3G7GQ6cvWOrUJ73i/41
	MeYr2T9C4KQumzycDb4CiEQtD9frTQZMXpmI2YrQU5rUNZLcaDJ+EuMDUfX+SNCd+Hl
	E8gOtApaVeICa3LCZXiEV/BnlGu8ypReWphz5ubo=
Received: by mx.zohomail.com with SMTPS id 175560737660562.88057006160818;
	Tue, 19 Aug 2025 05:42:56 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 1/7] rust: page: implement BorrowedPage
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250814093427.19629-2-dakr@kernel.org>
Date: Tue, 19 Aug 2025 09:42:39 -0300
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
Message-Id: <A81E0212-C8AD-4BAD-A35E-BFCAE24FEDCA@collabora.com>
References: <20250814093427.19629-1-dakr@kernel.org>
 <20250814093427.19629-2-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Danilo,

> On 14 Aug 2025, at 06:33, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> Currently, a Page always owns the underlying struct page.
>=20
> However, sometimes a struct page may be owned by some other entity, =
e.g.
> a vmalloc allocation.
>=20
> Hence, introduce BorrowedPage to support such cases, until the Ownable
> solution [1] lands.
>=20
> This is required by the scatterlist abstractions.
>=20
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Acked-by: Alice Ryhl <aliceryhl@google.com>
> Link: =
https://lore.kernel.org/rust-for-linux/ZnCzLIly3DRK2eab@boqun-archlinux/ =
[1]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> rust/bindings/bindings_helper.h |  1 +
> rust/kernel/page.rs             | 75 ++++++++++++++++++++++++++++++++-
> 2 files changed, 75 insertions(+), 1 deletion(-)
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
> index 7c1b17246ed5..631718a6ad7d 100644
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
> @@ -30,6 +35,74 @@ pub const fn page_align(addr: usize) -> usize {
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
> +/// # use core::{mem::MaybeUninit, ptr, ptr::NonNull };
> +///
> +/// fn borrow_page<'a>(vbox: &'a mut VBox<MaybeUninit<[u8; =
PAGE_SIZE]>>) -> BorrowedPage<'a> {
> +///     let ptr =3D ptr::from_ref(&**vbox);
> +///
> +///     // SAFETY: `ptr` is a valid pointer to `Vmalloc` memory.
> +///     let page =3D unsafe { bindings::vmalloc_to_page(ptr.cast()) =
};
> +///
> +///     // SAFETY: `vmalloc_to_page` returns a valid pointer to a =
`struct page` for a valid
> +///     // pointer to `Vmalloc` memory.
> +///     let page =3D unsafe { NonNull::new_unchecked(page) };
> +///
> +///     // SAFETY:
> +///     // - `self.0` is a valid pointer to a `struct page`.
> +///     // - `self.0` is valid for the entire lifetime of `self`.
> +///     unsafe { BorrowedPage::from_raw(page) }
> +/// }
> +///
> +/// let mut vbox =3D VBox::<[u8; =
PAGE_SIZE]>::new_uninit(GFP_KERNEL)?;
> +/// let page =3D borrow_page(&mut vbox);
> +///
> +/// // SAFETY: There is no concurrent read or write to this page.
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
> --=20
> 2.50.1
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

