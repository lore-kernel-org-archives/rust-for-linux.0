Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452891;
	b=5HgD8j/JnGRcW3n4ACZDp0cLyjs6OEKbJ4uw7ZWn6u26vcfFb1d0yQFypz3BYighxGX5
	 pqg7eKtaV/n+1ALYQvXmCb5AkEXvNqEDgZbHyjGGYYgtFBY6ib+1dGAJPCQqnBOFugirk
	 B7AsK4ow5tgaP9Shyu567200HzHXyNvKwktj5/IgiSJ9Uw5WjT4o9LKITUqrj5xMYeiRY
	 Vx014LhVJjtYiXQaDBGb1IentKRhoPkGuSdPktHU414nKNfOhNmFwu8JwfGvw5Lj0D0l6
	 GDqOx9YXL8hONIunyokrXmh2Y9sNwZK8UnH6GYWYT6AiP/9MaUkTKRYOMi903GXSp1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Developer-Key:X-Developer-Signature:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=yYgGBwtoModPOWWXIECz8dwnr/MeNeZyXwpagOjeJf4=;
	b=Vq4t8GNHXz8dAt90cWli4FARDieqDYgr5sm8o7S2X+RkJOcb/G57wm+fxCSlCCMeXFFt
	 2E7xXa2aGXzW7KeNVdHRw3ZsCRXE3WoyCWOTAfyuglSF7EcghoPfnlia/wVd88OjIfv2p
	 fwpUJyUqAhbXPZ+0y+LtgyFhjH8S9RdY307v8dPNKojOA6louu6xbWiX9Ye8+BkhEGdDL
	 oDm0tfDzQkFZX5L9t9IG0zXrosc2qx2t25b6vgNHXzdjuspNYuiEfL/24Gu9xVeLwzGB7
	 QTZpwC4xlLuJ8IAMve4aqunV6PpMBXwtw2o+3HICCScGQKafuyiMbMHAIJMRhABEnqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QTPIdIow;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588CB606A32C
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 23:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 588CB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QTPIdIow
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5482021eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 16:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792452890; x=1793057690; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yYgGBwtoModPOWWXIECz8dwnr/MeNeZyXwpagOjeJf4=;
        b=QTPIdIowpXQnzvD8GbDaYnYvCPJIbbKCLQuaTHe0vY6Ba07DHG/K++i/RA+gdyeBX4
         N9XNPeJvtzqQBa/THtfMFQKuRf5IfUR5Z3mVC2MCmQrWPM2BQ/p4IouiDV7Um2C0tD+E
         tWBXf3RPhP9cg7SYKcS5o9O7EviqoLMObDIsnp7aLEtdrxYewBoi3bq1MgOgl6br3/60
         wwIy+LaHKMebn8eCStvKdDOV1hoUYh44NG+IB3Wwss96CoUgEBAuFJ4JX2ASwpmw6/ui
         pXwYXufqH+DdCpbZPzBPK4g4cta6JBU3Vkc/Mr0SmF85cb+YeDiNHdGf+LnnlJELvX8n
         xrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452890; x=1793057690;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYgGBwtoModPOWWXIECz8dwnr/MeNeZyXwpagOjeJf4=;
        b=oujWoH/PP6bdqyU2JDfQJYU3ugSpyylmgm+PRZDJpA4UAcuBApjf8B/IrrvAwB7UDi
         XPXQvuuMGPYsZM8ymrzYx/dlcMi81EM9xaRofZ9g44/sWYxhuGjcfwYMmU5t2ZZUo0Zf
         +ctU4MjbrCg5HRRnJLlmWJUGaKgoBAu+fseowRtAuOumQWwxcO4aTElDrYNS9QGhvm7c
         fMLHh0JXLHXwjLbtaehlx6WeJsdJX21kTrp9EIUI9LW0gPCH4IgXbSoOxebBGhY7BaL6
         sTW3bks+g7O2ObUSPRmTy21F0DHH267uP3NJTWhGP0wHydfg/oM+id74pnDUtAFXIB9b
         I+vw==
X-Gm-Message-State: AFq9FYL35SUD0STSVyLodKda4r3vSaAH+fvpbbkOuT76uobYqZNn7dbg
	nQsuK7cgQ8N9byPDGkAiqXJUYv+++J4LRnweohDTw2/OU0KqI0/HSZXeA7+JQiNeFC5MlnRj0hA
	NvlcN20LYrCXjZW7UtwVw1mwHM1JbbQ==
X-Received: from dyru33.prod.google.com ([2002:a05:7300:4fa1:b0:35b:4bd1:e0fb])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:7aa3:b0:35d:74f7:3b9 with SMTP id 5a478bee46e88-361a224ccf0mr11856161eec.33.1792452889848;
 Mon, 19 Oct 2026 16:34:49 -0700 (PDT)
Date: Mon, 19 Oct 2026 23:34:37 +0000
In-Reply-To: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4533; i=samitolvanen@google.com;
 h=from:subject:message-id; bh=uXHdbixwLcNi6iBpIxcP3Mxix2cxByC1MLC5WD58JuQ=;
 b=kA0DAAoWWgclqzmhp3oByyZiAGrWqRaiZJeszthblBaAnEB9HD3z7C0uIlr+EVlzkAOL4TKoB
 oh1BAAWCgAdFiEEhPWrtbv3QmXq83IYWgclqzmhp3oFAmrWqRYACgkQWgclqzmhp3ofpAEAvbBx
 TqUhXZQDkt25mUO+xCmdfAuf4hD++/eCuHyQR6gBAIH2CiYt/Ce4sMAG3QhYfARKs7grPvSLM9v IY6W2fhMK
