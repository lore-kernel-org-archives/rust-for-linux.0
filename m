Received: from forward103a.mail.yandex.net (forward103a.mail.yandex.net [178.154.239.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1B9299922;
	Sat,  3 Jan 2026 07:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767425782; cv=none; b=aUPYXAKkXQEbkIVbQWU7nbsNzhaDk7Bs3SEk1tuOY9OgT5OJHhMY7gNdwjSQMJ0b+tXtX6bF3ocYIOZMCNJZ8b1mZlo1F1W2QEQqzw/l71M9zYe9g42wyhTrOUfEQOkSQTpDQfXhwT1jXU6vqyh+DMzlQ0o7ydfg7/IWuyCyacw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767425782; c=relaxed/simple;
	bh=2EVSplVnK7R0RFPqc62S106ZcYBEfbsD9zMBWMzUI8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NQAtUEzQ+IVMZllCSJVjXvfndRoS9Z7xJgbR72ObbQ5RwFZjpIzWlQsl8d9Yzuti7xwXwRpjafGjOmoVmYt+gaW+Tx4mIEdSggb+i0GYmRU9elSIkSt6jEMXebzUrDrHmdJfxX3+HBImBp44QhdowhuEwX3fyUQmnf+X0tmEWt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=W6vPIlVE; arc=none smtp.client-ip=178.154.239.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="W6vPIlVE"
Received: from mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:2804:0:640:a3ea:0])
	by forward103a.mail.yandex.net (Yandex) with ESMTPS id 2D05A8087E;
	Sat, 03 Jan 2026 10:36:17 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id vZgUW4MHrmI0-dN4qSzGr;
	Sat, 03 Jan 2026 10:36:15 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1767425775;
	bh=23tOmmBtRzPwCEyTF8gBAW2nUgVB9qSXyEXIMs1Iu8A=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=W6vPIlVEn0NQNobGE60TG3TELh/GtFgftj0ZUZyVZfL8aTyPPjmealBFoXdQ7JJKU
	 8OZpD9RZ2viaDUg6ZvUFfwIhUnGNRiFB2pFrAUDYHk2MVABCvd84yLz6osU51xg3IO
	 2MjVrWoP5wnk3A9vGZ8xpy5EtuUWpZUDkcMyNvJ0=
Authentication-Results: mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
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
Subject: [PATCH v10 1/7] rust: add C wrappers for ww_mutex inline functions
Date: Sat,  3 Jan 2026 10:35:48 +0300
Message-ID: <20260103073554.34855-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260103073554.34855-1-work@onurozkan.dev>
References: <20260103073554.34855-1-work@onurozkan.dev>
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
around these inline implementations, so bindgen can see them and
generate the corresponding Rust code.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 MAINTAINERS             |  1 +
 rust/helpers/helpers.c  |  1 +
 rust/helpers/ww_mutex.c | 45 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 rust/helpers/ww_mutex.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 765ad2daa218..d245b7b38b21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14728,6 +14728,7 @@ F:	kernel/locking/
 F:	lib/locking*.[ch]
 F:	rust/helpers/mutex.c
 F:	rust/helpers/spinlock.c
+F:	rust/helpers/ww_mutex.c
 F:	rust/kernel/sync/lock.rs
 F:	rust/kernel/sync/lock/
 F:	rust/kernel/sync/locked_by.rs
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 79c72762ad9c..a95fb3abaab3 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -61,4 +61,5 @@
 #include "vmalloc.c"
 #include "wait.c"
 #include "workqueue.c"
+#include "ww_mutex.c"
 #include "xarray.c"
diff --git a/rust/helpers/ww_mutex.c b/rust/helpers/ww_mutex.c
new file mode 100644
index 000000000000..2ea19aafbd4e
--- /dev/null
+++ b/rust/helpers/ww_mutex.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/ww_mutex.h>
+
+__rust_helper
+void rust_helper_ww_mutex_init(struct ww_mutex *lock, struct ww_class *ww_class)
+{
+	ww_mutex_init(lock, ww_class);
+}
+
+__rust_helper
+void rust_helper_ww_acquire_init(struct ww_acquire_ctx *ctx, struct ww_class *ww_class)
+{
+	ww_acquire_init(ctx, ww_class);
+}
+
+__rust_helper
+void rust_helper_ww_acquire_done(struct ww_acquire_ctx *ctx)
+{
+	ww_acquire_done(ctx);
+}
+
+__rust_helper
+void rust_helper_ww_acquire_fini(struct ww_acquire_ctx *ctx)
+{
+	ww_acquire_fini(ctx);
+}
+
+__rust_helper
+void rust_helper_ww_mutex_lock_slow(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
+{
+	ww_mutex_lock_slow(lock, ctx);
+}
+
+__rust_helper
+int rust_helper_ww_mutex_lock_slow_interruptible(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
+{
+	return ww_mutex_lock_slow_interruptible(lock, ctx);
+}
+
+__rust_helper
+bool rust_helper_ww_mutex_is_locked(struct ww_mutex *lock)
+{
+	return ww_mutex_is_locked(lock);
+}
-- 
2.51.2

