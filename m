Received: from flow-b4-smtp.messagingengine.com (flow-b4-smtp.messagingengine.com [202.12.124.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0AC4749C1
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 13:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107952; cv=none; b=UN+Fq48ABeZLLAu+sV+mtFaPUwcY08rdd+awk1kG6lm5HRlcaDx0lxL7cwW9AOd+LeBuGLDjNQb3N9enKTX2D/P2h4vMF0AOtnde4Ffg4oQJ5tx2cdF467LWI5JgCBH+qlGxHoavUilFdIkAz75BKodnD5QFlhJubjXTzOaB8fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107952; c=relaxed/simple;
	bh=Ijy0eKkIdVOScVWKB0uJPD3BMiuacm6raTzZLeNGY1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CDcZNJFFYqmGPoSeWR8+wx8xrOE2n6NTD1zPrVMiZBYe1vBPnDuEsC48FXKzZpjNEJi4Hvw9Ai0j04dPtM2vxffLPJwbzF82gJmNJ86sa9RrD4MIwF3eikX0Z+vTRFKwvS1O5BlSsfglpk9WouwBFSA5lg/SOx/JX5Tceb3m0AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=SZJ6iesK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dmtNV1y4; arc=none smtp.client-ip=202.12.124.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="SZJ6iesK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dmtNV1y4"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 23B6D13001EB;
	Fri,  7 Aug 2026 09:05:43 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 07 Aug 2026 09:05:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1786107942; x=1786111542; bh=3nQ6nYMMLwkGnU1JTwP5I
	n9xlQ3OHG8qCBN2m2hQGHA=; b=SZJ6iesKUUxi3m1V6t9xa8CYafpePJedczwBD
	MbYqTA0DwwDOuwxlof/IMgUq0BGXE05gRyQMV3Oa2IOCILyJwyw2YetEa911IL4q
	c1Q9MYrdpLyEXFeBO8RTZedrcg4jpVsZFJziivDY5ZTqB63nHDLVn6uAgdYCsuad
	B4ISS4w42YbNmwWRnROvBdeT0KY06XU6pQBd+/lLlD2Tb8iGHdo90DFqh2JaHt9x
	5KGu/EptCoYIFzy2pjHsoZOh72ApY5kHaY7O2JruU2Hd2r6n+VHh43m72CWgS9qj
	paBb+NxwBE9qfL7cHqg90yUpBxuk7zg7ArmVKuBYavJaqZcIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786107942; x=1786111542; bh=3nQ6nYMMLwkGnU1JTwP5In9xlQ3OHG8qCBN
	2m2hQGHA=; b=dmtNV1y4HN2Ism9osGcAvXLqe5Hdyv8pO1eAz+3kJoeuVZ/rDaG
	d8fTAmzTCRtlz4+KBiTThn2i7IgLTgy7WJRvyuISL5p8OhwWhmy6bfRDAkE3I9Hs
	VxNkmK7QsTMR0zFMpK9vvnbjbfvo7AZ1aK69aazYLa7sctUd/kOVhKjqDSpxuiPE
	R3EC1MmfY5KdQSWeiK0MxSpLGEUTgbCs3IOKy/GZ8RNaexVQx3qw7rcAuz+TtKIN
	cUaYF1CgpWbXmOuJgYDnMlAf/eEBXXuQXngxkL/eIaB9CXVh7m/7R3q6H2uDsLKP
	+IZSiGXDst7KFmZZ19d1s9S2iAYAPlXj/xA==
X-ME-Sender: <xms:Jth1avXrYo0Pv0OSMlvyHuwHX4fZyyzBdNhoxcPLPU-Mv1FZRycnAg>
    <xme:Jth1an9JB9m4NhpM1urniB9TsbXMz_ookpjfJCajrkHi2uSa3iMreOjhEw2eXTYOV
    IHxb7lWOupbZzYrvPin1cpAah3jggG8rLC8imJC2l_UvveoGIj84uM>
X-ME-Received: <xmr:Jth1ashy8FUFnAjGylDJ5wDSeKFskx9OEVQ6XI2FCC76Xwdzm6qAU3Mdbq_kqv93P12wpc-qROh6NLXiP1o>
X-ME-Proxy-Cause: dmFkZTE6lBmfP6knYuNxSlrW+A0FA7pwoCcGF7dyMbw9BKqc1GOrdL3euEkYJVtdrPhBuk
    lHyBx854SV6COykUCPpcvG3+zK2PLiyjc3FeN3U4UvBbDs3udS762fp4fvLuPMNWDtPWeB
    KcGUCmfiI+9YHiwNBGhQUQL5kARnWNBvCFnQP7xLi6Y1uPeZ5Mi/igAzTze2wIEbkWCa96
    XUjYl1WKwlWpGGVEHgI3LVltKh3ZsRBA+OOqYcIitgtUaSm2fk17aFvWnRGBNCB+DxUbGA
    uiiT9+O1TwdeE9AmPlYl6Nk5V07cVyLfLE9Rqsbb/ZJF3wirPkS/1ntPEFk3Bam8RZ1oBv
    4gpHKYM0LOLLBbz6tktI94CAgBSnscZ+bJv2Y+Sk5duXwr7W6m4UvEsFlnSh2g6yBgDHN3
    PRZ/bvO4UT9mLBa3MRbftABGBa04Ist27MZ9xT0PErHm85wnFeJcvjy19p05j9a2FYqzid
    1vvdI0Hnwx8bcE0zeMy0AeCyvXG/LClkgXQRdSieXthc6gOPMjtXqGrxZhG2h+m+smWSrl
    a9HO6OthZNAraouYI16bh7BJOue4nkefV0DnikiKmMhj7TDp0YKyt6fUlpGVRtMjX0UeDj
    +FYqv93omzBgBoVcAHCW5VvxBmoB2/fxh86GkYPCRy7oiV9c6I+YDGCVTAZQ
X-ME-Proxy: <xmx:Jth1amVAsnwO8ZRPacs_qVk7zvWc1NXQLlwIEsEDj6PQDolnmP4GHA>
    <xmx:Jth1aostC8wbDaeTFl6YGvC9CQ79B9tU8Vs88dLB1PwMC0UCcXZHrQ>
    <xmx:Jth1av_tjBy_VdFBfGWbCus7QBw_e8jLZ_PqPlBRImfRlV8wPYVNrA>
    <xmx:Jth1agsNDpXkzXvA5001jZtyIttZqx7s9fe9ThpxF6rC3zFm_ELOOg>
    <xmx:Jth1arqeQvMbjl9TNcGwVXWx6eXMu_eFBRpBQJpOsQp7hMB6YkY1AHy6>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 09:05:37 -0400 (EDT)
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
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: [PATCH v2] rust: time: fix as_micros_ceil() rounding near i64::MAX
Date: Fri,  7 Aug 2026 22:05:31 +0900
Message-ID: <20260807130531.1056209-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

The ceiling adjustment used saturating_add(NSEC_PER_USEC - 1) before
dividing. Once the nanosecond value gets within NSEC_PER_USEC - 1 of
i64::MAX the addition saturates to i64::MAX, which drops the ceiling
bias and can yield a result one microsecond too small.

Fixes: fae0cdc12340 ("rust: time: Introduce Delta type")
Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Closes: https://lore.kernel.org/rust-for-linux/CANiq72mtS0ABA2JnT5tpz6J9c_mnxY+vyPvghV_ukngWvN8F2w@mail.gmail.com/
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
v2
- Add the comment; no functional change
v1: https://lore.kernel.org/all/20260723120907.209643-1-tomo@flapping.org/

---
 rust/kernel/time.rs | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index b8463823aed9..54fc46d460b6 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -441,22 +441,25 @@ pub const fn as_nanos(self) -> i64 {
     /// to the value in the [`Delta`].
     #[inline]
     pub fn as_micros_ceil(self) -> i64 {
+        // Only positive values need to be rounded up: truncating division already
+        // rounds towards zero, i.e. up, for negative values.
+        //
+        // The usual `(nanos + d - 1) / d` is not used because the addition overflows
+        // once `nanos` exceeds `i64::MAX - (d - 1)`; saturating the addition instead
+        // would drop the rounding bias and return a result one unit too small.
         let n = self.as_nanos();
-        let n = if n >= 0 {
-            n.saturating_add(NSEC_PER_USEC - 1)
-        } else {
-            n
-        };
+
+        let (n, add) = if n > 0 { (n - 1, 1) } else { (n, 0) };
 
         #[cfg(CONFIG_64BIT)]
         {
-            n / NSEC_PER_USEC
+            n / NSEC_PER_USEC + add
         }
 
         #[cfg(not(CONFIG_64BIT))]
         // SAFETY: It is always safe to call `ktime_to_us()` with any value.
         unsafe {
-            bindings::ktime_to_us(n)
+            bindings::ktime_to_us(n) + add
         }
     }
 

base-commit: 075b74841bd0065a3bda3440873c747938e69b68
-- 
2.43.0

