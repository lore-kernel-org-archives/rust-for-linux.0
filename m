Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DD931AA87;
	Fri, 24 Apr 2026 23:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777074015; cv=pass; b=WbjIq75N8B+AIDq7i9eYZD9IOtb0Pq5GDemQb8ciAGwSEx1KhI/zHerEvC1OFrZHvFdULGVVBYm5yi/VU1SgTR/QMG1OdHkr/uqEG1baZ6p4iKXX8Uc4xVuyorf78Ku1y5uXck4fXcYz3nddUf7vYCghPukVQC5P61LglMCilqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777074015; c=relaxed/simple;
	bh=xBztUmrIxPyQpLOVj+M9Yh3wGVE5YCGEDXRbBB2CVyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KzF4IdO9eCSE8qBJNG95Ec4Zw+i3UeRfezt3FGVeKce2wyFhyKNdLI11xe95QL7LH7zuiBp//VmHrFfDj32e4YQmeSjZYV7kCgcnFM8nKWafyl+4ghr/eUgk5lTc1F5eaaAxpkH9NJDr9kpgLYLdg+lRLVDrcHuEXcPIa0CQUd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=dRddGOde; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="dRddGOde"
ARC-Seal: i=1; a=rsa-sha256; t=1777073973; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PQW1j+X5PVoElkVA87jJZ7oMKTud/RjxfC/dHYLkc7JW2PXEhfWBHZ5fRryswqJTiIgnjCQZ2dFwiro4Uj2ljGzqDKE6dgalaZjXj9Fzd23F3VZVeRI5ywVeKnWD3gf4BPd0OiilkFdMo2nAUi+b82L1OESJ02vA+EM/V3KG13w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777073973; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=H4ZePLI7oHmTTAzCsGdA/BVLAay5ItasEg8CJKfLmAk=; 
	b=m5EZ6wHf8XRR/LU3PeJXq/pOMt96ggwvKMdlyE5dtY82eCcYRy/8tvm9bO2F/18SddQ4IzcOrs/i8+hJRtFiBFSKee8zgpKkkObW0uONtHLdBw0cpDYclpgY7hpkcYcJEyaOTJyzUC98Wd1QpbgsrEufLlaE3D3Xqvr5fwLjHbE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777073973;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=H4ZePLI7oHmTTAzCsGdA/BVLAay5ItasEg8CJKfLmAk=;
	b=dRddGOdeb3158HmE5zF3CcOOw6ApSR1YDbGP8Q8ZSiagtc4EtEYctHIS8rvQPkC/
	qK8XNeYz9ea++zCNNkPCZGwdg858Rn1x086BZhGqZuku92KUb3XBuUuoVfjR+G2QcIm
	Ky6HWtU0ygMCpuVlvrxsQCNNRSLKkPYzp9zrehb8=
Received: by mx.zohomail.com with SMTPS id 1777073972516814.7703196540511;
	Fri, 24 Apr 2026 16:39:32 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Fri, 24 Apr 2026 16:39:08 -0700
Subject: [PATCH v4 14/20] drm/tyr: add Wait type for GPU events
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-b4-fw-boot-v4-v4-14-a5d91050789d@collabora.com>
References: <20260424-b4-fw-boot-v4-v4-0-a5d91050789d@collabora.com>
In-Reply-To: <20260424-b4-fw-boot-v4-v4-0-a5d91050789d@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, boris.brezillon@collabora.com, 
 beata.michalska@arm.com, lyude@redhat.com, acourbot@nvidia.com, 
 work@onurozkan.dev, alvin.sun@linux.dev, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5872;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=xBztUmrIxPyQpLOVj+M9Yh3wGVE5YCGEDXRbBB2CVyU=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJmv/ytkFZyyKlLc/eC8ZpNkw5NT+2tq7i3WusjBtu2nU
 ru09X/njlIWBjEuBlkxRZaz9kY94lXvjXTn/2+GmcPKBDKEgYtTACYyaw8jQ6u36ub4S/4Xz7wq
 mvNMTFeJ+U0Ns36E5cWLB1ZudOp7coHhf3nJ1PcLbxZXRoqoBkVOll0yb9cxtZS/5vUiZZM3Xf8
 hzwQA
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

Add a Wait convenience type wrapping a CondVar and Mutex for sleeping
until a condition is met or a timeout expires.

The helper centralizes a common wait pattern: check the completion
predicate before sleeping, wait interruptibly with a timeout, retry on
spurious or unrelated wakeups, and perform a final predicate check before
returning ETIMEDOUT.

This will be used for CSF firmware responses and other GPU-driven events.

Also add a new_wait! macro so each Wait instance gets a call-site-specific
lockdep class key for its internal mutex.

Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Co-developed-by: Beata Michalska <beata.michalska@arm.com>
Signed-off-by: Beata Michalska <beata.michalska@arm.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/tyr.rs  |   1 +
 drivers/gpu/drm/tyr/wait.rs | 126 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
