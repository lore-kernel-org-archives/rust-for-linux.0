Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD8727E076
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047656; cv=none; b=dI0J5f8DIzULwsczgIxMyeE0VhCH77HCdxie1SrgpjDjPv8uQtvVV9lMULr5BXBGQSlouJZb1BWZboJX+roFWJMeYVf3HsgzBwUWIXhk/sybD8jD92zOTzUKHxcVA9nbYo5j4JYl7z+OUnAWmIXBGWMjPGXVdPE59l/dsZ2Mhmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047656; c=relaxed/simple;
	bh=8/afqT8eOMsYZhCdxo8b0nyTgv58+zM5tOPJeRoHJR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s9gp/4liRp6D0wQUTtYBZbtLnnFTdjzWLre2VYbGW+MSn/TZSSsKvXvYTWnvYbbYxGydygpRmvEJZibjgwPbS+2lGxfcrNrWkN2WVxzfNCzQVJoFgTqc6w5pxXnkOfPT2r6SvvpawunhYF1nFwoKfbfQYYXnIJtNU4m0pLQ2A9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=yZp500tn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="yZp500tn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso340665e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047649; x=1783652449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MamMXSN6+Gh1FeRTazlGFj4hXqfxzwoA/XwvvB0fl5k=;
        b=yZp500tnGQe1ztE6vwAoocL7kudji8JBNBTuYmjkt7Qs5A2no5SPt4CrIcydHYMrrQ
         cKaPDr0hzUqrkXZ1DsxEFjDvhaGYMIqqT4qS7nUks32b+eB43KpQmcqhgqMv9vtrY+4j
         ID4H9OIRH9pchWefDojh22287iapCpbP3gjryFjqFw8ZIGLY56YJjh+jhRqKNT4/CAmV
         gEzoD9ItQc8vl6Wkz9y7aNlIfjeNwp1AFjffueeRxwz4ZELi0yCJNbbFL9+uWmK40kEh
         I7Fs0IMYu5ktjQLnPC6cCRZlB8mOQWNNN2ipjn7yhSxX8VidGPhXCZ5iFn+BzF794Heo
         4j5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047649; x=1783652449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MamMXSN6+Gh1FeRTazlGFj4hXqfxzwoA/XwvvB0fl5k=;
        b=mdA+1jxsR1M07bKO99ZyQoawm+PNxtpZDHFZl4l+EtpoBtSwgGFz/xg8NUzAaKjHmQ
         8wBUjc5U90ztwYIWklwIEuNbczvhd/zEQfRKvx8Oc7JwCB1TZfmj1kciATvvz57X7tV5
         l5WEGNGHw0ERtIeTs6UNnztHuD2aACPHwgqsy43yN8YeBmsshL5f2qEhAzu2tGzU0e58
         0efPdDQzpKQ94Dn6VWhZjtX9vqC4wcHZGrCY/4vBMRDGOgsKtOYW1XdunL1UnSgc0JQ2
         xtonM5CErdhmH4EYzMXDe7v01SURFtx5ZllmOc+qLsn7y/1yRfibTIei7nEWT8Hbv98D
         icDQ==
X-Gm-Message-State: AOJu0YycTOIHFe0jzcy/4Ae+DISK9r66htl9piqMb4uSZ3z6I9YkFuwt
	tUJWJjIWDTClpr8lQ4Eic5F/KkLkFjxLxN1YGOhgkzJGcZTcvm0yTPdNg8vN7OtUskJEi6/JPHe
	1b03tC8A+
X-Gm-Gg: AfdE7cnWH0mnxVCv+qKlgF33Akskezc9EuqLEjm6JcbnzTdTxB/8RtqVOtTrj6kFqVA
	jWcu1+Fb3oxEVNsVPN+yvlrweTXHYVHc0q2it9AfJr6gDNKLTMg2DigqHQhHeyDTfIp3f+fzHh3
	AMG756Xl0JNbrjUlrbXGZfD3NNFJQxfa3TdZwogYmsTihuiZBJYXRIRjAy1KLqzfRthQpR0+Dwr
	Th5G9+ijZTDTlVcecSEwR6ASsYEvHGCd60Uu2GndLi7RGxrlh09+c6ju5eusJH1UxrANT6HWYUp
	zut+S11ib2Vq6iVFFxHFByjqDzg0K6n6Kqz0p+vMXtew4iOx6tb3R8vwHY7oJ42pU7jpZaoXe36
	s4I4+S+u9deAbyiiH9x0jNOI6Uu5ujfLECja4MzzFV5sd0I1YcgqrAaSVBMxQQHIXpW8U2x4z2S
	XcamY5U+FQbsWjARZcbDgFbewceLUOrRzpjvS+KiE7Em2tpHjgljbB6Uw9Z3EOhmtp2lY=
