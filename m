Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58336204F77
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Nov 2024 16:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730911247; cv=pass; b=i6Ph85iO/JqMbePArf42b5iIate7ZcKW5hvTHPhINmlSmkPEMv5bR4VEgk/iCsZ9yx8GAU9rURmng5CCDLezALAV2DBS0b5sdM5nLnppFt5NAkvC2BEXcO8hiNv421gVkuj09qmdc+B2kR0YW4HqzGqZ8OjcL6UxpR1vsgQFLsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730911247; c=relaxed/simple;
	bh=WrWUug4QYHnBA6KqwI9TOrUuzW1F2akT3atIRgNko3U=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=MPdzqMt42xI34bgqwehqmPLPY/PZjHfwmalXqgBKV4ZJj3fTYM8qtYbkMAQS4BSuTQdAnY9PnMxafx1my8gBeODSuKZWtuk2sdr2tLJ92x6VVd106f07+aKDDs6W+isXJKygxSK7ZUbQEezEaXlwd9VDGLCYSrVcGi9pl/WoqV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=LNIDT1YN; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="LNIDT1YN"
ARC-Seal: i=1; a=rsa-sha256; t=1730911234; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jBekc8S+7z1snr9onptL54xpuFbGxrTbMLxZlbIA8Dt9W3/cZD95xZYfyRlGtG9Dfj/j7q0DNYN34G+vPF/zKDg/m/qGAoBP8T/WzXMFLMauNIY+MFIuXrSuMk4xGSBLEisoghfEq788FazhMDYIoGwX3IQ84kTPXdqAdgonBeU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730911234; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yJaDetvy4gqFNHhTbPrSVD7B0ahCTawuXcmasFBo4D8=; 
	b=VuMCSN/fGi7+fmx5Z8iBtFBXCD266Vq3eVYUAU7OYX/TNiYao7vuKpnCfEsMI9PmYOdRNNnzzCvHb3LcrdAqVspaCm/Jofdzprh9po56CsT8HEYXttnX0Mq1ee4Qe95rdNy7LIE8UXOmkUoFkfa+Ftx735tlWv9gd3i9oXEwSYc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730911234;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=yJaDetvy4gqFNHhTbPrSVD7B0ahCTawuXcmasFBo4D8=;
	b=LNIDT1YNPjuUIG4fMki23k57FtQgHuqzwfZ75j6fNkUbirYtB11nB0ncCQALHUQy
	4geh3Z66p5pLNlxdMmXXyl1yWkH4soCm/k+7WmTZl64e3L6blq7i/5lBKogh1a4uc4T
	EZBh3JwkMkxYDpw6D2bbfM4ByzqFXJguRxSsWqcw=
Received: by mx.zohomail.com with SMTPS id 1730911232626143.0306953931347;
	Wed, 6 Nov 2024 08:40:32 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v4 2/2] rust: add dma coherent allocator abstraction.
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20241105104726.3111058-3-abdiel.janulgue@gmail.com>
Date: Wed, 6 Nov 2024 13:40:17 -0300
Cc: rust-for-linux@vger.kernel.org,
 aliceryhl@google.com,
 a.hindborg@kernel.org,
 dakr@redhat.com,
 airlied@redhat.com,
 miguel.ojeda.sandonis@gmail.com,
 wedsonaf@gmail.com,
 a.hindborg@samsung.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <81E07830-0A54-49C8-AC07-6511F6C816C4@collabora.com>
References: <20241105104726.3111058-1-abdiel.janulgue@gmail.com>
 <20241105104726.3111058-3-abdiel.janulgue@gmail.com>
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
X-Mailer: Apple Mail (2.3826.200.121)
X-ZohoMailClient: External

Hi Abdiel,


