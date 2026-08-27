Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2413A4513;
	Thu, 27 Aug 2026 08:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817702; cv=none; b=Myx5ndXQzIaoUo5YTwkr6ec5z/TjHYuYlHFPPxbUstIxYxTKNWq8lL/XtoB802lP63Lex27yVngJOvBwcBnfMQ3/AzNqtaOQniAEgF4rpwNmnR9HnszUPukx78JbpiRPAz0q/D6+p/4PQYAarF4qMNtuIEyeLRUADPaNw567F1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817702; c=relaxed/simple;
	bh=M1sla4NI7Z2SPj1X+URJliQyRjhU54PnMBlz9sucijQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ezp9ud/CkcpHPZU+msVWAtB22hTRBV4W1/PyLFcMOiV56Fj4jvhJ2/V4RxB2iNq7V1bO6QcyqbFx4dNZexdlnnxDgTkWOTYNbRPJvk+/4a36SftoU4Y3GDJ7KlYaaXx9RW1xsummir3C6w8i3vZ8dz3hgjUY8E/Tidl0c0Blc6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KmA7Vapz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KmA7Vapz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787817698;
	bh=M1sla4NI7Z2SPj1X+URJliQyRjhU54PnMBlz9sucijQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KmA7VapziNpyndCRUlOBLl3iQwwuORFPmQ3iaWwhBo0aiCZgupHCC9/sZNS0y5qnV
	 1DdSDEeUmn9ii3aSj/BX3en9PXinTFJba6GoCjMq4QdMlpA/EVcxfRG5FLPrcCYLrJ
	 eeowYjkwXxYo6s6n4eMdOt/frb51lFIZfzj9fUl5Blf8SMsAne4rgIp+9/ZtzpJKUA
	 bYE6Xu5Dw6wSYYBHHUI5BLuQ3SrITda6BFf6XL8fKaIUxbGOPrUyxp3enAL1nFR5vl
	 BiJZ3xu+vpDdmozQb7PSVtbI8AgBgXfEmD9udR20IvB4j+SLVPNXTBcLv9WS6GatCF
	 Jlp1KdXvVFQ7w==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4F9317E052E;
	Thu, 27 Aug 2026 10:01:37 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
Date: Thu, 27 Aug 2026 10:01:10 +0200
Subject: [PATCH v6 1/2] drm/tyr: add TyrIrq threaded IRQ wrapper
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-tyr-irq-v2-v6-1-15c90baed949@collabora.com>
References: <20260728-tyr-irq-v2-v6-0-15c90baed949@collabora.com>
In-Reply-To: <20260728-tyr-irq-v2-v6-0-15c90baed949@collabora.com>
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
 Laura Nao <laura.nao@collabora.com>, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.12.0

Introduce a generic TyrIrq threaded IRQ wrapper along with the
TyrIrqTrait trait describing the operations required to handle a
Tyr interrupt source.

Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/gpu/drm/tyr/irq.rs | 115 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/tyr.rs |   1 +
 2 files changed, 116 insertions(+)

diff --git a/drivers/gpu/drm/tyr/irq.rs b/drivers/gpu/drm/tyr/irq.rs
new file mode 100644
index 000000000000..e6a739532daa
--- /dev/null
+++ b/drivers/gpu/drm/tyr/irq.rs
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+//! Threaded IRQ wrapper shared by all Tyr interrupt sources.
+#![allow(dead_code)]
+use core::marker::PhantomPinned;
+
+use kernel::{
+    device::Bound,
+    irq::{
+        Flags,
+        IrqReturn,
+        ThreadedHandler,
+        ThreadedIrqReturn,
+        ThreadedRegistration, //
+    },
+    platform,
+    prelude::*, //
+};
+
+/// Trait describing the operations required to service a Tyr interrupt source.
+pub(crate) trait TyrIrqTrait: Sync {
+    /// Returns the masked interrupt status.
+    fn read_status(&self) -> u32;
+
+    /// Clears all bits in the mask register, disabling the interrupt sources.
+    fn clear_mask(&self);
+
+    /// Sets the mask register to re-enable the interrupt sources.
+    fn reenable_mask(&self);
+
+    /// Returns the raw interrupt status, regardless of the current mask.
+    fn read_raw_status(&self) -> u32;
+
+    /// Clears the given bits in the interrupt status register.
+    fn clear_status(&self, status: u32);
+
+    /// Returns the bitmask of interrupt sources handled by this instance.
+    fn mask(&self) -> u32;
+
+    /// Handles the given pending, unmasked interrupt bits.
+    fn handle(&self, status: u32);
+}
+
+/// A threaded IRQ wrapper shared by all Tyr interrupt sources.
+#[pin_data]
+pub(crate) struct TyrIrq<T: TyrIrqTrait> {
+    /// The interrupt source.
+    irq: T,
+    #[pin]
+    _pin: PhantomPinned,
+}
+
+impl<T: TyrIrqTrait> TyrIrq<T> {
+    /// Requests a threaded IRQ registration for `irq`, using `name` to look up the interrupt.
+    ///
+    /// # Safety
+    ///
+    /// Callers must not `mem::forget()` the resulting registration or otherwise prevent its
+    /// [`Drop`] implementation from running.
+    pub(crate) unsafe fn request<'a>(
+        pdev: &'a platform::Device<Bound>,
+        name: &'static CStr,
+        irq: T,
+    ) -> Result<impl PinInit<ThreadedRegistration<'a, Self>, Error> + 'a>
+    where
+        T: 'a,
+    {
+        let handler = try_pin_init!(Self {
+            irq,
+            _pin: PhantomPinned,
+        });
+
+        // SAFETY: The caller guarantees the resulting registration will not be leaked.
+        let registration =
+            unsafe { pdev.request_threaded_irq_by_name(Flags::SHARED, name, name, handler) };
+
+        // Clear the status and unmask once the handler has been
+        // successfully registered.
+        Ok(registration.pin_chain(|reg| {
+            let irq = &reg.handler().irq;
+            irq.clear_status(irq.mask());
+            irq.reenable_mask();
+            Ok(())
+        }))
+    }
+}
+
+impl<T: TyrIrqTrait> ThreadedHandler for TyrIrq<T> {
+    fn handle(&self) -> ThreadedIrqReturn {
+        let masked_status = self.irq.read_status();
+
+        if masked_status == 0 {
+            return ThreadedIrqReturn::None;
+        }
+        self.irq.clear_mask();
+        ThreadedIrqReturn::WakeThread
+    }
+
+    fn handle_threaded(&self) -> IrqReturn {
+        let mut ret = IrqReturn::None;
+
+        loop {
+            let raw_status = self.irq.read_raw_status() & self.irq.mask();
+            if raw_status == 0 {
+                break;
+            }
+            self.irq.clear_status(raw_status);
+            self.irq.handle(raw_status);
+            ret = IrqReturn::Handled;
+        }
+
+        self.irq.reenable_mask();
+        ret
+    }
+}
diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
index e7ec450bdc9c..31205e3bf0e7 100644
--- a/drivers/gpu/drm/tyr/tyr.rs
+++ b/drivers/gpu/drm/tyr/tyr.rs
@@ -12,6 +12,7 @@
 mod fw;
 mod gem;
 mod gpu;
+mod irq;
 mod mmu;
 mod regs;
 mod slot;

-- 
2.39.5

