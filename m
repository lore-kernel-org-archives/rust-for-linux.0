Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F187C1F75B2
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 09:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737537229; cv=none; b=i5QSu3y6RmCUpurvuNE75UXadGej8WE4dKCfK69h2qwpB3Z5u3R6hBX1O8oTEtrePBAT9cn843uO4GmCrC2A4eI8sesJPBeIPlJRNX7pJbih2joxK84j0jrwqXFBWc8OF8vOfvYDABoBS+bEz5MWKXPE5E+MaYtd7LwsE2ER5t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737537229; c=relaxed/simple;
	bh=lJyM2M53C+oYgrKFYeHteahmuUakX1U9RqsD2aaf2AM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i+MPhW1Xmik/ZhGRVNzb5THDEIwKbDb6DLKCkMb3/v6pkZjACrb0oo6Oqk0Nq43z4EKUrEj5Iii0DSlbl1kHjeUvkCKlXqKVCJ15Q05e4259m/mZ3D4ZgQMexWmg5FqTDUCLn0Hsg9MfmpSy39C4SUsMbsZqfVuVW8n1ITKbl2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zHurZ0NX; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zHurZ0NX"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3862f32a33eso3052878f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 01:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737537225; x=1738142025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IkfhCmY6dDspr1DMhSmmJ7oWkBzIBYutY/kcr3VeIA=;
        b=zHurZ0NXGfHJyBQXNvkRwgovr2nAP+6YkxaqeZbTT1uGWaU2+v1zrGGnHjLpdtqrL4
         WCv0y1HitU+vZXYWSJk5Le6Wfaqr7el3fxVkoGNn082GntVEg9rINtA8uXz2kYo6+Gyx
         M1MW3LXSkIG1RhVp9aKGdKKFRpoJ3oUd6VmumZNl4MxCncNJkm2VULSlLyRXTRZpzpBk
         cMKcU4C9qEba3dgnRbfwzwc1aqG3eOlhpnGNSPSbwLLQhPSx2PoUqIAnGXREDH+SqNqu
         nZZZB1pJpJZpkALUvXRopM+a+wLzepl72WdNd3I/1/rVenfNcLr+GewPgVWlvkMZfOCG
         eIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737537225; x=1738142025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IkfhCmY6dDspr1DMhSmmJ7oWkBzIBYutY/kcr3VeIA=;
        b=xKQM/cEckIXbZM3kzFuJ0C9kbc+ewZ+3asQrGVkOm9ji+rMEtsz8eoJv9+ktj/n4Kt
         Ecc0UBhKLR9ZuYNOhSiAbQCaKWQGm4ZtMTP658kPqnx4GoBlUz++CGwd2xwlxC1/fIiB
         sAOr8AYXVeUWQjQZwPjKvztCgyFIMkXBmj7AjXbXcfIX9T0xeCzXRCslfwMCvvy2ahXK
         U3VLFodVEX3D1vVb8De/Gh/NDKaPPoM8oav0Ag1JVmn0WpXpohgJ0o9ht3v+pnXPcirZ
         sf3OOU+1pdjnPPt67MxekrzDtYrKS9XWm8m0Jv1LkHFqumqItfdrFq0PWGVh+vvYgWcS
         FcmQ==
X-Gm-Message-State: AOJu0YyVANedknLv0FM/wY/CwYtsudrJwQYprT0ZOsW8wPRXdKdeY/G8
	2vKNW7F2KmhI0fto6xrn4eIspdCsZjZ1Gtq0bzd5H2it8V9sGpcxDy9xmQTNCTuNAkhrfh1CXEL
	P7HxMngkaUjdLuKnxvH/zv/Fs1fu+ZRnLprJq
X-Gm-Gg: ASbGncs8A6BIh0NIZc3fy/wk+SdREsFal+Rg/TfjNH7yZ+CQceNp7MEmtFpZTB61WPY
	1i7j79XN49reJyV4QxCGyh//1ikozsUould+5u0hsQNKmyLZ6QPyr7X5HLyoe6R3Anv4ZaHcqdM
	xmNCBF
X-Google-Smtp-Source: AGHT+IHK+Dd7SoRcT2CTFs1LpfotwW3in1hFTtTfbcnPZM3TLjGpvOahcpqaYeqbkLj0JCe1b5C4HTCvnr3bN7vIO2E=
X-Received: by 2002:a05:6000:186f:b0:385:e105:d884 with SMTP id
 ffacd0b85a97d-38bf57b6095mr20621039f8f.46.1737537225109; Wed, 22 Jan 2025
 01:13:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121191432.1178734-1-abdiel.janulgue@gmail.com> <20250121191432.1178734-3-abdiel.janulgue@gmail.com>
