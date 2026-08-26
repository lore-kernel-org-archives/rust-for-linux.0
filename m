Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E30463B75
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761892; cv=none; b=n+sJEAr5Y0qzGejsSdoUjgkGgNvtcS5JvEWdOks3/ICU3zUgyYW9kRSf9+J9q54KSMlTlNpgwqSy7fybfcP+zZWkJ0EL62dCdg+j/JfRnAkeXcCZ8xwmnv6YnOaMBivaL4yK5k8+W2l06b9Mlss/wPqFOcliKVAq0e/lFtS6954=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761892; c=relaxed/simple;
	bh=bDleuC4fWBP/7tSk2f4dvloUQ9CGGDhQbOUKHanvzjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EvVf76EeYveFeiX/chjgWo93Bqq73vU8/bd7VZgSY1UuQqKpv9KJt+vBFJ9egsGnAKBwYSrdiLg5k4teTlUdOsC7QhpJAuBeJpFEGg93Vo9SCwFvwzFAIjZ+ASGVWkhgGxMhKD2jgLbfwNQZDY+Pz8T2YvBjimDWOcXktpORpng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=njCznbWj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="njCznbWj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso7725315e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761887; x=1788366687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOzliskgDKQtR5E61PrjeewI/eqpkwli/h1gXYQuWOQ=;
        b=njCznbWjxJxIVas0EvNIyM3h/OYfnFsPUXTLC6mCJRKuRo3Y2bqZd4HNovQLKLI3iZ
         a9qNuJEw3BpM3Z5zPWqlVQJHLk+55LUE4wyby+FvqiXpo8EyxpbaOPmpGMO7ZRCCy8Cg
         61jXHYbEhm8SqqMppAhfaIB+xS6g6FGo1KjU6WzliOi8WuZsrBhWa2Aq7WwONiU/DLQu
         irbDM64n6Jof/K0MZec6CtlDD/NFsYrG0aTwEMmlA98P7qktmMg6PCKt8ivUbG0exolD
         iSY+fA+Tv/P40xZV5LSEwcUZGujLYFJygFHN3BMZk00qEucp4fm9c13MmJZhOyosp1PL
         1aLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761887; x=1788366687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOzliskgDKQtR5E61PrjeewI/eqpkwli/h1gXYQuWOQ=;
        b=WX2D8MXUWxEyrgTUfW8946g1hsrEE4SJ8BD2OB10iM10JXgwOplgQveZOEQT5EsFJP
         S1yBfAU9AwrvtIP1qCo8HF/UqwD2bdlyWiZ4LCACjyd9u5JR6m3Y31t07yQANtCFRaUC
         fRc+ajARXzYCuT6Bj5rMAGG9p5E1u4iWPefHFOzNjVcqCRRz5EF+bpEKg5xR7Ji1MvSd
         2J0drpZzbo+9dtH+O+3Sx7GDZV1YzBAIWknbnT/zVKpYwq3tgCbLfAztyRoBiKzqYNax
         7Yq6XWa2bs1BoNpnHVLTeDPLUV4yZWyVzGjEdxhRZ7P85wBkxzOEI3/lTpr5HK1hKE7E
         BJ7A==
X-Forwarded-Encrypted: i=1; AHgh+RpYEUJ3aWhLlVGWNCAlhVIOb50hkOd6Z9KieCHQno4stowN7jSUwcuSkZnpE48CJtaaHYBMXG8B9v5rsiy+RA==@vger.kernel.org
X-Gm-Message-State: AFuF++kCn6VtLq+2MlvM+mvvlAQvcX6kqBsNWR5ODBTSu6qolC0cTc/P
	TJ2JPGf+u3HM5SrtWZH56ecdHk623BqikBhChKrrYBGojE9yhJALHZ6cttRC2fa2DQ==
X-Gm-Gg: AR+sD130VjigqksgcQZIJvrmZL08jnw6XIjRlXFMuHbxO4NZB+Y++CT6vxB1y3JmdFM
	mjMjQ8Y1BovQyUBwZ6I0qVXY28gGTMPCQZIoJujeb0zwrhoTgmV7/xl3Gma8msJRlhK4MJwBerQ
	Cim+SRnS/TuX3kHBdbJlg0W8kR4E9wYut8eUn266L7ZkmRDF2LKJLGX0Wbq5CDOLhpUgg7483zK
	o1BX7jMtcEEO55YSH7d7DdRaqRNpyhRKP5T2W98qu7SLlWQNZxgrRBXrZzDRbImvF/PXYJmH1bM
	NPi1YdHBqow5hWhcOfxOKISu/tbcukUaOyfEIgxuXz5OUnjYndWHnqauFO0rtSF95kkxScUUA0R
	HP9go0m2S5o+6HXgXUdAJYNiMjRUTgQ9baKhwMQ/nVtDGab4MHe1h92ox1SBXrLP0tLyUjS3PA2
	yirCrfF7FNMdTfKRs++wr9/8T/WumsVA9AwHyUFoVs+qX0GCHl6fNoNWiOYJyA9vxhDEInskWn9
	BYCrltRfj2WZvp1k4W/gqHWi2+1rIYegcdN
