Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1F036493E
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 16:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823368; cv=none; b=UX1XbBI/rvTKrofH3gZy1ruYJCetldT4yzR0lon24/8s/K+FLuViqNaUw3uXbqmOEMcrU+WPYBT66U+ep4UjOH49UGHdI4X15lwUGC0A9cs7TTjGQ/xJdzG3plv/YpCNN8g0AR+jMWSFPFJTjcgLUmfPD3AbSnLkrQ9VAAEcoNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823368; c=relaxed/simple;
	bh=eAAR8QRYAU5FUSVKssILFt1d8jQIeSkpT5UQzrNNA4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QEOw1KQqd3VbAKgsnJpx2iS5O7V26+9Jlpbykt/nZQJb0oc5SK9yW9mBVkeyrbz3ddwmw8liXAcednMolXlmyb78pwoxGXaXKUOC0LK0SrGmPCh/9NSfpnG0ryKQlk8Mn3hf9PbxNQsHvZaNb3Q80E8uK3fGP2QZAjFWQyRSnoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PnUV4n3Z; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnUV4n3Z"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39ca300db70so7648871fa.2
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 09:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784823355; x=1785428155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WF4Dbs6zRO0d71RsrP4HchYRm5rd3x9Pi7RivnUfa4=;
        b=PnUV4n3ZjPgXwvfA/iB0SYwzfhdZ3CzGFiIBm8oGGgiinJ7GyTc4ug6WG7USjcwq57
         wMQ+9aEDbhtXEC4NNFemw4jX7D6smXBVKEY/woD87KAIFs8qjwShNh6YnL6ZhBH4Dblb
         s9sA15bRtq3Tj0hlkAvKtw0GTZN1/AazLTARGuV50ungvPBptovE6tGtUYP2gTizs3mz
         aJ1UCmQJ7gSMs726fkgzhkG0UEZOSWmPkHW6KEuMUvtLcoSCzmxZHq6WJFp1f83KSVX6
         HI59u13xI2V4gSGNhqcoILOqvkAb+eKq++q4OpIWy9hoPV5jwjTdiVnYc9OdfFudVDsT
         1gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784823355; x=1785428155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3WF4Dbs6zRO0d71RsrP4HchYRm5rd3x9Pi7RivnUfa4=;
        b=qMNfpfVAG0Ej7JWv9KzzmUkXsZQ58ZAn7bqVY7iPLW2fiMatoDDeHK7jLzHQB7VMEd
         9faBGq/n+VtmRcT24NqSzRBm2KBgZYOCHmBBJEJgEFtiv1VzbIOImhR8bVIcn3q10UFS
         /mshCyTxvwNrXaDAS8G1NiadoGI+7wOUrGZbKhTOwrcbLLYUtFombMBUiNDfXwCVwDeo
         X4sNz8KrYR80ewjvTu0zLe22TldocrMiFtP06p35m8+SxatUHKtEmNSMI07Dt+OOPPIr
         6JkdPYaT9CB8BQK/fraVirz/HmYQkf25oQQ1o/Zy/pL6GEAExR/O9n2ceWEoRQRKUwHQ
         x88A==
X-Forwarded-Encrypted: i=1; AHgh+RrUP7Wb07/y16k4nQnum9JccGumCKo4qPJd/4hYS49QFHUIodZUF4sSAU8ONQCciSEWCYuZOuEpWoEq+Rwhgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUevp+tztbfCPCbkvyXCd/hUQETM+ZIsZ99MA3krrR4R4lVdRn
	YQ1a33eirKVuedTq6WtobXNzYCIun1JaVWOjaM97yR7Gi2RTwKomZl5S
