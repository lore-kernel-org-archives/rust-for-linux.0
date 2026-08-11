Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0C13002C8
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 15:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786460532; cv=none; b=FqD1LMRyZGk4WfjCbU9dN1vUY1e49m9FcUvy4FAqSFQPeU6BVazxxQ3aGhsefzOK3XFZ0tqD5NFLlgF+wAmp9qypfjVkUZPwcDTTfCatduBAkVkMo4+DSrbwScRZVbihec4TQ/FmBYmeB0Rx3BMzG7KKTNwstoiuOby7BhlcoxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786460532; c=relaxed/simple;
	bh=POdaSvQlaZOrehGg07NJEVq8DFUIwYCpiM6A+W/cqIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GqgLEN1CE7gDAMH68pvAO861FP5ir59vA1oGC2ATiJ0I4hnxBiHIWrYVmWOp7tTU3dqLR4iCYYENfBIPgOECI4zbXcr4LelxafQsLDpj4osHMlqZ/aob5mc0s83TjdZAb/V+iEo2dzGdKFS4GK5LTQzxZmnIwTxMZe6+3AdDbpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=Z+K+bC2E; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=B9CDbMGr; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="Z+K+bC2E";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="B9CDbMGr"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 53E0913804BA;
	Tue, 11 Aug 2026 11:02:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 11 Aug 2026 11:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1786460530; x=
	1786464130; bh=Y+EipAilJq81L+Y0ZqdH/STk0tAg4Can/nbuXyodnD8=; b=Z
	+K+bC2EccT0eg/NGrJ73oOn+1mi9zV20nDk906SwwPZN7EqBfnUJfvzmJZE9g6hk
	lxwdD84kM+p53oiQC/gpthgd+c7yu+ndYamATMbY3+WKTssKEu0FGuLG80PFomiU
	O0zetDvhH8/Zz4sdeUwpk8Wesjb8BAM/Tnku407s6ng8URufUHzsdU55ttOLMI7C
	WLqUnTU2Q8wzPrqgjTxFngrAvaulPpvqrYL3Wx2r6SnURyQtoAvR6k+MOpbSX8gf
	7ezzndem9FA2ZBJgS3Q5Wo8mFdXb5f+bjhNYmLecJq3RhTXMr5blaTlxERMdrz6M
	8YZk5+U+plr1rhLoXwk1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786460530; x=1786464130; bh=Y
	+EipAilJq81L+Y0ZqdH/STk0tAg4Can/nbuXyodnD8=; b=B9CDbMGr/VjbzwsL7
	5hvcW0I5uZtAUdWkvEkHaOzIYRoKvgcB20TxwxxuZOSj88IUA3U8CvmYOUKB662P
	jiQgFM44fRAcO7zOCydmbx3m8GiuY6qXdg99sudqXoyE2jywda9yOe0sx7OXYZrw
	s1uFl9mkDcwxypLPAn6jpq3EyTzMGp/YAYJAlN0nTvzgfnkHR2IueOZH0tvbCsw5
	Hzpr3yGB5AXG4n6H90nyX39pPa2TXz9ydmgrJkyvqR/fT9gg1DB/baec/JvCeVnZ
	uznYfN+FUf3EmvVtVOxwuUlNLpvoeytPlRu2qyhqmMQZNmZfGAGCyrZyF0napEIC
	fUYBA==
X-ME-Sender: <xms:cTl7akD_36MlubnSWX91dT4R6x-CFmZQiFUVQEqXRa89lBUz4JDa_Q>
    <xme:cTl7aiZ9trD5Pmv_f-tazZajjnIjibPmHZr80l4ExSFJKO2cak9e-0Wgk1Lzl-pmq
    wGpr3nWbgmaz4cXfH99httUsEr4boC-EBNPZj5MdqlZeiwvdQchMw>
X-ME-Received: <xmr:cTl7ajFUP47FeRM5gcWUugOtSb8lHTmOZfLArOR71eJJdtoWWDtCtGyaFiGis02Jie5qjMoyNPJ4BL3xM_I>
X-ME-Proxy-Cause: dmFkZTGjrbo4HwHQrBpr4Qg6W3n0UnXPdBvISyXjFWRFRuTd6DllD4jklsi6zl9MbFtemS
    1Rw5q6AQzAiq76iuG4QUcj/Apo53/yT5+vYULXzg8mYuaHDRcn+iGji3gTpUHSFIvl+PzE
    Sxfufsv/T32KQdhG+pYRcudzHx1qcIi7k7irKWR+EPesna3EepL+h0sgd7RNCitMGFBj+S
    c9OiBzUyPYBXj/FaboRcQlM6VyR9nyzOJiCzqIdTFAu/S7YVLuOboG81L1gQgOfqbq7L/a
    QTNGzSgpXqAlnN0Fcxsg3Wcy1KqMVjMNUWs9Wu+Rev5R3YlvqA/hbFv1izOq9Hkwr+pZt8
    5+SHafbrrfz0hRGruG/473f6vrARIlrMYPkPy/z7Q3v7LK0cNwOCTBbW4hlPUNGhjUlgE1
    ycDTGzu3ealFRZ7VzeFIPuwgi5ILMfuogEO2FVxoHiiCzYXCQu3AnqjGw2GZt1u5i2nois
    6q4ANDuHLbcAH/vaIUvo6yomzaO1vRl3KFDV21AAFtQ7zTJqfBcjuthuwT5oRFst3/Ikrp
    IkxjIYDXoFCj5I0TIUwZT0JXGV7+4mqGrQR6mOObkW6b0FmWbaGRYWgKWXw+OU7Fy5pcvJ
    oFLaFkcolQzhQOiUV/kWZZ7DXclFdvSG9OuITmphSYUcaQ3KvZ5PgfNKb2GA