In-Reply-To: <20250121191432.1178734-3-abdiel.janulgue@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 22 Jan 2025 10:13:32 +0100
X-Gm-Features: AbW1kvZBDfEun-f5Vo2uhtkolwcUGu5Q3JEc1au9tXb4idQdtbWRfdRIBZEiIxo
Message-ID: <CAH5fLgjVjAVwR+osD4ajKfyewdWPpkSyV+oy=ppaCULUdPqB7w@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] rust: add dma coherent allocator abstraction.
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
	dakr@kernel.org, robin.murphy@arm.com, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 8:14=E2=80=AFPM Abdiel Janulgue
<abdiel.janulgue@gmail.com> wrote:
>
> Add a simple dma coherent allocator rust abstraction. Based on
> Andreas Hindborg's dma abstractions from the rnvme driver, which
> was also based on earlier work by Wedson Almeida Filho.
>
> Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/dma.rs              | 281 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   1 +
>  3 files changed, 283 insertions(+)
>  create mode 100644 rust/kernel/dma.rs
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 5c4dfe22f41a..49bf713b9bb6 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -11,6 +11,7 @@
>  #include <linux/blk_types.h>
>  #include <linux/blkdev.h>
>  #include <linux/cred.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/errname.h>
>  #include <linux/ethtool.h>
>  #include <linux/file.h>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> new file mode 100644
> index 000000000000..ebae7270190e
> --- /dev/null
> +++ b/rust/kernel/dma.rs
> @@ -0,0 +1,281 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Direct memory access (DMA).
> +//!
> +//! C header: [`include/linux/dma-mapping.h`](srctree/include/linux/dma-=
mapping.h)
> +
> +use crate::{
> +    bindings, build_assert,
> +    device::Device,
> +    error::code::*,
> +    error::Result,
> +    transmute::{AsBytes, FromBytes},
> +    types::ARef,
> +};
> +
> +/// Possible attributes associated with a DMA mapping.
> +///
> +/// They can be combined with the operators `|`, `&`, and `!`.
> +///
> +/// Values can be used from the [`attrs`] module.
> +#[derive(Clone, Copy, PartialEq)]
> +#[repr(transparent)]
> +pub struct Attrs(u32);
> +
> +impl Attrs {
> +    /// Get the raw representation of this attribute.
> +    pub(crate) fn as_raw(self) -> crate::ffi::c_ulong {
> +        self.0 as _
> +    }
> +
> +    /// Check whether `flags` is contained in `self`.
> +    pub fn contains(self, flags: Attrs) -> bool {
> +        (self & flags) =3D=3D flags
> +    }
> +}
> +
> +impl core::ops::BitOr for Attrs {
> +    type Output =3D Self;
> +    fn bitor(self, rhs: Self) -> Self::Output {
> +        Self(self.0 | rhs.0)
> +    }
> +}
> +
> +impl core::ops::BitAnd for Attrs {
> +    type Output =3D Self;
> +    fn bitand(self, rhs: Self) -> Self::Output {
> +        Self(self.0 & rhs.0)
> +    }
> +}
> +
> +impl core::ops::Not for Attrs {
> +    type Output =3D Self;
> +    fn not(self) -> Self::Output {
> +        Self(!self.0)
> +    }
> +}
> +
> +/// DMA mapping attrributes.
> +pub mod attrs {
> +    use super::Attrs;
> +
> +    /// Specifies that reads and writes to the mapping may be weakly ord=
ered, that is that reads
> +    /// and writes may pass each other.
> +    pub const DMA_ATTR_WEAK_ORDERING: Attrs =3D Attrs(bindings::DMA_ATTR=
_WEAK_ORDERING);
> +
> +    /// Specifies that writes to the mapping may be buffered to improve =
performance.
> +    pub const DMA_ATTR_WRITE_COMBINE: Attrs =3D Attrs(bindings::DMA_ATTR=
_WRITE_COMBINE);
> +
> +    /// Lets the platform to avoid creating a kernel virtual mapping for=
 the allocated buffer.
> +    pub const DMA_ATTR_NO_KERNEL_MAPPING: Attrs =3D Attrs(bindings::DMA_=
ATTR_NO_KERNEL_MAPPING);
> +
> +    /// Allows platform code to skip synchronization of the CPU cache fo=
r the given buffer assuming
> +    /// that it has been already transferred to 'device' domain.
> +    pub const DMA_ATTR_SKIP_CPU_SYNC: Attrs =3D Attrs(bindings::DMA_ATTR=
_SKIP_CPU_SYNC);
> +
> +    /// Forces contiguous allocation of the buffer in physical memory.
> +    pub const DMA_ATTR_FORCE_CONTIGUOUS: Attrs =3D Attrs(bindings::DMA_A=
TTR_FORCE_CONTIGUOUS);
> +
> +    /// This is a hint to the DMA-mapping subsystem that it's probably n=
ot worth the time to try
> +    /// to allocate memory to in a way that gives better TLB efficiency.
> +    pub const DMA_ATTR_ALLOC_SINGLE_PAGES: Attrs =3D Attrs(bindings::DMA=
_ATTR_ALLOC_SINGLE_PAGES);
> +
> +    /// This tells the DMA-mapping subsystem to suppress allocation fail=
ure reports (similarly to
> +    /// __GFP_NOWARN).
> +    pub const DMA_ATTR_NO_WARN: Attrs =3D Attrs(bindings::DMA_ATTR_NO_WA=
RN);
> +
> +    /// Used to indicate that the buffer is fully accessible at an eleva=
ted privilege level (and
> +    /// ideally inaccessible or at least read-only at lesser-privileged =
levels).
> +    pub const DMA_ATTR_PRIVILEGED: Attrs =3D Attrs(bindings::DMA_ATTR_PR=
IVILEGED);
> +}
> +
> +/// An abstraction of the `dma_alloc_coherent` API.
> +///
> +/// This is an abstraction around the `dma_alloc_coherent` API which is =
used to allocate and map
> +/// large consistent DMA regions.
> +///
> +/// A [`CoherentAllocation`] instance contains a pointer to the allocate=
d region (in the
> +/// processor's virtual address space) and the device address which can =
be given to the device
> +/// as the DMA address base of the region. The region is released once [=
`CoherentAllocation`]
> +/// is dropped.
> +///
> +/// # Invariants
> +///
> +/// For the lifetime of an instance of [`CoherentAllocation`], the cpu a=
ddress is a valid pointer
> +/// to an allocated region of consistent memory and we hold a reference =
to the device.
> +pub struct CoherentAllocation<T: AsBytes + FromBytes> {
> +    dev: ARef<Device>,
> +    dma_handle: bindings::dma_addr_t,
> +    count: usize,
> +    cpu_addr: *mut T,
> +    dma_attrs: Attrs,
> +}
> +
> +impl<T: AsBytes + FromBytes> CoherentAllocation<T> {
> +    /// Allocates a region of `size_of::<T> * count` of consistent memor=
y.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::device::Device;
> +    /// use kernel::dma::{attrs::*, CoherentAllocation};
> +    ///
> +    /// # fn test(dev: &Device) -> Result {
> +    /// let c: CoherentAllocation<u64> =3D CoherentAllocation::alloc_att=
rs(dev.into(), 4, GFP_KERNEL,
> +    ///                                                                 =
 DMA_ATTR_NO_WARN)?;
> +    /// # Ok::<(), Error>(()) }
> +    /// ```
> +    pub fn alloc_attrs(
> +        dev: ARef<Device>,
> +        count: usize,
> +        gfp_flags: kernel::alloc::Flags,
> +        dma_attrs: Attrs,
> +    ) -> Result<CoherentAllocation<T>> {
> +        build_assert!(
> +            core::mem::size_of::<T>() > 0,
> +            "It doesn't make sense for the allocated type to be a ZST"
> +        );
> +
> +        let size =3D count
> +            .checked_mul(core::mem::size_of::<T>())
> +            .ok_or(EOVERFLOW)?;
> +        let mut dma_handle =3D 0;
> +        // SAFETY: device pointer is guaranteed as valid by invariant on=
 `Device`.
> +        // We ensure that we catch the failure on this function and thro=
w an ENOMEM
> +        let ret =3D unsafe {
> +            bindings::dma_alloc_attrs(
> +                dev.as_raw(),
> +                size,
> +                &mut dma_handle,
> +                gfp_flags.as_raw(),
> +                dma_attrs.as_raw(),
> +            )
> +        };
> +        if ret.is_null() {
> +            return Err(ENOMEM);
> +        }
> +        // INVARIANT: We just successfully allocated a coherent region w=
hich is accessible for
> +        // `count` elements, hence the cpu address is valid. We also hol=
d a refcounted reference
> +        // to the device.
> +        Ok(Self {
> +            dev,
> +            dma_handle,
> +            count,
> +            cpu_addr: ret as *mut T,
> +            dma_attrs,
> +        })
> +    }
> +
> +    /// Performs the same functionality as `alloc_attrs`, except the `dm=
a_attrs` is 0 by default.
> +    pub fn alloc_coherent(
> +        dev: ARef<Device>,
> +        count: usize,
> +        gfp_flags: kernel::alloc::Flags,
> +    ) -> Result<CoherentAllocation<T>> {
> +        CoherentAllocation::alloc_attrs(dev, count, gfp_flags, Attrs(0))
> +    }
> +
> +    /// Returns the device, base address, dma handle, attributes and the=
 size of the
> +    /// allocated region.
> +    ///
> +    /// The caller takes ownership of the returned resources, i.e., will=
 have the responsibility
> +    /// in calling `bindings::dma_free_attrs`. The allocated region is v=
alid as long as
> +    /// the returned device exists.
> +    pub fn into_parts(
> +        self,
> +    ) -> (
> +        ARef<Device>,
> +        *mut T,
> +        bindings::dma_addr_t,
> +        crate::ffi::c_ulong,
> +        usize,
> +    ) {
> +        let size =3D self.count * core::mem::size_of::<T>();
> +        let ret =3D (
> +            self.dev.clone(),

Calling clone here increments the refcount, but you don't want to do
that since it leaks a count.

otherwise lgtm

Alice
