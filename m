Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E8B38735D
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 06:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899976; cv=none; b=oco7sD01d9RKIFL7o8xamVfyZQIaZFi92qbLMpiuTlvtv3jmZhZJiS76iX5oGPbzdkGk/eBzTsvLz0/oiPpDIwpihNSvn7wFKI0s8HvQi+nvNtekkEF0hBKNgS4WCtQ9tgkWZ5x64oVD1btMaCOpe/Q6oo9DyeoMGS0wp1MqJDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899976; c=relaxed/simple;
	bh=wdK3SyoVg6YCb9SKn7mRWAWIrsb7QReN0JCWNJpWg7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y72Iz3X/k1a0spHfayNrm3HiX/50TpXnxeOxxKdOLxz1BitJsrOxzXNwvMnaB5fiUwOt3oXDGkktFEN718810rmx9FWZZFfVAh/F/fZyZnnYPXEflmL2khqrMjpjg3kqiOFnpo5hwY8CTAvEwjhdxWSwgGu46yE8y+N4dqWH0ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=JSPUI6h0; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="JSPUI6h0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1780899962; x=1781159162;
	bh=MJr2296SR7nIQblS1Zm7bHsM76sxcLmiNUHGNEtI66Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JSPUI6h0uDg5HhpyS65sKBAertV8/kInNYz9wiyhZT7VrfwUSJIe0QHask/jRtFFJ
	 7oA96g1ORjO7FpPv57e0IHWjddKpNNWN+UOuaBxNUmQ3aY3DNYHQ+xUWbi2CmILojW
	 xBibNcYiIvt/MufKqgZYAQqvolJo6iSRgLOcrDiN+hzizoCM1es8Y7DDjfP7n25oC3
	 kbqwL22H6GERM2DI4Rxm0X3dPGLpfLjE3Qo9Mra+JLNsLyTBprsISCBVNwsaviCeSS
	 vj5nNjlg+uEg1Hsqo45LDoZuk0rZARD83va8/dG4PizJx5Ii3f+0nqRC4hmJdguiQQ
	 GSwfToqKflgIw==