X-ME-Proxy: <xmx:cTl7auvIOeUTk-71nxcFavFuJ9cU_I_EtKPfVPZF14ue8O8Ib6DaSw>
    <xmx:cTl7ahJnLQLZ_m2Mpc2eWz0QgC9oaY2LuDK_QWFtyvvwAD8QpdWwbA>
    <xmx:cTl7akOl4hjfs-Dfdzv5AK-Np98Ki25iqk-AMu4MkEZqXIfOEiEVEA>
    <xmx:cTl7ahaxiLaSo3pSsjXbUzQaoI2RDDHqyoT0d_WC8eWmwd1DDc4yRw>
    <xmx:cjl7amRfjDUZcvoPT4N8ny_usO19V_Auj1w3AEAeEf4sshomDojhcM96>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Aug 2026 11:02:05 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	gary@garyguo.net,
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
Subject: [PATCH v1 1/2] rust: time: add example and KUnit test for Delta::as_millis_ceil()
Date: Wed, 12 Aug 2026 00:01:46 +0900
Message-ID: <20260811150147.1360102-2-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811150147.1360102-1-tomo@flapping.org>
References: <20260811150147.1360102-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add an example showing that the value is rounded towards positive
infinity, for both positive and negative spans.

as_millis_ceil() uses the same idiom as as_micros_ceil(), which dropped
the rounding bias near i64::MAX before commit ec90dfcf05f0 ("rust: time:
fix as_micros_ceil() rounding near i64::MAX"), so add a KUnit test for
the i64::MAX and i64::MIN extremes.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/Kconfig.test | 10 ++++++++++
 rust/kernel/time.rs      | 42 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
index e6a5c7a795f0..0087749995d2 100644
--- a/rust/kernel/Kconfig.test
+++ b/rust/kernel/Kconfig.test
@@ -83,4 +83,14 @@ config RUST_BITFIELD_KUNIT_TEST
 
 	  If unsure, say N.
 
+config RUST_TIME_KUNIT_TEST
+	bool "KUnit tests for the Rust time API" if !KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables KUnit tests for the Rust time API.
+	  These are only for development and testing, not for regular
+	  kernel use cases.
+
+	  If unsure, say N.
+
 endif
diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 6c0a5e8090d0..b0b43ad3aa47 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -530,6 +530,21 @@ pub fn as_millis(self) -> i64 {
 
     /// Return the smallest number of milliseconds greater than or equal
     /// to the value in the [`Delta`].
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::time::Delta;
+    ///
+    /// // Whole milliseconds are returned as-is.
+    /// assert_eq!(Delta::from_millis(2).as_millis_ceil(), 2);
+    /// assert_eq!(Delta::from_nanos(1_000_000).as_millis_ceil(), 1);
+    /// assert_eq!(Delta::from_nanos(-1_000_000).as_millis_ceil(), -1);
+    ///
+    /// // Anything else is rounded towards positive infinity.
+    /// assert_eq!(Delta::from_nanos(1_000_001).as_millis_ceil(), 2);
+    /// assert_eq!(Delta::from_nanos(-1_000_001).as_millis_ceil(), -1);
+    /// ```
     #[inline]
     pub fn as_millis_ceil(self) -> i64 {
         // Only positive values need to be rounded up: truncating division already
@@ -580,3 +595,30 @@ pub fn rem_nanos(self, dividend: i32) -> Self {
         }
     }
 }
+
+#[cfg(CONFIG_RUST_TIME_KUNIT_TEST)]
+#[macros::kunit_tests(rust_kernel_time)]
+mod tests {
+    use super::*;
+
+    /// `i64::MAX` nanoseconds in milliseconds, rounded towards positive infinity.
+    const MAX_MILLIS_CEIL: i64 = 9_223_372_036_855;
+
+    /// `i64::MIN` nanoseconds in milliseconds, rounded towards positive infinity.
+    const MIN_MILLIS_CEIL: i64 = -9_223_372_036_854;
+
+    #[test]
+    fn as_millis_ceil_extremes() {
+        // The rounding bias must survive near `i64::MAX`.
+        assert_eq!(
+            Delta::from_nanos(i64::MAX).as_millis_ceil(),
+            MAX_MILLIS_CEIL
+        );
+
+        // No bias is applied to negative values, so `i64::MIN` cannot overflow.
+        assert_eq!(
+            Delta::from_nanos(i64::MIN).as_millis_ceil(),
+            MIN_MILLIS_CEIL
+        );
+    }
+}
-- 
2.43.0

