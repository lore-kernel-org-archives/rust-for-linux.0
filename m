Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B2B2C0F8E;
	Mon, 16 Feb 2026 13:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771248486; cv=none; b=OiZu1kLMfnf2B7dCb6lsFSV5EuDrKRJyYq6gaWpFiV7eRhm8ufxloUZE76J9dd2El9rfQqsdOKqR6E2FI7vV57iNwmkrvrl6l+7sRkIVq2uC2xrg8iySYAmKxASbeE5LEe36gfU68XbjvRG9w1YyjIWjT0RjyNL+Y8/poe4l65c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771248486; c=relaxed/simple;
	bh=ji3P76OZMD3D4ZCwhV4eN+BfT+uslDRh5iEWqtRlARw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l2OlMivkL7X9YVorHcJb+cXf4z/KWQsrqS9FPU0Ot6uE/0tvO/9ca+e2t6mrFBflcOL545bVzDlEcvqCI2kZyhE5EXm8Khw+CVJQKQhrYgtKmEjneXj1tG5VI4P1pchwk/jj4CVo1F+TU8G3cDo3ywVcz+AN4AYaDM5IYc8YnHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VTUqk0te; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VTUqk0te"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F2DC116C6;
	Mon, 16 Feb 2026 13:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771248485;
	bh=ji3P76OZMD3D4ZCwhV4eN+BfT+uslDRh5iEWqtRlARw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VTUqk0teONQlGazHZ0iT+LoBK3kbzXldvKzlnkqnz3zdMEbo09/4rED6S1HapbLnb
	 4vlAR26o5SEV8JPsrRGl/TmLbXVQjOdPTtjQDnW4gNwRKTtR4XIrKOj8jeEZtkvep1
	 xtbmEzPUyd7+4G6LlAJjfiR8dPyRuBY6gk6vL88XATY3JZM1i32f/QNERG0YYkHN+5
	 V9jc3v284s4dhsz2WRbrl74fmvpbyz/ObCPidHsGDtz9aUnmQlagVXAAb6O+iXAUih
	 rE4Qg/tyPFnkV4JHv63VAUbsfjwvkZJFgQK8BK0qYetjJvKj8jjFfNVGlZKulJ81hV
	 2bOPwhMSVBEeQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add a ring buffer implementation
In-Reply-To: <aZMMyJofDKualqXw@google.com>
References: <20260215-ringbuffer-v1-1-9b359758a1b6@kernel.org>
 <8tULWyvUTjVb3E_HFZeW2maApI87eYLZungGtJ6k9CVT9J-C-TzIqx5ShmHA5vS30yqZRq7TmaBd0AIg5V7u6Q==@protonmail.internalid>
 <aZMMyJofDKualqXw@google.com>
Date: Mon, 16 Feb 2026 14:27:58 +0100
Message-ID: <873430es2p.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Sun, Feb 15, 2026 at 09:24:59PM +0100, Andreas Hindborg wrote:
>> Add a fixed-capacity FIFO ring buffer. The implementation uses a circular
>> buffer with head and tail pointers, providing constant-time push and pop
>> operations.
>>
>> The module includes a few tests covering basic operations, wrap-around
>> behavior, interleaved push/pop sequences, and edge cases such as
>> single-capacity buffers.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Why call this ringbuffer instead of matching the stdlib name for the
> same collection? VecDeque.

I did not have stdlib in mind at all when writing this. I needed a
ringbuffer, so that is what I called it. I am fine with renaming it to
whatever is more idiomatic.

>
> And a more general question .. is there any chance we could avoid
> rolling our own for this? Is there an impl in the kernel we could take?
> Or could we vendor code from stdlib?

I did not have a look on the stdlib VecDeque. With us decupling from
`alloc` I don't think that makes sense. If you think it is worthwhile, I
can go have a look.

>
>>  rust/kernel/lib.rs        |   1 +
>>  rust/kernel/ringbuffer.rs | 321 ++++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 322 insertions(+)
>>
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index f812cf1200428..d6555ccceb32f 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -133,6 +133,7 @@
>>  pub mod rbtree;
>>  pub mod regulator;
>>  pub mod revocable;
>> +pub mod ringbuffer;
>>  pub mod scatterlist;
>>  pub mod security;
>>  pub mod seq_file;
>> diff --git a/rust/kernel/ringbuffer.rs b/rust/kernel/ringbuffer.rs
>> new file mode 100644
>> index 0000000000000..9a66ebf1bb390
>> --- /dev/null
>> +++ b/rust/kernel/ringbuffer.rs
>
> This should probably be in rust/kernel/alloc/ next to Vec?

Ok.

>
>> @@ -0,0 +1,321 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! A fixed-capacity FIFO ring buffer.
>> +//!
>> +//! This module provides [`RingBuffer`], a circular buffer implementation that
>> +//! supports efficient push and pop operations at opposite ends of the buffer.
>> +
>> +use kernel::prelude::*;
>> +
>> +/// A fixed-capacity FIFO ring buffer.
>> +///
>> +/// `RingBuffer` is a circular buffer that allows pushing elements to the head
>> +/// and popping elements from the tail in constant time. The buffer has a fixed
>> +/// capacity specified at construction time and will return an error if a push
>> +/// is attempted when full.
>> +///
>> +/// # Invariants
>> +///
>> +/// - `self.head` points at the next empty slot.
>> +/// - `self.tail` points at the last full slot, except if the buffer is empty.
>> +/// - The buffer is empty when `self.head == self.tail`.
>> +/// - The buffer will always have at least one empty slot, even when full.
>> +pub struct RingBuffer<T> {
>> +    nodes: KVec<Option<T>>,
>
> This is quite inefficient storage for any type T that does not contain a
> non-nullable pointer.

But for nonzero types it is great, and makes this entire module have
zero unsafe code. We can remove it and rely on head and tail to decide
what is valid if you prefer?

>
>> +    size: usize,
>
> This size is just the vector's capacity. Field is redundant.

Cool.

>
>> +    pub fn new(capacity: usize) -> Result<Self> {
>> +        let mut this = Self {
>> +            nodes: KVec::with_capacity(capacity + 1, GFP_KERNEL)?,
>
> Should return ENOMEM on capacity == usize::MAX instead of panic.

Good call.

>
>> +    /// Returns the number of available slots in the buffer.
>> +    ///
>> +    /// This is the number of elements that can be pushed before the buffer
>> +    /// becomes full.
>> +    pub fn free_count(&self) -> usize {
>> +        (if self.head >= self.tail {
>> +            self.size - (self.head - self.tail)
>> +        } else {
>> +            (self.size - self.tail) + self.head
>> +        } - 1)
>
> The else branch should just be `self.tail - self.head`.

Right.

>
>> +impl<T> Drop for RingBuffer<T> {
>> +    fn drop(&mut self) {
>> +        while !self.empty() {
>> +            drop(self.pop_tail().expect("Not empty"));
>> +        }
>
> The destructor of KVec already drops the items.

Of course. While writing this response I was thinking to get rid of the
option to make the KVec elements MaybeUninit. Then we would need to drop
the valid ones here.

Best regards,
Andreas Hindborg


