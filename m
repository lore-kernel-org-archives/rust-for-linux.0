Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192AE3769E6
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 23:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783900461; cv=none; b=adLWIYRMRd6bV+dCl/7H8xFv4BAc0rjlRv448se0fCLbU226aCppPqzxFQtVjx9ufsZUfA+JjsmqBfjXaZseXLnDcYsQMY182XOAu9LfpbsfaReO0+SMGWqG4lXKLL3mYo5bffPU3cmA1s1KQtdl4jbooTUTzSJ1NUstSDzFEz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783900461; c=relaxed/simple;
	bh=wpyNGaZ9jKtxFXLWSNpqgHDhYMqCTcvbnLEMM/CMZ/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mMWS/+lyPxueD5Qyh3miqbgNELNLh0B/D1byTElglaTszf0qIzcyFuCrriD0gYFC+E3M/P4efp6qB0pNptMSMf2jNNKZjnomEAHsZn5roDLc7twGzOkRjEtdhzZxFzbEQ66gOuDZZeDNeQiwp23eBr1GxS4KhO1gBND1JC1yMVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=QCHkTIuB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZwKmMHXf; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="QCHkTIuB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZwKmMHXf"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id 5D8FA138027C;
	Sun, 12 Jul 2026 19:54:19 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 12 Jul 2026 19:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1783900459; x=
	1783904059; bh=t0+YL48i3GUAqgPlrOsaOamHDrmszqXlOP/wFNneMlk=; b=Q
	CHkTIuBUsd9jUGRrRX64da1GDcu5ZZrS1coO+L60LlCpPZXltSXAups6H026a0VQ
	hzF1gF02RuihXWbu9DZ+AyuuZ3JRCN7HLHhB21WSmX3ivHI/nGnMKnQEx412oNsQ
	VgEz9jGqZdBaVpVZ166255vzyB/Av7wpQu8ovEsxoyYDYiHrWcB3WYxJV+g2IR5D
	DCRGRr/prEap4BYykgQjvcxK7E18TRR1qfZ1SsQyyrTg39fW2DDDZYJOET62McNK
	1BeiozOYWDLg/jJ1+Zvdi857JvaGid/Yjd3FRnVAM6RPemDbVqAM1HKaFpcU18wc
	H4hz4tov007E7fd7z1Byg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1783900459; x=1783904059; bh=t
	0+YL48i3GUAqgPlrOsaOamHDrmszqXlOP/wFNneMlk=; b=ZwKmMHXfw/p7E88JA
	e0hd0rPP2stM0nIt3rFYnbXibX4tEzAOcPIlHd2TEm7Nr7FaHMXNeuaA5yreIbdL
	d/GpRfaLHS/X3+N/z2pCsopYG2vuqQz5MN6VWIsdEqSE2qdBDm05cqpdt0kopN9I
	KY7B4COIR0XcxMScDTiX5YMl66oKC0LfmFD4Vs3c5GCs/c4Dn6fzu6bjts/WjkK6
	nzGtS3go8610Z1q08QyQlOp39QJYLHnhL3tK7ZcKdvdSSJcloowjJhC1F45nA+Fi
	5x/qJZ4lzFuXssrEmeKBI0xjfxIP7e6CbVPXCLDIsB99+B7RSKJyelKaAlqV7YV4
	PwVFg==
X-ME-Sender: <xms:KylUaurBvSo24sdhHuM1nRadwlGQEPHFPxP5hwkMPC0RzqvePpIyGA>
    <xme:KylUaoz7XbfOiIEeQAvmyQU7Vos-Bow3HXZ7HlMv7eI9Owy_gpTs0cse_98QXXo7f
    M34LLX-TocdoPirGeZd8l4BYxRp8hLv_gO3jsW7xQ9qARjHHMDMU14>
