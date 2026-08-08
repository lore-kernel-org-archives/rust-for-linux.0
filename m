Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9A03451A6
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Aug 2026 06:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786170562; cv=none; b=B3qhyhO88NXSt+K8mC0l19bB/gN6u7cXXomrY1sqmqOexgpUduuN1Wy0p/Ew30RS6FCKXXB5avknfjGiTzI7Qx0cX3bInmrkAKKikUCUeUtiiFQxGEtUADnNSjnJGR+iTVMHTkns0CkkpEumH5SgJMNU1QU0tZdrRW5rseujkfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786170562; c=relaxed/simple;
	bh=4vPVq3793Uajr5tywnNOUJ2pEr2vPEp1GcUAT5xRRAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WDQq5vvf0dzdo5okF7hPInpQDu4QIoNLO6W/qwSRaVJjvkOl9b4Xipq4Km4Yop1XECxiQ366ZUUtC+EkiOIqhD8sPyQMkT1l+4dBMj0VHRt6Q9NjSv570NZ/k8OAG8E7QGjQ1bbBcxdRTr5b3PdJZdcenPcBD2tN7D93kuluIjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=IwZfIPEY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=I4rY9wNs; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="IwZfIPEY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="I4rY9wNs"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 20A9613801C3;
	Sat,  8 Aug 2026 02:29:20 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 08 Aug 2026 02:29:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786170560; x=
	1786174160; bh=eNVjaBVLaqWIslFsEOlJuPQyvoIjzLQf1Xsd7ypTTL8=; b=I
	wZfIPEY1vEAa4qInqczy1lDbiNm1XQsic/4wbJclvJ5YNzrrO41VhrETBkNHpCn7
	t/btfYd6AIjGGFkC2zrn/WvNA+E/TQYpza010wwCEuGFmDEpMndvzGPqNBTLcXRh
	COI/CSJNBuHI2mRzZ0KiTqulvxm9FREHA/CSC5599864944n6atxWo/FVxFONlDx
	eJNe7vwOO56Zi4vKw+BvsoaJe/h5BWhPk5YSdbCx/6MziVh5kUaukKFaBiGBSdfp
	5UXijvPHSifeJwj+aWZFkZ8m1M8Qb+fy2ROGBsPhxkyJLdOTBQCtOz7S8yjvctJq
	YgXtve8KEfuivm1o7hAJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786170560; x=1786174160; bh=e
	NVjaBVLaqWIslFsEOlJuPQyvoIjzLQf1Xsd7ypTTL8=; b=I4rY9wNsEF5+jQCJY
	nVliMbJLUsVwK7bFgDIEtIEh9f/uQ380W2sWTp5My12mpexXcDqNgoSmFYvYOQ4s
	PbkCkax534HfJ5PgzfrwvTWLeJm8wxKgtzP4GNMQFNiYUKbDwKcev/eeCi22ErOy
	gbtdTltHxjga730J2vzZSfNNtODBwo6Aw2mVT2Q6lSbfjbOQhjXGFRC9+iGRzgMq
	lCXt+hB4sfCfCyQ0hjk76Gdc6IlvhWon4FWydnNaHAX0puyxYTBISSXxVlAtrww6
	pL0XpuW1F9Z4pJjVeB+wTGHwcnTan0NrSqqXcF6c59pT5PB4sYLJhl7A9VfExW3y
	+uJiQ==
X-ME-Sender: <xms:v8x2arhxoCPlT9KaB7DvJMXeD1k5aWGEow_aAoE0OtlglAb1lE7Mrw>
    <xme:v8x2akLqvQ8dROQvfakGmHlyhnUb8DdHEA6KMpwltorI-09TrFl60mAP_Wckq5-N9
    LI60SjicBw4RNrKC83YhYgbDEMNKSI4gUtIOsfOg_WhkF5niEBcc87D>