X-Gm-Gg: AR+sD10IpqITgXSQYE95jO/eItzHHchKV6PYRBdfVZdQmK55g50MHOWYXutM2MGJgzX
	X9eXTiwzzKDal5NJVNhAqHeryQrt2Ya/1JSCrUtEQI/cbOS5iu70TPf/pk1NHut8eNtyQd1HKF5
	fxsgqzj18c9jPwjawbu6PiCHpUvnFwg9aIoBq9+l9WAlqZeg7GdwpP8Sy2VIxldN7l2uh5F+kO4
	GA5fyulaYBMIyVuePE3B7ezxkKVHwjyJLh5nQuOkmGuFZ1uv6ZDVw8G4aG9VX+xDpk+Q89UgY1c
	FxXlLtj8kKPLnnO8LmL0ZVd4CcuJiHi1oN6xTg9M0BK6GK6aSjJl5KTwxnTfx4pyMsESJI1qGsz
	8XHT1/qt9cjVpfc1e1RJKBT4sqpULO4BJMbGc7zKnsQc2I4y0zq3koMoObokClmZzmDkbdrcw7+
	2qH2URngdUZzjlUoRiJUCz5niJpsBtznkl9x+Wx2IIJ5odVdsnv1cKnFXkRPykJ5qITEy4vu7qu
	nxl07s8hXwigDc=
X-Received: by 2002:a2e:a588:0:b0:39b:1b6d:5027 with SMTP id 38308e7fff4ca-39f07c70ba8mr7958461fa.11.1784823354940;
        Thu, 23 Jul 2026 09:15:54 -0700 (PDT)
Received: from localhost.localdomain (46-138-176-102.dynamic.spd-mgts.ru. [46.138.176.102])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d8c40fsm9875561fa.41.2026.07.23.09.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:15:54 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: linux-watchdog@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	ojeda@kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	dakr@kernel.org,
	aliceryhl@google.com,
	a.hindborg@kernel.org,
	lossin@kernel.org
Subject: [PATCH v2 2/3] rust: reboot: add emergency_restart() wrapper
Date: Thu, 23 Jul 2026 19:15:28 +0300
Message-ID: <20260723161529.23759-3-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723161529.23759-1-iprintercanon@gmail.com>
References: <20260723161529.23759-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a minimal reboot module wrapping emergency_restart(), which
restarts the machine immediately without syncing or unmounting
filesystems.

This is needed by watchdog drivers that must restart the system when
the watchdog expires, such as the Rust software watchdog added in a
subsequent patch. emergency_restart() is safe to call from any
context, including the interrupt context of an expiring timer.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/lib.rs              |  1 +
 rust/kernel/reboot.rs           | 19 +++++++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 rust/kernel/reboot.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index e692d142c8608..89f0e1f65f6d7 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -81,6 +81,7 @@
 #include <linux/property.h>
 #include <linux/pwm.h>
 #include <linux/random.h>
+#include <linux/reboot.h>
 #include <linux/refcount.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sched.h>
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index a1130c4b82881..e603c07dc53dd 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -113,6 +113,7 @@
 #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
 pub mod pwm;
 pub mod rbtree;
+pub mod reboot;
 pub mod regulator;
 pub mod revocable;
 pub mod safety;
diff --git a/rust/kernel/reboot.rs b/rust/kernel/reboot.rs
new file mode 100644
index 0000000000000..f98a85d19f85d
--- /dev/null
+++ b/rust/kernel/reboot.rs
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Reboot support.
+//!
+//! C header: [`include/linux/reboot.h`](srctree/include/linux/reboot.h).
+
+use crate::bindings;
+
+/// Restarts the machine immediately, without syncing or unmounting
+/// filesystems and without going through the reboot notifier chains.
+///
+/// This is intended for situations where the system is in a state where an
+/// orderly shutdown is no longer possible, for example when a watchdog
+/// expires. It can be called from any context, including interrupt context.
+pub fn emergency_restart() {
+    // SAFETY: `emergency_restart` has no preconditions and is documented as
+    // safe to call from any context.
+    unsafe { bindings::emergency_restart() }
+}
-- 
2.43.0