X-ME-Received: <xmr:KylUavAuXvh-Zkm0DsW6ZPIfBBA7SJ6slJxH9_u4nR91kfQKi49lADYbx8q8-MeoTMDxBu93boVv1-Uf2lc>
X-ME-Proxy-Cause: dmFkZTE31iBcvpgjYdZr1KIE/6DYlEJEulM18kywekYhcwjp6oc4qGtqEEiP0eBVYIviWA
    Hhrc40792y5g9p/vZn7wYZZCpVhEMJZPg6Ag9Cx9+eIG8lCJUQBaaWrWpvDtf9MRNXXgrp
    If9/LRtCsz7iF/x2Je2OLQRKSfaPWGZ9vc6tbm3bvH/9nu+UCTOj6k3rVTgzzqmkASkYUh
    9E8sCqTUteDvUBZFufbRe8/NIYjgeXIu4N0FXfH5N3WIGjAZtE/iS1e0EueImeH9yGOrOK
    ZHqNAT6bgvZmCQE1xp8VuNO73sqqBKuHU7QETGYMOABXyjd7rKLLYQHX10i6am1f9R+qcK
    PO4ail8FFEes27l392ESyM6XjvlafJfoXKgehg4ITmqh4P3Ht7fldQPjr5saDNmswHmcLq
    mN/2UOPcTa3ANejcdZ/1R12CcSDXp1CvBvNmJ2dwb8gKerNAY+BPln9KcoRi2xzMBuuRza
    S9jclzeP6JTTObyYJoxJgFqbMssUYguQNw2FqFUaSQJc5OhD99p96RbIeooiCFRt06Xgd7
    vWHpm5ouUYNvGUM+7r9kMBE6Qud4wLkNnEIoFs9oLwUPp+w95bd76QCc/OZKpDOWtJom4w
    JpYKTJwR75oS9rEpFo+uvx3okoFmZHe/Zc1fNzPDPvnDKq6MkVtBPsftEuGA
X-ME-Proxy: <xmx:KylUanM34lasLooKiUBY6TDOMaaRXVpAC5tYrRrqRczLTpg8UJJHeg>
    <xmx:KylUauCeJRFw9-w4wJ_WF0CVOVLak4RZ_7x2cw6ddRgQL5uck6EWXw>
    <xmx:KylUahnbsCkJ_Kh6jJjcWk5Aj1hWtSgM9ezxqf8D8agV4WY-AA53iQ>
    <xmx:KylUaqocnlIKjZ7suyq5ab7ANk-aDOujV5vBYQZx4A29JrqhYikk6Q>
    <xmx:KylUatMo6w3gO2g0EFCDqqoGUcyH5QFVhlXJo2gUpfqClVGc0xWTYXGe>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Jul 2026 19:54:13 -0400 (EDT)
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
Subject: [PATCH v2 4/4] rust: time: remove unused Jiffies/Msecs helpers
Date: Mon, 13 Jul 2026 08:52:46 +0900
Message-ID: <20260712235246.3069713-5-tomo@flapping.org>
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

CondVar's wait_interruptible_timeout() and workqueue's
enqueue_delayed() have both moved from raw jiffies counts to Delta, so
nothing in the tree calls msecs_to_jiffies() or uses the Jiffies and
Msecs aliases anymore.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index cd054ea5df02..184ae7755f1b 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -39,20 +39,6 @@
 /// The number of nanoseconds per second.
 pub const NSEC_PER_SEC: i64 = bindings::NSEC_PER_SEC as i64;
 
-/// The time unit of Linux kernel. One jiffy equals (1/HZ) second.
-pub type Jiffies = crate::ffi::c_ulong;
-
-/// The millisecond time unit.
-pub type Msecs = crate::ffi::c_uint;
-
-/// Converts milliseconds to jiffies.
-#[inline]
-pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
-    // SAFETY: The `__msecs_to_jiffies` function is always safe to call no
-    // matter what the argument is.
-    unsafe { bindings::__msecs_to_jiffies(msecs) }
-}
-
 /// Trait for clock sources.
 ///
 /// Selection of the clock source depends on the use case. In some cases the usage of a
-- 
2.43.0

