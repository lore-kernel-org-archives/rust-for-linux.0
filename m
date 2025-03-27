Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F291A5BBC
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Mar 2025 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092197; cv=none; b=qV/SmjM8gQ4Xl1Tw5GQCbGjtaqsEjXulaQH00/+aaicCJ66JhVjIawehczWpEdxK2dU7n2qUQojXSW5sD1aRBoYZp4ayg8oi7aBICEN51H30x4FhQcunczOmLDABqOWh691+pTiZrNRiJAbrbjTak6BhbYrXWkcyL0Fw39RkGag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092197; c=relaxed/simple;
	bh=0kZ8+s1hi8X5Lwfr6O77wV+9NsOgNfldRMcEDQ/zCLw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n/fZD+o/FuDUJu6b7zRKevrYhGUiVirBIjrN6Irq3iYMoJxd9lAF9FWPPK/dX3RTll0FqUtBxYhwQ5SVLmrKN7vhVj7Stz9Mz1jy0/RB+qt2Pn+9YFOCBPALsSsmhC+OrwXecw9IJfsgQAW2WHEgMgyFZqbJbVY24uiyl+vfLYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jPhiYs7i; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jPhiYs7i"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so9528635e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Mar 2025 09:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743092194; x=1743696994; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VaUAtlAK7rkWH0dXoDqRcWo7p1B2Cs6MnTnXeNVmMUw=;
        b=jPhiYs7iloO+cnvINe/DysW81YKjxpabr6yhYroP1jfgAKNZ0hK7bfVTCd0oDYVztk
         V55MB07aHitk9Zgc8ruZ9eUpcBuuzb0DRNQdFZQ7HkRHF7Jk6akFJtDyiJ87bDzdoyqc
         T2nMkeBDl5g17nJ+tQJvLvLQWVB4BlBsj3Y2ep4mhQk1pB0HUPPbo37DbnIfA4JKWtjo
         gIE57qbj7gqNXJLEKPgT7FZ8Llln/2XegXdr31gGjmtB8p+Dlym7DQQ+X3turiplfgjh
         QzOjGt7nVul2QBz6I5vWhWZPWJzMODeHGC4yiyeuMt8mo9cKzdcAwjMZS9DnBTFRnraI
         RBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092194; x=1743696994;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VaUAtlAK7rkWH0dXoDqRcWo7p1B2Cs6MnTnXeNVmMUw=;
        b=A5bgKKAPHRSkp0of2hrPF8HEi1dDKggvRsXFf41/0ZkwSLZmoK96hNOkMQw5YOYwyy
         QiW4n2Mj/0VYMS+tKVqgQ7jGFerBh1Twd5+UHyuoiTz1V7vr1FRFhD0cUmgSwzaAN3hi
         dRVmf8BRrRH8k+iqY+1y1zZeLI9iZFcW5FzMr92HOWF23fQsaJB/zI/ZvoX3UotbFFAZ
         DDpBBafqxJlngEhpW/wUrAye26c1aIettcQwPxZM9sDUfFPFrhj7GGIP5PcyN3gG8O+y
         9HdWh2rnUIAzQlHb0t4rPeU5+3pFPvM4DwdkhH2pOG4vudZz9UfwZ1uIdUKEk84vIP60
         bopg==
X-Forwarded-Encrypted: i=1; AJvYcCXkDGF17cW+uLIS7gKcTj+T651jeQaAuiExBdBD/JQquVopDQz68cqqE3q+zXC/3k4GTYgzVga7vDWUF/+YUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzswvawowBQUodkyR5LjtLBrUf/+U/vZTjqoSV+kAu7bWUp9aOC
	jzKfo+30qgyFExnHYH7XrDNHNdAF0un4vQLsgFtIwUlJlNYb0+lx65Rggl8PGxDDcQ==
X-Google-Smtp-Source: AGHT+IFfFgkFevlnChGHDq9ekUSceTl3RAIxYVH33biMgaWB/oIMOzih6qbL7rjEcIMzOAy0RkxYB6s=
X-Received: from wmqe17.prod.google.com ([2002:a05:600c:4e51:b0:43c:f122:1874])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3ac5:b0:43c:fa0e:471a
 with SMTP id 5b1f17b1804b1-43d84f5f2fdmr42768695e9.5.1743092194116; Thu, 27
 Mar 2025 09:16:34 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:16:12 +0000
In-Reply-To: <20250327161617.117748-1-bqe@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250327161617.117748-1-bqe@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250327161617.117748-3-bqe@google.com>
Subject: [PATCH v6 2/4] rust: add bindings for bitops.h
From: Burak Emir <bqe@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Burak Emir <bqe@google.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Makes atomic set_bit and clear_bit inline functions as well as the
non-atomic variants __set_bit and __clear_bit available to Rust.
Adds a new MAINTAINERS section BITOPS API BINDINGS [RUST].

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Burak Emir <bqe@google.com>
---
 MAINTAINERS            |  5 +++++
 rust/helpers/bitops.c  | 23 +++++++++++++++++++++++
 rust/helpers/helpers.c |  1 +
 3 files changed, 29 insertions(+)
 create mode 100644 rust/helpers/bitops.c

diff --git a/MAINTAINERS b/MAINTAINERS
index fcc56f7d7f16..11bc11945838 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4048,6 +4048,11 @@ F:	include/linux/bitops.h
 F:	lib/test_bitops.c
 F:	tools/*/bitops*
 
+BITOPS API BINDINGS [RUST]
+M:	Yury Norov <yury.norov@gmail.com>
+S:	Maintained
+F:	rust/helpers/bitops.c
+
 BLINKM RGB LED DRIVER
 M:	Jan-Simon Moeller <jansimon.moeller@gmx.de>
 S:	Maintained
diff --git a/rust/helpers/bitops.c b/rust/helpers/bitops.c
new file mode 100644
index 000000000000..1fe9e3b23a39
--- /dev/null
+++ b/rust/helpers/bitops.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bitops.h>
+
+void rust_helper___set_bit(unsigned int nr, unsigned long *addr)
+{
+	__set_bit(nr, addr);
+}
+
+void rust_helper___clear_bit(unsigned int nr, unsigned long *addr)
+{
+	__clear_bit(nr, addr);
+}
+
+void rust_helper_set_bit(unsigned int nr, volatile unsigned long *addr)
+{
+	set_bit(nr, addr);
+}
+
+void rust_helper_clear_bit(unsigned int nr, volatile unsigned long *addr)
+{
+	clear_bit(nr, addr);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index d4a60f1d6cc4..0c25cc86a52a 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -8,6 +8,7 @@
  */
 
 #include "bitmap.c"
+#include "bitops.c"
 #include "blk.c"
 #include "bug.c"
 #include "build_assert.c"
-- 
2.49.0.395.g12beb8f557-goog