X-Pm-Submission-Id: 4gYhr53stKz1DDL0
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: Re: [PATCH v2] rust: add a ring buffer implementation
Date: Mon,  8 Jun 2026 09:25:44 +0300
Message-ID: <20260608062555.19400-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260605-ringbuffer-v2-1-99df02489185@kernel.org>
References: <20260605-ringbuffer-v2-1-99df02489185@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 05 Jun 2026 15:10:30 +0200=0D
Andreas Hindborg <a.hindborg@kernel.org> wrote:=0D
=0D
> Add a fixed-capacity FIFO ring buffer. The implementation uses a circular=
=0D
> buffer with head and tail pointers, providing constant-time push and pop=
=0D
> operations.=0D
> =0D
> The module includes a few tests covering basic operations, wrap-around=0D
> behavior, interleaved push/pop sequences, and edge cases such as=0D
> single-capacity buffers.=0D
> =0D
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>=0D
> ---=0D
> Changes in v2:=0D
> - Move the module into `rust/kernel/alloc/`, next to `Vec` (Alice).=0D
> - Drop the redundant `size` field; use `nodes.len()` instead (Alice).=0D
> - Return `ENOMEM` when `capacity + 1` overflows `usize` instead of=0D
>   panicking inside `with_capacity` (Alice).=0D
> - Simplify the `head < tail` branch of `free_count` to `tail - head`=0D
>   (Alice).=0D
> - Remove the manual `Drop` impl; the backing `KVec` already drops the=0D
>   stored slots (Alice).=0D
> - Make `RingBuffer` generic over the backing allocator. Add=0D
>   `KRingBuffer`, `VRingBuffer` and `KVRingBuffer` aliases and re-export=0D
>   them from `kernel::alloc`. The constructor now takes an additional=0D
>   `Flags` argument (Daniel, Danilo).=0D
> - Link to v1: https://msgid.link/20260215-ringbuffer-v1-1-9b359758a1b6@ke=
rnel.org=0D
> =0D
> To: Danilo Krummrich <dakr@kernel.org>=0D
> To: Lorenzo Stoakes <ljs@kernel.org>=0D
> To: Vlastimil Babka <vbabka@kernel.org>=0D
> To: "Liam R. Howlett" <liam@infradead.org>=0D
> To: Uladzislau Rezki <urezki@gmail.com>=0D
> To: Miguel Ojeda <ojeda@kernel.org>=0D
> To: Boqun Feng <boqun@kernel.org>=0D
> To: Gary Guo <gary@garyguo.net>=0D
> To: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>=0D
> To: Benno Lossin <lossin@kernel.org>=0D
> To: Andreas Hindborg <a.hindborg@kernel.org>=0D
> To: Alice Ryhl <aliceryhl@google.com>=0D
> To: Trevor Gross <tmgross@umich.edu>=0D
> Cc: linux-kernel@vger.kernel.org=0D
> Cc: rust-for-linux@vger.kernel.org=0D
> ---=0D
>  rust/kernel/alloc.rs            |   6 +=0D
>  rust/kernel/alloc/ringbuffer.rs | 338 ++++++++++++++++++++++++++++++++++=
++++++=0D
>  2 files changed, 344 insertions(+)=0D
> =0D
> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs=0D
> index e38720349dcf..05eb0289b82b 100644=0D
> --- a/rust/kernel/alloc.rs=0D
> +++ b/rust/kernel/alloc.rs=0D
> @@ -6,6 +6,7 @@=0D
>  pub mod kbox;=0D
>  pub mod kvec;=0D
>  pub mod layout;=0D
> +pub mod ringbuffer;=0D
>  =0D
>  pub use self::kbox::Box;=0D
>  pub use self::kbox::KBox;=0D
> @@ -18,6 +19,11 @@=0D
>  pub use self::kvec::VVec;=0D
>  pub use self::kvec::Vec;=0D
>  =0D
> +pub use self::ringbuffer::KRingBuffer;=0D
> +pub use self::ringbuffer::KVRingBuffer;=0D
> +pub use self::ringbuffer::RingBuffer;=0D
> +pub use self::ringbuffer::VRingBuffer;=0D
> +=0D
>  /// Indicates an allocation error.=0D
>  #[derive(Copy, Clone, PartialEq, Eq, Debug)]=0D
>  pub struct AllocError;=0D
> diff --git a/rust/kernel/alloc/ringbuffer.rs b/rust/kernel/alloc/ringbuff=
er.rs=0D
> new file mode 100644=0D
> index 000000000000..09e1ce1d048e=0D
> --- /dev/null=0D
> +++ b/rust/kernel/alloc/ringbuffer.rs=0D
> @@ -0,0 +1,338 @@=0D
> +// SPDX-License-Identifier: GPL-2.0=0D
> +=0D
> +//! A fixed-capacity FIFO ring buffer.=0D
> +//!=0D
> +//! This module provides [`RingBuffer`], a circular buffer implementatio=
n that=0D
> +//! supports efficient push and pop operations at opposite ends of the b=
uffer.=0D
> +=0D
> +use super::{=0D
> +    allocator::{KVmalloc, Kmalloc, Vmalloc},=0D
> +    Allocator, Flags, Vec,=0D
> +};=0D
=0D
nit: Vertical style import missing.=0D
=0D
> +use kernel::prelude::*;=0D
> +=0D
> +/// A fixed-capacity FIFO ring buffer.=0D
> +///=0D
> +/// `RingBuffer` is a circular buffer that allows pushing elements to th=
e head=0D
> +/// and popping elements from the tail in constant time. The buffer has =
a fixed=0D
> +/// capacity specified at construction time and will return an error if =
a push=0D
> +/// is attempted when full.=0D
> +///=0D
> +/// The backing storage is provided by the allocator `A`. Type aliases a=
re=0D
> +/// provided for the common choices: [`KRingBuffer`], [`VRingBuffer`] an=
d=0D
> +/// [`KVRingBuffer`].=0D
> +///=0D
> +/// # Invariants=0D
> +///=0D
> +/// - `self.head` points at the next empty slot.=0D
> +/// - `self.tail` points at the last full slot, except if the buffer is =
empty.=0D
> +/// - The buffer is empty when `self.head =3D=3D self.tail`.=0D
> +/// - The buffer will always have at least one empty slot, even when ful=
l.=0D
> +pub struct RingBuffer<T, A: Allocator> {=0D
> +    nodes: Vec<Option<T>, A>,=0D
> +    head: usize,=0D
> +    tail: usize,=0D
> +}=0D
> +=0D
> +/// A [`RingBuffer`] backed by [`Kmalloc`].=0D
> +pub type KRingBuffer<T> =3D RingBuffer<T, Kmalloc>;=0D
> +=0D
> +/// A [`RingBuffer`] backed by [`Vmalloc`].=0D
> +pub type VRingBuffer<T> =3D RingBuffer<T, Vmalloc>;=0D
> +=0D
> +/// A [`RingBuffer`] backed by [`KVmalloc`].=0D
> +pub type KVRingBuffer<T> =3D RingBuffer<T, KVmalloc>;=0D
> +=0D
> +impl<T, A: Allocator> RingBuffer<T, A> {=0D
> +    /// Creates a new `RingBuffer` with the specified capacity.=0D
> +    ///=0D
> +    /// The buffer will be able to hold exactly `capacity` elements. Mem=
ory is=0D
> +    /// allocated during construction using `flags`.=0D
> +    ///=0D
> +    /// # Errors=0D
> +    ///=0D
> +    /// Returns an error if memory allocation fails.=0D
> +    pub fn new(capacity: usize, flags: Flags) -> Result<Self> {=0D
> +        let slots =3D capacity.checked_add(1).ok_or(ENOMEM)?;=0D
> +        let mut this =3D Self {=0D
> +            nodes: Vec::with_capacity(slots, flags)?,=0D
> +            head: 0,=0D
> +            tail: 0,=0D
> +        };=0D
> +=0D
> +        for _ in 0..this.nodes.capacity() {=0D
> +            this.nodes.push_within_capacity(None)?;=0D
> +        }=0D
> +=0D
> +        Ok(this)=0D
> +    }=0D
> +=0D
> +    /// Returns `true` if the buffer is full.=0D
> +    ///=0D
> +    /// When the buffer is full, any call to [`push_head`] will return a=
n error.=0D
> +    ///=0D
> +    /// [`push_head`]: Self::push_head=0D
> +    pub fn full(&self) -> bool {=0D
> +        (self.head + 1) % self.nodes.len() =3D=3D self.tail=0D
=0D
Nit: This seems short enough to inline.=0D
=0D
Regards,=0D
Onur=0D
=0D
> +    }=0D
> +=0D
> +    fn empty(&self) -> bool {=0D
> +        self.head =3D=3D self.tail=0D
> +    }=0D
> +=0D
> +    /// Returns the number of available slots in the buffer.=0D
> +    ///=0D
> +    /// This is the number of elements that can be pushed before the buf=
fer=0D
> +    /// becomes full.=0D
> +    pub fn free_count(&self) -> usize {=0D
> +        (if self.head >=3D self.tail {=0D
> +            self.nodes.len() - (self.head - self.tail)=0D
> +        } else {=0D
> +            self.tail - self.head=0D
> +        } - 1)=0D
> +    }=0D
> +=0D
> +    /// Pushes a value to the head of the buffer.=0D
> +    ///=0D
> +    /// # Errors=0D
> +    ///=0D
> +    /// Returns [`ENOSPC`] if the buffer is full.=0D
> +    pub fn push_head(&mut self, value: T) -> Result {=0D
> +        if self.full() {=0D
> +            return Err(ENOSPC);=0D
> +        }=0D
> +=0D
> +        self.nodes[self.head] =3D Some(value);=0D
> +        self.head =3D (self.head + 1) % self.nodes.len();=0D
> +=0D
> +        Ok(())=0D
> +    }=0D
> +=0D
> +    /// Pops and returns the value at the tail of the buffer.=0D
> +    ///=0D
> +    /// Returns `None` if the buffer is empty. Values are returned in FI=
FO=0D
> +    /// order, i.e., the oldest value is returned first.=0D
> +    pub fn pop_tail(&mut self) -> Option<T> {=0D
> +        if self.empty() {=0D
> +            return None;=0D
> +        }=0D
> +=0D
> +        let value =3D self.nodes[self.tail].take();=0D
> +        self.tail =3D (self.tail + 1) % self.nodes.len();=0D
> +        value=0D
> +    }=0D
> +}=0D
> +=0D
> +#[kunit_tests(rust_kernel_ringbuffer)]=0D
> +mod tests {=0D
> +    use super::*;=0D
> +=0D
> +    #[test]=0D
> +    fn test_new_buffer_is_empty() {=0D
> +        let buffer: KRingBuffer<i32> =3D=0D
> +            KRingBuffer::new(5, GFP_KERNEL).expect("Failed to create buf=
fer");=0D
> +        assert!(!buffer.full());=0D
> +        assert!(buffer.empty());=0D
> +    }=0D
> +=0D
> +    #[test]=0D
> +    fn test_new_buffer_has_correct_capacity() {=0D
> +        let capacity =3D 10;=0D
> +        let buffer: KRingBuffer<i32> =3D=0D
> +            KRingBuffer::new(capacity, GFP_KERNEL).expect("Failed to cre=
ate buffer");=0D
> +        assert_eq!(buffer.free_count(), capacity);=0D
> +    }=0D
> +=0D
> +    #[test]=0D
> +    fn test_push_single_element() {=0D
> +        let mut buffer: KRingBuffer<i32> =3D=0D
> +            KRingBuffer::new(5, GFP_KERNEL).expect("Failed to create buf=
fer");=0D
> +        assert!(buffer.push_head(42).is_ok());=0D
> +        assert!(!buffer.empty());=0D
> +        assert!(!buffer.full());=0D
> +    }=0D
> +=0D
> +    #[test]=0D
> +    fn test_push_and_pop_single_element() {=0D
> +        let mut buffer: KRingBuffer<i32> =3D=0D
> +            KRingBuffer::new(5, GFP_KERNEL).expect("Failed to create buf=
fer");=0D
> +        buffer.push_head(42).expect("Failed to push");=0D
> +        let value =3D buffer.pop_tail();=0D
> +        assert_eq!(value, Some(42));=0D
> +        assert!(buffer.empty());=0D
> +    }=0D
> +=0D
> +    #[test]=0D
> +    fn test_push_and_pop_multiple_elements() {=0D
> +        let mut buffer: KRingBuffer<i32> =3D=0D
> +            KRingBuffer::new(5, GFP_KERNEL).expect("Failed to create buf=
fer");=0D
> +=0D
> +        for i in 0..5 {=0D
> +            buffer.push_head(i).expect("Failed to push");=0D
> +        }=0D
> +=0D
> +        for i in 0..5 {=0D
> +            assert_eq!(buffer.pop_tail(), Some(i));=0D
> +        }=0D
> +=0D
> +        assert!(buffer.empty());=0D
> +    }=0D
> +=0D
> +    #[test]=0D
> +    fn test_pop_from_empty_buffer() {=0D
> +        let mut buffer: KRingBuffer<i32> =3D=0D
> +            KRingBuffer::new(5, GFP_KERNEL).expect("Failed to create buf=
fer");=0D
> +        assert_eq!(buffer.pop_tail(), None);=0D
> +    }=0D
> +=0D
> +    #[test]=0D
> +    fn test_buffer_full() {=0D
> +        let capacity =3D 3;=0D
> +        let mut buffer: KRingBuffer<i32> =3D=0D
> +            KRingBuffer::new(capacity, GFP_KERNEL).expect("Failed to cre=
ate buffer");=0D
> +=0D
> +        for i in 0..capacity {=0D
> +            assert!(buffer.push_head(i as i32).is_ok());=0D
> +        }=0D
> +=0D
> +        assert!(buffer.full());=0D
> +        assert_eq!(buffer.free_count(), 0);=0D
> +    }=0D
> +=0D
> +    #[test]=0D
> +    fn test_push_to_full_buffer_fails() {=0D
> +        let capacity =3D 3;=0D
> +        let mut buffer: KRingBuffer<i32> =3D=0D
> +            KRingBuffer::new(capacity, GFP_KERNEL).expect("Failed to cre=
ate buffer");=0D
> +=0D
> +        for i in 0..capacity {=0D
> +            buffer.push_head(i as i32).expect("Failed to push");=0D
> +        }=0D
> +=0D
> +        assert!(buffer.full());=0D
> +        assert!(buffer.push_head(999).is_err());=0D
> +    }=0D
> +=0D
> +    #[test]=0D
> +    fn test_free_count_decreases_on_push() {=0D
> +        let capacity =3D 5;=0D
> +        let mut buffer: KRingBuffer<i32> =3D=0D
> +            KRingBuffer::new(capacity, GFP_KERNEL).expect("Failed to cre=
ate buffer");=0D
> +=0D
> +        assert_eq!(buffer.free_count(), capacity);=0D
> +=0D
> +        for i in 0..capacity {=0D
> +            buffer.push_head(i as i32).expect("Failed to push");=0D
> +            assert_eq!(buffer.free_count(), capacity - i - 1);=0D
> +        }=0D
> +    }=0D
> +=0D
> +    #[test]=0D
> +    fn test_free_count_increases_on_pop() {=0D
> +        let capacity =3D 5;=0D
> +        let mut buffer: KRingBuffer<i32> =3D=0D
> +            KRingBuffer::new(capacity, GFP_KERNEL).expect("Failed to cre=
ate buffer");=0D
> +=0D
> +        for i in 0..capacity {=0D
> +            buffer.push_head(i as i32).expect("Failed to push");=0D
> +        }=0D
> +=0D
> +        assert_eq!(buffer.free_count(), 0);=0D
> +=0D
> +        for i in 1..=3Dcapacity {=0D
> +            buffer.pop_tail();=0D
> +            assert_eq!(buffer.free_count(), i);=0D
> +        }=0D
> +    }=0D
> +=0D
> +    #[test]=0D
> +    fn test_wrap_around_behavior() {=0D
> +        let capacity =3D 3;=0D
> +        let mut buffer: KRingBuffer<i32> =3D=0D
> +            KRingBuffer::new(capacity, GFP_KERNEL).expect("Failed to cre=
ate buffer");=0D
> +=0D
> +        // Fill the buffer.=0D
> +        for i in 0..capacity {=0D
> +            buffer.push_head(i as i32).expect("Failed to push");=0D
> +        }=0D
> +=0D
> +        // Pop two elements.=0D
> +        assert_eq!(buffer.pop_tail(), Some(0));=0D
> +        assert_eq!(buffer.pop_tail(), Some(1));=0D
> +=0D
> +        // Push two more (should wrap around).=0D
> +        buffer.push_head(10).expect("Failed to push");=0D
> +        buffer.push_head(11).expect("Failed to push");=0D
> +=0D
> +        // Verify order.=0D
> +        assert_eq!(buffer.pop_tail(), Some(2));=0D
> +        assert_eq!(buffer.pop_tail(), Some(10));=0D
> +        assert_eq!(buffer.pop_tail(), Some(11));=0D
> +        assert!(buffer.empty());=0D
> +    }=0D
> +=0D
> +    #[test]=0D
> +    fn test_fifo_order() {=0D
> +        let mut buffer: KRingBuffer<i32> =3D=0D
> +            KRingBuffer::new(10, GFP_KERNEL).expect("Failed to create bu=
ffer");=0D
> +=0D
> +        let values =3D [1, 2, 3, 4, 5];=0D
> +        for &value in &values {=0D
> +            buffer.push_head(value).expect("Failed to push");=0D
> +        }=0D
> +=0D
> +        for &expected in &values {=0D
> +            assert_eq!(buffer.pop_tail(), Some(expected));=0D
> +        }=0D
> +    }=0D
> +=0D
> +    #[test]=0D
> +    fn test_interleaved_push_pop() {=0D
> +        let mut buffer: KRingBuffer<i32> =3D=0D
> +            KRingBuffer::new(5, GFP_KERNEL).expect("Failed to create buf=
fer");=0D
> +=0D
> +        buffer.push_head(1).expect("Failed to push");=0D
> +        buffer.push_head(2).expect("Failed to push");=0D
> +        assert_eq!(buffer.pop_tail(), Some(1));=0D
> +=0D
> +        buffer.push_head(3).expect("Failed to push");=0D
> +        assert_eq!(buffer.pop_tail(), Some(2));=0D
> +        assert_eq!(buffer.pop_tail(), Some(3));=0D
> +=0D
> +        assert!(buffer.empty());=0D
> +    }=0D
> +=0D
> +    #[test]=0D
> +    fn test_buffer_state_after_fill_and_drain() {=0D
> +        let capacity =3D 4;=0D
> +        let mut buffer: KRingBuffer<i32> =3D=0D
> +            KRingBuffer::new(capacity, GFP_KERNEL).expect("Failed to cre=
ate buffer");=0D
> +=0D
> +        // Fill and drain twice.=0D
> +        for _ in 0..2 {=0D
> +            for i in 0..capacity {=0D
> +                buffer.push_head(i as i32).expect("Failed to push");=0D
> +            }=0D
> +            assert!(buffer.full());=0D
> +=0D
> +            for _ in 0..capacity {=0D
> +                buffer.pop_tail();=0D
> +            }=0D
> +            assert!(buffer.empty());=0D
> +        }=0D
> +    }=0D
> +=0D
> +    #[test]=0D
> +    fn test_single_capacity_buffer() {=0D
> +        let mut buffer: KRingBuffer<i32> =3D=0D
> +            KRingBuffer::new(1, GFP_KERNEL).expect("Failed to create buf=
fer");=0D
> +=0D
> +        assert_eq!(buffer.free_count(), 1);=0D
> +        buffer.push_head(42).expect("Failed to push");=0D
> +        assert!(buffer.full());=0D
> +        assert_eq!(buffer.free_count(), 0);=0D
> +=0D
> +        assert_eq!(buffer.pop_tail(), Some(42));=0D
> +        assert!(buffer.empty());=0D
> +    }=0D
> +}=0D
> =0D
> ---=0D
> base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32=0D
> change-id: 20260215-ringbuffer-42455964aaf2=0D
> =0D
> Best regards,=0D
> --  =0D
> Andreas Hindborg <a.hindborg@kernel.org>=0D
> =0D
> =0D
