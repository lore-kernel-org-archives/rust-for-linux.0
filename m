Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445942;
	b=HWQIY5GsMAWLAYu7dUypEf0vwmUs7IZNjkpURb4jziReTcofRL6s56jfdidE+AAY1tk+
	 fjPNa4XSl+JZOzw60jfPTBlqMsETcYyOziKhbru+puC+tdBGXWsGJPR7Xykwf/CArUaWW
	 HrN6krTvKzfe+GumgzXqQafyPP1BQS8QQaD9gnWBcFXte6dk3yqiD3yu54e6czkFCF+8Q
	 DCqnbGjLmqg7JifwV9iVy6+f7SA465BiZMPrms49ej+votmAWQhLNZXECcj/IfgGhwJN2
	 aHqPTgk4Udq6v+/hGYwPvDY2XyGhXCiKESTfAieqtaIrEFPhxEwSLoHnWeVVtmC4b2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445942;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=v2gaihGg/GuepeIkKvB0k4619VTW2FHQPDjlRxDaYUM=;
	b=MiXGBhMsk/Ku3Y6NdYUdkkgsSfrPIFatBt0clwixMGOuRudsCGQt7bh6zobBptzMreiF
	 4CZ/NQqE208QycYXnPZw6Q29D5YvhtqFEzx0wNd818YCf4nfN7tKzJdQrohF70YzbDTYy
	 eqzvyEJcWObVkgN+3syMB6+mVGnHphcUIg1E079Y/5tLOM2ZcOr/WrdHWbn4egOa7XSNZ
	 xbexCwoFlbidEC8swBXe3vaY9y0R2qrxzdCZrm8IbJ3C7+Jv3X4nMatPcMe7w/P8i1Piv
	 AUL0Qi8OUTTWxkpnAJxJ8wh/A8nmj6VR4GJhiozyC+r/dNjtk9QErv+F6QLv2kDxPEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=L266WdpK;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896B6606A33C;
	Mon, 23 Nov 2026 14:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 896B6606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=L266WdpK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795445940;
	bh=ErJWV87Cis974R85V9yS/LlwellKyELN7c0KTWYyeTI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L266WdpKmbJN8EtRC1YXHS0QT0n/AsS3G7uRo3irJvuHc8UR69cypoKod7ckfGASw
	 1F/fBBPESTsV02j4s0uzI/awX4GwTepzD+Vn4D+vftqJ087zcTQTRFF3cw1Ax1+Jq6
	 Cj5bXcjRE8DOYhKU6GLEIxlza69xK58fdbKgaaEmoijwMrH+n4cEFYtGVbvLbn/L7d
	 Z66uBYupwFd43UJRTWecYtsIIPW8Zt3QdwQOtQ8p2YdsATCmeBwSbAS8c+SPyHI+iR
	 TkxMkHmmfVyc9gqmg93118wx4Hrle/1wJTWUPs9+sLMrNTwX2kb8cdv5kJoL+ZnX4T
	 ZM/IQIV00rcww==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B40C17E0DB6;
	Mon, 23 Nov 2026 15:58:59 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
Date: Mon, 23 Nov 2026 15:58:45 +0100
Subject: [PATCH v7 1/3] drm/tyr: add HwGate::try_access_atomic()
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-tyr-irq-v2-v7-1-4e172e58e28c@collabora.com>
References: <20260728-tyr-irq-v2-v7-0-4e172e58e28c@collabora.com>
In-Reply-To: <20260728-tyr-irq-v2-v7-0-4e172e58e28c@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, kernel@collabora.com, 
 Laura Nao <laura.nao@collabora.com>
X-Mailer: b4 0.12.0

From: Daniel Almeida <daniel.almeida@collabora.com>

HwGate::access() takes gate_lock, which is a mutex, so it cannot be
called from atomic context. IRQ handlers need to access the GPU
registers, and those are only reachable through the gate.

Add HwGate::try_access_atomic(). It enters SRCU without taking gate_lock
and returns None if the reset worker has closed the gate. close() now
sets a closed flag before waiting for SRCU readers, and HwClosedGuard
clears it when dropped. SRCU guarantees that a reader either sees the
flag set or is waited for.

An IRQ handler that gets None cannot acknowledge its interrupt, so its
interrupt has to stay masked while the gate is closed. Document this on
close(). No caller needs to do this yet: the only reset runs at probe,
before any IRQ handler is registered.