X-Mailer: b4 0.14.3
Message-ID: <20261019-rust-cfi-fixes-v1-1-9503472ba738@google.com>
Subject: [PATCH 1/3] rust: irq: declare cfi_encoding for irqreturn
From: Sami Tolvanen <samitolvanen@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="utf-8"

The IRQ callbacks return c_uint. C calls them through irq_handler_t,
which returns enum irqreturn. kCFI encodes enum types by name even with
integer normalization, so the type ids never match and every call fails
the CFI check.

Generate irqreturn as a newtype with a cfi_encoding, as is done for
lru_status, and return bindings::irqreturn_t from the callbacks.

Fixes: 0851d34a8cc3 ("rust: irq: add support for non-threaded IRQs and handlers")
Fixes: 135d40523244 ("rust: irq: add support for threaded IRQs and handlers")
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 rust/bindgen_parameters    |  2 ++
 rust/kernel/irq/request.rs | 28 +++++++++++++++++-----------
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index 8402b0c93545..5059cc74cb3c 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -27,6 +27,8 @@
 --opaque-type spinlock
 
 # enums that appear in indirect function calls should specify a cfi type
+--newtype-enum irqreturn
+--with-attribute-custom-enum=irqreturn='#[cfi_encoding="9irqreturn"]'
 --newtype-enum lru_status
 --with-attribute-custom-enum=lru_status='#[cfi_encoding="10lru_status"]'
 
diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
index c1c6525a676a..1afa9fcaad1f 100644
--- a/rust/kernel/irq/request.rs
+++ b/rust/kernel/irq/request.rs
@@ -25,10 +25,10 @@
 #[repr(u32)]
 pub enum IrqReturn {
     /// The interrupt was not from this device or was not handled.
-    None = bindings::irqreturn_IRQ_NONE,
+    None = bindings::irqreturn::IRQ_NONE.0,
 
     /// The interrupt was handled by this device.
-    Handled = bindings::irqreturn_IRQ_HANDLED,
+    Handled = bindings::irqreturn::IRQ_HANDLED.0,
 }
 
 /// Callbacks for an IRQ handler.
@@ -240,25 +240,28 @@ fn drop(self: Pin<&mut Self>) {
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_irq`.
-unsafe extern "C" fn handle_irq_callback<T: Handler>(_irq: i32, ptr: *mut c_void) -> c_uint {
+unsafe extern "C" fn handle_irq_callback<T: Handler>(
+    _irq: i32,
+    ptr: *mut c_void,
+) -> bindings::irqreturn_t {
     let ptr = ptr.cast_const().cast::<Registration<'_, T>>();
     // SAFETY: `ptr` is a pointer to `Registration<'_, T>` set in `Registration::new()`.
     let registration = unsafe { &*ptr };
 
-    T::handle(&registration.handler) as c_uint
+    bindings::irqreturn_t(T::handle(&registration.handler) as c_uint)
 }
 
 /// The value that can be returned from [`ThreadedHandler::handle`].
 #[repr(u32)]
 pub enum ThreadedIrqReturn {
     /// The interrupt was not from this device or was not handled.
-    None = bindings::irqreturn_IRQ_NONE,
+    None = bindings::irqreturn::IRQ_NONE.0,
 
     /// The interrupt was handled by this device.
-    Handled = bindings::irqreturn_IRQ_HANDLED,
+    Handled = bindings::irqreturn::IRQ_HANDLED.0,
 
     /// The handler wants the handler thread to wake up.
-    WakeThread = bindings::irqreturn_IRQ_WAKE_THREAD,
+    WakeThread = bindings::irqreturn::IRQ_WAKE_THREAD.0,
 }
 
 /// Callbacks for a threaded IRQ handler.
@@ -461,23 +464,26 @@ fn drop(self: Pin<&mut Self>) {
 unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler>(
     _irq: i32,
     ptr: *mut c_void,
-) -> c_uint {
+) -> bindings::irqreturn_t {
     let ptr = ptr.cast_const().cast::<ThreadedRegistration<'_, T>>();
     // SAFETY: `ptr` is a pointer to `ThreadedRegistration<'_, T>` set in
     // `ThreadedRegistration::new()`.
     let registration = unsafe { &*ptr };
 
-    T::handle(&registration.handler) as c_uint
+    bindings::irqreturn_t(T::handle(&registration.handler) as c_uint)
 }
 
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_threaded_irq`.
-unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(_irq: i32, ptr: *mut c_void) -> c_uint {
+unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(
+    _irq: i32,
+    ptr: *mut c_void,
+) -> bindings::irqreturn_t {
     let ptr = ptr.cast_const().cast::<ThreadedRegistration<'_, T>>();
     // SAFETY: `ptr` is a pointer to `ThreadedRegistration<'_, T>` set in
     // `ThreadedRegistration::new()`.
     let registration = unsafe { &*ptr };
 
-    T::handle_threaded(&registration.handler) as c_uint
+    bindings::irqreturn_t(T::handle_threaded(&registration.handler) as c_uint)
 }

-- 
2.56.0.212.g129ede20d9-goog

