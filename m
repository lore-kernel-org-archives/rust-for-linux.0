Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEAA19C546
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Mar 2025 16:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092193; cv=none; b=gsh8LFtD82Z2Fu4FHjgL/k/G67wA9KbThHfQPpVKINdYtAj82W2xSyjk+Io6vSUrCR93HR/5w24LfT6+VrDAv6Jd3D+vRN0eqqwM5iH5V8RUhIx43e0D0Pp9IH7QWy2NO6Iesn+ToqaP6VW+xoDkB1WmkjLjKBbeoMEBSJGwk9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092193; c=relaxed/simple;
	bh=DJ3l8AAi2y7Bjf4lrz1BPuSe4xV+NNoCmhCPbhBoqQ8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N4WFkw7rHv6TXsZS5ZF/rfAuQ45iojcQU4XlpbIo8H9sx6j7MhwRER1NP7cfWhN2wHyDSGci7AMLOOzjH2JTR+fWMyxHQ1LvG29+AvvU3xKaAKhrdoWuftpN/jpOYubxKc43z0ImNiRrXSPR9WxXdQJnYbdzPyft2RsDupPH3wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IsDtpLxm; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IsDtpLxm"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d08915f61so7849565e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Mar 2025 09:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743092190; x=1743696990; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jVCo02UsJU/zo7xiESrCiw99iEGW/CKOsPYB+kkzIkg=;
        b=IsDtpLxmRX32FBSrluyrZ/lSJBccbTliO/VnOKxvAZql3CggedE2GYObMUs4XkBaoK
         Q2rw06zKCLoZpVG7IWkoWIP1S2z+h6N4JzMAHZzta9kPMdK4FhJO+CAZ1qwJJQSN4S9e
         8ReWPCpbV90vXJCOcgFsSW3i6iF4kU+vCG61zqirNXOOi83/OhaOA59BhD+7UFYnDOTW
         Rkzxg1qzjadXaWMwKIL93MYcBwajYz3PD+pWtwCxRMaT1yyyAkRWSg6/7kiXqOhQDSh+
         AcANeFRrEkvHd+NWr9oiVBxpUhndaqGUnYq2BRId7zWM3c2jxiojBTpWIUqdU4p1zN0y
         vAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092190; x=1743696990;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jVCo02UsJU/zo7xiESrCiw99iEGW/CKOsPYB+kkzIkg=;
        b=ZfWllJ42i+L7F1qh/5ZrCzJEuGKaYxLqdkQyXOUKwkPfnDfL1HDWoItgzasWwBEA5W
         fgKLQbPkJLhH9VZtdTItV2vkT+0/wQcq0FPaTiElibpVVxf0ZTgliJuz+4ESl1RPt+Ac
         1PI5xrJ8835/0YiyWLBwIDkRN25EwNZDhqQZj/jn4g0N+hP/PSTYUlxKePoxTdj5F53K
         JApiXxshYG8ZktbT6gqUV5aPwwyU8GiagFAwu1wum/WB+wHt5CJbCnNSpnCAixTuSgFr
         Zx/mVEepGhfg0IVdREpUx4y9w/YrupPU6fiMNyinWsXxTtH+TI8UdRWkL4nyS1N6fosr
         ycYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtQpzI3z1rn9mcbu7hJ9duhf3GXKLeGLgsdnmGbp9dAIubosJ1mpMmzudjoLsv0Px/+v7qNJ4ItVQXKzMrNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyjCXQQs4aDhaz2FN5DlZtaaWUvgriO7wKI/biWMCZDyOG8zBU
	4E9dON9n6eraZmIWgJiipFp9Q7d+xjp/9bBld3AYOq9WFZxi1LXnB51VzWxjp8mPUA==
X-Google-Smtp-Source: AGHT+IGoBjiRSejFmjP8iJ0SeXPa1D6aN89hHsn49x8IJBqor4vNKOZKwZX15/zupbqFCYQzdph1j2g=
X-Received: from wmgg20.prod.google.com ([2002:a05:600d:14:b0:43d:50b6:b62b])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3489:b0:43d:36c:f24
 with SMTP id 5b1f17b1804b1-43d84fbbc7dmr47731695e9.13.1743092190794; Thu, 27
 Mar 2025 09:16:30 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:16:11 +0000
In-Reply-To: <20250327161617.117748-1-bqe@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250327161617.117748-1-bqe@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250327161617.117748-2-bqe@google.com>
Subject: [PATCH v6 1/4] rust: add bindings for bitmap.h
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

Makes the bitmap_copy_and_extend inline function available to Rust.
Adds F: to existing MAINTAINERS section BITMAP API BINDINGS [RUST].

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Burak Emir <bqe@google.com>
---
 MAINTAINERS                     | 1 +
 rust/bindings/bindings_helper.h | 1 +
 rust/helpers/bitmap.c           | 9 +++++++++
 rust/helpers/helpers.c          | 1 +
 4 files changed, 12 insertions(+)
 create mode 100644 rust/helpers/bitmap.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1cd25139cc58..fcc56f7d7f16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4031,6 +4031,7 @@ F:	tools/lib/find_bit.c
 BITMAP API BINDINGS [RUST]
 M:	Yury Norov <yury.norov@gmail.com>
 S:	Maintained
+F:	rust/helpers/bitmap.c
 F:	rust/helpers/cpumask.c
 
 BITOPS API
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 2396ca1cf8fb..1d96fb915917 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -7,6 +7,7 @@
  */
 
 #include <kunit/test.h>
+#include <linux/bitmap.h>
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
diff --git a/rust/helpers/bitmap.c b/rust/helpers/bitmap.c
new file mode 100644
index 000000000000..a50e2f082e47
--- /dev/null
+++ b/rust/helpers/bitmap.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bitmap.h>
+
+void rust_helper_bitmap_copy_and_extend(unsigned long *to, const unsigned long *from,
+		unsigned int count, unsigned int size)
+{
+	bitmap_copy_and_extend(to, from, count, size);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index e1c21eba9b15..d4a60f1d6cc4 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -7,6 +7,7 @@
  * Sorted alphabetically.
  */
 
+#include "bitmap.c"
 #include "blk.c"
 #include "bug.c"
 #include "build_assert.c"
-- 
2.49.0.395.g12beb8f557-goog

