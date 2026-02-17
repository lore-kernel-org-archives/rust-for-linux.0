Received: from mail.unwrap.rs (mail.unwrap.rs [172.232.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA8D28641F
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 22:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.232.15.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771367077; cv=none; b=FVdkFIuI09lJkB+zVSRTD1vAAZr2DQgRU/9G6I33zKO1AbbgrxOBWe/D57mOX9WZVx/Yj1MQXUxEQ/MAO+eqQd9lJXcDA0BqQ560bouZXS9QQpPyAFSYZ07iYyIOPiwvyetgL5jmHrmLFxCYvhzE/vlXCieiUre4580B5+F/feI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771367077; c=relaxed/simple;
	bh=wtHpZ4xJf2I080ZaOgCSmBuS1t4rJepU1hmjLHbMsYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kHsPcBca/nHeqLVeRLS3SaEAtHnfaancdQ2RGOBfzbusx2ASIcplB5JnTPwcn3nnHYyGjmBmca19vwl6GrWyIGMLYuNwG6zcFtTOOzuKcS/96+Z3u+J60QZb+l5AHHRV6oCe/mpcsbmCs0xFyxZnN80CNB/11UrdvoTGQfBdr8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs; spf=pass smtp.mailfrom=unwrap.rs; arc=none smtp.client-ip=172.232.15.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unwrap.rs
From: Cole Leavitt <cole@unwrap.rs>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	Cole Leavitt <cole@unwrap.rs>
Subject: [PATCH] rust: irq: add missing 'static bound to IRQ callback functions
Date: Tue, 17 Feb 2026 15:24:25 -0700
Message-ID: <20260217222425.8755-1-cole@unwrap.rs>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Registration<T> and ThreadedRegistration<T> structs require
T: Handler + 'static and T: ThreadedHandler + 'static respectively.
However, the callback functions that are used with these registrations
were missing the corresponding 'static bound:

  - handle_irq_callback<T: Handler>
  - handle_threaded_irq_callback<T: ThreadedHandler>
  - thread_fn_callback<T: ThreadedHandler>

This bound inconsistency was previously accepted by rustc, but recent
compiler versions (1.93+) enforce E0310 more strictly when casting
raw pointers to references in generic contexts. The callbacks cast a
*mut c_void to a reference of the registration type, which requires
T to be valid for 'static when the registration struct requires it.

Add the missing 'static bound to all three callback functions to match
their registration struct requirements and fix compilation with recent
rustc versions.

Fixes: 135d40523244 ("rust: irq: add threaded handler support")
Signed-off-by: Cole Leavitt <cole@unwrap.rs>
---
 rust/kernel/irq/request.rs | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
index 67769800117c..7a36f790593e 100644
--- a/rust/kernel/irq/request.rs
+++ b/rust/kernel/irq/request.rs
@@ -260,7 +260,10 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> Result {
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_irq`.
-unsafe extern "C" fn handle_irq_callback<T: Handler>(_irq: i32, ptr: *mut c_void) -> c_uint {
+unsafe extern "C" fn handle_irq_callback<T: Handler + 'static>(
+    _irq: i32,
+    ptr: *mut c_void,
+) -> c_uint {
     // SAFETY: `ptr` is a pointer to `Registration<T>` set in `Registration::new`
     let registration = unsafe { &*(ptr as *const Registration<T>) };
     // SAFETY: The irq callback is removed before the device is unbound, so the fact that the irq
@@ -478,7 +481,7 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> Result {
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_threaded_irq`.
-unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler>(
+unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler + 'static>(
     _irq: i32,
     ptr: *mut c_void,
 ) -> c_uint {
@@ -494,7 +497,10 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> Result {
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_threaded_irq`.
-unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(_irq: i32, ptr: *mut c_void) -> c_uint {
+unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler + 'static>(
+    _irq: i32,
+    ptr: *mut c_void,
+) -> c_uint {
     // SAFETY: `ptr` is a pointer to `ThreadedRegistration<T>` set in `ThreadedRegistration::new`
     let registration = unsafe { &*(ptr as *const ThreadedRegistration<T>) };
     // SAFETY: The irq callback is removed before the device is unbound, so the fact that the irq
-- 
2.52.0