index 18b0668bb217..fd83d4b40978 100644
--- a/drivers/gpu/drm/tyr/tyr.rs
+++ b/drivers/gpu/drm/tyr/tyr.rs
@@ -16,6 +16,7 @@
 mod regs;
 mod slot;
 mod vm;
+mod wait;
 
 kernel::module_platform_driver! {
     type: TyrPlatformDriverData,
diff --git a/drivers/gpu/drm/tyr/wait.rs b/drivers/gpu/drm/tyr/wait.rs
new file mode 100644
index 000000000000..2a4d691c443c
--- /dev/null
+++ b/drivers/gpu/drm/tyr/wait.rs
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+//! Code to wait on GPU events.
+#![allow(dead_code)]
+
+use kernel::{
+    new_condvar,
+    prelude::*,
+    sync::{
+        lock::{
+            mutex::MutexBackend,
+            Lock, //
+        },
+        Arc,
+        CondVar,
+        CondVarTimeoutResult,
+        Mutex, //
+    },
+    time::msecs_to_jiffies, //
+};
+
+/// Creates a new [`Wait`] instance with a call-site-specific lockdep class key.
+///
+/// Always prefer this macro over [`Wait::new_with_lock`] when the [`Wait`] instance has
+/// unique locking behaviour that could otherwise trigger false-positive lockdep
+/// warnings.
+#[macro_export]
+macro_rules! new_wait {
+    () => {{
+        let lock = new_mutex!(());
+        $crate::wait::Wait::new_with_lock(lock)
+    }};
+}
+
+/// A convenience type to wait for GPU events.
+///
+/// Wraps a [`CondVar`] and [`Mutex`] pair. The mutex synchronizes predicate checks
+/// with wait/wake operations; the condvar provides the sleep/wake mechanism.
+#[pin_data]
+pub(crate) struct Wait {
+    /// The actual wait/signal mechanism.
+    #[pin]
+    cond: CondVar,
+    /// Synchronizes waiters with notifications.
+    #[pin]
+    lock: Mutex<()>,
+}
+
+impl Wait {
+    /// Creates a new [`Wait`] with a caller-supplied lock instance.
+    ///
+    /// Use [`new_wait!`] instead of calling this directly; the macro ensures a
+    /// per-call-site lockdep class key is registered.
+    pub(crate) fn new_with_lock(lock: impl PinInit<Lock<(), MutexBackend>>) -> Result<Arc<Self>> {
+        Arc::pin_init(
+            pin_init!(Self {
+                cond <- new_condvar!(),
+                lock <- lock,
+            }),
+            GFP_KERNEL,
+        )
+    }
+
+    /// Waits until a GPU event condition is met or the timeout elapses.
+    ///
+    /// Calls `on_woken` before sleeping and after each wakeup. If `on_woken`
+    /// returns [`WaitResult::Retry`], the wait continues; [`WaitResult::Done`]
+    /// returns success.
+    ///
+    /// `on_woken` is called while the internal wait lock is held, so it must be
+    /// cheap and must not call back into code that can notify this wait object.
+    ///
+    /// Returns [`ETIMEDOUT`] if the deadline is reached without the condition
+    /// becoming true, or [`ERESTARTSYS`] if interrupted by a signal.
+    pub(crate) fn wait_interruptible_timeout<F>(&self, timeout_ms: u32, mut on_woken: F) -> Result
+    where
+        F: FnMut() -> Result<WaitResult>,
+    {
+        let mut guard = self.lock.lock();
+        let mut remaining_time = msecs_to_jiffies(timeout_ms);
+
+        loop {
+            // Check the condition before sleeping to avoid missing a wakeup
+            // that arrived between the caller's last check and acquiring the
+            // lock here.
+            if let WaitResult::Done = on_woken()? {
+                return Ok(());
+            }
+
+            match self
+                .cond
+                .wait_interruptible_timeout(&mut guard, remaining_time)
+            {
+                CondVarTimeoutResult::Woken { jiffies } => match on_woken()? {
+                    WaitResult::Done => return Ok(()),
+                    WaitResult::Retry => remaining_time = jiffies,
+                },
+                CondVarTimeoutResult::Timeout => {
+                    // One final check before giving up.
+                    if let WaitResult::Done = on_woken()? {
+                        return Ok(());
+                    }
+                    return Err(ETIMEDOUT);
+                }
+                CondVarTimeoutResult::Signal { .. } => return Err(ERESTARTSYS),
+            }
+        }
+    }
+
+    /// Wakes all waiters.
+    ///
+    /// Takes the internal lock so notifications are serialized against waiters
+    /// checking the condition and entering the sleep state.
+    pub(crate) fn notify_all(&self) {
+        let _guard = self.lock.lock();
+        self.cond.notify_all();
+    }
+}
+
+/// The result of a wait operation.
+pub(crate) enum WaitResult {
+    /// The condition was met.
+    Done,
+    /// The wakeup was spurious or for an unrelated event; retry.
+    Retry,
+}

-- 
2.53.0

