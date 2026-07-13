Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4E635DA78
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 22:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783983172; cv=none; b=emAaTQB8zEP1vnHqiFWzXB8PDn2+55XAxpBPM+pQ1UF0dV/DtZgbbXYx16nszBARl8Wvps6C/53GzDsJ24NsqXfdj/zjr6nrzwYWm6UP5jHPJcv+ONTr32++JtbFpiH9539q8D2xwqbfMEk/gWXToCexJ1V2fpUGfmjBGc+MYaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783983172; c=relaxed/simple;
	bh=p3o1RgwoesZCSKWAxzQtPBOMfpkC1bFYriaG/utU1xU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BenhIxkKdKfiw35RBoZxcC/gPlPE0FCBzDrGfdMksLqYK2CLhJvj4Vye4epzr8xGV7xBIzefdUgdjB5EGLhmkn5AKeTdo5eCvDWZdybSHnf0yOUtTTxKy0cO9W+Co4sFkBnSne4r3nU8s4dHo1U4LkMVjDvzZsVbujrteRH3bGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=Ih8cnLHl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kpFuLnon; arc=none smtp.client-ip=202.12.124.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="Ih8cnLHl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kpFuLnon"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 46B6313000DC;
	Mon, 13 Jul 2026 18:52:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 13 Jul 2026 18:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1783983169; x=1783986769; bh=PgLFLxwD7dH5IAXw5CUJF
	2aza8DRrZSBKppWOoea/v0=; b=Ih8cnLHlSCzOIQFOu5V4EoqiJfx/EWm8UsRmj
	orauQvOxm2Bc0+Otqff3IPkQgFGZ2YOd63MwlUhcRhjN9C8M4JWiUhnlvt+4oSvd
	rxV1UuGHmXy1qa5pglqZK2FNGpi8gfsVqZ6h1NbMzhh6fl94TLcqwcxXtoH6UkJU
	va0hwACARHKR66mvr5izNNRoYdKbT7aQ8CKUfNt8+uZXiz7MVfNHZ8Gg3yFreDOD
	OteVS9nyZ/ZrFvdMhu7xQr/xvB3uuUz4dWBxs/pzSKAgdwm5Y1Uf5ZllomlmxppL
	8pQ04SD9SCSnknA2d4+DQMoxWCwsS3qTwdiT2145ZPgAVttAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783983169; x=1783986769; bh=PgLFLxwD7dH5IAXw5CUJF2aza8DRrZSBKpp
	WOoea/v0=; b=kpFuLnonDtCeYED7fQVlfMJn0/i03Kswg2gHkMv/oH3WUyLeWTt
	dWXU0daN5VCG9+v1NPLL0FQl1agpk63eUGccBHVrHzYdubw/Ge6yQQam/681wyp/
	46Yngiq6poIrD1k4v8zNWyzdmIyQLCQUIpxu9tuQlGQorHu3ulnSCDJltCIVVXsm
	vLoywBTrG9X96lgr+xlwFNI5SR7gQntDyN7PHcEoxLvOv28mZ/wHk+99SMxPjflD
	+zYPIb3GhIGZ7aCBNiVBPv3WhJfL85Zu41gIyWqGSTWZKWi+/kunZkiAtzJu7zFe
	J+3s4dH9q2w5txL+q1aNE7LH1QNygtH57iA==
X-ME-Sender: <xms:QGxVaqfkMdWV2lQvTDqEoBqNZOfOtqKII6IdZWG8bUzamk0Fc0BvyQ>
    <xme:QGxVagG0oxFiHf56fSb2Dg0ZgLa6FLSEStKUp4XE4Lgho5Sqx4CB1DjwDzfUFz6Jd
    pfbBTa0EkwT2_bhz4uGEePunx6q4A302RgCAEJZffP7U0KUP0SS>
