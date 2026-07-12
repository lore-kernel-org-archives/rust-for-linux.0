Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09FC3769E6
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 23:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783900444; cv=none; b=JqNN/xY9WubUWqJoTBvXWzQ5ZWFMt14ijHHGfI2A+DjPGVwGZoiiv5pvU0EV/uINxTTst5fAbiUnp9Hf85tepwlYnEeMy3eHAs4CD5rIm9f28HNKcC2TvNuZhsr+9VXUxEXk7oEd7/3Ddw5JVOeRJAICYQpTYRinnRXqa/68c4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783900444; c=relaxed/simple;
	bh=+xIi7v/wrhIWwErfWWMPqQFHKNgdGOQF+o+kGwCGIRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WFN1Z7xCUjXL9FPa7bOOHqS1mUv5PbySKYPd0JrCjU8cJXyDnvORBExAqbQGU0Fd5wwnlC/vIv1rybmIg0UF5AGCTM0bSENuERMDjLrmxaKDtyZI/2ZGmUCA9SRAL2XlIQqPwUpzZTtjx5yBwgEoj9zV8Rt83mcyZ5WskTqV5TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=dM2JM9Nh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=erRiFaKN; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="dM2JM9Nh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="erRiFaKN"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 04621138026B;
	Sun, 12 Jul 2026 19:54:02 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 12 Jul 2026 19:54:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1783900442; x=
	1783904042; bh=cQWiUmalhbCqQc08OdluZhcKr6KkH3eZ69KQ0Z+YYhk=; b=d
	M2JM9NhlXK1ZVOI8YmwOdtAG81zPi9zwD3igAEnIXj5rYMj6cEwLCqmbzqFMWfpn
	IsATLxP0qRLhihUdhU2OMidt19AJRX+f6GnlxK8br+7zs77QqfZcy1kwHkfXNJbF
	YVlA211YoorFkfzyiDmLMLY1gmQKlEpfurxJTEogRsbvQ9fjPrfyfHRwPjoso+Xd
	duNdIrZfYNcCGzFpoSCDoLanaog6eLN9JAeEjroaKa6h5bA/Y3ZD8fTmHBKRHYhk
	u+m8Ezwu3zDxBC92LqvU39fKF2PA28GFuzSE6YZGNdJSLAEb9hOyuqms3V+l/5nE
	dBx10CXxQk5X3LadsG+yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1783900442; x=1783904042; bh=c
	QWiUmalhbCqQc08OdluZhcKr6KkH3eZ69KQ0Z+YYhk=; b=erRiFaKNJQhohtF/L
	PRQJYVxHB7WZKEorgTc4VgmkqkSECzikQ+7XrpG1/I4B6PU65G1fgY695tTWWATl
	lFphr1rg6zYtg5Srv6DebMlwu+H2AUVnc9zq3wDOXazFE5GIW4+oVANWUX0Sm5AM
	JnjoGK5dZSrAJ/GtYSjOqZrBu5z4z36k8RFJ2jDhy0yobd9dCf6mUJDblCI2EHiP
	C27lCB63Mz6INOO+yxNPjPBEGdTqBWvB/Io7n2PrF8U7MypucJm1bzsKBE+mcto3
	IF25K0ZHT2mwHo2YWnpqz+Tde7LREwtTUI2MqlCY9YiLi42Ejt3FIg4bzXaLq4vm
	G7nrg==
X-ME-Sender: <xms:FClUatqkjgRD5ZhQgGmeVvf1lm74CnEUwR1X6JTRqP3WqvAk-gNGgA>
    <xme:FClUarw7cnazUfY_CUUynJ_if1WZMUBg6naeGlgSwkVg4or-X0B4np4M4u7mjE4tG
    owh8GytaA3Sk0INAlS84VnY8BY4_u3amBuSP0c-rOmPSVvpQOZ3A3M>
