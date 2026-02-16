Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE512D0C9C
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 12:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771244749; cv=none; b=VJDtQUa7CgQ5xhpI/Lk/wnPeOvmB3vu0W3byxdpm1TJDnZxq7w/sDOrTuor8it1PGCaGYze9zuO7xRfRpS6r1urPnELhfLwqFdYkR8TG11s2n1WeuC2YPJJjnlTLNu4H5/UmYTvhhE6LRsgo+bfnNVRcXF7hY5DWijyyIpx36r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771244749; c=relaxed/simple;
	bh=orKlIb5sNk/sYkMT41GlOajNPAx5WAb7sR9XLZ2HIRQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WFzyW+uxWUeGkhJjEzA2KPC9hqwCQtmPrhqyfD2baX3UqVO4BuDoZeaxsspGefduUB40f2h92FNSkb31GtU1GGxO5/YQHSVzIOT8S4TMpmbNKfiuOdw/3kgqzu/5+BuRFh7XdbOjWYdwWa1ir9n42WXo3W62f5oAePPnm2/WaNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UEC3kJOl; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UEC3kJOl"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837cee2e9bso14991845e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 04:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771244745; x=1771849545; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gq2lTK9WEJPC/CyrmaSBx8hJsemgN09rKEkH5jkBfJ4=;
        b=UEC3kJOlvNdn1QaVPUmuX9rFGuZYLzElUkH6wXC6XvEsdxy1qaFEAmzWSPSNOZ4Azm
         m18RV/4bc9R4dcQOah8Hz2GwtAw6MAzTrC3dYIOlu49oeoEcxf/f3YrnTmzslySXBPoB
         f16lJUgs4rPMS83eySnvAxKwwSPWVJCgCeowxY+1/mX174HxlWH2a0fqM77Q95Sr5C/7
         LJB6R4VLmDHSIUiXyE5cMACMJDjtTg/WKAjB5q0M8QMau0DdLYUDMocspBiv21xG54Ev
         HDA8Ig2GToVyhg8GaGjGdndWEDHBKDXpVn4xPPCNo6K/i5ITM63SbphK/qh9zZyeU0kl
         g7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771244745; x=1771849545;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gq2lTK9WEJPC/CyrmaSBx8hJsemgN09rKEkH5jkBfJ4=;
        b=EeeazYZT/k0tZ/B2Y5pG3o7cgRYvGe2DTIU/AYtduKRE5cWEKvj+x3Epq34cGi7P+L
         bryaEmsUoubqklWNunIdEcNAO/tld1OVhi96efTVBJBnmzi3aD+coMo5h1MwVqKFx6MI
         HZWgwaG6D70vn9I5RKe7nH4wiswEqfsWrgWJYVTCMxJK3zNIJV76Jvs8NijT75mutHkF
         ldb9nFpV7bObvypNyBgdhQarYhcswS8iJRzyY7yRlYqw08o9W7a+edv8EN/p9LV9P1ID
         RSVs0qI2ENVhjahxEydGB3idMQU76mKwgFsBTmqNYI3zX+4flPE88lSEUuySt6VxvFUI
         Lz7g==
X-Forwarded-Encrypted: i=1; AJvYcCWUOIodbM+TSwizy5I+/c6jfjH1eJwpXdgR2/cjkSTWNhA16QbRWvUA5wbyWN81WIrEuHWDEviGda9BDjgrLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXCaIFHChSF1Bp8ghVNPseMr+owBVn8kCmI89xckyzLa69saWm
	1LucBOzNMeMnq2ukKrGhFaVJWi3FcSK0JDePKjqj+HgxoW+GRmu5+ULswGjlhdV4DNseQX22as3
	xHyRGV3rbqRXvzV8wqg==