X-ME-Received: <xmr:QGxVanBxbG5dkxF0X6uVxBz1BLtyFBZozNweiKBlfGJ25fiHI6GRYUOin6QKQz6jSObp4AOKvZAzqmrnswk>
X-ME-Proxy-Cause: dmFkZTFj9ER38TTE0osK6oIRmNaox+JmHehRGFN2CZFdPMrhYPOBMpB3/XIINR02y97vvC
    5NLIACMYrcikt7eMHJba8+00S/g3ggOBh1fPpgJUwEsbsn1PRYjBHloOFcrBwS8lVk1A79
    OWfHbvhGHzaUop76C3b0RfqwyCkWxQqJ40yO4Zo2dYjKj5k3hKsyiEGXc21TKD9k9nLEh8
    alxD11YjUw+8M7KaU0b8+z3BQyoe/H7Gh6HOaj0W3t9CrNVsGYiQ3EI3nQlcuB37pLSOCP
    uzJ3faigzmtQb9FaU5hP+tcK41P44O6wwpiHBFX82zOKNaw0zsrTB4Cn4cc+v3dKDn2+Ts
    Qpw1f88zeGUXN7IbCWpN9V5ydPOEl71hYtW8RIcXTKCZVZcHylpQlnZoUAO+Wz1H0Q7f1h
    ZOqfXUaSRENOHYfuRQzusbtJ1sO4a5KKe4X0haLjtntiEfNIdmetM/jmwDo/BclLAhwgdF
    CDyKQ2YW+11UBk/Ajn3xlZjll4esEcuCUd/zjnEPzkNVpnyZPPtB0BaeiBw+vQBAED44Hq
    otLfg+tv9iWExcC8J9G1eIBCaa9XKBb2z9yffy4r0za0Ks/f0Ndza2X5CLYj60jphSI99+
    ePiAMDIuqsS5eaYEzQHSoGYdcascfEvn8mKX723LdiqtubU73DiLfCVVPTKQ
X-ME-Proxy: <xmx:QGxVar7WyXgxy-HHml6N56f3ZCh_-XyZ24dilRAGBtYOccShfncJOw>
    <xmx:QGxVaunbcvseGgHKcmPFaFetoo3oB_rBpjs0pZTxvJ156lFZoBiOeg>
    <xmx:QGxVas6Oosplv37lwSROm2xBS21CvZzZOwbDJ8MkY6cMNHaZ8oPUNg>
    <xmx:QGxVakUDNqfWsjEHfYf0kUaOEn-gysPFnftbZOqOJ6d8irlc7WkTcw>
    <xmx:QGxVapOGHFGOQdtuGHBPJ7C4m5snNiVhA2_5L6GHr_0MNy0jbSh3tSLa>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jul 2026 18:52:44 -0400 (EDT)
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
Subject: [PATCH v1] rust: time: fix as_micros_ceil() to round correctly for negative Delta
Date: Tue, 14 Jul 2026 07:52:35 +0900
Message-ID: <20260713225235.3243480-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

The ceiling-division idiom `(n + d - 1) / d` only produces the
correct result when `n` is non-negative.

For example, if n = -1000 (exactly -1us), the old code computed (-1000
+ 999) / 1000 == 0 instead of -1.

For negative n, truncating division already rounds towards positive
infinity, so no bias is needed in that case.

Fixes: fae0cdc12340 ("rust: time: Introduce Delta type")
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 363e93cbb139..b8463823aed9 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -441,15 +441,22 @@ pub const fn as_nanos(self) -> i64 {
     /// to the value in the [`Delta`].
     #[inline]
     pub fn as_micros_ceil(self) -> i64 {
+        let n = self.as_nanos();
+        let n = if n >= 0 {
+            n.saturating_add(NSEC_PER_USEC - 1)
+        } else {
+            n
+        };
+
         #[cfg(CONFIG_64BIT)]
         {
-            self.as_nanos().saturating_add(NSEC_PER_USEC - 1) / NSEC_PER_USEC
+            n / NSEC_PER_USEC
         }
 
         #[cfg(not(CONFIG_64BIT))]
         // SAFETY: It is always safe to call `ktime_to_us()` with any value.
         unsafe {
-            bindings::ktime_to_us(self.as_nanos().saturating_add(NSEC_PER_USEC - 1))
+            bindings::ktime_to_us(n)
         }
     }
 

base-commit: 5a81c35c3b18cd59ded56171a6a9f643b92a6759
-- 
2.43.0

