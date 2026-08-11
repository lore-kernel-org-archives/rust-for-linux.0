Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3170235C6BD
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 15:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786460544; cv=none; b=Iqg/I2pB169G2f8ZjYaPQdotZtxiDWWzeuxyRDPD7N9cyFp1Lwxq4GFbGvI49pKjHiSDlG3Ngc3XJzFnohgM0+aftsOy7VUgP1lvuloX99t/VKLqNrxMp+xN2rZ+SsZ0JMW05lG9yoydgscvCTSbtl47bzSrKrqWt7CrywNXUwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786460544; c=relaxed/simple;
	bh=6+ZFzCzXGTjshargPZgfdlpU9ootxqKuAk5i2wiOzqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y8fxRGFx6YpBR0jvpnHyrDh+1ZhSoozF36b4LqhMBJ+HHdLCA9rRB+GUq9UWljvYdr64a8qEw+Km9M88Q5YfHA0/FDMefAJIQ1jVz/i56Ah33N5OxDu9H7GI2EO1GxWAGO6dYRGaK8u+KrRxIQTruPd6MLw9DXqYnaYhUpfsjoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=gelF1l9R; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XePZshrq; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="gelF1l9R";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XePZshrq"
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailflow.phl.internal (Postfix) with ESMTP id 6AB4813804B2;
	Tue, 11 Aug 2026 11:02:15 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 11 Aug 2026 11:02:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1786460535; x=
	1786464135; bh=niX6MWlUpfpzIaQr6F++50DXvBtQRjLRsuYQnBKIENA=; b=g
	elF1l9Rt7Nw8NIBoKZpntF6tSx9MWvmoo61GWvKgj6vB7y1f2joWrXVQUC8Yn0gG
	mKt6o+i9Qv9SKkdej91DQm7CSjT2jhj6vWUcuIan8svvR8nVl3E2V3AXGBJ+C250
	zfiMMKKHup1l45uz6b+3R4/cDRM925UTl0zhoEJ0Vw2ntljGZcuS5w1DjW8ic4Jy
	qp/EETNut0D8JuFD/fIzbLYYbdfECsdu65QaB8Hbyh4yw51VE0mgfzqnNiiom8ww
	KCSPPuetdTCU5m/a91bexgDNhYAhh2olq2Ueys7rQe9adqg2Z8ion25hj/pyBvPd
	KpIP/05aJREiq6mNrY51g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786460535; x=1786464135; bh=n
	iX6MWlUpfpzIaQr6F++50DXvBtQRjLRsuYQnBKIENA=; b=XePZshrqQUjvovds2
	EaIpEyW19guE25oEkSkSGsWXZqinYIPgGwM5D+DtmYCuNdMF4kvow/oY7RiIvknX
	KtlaII1cNo/TRCBYPPMS4pJhXnu6Bm/x56hs7EzEVnjmoeSujpPKMePI7w+lQ063
	ltvGF9KAPnkhvjOCgbVh/4hqVThV4YE25m58GK1//34b5vauUTwlQEWULRts5ipE
	HMMfp9xqba8t9sl69eYk7e4ycfjQNo/cU1wfSIuCDbi1eSwemTFu+CKxDBcYGMbh
	75MZB67T35MSFrsch3FmMhw283BfK0ioH7N95mU3xtx0PLZesVffH4VhaYkXXhdZ
	Xwx+Q==
X-ME-Sender: <xms:dzl7av6J4c2NchhaWr2Qv0ce4f-c31rJYcN21Zz2birG_ex3h6SDsQ>
    <xme:dzl7agxELaHacgs0j0x7AgpRdpmBi2zXPrKwMU2lRlefg9-0OMEjaAdX8a3wKzsr7
    zefmRacBvcRncnQgO6ukVL6bszDdwIAR52SZ4GAkZ1De15jlGzOlw>