X-Received: by 2002:a05:600c:3145:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-499dc703b1dmr72553705e9.6.1787761886420;
        Wed, 26 Aug 2026 09:31:26 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc9b83aesm31202705e9.12.2026.08.26.09.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:31:24 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: linux-usb@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
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
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Colin Braun <colinbrauncl@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] rust: usb: add reusable URBs and persistent bulk queues
Date: Wed, 26 Aug 2026 17:30:38 +0100
Message-ID: <20260826163101.4168-3-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163101.4168-1-mike@fireburn.co.uk>
References: <20260826163101.4168-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow an idle URB to retain its full transfer allocation, vary the
submitted length, recover the handle after completion or a failed
submission, and carry the narrow cancellation capability needed by
an owning I/O window.

Build bounded bulk-IN and bulk-OUT queues from those typed
URBs. Preallocate every slot and DMA buffer, require an I/O token
from the same interface for each operation, and register all queue
URBs so closing the window cancels blocked transfers before waiting
for users to drain.

This lets streaming drivers reuse the common USB abstraction instead
of carrying private URB allocation, completion, cancellation, and
teardown code.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/helpers/usb.c |  17 ++
 rust/kernel/usb.rs | 638 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 648 insertions(+), 7 deletions(-)

diff --git a/rust/helpers/usb.c b/rust/helpers/usb.c
index ac7b30334882..1501f5438e43 100644
--- a/rust/helpers/usb.c
+++ b/rust/helpers/usb.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/completion.h>
 #include <linux/usb.h>
 
 __rust_helper struct usb_device *
@@ -8,6 +9,22 @@ rust_helper_interface_to_usbdev(struct usb_interface *intf)
 	return interface_to_usbdev(intf);
 }
 
+__rust_helper void
+rust_helper_usb_fill_bulk_urb(struct urb *urb, struct usb_device *dev,
+			      unsigned int pipe, void *transfer_buffer,
+			      int buffer_length, usb_complete_t complete_fn,
+			      void *context)
+{
+	usb_fill_bulk_urb(urb, dev, pipe, transfer_buffer, buffer_length,
+			  complete_fn, context);
+}
+
+__rust_helper void
+rust_helper_reinit_completion(struct completion *x)
+{
+	reinit_completion(x);
+}
+
 __rust_helper unsigned int
 rust_helper_usb_sndbulkpipe(struct usb_device *dev, unsigned int endpoint)
 {
diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index c3d0cc36d425..ad40c814616a 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -28,6 +28,7 @@
         new_mutex,
         Arc,
         ArcBorrow,
+        Completion,
         CondVar,
         Mutex, //
     },
