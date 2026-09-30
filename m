Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352654F3ED5
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 13:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776627; cv=none; b=VAxQpJU5TVUT9Z60/S8fd7WA2NDssy4jrI57QvB0azTnqr0AqCezEkrDwXF9Z2XCE0swaj6DQM2Qxq12VKf7g5InBFulDiPVI7xuTGk8SpyvOokqJsGcMSP/HOCp/m3RQmq4zeVqC5bBDL0+243lraA9vjfSAzB0vYaPmXypa24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776627; c=relaxed/simple;
	bh=vGGDVjLC09s48U3k1qX7gwjaijwncQ7MReLddgaTPd4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p+b3yGhmTsJRoo2g3PVlNVIUOEaUBR+I5Z2aTNzSywEIj2+e8GoUpxRa2CSF2desW3Z+jWthrtfT3e2NNqwRf6gg0Hj5u2WOl6LkQTnxwRjaM+vTUd6tpUqjFP9LBJCqymxMybmbqAIqgD8Tl3Ywq6kGEaB6pX44chzOc5txJNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kY1sI+uY; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kY1sI+uY"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a019d53f46so7141105e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 06:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790776610; x=1791381410; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blqXgq5EGfKzLgsqXCTXwzj804Jg40uRL0YfTN/510s=;
        b=kY1sI+uYXlf+LsrfXm4i0++nvIGbM9xZWuDt3hB+5B/Hnc1QlCUzn0NjJg21IzKgoN
         vn8FO0dS9VkhdIM4poqW03PCzn0Ba4Nep0V1MGCpGTm6Hg5IFcvK84j6mTnezUsMzZvL
         BsqXSe4viFd7Xj22RHJaCbXY2aCAmZPN8FUTth+Q6RpBC5vdX4GnX5s2fFxKATXFeXdj
         XKR9EZ2GcOclDan3lp383DrA+4tm7LEOyFj6nmVOp/u1o0i14E311XR/DFBkbs7GVL/I
         cpTs+88ZV0Qhh8uYSugTEWXwyQJD0BVF9Gnd+O6HSebL64xar8MacpxwUf9wDFp++BG7
         cRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776610; x=1791381410;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blqXgq5EGfKzLgsqXCTXwzj804Jg40uRL0YfTN/510s=;
        b=N0gONh80K/o743HBDDjXi5DWMXVVo8SQJhy1V+upRDCgSq9V3XY6oxMUo2dEx7V5/K
         CJwFlKgG9GKvQ1Ftr4tsAWDyj8ll01T+xgORECQQ6NWNVDU7/+5BcFwWg9EX4GfkRrgk
         l4EMHt6wpS0FNesD8fz54iRtQtxe0wqqy8aSld6Dk7sjJ1qmcWLPcYEnS9sngOoFGdqJ
         eq6PzsRbpM9PV2scFb23XT3CxzBusB05EM51vZSv6A3hydZETH936adbsxJxZtpPEjGU
         vTrSQcnZKTQkUoPCOt5DboyPgsyakP2DmXD0YFT9Djrph/z2PfXX/lveNAg1SlNcaIem
         mhpg==
X-Forwarded-Encrypted: i=1; AKwUvBzvHDm+z4ugJsJk/lSW5Dv2+Y7zHHM9YZ4H8JdIyLX7bcy1NuRTYVwWngaC9F6hW03EoHuuaQH2rTEmEo3nrw==@vger.kernel.org
X-Gm-Message-State: AFuF++kMofOSW9UysJK6xkZBGsFvBOe32ldh1edyZU73EgQo7MXKXZGV
	dkbYXFjO4XyUKobrGD+1vh0hc6MkblI40g2VAduxlvj95RyFQX699m9aF/iBxqjX6v+OJjBflgQ
	e5Gx2Oq4q3RWoeMYhgw==
