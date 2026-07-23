Received: from flow-b5-smtp.messagingengine.com (flow-b5-smtp.messagingengine.com [202.12.124.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170AA47CC7A
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 12:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808560; cv=none; b=EynBQK6oy5sDJEvDvCRj9Vz6O6jQWocOUwqaC/S4oWLwKBpVDGU1sPJWPmmvtw+q56hreiPXbQ/uXvESy7JyydddnDSlcq71QMODcGGQ9JhOomTzz2N7n6utM8nyAaGKosV4/Bb/u+SM3WpElha5qouBB+tSrKzOMjc/V1vpCtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808560; c=relaxed/simple;
	bh=oWl0EB7QsksjjN6xrl0ag8/bP6henDf1eX+GG6y4iT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WW+COFc7s+nbaG40GD5W4olQcuLIOByWD+0w2tl/Qf2Zx15vOhPCv1kh8rPivKUAuGmdr8bDkbzUBmAeLImbl6kyhgjJu+OuztBty/H3beJmY5uRsCBVsek9o3iJDLy3dmcvZh0OAIgdlECIImTIk19u4Upbcrx7YM1oWJuPZQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=L48mhYCT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=i04te/oE; arc=none smtp.client-ip=202.12.124.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="L48mhYCT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="i04te/oE"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailflow.stl.internal (Postfix) with ESMTP id 6A9D813002C3;
	Thu, 23 Jul 2026 08:09:17 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 23 Jul 2026 08:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1784808557; x=1784812157; bh=WgWNzXalMOUFJiDq2zRzj
	pi6LTQlIv5Xt7qtjqvccRw=; b=L48mhYCTMgp9d8tRzJ4GUc47rYw0dEpwPjKCh
	8Bg/eBrs3S24n/aS/Ct6ZrjjznaaXW27hLyK+6XJGh2mzgNRd8uMMGNwoJcltqll
	KmmK+B2r/1aZreoTIccAdWRPhBIK19dQOdXN9KEW3/7+bkaFN0iYm+6ArV0dfRHj
	3Gxb569l9OB89L3jhcgKFVA61mL/4nqMTuzWll7I3cTRrj6YevalXN+HEZWAuO8w
	odJIHhseE7lBarpIwlJMSu++7yDfsVKkzk1VERdmFzPaNLPGy6BQl0H3GMaBD/MB
	BIl1Y1jZiRMu6ROr+n+L7kpxtRJ0RaziK2l+ByD8yxOk1lYLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784808557; x=1784812157; bh=WgWNzXalMOUFJiDq2zRzjpi6LTQlIv5Xt7q
	tjqvccRw=; b=i04te/oEtq0cNHMQhHgU/Rb7atgZQKWfsjyCByk1WlgwKcd0dpK
	dOkfp4IjzcIjYPZXQ8JCx6tAJOe1xsDp/Ui9v1I8fjCVQilp8oUA9Tp2VSFm/Q//
	hSmv8VOPosKhEZEJqEL+w0jFRNiTSl8/Z2os08s9XGarrdHd9oHD8mEWXlsH7c1l
	uqrxJbTzw3Bn5FOay0u5dLu8r5u61KC5HeogzQ1ZSi5NgFm99vFXTEFj0SB/mCal
	DyRBwUnAzdKeLoqsh9tH7k6ovPk0RpyFrE50jfEtYbhq17DZPGLwxL5aXaz1ay+/
	NY8yZfnfVoGn4pJA9c10Up8+0024PW5D/+w==
X-ME-Sender: <xms:bARiahx9lW4CvoDtkZNNr_sJgfDFVKDEaoe_yL-lxLwf_jp54IRUww>
    <xme:bARiahoh7MvDHcP_vcgW0RHGvtNTIHGnZRUZJpRZrbb8Nc0-a3rudtkWaCuPV5vPS
    XG1e5oZhW8V5ateG3qes1pLhFgPg2YOn_6mQWM9dfBvr2WuapaC5l4P>
X-ME-Received: <xmr:bARiaseB-YctmiRxxobwKOoEm_k_r061XCe6qhKKMUGhrm4Ar3vxhhLpx7yEN8FN_K3F9fwOJTqDiUwTedk>
X-ME-Proxy-Cause: dmFkZTF5KocBzFn7MPPmq3AmW0e2rXshAhy5qwys+irsZqU7EbpVjbpYDX4VBc19Q9GvCl
    z/n1PgHzKIavks02W1y0H5U+diL99tfjc2lrig1xYlv2RF2YG5nX13qoj4U9IuZco0YlQb
    Jg2F4C3Itj7GexKeNmNP1ZPST3X3NSh5HRyDOm17swKkRzspbMhAFTL2Ie1AM5VgkpWp09
    UqBIzlOPrEIxhdk/Grx4NbMKhA+8CXI2AlETwZxewIWgFHVq7CCrAaXo7JsWgEItfGY/y5
    nunALzF8X0qAnwJROp0hBbnTfFq7lFU19U1Effpk1uXeualuD/1cOg/aZk4gnDiGODfHYc
    n9O+qwVDWj0qg6ESVS/90qKPuhAT2Bupv43BqdOBXffwJIdPBXY/aknvyV4pDodTLpbT+h
    WoXKLgD6v943tumce6gWSH/4Nafs55AKijidM0VlRoFFBeUz90osRdYuUGrNzJXSUaAb4X
    HF3UCG9gY/nIaMmle4HnCMxyyuqjjzVOEACAGtGvIvJDhVFnZ6+EyitMjZ0R9bjPpwfzs2
    2QudYFfAhP8VOBx85NPt/03rChnJIEZf8iPvzYGIpccl8h+FePt9Ih+DzqcN93JifXkZth
    VIa6Ag1hgihPqNmeidbiZSaYpaS0PE6++v7NvSA5UaI05mqzRU5wA3suQ3Fg
X-ME-Proxy: <xmx:bARiavi8GuNu3Amg_OZJ0sMDm12jU-qcFva1srV2eUhJ4SjCoT2usQ>
    <xmx:bARiaiJK-JeDXQeTimakKDD_sgm6TCqrW949V91avhzDPqTzC_ac2A>
    <xmx:bARiakrEZUVLI1oetoEZYHNF9a62fsL9qXX86TG_fwXopYthU3ranQ>
    <xmx:bARiavqsDGEjnDchrSL5jB0qCwQZCYfWXdsdcwkmUZ1s8lO5U3jnzg>
    <xmx:bQRian1izugtwlDQ_nDwk140PBipnd--en6EyL5PDGEz0E_yLlQUuGC4>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jul 2026 08:09:12 -0400 (EDT)
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
Subject: [PATCH v1] rust: time: fix as_micros_ceil() rounding near i64::MAX
Date: Thu, 23 Jul 2026 21:09:07 +0900
Message-ID: <20260723120907.209643-1-tomo@flapping.org>
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
bias and yields a result one microsecond too small.

Fixes: fae0cdc12340 ("rust: time: Introduce Delta type")
Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Closes: https://lore.kernel.org/rust-for-linux/CANiq72mtS0ABA2JnT5tpz6J9c_mnxY+vyPvghV_ukngWvN8F2w@mail.gmail.com/
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index b8463823aed9..3d2c8e3a2f80 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -442,21 +442,18 @@ pub const fn as_nanos(self) -> i64 {
     #[inline]
     pub fn as_micros_ceil(self) -> i64 {
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
 

base-commit: 880c43b185ca52239e75bc546cc4f4d9154d0fed
-- 
2.43.0

