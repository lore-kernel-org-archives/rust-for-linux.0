Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1796D38D;
	Mon, 16 Feb 2026 04:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771216568; cv=pass; b=Nuf3MBq0gpgVrV0+/KjI4hiyCewJqNBa7bnFSAlyM2TIMtAkJG+drDDR0I3R04JGizz85O/0vuF6+WHrkD6UkAW6VNzAjzQexnKbJ3UuxIai0UkMBoKS7brPiGYezyLupEBiaAvSr/ob+t28L8zKsS0JKLRpr3DeoIrVyanNtf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771216568; c=relaxed/simple;
	bh=RkCtiNyNiY0YodGJajitosUYmrTNJtY14KJ64mhY9XE=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=DFn0QlywdHhY39Jk2OW8Ky3qZQei9kGrvVkNYRdpsIVD6sqsLVUYTGV1sOnrl27og1PF9gCZ0pn/LTh+m+UgPKUUt47M6x1mtZJHVnfJkDRJ17cslkZpoVrLgzRmeIExe/KFmWB5ErUAoB/HzTn+vLPHZTjXu+fPXJ3wA1S2ess=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=CvpKZn+N; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="CvpKZn+N"
ARC-Seal: i=1; a=rsa-sha256; t=1771216552; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aNqh0U7CGeGddizOkMv6zfpDMJXN4Z2ICvjcBHYEsCR0aOHyrU1h7DxqzhKpEKpGb0voKvafHxtcRKmMES3Rv/yffDJgerL6RvU9xZNV6QcSmuOtwo0ysGfofF5CYOSV9rHOWVOqum5EoOz4GnzY4VZ0On8pfxDH0+ONMiA/5SA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771216552; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hVfeAILE2lZx7TCBVnEvsj8t327Ef3dkfh1mvatqLqs=; 
	b=JWVCkwm/PxC0z0t0PDK+Qrbe6PXHtYGje0g1kfoweB+L9Q7BCWpV6bNGUk3q7ThCwQmXlZ4ngPHhL2/s3eQO3BYvHkMTqMPZ3gZe7pxlCGRECHMzF4rrs83rmd/UMirl6JkhDjMfQhXKLzQceKAWA3ZUeJDN5zcPruAfFTzPBnQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771216552;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:References:Cc:Cc:In-Reply-To:To:To:Reply-To;
	bh=hVfeAILE2lZx7TCBVnEvsj8t327Ef3dkfh1mvatqLqs=;
	b=CvpKZn+N9L8YZs0aVaJl/tE/SIbAlykMma3PZosHHp24gair2IvoH3TPlrMZgJ7H
	yB5LpHEe5pANimjFg8W80Cb55ntrIvhGDfKsZgTDtELgUh9YK1uzdOBe3xsfxPY8TQf
	MGF77Q40O1M+gj+95PLq9Kj6Ee1nMrgQ+Cau5NeM=
Received: by mx.zohomail.com with SMTPS id 1771216549493252.08225657227854;
	Sun, 15 Feb 2026 20:35:49 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Daniel Almeida <daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] rust: add a ring buffer implementation
Date: Mon, 16 Feb 2026 01:35:34 -0300
Message-Id: <5FC9A56C-2CC0-478E-B2F9-33C326C219B7@collabora.com>
References: <20260215-ringbuffer-v1-1-9b359758a1b6@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Andreas Hindborg <a.hindborg@kernel.org>
In-Reply-To: <20260215-ringbuffer-v1-1-9b359758a1b6@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: iPhone Mail (23D127)
X-ZohoMailClient: External


Hi Andreas,

> On 15 Feb 2026, at 17:25, Andreas Hindborg <a.hindborg@kernel.org> wrote:
>=20
> =EF=BB=BFAdd a fixed-capacity FIFO ring buffer. The implementation uses a c=
ircular
> buffer with head and tail pointers, providing constant-time push and pop
> operations.
>=20
> The module includes a few tests covering basic operations, wrap-around
> behavior, interleaved push/pop sequences, and edge cases such as
> single-capacity buffers.
>=20
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> rust/kernel/lib.rs        |   1 +
> rust/kernel/ringbuffer.rs | 321 ++++++++++++++++++++++++++++++++++++++++++=
++++
> 2 files changed, 322 insertions(+)
>=20
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index f812cf1200428..d6555ccceb32f 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -133,6 +133,7 @@
> pub mod rbtree;
> pub mod regulator;
> pub mod revocable;
> +pub mod ringbuffer;
> pub mod scatterlist;
> pub mod security;
> pub mod seq_file;
> diff --git a/rust/kernel/ringbuffer.rs b/rust/kernel/ringbuffer.rs
> new file mode 100644
> index 0000000000000..9a66ebf1bb390
> --- /dev/null
> +++ b/rust/kernel/ringbuffer.rs
> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A fixed-capacity FIFO ring buffer.
> +//!
> +//! This module provides [`RingBuffer`], a circular buffer implementation=
 that
