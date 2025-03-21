Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD37221F11
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 11:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742555744; cv=none; b=Umaa9/abM+FJ56yeRiZfp64+inLcIAMz496xj3P9V8e7F5mxFRyGYAaT9+116xchWjNMcu/81kPBNMIzXA2TZyFJYWhopX+qBxO7g1IxcBuSxu2gZ3dDJrBGf/YU+LIAWbnlzMc5uoMY/rCZdJz2sFnrYqt+9saVgzcySHh9bq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742555744; c=relaxed/simple;
	bh=xzU2U8Tg6RaH5YVD0OhcoALiAFkKUwlfC3vwPKPRAW0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HL5uFbQv4wQLQmnB8nkD0qPGe3deeTn9OqAeaKbxFIUXMcXPbU8FLV5aJaEPC5Ql+wgByzvW3RT8qrstGoa8id7CQyOgTccmbuDIqoRCMEQhOplQDt2Lu48y51kFOUGe4xgq6OG5/XhbGx5JjcsWTE6DIcJfFWZKBdAsbjAtRzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V9r8b6yP; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V9r8b6yP"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-399744f742bso457184f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 04:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742555741; x=1743160541; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=e9l9jOABoEmBEkPNOBmOrnz+1aYc7dVjPjZ5YKKldPs=;
        b=V9r8b6yPVDY48rfsRsmPq5IXJ0nEo/QabRkkkqcWvew2urtAjRmpBF/voWKXUKTFww
         a/Ac5HX2MyZb1PXCdZh3XmDxXqvgLqSgsRE2VoDIN9+qGJgLjAC9tDD71n2NRUJyxfHP
         8jQcIS18uil0tdSBezExnlbRD828J6UCLus9d8EWjFnauI5ohbb3nyQ548PhyodPCIWO
         J35vLk3lP72q+TMzZYE3jqXnKRuMAXehICYJpEuUuXxlNgz48rq/wrgUz2C0qgdYDmI7
         lYWNZkHj89iwc31l2wiXb38WHL/cbgp/lQzaq7N1k0/RYlw5teD1Ms2Agr/JISlJ3Izd
         XZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742555741; x=1743160541;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e9l9jOABoEmBEkPNOBmOrnz+1aYc7dVjPjZ5YKKldPs=;
        b=AVQ4s7loyUwqwV5xj1/ufjrZkZQ2gCsSI5pY3+z7Wp89cC7LrU8RMiqPrBzKwj44Pg
         i2fDl8JhNliZkAlWC1QNbFLUOzWY07v5oHjnh0uktf8J28IZXgM8hjJjC8pa4p83LMnM
         oChZxracZirv5iRsgRJPzikkSlaeZc0hdaXk8Vly2ANTCop/zQIoFzI1d6uRtKkh6iwj
         4JZnc1EXF9KezONFBNNcM10bMuSi3KcfD0FOY6CFWIAcUumrGxzKAYkEIcn+2Lrc6qTa
         GZUCxRnnu2LNJ6eMxAyFZ8aeiY5Q9voKWDieLHmTPpwMfuS6lK/GZec7IAeKhz9Tc8dZ
         XpAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1uQ2lmQWCQrfEIcZH06nqmc27AmZ09DN+3dpCadUmNxxGI1Nzs8rgA86m6EhGfif61ZNRk4n3VpHK1ygRHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjksD3tynaxKl8PEQrgY56ggjtLC3L5uuMXYGFeUj9WOnNkro/
	h13myPoRqKlH9chG2GuvEvfPDBouaNmOEl9CZkzPmL+YZ50Roq3G9Qx96zVp04lIiA==
X-Google-Smtp-Source: AGHT+IENnDn7Sf9vDxkMDVLe/4bPcM0V5nZNDWetOUrP7e98J5PzBDVdkDpMiV/v1C6kmEQqEdYaaOU=
X-Received: from wrd28.prod.google.com ([2002:a05:6000:4a1c:b0:391:34:3b34])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1fa7:b0:391:4743:6dc2
 with SMTP id ffacd0b85a97d-3997f904e8amr2972797f8f.25.1742555741165; Fri, 21
 Mar 2025 04:15:41 -0700 (PDT)
Date: Fri, 21 Mar 2025 11:15:29 +0000
In-Reply-To: <20250321111535.3740332-1-bqe@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250321111535.3740332-1-bqe@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250321111535.3740332-2-bqe@google.com>
Subject: [PATCH v5 1/4] rust: add bindings for bitmap.h
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
Signed-off-by: Burak Emir <bqe@google.com>
---
 MAINTAINERS                     | 1 +
 rust/bindings/bindings_helper.h | 1 +
 rust/helpers/bitmap.c           | 9 +++++++++
 rust/helpers/helpers.c          | 1 +
 4 files changed, 12 insertions(+)
 create mode 100644 rust/helpers/bitmap.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ebf7fa9a814d..52fc47a28b4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4111,6 +4111,7 @@ F:	tools/lib/find_bit.c
 BITMAP API BINDINGS [RUST]
 M:	Yury Norov <yury.norov@gmail.com>
 S:	Maintained
+F:	rust/helpers/bitmap.c
 F:	rust/helpers/cpumask.c
 
 BITOPS API
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index fcefe3068a28..4f9374c2d7e5 100644
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

