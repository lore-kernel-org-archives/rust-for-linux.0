Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E765919F104
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 12:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731329730; cv=none; b=ADRmrKvoKpMjSgicHeQSjHjb9UcSdrz26zIIuaLA7UO8rmbj3mpafjCUwACW9YsjdqalmQTMOl35hDYY0CEZhZL3wye1mvJKtlfJUS8jyN7NqsIEiSHhcmf1ca/9oZ5/Rq/RNOJJ/xs8+LXrhIuIy9qgkTUQufCoJMig+XlKzzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731329730; c=relaxed/simple;
	bh=dXhXfapyUDQEbFeWVi7uYgynRavOsGzrjhod9hhDxkY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S0Fa54yajQgfssGWBtiqOA9+flM1pc901XLNQ56J7JldVSXenkW0BC+J34d/ZfAzuEb0O7x13HVYpWp3EQuFVhf+kGyYoTLgPXnnpz3luy3/GPJp/VUwOc8/NV8lB2Kly2IYOXq38xfP4bqE/XioBaaHkVJkPASHOJ3/z7Lt678=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIvZMQ1+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIvZMQ1+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BA0C4CED7;
	Mon, 11 Nov 2024 12:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731329729;
	bh=dXhXfapyUDQEbFeWVi7uYgynRavOsGzrjhod9hhDxkY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LIvZMQ1+ZxGKBGMRP3Rw7AgZJwq3RNhIu2v5NCRqven9DYtLt3xJgwV0vK1nwD15y
	 cefuR3F9tfxoGS/1hKbSicwwwz5RSv7pJW0dJowBWAHO13LmUYTWvMlU6ifQcUXGtE
	 S5Hy5ukEAL6+pVXYg1LfwlyoVijfc0tPv1o/b96RhjzB3HG7OQypcfFcDo6b5Lok4D
	 wUIeQ3R5umgEuXXhLfFFbWOI8YwKMFbvRwOHjWq2Z0ljwVY2LH32iHaOoxw1AVFd+6
	 vGR1+3YIvZSyQmV9tHjcsTMoI+5gLh+Yo+efTPDfHsQpVBKEu41swiIFin3b3r3M36
	 YoQPNK8nvyCsA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Abdiel Janulgue" <abdiel.janulgue@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>,  <aliceryhl@google.com>,
  <daniel.almeida@collabora.com>,  <dakr@redhat.com>,
  <airlied@redhat.com>,  <miguel.ojeda.sandonis@gmail.com>,
  <wedsonaf@gmail.com>,  <a.hindborg@samsung.com>
