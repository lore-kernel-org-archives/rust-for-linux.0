Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA67144F547
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 10:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800861; cv=none; b=rT6LEgJOC35M2xDuUI1qlXcMBAIzkzJDttUbQaFaOJiJ6YYigIqiH4ScytGS5ClRcPhTONK5nsaGhP12R4r2DxXx+ni58lwlr/T+erX0MO8NLhbdxawDo1OmTrsgqmXicPFUN70iogTj4zGmB69pr07fv7DtgeOzRF63+W+ye4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800861; c=relaxed/simple;
	bh=mlmypqlOBKNWF0KHgRUFyrIZ2pAdEWA3H8lYfe7sdag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UtrkREG835AbQDbW6zvmA5/Wj+3tR7cfnrIIsrx4bIAY3hpTr72d3LTYAIwhl1cy+/dQOBtI4cWLXJ/1uQZhW5BR8pWrBXNxDK+B2klZ5DiqEmbD1eC2pYABipWv7M9Ya8mQHbDWAAo8IkshumZoSJv/CmW1CaThAKq3ibJnKy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=fk0PqGCf; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="fk0PqGCf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1791800849; x=1792060049;
	bh=WkSuftk/ZsRVEuUQ39aa2eTrOU1ztb57+YgJSChS8hA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=fk0PqGCfvdUppvjCK9HuNEI7n1wO1ETEJ0UWQ+WJD/7vDXY7bsjYw62oRn2lApDjs
	 OevGFmd7rkE7cZB+ozbzeMV/z7ObDCHRSBotrgPRaYduqOGbMdbbUy5570Pcje6Z2M
	 mig0vWGqK33gIm2vZle0ey5aBmMBIaTjhpB6mjtjIHOYiI+Je8Xajo/C/aUn7YoI/x
	 YTO9BjoKEgXdJH6oxRNGjVbsvTp65XgyizLyUyzQWJjYFYJ/P52cu7fF/+SB7VAyhG
	 BWKOpZyILLm5QvIS2XCBjXajQtGWLZ9HcISHUpNl9E4VEojY2OHoQ1gwepj2KNh+9C
	 5I/CjCHTUUuFw==
X-Pm-Submission-Id: 4j3DDZ1HDRz2ScXF
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	lossin@kernel.org,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 1/6] rust: add C wrappers for ww_mutex inline functions
Date: Mon, 12 Oct 2026 13:26:28 +0300
Message-ID: <4942155a8873e7f4015c5eda57ffb974a2261705.1791799752.git.work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1791799751.git.work@onurozkan.dev>
References: <cover.1791799751.git.work@onurozkan.dev>
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

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
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

