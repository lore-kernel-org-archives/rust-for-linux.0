Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA591367
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 00:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763338271; cv=none; b=UMAUYuHctRCmSUBi2arIL+hvrBtCGdTgiXRoaD/EM0UAhdK3QNwg799tEOqki0KXMDiBJgSb8V87N+jJgxeL/xTfiao/enXuKlNjGv0997HrYdVWWJVGZ1MA2w3xYAHCW1+LRTJ/5My2WzUJ7ERVeO0t66ko7uQ1u+GML39lAcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763338271; c=relaxed/simple;
	bh=ixegunF99YxcLZrHPgAGDGsGqxBx00q+mi/Q4+peVBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBd2D6ZVv6km/msy3qqxA3WNbQoBhUssJSUY7IKK61kOCfXpbithmtKpT7q0ud+ngBvv4yOEgpTxzJDYWc12BXTnIzAMQezpRBB6PX6z0KrF4TG3rhW5dilVun37blgeBnghhvqtEx3XSvE/v6T7fUTGCRAuKKEsXcpXvSTdmQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvCrQZit; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvCrQZit"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-297e264528aso36603775ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 16:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763338268; x=1763943068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=645GVh1KvEQzLzVaYNXkwV6FeQ0jFg39TZs9/qVLDpw=;
        b=JvCrQZit9bQQ/OSg+A+fxkx32lDtkS/5Yy9dmiPN70WmnkXN8E7Z8deoDt4pphXpry
         FLDjX6OYLdm98piYW57GfVzIF5gGRSsonjq4BlAERVYMgI31Sq4w/ubbeVgWTzmkYqZ1
         S7o51MgDcTtgGwZ25WOOwFG2U4bvXFeqqdUuNAl808i0Q8NrVpVbWKiAHk6MF9YYTuw1
         /2M+tePxs/b52pa+wPWweDLYwnGEnmIL46QxLduiR7qB1hHb7IUzkyNu2UbSnnyyLeEO
         tIoD3oJQfmAmYBauvGUzwEAYHER+AXyoIWUp8xVdcyqc31RSqFIW2YdXkim6J2DUgQZU
         7XUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763338268; x=1763943068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=645GVh1KvEQzLzVaYNXkwV6FeQ0jFg39TZs9/qVLDpw=;
        b=SLhELhaJ8hJ/H1Es9OgP1oYeBw4ugmaZSSrjvFPiDVFDe4tYcq8kY6l4IeQ1VndA40
         TGXRr3Z8YU9tNgYTVN+8tUOLvlTJhI7/1lnq38zfmnzH/GLWwqyG7U70tdOZ2g8NvibH
         uDK3dwG63gJXYz0J2nil6hAM6T0c/L2ZyP/abnYq3Ys5d0zcuB31np8KSWqZiua/dm/G
         JXVfO0zbN0CPHGILIFwPuKWNyGBWt9ZZ1dR0XhMgOh3TNJcLc/yd7SY5zlEiQ32BqwPl
         3NJqsKHTdgC380etpkcq2yHQugIzvY/y8+dDzLFa1bmfpUmvzxfHTGdSoHakxkutbYqE
         Vyww==
X-Forwarded-Encrypted: i=1; AJvYcCWxEVOB8jEhk2SmsP/2MeBu5HdOMWViAUiS0dnvS38wrWHO34NwuLPGiQkZqSsdRZr4605R7WaqVHqzQmO5rg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+mUpa83jNT8/XTcFOTdibMWQwbkt900OSXaE4lcjitILft/gE
	bGAmKzeGCnLdqbLeEAXS+Ncsag8+mxwQg+/HjaNl8dYltfvHc0wP+5CD
X-Gm-Gg: ASbGnctGFlNS5VXqQ3f05qO+zYKj/nRpDsibs3gvuRsyquNsEWp1gEOtVoKg8IKMpEy
	Phn4KVcIjrPSnYqblXlh787JO+U5fhpLDhNA1AcvSTVjAVpJAXnQ7oel1X76u4N0Y6WLZbpSVFl
	05K7vm2FkKls9VyPkg6u5Bkoe5NEf2h0SxFj4uL8StghoCntoO+HvyJv4QThRLjgfTIq6lfFAQ+
	n8m5JtMIolsP2FvJXRer5nU18vwQbCbQKfOPRW9jEwK4Pvjar73nIeqqiaGZlq4sbe2jNvPOuZE
	thf6TQXYjENxUWBw1exUuwS+18ddTU5nAUz+L/BZ0cacwvweZIHBFZiKgP22tI2mrtJZcukTwDk
	OGV2s26s2BnFEFhVi1SQWJqPPmMmNbQROlex6h4JHvf3ia1tD1OKNYDnKJDi/wICmeNn0dn4+yX
	95/j4Ac5tTY3E9/VMJdT27JDKVhl6XE9d0qbAJMMp93hJdGI1m+jbG7HhiUo0=
X-Google-Smtp-Source: AGHT+IGym2eoUsKx8p3WUBhPNEs8TEyUEgg7fF/M+uNUt7Kedzz6UjZtEcoqXaO5ZBKo+TWzsVApjw==
X-Received: by 2002:a17:902:f792:b0:299:e041:ecf6 with SMTP id d9443c01a7336-299e041f532mr33141375ad.40.1763338268513;
        Sun, 16 Nov 2025 16:11:08 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf0f8sm118374365ad.89.2025.11.16.16.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 16:11:07 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v2 1/4] rust: sync: Add i8/i16 atomic_load_acquire/atomic_store_release helpers
Date: Mon, 17 Nov 2025 09:10:32 +0900
Message-ID: <20251117001035.4068507-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
References: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add helper functions to expose smp_load_acquire() and
smp_store_release() for i8 and i16 types.

The smp_load_acquire() and smp_store_release() macros require type
information (sizeof) to generate appropriate architecture-specific
memory ordering instructions. Therefore, separate helper functions are
needed for each type size.

These helpers will be used by the upcoming Atomic<i8> and Atomic<i16>
implementation to provide proper Acquire/Release semantics across all
architectures.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/atomic_ext.c | 23 +++++++++++++++++++++++
 rust/helpers/helpers.c    |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 rust/helpers/atomic_ext.c

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
new file mode 100644
index 000000000000..d05f6f7ba10c
--- /dev/null
+++ b/rust/helpers/atomic_ext.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <asm/barrier.h>
+
+s8 rust_helper_atomic_i8_load_acquire(s8 *ptr)
+{
+	return smp_load_acquire(ptr);
+}
+
+s16 rust_helper_atomic_i16_load_acquire(s16 *ptr)
+{
+	return smp_load_acquire(ptr);
+}
+
+void rust_helper_atomic_i8_store_release(s8 *ptr, s8 val)
+{
+	smp_store_release(ptr, val);
+}
+
+void rust_helper_atomic_i16_store_release(s16 *ptr, s16 val)
+{
+	smp_store_release(ptr, val);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 551da6c9b506..6f1c4e2faed4 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -8,6 +8,7 @@
  */
 
 #include "atomic.c"
+#include "atomic_ext.c"
 #include "auxiliary.c"
 #include "barrier.c"
 #include "binder.c"
-- 
2.43.0