> On 5 Nov 2024, at 07:46, Abdiel Janulgue <abdiel.janulgue@gmail.com> =
wrote:
>=20
> Add a simple dma coherent allocator rust abstraction. Based on
> Andreas Hindborg's dma abstractions from the rnvme driver.
>=20
> Co-developed-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Co-developed-by: Andreas Hindborg <a.hindborg@samsung.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
> Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
> ---
> rust/bindings/bindings_helper.h |   1 +
> rust/kernel/dma.rs              | 169 ++++++++++++++++++++++++++++++++
> rust/kernel/lib.rs              |   1 +
> 3 files changed, 171 insertions(+)
> create mode 100644 rust/kernel/dma.rs
>=20
> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
> index a80783fcbe04..3ff2abbfaef6 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -10,6 +10,7 @@
> #include <linux/blk-mq.h>
> #include <linux/blk_types.h>
> #include <linux/blkdev.h>
> +#include <linux/dma-mapping.h>
> #include <linux/errname.h>
> #include <linux/ethtool.h>
> #include <linux/firmware.h>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> new file mode 100644
> index 000000000000..3311fc99e5df
> --- /dev/null
> +++ b/rust/kernel/dma.rs
> @@ -0,0 +1,169 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Direct memory access (DMA).
> +//!
> +//! C header: =
[`include/linux/dma-mapping.h`](srctree/include/linux/dma-mapping.h)
> +
> +use crate::{
> +    bindings,
> +    device::Device,
> +    error::code::*,
> +    error::Result,
> +    types::ARef,
> +    transmute::{AsBytes, FromBytes},
> +};
> +
> +/// Abstraction of dma_alloc_coherent
> +///
> +/// # Invariants
> +///
> +/// For the lifetime of an instance of CoherentAllocation, the cpu =
address is a valid pointer
> +/// to an allocated region of consistent memory and we hold a =
reference to the device.
> +pub struct CoherentAllocation<T: AsBytes + FromBytes> {
> +    dev: ARef<Device>,
> +    dma_handle: bindings::dma_addr_t,
> +    count: usize,
> +    cpu_addr: *mut T,
> +}
> +
> +impl<T: AsBytes + FromBytes> CoherentAllocation<T> {
> +    /// Allocates a region of `size_of::<T> * count` of consistent =
memory.
> +    ///
> +    /// Returns a CoherentAllocation object which contains a pointer =
to the allocated region
> +    /// (in the processor's virtual address space) and the device =
address which can be
> +    /// given to the device as the DMA address base of the region. =
The region is released once
> +    /// [`CoherentAllocation`] is dropped.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::device::Device;
> +    /// use kernel::dma::CoherentAllocation;
> +    ///
> +    /// # fn dox(dev: &Device) -> Result<()> {
> +    /// let c: CoherentAllocation<u64> =3D =
CoherentAllocation::alloc_coherent(dev, 4, GFP_KERNEL)?;
> +    /// # Ok(()) }
> +    /// ```
> +    pub fn alloc_coherent(
> +        dev: &Device,
> +        count: usize,
> +        flags: kernel::alloc::Flags,
> +    ) -> Result<CoherentAllocation<T>> {
> +        let t_size =3D core::mem::size_of::<T>();
> +        if t_size =3D=3D 0 {
> +            return Err(EINVAL)
> +        }
> +
> +        let size =3D count.checked_mul(t_size).ok_or(EOVERFLOW)?;
> +        let mut dma_handle =3D 0;
> +        // SAFETY: device pointer is guaranteed as valid by invariant =
on `Device`.
> +        // We ensure that we catch the failure on this function and =
throw an ENOMEM
> +        let ret =3D unsafe {
> +            bindings::dma_alloc_attrs(
> +                dev.as_raw(),
> +                size,
> +                &mut dma_handle, flags.as_raw(),
> +                0,
> +            )
> +        };
> +        if ret.is_null() {
> +            return Err(ENOMEM)
> +        }
> +
> +        Ok(Self {
> +            dev: dev.into(),
> +            dma_handle,
> +            count,
> +            cpu_addr: ret as _,
> +        })
> +    }
> +
> +    /// Reads a value on a location specified by index.
> +    pub fn read(&self, index: usize) -> Result<T>
> +    where
> +        T: Copy
> +    {
> +        if let Some(val) =3D self.cpu_buf().get(index) {
> +            Ok(*val)
> +        } else {
> +            Err(EINVAL)
> +        }
> +    }
> +
> +    /// Write a value on the memory location specified by index.
> +    pub fn write(&mut self, index: usize, value: &T) -> Result
> +    where
> +        T: Copy,
> +    {
> +        if let Some(elem) =3D self.cpu_buf_mut().get_mut(index) {
> +            *elem =3D *value;
> +            Ok(())
> +        } else {
> +            Err(EINVAL)
> +        }
> +    }


Calling `get/get_mut()` for each T seems a bit of too much overhead.

If T is u32, for example, I expect a driver to want to read or write
a significant number of them at once. This should be common
if you want to read or write raw bytes.

You should probably make the CPU-addressable region available
to users after validating if the range asked is within bounds.

Luckily, cpu_buf() will already tie the lifetime of the slice to &self,
so they cannot touch that memory if the mapping is gone.

The fact that reads/writes will copy the memory is also a bit =
problematic
given that you can offer access to the underlying buffer without copying
anything. Also, the bound on `FromBytes/AsBytes` is, for now, a de facto
bound on `Copy`, since it is only implemented for types which themselves
implement Copy, i.e.:

```
// SAFETY: All bit patterns are acceptable values of the types below.
unsafe impl FromBytes for u8 {}
unsafe impl FromBytes for u16 {}
unsafe impl FromBytes for u32 {}
unsafe impl FromBytes for u64 {}
unsafe impl FromBytes for usize {}
unsafe impl FromBytes for i8 {}
unsafe impl FromBytes for i16 {}
unsafe impl FromBytes for i32 {}
unsafe impl FromBytes for i64 {}
unsafe impl FromBytes for isize {}
// SAFETY: If all bit patterns are acceptable for individual values in =
an array, then all bit
// patterns are also acceptable for arrays of that type.
unsafe impl<T: FromBytes> FromBytes for [T] {}
unsafe impl<T: FromBytes, const N: usize> FromBytes for [T; N] {}
```

Also, I think FromBytes is a bit restrictive here. In a lot of places, =
drivers
expect to be able to cast the mapping to a given struct whose definition
was sourced from some technical document or vendor code somewhere.

For example, here is some code for the H.264 decoder in the `rkvdec`
driver:

```
	struct rkvdec_h264_priv_tbl *priv_tbl;

<cut>

	priv_tbl =3D dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
				      &h264_ctx->priv_tbl.dma, =
GFP_KERNEL);
```

Where `struct rkvdec_h264_priv_tbl` is:

```
struct rkvdec_h264_scaling_list {
	u8 scaling_list_4x4[6][16];
	u8 scaling_list_8x8[6][64];
	u8 padding[128];
};

struct rkvdec_sps_pps_packet {
	u32 info[8];
};

/* Data structure describing auxiliary buffer format. */
struct rkvdec_h264_priv_tbl {
	s8 cabac_table[4][464][2];
	struct rkvdec_h264_scaling_list scaling_list;
	u32 rps[RKV_RPS_SIZE];
	struct rkvdec_sps_pps_packet param_set[256];
	u8 err_info[RKV_ERROR_INFO_SIZE];
};
```=09
=20
IMHO we should somehow support that, assuming that all members
implement `FromBytes/AsBytes`, and that the structure is #[repr(C)].

Not sure how right now, but we should.

The alternative would be extremely tedious and itself error-prone.
=20
> +
> +    /// Performs a read and then a write of a value on a location =
specified by index.
> +    pub fn read_write(&mut self, index: usize, value: &T) -> =
Result<T>
> +    where
> +        T: Copy,
> +    {
> +        if let Some(elem) =3D self.cpu_buf_mut().get_mut(index) {
> +            let val =3D *elem;
> +            *elem =3D *value;
> +            Ok(val)
> +        } else {
> +            Err(EINVAL)
> +        }
> +    }
> +
> +    /// Returns the base address to the allocated region and the dma =
handle.
> +    /// Caller takes ownership of returned resources.
> +    pub fn into_parts(self) -> (usize, bindings::dma_addr_t) {
> +        let ret =3D (self.cpu_addr as _, self.dma_handle);
> +        core::mem::forget(self);
> +        ret
> +    }
> +
> +    /// Returns the base address to the allocated region in the CPU's =
virtual address space.
> +    pub fn start_ptr(&self) -> *const T {
> +        self.cpu_addr as _
> +    }
> +
> +    /// Returns the base address to the allocated region in the CPU's =
virtual address space as
> +    /// a mutable pointer.
> +    pub fn start_ptr_mut(&mut self) -> *mut T {
> +        self.cpu_addr
> +    }
> +
> +    /// Returns a DMA handle which may given to the device as the DMA =
address base of
> +    /// the region.
> +    pub fn dma_handle(&self) -> bindings::dma_addr_t {
> +        self.dma_handle
> +    }
> +
> +    fn cpu_buf(&self) -> &[T]
> +    {
> +        // SAFETY: The pointer is valid due to type invariant on =
`CoherentAllocation` and
> +        // is valid for reads for `self.count * size_of::<T>` bytes.
> +        unsafe { core::slice::from_raw_parts(self.cpu_addr, =
self.count) }
> +    }
> +
> +    fn cpu_buf_mut(&mut self) -> &mut [T]
> +    {
> +        // SAFETY: The pointer is valid due to type invariant on =
`CoherentAllocation` and
> +        // is valid for reads for `self.count * size_of::<T>` bytes.
> +        unsafe { core::slice::from_raw_parts_mut(self.cpu_addr, =
self.count) }
> +    }
> +}
> +
> +impl<T: AsBytes + FromBytes> Drop for CoherentAllocation<T> {
> +    fn drop(&mut self) {
> +        let size =3D self.count * core::mem::size_of::<T>();
> +        // SAFETY: the device, cpu address, and the dma handle is =
valid due to the
> +        // type invariants on `CoherentAllocation`.
> +        unsafe { bindings::dma_free_attrs(self.dev.as_raw(), size,
> +                                          self.cpu_addr as _,
> +                                          self.dma_handle, 0) }
> +    }
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index b62451f64f6e..b713c92eb1ef 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -32,6 +32,7 @@
> pub mod block;
> mod build_assert;
> pub mod device;
> +pub mod dma;
> pub mod error;
> #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
> pub mod firmware;
> --=20
> 2.43.0
>=20
>=20


=E2=80=94 Daniel=
