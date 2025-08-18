Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADA930F7F3
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755510756; cv=none; b=OdqhMgr7MLZvZQT3Va9ZZGkqXnSg4bts9nCDqNqHSCqSMOmSn4x8ZifuLbTA9JZONyJ6okRhsI4fOiV+hCAGe0E63GJIeNK2LllSKJ8Ddsi3RTi5A4qWyNKBibtJMt3OrF5txKUrsWDE6JU8lEiFDIBf9xaLNT/Z3NZXxJEhaz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755510756; c=relaxed/simple;
	bh=p76lMl6yOj16kgue7jyUn+JTvKdUizQMWP/fPhlwffM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=evNxuPagODqbahL3bYguNNDTekhZW2msQcaFw9ZDGqv8Yr0XWGiRXsomhv0+7UTux9FjISqihQP1TWgPW4WNW4NAS2hbgnITZymGtmhFuhpzPDJ5vK5+0FJ5Kjfc7z9jjQ0TXR+OQvPoS8cJxh2dbU930MUBQnFr5G+X8Jw/pC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aOAXSSDJ; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aOAXSSDJ"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3b9d41c245fso3195213f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 02:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755510752; x=1756115552; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NNfKPFdQoM+6zHnsZBkb2mDGQIPWPpECMJQb04mdL4A=;
        b=aOAXSSDJjzzRk4XPphxxf5D7UYNg0kX5ZOllxOleYh1wXPr76tq8eGEA/YrcLYx2y+
         DqHfuajGhfh3fwmkdKvQyYGkj/EYKRAU/Us1SJOWPnTshPmleq+FmNGJK0GHWiCTGJEj
         Ktfqp6D2/YwInzRO+6i1K9N2LLyVSOnFWwy3teez/b5digLEznNGWe2PkYxIG9w8GPiO
         W56uOIZt1JmsuSXQFKdLwwdRuJaNmM1JMwuyDYDyH4hvouykuY2jqTQHiXV6Yqn7vhaf
         J6OPC1C2HtfYFQTK1lkMdf+klnYfr4y4W9ftdgiDBz5vYcxfbVrmZZXLR7wNja5xIBrp
         uUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755510752; x=1756115552;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NNfKPFdQoM+6zHnsZBkb2mDGQIPWPpECMJQb04mdL4A=;
        b=FrV5TiLcCH7+ZCubuNaMM4bxjka+LG/mfsyJ4WpQ4tnoSSViLx721YIgYguAjoyACM
         q9y5FTTJ6xViUgbt0mSyqhxEzehh4vPWt31RzQxpppee/IyVfOSY3jGWSPnMQ69Vkk2c
         8mtRYaM+kqEYAyHnnZ4yJPwMRSDdqK114gJWEo62aZxWFD3YVFNrqBrgTUVYUZtXUYOH
         jtvzxUELJ0P4TOwKBmABllHG3wrACqQZgiisYOalYqbmhrelueEvJkKNB3r4DOf61oHE
         qUuQgJFzUuPZWvEPdtImm3/aPZGevcyOxGnEoolajemIoJPWWARy9MjXOjOZEm++znqu
         +s9g==
X-Forwarded-Encrypted: i=1; AJvYcCVnGG/N4uDHWKM5HiQVjVvfrVMqzLa9gkkGiHpaVsbbmMNgb/Z+OGnLoHMeV0jZMFyVN0xkvm3EhQNiqXIw5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxujxvNG2I1eTqTqEu8javianP2v20vib34d37EFS6gHCxAlNZN
	Ek6pGftOsMpPlP1XS/O78B05PgYMBw6mTSxgKkIlzCXoGMjUXHrKoSgNcjpXOkvFbnJA32qB3J4
	w70I5yMHtAeRDN6KaLA==