X-ME-Received: <xmr:dzl7ah-ojHdtuVOe7-LujpJpT608DVLKT8lSccR3XuYYAFgjct4SVCSz13NNuhAbJAQALQcT20weeYogj6A>
X-ME-Proxy-Cause: dmFkZTGjrbo4HwHQrBpr4Qg6W3n0UnXPdBvISyXjFWRFRuTd6DllD4jklsi6zl9MbFtemS
    1Rw5q6AQzAiq76iuG4QUcj/Apo53/yT5+vYULXzg8mYuaHDRcn+iGji3gTpUHSFIvl+PzE
    Sxfufsv/T32KQdhG+pYRcudzHx1qcIi7k7irKWR+EPesna3EepL+h0sgd7RNCitMGFBj+S
    c9OiBzUyPYBXj/FaboRcQlM6VyR9nyzOJiCzqIdTFAu/S7YVLuOboG81L1gQgOfqbq7L/a
    QTNGzSgpXqAlnN0Fcxsg3Wcy1KqMVjMNUWs9Wu+Rev5R3YlvqA/hbFv1izOq9Hkwr+pZWK
    4lJNy7PRaQchx5y1GkUUTKvJDH9Y14w1zc4eschKWqfStWOKfkVDB++trR75BANr6ilnrl
    coiJdKb5/sOO4WHya3Dape43uZUx5NeSlTKch4p0MYL3UxaiHP148K2ZMhmhJYVidAu3KQ
    8hWo+4ZUO9fBriCePF84WUJD6mSS5gyfscoqTuw4cZiBmTNxIdcy4Knc4o3LxdX7G5o3WB
    vbt351abM2jnRCyIQ/puaoVOT/Iz7salcaEd3CI+3+BQah7MeJTu66dokjoKQ9Oa9rMlzz
    bT+LoF1Vk/jR4/JLy1RzorQNQuwIIyxOPTJ6sAKYhBiATU2dDTHVX2V/4agw
X-ME-Proxy: <xmx:dzl7akFZ9neBeTU3jKVaq3HHPkM2r1gl3JBh_Mix8T5YQ70x3bZmGA>
    <xmx:dzl7arAfbIn7KzZj5Tj8lxbjasbhQNQmW7qi2SHf0OFFSchFORcJkQ>
    <xmx:dzl7aok0HT6X_uNKEpyjbezD-W4gBl3xTeke4e-Bt-qsQ-deDsE8wA>
    <xmx:dzl7auSVuPXtu4exGZewyFuu2Tm-W_xMk_9YPGZXzynvJCEJuWLAtw>
    <xmx:dzl7ajK-ewx08btzeIyB7IpkNznQjcg8LKKbwXpRrNk4VhJU8yKjcK4o>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Aug 2026 11:02:10 -0400 (EDT)
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
Subject: [PATCH v1 2/2] rust: time: add Delta::to_jiffies_timeout() for timeout conversion
Date: Wed, 12 Aug 2026 00:01:47 +0900
Message-ID: <20260811150147.1360102-3-tomo@flapping.org>
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

Add Delta<Nsec>::to_jiffies_timeout() conversion. Unless the result
saturates, the value is rounded up, so the resulting timeout is never
shorter than the requested span.

The result saturates at zero jiffies for a negative span, i.e. an
immediate timeout, and at the kernel's MAX_JIFFY_OFFSET "wait forever"
value for a span that is too large.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 66 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index b0b43ad3aa47..4ec1748c2602 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -39,6 +39,10 @@
 /// The number of nanoseconds per second.
 pub const NSEC_PER_SEC: i64 = bindings::NSEC_PER_SEC as i64;
 
+/// The C side `MAX_JIFFY_OFFSET`, i.e. `((LONG_MAX >> 1) - 1)`, which the kernel
+/// treats as an infinite timeout.
+const MAX_JIFFY_OFFSET: isize = (isize::MAX >> 1) - 1;
+
 /// The time unit of Linux kernel. One jiffy equals (1/HZ) second.
 pub type Jiffies = crate::ffi::c_ulong;
 
