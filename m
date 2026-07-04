Received: from outbound.ms.icloud.com (ms-2003d-snip4-6.eps.apple.com [57.103.72.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F2D39C00B
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Jul 2026 13:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.72.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783171671; cv=none; b=XBRtVZRP/Hyd1I2OGAsC2SSkcdhlzIKDS/q3yt5LYMRsEmu+8YWl7EO8B32b+mMCl3ri8ZzQQ+wtEdfhqf0aEBzWbNDjc8OFgcc4xBFm0jdGdoC0HStfBMOKYRVvP5uptmaVeUPdfCHIUqe7HPW4cb+qyx4ySA3DoTIgW2K3Cas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783171671; c=relaxed/simple;
	bh=wAB6ybwmsR5BQ4aoojf1Sdtil90ptsltFawDOI1fMLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HKHO/aITZBJTHyIwlApyl570DsdFv2XJo0urpI2wDHxj7rabDZMI0cS8y7pbeEWWkkFuLYkrwO63vZkQ24+rO74ghzDMTbe/ilcQ9+lDr2weJaXUyDjIcFu6a/XfyLDBo8KNhWZWIetwg5qJ8PFcIrMJscxLN2C0yz0N6UbsuUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=GCjPq1ZT; arc=none smtp.client-ip=57.103.72.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="GCjPq1ZT"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-0 (Postfix) with ESMTPS id 9C5421800116;
	Sat, 04 Jul 2026 13:27:47 +0000 (UTC)
X-ICL-RepId: 019f2d50-5686-796c-8efe-be1289a02fa7
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQhNAEMFXwBeC0oCQwZfBlBcHA4ZWAZdMFgUWgxEAlwXFxZWGRcNVk1YFFoMRAJcFxcWVhkXGVFNC04TBVIHXU1WDUcPWB5cFBcVQENeCF4fTBwdDlgGEgBNCg42BlkFXglWA0MFNhIUXUVSAV4KQRlXHx0DUh8SHVAcDlEFWwBGCU8DWQZYAEUMQB1fBV4BQg5NHl8aH10dVjhSAV4KQRlXHx0DUh8MUE0BQwgKCEcDTRdeMlMEXxFQFg==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1783171669; x=1785763669; bh=FVPXsqe07dOtuha03EHNLXqvSUja8/YGTsA0Gk6jLDY=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=GCjPq1ZThQfDkIyAVm8QcBRP3q169id/DN0XsghL2KLk5b/mAHaZP+BEB7l3MOj3JNgVBgqFBbOhD+mpHl/i8OCFlFNdgvEmbXLiXzKCfIZ8T884A010beUZqCWtY79TCfw0LEnBzBqxZvyTgzncJuSmF3Oo/4DZ/4/xAQk2/0FXeQ46jCJdCEL7YWqWBZkUnteBanbuXnmDo69kQ91dut0DwUtpwhSVx7CUtCPzdx9xSABXnzplymcW3c9du2yLFZXCSuW6AlCcEB1rQBlnKAKSvssdZ0I6Wwi+oAjWIq8VkKx6rVmTlVVro/K1SbEa72dDN65cl/XxnMVdyrej/w==
mail-alias-created-date: 1769500909675
Received: from bee.. (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-0 (Postfix) with ESMTPSA id EFBDA180011A;
	Sat, 04 Jul 2026 13:27:43 +0000 (UTC)
From: FUJITA Tomonori <tomo@aliasing.net>
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
Subject: [PATCH v1 1/2] rust: time: add jiffies conversion helpers to Delta
Date: Sat,  4 Jul 2026 22:25:57 +0900
Message-ID: <20260704132558.2253275-2-tomo@aliasing.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704132558.2253275-1-tomo@aliasing.net>
References: <20260704132558.2253275-1-tomo@aliasing.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6sFeOQIa4sSz1ZA7YQPtpIzTY47hOiIL
X-Proofpoint-ORIG-GUID: 6sFeOQIa4sSz1ZA7YQPtpIzTY47hOiIL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDEzNiBTYWx0ZWRfX7MqQFZ7Ee2Mz
 fFwnIcSVsk1j5HzZxxXSHDJn09J0sq+hxFEvli3GJrFXq3IeHbA1AN+ZGMYVDDE4UOLcIlEzcfF
 Kke6rST05SDk2ctZ/x0w5IOQVcyo2UPB8d7wpuIpgUTofvOACm7JFxsbRZwggmL4dnCjnPSQmDp
 YFOGDf8fdajtEt7ZZBNOxq6FMQAubSPkF0qMsUp9A0cX0yexauGdQBdOtYGHykCjNGVx7yjIfkT
 9oBfSdxXb8eZEEN+jEq0Zy+YCBCkgnmoSx+U1i69WW4wR4rmmXqmp58Tt5ze1INT1eauue/LAaW
 XKslC+ZeYgJILLXoxbl

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Callers that hand a timeout to some C APIs need conversion between
Delta and jiffies.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 363e93cbb139..be31f0486445 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -377,6 +377,15 @@ impl Delta {
     /// A span of time equal to zero.
     pub const ZERO: Self = Self { nanos: 0 };
 
+    /// Create a new [`Delta`] from a number of jiffies.
+    #[inline]
+    pub fn from_jiffies(jiffies: u64) -> Self {
+        // SAFETY: `jiffies64_to_nsecs` is always safe to call no matter what the argument is.
+        let nanos = unsafe { bindings::jiffies64_to_nsecs(jiffies) } as i64;
+
+        Self { nanos }
+    }
+
     /// Create a new [`Delta`] from a number of nanoseconds.
     #[inline]
     pub const fn from_nanos(nanos: i64) -> Self {
@@ -431,6 +440,15 @@ pub fn is_negative(self) -> bool {
         self.as_nanos() < 0
     }
 
+    /// Return the smallest number of jiffies greater than or equal
+    /// to the value in the [`Delta`].
+    ///
+    /// If the value is negative, `0` is used.
+    #[inline]
+    pub fn as_jiffies_ceil(self) -> crate::ffi::c_ulong {
+        msecs_to_jiffies(u32::try_from(self.as_millis_ceil().max(0)).unwrap_or(u32::MAX))
+    }
+
     /// Return the number of nanoseconds in the [`Delta`].
     #[inline]
     pub const fn as_nanos(self) -> i64 {
@@ -468,6 +486,22 @@ pub fn as_millis(self) -> i64 {
         }
     }
 
+    /// Return the smallest number of milliseconds greater than or equal
+    /// to the value in the [`Delta`].
+    #[inline]
+    pub fn as_millis_ceil(self) -> i64 {
+        #[cfg(CONFIG_64BIT)]
+        {
+            self.as_nanos().saturating_add(NSEC_PER_MSEC - 1) / NSEC_PER_MSEC
+        }
+
+        #[cfg(not(CONFIG_64BIT))]
+        // SAFETY: It is always safe to call `ktime_to_ms()` with any value.
+        unsafe {
+            bindings::ktime_to_ms(self.as_nanos().saturating_add(NSEC_PER_MSEC - 1))
+        }
+    }
+
     /// Return `self % dividend` where `dividend` is in nanoseconds.
     ///
     /// The kernel doesn't have any emulation for `s64 % s64` on 32 bit platforms, so this is
-- 
2.43.0