X-Google-Smtp-Source: AGHT+IEyfo20e1fVadWO+eYQ4qlAgwLLTd8l26CaHUyanTisncv3yzZU/1v+vbVFOdDq2bUM5iWWlTjOsp2Bv9s=
X-Received: from wrs27.prod.google.com ([2002:a05:6000:65b:b0:3b7:d75e:c48e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4028:b0:3b8:d32e:9222 with SMTP id ffacd0b85a97d-3bb690d1c8cmr8591384f8f.38.1755510752381;
 Mon, 18 Aug 2025 02:52:32 -0700 (PDT)
Date: Mon, 18 Aug 2025 09:52:31 +0000
In-Reply-To: <20250815171058.299270-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250815171058.299270-1-dakr@kernel.org> <20250815171058.299270-3-dakr@kernel.org>
Message-ID: <aKL338gQ7qPNKoBu@google.com>
Subject: Re: [PATCH 2/4] rust: scatterlist: Add type-state abstraction for sg_table
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, jgg@ziepe.ca, 
	lyude@redhat.com, robin.murphy@arm.com, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Aug 15, 2025 at 07:10:03PM +0200, Danilo Krummrich wrote:
> Add a safe Rust abstraction for the kernel's scatter-gather list
> facilities (`struct scatterlist` and `struct sg_table`).
> 
> This commit introduces `SGTable<T>`, a wrapper that uses a type-state
> pattern to provide compile-time guarantees about ownership and lifetime.
> 
> The abstraction provides two primary states:
> - `SGTable<Owned<P>>`: Represents a table whose resources are fully
>   managed by Rust. It takes ownership of a page provider `P`, allocates
>   the underlying `struct sg_table`, maps it for DMA, and handles all
>   cleanup automatically upon drop. The DMA mapping's lifetime is tied to
>   the associated device using `Devres`, ensuring it is correctly unmapped
>   before the device is unbound.
> - `SGTable<Borrowed>` (or just `SGTable`): A zero-cost representation of
>   an externally managed `struct sg_table`. It is created from a raw
>   pointer using `SGTable::as_ref()` and provides a lifetime-bound
>   reference (`&'a SGTable`) for operations like iteration.
> 
> The API exposes a safe iterator that yields `&SGEntry` references,
> allowing drivers to easily access the DMA address and length of each
> segment in the list.
> 
> Co-developed-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
> Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/helpers/helpers.c     |   1 +
>  rust/helpers/scatterlist.c |  24 ++
>  rust/kernel/lib.rs         |   1 +
>  rust/kernel/scatterlist.rs | 433 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 459 insertions(+)
>  create mode 100644 rust/helpers/scatterlist.c
>  create mode 100644 rust/kernel/scatterlist.rs
> 
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 7cf7fe95e41d..e94542bf6ea7 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -39,6 +39,7 @@
>  #include "rcu.c"
>  #include "refcount.c"
>  #include "regulator.c"
> +#include "scatterlist.c"
>  #include "security.c"
>  #include "signal.c"
>  #include "slab.c"
> diff --git a/rust/helpers/scatterlist.c b/rust/helpers/scatterlist.c
> new file mode 100644
> index 000000000000..80c956ee09ab
> --- /dev/null
> +++ b/rust/helpers/scatterlist.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/dma-direction.h>
> +
> +dma_addr_t rust_helper_sg_dma_address(struct scatterlist *sg)
> +{
> +	return sg_dma_address(sg);
> +}
> +
> +unsigned int rust_helper_sg_dma_len(struct scatterlist *sg)
> +{
> +	return sg_dma_len(sg);
> +}
> +
> +struct scatterlist *rust_helper_sg_next(struct scatterlist *sg)
> +{
> +	return sg_next(sg);
> +}
> +
> +void rust_helper_dma_unmap_sgtable(struct device *dev, struct sg_table *sgt,
> +				   enum dma_data_direction dir, unsigned long attrs)
> +{
> +	return dma_unmap_sgtable(dev, sgt, dir, attrs);
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index ed53169e795c..55acbc893736 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -113,6 +113,7 @@
>  pub mod rbtree;
>  pub mod regulator;
>  pub mod revocable;
> +pub mod scatterlist;
>  pub mod security;
>  pub mod seq_file;
>  pub mod sizes;
> diff --git a/rust/kernel/scatterlist.rs b/rust/kernel/scatterlist.rs
> new file mode 100644
> index 000000000000..4caaf8cfbf83
> --- /dev/null
> +++ b/rust/kernel/scatterlist.rs
> @@ -0,0 +1,433 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Abstractions for scatter-gather lists.
> +//!
> +//! C header: [`include/linux/scatterlist.h`](srctree/include/linux/scatterlist.h)
> +//!
> +//! Scatter-gather (SG) I/O is a memory access technique that allows devices to perform DMA
> +//! operations on data buffers that are not physically contiguous in memory. It works by creating a
> +//! "scatter-gather list", an array where each entry specifies the address and length of a
> +//! physically contiguous memory segment.
> +//!
> +//! The device's DMA controller can then read this list and process the segments sequentially as
> +//! part of one logical I/O request. This avoids the need for a single, large, physically contiguous
> +//! memory buffer, which can be difficult or impossible to allocate.
> +//!
> +//! This module provides safe Rust abstractions over the kernel's `struct scatterlist` and
> +//! `struct sg_table` types.
> +//!
> +//! The main entry point is the [`SGTable`] type, which represents a complete scatter-gather table.
> +//! It can be either:
> +//!
> +//! - An owned table ([`SGTable<Owned<P>>`]), created from a Rust memory buffer (e.g., [`VVec`]).
> +//!   This type manages the allocation of the `struct sg_table`, the DMA mapping of the buffer, and
> +//!   the automatic cleanup of all resources.
> +//! - A borrowed reference (&[`SGTable`]), which provides safe, read-only access to a table that was
> +//!   allocated by other (e.g., C) code.
> +//!
> +//! Individual entries in the table are represented by [`SGEntry`], which can be accessed by
> +//! iterating over an [`SGTable`].
> +
> +use crate::{
> +    alloc,
> +    alloc::allocator::VmallocPageIter,
> +    bindings,
> +    device::{Bound, Device},
> +    devres::Devres,
> +    dma, error, page,
> +    prelude::*,
> +    types::{ARef, Opaque},
> +};
> +use core::{ops::Deref, ptr::NonNull};
> +
> +/// A single entry in a scatter-gather list.
> +///
> +/// An `SGEntry` represents a single, physically contiguous segment of memory that has been mapped
> +/// for DMA.
> +///
> +/// Instances of this struct are obtained by iterating over an [`SGTable`]. Drivers do not create
> +/// or own [`SGEntry`] objects directly.
> +#[repr(transparent)]
> +pub struct SGEntry(Opaque<bindings::scatterlist>);

Send/Sync?

> +impl SGEntry {
> +    /// Convert a raw `struct scatterlist *` to a `&'a SGEntry`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that the `struct scatterlist` pointed to by `ptr` is valid for the
> +    /// lifetime `'a`.
> +    unsafe fn as_ref<'a>(ptr: *mut bindings::scatterlist) -> &'a Self {

Please call this from_raw.

> +        // SAFETY: The safety requirements of this function guarantee that `ptr` is a valid pointer
> +        // to a `struct scatterlist` for the duration of `'a`.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Obtain the raw `struct scatterlist *`.
> +    fn as_raw(&self) -> *mut bindings::scatterlist {

Consider adding #[inline] to all these methods.

> +        self.0.get()
> +    }
> +
> +    /// Returns the DMA address of this SG entry.
> +    ///
> +    /// This is the address that the device should use to access the memory segment.
> +    pub fn dma_address(&self) -> bindings::dma_addr_t {

We might want a typedef on the Rust side for dma_addr_t, like we already
have for the phys_addr_t/resource_size_t.

> +        // SAFETY: `self.as_raw()` is a valid pointer to a `struct scatterlist`.
> +        unsafe { bindings::sg_dma_address(self.as_raw()) }
> +    }
> +
> +    /// Returns the length of this SG entry in bytes.
> +    pub fn dma_len(&self) -> u32 {

Is u32 really the right length type?

> +        // SAFETY: `self.as_raw()` is a valid pointer to a `struct scatterlist`.
> +        unsafe { bindings::sg_dma_len(self.as_raw()) }
> +    }
> +}
> +
> +/// The borrowed type state of an [`SGTable`], representing a borrowed or externally managed table.
> +#[repr(transparent)]
> +pub struct Borrowed(Opaque<bindings::sg_table>);
> +
> +// SAFETY: An instance of `Borrowed` can be send to any task.
> +unsafe impl Send for Borrowed {}

No Sync?

> +/// A scatter-gather table.
> +///
> +/// This struct is a wrapper around the kernel's `struct sg_table`. It manages a list of DMA-mapped
> +/// memory segments that can be passed to a device for I/O operations.
> +///
> +/// The generic parameter `T` is used as a type state to distinguish between owned and borrowed
> +/// tables.
> +///
> +///  - [`SGTable<Owned>`]: An owned table created and managed entirely by Rust code. It handles
> +///    allocation, DMA mapping, and cleanup of all associated resources. See [`SGTable::new`].
> +///  - [`SGTable<Borrowed>`} (or simply [`SGTable`]): Represents a table whose lifetime is managed
> +///    externally. It can be used safely via a borrowed reference `&'a SGTable`, where `'a` is the
> +///    external lifetime.
> +///
> +/// All [`SGTable`] variants can be iterated over the individual [`SGEntry`]s.
> +#[repr(transparent)]
> +#[pin_data]
> +pub struct SGTable<T: private::Sealed = Borrowed> {
> +    #[pin]
> +    inner: T,
> +}
>
> +impl SGTable {
> +    /// Creates a borrowed `&'a SGTable` from a raw `struct sg_table` pointer.
> +    ///
> +    /// This allows safe access to an `sg_table` that is managed elsewhere (for example, in C code).
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that the `struct sg_table` pointed to by `ptr` is valid for the entire
> +    /// lifetime of `'a`.
> +    pub unsafe fn as_ref<'a>(ptr: *mut bindings::sg_table) -> &'a Self {

Please rename to from_raw().

> +        // SAFETY: The safety requirements of this function guarantee that `ptr` is a valid pointer
> +        // to a `struct sg_table` for the duration of `'a`.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    fn as_raw(&self) -> *mut bindings::sg_table {

Ditto about #[inline] for these.

> +        self.inner.0.get()
> +    }
> +
> +    fn as_iter(&self) -> SGTableIter<'_> {
> +        // SAFETY: `self.as_raw()` is a valid pointer to a `struct sg_table`.
> +        let ptr = unsafe { (*self.as_raw()).sgl };
> +
> +        // SAFETY: `ptr` is guaranteed to be a valid pointer to a `struct scatterlist`.
> +        let pos = Some(unsafe { SGEntry::as_ref(ptr) });
> +
> +        SGTableIter { pos }
> +    }
> +}
> +
> +/// # Invariants
> +///
> +/// `sgt` is a valid pointer to a `struct sg_table` for the entire lifetime of an [`DmaMapSgt`].

I think we probably want an invariant for why it's safe to call
dma_unmap_sgtable in Drop.

> +struct DmaMapSgt {
> +    sgt: NonNull<bindings::sg_table>,
> +    dev: ARef<Device>,
> +    dir: dma::DataDirection,
> +}
> +
> +// SAFETY: An instance of `DmaMapSgt` can be send to any task.
> +unsafe impl Send for DmaMapSgt {}

No Sync?

> +impl DmaMapSgt {
> +    /// # Safety
> +    ///
> +    /// `sgt` must be a valid pointer to a `struct sg_table` for the entire lifetime of the
> +    /// returned [`DmaMapSgt`].
> +    unsafe fn new(
> +        sgt: NonNull<bindings::sg_table>,
> +        dev: &Device<Bound>,
> +        dir: dma::DataDirection,
> +    ) -> Result<Self> {
> +        // SAFETY:
> +        // - `dev.as_raw()` is a valid pointer to a `struct device`, which is guaranteed to be
> +        //   bound to a driver for the duration of this call.
> +        // - `sgt` is a valid pointer to a `struct sg_table`.
> +        error::to_result(unsafe {
> +            bindings::dma_map_sgtable(dev.as_raw(), sgt.as_ptr(), dir.as_raw(), 0)
> +        })?;
> +
> +        // INVARIANT: By the safety requirements of this function it is guaranteed that `sgt` is
> +        // valid for the entire lifetime of this object instance.
> +        Ok(Self {
> +            sgt,
> +            dev: dev.into(),
> +            dir,
> +        })
> +    }
> +}
> +
> +impl Drop for DmaMapSgt {
> +    fn drop(&mut self) {
> +        // SAFETY:
> +        // - `self.dev.as_raw()` is a pointer to a valid `struct device`.
> +        // - `self.dev` is the same device the mapping has been created for in `Self::new()`.
> +        // - `self.sgt.as_ptr()` is a valid pointer to a `struct sg_table` by the type invariants
> +        //   of `Self`.
> +        // - `self.dir` is the same `dma::DataDirection` the mapping has been created with in
> +        //   `Self::new()`.
> +        unsafe {
> +            bindings::dma_unmap_sgtable(self.dev.as_raw(), self.sgt.as_ptr(), self.dir.as_raw(), 0)
> +        };
> +    }
> +}
> +
> +#[repr(transparent)]
> +#[pin_data(PinnedDrop)]
> +struct RawSGTable {
> +    #[pin]
> +    sgt: Opaque<bindings::sg_table>,
> +}

Send/Sync?

> +impl RawSGTable {
> +    fn new(
> +        mut pages: KVec<*mut bindings::page>,
> +        size: usize,
> +        max_segment: u32,
> +        flags: alloc::Flags,
> +    ) -> impl PinInit<Self, Error> {
> +        try_pin_init!(Self {
> +            sgt <- Opaque::try_ffi_init(|slot: *mut bindings::sg_table| {
> +                // `sg_alloc_table_from_pages_segment()` expects at least one page, otherwise it
> +                // produces a NPE.
> +                if pages.is_empty() {
> +                    return Err(EINVAL);
> +                }
> +
> +                // SAFETY:
> +                // - `slot` is a valid pointer to uninitialized memory.
> +                // - As by the check above, `pages` is not empty.
> +                error::to_result(unsafe {
> +                    bindings::sg_alloc_table_from_pages_segment(
> +                        slot,
> +                        pages.as_mut_ptr(),
> +                        pages.len().try_into()?,

The `pages` vector is dropped immediately after this call to
sg_alloc_table_from_pages_segment. Is that ok?

If it's ok, then I would change `pages` to `&[*mut page]` so that the
caller can manage the allocation of the array.

(Or maybe a mutable array ...?)

> +                        0,
> +                        size,
> +                        max_segment,
> +                        flags.as_raw(),
> +                    )
> +                })
> +            }),
> +        })
> +    }
> +
> +    fn as_raw(&self) -> *mut bindings::sg_table {
> +        self.sgt.get()
> +    }
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for RawSGTable {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: `sgt` is a valid and initialized `struct sg_table`.
> +        unsafe { bindings::sg_free_table(self.sgt.get()) };
> +    }
> +}
> +
> +/// The [`Owned`] type state of an [`SGTable`].
> +///
> +/// A [`SGTable<Owned>`] signifies that the [`SGTable`] owns all associated resources:
> +///
> +/// - The backing memory pages.
> +/// - The `struct sg_table` allocation (`sgt`).
> +/// - The DMA mapping, managed through a [`Devres`]-managed `DmaMapSgt`.
> +///
> +/// Users interact with this type through the [`SGTable`] handle and do not need to manage
> +/// [`Owned`] directly.
> +#[pin_data]
> +pub struct Owned<P> {
> +    // Note: The drop order is relevant; we first have to unmap the `struct sg_table`, then free the
> +    // `struct sg_table` and finally free the backing pages.
> +    #[pin]
> +    dma: Devres<DmaMapSgt>,
> +    #[pin]
> +    sgt: RawSGTable,
> +    _pages: P,
> +}
> +
> +// SAFETY: An instance of `Owned` can be send to any task if `P` can be send to any task.
> +unsafe impl<P: Send> Send for Owned<P> {}

Sync?

> +impl<P> Owned<P>
> +where
> +    for<'a> P: page::AsPageIter<Iter<'a> = VmallocPageIter<'a>> + 'static,

If you specifically require the iterator type to be VmallocPageIter,
then I would hard-code that in the trait instead of specifying it here.

But I think you just want `P: AsPageIter`.

> +{
> +    fn new(
> +        dev: &Device<Bound>,
> +        mut pages: P,
> +        dir: dma::DataDirection,
> +        flags: alloc::Flags,
> +    ) -> Result<impl PinInit<Self, Error> + use<'_, P>> {

We would probably want to move the logic into the initializer so that we
don't have the double Result here.

> +        let page_iter = pages.page_iter();
> +        let size = page_iter.size();
> +
> +        let mut page_vec: KVec<*mut bindings::page> =
> +            KVec::with_capacity(page_iter.page_count(), flags)?;
> +
> +        for page in page_iter {
> +            page_vec.push(page.as_ptr(), flags)?;
> +        }
> +
> +        // `dma_max_mapping_size` returns `size_t`, but `sg_alloc_table_from_pages_segment()` takes
> +        // an `unsigned int`.
> +        let max_segment = {
> +            // SAFETY: `dev.as_raw()` is a valid pointer to a `struct device`.
> +            let size = unsafe { bindings::dma_max_mapping_size(dev.as_raw()) };
> +            if size == 0 {
> +                u32::MAX
> +            } else {
> +                size.min(u32::MAX as usize) as u32

u32::try_from(size).unwrap_or(u32::MAX)

> +            }
> +        };
> +
> +        Ok(try_pin_init!(&this in Self {
> +            sgt <- RawSGTable::new(page_vec, size, max_segment, flags),
> +            dma <- {
> +                // SAFETY: `this` is a valid pointer to uninitialized memory.
> +                let sgt = unsafe { &raw mut (*this.as_ptr()).sgt }.cast();
> +
> +                // SAFETY: `sgt` is guaranteed to be non-null.
> +                let sgt = unsafe { NonNull::new_unchecked(sgt) };
> +
> +                // SAFETY: It is guaranteed that the object returned by `DmaMapSgt::new` won't
> +                // out-live `sgt`.
> +                Devres::new(dev, unsafe { DmaMapSgt::new(sgt, dev, dir) })
> +            },
> +            _pages: pages,
> +        }))
> +    }
> +}
> +
> +impl<P> SGTable<Owned<P>>
> +where
> +    for<'a> P: page::AsPageIter<Iter<'a> = VmallocPageIter<'a>> + 'static,
> +{
> +    /// Allocates a new scatter-gather table from the given pages and maps it for DMA.
> +    ///
> +    /// This constructor creates a new [`SGTable<Owned>`] that takes ownership of `P`.
> +    /// It allocates a `struct sg_table`, populates it with entries corresponding to the physical
> +    /// pages of `P`, and maps the table for DMA with the specified [`Device`] and
> +    /// [`dma::DataDirection`].
> +    ///
> +    /// The DMA mapping is managed through [`Devres`], ensuring that the DMA mapping is unmapped
> +    /// once the associated [`Device`] is unbound, or when the [`SGTable<Owned>`] is dropped.
> +    ///
> +    /// # Parameters
> +    ///
> +    /// * `dev`: The [`Device`] that will be performing the DMA.
> +    /// * `pages`: The entity providing the backing pages. It must implement [`page::AsPageIter`].
> +    ///   The ownership of this entity is moved into the new [`SGTable<Owned>`].
> +    /// * `dir`: The [`dma::DataDirection`] of the DMA transfer.
> +    /// * `flags`: Allocation flags for internal allocations (e.g., [`GFP_KERNEL`]).
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::{
> +    ///     device::{Bound, Device},
> +    ///     dma, page,
> +    ///     prelude::*,
> +    ///     scatterlist::*,
> +    /// };
> +    ///
> +    /// fn test(dev: &Device<Bound>) -> Result {
> +    ///     let size = 4 * page::PAGE_SIZE;
> +    ///     let pages = VVec::<u8>::with_capacity(size, GFP_KERNEL)?;
> +    ///
> +    ///     let sgt = KBox::pin_init(SGTable::new(
> +    ///         dev,
> +    ///         pages,
> +    ///         dma::DataDirection::TO_DEVICE,
> +    ///         GFP_KERNEL,
> +    ///     ), GFP_KERNEL)?;
> +    ///
> +    ///     Ok(())
> +    /// }
> +    /// ```
> +    pub fn new(
> +        dev: &Device<Bound>,
> +        pages: P,
> +        dir: dma::DataDirection,
> +        flags: alloc::Flags,
> +    ) -> impl PinInit<Self, Error> + use<'_, P> {
> +        try_pin_init!(Self {
> +            inner <- Owned::new(dev, pages, dir, flags)?
> +        })
> +    }
> +}
> +
> +impl<P> Deref for SGTable<Owned<P>> {
> +    type Target = SGTable;
> +
> +    fn deref(&self) -> &Self::Target {

Also #[inline].

> +        // SAFETY: `self.inner.sgt.as_raw()` is a valid pointer to a `struct sg_table` for the
> +        // entire lifetime of `self`.
> +        unsafe { SGTable::as_ref(self.inner.sgt.as_raw()) }
> +    }
> +}
> +
> +mod private {
> +    pub trait Sealed {}
> +
> +    impl Sealed for super::Borrowed {}
> +    impl<P> Sealed for super::Owned<P> {}
> +}
> +
> +impl<'a> IntoIterator for &'a SGTable {
> +    type Item = &'a SGEntry;
> +    type IntoIter = SGTableIter<'a>;
> +
> +    fn into_iter(self) -> Self::IntoIter {
> +        self.as_iter()
> +    }
> +}
> +
> +/// An [`Iterator`] over the [`SGEntry`] items of an [`SGTable`].
> +pub struct SGTableIter<'a> {
> +    pos: Option<&'a SGEntry>,
> +}
> +
> +impl<'a> Iterator for SGTableIter<'a> {
> +    type Item = &'a SGEntry;
> +
> +    fn next(&mut self) -> Option<Self::Item> {
> +        let entry = self.pos?;
> +
> +        // SAFETY: `entry.as_raw()` is a valid pointer to a `struct scatterlist`.
> +        let next = unsafe { bindings::sg_next(entry.as_raw()) };
> +
> +        self.pos = (!next.is_null()).then(|| {
> +            // SAFETY: If `next` is not NULL, `sg_next()` guarantees to return a valid pointer to
> +            // the next `struct scatterlist`.
> +            unsafe { SGEntry::as_ref(next) }
> +        });
> +
> +        Some(entry)
> +    }
> +}
> -- 
> 2.50.1
> 