X-ME-Received: <xmr:v8x2am5Wdq3DgZB81GpmdGtbOPs-vNs7F__YyjDCrtCW5_MFAb2BrZ8vle3Jz3ZVMmsZ5IaZu9C1k08SkWE>
X-ME-Proxy-Cause: dmFkZTF3LiQwhStKBGOXv9XWAnVq93qhZuZVYvK3ZumPXSwcPkIvWaRNcXdYOVftdhi+0F
    E54pljEvIQmMQXhAr3evmVzrBNXQbo9yh9wvi1P5vI4ku3K/1o0EFPoEJ8jWgNWvXgMYYZ
    0wovpoLfPfJAKfGwFVrVgyf3ofXmTQXG6Vxrcdu85DuTL9Xb4ELohhX81CbkaEOenHbFQK
    WLA9vdUp4jcg3miW741RKBh5D4JLWR8gKInaLzQnaUQcHjBaljhUYcJYbswIrr5viXnMgO
    j3mhUUMh6L973Xph/g1ZH6xC3gro0tiucLPjDvrSgd9Zh5rnyIYsDfzpeqgpM/58+rkakg
    ekNnuGUYkq6GdlUl8JPwypm5RNL9Lpu7YQmIDivXDwysRTNWNeWfUlKI/H/mAg7+5jjYL4
    +9JHKIQR9BIA6exOfMBvog0ahgz6Ml2J5QKb0cezEckLby0Q7ePa5oN4kCLYD4PsvhEplc
    XfSBxEuZ0gv0lPNQJDoGR58/VNZsUzigUH4Km8ebyESNUDrZlnevBHsak7m6NMDDDFk/5M
    KvlDgIXG7YRg7xjsExkvYIVkFxqpUU0FtxJSjgTFr0zAKgyHd2GZvYomMUgxTm/2X3qZlW
    bqjJKhrgoFwTPiDzqQKJJMdRQf7MpEUBdLzybgoGuwOJWUTgme4ztz2rzf6g
X-ME-Proxy: <xmx:v8x2ahk8ztFuiYY-YdHbhLwz2LK5DHDSSlBGmOH7-oLPVWUNjRVg-Q>
    <xmx:v8x2ao692LCju2scBR8ejRTTfCk2m_KDUy2PTIuYrNS7ZMUelKf-ig>
    <xmx:v8x2ai8_7UJo4GvYvYtaD4T7hN4cN27_bkffxj8DnZygcOddmv0xIA>
    <xmx:v8x2agh-iKs5W5cUW2hhqi5ZioyA1yPLz6LspcVfmdWAAXFf0vmNjg>
    <xmx:wMx2ahmnP8cN65D3LfXEycWfDjT4ZSnffAJz5IH1tzUhwGnleYwM4wNW>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Aug 2026 02:29:14 -0400 (EDT)
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
Subject: [PATCH v6 3/7] rust: time: add Delta::as_millis_ceil()
Date: Sat,  8 Aug 2026 15:28:35 +0900
Message-ID: <20260808062839.1159990-4-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260808062839.1159990-1-tomo@flapping.org>
References: <20260808062839.1159990-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add a ceiling variant, mirroring the existing as_micros_ceil() since
the existing as_millis() truncates towards zero.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index bff72a4a0b0d..af144d251f47 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -525,6 +525,32 @@ pub fn as_millis(self) -> i64 {
         }
     }
 
+    /// Return the smallest number of milliseconds greater than or equal
+    /// to the value in the [`Delta`].
+    #[inline]
+    pub fn as_millis_ceil(self) -> i64 {
+        // Only positive values need to be rounded up: truncating division already
+        // rounds towards zero, i.e. up, for negative values.
+        //
+        // The usual `(nanos + d - 1) / d` is not used because the addition overflows
+        // once `nanos` exceeds `i64::MAX - (d - 1)`; saturating the addition instead
+        // would drop the rounding bias and return a result one unit too small.
+        let n = self.as_nanos();
+
+        let (n, add) = if n > 0 { (n - 1, 1) } else { (n, 0) };
+
+        #[cfg(CONFIG_64BIT)]
+        {
+            n / NSEC_PER_MSEC + add
+        }
+
+        #[cfg(not(CONFIG_64BIT))]
+        // SAFETY: It is always safe to call `ktime_to_ms()` with any value.
+        unsafe {
+            bindings::ktime_to_ms(n) + add
+        }
+    }
+
     /// Return `self % dividend` where `dividend` is in nanoseconds.
     ///
     /// The kernel doesn't have any emulation for `s64 % s64` on 32 bit platforms, so this is
-- 
2.43.0