X-Received: from wmnj10.prod.google.com ([2002:a05:600c:74a:b0:4a0:1976:e6a3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d0d:b0:4a0:151e:f743 with SMTP id 5b1f17b1804b1-4a01b00fba0mr25725735e9.19.1790776609241;
 Wed, 30 Sep 2026 06:56:49 -0700 (PDT)
Date: Wed, 30 Sep 2026 13:56:37 +0000
In-Reply-To: <20260930-binder-transaction-log-v2-0-8a15e9b8cae3@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930-binder-transaction-log-v2-0-8a15e9b8cae3@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7267; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=vGGDVjLC09s48U3k1qX7gwjaijwncQ7MReLddgaTPd4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqvRUcYwEGEjMf0u5ICpPCcCoWqheqDpnkhmTf9
 YhOHi8PH5qJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCar0VHAAKCRAEWL7uWMY5
 RjQHEACjwmQkewzjA6iWfgtCUl0f1+B0CUau3wHPSMBmxLlps+yREf/t1JfIYVwTQIDuEypk2g6
 w1j3D+PilKhZHPBpugWgIPmbL39k9GbaiVaE57zMaP9vGKLgC3lriU7lQYE5IR8v+BkMAIAjj2X
 n6nREsZWo/epDpOdPyjXkiVg8W4u+0LQNSKV1qS/uIfRSbrVmlSpBgECxb2g+yDdA86irCvJY7w
 L1DRu90phsv1qVBcQih/Ew9seV+g9uIMLxg1DChTtGfBI8Pj7dFUo+8XqezOJvWgycX6xkulGMp
 M2aKlZ+owxTqXRGD7HYRGwlA4QzmNLwDivDV0yDIQYnaDNAWUQ/l9qZhPq584l9UmDn1HHI7mTc
 Bi7T6UmBuwXDQ20TGc7kJ1W1/aPpmiJfZCm3Sl6OgF3tMJ2byrd0/JNQ4myVp2qbQwQtjAW5qZk
 B4xn0KwcAx3OMOVZx1FaB5qOYMleOdTFw9mL5pcpfiUeGbg4W3aLXFrvP3+5D6MsJW1nl9aZsge
 dJO3AOt006Gc/oQ2583jp3W50wzCPItihRx0M8N39xLaHq4yN5ObcCcG4AL0kKkYsGhsxt6VK7w
 pg9DIcq/hg5AwsDm5wxM6t1yasvNSKoZa3yp0V3r1RSKivxPnbtAEdBf59zbfMOpo3y9FvQXz+g Yww7R59hW8XIOlw==
X-Mailer: b4 0.14.3
Message-ID: <20260930-binder-transaction-log-v2-2-8a15e9b8cae3@google.com>
Subject: [PATCH v2 2/3] rust_binder: track caller location in BinderError
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Record the caller's location in BinderError using #[track_caller] and a
new ErrorLocation wrapper around &'static Location<'static> across all
BinderError constructors and From implementations. ErrorLocation
implements Display by stripping the directory prefix so locations are
formatted as filename.rs:line (e.g. process.rs:422).

In Context::get_manager_node and Process::buffer_alloc, avoid passing
BinderError::new_dead() or BinderError::from() as function pointers to
Option::ok_or_else() and Result::map_err() so that #[track_caller]
captures the call site in rust_binder correctly.

Include the error location in the FailedTransaction debug print and
prepare for recording it in the binder transaction log. Example output:

  rust_binder: 840:4583 transaction async to 7656:0 failed ESRCH, code 1 size 428-16 line thread.rs:711

Assisted-by: LLM
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/context.rs |  8 ++++----
 drivers/android/binder/error.rs   | 39 +++++++++++++++++++++++++++++++++++++++
 drivers/android/binder/process.rs |  5 ++++-
 drivers/android/binder/thread.rs  |  5 +++--
 4 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/drivers/android/binder/context.rs b/drivers/android/binder/context.rs
index ddddb66b3557..bcc97ddaacd7 100644
--- a/drivers/android/binder/context.rs
+++ b/drivers/android/binder/context.rs
@@ -134,13 +134,13 @@ pub(crate) fn unset_manager_node(&self) {
     }
 
     pub(crate) fn get_manager_node(&self, strong: bool) -> Result<NodeRef, BinderError> {
-        self.manager
+        Ok(self
+            .manager
             .lock()
             .node
             .as_ref()
-            .ok_or_else(BinderError::new_dead)?
-            .clone(strong)
-            .map_err(BinderError::from)
+            .ok_or_else(|| BinderError::new_dead())?
+            .clone(strong)?)
     }
 
     pub(crate) fn for_each_proc<F>(&self, mut func: F)
diff --git a/drivers/android/binder/error.rs b/drivers/android/binder/error.rs
index 1296072c35d9..41b07d687b30 100644
--- a/drivers/android/binder/error.rs
+++ b/drivers/android/binder/error.rs
@@ -2,6 +2,7 @@
 
 // Copyright (C) 2025 Google LLC.
 
+use core::panic::Location;
 use kernel::fmt;
 use kernel::prelude::*;
 
@@ -9,32 +10,65 @@
 
 pub(crate) type BinderResult<T = ()> = core::result::Result<T, BinderError>;
 
+/// Wraps a `&'static Location` to format it as `filename.rs:line` without the directory prefix.
+#[derive(Copy, Clone)]
+#[repr(transparent)]
+pub(crate) struct ErrorLocation(&'static Location<'static>);
+
+// SAFETY: `ErrorLocation` is `repr(transparent)` over a shared reference, which is part of the
+// option layout optimization guarantee, so all zeroes is a valid representation for `None`.
+unsafe impl pin_init::ZeroableOption for ErrorLocation {}
+
+impl ErrorLocation {
+    #[track_caller]
+    pub(crate) const fn caller() -> Self {
+        Self(Location::caller())
+    }
+}
+
+impl fmt::Display for ErrorLocation {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        let file = match self.0.file().rsplit_once('/') {
+            Some((_, file)) => file,
+            None => self.0.file(),
+        };
+        write!(f, "{}:{}", file, self.0.line())
+    }
+}
+
 /// An error that will be returned to userspace via the `BINDER_WRITE_READ` ioctl rather than via
 /// errno.
 pub(crate) struct BinderError {
     pub(crate) reply: u32,
     pub(crate) source: Option<Error>,
+    pub(crate) line: ErrorLocation,
 }
 
 impl BinderError {
+    #[track_caller]
     pub(crate) fn new_dead() -> Self {
         Self {
             reply: BR_DEAD_REPLY,
             source: None,
+            line: ErrorLocation::caller(),
         }
     }
 
+    #[track_caller]
     pub(crate) fn new_frozen() -> Self {
         Self {
             reply: BR_FROZEN_REPLY,
             source: None,
+            line: ErrorLocation::caller(),
         }
     }
 
+    #[track_caller]
     pub(crate) fn new_frozen_oneway() -> Self {
         Self {
             reply: BR_TRANSACTION_PENDING_FROZEN,
             source: None,
+            line: ErrorLocation::caller(),
         }
     }
 
@@ -46,25 +80,30 @@ pub(crate) fn is_dead(&self) -> bool {
 /// Convert an errno into a `BinderError` and store the errno used to construct it. The errno
 /// should be stored as the thread's extended error when given to userspace.
 impl From<Error> for BinderError {
+    #[track_caller]
     fn from(source: Error) -> Self {
         Self {
             reply: BR_FAILED_REPLY,
             source: Some(source),
+            line: ErrorLocation::caller(),
         }
     }
 }
 
 impl From<kernel::fs::file::BadFdError> for BinderError {
+    #[track_caller]
     fn from(source: kernel::fs::file::BadFdError) -> Self {
         BinderError::from(Error::from(source))
     }
 }
 
 impl From<kernel::alloc::AllocError> for BinderError {
+    #[track_caller]
     fn from(_: kernel::alloc::AllocError) -> Self {
         Self {
             reply: BR_FAILED_REPLY,
             source: Some(ENOMEM),
+            line: ErrorLocation::caller(),
         }
     }
 }
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 5372bfbd93b3..dcf6ba4bc71b 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1066,7 +1066,10 @@ pub(crate) fn buffer_alloc(
 
         let (new_alloc, addr) = loop {
             let mut inner = self.inner.lock();
-            let mapping = inner.mapping.as_mut().ok_or_else(BinderError::new_dead)?;
+            let mapping = inner
+                .mapping
+                .as_mut()
+                .ok_or_else(|| BinderError::new_dead())?;
             let alloc_request = match mapping.alloc.reserve_new(reserve_new_args)? {
                 ReserveNew::Success(new_alloc) => break (new_alloc, mapping.address),
                 ReserveNew::NeedAlloc(request) => request,
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 18a14aa8a835..0891a36e9cbd 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1310,7 +1310,7 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
 
                     binder_debug!(
                         FailedTransaction,
-                        "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
+                        "transaction {} to {}:{} failed {:?}, code {} size {}-{} line {}",
                         if info.is_reply {
                             "reply"
                         } else if info.is_oneway() {
@@ -1323,7 +1323,8 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
                         err,
                         info.code,
                         info.data_size,
-                        info.offsets_size
+                        info.offsets_size,
+                        err.line
                     );
                 }
             }

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