@@ -935,7 +936,8 @@ fn timeout_millis(timeout: Delta) -> Result<kernel::ffi::c_int> {
 /// The USB adapter owns one `IoWindow` for every successfully bound interface and passes a
 /// reference-counted handle to [`Driver::probe`]. Drivers take an [`Io`] token from it around every
 /// transfer. The adapter revokes the window and blocks until every outstanding token has been
-/// dropped before suspend, reset or disconnect completes.
+/// dropped and every queue URB registered against it has been killed before suspend, reset or
+/// disconnect completes.
 ///
 /// Because [`Io`] borrows the window, and the transfer methods and queues live on [`Io`], a
 /// transfer cannot outlive the window that permitted it.
@@ -957,6 +959,17 @@ struct IoState {
     open: bool,
     /// How many [`Io`] tokens are currently alive.
     active: usize,
+    /// URBs belonging to queues opened against this window, so [`IoWindow::close`] can cancel
+    /// them even though the queues themselves are owned by the driver.
+    urbs: KVec<RegisteredUrb>,
+    /// Source of the per-queue tokens used to deregister a queue's URBs on drop.
+    next_token: u64,
+}
+
+/// One queue-owned URB registered with an [`IoWindow`], tagged with its queue's token.
+struct RegisteredUrb {
+    token: u64,
+    canceller: UrbCanceller,
 }
 
 impl IoWindow {
@@ -967,6 +980,8 @@ fn new(interface: ARef<Interface>) -> impl PinInit<Self> {
             state <- new_mutex!(IoState {
                 open: true,
                 active: 0,
+                urbs: KVec::new(),
+                next_token: 0,
             }),
             idle <- new_condvar!(),
         })
@@ -993,17 +1008,32 @@ pub fn interface(&self) -> &Interface {
 
     /// Closes the window and waits until no I/O is in flight.
     ///
-    /// New [`Io`] tokens are refused immediately, then the call blocks until the last outstanding
-    /// token has been dropped.
+    /// New [`Io`] tokens are refused immediately. Every URB belonging to a queue opened against
+    /// this window is killed, which releases anything blocked waiting on one, and the call then
+    /// blocks until the last outstanding token has been dropped.
     ///
     /// This is idempotent and sleeps, so the adapter only calls it from process context.
     fn close(&self) {
         let mut state = self.state.lock();
         state.open = false;
 
+        // First wake token holders blocked in `recv()` or `flush()`. A token acquired before
+        // `open` was cleared may still resubmit while unwinding, so this is only the wakeup pass.
+        for reg in state.urbs.iter() {
+            reg.canceller.cancel();
+        }
+
         while state.active != 0 {
             self.idle.wait(&mut state);
         }
+
+        // No token can submit after this point. Cancel once more to catch a final resubmission
+        // made while an existing token was unwinding. Cancellation waits for the completion
+        // callback, which takes no window lock. Holding the lock also keeps queue deregistration
+        // from releasing a cancellation capability while it is used here.
+        for reg in state.urbs.iter() {
+            reg.canceller.cancel();
+        }
     }
 
     /// Reopens a window that was closed by a suspend or pre-reset.
@@ -1012,6 +1042,36 @@ fn close(&self) {
     fn reopen(&self) {
         self.state.lock().open = true;
     }
+
+    /// Registers `urb` as belonging to the queue identified by `token`, so [`close`] can cancel
+    /// it.
+    ///
+    /// [`close`]: IoWindow::close
+    fn register_urb(&self, token: u64, canceller: UrbCanceller) -> Result {
+        let mut state = self.state.lock();
+        if !state.open {
+            return Err(ENODEV);
+        }
+        Ok(state
+            .urbs
+            .push(RegisteredUrb { token, canceller }, GFP_KERNEL)?)
+    }
+
+    /// Allocates a fresh queue token.
+    fn new_token(&self) -> Result<u64> {
+        let mut state = self.state.lock();
+        if !state.open {
+            return Err(ENODEV);
+        }
+        let token = state.next_token;
+        state.next_token = state.next_token.checked_add(1).ok_or(EOVERFLOW)?;
+        Ok(token)
+    }
+
+    /// Drops every URB registration made under `token`.
+    fn deregister(&self, token: u64) {
+        self.state.lock().urbs.retain(|reg| reg.token != token);
+    }
 }
 
 /// Proof that USB I/O is currently permitted on an interface, and the handle through which every
@@ -1040,6 +1100,15 @@ pub fn interface(&self) -> &Interface {
         self.window.interface()
     }
 
+    /// Returns the interface in the bound context proven by this token.
+    fn bound_interface(&self) -> &Interface<device::Bound> {
+        // SAFETY: The adapter only opens an `IoWindow` after successful
+        // probe/resume/reset completion and closes it before the interface
+        // leaves the bound I/O state. Holding `Io` proves that window is
+        // still open for this borrow.
+        unsafe { &*(core::ptr::from_ref(self.window.interface()).cast()) }
+    }
+
     /// The `struct usb_device` that interface belongs to.
     fn device(&self) -> *mut bindings::usb_device {
         // SAFETY: the window holds a reference to a valid `struct usb_interface`, and
@@ -1257,6 +1326,432 @@ pub fn set_alternate_setting(&self, alternate: u8) -> Result {
     }
 }
 
+/// The I/O-window registration shared by both queue types.
+///
+/// Owning this as a separate field means a queue under construction already has a working `Drop`
+/// before any per-slot allocation is attempted, so a mid-construction failure
+/// cannot leave URBs registered with the window.
+///
+/// The window is held by [`Arc`] rather than borrowed because a queue normally lives in the
+/// driver's device data, which has no lifetime to borrow from. That does not weaken the guarantee
+/// that matters: every queue operation still requires an [`Io`] token, which [`IoWindow::close`]
+/// stops issuing, and `close()` cancels the queue's URBs through its registration.
+struct QueueRegistration {
+    window: Arc<IoWindow>,
+    token: u64,
+}
+
+impl QueueRegistration {
+    fn new(window: &Arc<IoWindow>) -> Result<Self> {
+        Ok(Self {
+            token: window.new_token()?,
+            window: window.clone(),
+        })
+    }
+
+    fn register(&self, canceller: UrbCanceller) -> Result {
+        self.window.register_urb(self.token, canceller)
+    }
+
+    /// Checks that `io` was taken from the same window this queue was opened against, so a queue
+    /// cannot be driven using a token that proves nothing about *its* device's I/O state.
+    fn check(&self, io: &Io<'_>) -> Result {
+        if !core::ptr::eq(&*self.window, io.window) {
+            return Err(EINVAL);
+        }
+        Ok(())
+    }
+}
+
+impl Drop for QueueRegistration {
+    fn drop(&mut self) {
+        // Drop the window's records of this queue's URBs before the queue frees them, so a
+        // concurrent `IoWindow::close()` can never see a freed URB.
+        self.window.deregister(self.token);
+    }
+}
+
+enum QueueUrb {
+    Idle(Pin<UrbHandle<Completion, Idle>>),
+    Active(UrbHandle<Completion, Active>),
+}
+
+/// One persistent queue slot built from the common typed URB abstraction.
+struct UrbSlot {
+    urb: Option<QueueUrb>,
+    done: Arc<Completion>,
+    capacity: usize,
+}
+
+impl UrbSlot {
+    fn new(io: &Io<'_>, pipe: Pipe, buf_len: usize) -> Result<Self> {
+        let buffer: Pin<KBox<[u8]>> = KBox::pin_slice(
+            |_| {
+                // SAFETY: The initializer writes one valid `u8` and cannot
+                // fail after partially initializing the element.
+                unsafe {
+                    pin_init::pin_init_from_closure(|slot: *mut u8| {
+                        slot.write(0);
+                        Ok::<(), Error>(())
+                    })
+                }
+            },
+            buf_len,
+            GFP_KERNEL,
+        )?;
+        let buffer = Pin::into_inner(buffer);
+        let done = Arc::pin_init(Completion::new(), GFP_KERNEL)?;
+        let urb = Urb::<Completion>::new_bulk(
+            GFP_KERNEL,
+            io.bound_interface(),
+            pipe,
+            buffer,
+            Some(done.clone()),
+            urb_signal_complete,
+            TransferFlags::default(),
+        )?;
+
+        Ok(Self {
+            urb: Some(QueueUrb::Idle(urb)),
+            done,
+            capacity: buf_len,
+        })
+    }
+
+    fn canceller(&self) -> Result<UrbCanceller> {
+        match self.urb.as_ref() {
+            Some(QueueUrb::Idle(urb)) => Ok(urb.canceller()),
+            Some(QueueUrb::Active(urb)) => Ok(urb.canceller()),
+            None => Err(EIO),
+        }
+    }
+
+    fn is_active(&self) -> bool {
+        matches!(self.urb, Some(QueueUrb::Active(_)))
+    }
+
+    fn wait(&self, timeout: Delta) -> bool {
+        let millis = timeout.as_millis();
+        let millis = if millis <= 0 {
+            0
+        } else {
+            millis.try_into().unwrap_or(u32::MAX)
+        };
+        self.done
+            .wait_for_completion_timeout(crate::time::msecs_to_jiffies(millis))
+    }
+
+    fn finish(&mut self) -> Result<(i32, usize)> {
+        let state = self.urb.take().ok_or(EIO)?;
+        let active = match state {
+            QueueUrb::Active(urb) => urb,
+            idle @ QueueUrb::Idle(_) => {
+                self.urb = Some(idle);
+                return Err(EINVAL);
+            }
+        };
+        let idle = active.into_idle();
+        let status = idle.status();
+        let actual = idle.inner().actual_length as usize;
+        self.urb = Some(QueueUrb::Idle(idle));
+        Ok((status, actual))
+    }
+
+    fn copy_from_buffer(&mut self, out: &mut [u8], len: usize) -> Result<usize> {
+        let state = self.urb.take().ok_or(EIO)?;
+        let idle = match state {
+            QueueUrb::Idle(urb) => unsafe { Pin::into_inner_unchecked(urb) },
+            active @ QueueUrb::Active(_) => {
+                self.urb = Some(active);
+                return Err(EBUSY);
+            }
+        };
+        let n = len.min(out.len()).min(self.capacity);
+        out[..n].copy_from_slice(&idle.transfer_buffer()[..n]);
+        // SAFETY: The C URB allocation is stable independently of this handle.
+        self.urb = Some(QueueUrb::Idle(unsafe { Pin::new_unchecked(idle) }));
+        Ok(n)
+    }
+
+    fn prepare_transfer(&mut self, data: &[u8]) -> Result {
+        let state = self.urb.take().ok_or(EIO)?;
+        let mut idle = match state {
+            QueueUrb::Idle(urb) => unsafe { Pin::into_inner_unchecked(urb) },
+            active @ QueueUrb::Active(_) => {
+                self.urb = Some(active);
+                return Err(EBUSY);
+            }
+        };
+        let result = if data.len() > self.capacity {
+            Err(EMSGSIZE)
+        } else {
+            idle.transfer_buffer_mut()[..data.len()].copy_from_slice(data);
+            idle.set_transfer_buffer_length(data.len())
+        };
+        // SAFETY: The C URB allocation is stable independently of this handle.
+        self.urb = Some(QueueUrb::Idle(unsafe { Pin::new_unchecked(idle) }));
+        result
+    }
+
+    fn submit(&mut self) -> Result {
+        let state = self.urb.take().ok_or(EIO)?;
+        let idle = match state {
+            QueueUrb::Idle(urb) => urb,
+            active @ QueueUrb::Active(_) => {
+                self.urb = Some(active);
+                return Err(EBUSY);
+            }
+        };
+
+        match idle.submit_recoverable(GFP_KERNEL) {
+            Ok(active) => {
+                self.urb = Some(QueueUrb::Active(active));
+                Ok(())
+            }
+            Err((error, idle)) => {
+                self.urb = Some(QueueUrb::Idle(idle));
+                Err(error)
+            }
+        }
+    }
+}
+
+/// A persistently-queued asynchronous bulk IN reader. See [`Io::bulk_in_queue`].
+///
+/// [`recv`](Self::recv) waits for the next queued transfer, copies its data out and immediately
+/// re-submits its URB, so the endpoint stays posted.
+pub struct BulkInQueue {
+    inner: QueueRegistration,
+    slots: KVec<UrbSlot>,
+    cursor: usize,
+}
+
+// SAFETY: The queue exclusively owns its device reference, URBs, buffers and completions. None is
+// tied to the creating thread, every operation that mutates it takes `&mut self`, and `Drop` kills
+// each URB before releasing the resources it refers to.
+unsafe impl Send for BulkInQueue {}
+
+impl BulkInQueue {
+    /// Opens a persistently-queued asynchronous bulk IN reader on `endpoint`.
+    ///
+    /// Allocates `depth` URBs, each with its own `buf_len`-byte DMA buffer, and submits them all
+    /// up front, so the controller keeps `depth` IN transfers posted to the device continuously.
+    /// This differs from [`Io::bulk_recv`], which posts a single URB only for the duration of the
+    /// call and so leaves the endpoint un-posted in between -- a window in which a device that
+    /// pushes a large reply while the host is blocked on an OUT can deadlock the bus.
+    ///
+    /// `io` must have been taken from `window`; it proves I/O is permitted right now. The queue's
+    /// URBs are registered with `window`, so [`IoWindow::close`] cancels them.
+    ///
+    /// Sleeps; must be called from process context.
+    pub fn new(
+        window: &Arc<IoWindow>,
+        io: &Io<'_>,
+        endpoint: &Endpoint<BulkIn>,
+        depth: usize,
+        buf_len: usize,
+    ) -> Result<Self> {
+        // A zero-depth queue has no slots, but `recv()` indexes slot zero and takes the cursor
+        // modulo the slot count; reject it rather than divide by zero later.
+        if depth == 0 || buf_len == 0 {
+            return Err(EINVAL);
+        }
+        if !core::ptr::eq(&**window, io.window) {
+            return Err(EINVAL);
+        }
+
+        let pipe = endpoint.pipe();
+
+        // Build the queue -- which owns the device reference and whose `Drop` releases everything
+        // allocated so far -- before any fallible per-slot work, so no early return can leak.
+        let mut queue = Self {
+            inner: QueueRegistration::new(window)?,
+            slots: KVec::with_capacity(depth, GFP_KERNEL)?,
+            cursor: 0,
+        };
+
+        for _ in 0..depth {
+            let slot = UrbSlot::new(io, pipe, buf_len)?;
+            queue.inner.register(slot.canceller()?)?;
+            queue.slots.push(slot, GFP_KERNEL)?;
+        }
+
+        // Post every URB. On failure the queue's `Drop` kills and frees the rest.
+        for slot in queue.slots.iter_mut() {
+            slot.submit()?;
+        }
+
+        Ok(queue)
+    }
+
+    /// Waits up to `timeout` for the next queued IN transfer and copies up to `out.len()` bytes of
+    /// it into `out`.
+    ///
+    /// Returns `Ok(Some(n))` when a transfer completed -- its URB is re-submitted before
+    /// returning, so the endpoint stays posted -- `Ok(None)` on timeout with the URB still
+    /// outstanding, or `Err` if the transfer or the re-submission failed.
+    ///
+    /// `io` must come from the same [`IoWindow`] this queue was opened against; it proves I/O is
+    /// still permitted. Sleeps.
+    pub fn recv(&mut self, io: &Io<'_>, out: &mut [u8], timeout: Delta) -> Result<Option<usize>> {
+        self.inner.check(io)?;
+
+        let i = self.cursor;
+
+        // A previous re-submission may have failed, leaving this slot un-posted. Waiting on it
+        // would block on a completion that can never fire, so re-post it first.
+        if !self.slots[i].is_active() {
+            self.slots[i].submit()?;
+        }
+
+        if !self.slots[i].wait(timeout) {
+            // Still outstanding; leave it posted so a later call keeps waiting on the same slot.
+            return Ok(None);
+        }
+
+        let (status, len) = self.slots[i].finish()?;
+        let n = self.slots[i].copy_from_buffer(out, len)?;
+
+        self.cursor = (i + 1) % self.slots.len();
+
+        // Keep the endpoint posted, then report the completed transfer's status.
+        let resubmit = self.slots[i].submit();
+        if status != 0 {
+            return Err(Error::from_errno(status));
+        }
+        resubmit?;
+
+        Ok(Some(n))
+    }
+}
+
+/// An asynchronous, pipelined bulk OUT writer. See [`Io::bulk_out_queue`].
+///
+/// [`send`](Self::send) round-robins over the slots, waiting only for the transfer that previously
+/// used the slot it is about to reuse, so up to `depth - 1` transfers stay in flight while the
+/// next is prepared. [`flush`](Self::flush) drains them all.
+pub struct BulkOutQueue {
+    inner: QueueRegistration,
+    slots: KVec<UrbSlot>,
+    cursor: usize,
+}
+
+// SAFETY: As for `BulkInQueue`, the queue exclusively owns everything it refers to and cancels
+// every URB before releasing it.
+unsafe impl Send for BulkOutQueue {}
+
+impl BulkOutQueue {
+    /// Opens an asynchronous, pipelined bulk OUT writer on `endpoint`.
+    ///
+    /// Pre-allocates `depth` URBs with `buf_len`-byte DMA buffers but submits none up front: an
+    /// OUT URB carries caller data, so it is filled and submitted per [`send`](Self::send). This
+    /// lets up to `depth` transfers be in flight at once, instead of [`Io::bulk_send`]'s
+    /// block-per-transfer round trip.
+    ///
+    /// `io` must have been taken from `window`. Sleeps; must be called from process context.
+    pub fn new(
+        window: &Arc<IoWindow>,
+        io: &Io<'_>,
+        endpoint: &Endpoint<BulkOut>,
+        depth: usize,
+        buf_len: usize,
+    ) -> Result<Self> {
+        if depth == 0 || buf_len == 0 {
+            return Err(EINVAL);
+        }
+        if !core::ptr::eq(&**window, io.window) {
+            return Err(EINVAL);
+        }
+
+        let pipe = endpoint.pipe();
+
+        let mut queue = Self {
+            inner: QueueRegistration::new(window)?,
+            slots: KVec::with_capacity(depth, GFP_KERNEL)?,
+            cursor: 0,
+        };
+
+        for _ in 0..depth {
+            let slot = UrbSlot::new(io, pipe, buf_len)?;
+            queue.inner.register(slot.canceller()?)?;
+            queue.slots.push(slot, GFP_KERNEL)?;
+        }
+
+        Ok(queue)
+    }
+
+    /// Reaps slot `i` if it has an outstanding transfer, returning that transfer's status.
+    ///
+    /// `Ok(false)` means nothing was outstanding.
+    fn reap(&mut self, i: usize, timeout: Delta) -> Result<bool> {
+        if !self.slots[i].is_active() {
+            return Ok(false);
+        }
+
+        if !self.slots[i].wait(timeout) {
+            // Leave it posted so a later call keeps waiting on it.
+            return Err(ETIMEDOUT);
+        }
+        let (status, _) = self.slots[i].finish()?;
+        if status != 0 {
+            return Err(Error::from_errno(status));
+        }
+
+        Ok(true)
+    }
+
+    /// Submits `data` as a bulk OUT transfer without waiting for it to complete.
+    ///
+    /// If the slot about to be reused still has a transfer outstanding, this blocks up to
+    /// `timeout` reaping it and surfaces its error. `data` must be no longer than the queue's
+    /// `buf_len`, else [`EMSGSIZE`].
+    ///
+    /// `io` must come from the same [`IoWindow`] this queue was opened against. Sleeps.
+    pub fn send(&mut self, io: &Io<'_>, data: &[u8], timeout: Delta) -> Result {
+        self.inner.check(io)?;
+
+        let i = self.cursor;
+        if data.len() > self.slots[i].capacity {
+            return Err(EMSGSIZE);
+        }
+
+        // Free the slot if its previous transfer is still outstanding.
+        self.reap(i, timeout)?;
+
+        self.slots[i].prepare_transfer(data)?;
+
+        self.slots[i].submit()?;
+        self.cursor = (i + 1) % self.slots.len();
+
+        Ok(())
+    }
+
+    /// Waits up to `timeout` for every outstanding transfer to complete, returning the first error
+    /// encountered. Every slot is reaped regardless.
+    ///
+    /// `io` must come from the same [`IoWindow`] this queue was opened against. Sleeps.
+    pub fn flush(&mut self, io: &Io<'_>, timeout: Delta) -> Result {
+        self.inner.check(io)?;
+
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
+/// Wake the process-context owner of a completed queue URB.
+fn urb_signal_complete(result: UrbResult<'_, Completion>) {
+    if let Some(done) = result.context() {
+        done.complete();
+    }
+}
+
 // SAFETY: `usb::Interface` is a transparent wrapper of `struct usb_interface`.
 // The offset is guaranteed to point to a valid device field inside `usb::Interface`.
 unsafe impl<Ctx: device::DeviceContext> device::AsBusDevice<Ctx> for Interface<Ctx> {
@@ -1512,6 +2007,14 @@ fn status(&self) -> i32 {
         self.inner().status
     }
 
+    fn canceller(&self) -> UrbCanceller {
+        // SAFETY: `self` is a live URB. Take an additional USB-core
+        // reference for the cancellation capability.
+        let urb = unsafe { bindings::usb_get_urb(self.as_raw()) };
+        // `usb_get_urb()` returns its non-null argument.
+        UrbCanceller(unsafe { NonNull::new_unchecked(urb) })
+    }
+
     /// Returns a borrow of the driver-private context data, if any.
     pub fn context(&self) -> Option<ArcBorrow<'_, T>> {
         let context = self.inner().context;
@@ -1533,14 +2036,45 @@ pub fn context(&self) -> Option<ArcBorrow<'_, T>> {
 pub struct UrbHandle<T, S: UrbState = Idle> {
     /// Pointer to the underlying C `struct urb`.
     urb: NonNull<bindings::urb>,
+    /// Size of the allocation backing `transfer_buffer`.
+    transfer_buffer_capacity: usize,
     /// State marker.
     _state: PhantomData<S>,
     /// Type of driver-private context data.
     _ty: PhantomData<T>,
 }
 
-// SAFETY: The underlying urb is always reference-counted and can be released from any thread.
-unsafe impl<T> Send for UrbHandle<T, Active> {}
+// SAFETY: The underlying URB is reference-counted and may be released from
+// any thread. The context follows the same `Send + Sync` requirements as
+// `Arc<T>`.
+unsafe impl<T: Send + Sync, S: UrbState> Send for UrbHandle<T, S> {}
+
+/// A reference-counted capability which can only cancel an URB.
+///
+/// Queue registries keep this narrow handle so they can stop transfers during
+/// disconnect without gaining access to the URB or its transfer buffer.
+struct UrbCanceller(NonNull<bindings::urb>);
+
+// SAFETY: USB core reference-counts URBs and permits `usb_kill_urb()` from any
+// process context.
+unsafe impl Send for UrbCanceller {}
+// SAFETY: `cancel()` does not mutate Rust-owned state and USB core serializes
+// cancellation of an URB.
+unsafe impl Sync for UrbCanceller {}
+
+impl UrbCanceller {
+    fn cancel(&self) {
+        // SAFETY: This capability owns a reference to a live URB.
+        unsafe { bindings::usb_kill_urb(self.0.as_ptr()) };
+    }
+}
+
+impl Drop for UrbCanceller {
+    fn drop(&mut self) {
+        // SAFETY: Release the reference acquired by `Urb::canceller()`.
+        unsafe { bindings::usb_free_urb(self.0.as_ptr()) };
+    }
+}
 
 impl<T, S: UrbState> Deref for UrbHandle<T, S> {
     type Target = Urb<T>;
@@ -1551,6 +2085,76 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
+impl<T> UrbHandle<T, Idle> {
+    /// Returns the entire transfer-buffer allocation for an idle URB.
+    ///
+    /// The idle state proves that USB core cannot access the buffer while the
+    /// shared slice exists.
+    pub fn transfer_buffer(&self) -> &[u8] {
+        if self.transfer_buffer_capacity == 0 {
+            return &[];
+        }
+        // SAFETY: The URB is idle, its transfer buffer was allocated for
+        // `transfer_buffer_capacity` bytes in `init_common()`.
+        unsafe {
+            slice::from_raw_parts(
+                (*self.urb.as_ptr()).transfer_buffer.cast(),
+                self.transfer_buffer_capacity,
+            )
+        }
+    }
+
+    /// Returns the entire transfer-buffer allocation for an idle URB.
+    ///
+    /// The idle state proves that USB core cannot access the buffer while the
+    /// mutable slice exists.
+    pub fn transfer_buffer_mut(&mut self) -> &mut [u8] {
+        if self.transfer_buffer_capacity == 0 {
+            return &mut [];
+        }
+        // SAFETY: The URB is idle, its transfer buffer was allocated for
+        // `transfer_buffer_capacity` bytes in `init_common()`, and `&mut self`
+        // grants exclusive access for the returned borrow.
+        unsafe {
+            slice::from_raw_parts_mut(
+                (*self.urb.as_ptr()).transfer_buffer.cast(),
+                self.transfer_buffer_capacity,
+            )
+        }
+    }
+
+    /// Sets the number of transfer-buffer bytes used by the next submission.
+    pub fn set_transfer_buffer_length(&mut self, len: usize) -> Result {
+        if len > self.transfer_buffer_capacity {
+            return Err(EMSGSIZE);
+        }
+        let len = len.try_into()?;
+        // SAFETY: The URB is idle and `len` is within its backing allocation.
+        unsafe { (*self.urb.as_ptr()).transfer_buffer_length = len };
+        Ok(())
+    }
+}
+
+impl<T> UrbHandle<T, Active> {
+    /// Cancel any outstanding transfer and recover an idle, reusable handle.
+    pub fn into_idle(self) -> Pin<UrbHandle<T, Idle>> {
+        let this = core::mem::ManuallyDrop::new(self);
+        // SAFETY: The active handle owns a live URB. `usb_kill_urb()` waits
+        // until its completion callback has returned.
+        unsafe { bindings::usb_kill_urb(this.urb.as_ptr()) };
+
+        let handle = UrbHandle {
+            urb: this.urb,
+            transfer_buffer_capacity: this.transfer_buffer_capacity,
+            _state: PhantomData,
+            _ty: PhantomData,
+        };
+        // SAFETY: The C URB allocation is stable independently of the Rust
+        // handle's address.
+        unsafe { Pin::new_unchecked(handle) }
+    }
+}
+
 impl<T, S: UrbState> Drop for UrbHandle<T, S> {
     fn drop(&mut self) {
         // SAFETY: `self.as_raw()` points to a valid, initialized C `struct urb`.
@@ -1579,7 +2183,7 @@ fn drop(&mut self) {
             unsafe {
                 drop(KBox::from_raw(ptr::slice_from_raw_parts_mut(
                     urb.transfer_buffer.cast::<u8>(),
-                    urb.transfer_buffer_length as usize,
+                    self.transfer_buffer_capacity,
                 )));
             }
         }
@@ -1767,6 +2371,8 @@ fn init_common(
         transfer_flags: TransferFlags,
         interval: i32,
     ) -> Result<Pin<UrbHandle<T, Idle>>> {
+        let transfer_buffer_capacity = transfer_buffer.as_ref().map_or(0, |buffer| buffer.len());
+
         // SAFETY: `usb_alloc_urb` allocates a `struct urb` + ISO frame.
         let urb_ptr =
             unsafe { bindings::usb_alloc_urb(number_of_packets as c_int, mem_flags.as_raw()) };
@@ -1819,6 +2425,7 @@ fn init_common(
         let urb_handle = UrbHandle {
             // SAFETY: `urb_ptr` is guaranteed non-null by the null check above.
             urb: unsafe { NonNull::new_unchecked(urb_ptr) },
+            transfer_buffer_capacity,
             _state: PhantomData,
             _ty: PhantomData,
         };
@@ -1836,6 +2443,18 @@ pub fn submit(
         self: Pin<UrbHandle<T, Idle>>,
         mem_flags: kernel::alloc::Flags,
     ) -> Result<UrbHandle<T, Active>> {
+        self.submit_recoverable(mem_flags)
+            .map_err(|(error, _handle)| error)
+    }
+
+    /// Submit the URB while returning the idle handle when submission fails.
+    ///
+    /// Queue implementations use this variant so a transient submission
+    /// error does not discard a preallocated URB and its transfer buffer.
+    pub fn submit_recoverable(
+        self: Pin<UrbHandle<T, Idle>>,
+        mem_flags: kernel::alloc::Flags,
+    ) -> core::result::Result<UrbHandle<T, Active>, (Error, Pin<UrbHandle<T, Idle>>)> {
         // SAFETY: The urb pointed to is not moved.
         let handle = unsafe { Pin::into_inner_unchecked(self) };
         // SAFETY: `handle.as_raw()` points to a valid, initialized `struct urb`.
@@ -1843,14 +2462,19 @@ pub fn submit(
 
         if result == 0 {
             let urb = handle.urb;
+            let transfer_buffer_capacity = handle.transfer_buffer_capacity;
             core::mem::forget(handle);
             Ok(UrbHandle {
                 urb,
+                transfer_buffer_capacity,
                 _state: PhantomData,
                 _ty: PhantomData,
             })
         } else {
-            Err(Error::from_errno(result))
+            // SAFETY: Submission failed, so USB core did not take ownership
+            // and the handle remains idle and reusable.
+            let handle = unsafe { Pin::new_unchecked(handle) };
+            Err((Error::from_errno(result), handle))
         }
     }
 