X-ME-Received: <xmr:FClUamCj6FFpKooMxl8oAYhs6HOqXe7daRjCosE394nNjKm0AJLC0gQl3PZWq34uD0D5BgkpNVOS4K46xqQ>
X-ME-Proxy-Cause: dmFkZTE31iBcvpgjYdZr1KIE/6DYlEJEulM18kywekYhcwjp6oc4qGtqEEiP0eBVYIviWA
    Hhrc40792y5g9p/vZn7wYZZCpVhEMJZPg6Ag9Cx9+eIG8lCJUQBaaWrWpvDtf9MRNXXgrp
    If9/LRtCsz7iF/x2Je2OLQRKSfaPWGZ9vc6tbm3bvH/9nu+UCTOj6k3rVTgzzqmkASkYUh
    9E8sCqTUteDvUBZFufbRe8/NIYjgeXIu4N0FXfH5N3WIGjAZtE/iS1e0EueImeH9yGOrOK
    ZHqNAT6bgvZmCQE1xp8VuNO73sqqBKuHU7QETGYMOABXyjd7rKLLYQHX10i6am1f9R+qK3
    gxd3aDZiIIumc6Gs47VtmE6PbrzkVaLX/PG6X3OTWYsJSWpCBza21P8/sxpTH4gri55B4u
    qJknpZiXZqrbeXEDdkBJ9VrBwlIoXDaIo/fcfyrcDTHzuWf+Q4mJpE/4mQqzSKMsS2n40t
    pyHGNEh43JLaeUKtWDDQxckRUl7siUN7p2ZxFW+hAcLohHYNiMFuPw0j78zBllrjC2q/pq
    BN2THkpeCnnN78zJxLT5ENokZYWduNCVqxcC/OtHrVKQlYkBrGRMJ/KN0eOvMgf+EWzD+4
    mc0wDrQ9pFhOJA0Z/6azR9K7rD05g9Kv3l/9niOQ4Q2KX4LaG0+vI+pgscRA
X-ME-Proxy: <xmx:FClUaiNrslIyHmfFJwmvIH7aw-01szr-sWlJikk3ZUBfDIO5w094Bg>
    <xmx:FClUatDAe524lyg1dlqpCF3SvckJ49NZXGHkViFBEkV7WXS7Q-iipQ>
    <xmx:FClUaknuGrY2SnFWPkDMleCJkug5e3wDbxVe-Fzf9_N5sm7-S7CcRQ>
    <xmx:FClUahpoRbn7gMc4FG3ZvtrO7wmzyCihqbQx0bTwtYwHpBQ__RtP8Q>
    <xmx:GSlUaoNBnchS_xYHQ8_K_y9MpAI9f2ObZXLzGSWdwcdfdXkkWzVa4QbK>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Jul 2026 19:53:51 -0400 (EDT)
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
Subject: [PATCH v2 1/4] rust: time: add jiffies conversion helpers to Delta
Date: Mon, 13 Jul 2026 08:52:43 +0900
Message-ID: <20260712235246.3069713-2-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712235246.3069713-1-tomo@flapping.org>
References: <20260712235246.3069713-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Callers that hand a timeout to some C APIs need conversion between
Delta and jiffies.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 363e93cbb139..cd054ea5df02 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -377,6 +377,20 @@ impl Delta {
     /// A span of time equal to zero.
     pub const ZERO: Self = Self { nanos: 0 };
 
+    /// Create a new [`Delta`] from a number of jiffies.
+    ///
+    /// If `jiffies` is large enough that the corresponding number of nanoseconds
+    /// would overflow an `i64`, the result saturates to `i64::MAX` nanoseconds.
+    /// The exact threshold depends on `CONFIG_HZ`.
+    #[inline]
+    pub fn from_jiffies(jiffies: u64) -> Self {
+        let nanos = (u128::from(jiffies) * NSEC_PER_SEC as u128 / u128::from(bindings::HZ))
+            .min(i64::MAX as u128);
+        Self {
+            nanos: nanos as i64,
+        }
+    }
+
     /// Create a new [`Delta`] from a number of nanoseconds.
     #[inline]
     pub const fn from_nanos(nanos: i64) -> Self {
@@ -431,6 +445,22 @@ pub fn is_negative(self) -> bool {
         self.as_nanos() < 0
     }
 
+    /// Return the smallest number of jiffies greater than or equal
+    /// to the value in the [`Delta`].
+    ///
+    /// If the value is negative, `0` is returned.
+    #[inline]
+    pub fn as_jiffies_ceil(self) -> crate::ffi::c_ulong {
+        // Mirrors `MAX_JIFFY_OFFSET` in C side. bindgen doesn't generate a constant for it
+        // since it's a compound expression rather than a plain integer literal.
+        const MAX_JIFFY_OFFSET: u128 = ((crate::ffi::c_long::MAX >> 1) - 1) as u128;
+
+        let nanos = self.as_nanos().max(0) as u128;
+        let jiffies = (nanos * u128::from(bindings::HZ)).div_ceil(NSEC_PER_SEC as u128);
+
+        jiffies.min(MAX_JIFFY_OFFSET) as crate::ffi::c_ulong
+    }
+
     /// Return the number of nanoseconds in the [`Delta`].
     #[inline]
     pub const fn as_nanos(self) -> i64 {
-- 
2.43.0

