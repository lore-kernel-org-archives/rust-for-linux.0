Received: from forward100b.mail.yandex.net (forward100b.mail.yandex.net [178.154.239.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB09F849C;
	Mon,  1 Dec 2025 10:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764584961; cv=none; b=APhalVhcUUifcZ90P4w6sIlUApZMyCQmFtrTak/L/f3XCb9/IoCTpNnEbJd54A8Ig11mxQh7OGeso41hxyUmC9kURMecw/uaY00z5Qcnz8B3DOwUXjKLBme0+GXmdu1q1R+QlKwBpjxY4l2Mb7mEHCb9ElkdvR6EW/wqTCvX+PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764584961; c=relaxed/simple;
	bh=WqB6JNPv3gJi9R8OfwklKcAej1KKOMnsaU+KWUmdE9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fbnoFCiUSTuLeKfDzVr8gMixnCezO5if7UJkTFtT9gp+50ukpDCAlW3ZLgGtgkgULWjYYWiqvBEN+gcH61eFNZ29uKF5zkcxqLb0p2sBt7WGE8I1UfcUIrGpWhYQ6lAUJjOKMgI6LGfDw+ueZZYvLyNupyEhxm/IgtDoGMq9eY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=IxvtlwVw; arc=none smtp.client-ip=178.154.239.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="IxvtlwVw"
Received: from mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:8a9a:0:640:e327:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTPS id 2F70B80CAC;
	Mon, 01 Dec 2025 13:29:10 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id wSfJU4kLMiE0-IBiVCnpX;
	Mon, 01 Dec 2025 13:29:09 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1764584949;
	bh=QrQ+327j2W3iit6ugo4sNV5cBkrdyg3asiiz3F9bmS8=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=IxvtlwVwfzXw2O+NIVXkYtMYKQ365MOK+hL+FGi9aRAl/umwV063SENXNM5RAmQqe
	 u2ckQfMBlzrvGXN2W/UOfuAnPPBMD9RExWwmvUeI+FO25aYL1U10GyoKnYiKq/IMJI
	 z4J5nlWbBN23YWVkTxsgX8Zw80KJLFgseww6RFdA=
Authentication-Results: mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: lossin@kernel.org,
	lyude@redhat.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	felipe_life@live.com,
	daniel@sedlak.dev,
	daniel.almeida@collabora.com,
	thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v8 1/6] rust: add C wrappers for ww_mutex inline functions
Date: Mon,  1 Dec 2025 13:28:50 +0300
Message-ID: <20251201102855.4413-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251201102855.4413-1-work@onurozkan.dev>
References: <20251201102855.4413-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some of the kernel's `ww_mutex` functions are implemented as
`static inline`, so they are inaccessible from Rust as bindgen
can't generate code on them. This patch provides C function wrappers
around these inline implementations, so bindgen can see them and generate
the corresponding Rust code.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 MAINTAINERS             |  1 +
 rust/helpers/helpers.c  |  1 +
 rust/helpers/ww_mutex.c | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 rust/helpers/ww_mutex.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e8f06145fb54..bc6ea9cc1588 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14546,6 +14546,7 @@ F:	kernel/locking/
 F:	lib/locking*.[ch]
 F:	rust/helpers/mutex.c
 F:	rust/helpers/spinlock.c
+F:	rust/helpers/ww_mutex.c
 F:	rust/kernel/sync/lock.rs
 F:	rust/kernel/sync/lock/
 F:	rust/kernel/sync/locked_by.rs
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 551da6c9b506..58cf14d74516 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -59,4 +59,5 @@
 #include "vmalloc.c"
 #include "wait.c"
 #include "workqueue.c"
+#include "ww_mutex.c"
 #include "xarray.c"
diff --git a/rust/helpers/ww_mutex.c b/rust/helpers/ww_mutex.c
new file mode 100644
index 000000000000..61a487653394
--- /dev/null
+++ b/rust/helpers/ww_mutex.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/ww_mutex.h>
+
+void rust_helper_ww_mutex_init(struct ww_mutex *lock, struct ww_class *ww_class)
+{
+	ww_mutex_init(lock, ww_class);
+}
+
+void rust_helper_ww_acquire_init(struct ww_acquire_ctx *ctx, struct ww_class *ww_class)
+{
+	ww_acquire_init(ctx, ww_class);
+}
+
+void rust_helper_ww_acquire_done(struct ww_acquire_ctx *ctx)
+{
+	ww_acquire_done(ctx);
+}
+
+void rust_helper_ww_acquire_fini(struct ww_acquire_ctx *ctx)
+{
+	ww_acquire_fini(ctx);
+}
+
+void rust_helper_ww_mutex_lock_slow(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
+{
+	ww_mutex_lock_slow(lock, ctx);
+}
+
+int rust_helper_ww_mutex_lock_slow_interruptible(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
+{
+	return ww_mutex_lock_slow_interruptible(lock, ctx);
+}
+
+bool rust_helper_ww_mutex_is_locked(struct ww_mutex *lock)
+{
+	return ww_mutex_is_locked(lock);
+}
+
-- 
2.51.2

