Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCA533A014
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 14:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795267; cv=none; b=dPYbi9KsWHGie2asDN7NSdBEV4KBh8cgjW/BFQqnBWIHCvsK8ZnDXY9cMyXvn051IEqYuB/UGu23lLyEmYFsIraW2PiwUOSMi2qnsVXYRrEAomJR9TpJMjSpZEu8z5J6BUJpeSOPBtZ0NzjZD023a3jAomYt8APju0t5EiONx5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795267; c=relaxed/simple;
	bh=qIIDxwU+gRN0J9Y/XOJnAtu6bIjjcyMHsSeCwy1O+Ho=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=c2fijydi3n96sK1exnbys0aQGGOZ59+lGdgkOp02evUnevwVPFPSslBw4IpymBPPY3BHnFWzO7coNKKwTr+fX0gHKkptw6qa2cTq264sVTDsH45rkJfTg7w8cUr3jasZam2HU8JwYgKg1Ou00qX5Mg2sWtCEget6dYTSJZhy1s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kc2tkUqy; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kc2tkUqy"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477c49f273fso21857335e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 06:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767795261; x=1768400061; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SP4x8oSAn3OalDjXoKfMn5MKf18OIomQl5FEfbN6xrE=;
        b=kc2tkUqyV7F0zYY+o7qn/Psnw8iUuDQQbZLD2/xdKEUwQW8ya5oMIEUy0Agm0F1WNt
         8ln9SUpNmwO+34h3vaE9JC8qN2eW9M2udbd66sFEzAhlZTo7lqSyvL3pHxbXnHlVzNw7
         HTpk/QaIW2H8+FzNJiaWWI7KUO+Vy5kIx4upnLHtbuVflIERgyTkArGAJiccxOc4DJR9
         s4dOyhtz3slmiBpmTA3rH65llVmLXn3AIS6WA3cTc1cFOlp8G+jo/It1kIPF0GXNMT+v
         Fl2YkI2+tJ5tQCr0XlETLUJb4DYx/NFHgLrIefmsxXvNW56239Le+x5hJAXUYDPcsNns
         cESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767795261; x=1768400061;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SP4x8oSAn3OalDjXoKfMn5MKf18OIomQl5FEfbN6xrE=;
        b=SYYx9JB918jgj5hEfRlAvNyfE3nkQbn/kk/tujxoucGQQMhZ9np7oMbd831Geg1BYQ
         YYoHuDJC2nhCajZV3F93sNq1jQq53rx/QZcaz5Ev0EowuNOfTWrCDnHlc6CZrnO+7WTn
         V3RJmD6r90lCYpGPwrh5HaDVFSMeSVUNHxTLObQ0QD7sFWk3sU+Dl6z0nBvUQN4qmxIC
         MV2SYlem5tveT3YLIDX2YdfS8T8aWAO31wjrlFBS/JtJZD2Yt0tVknEDd66RnoVrTjKj
         WS4FFQe3pZrAiVeqAMcl7kf1WQxHGl3Hw9Arr629N1WjkfWNtTmCDL7EC8H2Ia/MyTpx
         i0sA==
X-Forwarded-Encrypted: i=1; AJvYcCWm35dSvpQqFgPETRe0qJQxuGSyUvpZ+6PJvvHhz7l/dd62+sKI/j21GEj2kzrxwDYStRCH5rTw17EFqV99vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJlfx2oeptXE6Z7NUeGjDDLeVhv7gzQ553HdCp7pkLdKFqiV1W
	2DoD6E/qNOXFjX1gU86OtojC02qdYjLZdXMQjy6MC8lrQWpzbh7F8Z46jDPqtYB1KEaBC1EtxD2
	ylBeEPCuvdfb1xtshXQ==
