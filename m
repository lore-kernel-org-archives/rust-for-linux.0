Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0CB199920
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771492374; cv=none; b=k98xX/HqFaRKcbcFI88eIfwArEs2R34OWXynrr/FgSn9e5E0TCXJA6NDtA7kuV0T3xIwd1IiJMyj17QF46rIKGGvSnBtCNb3iJ5aHg7p8FOz8tG3CgICGjWsw9DMGM/hQzBbEHuRna7NNWSSWsJSLXa0XjP5sD1NSiIbrZ+0VCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771492374; c=relaxed/simple;
	bh=Q2rgAjRF5CvFNzYLCneddbRD6VFtQfDTRv6rSB/gzvM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TTwDY1LqVlUJswYOxOGdW4YdU5Ft/2evJkanxctdsvn1fI2LZ5kNaMsUgiTzqZrgisVT/quh5cfn48ZM3SXoI82lQZ2rTz5PvswAaChJYqNvoooAsYpYejHMPb6PnHvXYgqVkeYC/juZbnE35VRdYktIHiR50YT5heURcJMxGdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KSgWTKW7; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KSgWTKW7"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836bf1a920so8849735e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 01:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771492370; x=1772097170; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pAt84zPZh98Hp08Wh2JelC8rMXH5JkYVh+3oA6R0lvA=;
        b=KSgWTKW7YQXfMC6F1co5myDdonDHlQ3cqxgBcVeaEFUqamEv8PZc9mwK9slIS9YZmG
         nhVeXLgU+VGFBnO5WEdErjMRSVejyH3n2iIrPY1KK5a8AlvCFHOkGIxazjG7OUX/+tIv
         dY4pjUwfAo6fTxfPKoeIyXaLTvEcjNzFYr3Sho02DLnfGznRfLVBlYHmkRglqLibTtVt
         yo9A3fwKL3Mt6XANxm+Z+h5sgMaRPIkdUn8O1ylii654v4MfLeICWIsNKPStkk/cSPnx
         9UfXrGOm0axK8B1b4wV1d4FoAGXY3NIf7yE68xBSjr8GP/r92YFqfNQ8ByPL/oRtJqHu
         6azw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771492370; x=1772097170;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pAt84zPZh98Hp08Wh2JelC8rMXH5JkYVh+3oA6R0lvA=;
        b=kIRB4CRv0wzsOPJvLjH6hjjwGAAk4bCiLI4lsgYr8EQuJldZWQ1eNZ6JZtoqQmXfFU
         fNKZ6mPo6bqAoc1RPmosEk02oTQDLmA46CD7td4GPVHjeSkCzo1UlcaUwCldCUR5jlnS
         X/omZzPbi2WqdOpiSQvYOIVuel0zAOfTu/Ql+2CQafItTle+Qv9clajiwz/askystmMv
         GIbMn2Al0ihuFoTRkBhp7bIgxqtx4ZD72v8v2dzz0Ff9wGXE0heoJBo+vaFDrCF4ar8o
         QARpQ6W22LN/jlnkRs6PK2juJT3kG4vwY836uNGe2x6/axBiTn3VxN83v9KA1VXqVWuT
         7mtw==
X-Gm-Message-State: AOJu0YykQydeDTWU+3TbblBxitTnlJJfqEwoBTVMiPoA/qr4tat+T1WX
	kCxdbpXi12Bv4fqeCt6DqiWfNxBuMp67IzX519u13zY3WxAlftv6xhORZ+n7u2b41/hZ+LoyF3B
	es4DINGtXme2QRZbecA==
