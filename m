Received: from outbound.qs.icloud.com (qs-2002b-snip4-11.eps.apple.com [57.103.87.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B732314D15
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.87.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769601145; cv=none; b=Dv+ngQO6pL/ShsUw9W623ECpVuIQHXHNn/dyhBGPOqtodhea/owQIlyLw/uu3SC87OCIyW1vEjIRvZ7pC/L+tkQW3Bdo/3uOdY8IKV0vgGFicRwe6Uvi/B9TWUwDvYd75xk1sUB4aJAfb8BwWUfkHHhPQvQ6i2L/69KbcuIYkrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769601145; c=relaxed/simple;
	bh=ksc95Dx5OmaybK3iAWI5V76/9WYwuHfYrefZ360wZto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FmLoxZS0TnXVzGStWuq2XHsssGznkMiZJjlj5eVHcUuu7I/w7MVj7ri7F7MjTjSZanAVbmk3SUcm3Uouwx1Uw82UJxvSetMcFbseYNCZeB3N2mRT+jxxBKiuxI2SR5N9UldztEeqiRQeZn0+vUsEqUEiZxM9xRHjZ/NGbRY01U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=5sYMdko3; arc=none smtp.client-ip=57.103.87.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="5sYMdko3"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-15 (Postfix) with ESMTPS id A71101800142;
	Wed, 28 Jan 2026 11:52:19 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1769601142; x=1772193142; bh=/crMIdWVWqlh7ba+7m5RMm2AqDUfg9HR5pO62xuVm6Q=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=5sYMdko3p+igDJLYVK+764ppBIbpk97WvNuMSsiYLRteaiOtN38jCpMYiru71QgZibvwgnXrcBBXHK0Sckkq9GfcQGYox829CuU1rFMmOS4DLx0rFFX+Z4UK+MtXbHljh6PTCyeQuOQ0vkYAGCcM5BGQ1vP4lAZfaqM6nBe6f/2u85dATqDeCgBwa5UyAF60piVmHfpM2Xh38bX2I/+M5u2Phi28Dafh1bcbVHYCi+2KoSs99YWPJThbUNel8aWBT7HiZsvvhh/SjEyabC6c+6vfp1Pw84ZFa3vUJpkz5TkbDVlI1B6pZ87juveje3h3n77bFaB58xC8f/g7DhJY9w==
mail-alias-created-date: 1769500909675
Received: from bee.. (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-15 (Postfix) with ESMTPSA id 7EDFB1800175;
	Wed, 28 Jan 2026 11:52:16 +0000 (UTC)
From: FUJITA Tomonori <tomo@aliasing.net>
To: boqun.feng@gmail.com,
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
Subject: [PATCH v1 1/2] rust: sync: atomic: Add perfromance-optimal Flag type for atomic booleans
Date: Wed, 28 Jan 2026 20:51:59 +0900
Message-ID: <20260128115200.3820113-2-tomo@aliasing.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128115200.3820113-1-tomo@aliasing.net>
References: <20260128115200.3820113-1-tomo@aliasing.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NyBTYWx0ZWRfX/zHCGmZq9/EK
 YlJGzxQTHi8ZqOzDe3pcP22U0nSzTjdR+g09IRdlCt3ErPtJ072XXK00lxxqTHvewThRLy0VrYm
 hB+UzmDQ9HqPHGpO3UDKrkGFOVooL2HHyZS41DABHGSxORMXxwyAPkfJllPGh6PRX9O3oqQsdh+
 zAkc3Pv1YeI9b61BydM+lQSmAyqPUB9Ke7vaKTs8sPEriIPXQfvoxOrom5qo7Eoy7oZTWzYh9Id
 uY5StnecSg104mhSF88TU3XPGFxm19QeVjmNogwqJp8noDQO9AEuzDmt8t9p2XMOPLrtbVjba0w
 vWwyRJIKdN5BMfHWgZycuCECakafv80btRVoazQWRDxpuIYxpjG1jnClvWstQY=
X-Authority-Info-Out: v=2.4 cv=RLW+3oi+ c=1 sm=1 tr=0 ts=6979f874
 cx=c_apl:c_apl_out:c_pps a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=a-BdPDBCWltqFkWy-nAA:9
X-Proofpoint-GUID: Hwq662RVv9gVQmDs-wa2YHgbFLR1wDjK
X-Proofpoint-ORIG-GUID: Hwq662RVv9gVQmDs-wa2YHgbFLR1wDjK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 clxscore=1030 lowpriorityscore=0 phishscore=0 mlxscore=0
 spamscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280097
X-JNJ: AAAAAAABFPewIPGwtdzkHeXRX9NlvM4nbAiH9fqVk9IA7zcMhyxdj1JhVWN6h5EkPDIhCs8pUAq8FpisqzgRziTHGuappl7tWOxoVZc9WGwxTpRdOE6XFJpPOOXcFOGff71cvJxv1ghvQiLTO9qjA33/CpuxxZImzPgWgRpEDni1p5aDwZQgQzA/a3Tj6Cn2eocSSx2CIpiADP1qex1Loej5LES2j+6ZV7YvEgzpHnM0GPzUsnJMcozCJthLYPSs7CpYJoOyvD4YxMj9Enx9ZyYKTIMEC+WgPLoPietNSNFBpSnpVtTd9QI5OWTW02LUq3vO5mMN2YTxyl1SmUHhtmbjAOBFBqX6nWnmHECW7AVUhs/yHzdJFovkHR5I7agXdwmFjHyocOCsk5ZP+v0VX0VfaMiXydvW218OaOvlZXyt7kc+hUJx4idZvhf2a00zH/3x9lGzJqMcd6OvCWoNAq2S6Vtq201G4HMF+KS6Yg27j7xuh2/KLbJVy90ndnaI1lQBjkVrniItrndbncNuGtF7tEe32ZqgMoNIAogunrwlIAocO8rHiXB6mXrIcWmyFmLRDeAJcwAJmD81LZJ8trwwXJIrUkmB6xUZP3JuiVhUxC083SJFn2EnnbSUgSv4xX0fUjNdiGmJcdPXP5cYMyn4Nycf3lP2BKtt1g6g15/HaQLtBW4bGmoDymga1hq+rv8Q6JzZ05s1zQvYZNep/WBBppgRzSSxtz81nT1igK337a5HX4RUQmSERmni7lSbna2h6pOvai7kuA/lsUf1Mx4402XjvhMEKxkoNOOdgpZC

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add AtomicFlag type for boolean flags.

Document when AtomicFlag is generally preferable to Atomic<bool>: in
particular, when RMW operations such as xchg()/cmpxchg() may be used
and minimizing memory usage is not the top priority. On some
architectures without byte-sized RMW instructions, Atomic<bool> can be
slower for RMW operations.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic.rs           | 121 +++++++++++++++++++++++++++
 rust/kernel/sync/atomic/predefine.rs |  17 ++++
 2 files changed, 138 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 4aebeacb961a..7d06193709c0 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -560,3 +560,124 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
         unsafe { from_repr(ret) }
     }
 }
+
+/// # Invariants
+///
+/// `padding` must be all zeroes.
+#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
+#[repr(C, align(4))]
+#[derive(Clone, Copy)]
+struct Flag {
+    bool_field: bool,
+    padding: [u8; 3],
+}
+
+#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
+impl Flag {
+    #[inline(always)]
+    const fn new(b: bool) -> Self {
+        // INVARIANT: `padding` is all zeroes.
+        Self {
+            bool_field: b,
+            padding: [0; 3],
+        }
+    }
+}
+
+// SAFETY: `Flag` and `i32` have the same size and alignment, and it's round-trip
+// transmutable to `i32`.
+#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
+unsafe impl AtomicType for Flag {
+    type Repr = i32;
+}
+
+macro_rules! atomic_flag_doc {
+    () => {
+        concat!(
+            "An atomic flag type intended to be backed by performance-optimal integer type.\n\n",
+            "The backing integer type is an implementation detail; it may vary by architecture and change\n",
+            "in the future.\n\n",
+            "[`AtomicFlag`] is generally preferable to [`Atomic<bool>`] when you need read-modify-write\n",
+            "(RMW) operations (e.g. [`Atomic::xchg()`]/[`Atomic::cmpxchg()`]) or when [`Atomic<bool>`] does\n",
+            "not save memory due to padding. On some architectures that do not support byte-sized atomic\n",
+            "RMW operations, RMW operations on [`Atomic<bool>`] are slower.\n\n",
+            "If you only use [`Atomic::load()`]/[`Atomic::store()`], [`Atomic<bool>`] is fine.\n\n",
+            "# Examples\n\n",
+            "```\n",
+            "use kernel::sync::atomic::{Atomic, AtomicFlag, Relaxed};\n\n",
+            "let flag = AtomicFlag::new(false);\n",
+            "assert_eq!(false, flag.load(Relaxed));\n",
+            "flag.store(true, Relaxed);\n",
+            "assert_eq!(true, flag.load(Relaxed));\n",
+            "```\n"
+        )
+    };
+}
+
+#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
+#[doc = atomic_flag_doc!()]
+pub struct AtomicFlag(Atomic<Flag>);
+
+#[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
+#[doc = atomic_flag_doc!()]
+pub type AtomicFlag = Atomic<bool>;
+
+#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
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

