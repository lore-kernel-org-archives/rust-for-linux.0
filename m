Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B254289821
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 16:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747671457; cv=none; b=gn+sUtsMkEHDA1OJ2wjVlhMjcLxd76pZir7zOo4A1gANl5UUo5yiV242NR10sJxEyn9McbFmCfbj6ro2Wd+vUkBTEw9g5irtFdFubEvSHOfj9/tSavGfRQzlGNijj4qaXJ2+N8M9dNdGIsALCShl4e1TMqUucHqM3jidPSx1fTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747671457; c=relaxed/simple;
	bh=9OXo2mm4zTvrDpEWPXsdwUcmAvEmqVu3gp27qTaR1DA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FBAlPbbCy4OwxhweHC//OFN/EwWqhnkj5pU30y/XaYiBLNNDxIsBccoJYuFlbwCBJ4VYOGne0hXOBqL5qtK5AN9VH0yHw9gBOEAUN0gN4PqhptyX7ROSiZxDIwB4exWy/UnJXaL2vmFFXqVrRN2fmiT9WNxjcXefaRMBvdHPHcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vdYjXcTD; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vdYjXcTD"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-442dc702850so3634495e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 09:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747671454; x=1748276254; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xi3xovkHr/TA/Q9MkIz3HdK8OZ1bO8szRf5CN1p75gk=;
        b=vdYjXcTDDISeVsfBvQTVFrw8dCJH31nmCkVZOhA02GrxuIYxGZJ0jxbPIoEIxxmyey
         VGw7lyGicVNsi9gTU69xcew4pQKtyQy/C8piB5f9x1z+d0Xw9dbIKpqlmqFkk7qXfpcb
         IBEZCfQolmlYcoAdxDQrIW/rqrutw2ulEs1hck2iiCL/3CbvnoOZ7osCzETzTE8zw4zG
         O3NMyVI9TIu83npYJvYbG/8wECMVk9pHrCD/Nbjgqa+1hyK4whGjfVBSVELXfcC51pKw
         QM1mWKt0JXI4Peo1adCVRmDLyDwLmO+Tn4L2tyUvfJ5L8U5lYcj2xUlzvcnHhYWaf82M
         OsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747671454; x=1748276254;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xi3xovkHr/TA/Q9MkIz3HdK8OZ1bO8szRf5CN1p75gk=;
        b=jZ/13U771nnE2g3dQyG+OhJTLXyT7/SLsVkMes9qjnBCcqkPPeO6AmYsn8Pt1Ezf9V
         ZK9DX9eRdNtzP/uWx8Kr2gp80jKogBwu31EnmEewfpCxReR13ICNwGXBYmSP+yih/jHy
         rFH+B0Auh/wX/Hm87kPqLwpe81rDQb8VtzJQMLhDT/0vO9TzpAQoRPBRABAek7m92JyN
         ei/FxKiH9wx7Q8TRqE2JfCM6Ptl6YwUOr+aq2lTDWazBqF+QJwagszF0jTU95aMEV+QJ
         099XueO1UggjuSV/cFgfJKOGY9ReVtjW2auv0TQurgivmYqFbAgdWWP+RBLENgzBsEFL
         jSOA==
X-Forwarded-Encrypted: i=1; AJvYcCU/PoS94KuSgjO/lwIPff9PuoRZ9xISGqpvWHB2BpyllUt5ds95owli+jaNjQRiQ1yicMlArh31FWCd8covoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBXQsAuYXgH2CnpjbnsO+OMAJwEe2ugBH5oSORAQGRQuiDIZeT
	wu9WL078s5X/B0/fPWlnOYElotDPYMxEl3HTs55K+bXzvO2VG5ILfYNt42GgJIAYzr8diw==
X-Google-Smtp-Source: AGHT+IEDywwP0TbHb8rwq4xsvkZ8rXPn0wk9YIEpc/zYAcY8JgnR07Gpr6ugUtORaX2FrzcOWh/6rQc=
X-Received: from wmbay27.prod.google.com ([2002:a05:600c:1e1b:b0:442:dd0d:556b])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4688:b0:43d:2230:300f
 with SMTP id 5b1f17b1804b1-442fd5a160amr147107165e9.0.1747671453952; Mon, 19
 May 2025 09:17:33 -0700 (PDT)
Date: Mon, 19 May 2025 16:17:02 +0000
In-Reply-To: <20250519161712.2609395-1-bqe@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519161712.2609395-1-bqe@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519161712.2609395-3-bqe@google.com>
Subject: [PATCH v8 2/5] rust: add bindings for bitops.h
From: Burak Emir <bqe@google.com>
To: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>
Cc: Burak Emir <bqe@google.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Makes atomic set_bit and clear_bit inline functions as well as the
non-atomic variants __set_bit and __clear_bit available to Rust.
Adds a new MAINTAINERS section BITOPS API BINDINGS [RUST].

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Burak Emir <bqe@google.com>
Acked-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 MAINTAINERS            |  5 +++++
 rust/helpers/bitops.c  | 23 +++++++++++++++++++++++
 rust/helpers/helpers.c |  1 +
 3 files changed, 29 insertions(+)
 create mode 100644 rust/helpers/bitops.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 86cae0ca5287..04d6727e944c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4141,6 +4141,11 @@ F:	include/linux/bitops.h
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
index 92721d165e35..4de8ac390241 100644
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
2.49.0.1101.gccaa498523-goog

