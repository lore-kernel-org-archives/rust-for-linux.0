Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510287;
	b=IW+uCqxbaLp/oCQkoYBtaIfG8fFUwx4JzvlJko/wBI4BvoxNypzHIpa3vtCOcSGWBAy6
	 2jsg6VqW/NOL2xU4FSP7YXrYNfuLK4hRnYuQV7ul/KLzZGDqdV1HFw7nGkY1M8Zj4N+fS
	 ESlg+kbTqA6TM6KAWaE5CbueqEs8ZxjI6Yfa5GZELGsezUlYcGXjYxES4Jet9U5YJiTip
	 WX7S7aQDC5rBy0jzLW9TXSaIb7+z8HllP/ZH7dXQkK5k52fqKuHsbawobCqQ5t2lt7huk
	 +X8QtOFLMWf2UpDzmi2iI5iI0jXyLBCovjFT8zsPUHZHt6Y61PXSI/QsJbXDNq0TzVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510287;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=gD63owEzMiG0c11J7YSppIWr1GVHffvHvAxoSrCh85I=;
	b=MIwOUA/OlUubt4H3ev+7bSNUU1gkE2TA2FnD5Hg0khTih33w4YNIEsqs2FW4TSW1cKnX
	 D+6HO0ychkLivcCejFYbTNO/4L+02WoKQXWK3d9RtHMSeKwc1Eo6MlhRbfZlxtMNf9IjR
	 bMSIIXqLZhI09tBCi9PQNXCpXf7T4n/tpgqwWd2P9mG8z45hIt/unM35oGxLQNvDVcK22
	 YjOdr+IVhVzi5t6XoC/X4vonu9o7V+UPw7neb/j8OZCtI1tTEcKa751VqD1bGc4YrlfO4
	 3cxj/7JX5UARmeKgZYHk0FSN8DGN+idgZwcsTdjqcIQilwSUjON/425FbGeyJ+adeCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onurozkan.dev;
	spf=pass smtp.mailfrom=onurozkan.dev;
	dkim=pass header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=YkuZgdB0;
	arc=none smtp.remote-ip=109.224.244.107
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982AD606A32E
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 15:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 982AD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=YkuZgdB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1792510284; x=1792769484;
	bh=gD63owEzMiG0c11J7YSppIWr1GVHffvHvAxoSrCh85I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YkuZgdB0XDDjHO87WI2JKqLwReIdI9y7CSPCvZiDcDyZlTKWzo6zMofgzq2YrqbIf
	 SlRO9UVahsig1S3zrP8tUtYbSuyTFbx+ftH5DtsU/oikDd+XMlWSlX30IdUhK5p3Nr
	 3PpLjgvMHOee+D0iqlFmk7GniFZ8vr7EPqZT0UTTKHKK0CdCPykDx6BkTz5o/Y2s4V
	 jevpnVIvJAXFZqNnL+QWYjU0OrC+oCP6szqyLZCPeSRYdYhxrztm819rjiRa/f98Ir
	 qdPJrXZz1Iakb8m0EoRqhVGWlQoJK0tG8fwVAiRfjb1IPW0XaTMleAN+ZdYMcwBoat
	 RtQC0DBQUrSPA==
X-Pm-Submission-Id: 4j8GbW4Crdz2ScPf
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
Subject: [PATCH v13 1/7] rust: add C wrappers for ww_mutex inline functions
Date: Tue, 20 Oct 2026 18:29:37 +0300
Message-ID: <20261020153112.299745-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20261020153112.299745-1-work@onurozkan.dev>
References: <20261020153112.299745-1-work@onurozkan.dev>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some of the kernel's `ww_mutex` functions are implemented as
`static inline`, so they are inaccessible from Rust as bindgen
can't generate code on them. This patch provides C function wrappers
around these inline implementations, so bindgen can see them and
generate the corresponding Rust code.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 MAINTAINERS             |  1 +
 rust/helpers/helpers.c  |  1 +
 rust/helpers/ww_mutex.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 rust/helpers/ww_mutex.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 47946f1c507b9..198bb740f7cc2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15283,6 +15283,7 @@ F:	kernel/locking/
 F:	lib/locking*.[ch]
 F:	rust/helpers/mutex.c
 F:	rust/helpers/spinlock.c
+F:	rust/helpers/ww_mutex.c
 F:	rust/kernel/sync/lock.rs
 F:	rust/kernel/sync/lock/
 F:	rust/kernel/sync/locked_by.rs
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 440fb7638e3cb..0287064c82c18 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -105,4 +105,5 @@
 #include "vmalloc.c"
 #include "wait.c"
 #include "workqueue.c"
+#include "ww_mutex.c"
 #include "xarray.c"
diff --git a/rust/helpers/ww_mutex.c b/rust/helpers/ww_mutex.c
new file mode 100644
index 0000000000000..e7aa65ac58745
--- /dev/null
+++ b/rust/helpers/ww_mutex.c
@@ -0,0 +1,33 @@
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
+bool rust_helper_ww_mutex_is_locked(struct ww_mutex *lock)
+{
+	return ww_mutex_is_locked(lock);
+}
-- 
2.51.2

