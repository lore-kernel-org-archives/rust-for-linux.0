Received: from outbound.ms.icloud.com (p-west3-cluster1-host6-snip4-5.eps.apple.com [57.103.73.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE713385535
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 12:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.73.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769689598; cv=none; b=W9hlRxRlVVZZpz4Ho5oRS+Xt6vHRwP2fyHmuXWWaGoASXr8WvO0abqTeOydGQ0vXdf/yKC2ksqCmNJI2C7JUhxxjOBlqgfXR6u3Ge4jV6wfQa/ji0rRjzmx3TMogLQ96JC24aYjWOCzW6eV52tVh5mmdS66eyrPDyXjOyF+vpLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769689598; c=relaxed/simple;
	bh=nFTaNGAWr5H6XKVkqYgE1xucRNYx4cFYZhRuGPiatDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uEX4heJuQdmY31YffkkmIoEkINaEviUVGn+MJ15LkqUukJxhn+LM9WtdkNXfHicO4IErrMkoTuw9CwLLq35+Ku3PuCP3kFsMBaVKqLFfPaS7CDVGr9gYrIoiepflqUN3cZvx6Jng2wnPjufxzwq1OY+N43jXlPDgZKtVxIkHU2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=B8swHidS; arc=none smtp.client-ip=57.103.73.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="B8swHidS"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-1 (Postfix) with ESMTPS id 397CD1800128;
	Thu, 29 Jan 2026 12:26:33 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1769689596; x=1772281596; bh=J4VND7vGW+U4vG+iK0wHzJFnAc2Y2mgUMrczHkXPNwE=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=B8swHidSf1pBzQLI0nrD18zff7FAIOWp74X904v4tJRFxPc3RJsocoUKitx79ysPO+K5SyCYN5ssDg+zoeXI9572gk6VeR4ILYs5nOe0Br2TMBxKcXNKQRaY8u7ysF2Bptf+QRpt/N3vif7FWRSt0OGu2rrGpa+U8PxuUIXNQAGKS/JdSE5B66dHPEAP7ZdHJx2jw5mwy3usSUPxiOAWVGE8E4RY13FvdqN4H1Px7ZJvpgZV5NteXmByJivTwThMOmaS3ALl9KvNOBFVaCuCs0NoC2AW9M6+s/SKZR+9KSPIhwUcw9K8JC1o5BO8++ol3rAtLgejbhxPoNvbq+eKsA==
mail-alias-created-date: 1769500909675
Received: from bee.. (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-1 (Postfix) with ESMTPSA id 883821800432;
	Thu, 29 Jan 2026 12:26:30 +0000 (UTC)
From: FUJITA Tomonori <tomo@aliasing.net>
To: boqun@kernel.org,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v2 1/2] rust: sync: atomic: Add perfromance-optimal Flag type for atomic booleans
Date: Thu, 29 Jan 2026 21:26:21 +0900
Message-ID: <20260129122622.3896144-2-tomo@aliasing.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129122622.3896144-1-tomo@aliasing.net>
References: <20260129122622.3896144-1-tomo@aliasing.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA4NCBTYWx0ZWRfX6Enged8po2OB
 I+BqIutdbHxppI0YwaZO2kV7PXonaDUpD6qXhBUU5/9R8yEtfMroKhZXTL5LD1DwqqhStfUwEa9
 A3F9Ly4I9O2oaGOP1rby+gKIGyp1a26nzSKnoy8frTlOxLMjh2eI+dqvESxAqaKCgeIH/lkyxtH
 mpOGrEjznUw3m+CQ3Ln8CGo6FQf8ExuQAK9n5LKNrzEju5LvVohDRAankD0lTCYlylgqAyjZ4HN
 6PpYGWR3+I6f8t0CfCCKlyylv9oPDzNhBJA4i5cmDUWdbhOm+s6zt9byYRnJy0paOcqXvbd4RDI
 TvNfWI+0lRojm8x8MebFAFeUhl124xmPLqlMOLBLolNqwGDUWKKZalkCcxOSnE=
X-Authority-Info-Out: v=2.4 cv=L8kQguT8 c=1 sm=1 tr=0 ts=697b51fa
 cx=c_apl:c_apl_out:c_pps a=qkKslKyYc0ctBTeLUVfTFg==:117 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=O5csCFDqhEliJq4Jj3cA:9
X-Proofpoint-GUID: t8dr1lYzAyvMKFkCZAlbSerFU9uVTDnj
X-Proofpoint-ORIG-GUID: t8dr1lYzAyvMKFkCZAlbSerFU9uVTDnj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290084
X-JNJ: AAAAAAABobY16l8OAhAo7+IrdfyOTojeR5h+x14Ex5Ui2cwTeXw86Bji1eKs8y9h5A2w2Iw4qyUFahD/bY05b7dLKu9jKQMYoeh9kba/vMgGkWGhw9FfoKrqjPPT6su5E1vf9HNHw360peU1g3em7rvFgKB1x6s1OOplcWPEEq9Y39Y3C3DFk3/AI2ig4x1T20LxxMTH9FyQZbnBNL9ToAhxlUcZGwU95xkmzTfaZ6NlZNwbt7EahOdy4hVFU3PY/oE2tbLZAn+CXBFQikJ3KmTDZCR3xHAIebucX9Ph8oiqpZhrLShlmeD6RS7ITW5x0gfxUynsGkG3D013DqXpRZ2cVlp31j1n298UdIT0DpfDNdJIEmoUrhv8pBAiVpRETX9Ef+e2oVmELTJ17a+nMrRlEQSx8Z2i3c28qAahia9Yqv4EuHktATu/UI0g5o2M/PUHPVpjXKz6u4ld93BvyvclfAF9+qtJ3EciHNPe7vH/3AsXlFWzts3Z1ehh0m6jEq/VT+bCN1ZYlPYzL/6Eqhw81Y5g1TdfC43KT/Z6kXuKs4B/aJCwJ7wlybXsrOvizMTrtxSpntxTTOlGQkjKOWd1PuhjpSliZ5G6HF4eIGWiMS/+tK0pX9TgeKZXTlmPvHNN3GwDX0xGcCUVNA2i1lMzvXlyVq2Jsk3VCN2Up6IhlStyMOJHrpGfjrV79pCwj6rov6jOergvN4BrXrjsi4sQF2c2K4SusbmmK+sbxUr1Syd/2qowy+9bhLFufMbZV5nDRu7DybIaODdg7DP9bTUz0XpCnagsbcvkCKZa

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add AtomicFlag type for boolean flags.

Document when AtomicFlag is generally preferable to Atomic<bool>: in
particular, when RMW operations such as xchg()/cmpxchg() may be used
and minimizing memory usage is not the top priority. On some
architectures without byte-sized RMW instructions, Atomic<bool> can be
slower for RMW operations.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic.rs           | 125 +++++++++++++++++++++++++++
 rust/kernel/sync/atomic/predefine.rs |  17 ++++
 2 files changed, 142 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 4aebeacb961a..bfc393d98aa9 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -560,3 +560,128 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
         unsafe { from_repr(ret) }
     }
 }
