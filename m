Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAF8345EB5
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 01:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790732528; cv=none; b=fBKZQ6v+syAnTqqvGSTSlS5qrOVZD37rH2P2eqKN5RrPC64tUZ/thLZAj7urH6Ib38eB5ES0Ga7IzWQS8TS496Acr+YCIryBaRUDIfxno6LACSkCLJo0Ego9CYC2zm3Ny8rm5//vvCLFnw+gMFl1HFcO+ZAFEq5/rYM3/KZ0nKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790732528; c=relaxed/simple;
	bh=qkDO/+8aI6UbJkYHqfpx5snhhE1Q5C3JhRF7OT4Kvws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m32KGb/xmW0kJGc24dTnlzHgVgc/Ka6p1cT5uahTle22nxLbAv0oCMhQqzYs7fCaEaEqe5v5MzRGWDyhvdgFTrMM9JgUW3wJruqQh/t0H+hztGFZ0ZDJI8KuTTuum4RpUcsw+DlGCNKKpDAB9ueXWscdtOweabx1x8TZYq35yWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=AJRqroKA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hXZTBxEd; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="AJRqroKA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hXZTBxEd"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DFA337A0792;
	Tue, 29 Sep 2026 21:42:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 29 Sep 2026 21:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1790732524; x=1790818924; bh=2u5xIs/vBCkmxuRK89JV+
	loIvphqCW1AuuP4Lh4ugGE=; b=AJRqroKAUatc8IRYOXD1h65M2ddwB0XRKveUb
	HMqdP6zCx2dc3Ba6pq9lsfTFq8VvlRBHxlhfO0lpTkJkkf/+oxnGRV30dof/ThTM
	ABA2sfGzjtFZ0lZMdBl5na39JEv8T4MdjM1m1OogTE1N1CgkgvcQVlzCIsnew/Ny
	z7HYkG7Z0EivbqhajyZwmOkCu6JnxBtAKS/94a0dLQEUkScDlzwlQT/FXJ6ftT5k
	lg1y4RFEJXZfOzIeIujkRYCa7+EB/oarSRw0tqile6CO0sbJvvbL3UN9JpMsTG6p
	UMbGo9FmrWp6hvjhaziz1JEsY7jfnWpOa9iTmpl62taJ5oSkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790732524; x=1790818924; bh=2u5xIs/vBCkmxuRK89JV+loIvphqCW1AuuP
	4Lh4ugGE=; b=hXZTBxEdQ2oNoJEmFeSkpFJacifFFhVZGJLATAqT7ZkCR6TVhQS
	ren5K7CFZsjSpaH11pfWQSRK9cUtc8u5rfKT/ejdNKNGGLnyxmM34lC+fI+MdOYx
	A7whhosBNhge0kEUyWCA5mLZTnthl/vLdR2d5AE7qsKJ29Bv0ApUqkZJBL8PSZtb
	J4HN2RDqL3TivdAupHWJGGpc/Kj/GE/34tN5ZaOre6+FNfmc7iwWxVlKDTtucqNp
	C6+kR3X6rjpE5Y9/Gxw4C90eYTsgo5tMTbcMa7bwFJfZQjTKGXhkxzubH9W7/vS2
	xFoTTExlb7I/pGQzmIwrTAYKWPYRUd1SwTw==
X-ME-Sender: <xms:7Gi8akbDKbAQYaYe1sZsgQO3VKaPj1BWZkpxGSEbHLpyZYZTCZn2Dg>
    <xme:7Gi8anyhBapgldyNHE_yXgNuQnZ_meCUY-USyfIs76V9aw9Qefr4Y6MBD_jtGVJp6
    SNqn2Xz_ElrKY9Erx_Mkd6dwzFcti8tz8KSyffNhOtfTleIhJrbnIY>
X-ME-Received: <xmr:7Gi8ahKCjwTMKz-GF4mswWa17ecw1_tghAKWnkX2iHLRYvAzqXpCYq5eFQGvXypzlShCBAdBgjkoBgCgL0U>
X-ME-Proxy-Cause: dmFkZTE2OJWxxFzkk+50txhrtLl3aY2+Bh9xxoCjGBK0+7EPT3GHceqt6yVI8Vj2W9kEQ9
    U8xmlF+y2GreY4+VS3ozuwXQFMhl7Z35MTSNmMFwcFQXtWZENtRZs8QuPvZMFV6tBNBhIJ
    By22anHMOr6FO+219vogfD8kPP0AZeyrUJKQObc39KFrxut9vOQx2ttOwkYe8fr3mX44b6
    Uy5oz2miWx4HlecX97w1x86uUb75UYxnboaScCdBtsgiwZNnGgifSh7XRzwymE966pFIzl
    gNPUHXqcR000wBDSnxz5jaPwACWcyH+IF8o/SEljWuiTxZ+EEHn+Mjo00wpxpuNv7hYoCe
    WZQgNRtQoS4/BHFPsUcmR9/fKRZq5GS2Sa8AgEhGAzV3anbNqFFTDIczHeMxyYQKumDu5g
    UFlS066ACwedGkw+1mL8RHMd5k+UnM3q7B27cxXGWEeC3j7ALlb7fxu+VV0B+iaC+Q2QSR
    zLDwBZZgSW/Tb/5++Y0ZDjMN2tGuxsrdrS/k+7CBV6QaLeN19cP9zoFjleKccXKDDMKQZk
    YzAXKqjJl8I58W5HjbpFVxpP/DKe3UYqRP4KkWUeXTplWkL7JwLrdUlPDpVpHk1IS41oF1
    P91bX7Mz5Snj2NzazCuNYpd4hk46WHmHm+RGIbH8PoEK9hwdbmglev02QhQg
