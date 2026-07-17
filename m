Received: from flow-a8-smtp.messagingengine.com (flow-a8-smtp.messagingengine.com [103.168.172.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13C83264EA
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Jul 2026 04:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784262212; cv=none; b=TIrFpjIpiojsbzNQpuh1l9lqx7ZmH1WLpPvOUDJVQrM/k5cKQreF25aVVRoL8FcTfBxKt93ygoBQY2Ww15BlawGxlwSH2LRJWxS+V6W23Kn77WcxDqHNl5W/UC6ADY3TeyFq9L8AXWY4O5HEoV/sJg4n3Dl5FXb0bJHR2cd3wM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784262212; c=relaxed/simple;
	bh=V0ppsGZxjdH+HwCaPq/5QEsbJ3P+NpxtEwgID5P7iDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=caMOw6zDa2xTIEjnnV5pgkVn2YoHbBeH4Q6pIY7vM1jByixTZZtW+y51ZOEzmi8Ox5qGHXBNOqQfQcIdUwRrnFgA5Jleaf3JwZYcjiNgCAIBSUT00yQTqm04otMKlTnL8X2qxjOdZamPYL3t2d4JgCk/R7OFxgEn7m43cB6w1do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=NJWEn4ZD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SeBq3ToI; arc=none smtp.client-ip=103.168.172.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="NJWEn4ZD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SeBq3ToI"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 277A4138006A;
	Fri, 17 Jul 2026 00:23:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 17 Jul 2026 00:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784262210; x=
	1784265810; bh=JoneLiZMy97Sib3f4aXTmOBMLrSkAcgHR+yWf4QHrGE=; b=N
	JWEn4ZDg5G22UQd6970GQE6IBizZsZiG2jV7XPIWuPRv2PqaTbPxQuFLgbwTt6A9
	xuEct5tHXIGunRQ+aWjAZ4+3NBUOoEFgSmdYNrABV7BWb9olT15+vyFFuiKwLO/g
	2saUUpZJNv7Ft5hKc8ZzH+g6uIhvVsTKHqAU022AMfevyJERwpLCrahBzBR4zI1P
	V6o9nEkg6YEnPC4+XhB0VjmmZhlu90Jnt4nOO+I37zEqUh26jR0HxX0SpqKMoMTv
	f+0ic1nzl0GnzDI4NDhxUeEJOQmGymAy9yxj/1qLpp/EDi1ggP1aJhyb4ok9DHWu
	6/WCVe1s1YvBkUG6CMuNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784262210; x=1784265810; bh=J
	oneLiZMy97Sib3f4aXTmOBMLrSkAcgHR+yWf4QHrGE=; b=SeBq3ToI1p0rEXV01
	Xf/bIdSwbaE3dgArxnpA87wY5cpY9KVHpwsjtKJfdHi43ByeenDAZfBx3DABdEyN
	tmaKoTE9w37fvlPs1t8VeJPRg0v89L9qLRNWt8Qz9uQ9j+vXojSWAR0tMoU2bCPz
	ZdiiMll8IJZ/cqAJ6iwRbhnLqXOVNAhLJZstvwon/ZFIqqi7Mb1OiigsmfVUtS8A
	Y3bgpxFkNLv/dL+50JuIkH13eHQ53z5ngliEvFh3CpG9MFHfjeByNs723BDZTw9D
	1TrYGWe+doVEb2dlLUFLHbIZT5xFtM/v4fqFK9jJpz+iDh+qFyM75BwNVTTIS570
	mrbFA==
X-ME-Sender: <xms:Qa5Zahw80VUEOfjZf3dZaKXcqLTYWQAd9L796gP5mZCmJXZRl1bfXw>
    <xme:Qa5ZakAMMmBV_4qf2ccICNBXiUqumydpqdkgaP7Fv6Tar_i0o_jWwmjKHhjBbRD1O
    rrmFa-EzaJtEh5CPe7xjNlWPqDoEJ3vQWApfBJl1YxkxnyjOanlehgW>
X-ME-Received: <xmr:Qa5ZaoNSrUrXg3w8h6F13C-L__qmsncV-Rrx_Wj_7p33sGKLmtV-lGp6_11AFUjw4ZvE6QwOVjHGTD3Prx0>
X-ME-Proxy-Cause: dmFkZTEA26D3WWHySH3ZtKN1TTon/h0ubpf5OYvBy8PQ48sc0sfaxJz8AkTFqB4AHVAlzs
    VCfO3525hY3oKJvR5qPC+n0g3rotVVIJP7tzI9BXiXhaabQQRUqZ95zUPmETL/R/GyuTFN
    13sA3PXAaVKMQEhKKx9jgS3nmsN41zz5GBwbuz1JISUN9TRnThPIl2oParc1kstKQmcuIS
    SbOVWFdaVarw3FHllpj9Ez0LiWzooU+gF1QIwy6IsCKOaLnobuO46jbUyfKQ4tY9OHt6uO
    3qNYbEtt8Hje6L9cVKh19dmzswrK1cHtN4fkfH2QeYkALpJ69C/Wq2ds8sGAOoQ8MZ8fCm
    Mf4E6mz5w7MQZ0yzQihLpTR7NrRwhcXY183mAYBa4IUsE97nshI8UkGpGJwShm4Nxgmx05
    Sbm0RIebj+AEU1atS7G4q4/C6eUEZfUXYIn510FiZcPRFM6rOyquAhDScBKBIVuABpw+IQ
    RtaZTdwXU/cobC/CJAmURPnS0N+fgtJhkf0SeCU+fCvMuCy1Dmb5aX4DL44Pj3X9FzxxH9
    33A6fz02bVY7AzKgMwy1563KvjVxQdEDD62HWwm3B6IO/PBF2VgNTCKVpaVN4EX+/aFPOG
    RQRsD878h/s8zZdayOCo+pdlok0d1twOtk3644mAOfU0KuWminTCoaN0SKpQ
X-ME-Proxy: <xmx:Qa5ZarCEsCuhVHequ3hRr60f7U8VCHWYl2JQSHXiR3Aobhg8IkjQiQ>
    <xmx:Qa5ZaqmUDX2oLb8IPO6koU7tJh_qQIGDHEgjZAVzQF_FHW-tN-QGWw>
    <xmx:Qa5Zavp-kBB23G5j6oKLvwgKQcj9grdcuFpCCxS5WJJkvv4MrQOK9g>
    <xmx:Qa5Zapgr9dpv8Ofis17VcMhiEHcyy8vCcC-4NilcKf6v4T-37AHmKA>
    <xmx:Qq5ZaihKWKOTlPmcJFL6qm0HagLlRjDgdHvGYksSWTxZ2SRzXB_iSw8s>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jul 2026 00:23:23 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	aliceryhl@google.com,
	arve@android.com,
	boqun@kernel.org,
	brauner@kernel.org,
	cmllamas@google.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	tkjos@android.com
Cc: acourbot@nvidia.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v3 2/2] rust: use Delta and a Jiffies newtype for timeouts and delays
Date: Fri, 17 Jul 2026 13:22:47 +0900
Message-ID: <20260717042247.3634961-3-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717042247.3634961-1-tomo@flapping.org>
References: <20260717042247.3634961-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Turn Jiffies into a distinct newtype and let these APIs take
impl Into<Jiffies>. A caller can now pass a Delta, the duration type
already used elsewhere, so the unit is part of the type rather than a
caller convention. A caller that already holds a jiffies count can
still pass Jiffies directly, avoiding a lossy jiffies -> Delta ->
jiffies round trip.

Update CondVar::wait_interruptible_timeout() and
Queue::enqueue_delayed(), which took a raw jiffies count through a
bare c_ulong alias with no type safety. Callers had to know on their
own that the value meant jiffies and convert to and from it
themselves, which is easy to get wrong.

Once callers express timeouts and delays as Delta, msecs_to_jiffies()
and the Msecs alias have no remaining users, so remove them.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 drivers/android/binder/process.rs |  7 +++---
 rust/kernel/sync/condvar.rs       | 21 +++++++++++-----
 rust/kernel/time.rs               | 41 ++++++++++++++++++++++++-------
 rust/kernel/workqueue.rs          | 11 ++++++---
 4 files changed, 59 insertions(+), 21 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index cdd1a9079726..5230ea492a75 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1482,8 +1482,9 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
         inner.is_frozen = IsFrozen::InProgress;
 
         if info.timeout_ms > 0 {
-            let mut jiffies = kernel::time::msecs_to_jiffies(info.timeout_ms);
-            while jiffies > 0 {
+            let mut jiffies: kernel::time::Jiffies =
+                kernel::time::Delta::from_millis(info.timeout_ms.into()).into();
+            while !jiffies.is_zero() {
                 if inner.outstanding_txns == 0 {
                     break;
                 }
@@ -1500,7 +1501,7 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
                         jiffies = remaining;
                     }
                     CondVarTimeoutResult::Timeout => {
-                        jiffies = 0;
+                        jiffies = kernel::time::Jiffies::ZERO;
                     }
                 }
             }
diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index 69d58dfbad7b..e215f83825e4 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -7,7 +7,7 @@
 
 use super::{lock::Backend, lock::Guard, LockClassKey};
 use crate::{
-    ffi::{c_int, c_long},
+    ffi::{c_int, c_long, c_ulong},
     str::{CStr, CStrExt as _},
     task::{
         MAX_SCHEDULE_TIMEOUT, TASK_FREEZABLE, TASK_INTERRUPTIBLE, TASK_NORMAL, TASK_UNINTERRUPTIBLE,
@@ -186,15 +186,24 @@ pub fn wait_interruptible_freezable<T: ?Sized, B: Backend>(
     pub fn wait_interruptible_timeout<T: ?Sized, B: Backend>(
         &self,
         guard: &mut Guard<'_, T, B>,
-        jiffies: Jiffies,
+        duration: impl Into<Jiffies>,
     ) -> CondVarTimeoutResult {
-        let jiffies = jiffies.try_into().unwrap_or(MAX_SCHEDULE_TIMEOUT);
+        let raw_jiffies: c_ulong = duration.into().as_raw();
+        let jiffies = c_long::try_from(raw_jiffies).unwrap_or(MAX_SCHEDULE_TIMEOUT);
         let res = self.wait_internal(TASK_INTERRUPTIBLE, guard, jiffies);
 
-        match (res as Jiffies, crate::current!().signal_pending()) {
-            (jiffies, true) => CondVarTimeoutResult::Signal { jiffies },
+        match (res, crate::current!().signal_pending()) {
+            (jiffies, true) => CondVarTimeoutResult::Signal {
+                // CAST: `wait_internal()` never returns negative,
+                // so it is safe to cast `jiffies` to `c_ulong`.
+                jiffies: Jiffies::new(jiffies as c_ulong),
+            },
             (0, false) => CondVarTimeoutResult::Timeout,
-            (jiffies, false) => CondVarTimeoutResult::Woken { jiffies },
+            (jiffies, false) => CondVarTimeoutResult::Woken {
+                // CAST: `wait_internal()` never returns negative,
+                // so it is safe to cast `jiffies` to `c_ulong`.
+                jiffies: Jiffies::new(jiffies as c_ulong),
+            },
         }
     }
 
diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 23ef5c77383f..206296b6b6ea 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -40,17 +40,40 @@
 pub const NSEC_PER_SEC: i64 = bindings::NSEC_PER_SEC as i64;
 
 /// The time unit of Linux kernel. One jiffy equals (1/HZ) second.
-pub type Jiffies = crate::ffi::c_ulong;
+#[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord)]
+pub struct Jiffies(crate::ffi::c_ulong);
 
-/// The millisecond time unit.
-pub type Msecs = crate::ffi::c_uint;
+impl Jiffies {
+    /// A jiffies value of zero.
+    pub const ZERO: Self = Self(0);
 
-/// Converts milliseconds to jiffies.
-#[inline]
-pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
-    // SAFETY: The `__msecs_to_jiffies` function is always safe to call no
-    // matter what the argument is.
-    unsafe { bindings::__msecs_to_jiffies(msecs) }
+    /// Create a new [`Jiffies`] from the C side's `jiffies` value.
+    #[inline]
+    pub const fn new(jiffies: crate::ffi::c_ulong) -> Self {
+        Self(jiffies)
+    }
+
+    #[inline]
+    pub(crate) const fn as_raw(self) -> crate::ffi::c_ulong {
+        self.0
+    }
+
+    /// Return `true` if the [`Jiffies`] has a value of zero.
+    #[inline]
+    pub fn is_zero(self) -> bool {
+        self.0 == 0
+    }
+}
+
+impl From<Delta> for Jiffies {
+    #[inline]
+    fn from(delta: Delta) -> Self {
+        let millis = u32::try_from(delta.as_millis_ceil().max(0)).unwrap_or(u32::MAX);
+        // SAFETY: The `__msecs_to_jiffies` function is always safe to call no
+        // matter what the argument is.
+        let jiffies = unsafe { bindings::__msecs_to_jiffies(millis) };
+        Self(jiffies)
+    }
 }
 
 /// Trait for clock sources.
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..41fa1a9eb9d7 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -136,6 +136,7 @@
 //! ```
 //! use kernel::sync::Arc;
 //! use kernel::workqueue::{self, impl_has_delayed_work, new_delayed_work, DelayedWork, WorkItem};
+//! use kernel::time::Jiffies;
 //!
 //! #[pin_data]
 //! struct MyStruct {
@@ -171,7 +172,7 @@
 //! /// This method will enqueue the struct for execution on the system workqueue, where its value
 //! /// will be printed 12 jiffies later.
 //! fn print_later(val: Arc<MyStruct>) {
-//!     let _ = workqueue::system().enqueue_delayed(val, 12);
+//!     let _ = workqueue::system().enqueue_delayed(val, Jiffies::new(12));
 //! }
 //!
 //! /// It is also possible to use the ordinary `enqueue` method together with `DelayedWork`. This
@@ -303,7 +304,11 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
     /// This may fail if the work item is already enqueued in a workqueue.
     ///
     /// The work item will be submitted using `WORK_CPU_UNBOUND`.
-    pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies) -> W::EnqueueOutput
+    pub fn enqueue_delayed<W, const ID: u64>(
+        &self,
+        w: W,
+        delay: impl Into<Jiffies>,
+    ) -> W::EnqueueOutput
     where
         W: RawDelayedWorkItem<ID> + Send + 'static,
     {
@@ -328,7 +333,7 @@ pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies) -> W::Enqu
                     bindings::wq_misc_consts_WORK_CPU_UNBOUND as ffi::c_int,
                     queue_ptr,
                     container_of!(work_ptr, bindings::delayed_work, work),
-                    delay,
+                    delay.into().as_raw(),
                 )
             })
         }
-- 
2.43.0