+
+#[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
+#[repr(C)]
+#[derive(Clone, Copy)]
+struct Flag {
+    bool_field: bool,
+}
+
+/// # Invariants
+///
+/// `padding` must be all zeroes.
+#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
+#[repr(C, align(4))]
+#[derive(Clone, Copy)]
+struct Flag {
+    #[cfg(target_endian = "big")]
+    padding: [u8; 3],
+    bool_field: bool,
+    #[cfg(target_endian = "little")]
+    padding: [u8; 3],
+}
+
+impl Flag {
+    #[inline(always)]
+    const fn new(b: bool) -> Self {
+        // INVARIANT: `padding` is all zeroes.
+        Self {
+            bool_field: b,
+            #[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
+            padding: [0; 3],
+        }
+    }
+}
+
+// SAFETY: `Flag` and `Repr` have the same size and alignment, and `Flag` is round-trip
+// transmutable to the selected representation (`i8` or `i32`).
+unsafe impl AtomicType for Flag {
+    #[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
+    type Repr = i8;
+    #[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
+    type Repr = i32;
+}
+
+/// An atomic flag type intended to be backed by performance-optimal integer type.
+///
+/// The backing integer type is an implementation detail; it may vary by architecture and change
+/// in the future.
+///
+/// [`AtomicFlag`] is generally preferable to [`Atomic<bool>`] when you need read-modify-write
+/// (RMW) operations (e.g. [`Atomic::xchg()`]/[`Atomic::cmpxchg()`]) or when [`Atomic<bool>`] does
+/// not save memory due to padding. On some architectures that do not support byte-sized atomic
+/// RMW operations, RMW operations on [`Atomic<bool>`] are slower.
+///
+/// If you only use [`Atomic::load()`]/[`Atomic::store()`], [`Atomic<bool>`] is fine.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::sync::atomic::{AtomicFlag, Relaxed};
+///
+/// let flag = AtomicFlag::new(false);
+/// assert_eq!(false, flag.load(Relaxed));
+/// flag.store(true, Relaxed);
+/// assert_eq!(true, flag.load(Relaxed));
+/// ```
+pub struct AtomicFlag(Atomic<Flag>);
+
+impl AtomicFlag {
+    /// Creates a new atomic flag.
+    #[inline(always)]
+    pub const fn new(b: bool) -> Self {
+        Self(Atomic::new(Flag::new(b)))
+    }
+
+    /// Returns a mutable reference to the underlying flag as a [`bool`].
+    ///
+    /// This is safe because the mutable reference of the atomic flag guarantees exclusive access.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::sync::atomic::{AtomicFlag, Relaxed};
+    ///
+    /// let mut atomic_flag = AtomicFlag::new(false);
+    /// assert_eq!(false, atomic_flag.load(Relaxed));
+    /// *atomic_flag.get_mut() = true;
+    /// assert_eq!(true, atomic_flag.load(Relaxed));
+    /// ```
+    #[inline(always)]
+    pub fn get_mut(&mut self) -> &mut bool {
+        &mut self.0.get_mut().bool_field
+    }
+
+    /// Loads the value from the atomic flag.
+    #[inline(always)]
+    pub fn load<Ordering: ordering::AcquireOrRelaxed>(&self, o: Ordering) -> bool {
+        self.0.load(o).bool_field
+    }
+
+    /// Stores a value to the atomic flag.
+    #[inline(always)]
+    pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, v: bool, o: Ordering) {
+        self.0.store(Flag::new(v), o);
+    }
+
+    /// Stores a value to the atomic flag and returns the previous value.
+    #[inline(always)]
+    pub fn xchg<Ordering: ordering::Ordering>(&self, new: bool, o: Ordering) -> bool {
+        self.0.xchg(Flag::new(new), o).bool_field
+    }
+
+    /// Store a value to the atomic flag if the current value is equal to `old`.
+    #[inline(always)]
+    pub fn cmpxchg<Ordering: ordering::Ordering>(
+        &self,
+        old: bool,
+        new: bool,
+        o: Ordering,
+    ) -> Result<bool, bool> {
+        match self.0.cmpxchg(Flag::new(old), Flag::new(new), o) {
+            Ok(_) => Ok(old),
+            Err(f) => Err(f.bool_field),
+        }
+    }
+}
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 42067c6a266c..d14e10544dcf 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -215,4 +215,21 @@ fn atomic_bool_tests() {
         assert_eq!(false, x.load(Relaxed));
         assert_eq!(Ok(false), x.cmpxchg(false, true, Full));
     }
+
+    #[test]
+    fn atomic_flag_tests() {
+        let mut flag = AtomicFlag::new(false);
+
+        assert_eq!(false, flag.load(Relaxed));
+
+        *flag.get_mut() = true;
+        assert_eq!(true, flag.load(Relaxed));
+
+        assert_eq!(true, flag.xchg(false, Relaxed));
+        assert_eq!(false, flag.load(Relaxed));
+
+        *flag.get_mut() = true;
+        assert_eq!(Ok(true), flag.cmpxchg(true, false, Full));
+        assert_eq!(false, flag.load(Relaxed));
+    }
 }
-- 
2.43.0