X-ME-Proxy: <xmx:7Gi8ame_7FUwsoixEkkINbXa6SQxG6g8MLlC-8emKzi0FpiZjxwl6w>
    <xmx:7Gi8ahtyiVh0LxLk5RzEaPPgqJu1QvmOUW4D7NKzDT8QkSbt94f-2Q>
    <xmx:7Gi8asE2_Q1L-X9SC72FetSj7oJ7JtHx8wYmAsE21i13MUtaehuigA>
    <xmx:7Gi8ajdg3--R6HZJzwbVOVjp0w3LFgmip_q5hvG_Pl3iL8NSlivLdg>
    <xmx:7Gi8ar7krw8mNz0-BYvk7rvu6X82ICb5QuVdcKQv-S8jXQaxwZQNgkR7>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Sep 2026 21:41:58 -0400 (EDT)
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
	tkjos@android.com,
	tj@kernel.org
Cc: acourbot@nvidia.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	jiangshanlai@gmail.com,
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
Subject: [PATCH v7 0/2] rust: use Delta instead of raw jiffies for timeouts and delays
Date: Wed, 30 Sep 2026 10:41:22 +0900
Message-ID: <20260930014124.1454138-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

CondVar::wait_interruptible_timeout() and Queue::enqueue_delayed() use
a raw jiffies count (a plain c_ulong alias with no type safety).
Callers have to know on their own that the value means jiffies and
convert to/from it themselves, which is easy to get wrong (e.g.
passing a millisecond value where a jiffies value is expected).

Both APIs just take a span of time, so they can use Delta<Jiffy>
instead. The condvar patch also updates binder's ioctl_freeze(), the
only caller of wait_interruptible_timeout().

This series is based on timekeeping-next, because the binder change
uses Delta::to_jiffies_timeout(). The workqueue patch conflicts with
Danilo's workqueue series [1], which also changes the signature of
enqueue_delayed(). The conflict is trivial.

Binder and workqueue maintainers, could you take a look at the changes
to your code? Andreas and Boqun, which tree should this series go
through?

[1] https://lore.kernel.org/rust-for-linux/20260807165252.3849875-1-dakr@kernel.org/

---
v7:
- Drop patches 1-3, merged in v7.3-rc1
- Drop patch 4, reworked and applied to timekeeping-next
- Drop patch 7, rust/kernel/serdev.rs now uses the Jiffies alias
- Rebase on timekeeping-next
- workqueue: keep the parameter name `delay`
- workqueue: document that a negative delay is treated as zero
- condvar: document that a negative timeout is treated as zero
- Reword the commit messages of both patches. The condvar one now
  describes how the binder freeze timeout changes for 2^31 ms or more
v6: https://lore.kernel.org/rust-for-linux/20260808062839.1159990-1-tomo@flapping.org/
- Make Nsec/Jiffy zero-variant enums so they can't be constructed
- Rename `Delta::to_jiffies()` to `to_jiffies_timeout()` to reflect its timeout semantics
v5: https://lore.kernel.org/rust-for-linux/20260806073241.1024319-1-tomo@flapping.org/
- Fix as_millis_ceil() rounding near i64::MAX
- Import Delta instead of using kernel::time::Delta twice
v4: https://lore.kernel.org/rust-for-linux/20260722214951.72941-1-tomo@flapping.org/
- Make Delta generic over its time unit with Nsec and Jiffy types
v3: https://lore.kernel.org/rust-for-linux/20260717042247.3634961-1-tomo@flapping.org/
- Add new Jiffies type and convert the APIs to take impl Into<Jiffies>
v2: https://lore.kernel.org/rust-for-linux/20260712235246.3069713-1-tomo@flapping.org/
- Fix potential overflow in from_jiffies()
- Fix inflating bug in as_jiffies_ceil()
- Add a patch to convert enqueue_delayed()
- Add a patch to remove Jiffies/Msecs aliases
v1: https://lore.kernel.org/rust-for-linux/20260704132558.2253275-1-tomo@aliasing.net/


FUJITA Tomonori (2):
  rust: workqueue: take a Delta<Jiffy> for the enqueue delay
  rust: sync: condvar: use Delta<Jiffy> for timeout and result

 drivers/android/binder/process.rs |  7 ++++---
 rust/kernel/sync/condvar.rs       | 31 ++++++++++++++++++++++---------
 rust/kernel/workqueue.rs          | 14 +++++++++++---
 3 files changed, 37 insertions(+), 15 deletions(-)


base-commit: 2ea0119f72dba597aa8a98cbdb72c564bfc5cb38
-- 
2.43.0