There are no users yet. The Job IRQ handler will be the first one.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/reset/hw_gate.rs | 55 ++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tyr/reset/hw_gate.rs b/drivers/gpu/drm/tyr/reset/hw_gate.rs
index 201f8c953078..40b38f07c472 100644
--- a/drivers/gpu/drm/tyr/reset/hw_gate.rs
+++ b/drivers/gpu/drm/tyr/reset/hw_gate.rs
@@ -6,10 +6,18 @@
 //! access with reset. Readers hold the mutex while entering SRCU, then release
 //! it before accessing hardware. The reset worker holds the mutex while waiting
 //! for admitted readers and resetting hardware.
+//!
+//! Readers that cannot sleep use [`HwGate::try_access_atomic`] instead. It
+//! enters SRCU without taking the mutex and fails if the reset worker has set
+//! `closed`, which it does before waiting for readers.
 
 use kernel::{
     prelude::*,
     sync::{
+        atomic::{
+            Atomic,
+            Relaxed, //
+        },
         new_mutex,
         srcu,
         Mutex,
@@ -32,6 +40,9 @@ pub(crate) struct HwGate<'hw> {
     /// Drains readers that entered before the reset worker acquired `gate_lock`.
     #[pin]
     srcu: Srcu,
+    /// Set while the reset worker owns the hardware. Checked by readers that
+    /// cannot take `gate_lock`.
+    closed: Atomic<bool>,
 }
 
 impl<'hw> HwGate<'hw> {
@@ -41,6 +52,7 @@ pub(crate) fn new(iomem: IoMem<'hw>) -> impl PinInit<Self, Error> {
             iomem,
             gate_lock <- new_mutex!(()),
             srcu <- kernel::new_srcu!(),
+            closed: Atomic::new(false),
         })
     }
 
@@ -60,15 +72,45 @@ pub(crate) fn access(&self) -> HwAccessGuard<'_, 'hw> {
         }
     }
 
+    /// Enters a reset-sensitive hardware-access section without sleeping.
+    ///
+    /// Returns `None` while the reset worker owns the hardware, in which case
+    /// the caller must skip its hardware access.
+    #[expect(dead_code)]
+    pub(crate) fn try_access_atomic(&self) -> Option<HwAccessGuard<'_, 'hw>> {
+        let srcu = self.srcu.read_lock();
+
+        // `close()` sets `closed` before waiting for readers, so SRCU guarantees
+        // that this reader either sees it set or is waited for.
+        if self.closed.load(Relaxed) {
+            return None;
+        }
+
+        Some(HwAccessGuard {
+            gate: self,
+            _srcu: srcu,
+        })
+    }
+
     /// Stops new readers and drains admitted readers for the reset worker.
     ///
     /// Callers must serialize write-side access. The reset controller's state
     /// machine provides that serialization.
+    ///
+    /// An IRQ handler that uses [`HwGate::try_access_atomic`] cannot acknowledge
+    /// its interrupt while the gate is closed. Callers must mask such an
+    /// interrupt before closing the gate and keep it masked until the gate
+    /// reopens.
     pub(super) fn close(&self) -> HwClosedGuard<'_, 'hw> {
         let gate_lock = self.gate_lock.lock();
 
-        // Holding `gate_lock` prevents new readers from entering SRCU. Readers
-        // admitted before us are enrolled, so wait for their read-side work.
+        // Stop `try_access_atomic()` readers. This must happen before waiting
+        // for readers below.
+        self.closed.store(true, Relaxed);
+
+        // Holding `gate_lock` prevents new readers from entering SRCU through
+        // `access()`. Readers admitted before us are enrolled, so wait for their
+        // read-side work.
         self.srcu.synchronize();
 
         HwClosedGuard {
@@ -104,3 +146,12 @@ pub(super) fn iomem(&self) -> &IoMem<'hw> {
         &self.gate.iomem
     }
 }
+
+impl Drop for HwClosedGuard<'_, '_> {
+    fn drop(&mut self) {
+        // Reopen for `try_access_atomic()`. A reader that races with this and
+        // still sees `closed` set returns `None`, as it would have before the
+        // store.
+        self.gate.closed.store(false, Relaxed);
+    }
+}

-- 
2.39.5