@@ -569,6 +573,51 @@ pub fn as_millis_ceil(self) -> i64 {
         }
     }
 
+    /// Convert this span to a [`Delta<Jiffy>`] suitable for use as a timeout.
+    ///
+    /// Unless the result saturates, the value is rounded up to the next whole
+    /// jiffy, so the resulting timeout is never shorter than `self` (as
+    /// [`msecs_to_jiffies()`] does).
+    ///
+    /// The result saturates at zero jiffies for a negative span, i.e. an
+    /// immediate timeout, and at the kernel's [`MAX_JIFFY_OFFSET`] for a span
+    /// that is too large, which the C side treats as an infinite timeout.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::time::Delta;
+    ///
+    /// // A negative span is an immediate timeout.
+    /// assert_eq!(Delta::from_millis(-1).to_jiffies_timeout().as_jiffies(), 0);
+    ///
+    /// // A span shorter than a jiffy still waits, i.e. the timeout is never
+    /// // shorter than the span.
+    /// assert!(Delta::from_nanos(1).to_jiffies_timeout().as_jiffies() >= 1);
+    /// ```
+    ///
+    /// [`msecs_to_jiffies()`]: srctree/include/linux/jiffies.h
+    /// [`MAX_JIFFY_OFFSET`]: srctree/include/linux/jiffies.h
+    #[inline]
+    pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
+        let msecs = self.as_millis_ceil();
+
+        // CAST: `msecs` is clamped to `0..=c_uint::MAX`, so it is non-negative and
+        // fits in `c_uint`.
+        let msecs = msecs.clamp(0, i64::from(crate::ffi::c_uint::MAX)) as crate::ffi::c_uint;
+
+        // SAFETY: `__msecs_to_jiffies()` is always safe to call.
+        let jiffies = unsafe { bindings::__msecs_to_jiffies(msecs) };
+
+        // `__msecs_to_jiffies()` only saturates when its argument is negative as an
+        // `int`: with `HZ=1000` it returns `msecs` as-is, which exceeds
+        // `MAX_JIFFY_OFFSET` on 32 bit.
+        let jiffies = jiffies.min(MAX_JIFFY_OFFSET as crate::ffi::c_ulong);
+
+        // CAST: `jiffies` is clamped to `MAX_JIFFY_OFFSET`, which is `<= isize::MAX`.
+        Delta::<Jiffy>::from_jiffies(jiffies as isize)
+    }
+
     /// Return `self % dividend` where `dividend` is in nanoseconds.
     ///
     /// The kernel doesn't have any emulation for `s64 % s64` on 32 bit platforms, so this is
@@ -621,4 +670,21 @@ fn as_millis_ceil_extremes() {
             MIN_MILLIS_CEIL
         );
     }
+
+    #[test]
+    fn to_jiffies_timeout_saturates() {
+        // `__msecs_to_jiffies()` does not clamp its result for every `HZ` configuration,
+        // e.g. with `HZ=1000` it returns the millisecond value as-is, which exceeds
+        // `MAX_JIFFY_OFFSET` on 32 bit.
+        let max = Delta::from_millis(i64::from(i32::MAX)).to_jiffies_timeout();
+        assert!(max.as_jiffies() <= MAX_JIFFY_OFFSET);
+
+        // An overlong span is an infinite timeout.
+        let overlong = Delta::from_nanos(i64::MAX).to_jiffies_timeout();
+        assert_eq!(overlong.as_jiffies(), MAX_JIFFY_OFFSET);
+
+        // A negative span is an immediate timeout, however long it is.
+        let negative = Delta::from_nanos(i64::MIN).to_jiffies_timeout();
+        assert_eq!(negative.as_jiffies(), 0);
+    }
 }
-- 
2.43.0

