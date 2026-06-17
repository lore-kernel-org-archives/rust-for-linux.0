Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF9847CC7E
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708465; cv=none; b=J+zbbLwrJ+LGo/MSvFLrTtmjQmnbwPu/QDiqerocd6JRUNVDRoySqjQwAYaMCAtvqkWG3kePD8+98Idiow5TkL+8dbAXNwtbuxzUF1P/8F29D2qG+VTmpbngjvFRJY9c6UjrJ/SI2LyqDbrZJB+UfS/VIbyXyyh3NI7Y/GNm3aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708465; c=relaxed/simple;
	bh=9cXmWKSAslU8s0DnuwVXC9iJAPc8te8usP9TyPJRfiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fqjAElKnmweS/pT5F5vqzQa7PwFc686mbFPsNqcBlG7qsuXELQTxoa3Zm0QuGRmYNCuYcBXzjwIuGha6YJkOQae+vw2NwOE3m7YWK76GZuqQ2tzesp7O4ldtea5HISAusFusGFuTkiy7ywI4mGAc/Nqt2N4KrwxT0sBS1t4hzxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=ilYY59U5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="ilYY59U5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490ac357c55so55362605e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708456; x=1782313256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lla6Q44yiJKGOX7hgCsG1uCW0T5kiVpL0x6FoZ8jo0M=;
        b=ilYY59U5HL2Kd0UANNVeFikdOp9+aPt5kNkb0P8J3ZOznO5NKOkWz1m/NEhoowGsD1
         wr+n/f1haqSE0D8r2uK+j/xOLGLxM9UsIeWzJi3v/6nDMCaajDeIBsQ+UNOdu+FZSbxR
         lR2LNjo6DL+RB+7IQKslX1wewyro0u3mosehxd1G7X8s6ztta4NN+lyAJqwm+2HeSzTW
         aJwpfqDAicPhzEkTqWAqp+bFHvp5/pb59/xivCSnkYR650UA5aHy0TnLukF5U7xrTcOG
         SkQD0sKtZ1c+wzhXqGFG5biNri+Fpwb6tGnVsJZT2pk2CWf8cJaqXLm8OrSthHXP0w+c
         90tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708456; x=1782313256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lla6Q44yiJKGOX7hgCsG1uCW0T5kiVpL0x6FoZ8jo0M=;
        b=Vn/yFwhOhzZ7eJK2En97MQZfY8K824XfezW2+nkmdyRgtaGKXv2ZMadXHzTHdt3276
         W0YfQlC5YR6Nwae8YzLENOR/+Le0fYqyAVXfx9opBbKQildiFK63nvTWSgxgMqRarE4A
         NPUVKYALDFQDLmppvIzI6IuyCGpS1ERUf9/qojBDDDURNK2WWSR7OxroHDPzjUw0c+fe
         OXtCSCGbimFgXIacVAZYa8lR/ALffASNmEBE30J0+Q20R2B70Sc/KK0uwyGVpczPL30s
         SamidCBCNQaJ4AEgftl3vJBV9Uk1nkRLd0xXxkCY9lTEL8DDDRqTLe2FmMSEpWsrgFzA
         dtvA==
X-Gm-Message-State: AOJu0Yz9jcnGfAmVLl3t95js1BRJBaPI17O+CUsVPN+8bdF2jXsCUdT3
	IKu1nCuVsbVVhAzbbc9yl/Pn/mcDfe5NiJp3XiEOWDaX17pL2lvom30ov5FGF/o0WRkEc7zHE2Z
	M6SLr1dM1
X-Gm-Gg: Acq92OESekcLIw0fIVb5RLMEV9t6x1pSp41uZunrrEaKJZH001dmEbwCf8ZHPquhMSL
	EnLv1QzccAdO+oXLR3VeMtz1Ga3hltXXElOyAeWjCFhOJVkK2nqSdK5D8CjLQQLDAYsMqONdYHO
	G2lHnhx6ajg6zg/XosDYF8MSQhz/R5tCBwjOn+QU6M7T38HHjTRt1FRKj9QCObk8DOuuoNAj6ge
	tYU/eoxVjRnYNFAoEG/Vvgu6b9vlsQV2LE/WQsBwberb9K5de0d912V32ibRBFzYJlIebjgjDmD
	Hfjitk89jvtcjWZe0+oxkPBR33IsdlB4Dv4+V+vOMmhfLYCFzedw3HtZvXhnnWJVBU6UtRncsjG
	7yFld8BqUZYMq666UuhKq9bYYPVzi0o/lxA1ZPFwViouiczsE5CRNeognTjOg5944z9zkpkRWz7
	+xns31Pxf7DkNM/pBmaAxpwDDWzB+8PQgHvcoaHAr/CyWSTOW3IGasR0lX
X-Received: by 2002:a05:600c:609a:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-492333a991fmr72337525e9.9.1781708456031;
        Wed, 17 Jun 2026 08:00:56 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa9f2c0sm203011965e9.15.2026.06.17.08.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:00:55 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	linux-usb@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 9/9] rust: usb: add an asynchronous pipelined bulk OUT queue
Date: Wed, 17 Jun 2026 15:59:21 +0100
Message-ID: <20260617145946.1894-10-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617145946.1894-1-mike@fireburn.co.uk>
References: <20260617145946.1894-1-mike@fireburn.co.uk>
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
2.54.0