X-Received: by 2002:a05:6000:1284:b0:475:f0d1:eb65 with SMTP id ffacd0b85a97d-4775ca83b50mr10488138f8f.50.1783047648420;
        Thu, 02 Jul 2026 20:00:48 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm13128569f8f.9.2026.07.02.20.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:00:47 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [RFC PATCH v2 09/11] rust: usb: add an asynchronous pipelined bulk OUT queue
Date: Fri,  3 Jul 2026 04:00:13 +0100
Message-ID: <20260703030020.2694-10-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703030020.2694-1-mike@fireburn.co.uk>
References: <20260617145946.1894-1-mike@fireburn.co.uk>
 <20260703030020.2694-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

`usb::Device::bulk_send()` issues a synchronous `usb_bulk_msg()` and
blocks until each transfer completes (a device-ACK round-trip) before
the next can be submitted. On a request/response channel that round-trip
is invisible, but on a back-to-back OUT burst it serialises transfers
that a libusb async event loop would pipeline -- inserting host-side gaps
that are not present in the daemon this driver replaces.

Add `usb::Device::bulk_out_queue()`, the OUT counterpart to
`bulk_in_queue()`. It pre-allocates `depth` URBs (each with its own
kmalloc'd DMA buffer, filled with `usb_fill_bulk_urb()`) but submits none
up front, since an OUT URB carries caller data. `BulkOutQueue::send()`
fills and submits the slot at the round-robin cursor without waiting,
reaping that slot's previous transfer only when the cursor laps back to
it -- so up to `depth - 1` OUT transfers stay in flight, the
submit-and-reap model of a libusb async event loop. `flush()` drains all
outstanding transfers and surfaces the first error status; `Drop` cancels
and frees every URB.

The per-URB completion callback only signals a `struct completion` and is
direction-agnostic, so it is shared with `bulk_in_queue()` and renamed
`urb_signal_complete()`; slots are re-armed with `reinit_completion()`.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/usb.rs | 216 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 212 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index d77cda9ac15d..6c49de422b30 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -779,7 +779,7 @@ pub fn bulk_in_queue(&self, endpoint: u8, depth: usize, buf_len: usize) -> Resul
                     pipe,
                     buf.as_mut_ptr().cast(),
                     buf_len.try_into()?,
-                    Some(bulk_in_complete),
+                    Some(urb_signal_complete),
                     done.get().cast(),
                 );
             }
@@ -798,6 +798,88 @@ pub fn bulk_in_queue(&self, endpoint: u8, depth: usize, buf_len: usize) -> Resul
 
         Ok(q)
     }