Subject: Re: [PATCH v4 2/2] rust: add dma coherent allocator abstraction.
In-Reply-To: <20241105104726.3111058-3-abdiel.janulgue@gmail.com> (Abdiel
	Janulgue's message of "Tue, 05 Nov 2024 12:46:57 +0200")
References: <20241105104726.3111058-1-abdiel.janulgue@gmail.com>
	<8jTLfoUiWkunCHYeNi0cgz1kZH1a8JrtKeW2Y9GRS1AgEZmt1dercUTHHJN54C0FPjtjUTyXpIjDFoF0hofx2A==@protonmail.internalid>
	<20241105104726.3111058-3-abdiel.janulgue@gmail.com>
Date: Mon, 11 Nov 2024 13:55:16 +0100
Message-ID: <87v7wurkuj.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Abdiel Janulgue" <abdiel.janulgue@gmail.com> writes:

> Add a simple dma coherent allocator rust abstraction. Based on
> Andreas Hindborg's dma abstractions from the rnvme driver.
>
> Co-developed-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Co-developed-by: Andreas Hindborg <a.hindborg@samsung.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
> Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/dma.rs              | 169 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   1 +
>  3 files changed, 171 insertions(+)
>  create mode 100644 rust/kernel/dma.rs
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index a80783fcbe04..3ff2abbfaef6 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -10,6 +10,7 @@
>  #include <linux/blk-mq.h>
>  #include <linux/blk_types.h>
>  #include <linux/blkdev.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/errname.h>
>  #include <linux/ethtool.h>
>  #include <linux/firmware.h>
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
> +//! C header: [`include/linux/dma-mapping.h`](srctree/include/linux/dma-mapping.h)
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
> +/// For the lifetime of an instance of CoherentAllocation, the cpu address is a valid pointer
> +/// to an allocated region of consistent memory and we hold a reference to the device.
> +pub struct CoherentAllocation<T: AsBytes + FromBytes> {
> +    dev: ARef<Device>,
> +    dma_handle: bindings::dma_addr_t,
> +    count: usize,
> +    cpu_addr: *mut T,
> +}
> +
> +impl<T: AsBytes + FromBytes> CoherentAllocation<T> {
> +    /// Allocates a region of `size_of::<T> * count` of consistent memory.
> +    ///
> +    /// Returns a CoherentAllocation object which contains a pointer to the allocated region
> +    /// (in the processor's virtual address space) and the device address which can be
> +    /// given to the device as the DMA address base of the region. The region is released once
> +    /// [`CoherentAllocation`] is dropped.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::device::Device;
> +    /// use kernel::dma::CoherentAllocation;
> +    ///
> +    /// # fn dox(dev: &Device) -> Result<()> {
> +    /// let c: CoherentAllocation<u64> = CoherentAllocation::alloc_coherent(dev, 4, GFP_KERNEL)?;
> +    /// # Ok(()) }
> +    /// ```
> +    pub fn alloc_coherent(
> +        dev: &Device,
> +        count: usize,
> +        flags: kernel::alloc::Flags,
> +    ) -> Result<CoherentAllocation<T>> {
> +        let t_size = core::mem::size_of::<T>();
> +        if t_size == 0 {
> +            return Err(EINVAL)
> +        }

Can this be a `build_assert!()`?

> +
> +        let size = count.checked_mul(t_size).ok_or(EOVERFLOW)?;
> +        let mut dma_handle = 0;
> +        // SAFETY: device pointer is guaranteed as valid by invariant on `Device`.
> +        // We ensure that we catch the failure on this function and throw an ENOMEM
> +        let ret = unsafe {
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

I think we need an `// Invariant:` block here. See [1] for an example.

> +        Ok(Self {
> +            dev: dev.into(),
> +            dma_handle,
> +            count,
> +            cpu_addr: ret as _,

Please use an explicit cast here.

> +        })
> +    }
> +
> +    /// Reads a value on a location specified by index.
> +    pub fn read(&self, index: usize) -> Result<T>
> +    where
> +        T: Copy
> +    {
> +        if let Some(val) = self.cpu_buf().get(index) {
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
> +        if let Some(elem) = self.cpu_buf_mut().get_mut(index) {
> +            *elem = *value;
> +            Ok(())
> +        } else {
> +            Err(EINVAL)
> +        }
> +    }
> +
> +    /// Performs a read and then a write of a value on a location specified by index.
> +    pub fn read_write(&mut self, index: usize, value: &T) -> Result<T>
> +    where
> +        T: Copy,
> +    {
> +        if let Some(elem) = self.cpu_buf_mut().get_mut(index) {
> +            let val = *elem;
> +            *elem = *value;
> +            Ok(val)
> +        } else {
> +            Err(EINVAL)
> +        }
> +    }
> +
> +    /// Returns the base address to the allocated region and the dma handle.
> +    /// Caller takes ownership of returned resources.
> +    pub fn into_parts(self) -> (usize, bindings::dma_addr_t) {
> +        let ret = (self.cpu_addr as _, self.dma_handle);
> +        core::mem::forget(self);
> +        ret
> +    }
> +
> +    /// Returns the base address to the allocated region in the CPU's virtual address space.
> +    pub fn start_ptr(&self) -> *const T {
> +        self.cpu_addr as _

Please use an explicit cast (ptr::cast, ptr::cast_mut, ptr::cast_const).

> +    }
> +
> +    /// Returns the base address to the allocated region in the CPU's virtual address space as
> +    /// a mutable pointer.
> +    pub fn start_ptr_mut(&mut self) -> *mut T {
> +        self.cpu_addr
> +    }
> +
> +    /// Returns a DMA handle which may given to the device as the DMA address base of
> +    /// the region.
> +    pub fn dma_handle(&self) -> bindings::dma_addr_t {
> +        self.dma_handle
> +    }
> +
> +    fn cpu_buf(&self) -> &[T]

I think someone suggested elsewhere to make the slice publicly
available. Is there any reason not to make this and the `mut` version
public?

> +    {
> +        // SAFETY: The pointer is valid due to type invariant on `CoherentAllocation` and
> +        // is valid for reads for `self.count * size_of::<T>` bytes.
> +        unsafe { core::slice::from_raw_parts(self.cpu_addr, self.count) }
> +    }
> +
> +    fn cpu_buf_mut(&mut self) -> &mut [T]
> +    {
> +        // SAFETY: The pointer is valid due to type invariant on `CoherentAllocation` and
> +        // is valid for reads for `self.count * size_of::<T>` bytes.

But you are handing out an exclusive reference, so valid for reads is
not enough.


Best regards,
Andreas Hindborg



[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/sync/arc.rs?h=v6.12-rc7#n200

