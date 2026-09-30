Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B45415B62
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 12:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772554; cv=none; b=c9Fll41gppry5HY3f1PXbQHbS2A9HVcyqNbpMSo6bHKmXbU/Z+vcryWK3kyivwNjQYR63GK8+1H3dlSC95/+cuIMUz2I3nxO6wGOtoJoKTbayk7qsrc32Qds9lg20NxaUpaAuPvhsnqVxAb9bKQ6ZCU6VXApaSbNG7l0HVHj8ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772554; c=relaxed/simple;
	bh=vGGDVjLC09s48U3k1qX7gwjaijwncQ7MReLddgaTPd4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QbcfvR3LhLeiy29qCtm3mNoT9U6qDZkKxAarUAyj/XzloUjYkFsZ/I/wgbtBwiRUNkjBP1lEsjrShHTASSAIBvyXH+3BOH5ijes3+tbMUQ30bkWFOu0B+YDNGU9Dy6XVEK9ZsmfSFoVrayFXlmGCBFiqfs0wJW1jz6eNFbbBL5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q3R1De6p; arc=none smtp.client-ip=209.85.221.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q3R1De6p"
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f2de3ba47so4065575f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 05:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790772539; x=1791377339; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blqXgq5EGfKzLgsqXCTXwzj804Jg40uRL0YfTN/510s=;
        b=Q3R1De6pnXqv76jmq7u+N9Hx4+89E0wxSxpxVU5diXjO44qJSn2gJ6p2R1sIxtWRQA
         IQBnSE3IPxYjVAoyQnGeffJyU2OdiG2tsMAhuU9r2bfrd9oK7+PWKC0A43Znj5JUCtE0
         5fOfjLfqY1HfsD7Mm03Ng24M1zH9NAV5QSP0MaHWEPThEkDUbcHCRPUgl6GEgn2pM03I
         vstJOuf+nqHEvrvbMB3kpE1DRqYYpyGYy73jtVHGyUGX1Gzx0NDvqLog+MOBZSoBNqAM
         R0hAjBavAtgRzrqG9SjLSXXNSNzsYiEuyTYWRTJEC8/AKdpCUbYPl1QtzWiQAOjIvPT/
         uVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772539; x=1791377339;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blqXgq5EGfKzLgsqXCTXwzj804Jg40uRL0YfTN/510s=;
        b=wkRNwU4/2jd9d8O7O8BI+mIiqmdQaAxDWdBDNyg9Hx2Co7PymY2xTCINmjPnYRNuO8
         SaUOMbRSYnveUeIy9ouNfDqKvIsEqqP9+lKJw4EhTG43jQyQVugDI8Bs01O6mSAlWwIS
         NsxBeKaqRCjYHhTGc3KYtNvcbcA3FWGLFrArGxWByhpbRof0vwlcRyQpuSeQzkvhBGMS
         qE2pV2+KwP2UXHccSs+J5vhhh2VBlxePlvDT7NRvVe4gCgk8Er2reydp/krYFwEh8fGf
         PQAGzvp9E+VneyA0q/OhkxqtrStkX2BAb2ssbR3eoIcUFvWUsOo+vTV1f2LNApxxCELI
         Y6qQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1CuKluRIfdgtUqndw0A3U3XdQmlmaX1ghobMc6rkKq0lR0gORLtnFKKpbtKILrwUQFLYRG0R5kzyneNuFnQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLwBthoP+FTTTbzBMwQ2/atyM13PwV+8b01b/hU7Oe82OI6OUUi
	DDIHoZkh+ZzHBNEK4h1ZjeezPljZ7GdUOMFlJGZ7qCr+9mOP0maIYoOjKx5IQG9ADaF5z+0CIi8
	5AvXRF2PEdXxI3eGhyA==
X-Received: from wrye16.prod.google.com ([2002:a05:6000:1950:b0:48a:fae6:ea9f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:144e:b0:487:360:58d8 with SMTP id ffacd0b85a97d-48b02522883mr2802123f8f.46.1790772539247;
 Wed, 30 Sep 2026 05:48:59 -0700 (PDT)
Date: Wed, 30 Sep 2026 12:48:43 +0000
In-Reply-To: <20260930-binder-transaction-log-v1-0-3d832fb30388@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930-binder-transaction-log-v1-0-3d832fb30388@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7267; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=vGGDVjLC09s48U3k1qX7gwjaijwncQ7MReLddgaTPd4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqvQU2LhyWMoQNdJ1RjV63PLv+GbTotCvRYpVwq
 UpvJY4ov3qJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCar0FNgAKCRAEWL7uWMY5
 RnaPD/4g/lVAvpP9Oey+uLu0Sx+q3GaLjT8HHclH2fDJgxjYrH8lGPfREqBDa/8P9D8sOqoYROF
 bXtuGDuNzdZHBwPwqxaOtFOuscFh1XcLn48whwWG19LAksVqgcJAJufojZfl4BT0BNrzmwhfpAO
 7KbwgJVLI97WKftjrzpbTr1bJts/sk8lltd0Urn4f9d/eiDpRGpUtMqd5PIxXWVuUxaW4Sha9Yy
 U50ShJNuccAMbHktrvRa3GFNJk0btizyTq44tX4FDacukJHU4M8kJaJYqU8Brt0BHQzA2BPPz3c
 +TuAnWoC++p0aq5PN4EeTALIv2ypL9BFKrtJM4FuB9Xc2EXe8JYIJ9BkI2F8J/qKscfLuvEGiYy
 e4KV5PN4z5vVQrnB2zjA7fPwwSN8SNDh+YLnAOeh/UjnepiTT9aOvIN+0yTf2phf9ogmmsm21fs
 rwdHjTOrCTQ8a6m/hc6whBIiMjrUjdrO0riHqXFra0kuGv6/90CnqgBuejyBX0aSeK4oZGox8pD
 mIPcOun3GEdLK7WAkrXxCT/3m7kTRExiuZX/AZXa+iA6jryFVuwk9+XV3xROVuDvMjq+o8Q+cv7
 fIZqUVyq2ZRZtQJL6VXjbv6R0HCMpDUdxpykS9Rtydf2oJG9X7ibrVVOW5MsiVOBl6+2sNgxQ43 A4+nKvfJxZhJV1Q==
X-Mailer: b4 0.14.3
Message-ID: <20260930-binder-transaction-log-v1-2-3d832fb30388@google.com>
Subject: [PATCH 2/3] rust_binder: track caller location in BinderError
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