X-Google-Smtp-Source: AGHT+IFonxD1C10LsACIOJKgTPD2ahlXYMddlN1ztjE4qBDwoRr1FvilHq5PsdSKjgB7A2IBkJvhjsfCzg89C4k=
X-Received: from wmaw7.prod.google.com ([2002:a05:600c:6d47:b0:475:df4b:95a9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:630f:b0:477:7a87:48d1 with SMTP id 5b1f17b1804b1-47d84b3b4d7mr29441295e9.30.1767795261667;
 Wed, 07 Jan 2026 06:14:21 -0800 (PST)
Date: Wed, 07 Jan 2026 14:14:13 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADRqXmkC/x2MUQqEMBDFriLz7UCtoOBVlmXR9lUHtMp0FUG8u
 8XPBJKLElSQqCsuUhySZI0ZqrIgN/VxBIvPTNbYxlSm5WU9wLqn/2/CvEHZI0gENzW8C4MdQqg p15tmf77nz/e+H8xe2XxpAAAA
X-Change-Id: 20260107-move-rust_helper-define-63edcfb2bff3
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2330; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=qIIDxwU+gRN0J9Y/XOJnAtu6bIjjcyMHsSeCwy1O+Ho=;
 b=owEBbAKT/ZANAwAKAQRYvu5YxjlGAcsmYgBpXmo3uziZjcnpjLG8GJ6Xh+Q54kGb7EQZrTonG
 mQzlaZSxM6JAjIEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaV5qNwAKCRAEWL7uWMY5
 RsHQD/jvrEkqhQ4MPaVqT91h86Ml3X9W1+UqsiwXDPk1Jed50skKfqVG854RTyGYBZjIvlRi2so
 mqY3Ua6a3/skytuTadesTxajFD17ycxwyU3U7Niod30H9x7PRe7wHU/IUEK3d/hPZTGhlEe1dgh
 X71LbAi7PuYcSy8Q5ELyu+QgsD31ZxMNoBsY666d8hyrk24Co21dAvir6xjQ/K4jauAk7cKgiph
 1evYKf1iUfUwEhjzDOXdQ1R8fwrH3X5n8oR1y+iRQRDK7XK2k1DHivqWo/iBlXsm7vWuBX/6sGo
 Z4cp9+zgLRGcDRhE6znxwssuYRa6ixq6PvNpLOJ4vsutMQ1OcG454Cwj99TawHHMA4P/v1Jjc5I
 Mb7NnWR5HzQ3P7//XXFRzitszOVRZzx4OA/Xz93HHB8flvhghRbKyjZfHc1MoTIarvFNXphkXIZ
 iCGXzJqYyy1L95JcFW9Y9RZ1uK7QcLQZMYlM4Bu07RXBCcGCtmDXTnAvleZ2f/kgz9dN3BSXBSD
 DBxLZgLlZOcJSgL5Ii4C7a4vSFCnc/QoV6tCzphTW2VEmXfT2DzL+bKQiErCPEnT2Hu9OI1eYEy
 JW7nIYn+80r0a+tQeILPa4Q9Dd5c7Jm7Bw3NhGXLT5oqKMR9cR4y1fJ+MyZdch2+Obxn+i4lwDR KyQYj/Mv6r8Ht
X-Mailer: b4 0.14.2
Message-ID: <20260107-move-rust_helper-define-v1-1-4109d58ef275@google.com>
Subject: [PATCH] rust: move #define __rust_helper out of atomic.c
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

We were lucky that atomic.c is the first file in helpers.c so that we
may use the define from it in the follow-up headers [1], but this is
fragile. Thus, move it to helpers.c.

Link: https://lore.kernel.org/r/20260105-define-rust-helper-v2-0-51da5f454a67@google.com [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
When I send the next version of [PATCH 0/4] Inline helpers into Rust
without full LTO, it will be based on top of this patch. Regardless of
the timelines for the other series, I think it would be good to merge
this patch soon.
---
 rust/helpers/atomic.c                     | 5 -----
 rust/helpers/helpers.c                    | 2 ++
 scripts/atomic/gen-rust-atomic-helpers.sh | 5 -----
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/rust/helpers/atomic.c b/rust/helpers/atomic.c
index cf06b7ef9a1c559e8d7bdfc2bcd2aeb8951c29d1..a48605628ed73ac32aae2e6280481407a670e88f 100644
--- a/rust/helpers/atomic.c
+++ b/rust/helpers/atomic.c
@@ -11,11 +11,6 @@
 
 #include <linux/atomic.h>
 
-// TODO: Remove this after INLINE_HELPERS support is added.
-#ifndef __rust_helper
-#define __rust_helper
-#endif
-
 __rust_helper int
 rust_helper_atomic_read(const atomic_t *v)
 {
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 79c72762ad9c4b473971e6210c9577860d2e2b08..a86fab743d1dc951373e5ff05278c6c7872ef491 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -7,6 +7,8 @@
  * Sorted alphabetically.
  */
 
+#define __rust_helper
+
 #include "atomic.c"
 #include "auxiliary.c"
 #include "barrier.c"
diff --git a/scripts/atomic/gen-rust-atomic-helpers.sh b/scripts/atomic/gen-rust-atomic-helpers.sh
index 45b1e100ed7c63108ee6cb07e48a17668f860d47..a3732153af29f415e397e17cab6e75cb5d7efafc 100755
--- a/scripts/atomic/gen-rust-atomic-helpers.sh
+++ b/scripts/atomic/gen-rust-atomic-helpers.sh
@@ -47,11 +47,6 @@ cat << EOF
 
 #include <linux/atomic.h>
 
-// TODO: Remove this after INLINE_HELPERS support is added.
-#ifndef __rust_helper
-#define __rust_helper
-#endif
-
 EOF
 
 grep '^[a-z]' "$1" | while read name meta args; do

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260107-move-rust_helper-define-63edcfb2bff3

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

