Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD1A3EFD1E;
	Tue, 28 Apr 2026 10:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372506; cv=none; b=WvEESCMAxCTr9cR2/A5k+wIxLJ7ISi8LlCoZMvIwCyg7iroCMfB3z0zXl/wqu8z9R5nPlMDbmP2N2/7NHp3AgpB2QbbMNyNd5dtoZPtmg6ZuqF5Wp6kVq5g71Bu++g96IcLI1sKfx4T20ugPbhOjp0GSzfP0hhpSEuICsq8wyI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372506; c=relaxed/simple;
	bh=sFsnPP/TjA49FCwCuJLd6D0kqm266fCKXuwd3Kh4q0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JvBXKD4Tgt9DgWCtwdIwQJ4X2ZDCJ5/jKW7A7uiLpKG/LqtTL/ydhzgMJetz5UCSEZ5FwGJFpJVWxtpFtYm4WlYOK26koRtoidFg+uk+jLgnyk7hKaRWUvWVIx9pQMNwFprFiEW+riPDV9Z6xWlnYNB9t4WLRSH/UHpvImpPt+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=KyCb5AOj; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="KyCb5AOj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1777372486; x=1777631686;
	bh=7Jzgvk8C4Ksf1LMZ0sj5siyM620cpHaF4e21fQG7iio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KyCb5AOjXS+nJYxTSSIAmoN4bJRP4iU27Me3C48aD7vKUUX3VMEJjvAKDL0ZutCh1
	 RtcIljn70TrWlBDEu5tzInXJXck6Xyup4sThW2qxvrVQMStBQNhOG8ynqfw6PC3C2G
	 L5sjvPPTHmR0PbEoez9BIonyAqfmpMk6FRLYyykNBdYUmQ8U5LmTQsI/7icP7qyHOc
	 PmguM5gfXBRUEiTYXevK3507dbi2S5pOLIn01reLn70FqOlcyv9oNI3xwXnGh035jD
	 h9oPZ6zUKByAdxu4nU8z19pYesc2S4QSe2lFxB/LaLkGW/NzNhh+3d4yq0jeMD4YBD
	 506DmJSASnvjg==
X-Pm-Submission-Id: 4g4cJ43855z2ScWp
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rcu@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	fujita.tomonori@gmail.com,
	tamird@kernel.org,
	jiangshanlai@gmail.com,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v1 1/3] rust: helpers: add SRCU helpers
Date: Tue, 28 Apr 2026 13:34:35 +0300
Message-ID: <20260428103437.156236-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260428103437.156236-1-work@onurozkan.dev>
References: <20260428103437.156236-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add helper wrappers for SRCU functions that are exposed to Rust
through generated bindings.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/helpers/helpers.c |  1 +
 rust/helpers/srcu.c    | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 rust/helpers/srcu.c

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 875a9788ad40..052fef89d5f0 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -60,6 +60,7 @@
 #include "signal.c"
 #include "slab.c"
 #include "spinlock.c"
+#include "srcu.c"
 #include "sync.c"
 #include "task.c"
 #include "time.c"
diff --git a/rust/helpers/srcu.c b/rust/helpers/srcu.c
new file mode 100644
index 000000000000..e9f723d7f8c9
--- /dev/null
+++ b/rust/helpers/srcu.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/srcu.h>
+
+__rust_helper int rust_helper_init_srcu_struct_with_key(struct srcu_struct *ssp,
+							const char *name,
+							struct lock_class_key *key)
+{
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	return __init_srcu_struct(ssp, name, key);
+#else /* !CONFIG_DEBUG_LOCK_ALLOC */
+	return init_srcu_struct(ssp);
+#endif /* CONFIG_DEBUG_LOCK_ALLOC */
+}
+
+__rust_helper int rust_helper_srcu_read_lock(struct srcu_struct *ssp)
+{
+	return srcu_read_lock(ssp);
+}
+
+__rust_helper void rust_helper_srcu_read_unlock(struct srcu_struct *ssp, int idx)
+{
+	srcu_read_unlock(ssp, idx);
+}
-- 
2.51.2