X-Received: from wmop6.prod.google.com ([2002:a05:600c:4686:b0:483:6e65:5bb9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:820f:b0:483:71f7:2797 with SMTP id 5b1f17b1804b1-48379b9f3a3mr285166695e9.14.1771492369552;
 Thu, 19 Feb 2026 01:12:49 -0800 (PST)
Date: Thu, 19 Feb 2026 09:12:29 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPzTlmkC/x3MPQqAMAxA4auUzAa0/hS9ijjUGjVL1bSIIL27x
 fEb3nshkDAFGNQLQjcHPnxGVShwu/UbIS/ZoEvdlbrqkeXCEG1kh4fHKJYjtrPujDO2qU0LuTy FVn7+6zil9AGynHvEZQAAAA==
X-Change-Id: 20260219-irq-static-on-trait-5b267c7a4375
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5282; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Q2rgAjRF5CvFNzYLCneddbRD6VFtQfDTRv6rSB/gzvM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpltQAp42kJM1DIWmIxMTreepBnlW5qszAySh10
 UVpGu/KgmSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZbUAAAKCRAEWL7uWMY5
 Rk8UEACJx1pL9EcxkJzlHpMdLS7H39F9cAtrVpZ7fBXDHoly17Om7QIe61FWw8O9aYElA07f6kl
 eN/1K3u6dS4ihTlIZS8tC+ru2xRrGTlYOFw/HKgWfkoUrWGO4KVHuj0Ft77kd58eqSFZ2QqPIrJ
 XflhVi7UUo+LgWs3sb5r8xeVKXDnaQ5ovdjuAzx6BVnjRZYF0G6nluGf8dgz9Vgx5vddzNhtbqk
 hUwpTQm1u/SSaCF70h2HkTBo39/Ndc/jweYOs7ucRxKuS5CsMqd041ZkyUiQim9SpoH+QqXNETS
 RM7OAlz5QdG5k3jrbaaE2QCin2VB0J7F0bHHx8ZTLdPMtrs70vqczR9E0XHZCBtPe9mKya+7Diw
 n6JynfdPh9KlVkrAHFso6G0E4PlAks+5gIwRDCZOUJ0vEpE00NA7fcK3P8CWRyrTEkdrbhX53o5
 fM8uyw6M8ZIPuZlhVlqoDZ63poH+7iZwBZBDD2sjKGBUNSBkqOsAvEoGs5KhjIlOb+8yoOpcKzG
 Ka+77F5rLBymODv7Ogtbd1Hs45IqQi6sW5rgO6Yd50S4MBnpUrYHbTnthGBZpoKsBVAV4OjelRb
 T1Ou7CfIpsZsrQMPdnsKq+Ec97Ealc4UAQPtftyIQx/aKHFHdtbDL4kcMLu0Q5q1aeUCaYS/2cg l022VyQfFxz/ccA==
X-Mailer: b4 0.14.2
Message-ID: <20260219-irq-static-on-trait-v1-1-6ede6b743ea3@google.com>
Subject: [PATCH] rust: irq: move 'static bounds to traits
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The 'static bound is required by all irq handlers, so it is simpler to
specify it on the trait declaration instead of repeating it every time
the trait is used as a where clause. Note that we already list Sync on
the trait bound for the same reason.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Follow up to:
https://lore.kernel.org/all/20260214092740.3201946-1-lossin@kernel.org/
---
 rust/kernel/irq/request.rs | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
index 2ceeaeb0543a4ef0d4f25ca600dc4770f97085c5..e207707156094b1bbf1af0292cff8ed27ea64207 100644
--- a/rust/kernel/irq/request.rs
+++ b/rust/kernel/irq/request.rs
@@ -27,7 +27,7 @@ pub enum IrqReturn {
 }
 
 /// Callbacks for an IRQ handler.
-pub trait Handler: Sync {
+pub trait Handler: Sync + 'static {
     /// The hard IRQ handler.
     ///
     /// This is executed in interrupt context, hence all corresponding
@@ -45,7 +45,7 @@ fn handle(&self, device: &Device<Bound>) -> IrqReturn {
     }
 }
 
-impl<T: ?Sized + Handler, A: Allocator> Handler for Box<T, A> {
+impl<T: ?Sized + Handler, A: Allocator + 'static> Handler for Box<T, A> {
     fn handle(&self, device: &Device<Bound>) -> IrqReturn {
         T::handle(self, device)
     }
@@ -182,7 +182,7 @@ pub fn irq(&self) -> u32 {
 ///
 /// * We own an irq handler whose cookie is a pointer to `Self`.
 #[pin_data]
-pub struct Registration<T: Handler + 'static> {
+pub struct Registration<T: Handler> {
     #[pin]
     inner: Devres<RegistrationInner>,
 
@@ -195,7 +195,7 @@ pub struct Registration<T: Handler + 'static> {
     _pin: PhantomPinned,
 }
 
-impl<T: Handler + 'static> Registration<T> {
+impl<T: Handler> Registration<T> {
     /// Registers the IRQ handler with the system for the given IRQ number.
     pub fn new<'a>(
         request: IrqRequest<'a>,
@@ -261,10 +261,7 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> Result {
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_irq`.
-unsafe extern "C" fn handle_irq_callback<T: Handler + 'static>(
-    _irq: i32,
-    ptr: *mut c_void,
-) -> c_uint {
+unsafe extern "C" fn handle_irq_callback<T: Handler>(_irq: i32, ptr: *mut c_void) -> c_uint {
     // SAFETY: `ptr` is a pointer to `Registration<T>` set in `Registration::new`
     let registration = unsafe { &*(ptr as *const Registration<T>) };
     // SAFETY: The irq callback is removed before the device is unbound, so the fact that the irq
@@ -288,7 +285,7 @@ pub enum ThreadedIrqReturn {
 }
 
 /// Callbacks for a threaded IRQ handler.
-pub trait ThreadedHandler: Sync {
+pub trait ThreadedHandler: Sync + 'static {
     /// The hard IRQ handler.
     ///
     /// This is executed in interrupt context, hence all corresponding
@@ -319,7 +316,7 @@ fn handle_threaded(&self, device: &Device<Bound>) -> IrqReturn {
     }
 }
 
-impl<T: ?Sized + ThreadedHandler, A: Allocator> ThreadedHandler for Box<T, A> {
+impl<T: ?Sized + ThreadedHandler, A: Allocator + 'static> ThreadedHandler for Box<T, A> {
     fn handle(&self, device: &Device<Bound>) -> ThreadedIrqReturn {
         T::handle(self, device)
     }
@@ -403,7 +400,7 @@ fn handle_threaded(&self, device: &Device<Bound>) -> IrqReturn {
 ///
 /// * We own an irq handler whose cookie is a pointer to `Self`.
 #[pin_data]
-pub struct ThreadedRegistration<T: ThreadedHandler + 'static> {
+pub struct ThreadedRegistration<T: ThreadedHandler> {
     #[pin]
     inner: Devres<RegistrationInner>,
 
@@ -416,7 +413,7 @@ pub struct ThreadedRegistration<T: ThreadedHandler + 'static> {
     _pin: PhantomPinned,
 }
 
-impl<T: ThreadedHandler + 'static> ThreadedRegistration<T> {
+impl<T: ThreadedHandler> ThreadedRegistration<T> {
     /// Registers the IRQ handler with the system for the given IRQ number.
     pub fn new<'a>(
         request: IrqRequest<'a>,
@@ -483,7 +480,7 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> Result {
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_threaded_irq`.
-unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler + 'static>(
+unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler>(
     _irq: i32,
     ptr: *mut c_void,
 ) -> c_uint {
@@ -499,10 +496,7 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> Result {
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_threaded_irq`.
-unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler + 'static>(
-    _irq: i32,
-    ptr: *mut c_void,
-) -> c_uint {
+unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(_irq: i32, ptr: *mut c_void) -> c_uint {
     // SAFETY: `ptr` is a pointer to `ThreadedRegistration<T>` set in `ThreadedRegistration::new`
     let registration = unsafe { &*(ptr as *const ThreadedRegistration<T>) };
     // SAFETY: The irq callback is removed before the device is unbound, so the fact that the irq

---
base-commit: a58b8764aed9648357b1c5b6368c9943ba33b7f9
change-id: 20260219-irq-static-on-trait-5b267c7a4375

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