+
+    /// Opens an asynchronous, pipelined bulk OUT writer on `endpoint`.
+    ///
+    /// Pre-allocates `depth` URBs, each with its own `buf_len`-byte DMA buffer, but submits
+    /// none up front (unlike [`bulk_in_queue`], an OUT URB carries caller data so it is
+    /// filled and submitted per [`BulkOutQueue::send`]). This lets the host keep up to
+    /// `depth` OUT transfers in flight at once — the submit-and-reap execution model of a
+    /// libusb async event loop — instead of the synchronous [`bulk_send`], which blocks for
+    /// each transfer's completion (a device-ACK round-trip) before the next can be submitted.
+    /// On a request/response channel that round-trip is invisible, but on a back-to-back OUT
+    /// burst (e.g. the pre-arm capability sequence) it serialises transfers the daemon
+    /// pipelines.
+    ///
+    /// Must be called from process (sleepable) context. `endpoint` is the bulk endpoint
+    /// number (low nibble of the address, e.g. `2` for `0x02`). `buf_len` is the largest
+    /// single transfer the caller will [`send`]; longer payloads are rejected with `EMSGSIZE`.
+    ///
+    /// [`bulk_in_queue`]: Self::bulk_in_queue
+    /// [`bulk_send`]: Self::bulk_send
+    /// [`send`]: BulkOutQueue::send
+    pub fn bulk_out_queue(
+        &self,
+        endpoint: u8,
+        depth: usize,
+        buf_len: usize,
+    ) -> Result<BulkOutQueue> {
+        let dev = self.as_raw();
+
+        // SAFETY: `dev` is valid by the type invariant; take a refcount so the device
+        // outlives the queue (released in `BulkOutQueue::drop`).
+        unsafe { bindings::usb_get_dev(dev) };
+
+        // SAFETY: `dev` is valid by the type invariant.
+        let pipe = unsafe { bindings::usb_sndbulkpipe(dev, endpoint.into()) };
+
+        let mut q = BulkOutQueue {
+            dev: NonNull::new(dev).ok_or(ENODEV)?,
+            slots: KVec::with_capacity(depth, GFP_KERNEL)?,
+            cursor: 0,
+        };
+
+        for _ in 0..depth {
+            // DMA-capable OUT buffer; filled per `send`.
+            let buf = KVec::from_elem(0u8, buf_len, GFP_KERNEL)?;
+
+            let done: KBox<Opaque<bindings::completion>> =
+                KBox::new(Opaque::uninit(), GFP_KERNEL)?;
+            // SAFETY: `done.get()` is a valid, uninitialized `struct completion`.
+            unsafe { bindings::init_completion(done.get()) };
+
+            // SAFETY: standard URB allocation; returns NULL on OOM.
+            let urb = unsafe { bindings::usb_alloc_urb(0, bindings::GFP_KERNEL) };
+            let urb = NonNull::new(urb).ok_or(ENOMEM)?;
+
+            // Fill the fixed URB fields; the transfer buffer and length are set per `send`,
+            // so pass a null buffer here.
+            // SAFETY: `urb` is freshly allocated; `dev`/`done` outlive the URB.
+            unsafe {
+                bindings::usb_fill_bulk_urb(
+                    urb.as_ptr(),
+                    dev,
+                    pipe,
+                    core::ptr::null_mut(),
+                    0,
+                    Some(urb_signal_complete),
+                    done.get().cast(),
+                );
+            }
+
+            q.slots.push(
+                OutSlot {
+                    urb,
+                    buf,
+                    done,
+                    inflight: false,
+                },
+                GFP_KERNEL,
+            )?;
+        }
+
+        Ok(q)
+    }
 }
 
 /// One slot of a [`BulkInQueue`]: a URB, its DMA buffer, and the completion the URB's
@@ -893,15 +975,141 @@ fn drop(&mut self) {
     }
 }
 