> +//! supports efficient push and pop operations at opposite ends of the bu=
ffer.
> +
> +use kernel::prelude::*;
> +
> +/// A fixed-capacity FIFO ring buffer.
> +///
> +/// `RingBuffer` is a circular buffer that allows pushing elements to the=
 head
> +/// and popping elements from the tail in constant time. The buffer has a=
 fixed
> +/// capacity specified at construction time and will return an error if a=
 push
> +/// is attempted when full.
> +///
> +/// # Invariants
> +///
> +/// - `self.head` points at the next empty slot.
> +/// - `self.tail` points at the last full slot, except if the buffer is e=
mpty.
> +/// - The buffer is empty when `self.head =3D=3D self.tail`.
> +/// - The buffer will always have at least one empty slot, even when full=
.
> +pub struct RingBuffer<T> {
> +    nodes: KVec<Option<T>>,
> +    size: usize,
> +    head: usize,
> +    tail: usize,
> +}
> +
> +impl<T> RingBuffer<T> {
> +    /// Creates a new `RingBuffer` with the specified capacity.
> +    ///
> +    /// The buffer will be able to hold exactly `capacity` elements. Memo=
ry is
> +    /// allocated during construction.
> +    ///
> +    /// # Errors
> +    ///
> +    /// Returns an error if memory allocation fails.
> +    pub fn new(capacity: usize) -> Result<Self> {
> +        let mut this =3D Self {
> +            nodes: KVec::with_capacity(capacity + 1, GFP_KERNEL)?,
> +            size: capacity + 1,
> +            head: 0,
> +            tail: 0,
> +        };
> +
> +        for _ in 0..this.size {
> +            this.nodes.push_within_capacity(None)?;
> +        }
> +
> +        Ok(this)
> +    }
> +
> +    /// Returns `true` if the buffer is full.
> +    ///
> +    /// When the buffer is full, any call to [`push_head`] will return an=
 error.
> +    ///
> +    /// [`push_head`]: Self::push_head
> +    pub fn full(&self) -> bool {
> +        (self.head + 1) % self.size =3D=3D self.tail
> +    }
> +
> +    fn empty(&self) -> bool {
> +        self.head =3D=3D self.tail
> +    }
> +
> +    /// Returns the number of available slots in the buffer.
> +    ///
> +    /// This is the number of elements that can be pushed before the buff=
er
> +    /// becomes full.
> +    pub fn free_count(&self) -> usize {
> +        (if self.head >=3D self.tail {
> +            self.size - (self.head - self.tail)
> +        } else {
> +            (self.size - self.tail) + self.head
> +        } - 1)
> +    }
> +
> +    /// Pushes a value to the head of the buffer.
> +    ///
> +    /// # Errors
> +    ///
> +    /// Returns [`ENOSPC`] if the buffer is full.
> +    pub fn push_head(&mut self, value: T) -> Result {
> +        if self.full() {
> +            return Err(ENOSPC);
> +        }
> +
> +        self.nodes[self.head] =3D Some(value);
> +        self.head =3D (self.head + 1) % self.size;
> +
> +        Ok(())
> +    }
> +
> +    /// Pops and returns the value at the tail of the buffer.
> +    ///
> +    /// Returns `None` if the buffer is empty. Values are returned in FIFO=

> +    /// order, i.e., the oldest value is returned first.
> +    pub fn pop_tail(&mut self) -> Option<T> {
> +        if self.empty() {
> +            return None;
> +        }
> +
> +        let value =3D self.nodes[self.tail].take();
> +        self.tail =3D (self.tail + 1) % self.size;
> +        value
> +    }
> +}
> +
> +impl<T> Drop for RingBuffer<T> {
> +    fn drop(&mut self) {
> +        while !self.empty() {
> +            drop(self.pop_tail().expect("Not empty"));
> +        }
> +    }
> +}
> +
> +#[kunit_tests(rust_kernel_ringbuffer)]
> +mod tests {
> +    use super::*;
> +
> +    #[test]
> +    fn test_new_buffer_is_empty() {
> +        let buffer: RingBuffer<i32> =3D RingBuffer::new(5).expect("Failed=
 to create buffer");
> +        assert!(!buffer.full());
> +        assert!(buffer.empty());
> +    }
> +
> +    #[test]
> +    fn test_new_buffer_has_correct_capacity() {
> +        let capacity =3D 10;
> +        let buffer: RingBuffer<i32> =3D RingBuffer::new(capacity).expect(=
"Failed to create buffer");
> +        assert_eq!(buffer.free_count(), capacity);
> +    }
> +
> +    #[test]
> +    fn test_push_single_element() {
> +        let mut buffer: RingBuffer<i32> =3D RingBuffer::new(5).expect("Fa=
iled to create buffer");
> +        assert!(buffer.push_head(42).is_ok());
> +        assert!(!buffer.empty());
> +        assert!(!buffer.full());
> +    }
> +
> +    #[test]
> +    fn test_push_and_pop_single_element() {
> +        let mut buffer: RingBuffer<i32> =3D RingBuffer::new(5).expect("Fa=
iled to create buffer");
> +        buffer.push_head(42).expect("Failed to push");
> +        let value =3D buffer.pop_tail();
> +        assert_eq!(value, Some(42));
> +        assert!(buffer.empty());
> +    }
> +
> +    #[test]
> +    fn test_push_and_pop_multiple_elements() {
> +        let mut buffer: RingBuffer<i32> =3D RingBuffer::new(5).expect("Fa=
iled to create buffer");
> +
> +        for i in 0..5 {
> +            buffer.push_head(i).expect("Failed to push");
> +        }
> +
> +        for i in 0..5 {
> +            assert_eq!(buffer.pop_tail(), Some(i));
> +        }
> +
> +        assert!(buffer.empty());
> +    }
> +
> +    #[test]
> +    fn test_pop_from_empty_buffer() {
> +        let mut buffer: RingBuffer<i32> =3D RingBuffer::new(5).expect("Fa=
iled to create buffer");
> +        assert_eq!(buffer.pop_tail(), None);
> +    }
> +
> +    #[test]
> +    fn test_buffer_full() {
> +        let capacity =3D 3;
> +        let mut buffer: RingBuffer<i32> =3D
> +            RingBuffer::new(capacity).expect("Failed to create buffer");
> +
> +        for i in 0..capacity {
> +            assert!(buffer.push_head(i as i32).is_ok());
> +        }
> +
> +        assert!(buffer.full());
> +        assert_eq!(buffer.free_count(), 0);
> +    }
> +
> +    #[test]
> +    fn test_push_to_full_buffer_fails() {
> +        let capacity =3D 3;
> +        let mut buffer: RingBuffer<i32> =3D
> +            RingBuffer::new(capacity).expect("Failed to create buffer");
> +
> +        for i in 0..capacity {
> +            buffer.push_head(i as i32).expect("Failed to push");
> +        }
> +
> +        assert!(buffer.full());
> +        assert!(buffer.push_head(999).is_err());
> +    }
> +
> +    #[test]
> +    fn test_free_count_decreases_on_push() {
> +        let capacity =3D 5;
> +        let mut buffer: RingBuffer<i32> =3D
> +            RingBuffer::new(capacity).expect("Failed to create buffer");
> +
> +        assert_eq!(buffer.free_count(), capacity);
> +
> +        for i in 0..capacity {
> +            buffer.push_head(i as i32).expect("Failed to push");
> +            assert_eq!(buffer.free_count(), capacity - i - 1);
> +        }
> +    }
> +
> +    #[test]
> +    fn test_free_count_increases_on_pop() {
> +        let capacity =3D 5;
> +        let mut buffer: RingBuffer<i32> =3D
> +            RingBuffer::new(capacity).expect("Failed to create buffer");
> +
> +        for i in 0..capacity {
> +            buffer.push_head(i as i32).expect("Failed to push");
> +        }
> +
> +        assert_eq!(buffer.free_count(), 0);
> +
> +        for i in 1..=3Dcapacity {
> +            buffer.pop_tail();
> +            assert_eq!(buffer.free_count(), i);
> +        }
> +    }
> +
> +    #[test]
> +    fn test_wrap_around_behavior() {
> +        let capacity =3D 3;
> +        let mut buffer: RingBuffer<i32> =3D
> +            RingBuffer::new(capacity).expect("Failed to create buffer");
> +
> +        // Fill the buffer.
> +        for i in 0..capacity {
> +            buffer.push_head(i as i32).expect("Failed to push");
> +        }
> +
> +        // Pop two elements.
> +        assert_eq!(buffer.pop_tail(), Some(0));
> +        assert_eq!(buffer.pop_tail(), Some(1));
> +
> +        // Push two more (should wrap around).
> +        buffer.push_head(10).expect("Failed to push");
> +        buffer.push_head(11).expect("Failed to push");
> +
> +        // Verify order.
> +        assert_eq!(buffer.pop_tail(), Some(2));
> +        assert_eq!(buffer.pop_tail(), Some(10));
> +        assert_eq!(buffer.pop_tail(), Some(11));
> +        assert!(buffer.empty());
> +    }
> +
> +    #[test]
> +    fn test_fifo_order() {
> +        let mut buffer: RingBuffer<i32> =3D RingBuffer::new(10).expect("Fa=
iled to create buffer");
> +
> +        let values =3D [1, 2, 3, 4, 5];
> +        for &value in &values {
> +            buffer.push_head(value).expect("Failed to push");
> +        }
> +
> +        for &expected in &values {
> +            assert_eq!(buffer.pop_tail(), Some(expected));
> +        }
> +    }
> +
> +    #[test]
> +    fn test_interleaved_push_pop() {
> +        let mut buffer: RingBuffer<i32> =3D RingBuffer::new(5).expect("Fa=
iled to create buffer");
> +
> +        buffer.push_head(1).expect("Failed to push");
> +        buffer.push_head(2).expect("Failed to push");
> +        assert_eq!(buffer.pop_tail(), Some(1));
> +
> +        buffer.push_head(3).expect("Failed to push");
> +        assert_eq!(buffer.pop_tail(), Some(2));
> +        assert_eq!(buffer.pop_tail(), Some(3));
> +
> +        assert!(buffer.empty());
> +    }
> +
> +    #[test]
> +    fn test_buffer_state_after_fill_and_drain() {
> +        let capacity =3D 4;
> +        let mut buffer: RingBuffer<i32> =3D
> +            RingBuffer::new(capacity).expect("Failed to create buffer");
> +
> +        // Fill and drain twice.
> +        for _ in 0..2 {
> +            for i in 0..capacity {
> +                buffer.push_head(i as i32).expect("Failed to push");
> +            }
> +            assert!(buffer.full());
> +
> +            for _ in 0..capacity {
> +                buffer.pop_tail();
> +            }
> +            assert!(buffer.empty());
> +        }
> +    }
> +
> +    #[test]
> +    fn test_single_capacity_buffer() {
> +        let mut buffer: RingBuffer<i32> =3D RingBuffer::new(1).expect("Fa=
iled to create buffer");
> +
> +        assert_eq!(buffer.free_count(), 1);
> +        buffer.push_head(42).expect("Failed to push");
> +        assert!(buffer.full());
> +        assert_eq!(buffer.free_count(), 0);
> +
> +        assert_eq!(buffer.pop_tail(), Some(42));
> +        assert!(buffer.empty());
> +    }
> +}
>=20
> ---
> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> change-id: 20260215-ringbuffer-42455964aaf2
>=20
> Best regards,
> --
> Andreas Hindborg <a.hindborg@kernel.org>
>=20
>=20
>=20

(sorry for the formatting, replying from my phone)

We should probably make the backing memory configurable from the get go inst=
ead of hardcoding KVec. It will be cumbersome to retrofit this change later o=
n, IMHO. I assume that others agree?

For example, we can immediately use this in Tyr if you let the backing memor=
y be a mapped GEM object. Having it be DMA memory is probably also going to b=
e useful for others.

=E2=80=94 Daniel=

