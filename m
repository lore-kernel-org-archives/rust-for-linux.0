Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685269;
	b=AeKqeXnv54M/jBkzP9yNwtI37hAu6n+PpnGCg7aO8smkLH+rIpEWokTaxQz8che//b+0
	 e2cnRvzbaeOEVafIbUvJBp0YP+t91MdBdNtj3FgtAjTugTCQLJQwFlH6eBMT9+nvGIc5q
	 42qszLSF0xaUfbuQmQL1uEC0xfpZ7TlLXv+87PnZSbPYsQx09yt8D73XB8hlMycF/U25+
	 87oPn4283OSN87Mwko6YOEZrRzzTIQYIovfw7qnFU0vm52Z7mxrNd9s1LIPPQPCkJYhB5
	 W3ICrPNIZ5s84nWQieLLcFyh40rGTEND2aNLzczKOfDWvjLxjbiMYTwcgZcG8VfItpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685269;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kufxQ9hfGaEIw3wUx51SV8DPUjPOJNaniBUUJ1FuB5s=;
	b=PAd8vV68CJkTdFCF3UyQ6Z95T+QtczO8MPHuLWZei6Hk1WPP2yQXTD5QSz5UI9rhcVB+
	 Gec1giY5HsVRXJr0GXo9dlI+Yqk3IVgJNpOiFa7R69wFt3CdQJOU8pKmZBVTQ0HyXSsGs
	 Sdvj1N98soRWIns6DKl33nc7Xy46D3yHhktWz9bzLKyOsmJSwW153ikaI2Q4BdoUgnogp
	 VLjPlnvunHq9Kpwm8YJYJTIhV+Us+8HhO9dcDU3rSg4eOo1vGX834SXCs6iTo3Q4CdGAI
	 sWetOK1lkM3nIZ+10ftQR8KpkUGccamlTgA1tw7d9PEzM5qIAnT3DGF/yhBurbDsJ2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="luYv/TrK";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C43606A31E;
	Thu, 22 Oct 2026 16:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=luYv/TrK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109C61F01825;
	Thu, 22 Oct 2026 16:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792685268;
	bh=kufxQ9hfGaEIw3wUx51SV8DPUjPOJNaniBUUJ1FuB5s=;
	h=From:To:Cc:Subject:Date;
	b=luYv/TrK/u+jYXYIBZL5sVLifT1r6v75JmUOcT6bGq0DRhAZu23oW8YrtBUbXvjdc
	 +w9wMTVKbvry/6ve8Baw2S6LabPNuEbMrZxfSNxOJk8BKZSmNUi7u7/d4CQPOjZAil
	 X4Z79p4ZPT9SJMP6i7fXOvKO0DW0X+1LF0hl8ecgYwPCXSLvy77U++hI54OE33VLLt
	 E0PJvimc91wpyZkm2t/9Yg/01emeeovUMsl2PtxB/NOASGYHJQKPrBBXAcVZRhjnKz
	 AipUO/x9U49ZAOO0UcjCQz//4WltIPCq5SuZXeVg++Hvw0mebtxGSB9LJDpPW1Gben
	 UDZ1zcCn09NtQ==
From: Philipp Stanner <phasta@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v4] rust: sync: Accept errors for Lock payload data
Date: Thu, 22 Oct 2026 18:07:26 +0200
Message-ID: <20261022160725.2215244-2-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `Lock` baseclass currently does not allow for fallible user-data.
This can cause conflicts when used with other primitives, for example
when a lock shall be pin-initialized with payload data that is fallible.

Add support for the lock base class so that it works with
try_pin_init!(). Adjust spinlock and mutex accordingly.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v4:
  - Do imports at appropriate places. (Gary)
  - Remove unnecessary changes from pin_init to try_pin_init. (Gary)
  - re-run rustfmt.

Changes in v3:
  - Vertical formatting for imports

Changes in v2:
  - Don't import prelude in doctests. (Gary)
  - Keep using pin_init! over try_pin_init! in Lock::new(). (Gary)
---
 rust/kernel/sync/lock.rs          | 28 +++++++++++++++++++++-------
 rust/kernel/sync/lock/spinlock.rs |  5 +----
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024..05a123fff0ae 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -7,11 +7,22 @@
 
 use super::LockClassKey;
 use crate::{
-    str::{CStr, CStrExt as _},
+    prelude::*,
+    str::CStr,
     types::{NotThreadSafe, Opaque, ScopeGuard},
 };
-use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin};
-use pin_init::{pin_data, pin_init, PinInit, Wrapper};
+
+use core::{
+    cell::UnsafeCell,
+    convert::Infallible,
+    marker::PhantomPinned,
+    pin::Pin, //
+};
+use pin_init::{
+    pin_data,
+    PinInit,
+    Wrapper, //
+};
 
 pub mod mutex;
 pub mod spinlock;
@@ -128,11 +139,14 @@ unsafe impl<T: ?Sized + Send, B: Backend> Sync for Lock<T, B> {}
 
 impl<T, B: Backend> Lock<T, B> {
     /// Constructs a new lock initialiser.
-    pub fn new(
-        t: impl PinInit<T>,
+    pub fn new<E>(
+        t: impl PinInit<T, E>,
         name: &'static CStr,
         key: Pin<&'static LockClassKey>,
-    ) -> impl PinInit<Self> {
+    ) -> impl PinInit<Self, E>
+    where
+        E: From<Infallible>,
+    {
         pin_init!(Self {
             data <- UnsafeCell::pin_init(t),
             _pin: PhantomPinned,
@@ -141,7 +155,7 @@ pub fn new(
             state <- Opaque::ffi_init(|slot| unsafe {
                 B::init(slot, name.as_char_ptr(), key.as_ptr())
             }),
-        })
+        }? E)
     }
 }
 
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index 6a71bb3a5c45..b8b7492a99e5 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -4,10 +4,7 @@
 //!
 //! This module allows Rust code to use the kernel's `spinlock_t`.
 use super::*;
-use crate::{
-    interrupt::LocalInterruptDisabled,
-    prelude::*, //
-};
+use crate::interrupt::LocalInterruptDisabled;
 
 /// Creates a [`SpinLock`] initialiser with the given name and a newly-created lock class.
 ///

base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0