+/// One slot of a [`BulkOutQueue`]: a URB, its DMA buffer, the completion its callback
+/// signals, and whether a transfer using it is currently outstanding. Like [`UrbSlot`] but
+/// the `inflight` flag lets [`BulkOutQueue::send`] know whether the slot must be reaped
+/// (its previous transfer awaited) before the buffer can be reused.
+struct OutSlot {
+    urb: NonNull<bindings::urb>,
+    buf: KVec<u8>,
+    done: KBox<Opaque<bindings::completion>>,
+    inflight: bool,
+}
+
+/// An asynchronous, pipelined bulk OUT writer. See [`Device::bulk_out_queue`].
+///
+/// Round-robins over `depth` slots: [`send`] reuses the slot at the cursor, first waiting
+/// for that slot's previous transfer to complete (so at most `depth` transfers are ever
+/// outstanding), then fills and submits it without waiting for *its* completion. This keeps
+/// up to `depth - 1` OUT transfers in flight while the next is prepared — the libusb
+/// submit-and-reap model. [`flush`] drains all outstanding transfers and surfaces the first
+/// error status.
+///
+/// [`send`]: BulkOutQueue::send
+/// [`flush`]: BulkOutQueue::flush
+pub struct BulkOutQueue {
+    dev: NonNull<bindings::usb_device>,
+    slots: KVec<OutSlot>,
+    cursor: usize,
+}
+
+impl BulkOutQueue {
+    /// Reaps the slot at index `i` if it has an outstanding transfer: waits up to `timeout`
+    /// for completion, clears `inflight`, and returns the transfer's error status (if any).
+    /// `Ok(false)` means nothing was outstanding; `Ok(true)` means a transfer was reaped OK.
+    fn reap(&mut self, i: usize, timeout: Delta) -> Result<bool> {
+        if !self.slots[i].inflight {
+            return Ok(false);
+        }
+        let jiffies = unsafe {
+            bindings::__msecs_to_jiffies(timeout.as_millis().try_into().unwrap_or(u32::MAX))
+        };
+        // SAFETY: `done` is a valid, initialized completion.
+        let remaining =
+            unsafe { bindings::wait_for_completion_timeout(self.slots[i].done.get(), jiffies) };
+        if remaining == 0 {
+            // Still outstanding; leave `inflight` set so a later call keeps waiting on it.
+            return Err(ETIMEDOUT);
+        }
+        self.slots[i].inflight = false;
+        // SAFETY: the completion fired, so the controller is done with this URB.
+        let status = unsafe { (*self.slots[i].urb.as_ptr()).status };
+        if status != 0 {
+            return Err(Error::from_errno(status));
+        }
+        Ok(true)
+    }
+
+    /// Submits `data` as a bulk OUT transfer without waiting for its completion, returning as
+    /// soon as the URB is queued to the controller.
+    ///
+    /// If every slot is busy this blocks up to `timeout` reaping the oldest in-flight
+    /// transfer before reusing it; a reap error (timeout or a failed prior transfer) is
+    /// surfaced. `data` must be no longer than the queue's `buf_len` (else `EMSGSIZE`).
+    ///
+    /// Must be called from process (sleepable) context.
+    pub fn send(&mut self, data: &[u8], timeout: Delta) -> Result {
+        let i = self.cursor;
+        if data.len() > self.slots[i].buf.len() {
+            return Err(EMSGSIZE);
+        }
+
+        // Free the slot if its previous transfer is still outstanding.
+        let _ = self.reap(i, timeout)?;
+
+        // Fill the buffer and length for this transfer.
+        self.slots[i].buf[..data.len()].copy_from_slice(data);
+        // SAFETY: `done` is a valid, initialized completion (the URB is not outstanding
+        // right now, so nothing races this).
+        unsafe { bindings::reinit_completion(self.slots[i].done.get()) };
+        let buf_ptr = self.slots[i].buf.as_mut_ptr();
+        let urb = self.slots[i].urb.as_ptr();
+        // SAFETY: `urb` is valid and not currently submitted; `buf_ptr` is a DMA-capable
+        // buffer valid for `data.len()` bytes for the transfer's duration.
+        unsafe {
+            (*urb).transfer_buffer = buf_ptr.cast();
+            (*urb).transfer_buffer_length = data.len().try_into()?;
+        }
+        // SAFETY: `urb` is a valid, filled OUT URB; submitting transfers buffer ownership to
+        // the controller until completion.
+        to_result(unsafe { bindings::usb_submit_urb(urb, bindings::GFP_KERNEL) })?;
+        self.slots[i].inflight = true;
+        self.cursor = (i + 1) % self.slots.len();
+        Ok(())
+    }
+
+    /// Waits up to `timeout` for every outstanding transfer to complete, returning the first
+    /// error status encountered (all slots are still reaped regardless).
+    pub fn flush(&mut self, timeout: Delta) -> Result {
+        let mut first_err = Ok(());
+        for i in 0..self.slots.len() {
+            if let Err(e) = self.reap(i, timeout) {
+                if first_err.is_ok() {
+                    first_err = Err(e);
+                }
+            }
+        }
+        first_err
+    }
+}
+
+impl Drop for BulkOutQueue {
+    fn drop(&mut self) {
+        // Cancel every URB first (waits for any in-flight completion callback), THEN free.
+        for slot in self.slots.iter() {
+            // SAFETY: `slot.urb` is a valid URB allocated by `usb_alloc_urb`.
+            unsafe { bindings::usb_kill_urb(slot.urb.as_ptr()) };
+        }
+        for slot in self.slots.iter() {
+            // SAFETY: `slot.urb` is a valid, now-cancelled URB.
+            unsafe { bindings::usb_free_urb(slot.urb.as_ptr()) };
+        }
+        // SAFETY: balances the `usb_get_dev` taken in `bulk_out_queue`.
+        unsafe { bindings::usb_put_dev(self.dev.as_ptr()) };
+    }
+}
+
 /// URB completion callback (interrupt context). Does nothing but signal the per-URB
 /// completion whose pointer was stored in `urb->context`; all data handling and
-/// re-submission happen in process context in [`BulkInQueue::recv`].
+/// re-submission happen in process context (in [`BulkInQueue::recv`] for IN, or in
+/// [`BulkOutQueue::send`]/[`BulkOutQueue::flush`] for OUT). Shared by both queues since
+/// it only fires the completion and is direction-agnostic.
 ///
 /// # Safety
 ///
 /// `urb` must be a valid URB whose `context` is a live `struct completion` (guaranteed by
-/// construction in [`Device::bulk_in_queue`]).
-unsafe extern "C" fn bulk_in_complete(urb: *mut bindings::urb) {
+/// construction in [`Device::bulk_in_queue`] / [`Device::bulk_out_queue`]).
+unsafe extern "C" fn urb_signal_complete(urb: *mut bindings::urb) {
     // SAFETY: by construction `context` points to a live, initialized `struct completion`
     // that outlives the URB.
     let done = unsafe { (*urb).context } as *mut bindings::completion;
-- 
2.55.0