X-Received: from wmbjd20.prod.google.com ([2002:a05:600c:68d4:b0:482:ef67:407f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4443:b0:47e:e20e:bbb0 with SMTP id 5b1f17b1804b1-48379bac837mr113840305e9.6.1771244745103;
 Mon, 16 Feb 2026 04:25:45 -0800 (PST)
Date: Mon, 16 Feb 2026 12:25:44 +0000
In-Reply-To: <20260215-ringbuffer-v1-1-9b359758a1b6@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260215-ringbuffer-v1-1-9b359758a1b6@kernel.org>
Message-ID: <aZMMyJofDKualqXw@google.com>
Subject: Re: [PATCH] rust: add a ring buffer implementation
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Feb 15, 2026 at 09:24:59PM +0100, Andreas Hindborg wrote:
> Add a fixed-capacity FIFO ring buffer. The implementation uses a circular
> buffer with head and tail pointers, providing constant-time push and pop
> operations.
> 
> The module includes a few tests covering basic operations, wrap-around
> behavior, interleaved push/pop sequences, and edge cases such as
> single-capacity buffers.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Why call this ringbuffer instead of matching the stdlib name for the
same collection? VecDeque.

And a more general question .. is there any chance we could avoid
rolling our own for this? Is there an impl in the kernel we could take?
Or could we vendor code from stdlib?

>  rust/kernel/lib.rs        |   1 +
>  rust/kernel/ringbuffer.rs | 321 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 322 insertions(+)
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index f812cf1200428..d6555ccceb32f 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -133,6 +133,7 @@
>  pub mod rbtree;
>  pub mod regulator;
>  pub mod revocable;
> +pub mod ringbuffer;
>  pub mod scatterlist;
>  pub mod security;
>  pub mod seq_file;
> diff --git a/rust/kernel/ringbuffer.rs b/rust/kernel/ringbuffer.rs
> new file mode 100644
> index 0000000000000..9a66ebf1bb390
> --- /dev/null
> +++ b/rust/kernel/ringbuffer.rs

This should probably be in rust/kernel/alloc/ next to Vec?

> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A fixed-capacity FIFO ring buffer.
> +//!
> +//! This module provides [`RingBuffer`], a circular buffer implementation that
> +//! supports efficient push and pop operations at opposite ends of the buffer.
> +
> +use kernel::prelude::*;
> +
> +/// A fixed-capacity FIFO ring buffer.
> +///
> +/// `RingBuffer` is a circular buffer that allows pushing elements to the head
> +/// and popping elements from the tail in constant time. The buffer has a fixed
> +/// capacity specified at construction time and will return an error if a push
> +/// is attempted when full.
> +///
> +/// # Invariants
> +///
> +/// - `self.head` points at the next empty slot.
> +/// - `self.tail` points at the last full slot, except if the buffer is empty.
> +/// - The buffer is empty when `self.head == self.tail`.
> +/// - The buffer will always have at least one empty slot, even when full.
> +pub struct RingBuffer<T> {
> +    nodes: KVec<Option<T>>,

This is quite inefficient storage for any type T that does not contain a
non-nullable pointer.

> +    size: usize,

This size is just the vector's capacity. Field is redundant.

> +    pub fn new(capacity: usize) -> Result<Self> {
> +        let mut this = Self {
> +            nodes: KVec::with_capacity(capacity + 1, GFP_KERNEL)?,

Should return ENOMEM on capacity == usize::MAX instead of panic.

> +    /// Returns the number of available slots in the buffer.
> +    ///
> +    /// This is the number of elements that can be pushed before the buffer
> +    /// becomes full.
> +    pub fn free_count(&self) -> usize {
> +        (if self.head >= self.tail {
> +            self.size - (self.head - self.tail)
> +        } else {
> +            (self.size - self.tail) + self.head
> +        } - 1)

The else branch should just be `self.tail - self.head`.

> +impl<T> Drop for RingBuffer<T> {
> +    fn drop(&mut self) {
> +        while !self.empty() {
> +            drop(self.pop_tail().expect("Not empty"));
> +        }

The destructor of KVec already drops the items.

Alice
