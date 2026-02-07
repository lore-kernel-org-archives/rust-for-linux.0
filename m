Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB9833D4E9
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Feb 2026 21:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770498522; cv=none; b=ijAsBA3Oj5ey8O//iyvgxiZzZi/mgk1ZlRqTIOpSHTb6hmizMKul0onnCV0MuzyK1b1+en2tvBmzII/GeGjTO0aXG0KMqqNiDcRF3iFbkK8c+9DvbARFuFm3lG9sadOQxutQ/pcw775PzqS1IWcl8AV+O7wW9av5Z0COMMNBn0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770498522; c=relaxed/simple;
	bh=ZIlr47XYC6O3tGdR2UH0kFG4K374+y+PTnueSMvm5ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YwKDj3r8TiIQ3pSmwG99WBP1vmV6dH7u18KKB1sdUhb6XhNCwQofgGt3uNpYu6ow6F+U8Gjoo7SNBuEsuy3sLAgmOayHjkyM8qml6ISJiGNFsTwLjQk1IAr3w62XcL9zzkGNnHxLu2MLN+B3pnAs804mjAWayjznFV9M2oCYkME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkTzTKsl; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkTzTKsl"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1270ac5d3efso1312516c88.1
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Feb 2026 13:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770498522; x=1771103322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCBIlVtV+zq8f7gfIO2xxsTQyhC9pk+Xjp2VgrBosxw=;
        b=CkTzTKsl5YZaXwwVIq/Q/XCExA6+YYmFqpzLtbMB752vVe4TlPSsPrmWlZZQ357U4D
         x+mJ4Q0x8+3Hf3yVhp6sZaqL2X4tczPkn6TmtB0c+1bEWrGdPZG3HC+Qhi1huYZSprH+
         agO0H06nVPQyv0aGjopibodNhDfWupERT2Kb5bRcEi+oy4444EU6TGNS5gFAQjHtnFn0
         8dPkKBl4ZBrzMUWPEDjPwi4SNlvpNG2cArx+w5wa2aTqOjgwkXXj9ts1x7MN/MgrCn4q
         DKLiZWZPD6I72WRQRQDKZNrO7t0zoPCH7lX/G14x1iFum90Ew74ta59qc5upN8sXmaQl
         YH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770498522; x=1771103322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kCBIlVtV+zq8f7gfIO2xxsTQyhC9pk+Xjp2VgrBosxw=;
        b=eHGLG2Gk9KiFXuX1590FH3OpV38BUWzSLKdL2NI3BnIhqNHd1W1JIX646PeYETihrr
         Lm7+a93QKUZiWOEw13Yz7HPMObmdCbUKogIb0zrxjEh89vSTIrYxKEBMjJ3/a1pRLmSK
         K2Vn6Pff3lg+vnU9d8PiAXDiQ622e2jUkCzVdQ+naJj8WSfDKeOyg8X/7uQLpPAzbiGh
         EjJCTm7rMfI6z7zSB1SHzQBbZ/lO4tw01QWhzV9zdXZ5OWe2SL/7+e1Bctn0lWfVYG2V
         glkMlwKyr1/lE3Xn6navNow6ry32p/jqidigmlVqPpSQt5SEu5IjzNL1tO2NfSItffDl
         xC7A==
X-Gm-Message-State: AOJu0Yz8rGL6f6P6aHs/tS0yNTAcTsd8EljDDolSexI5Z1swuNfZnpED
	1QxwEBtJtKNeCkJgjOm21vjZSBH/j/lALhGPTXEVfEXJ/sbvpEI63HFz
X-Gm-Gg: AZuq6aI4LhZ7hJFJeKQ6gY4Tl8YlcV1fkKNEvhp5AbkMPDS8WsymgoE+VKA/4pfZKP0
	jRV4JqklrTch5bD8I4yPSx6gaMd0vy4VqQqNLXoqOrhXslmt9fEjpwD2nJMIixlBIJ+UyF+CQAE
	ruSxxdYywEbuk2DYV8JiLvNRuf89S1QGotOpFgjGor4BwbxXvSSwA/o0bfyRwBSbjt9HP4Dut8V
	8z0/+XU/Na623Ybk8kaU3uuFJ7KzvzzJgm9s1xdOpv6C/EidpraeYAImJLBdAS4xpM7GomcYpC7
	ALnin94Sck9IQGLWVJaA4ukKZALb9YxBnwcTV5dL4e9VmvPFpZ1y7RSENMUw8yezTcwECN4SJNU
	0XByjhA+ry72uVigbhlnmxURFfIZio12SQZu6S6tMk8DPstj+mI7yWATGFIhPwhzE0/JPG4xzzz
	8iKUYHhxwjLXE6E8LQnRdXkZ+J85v0TueJOySsCSYBNnKOjee3IG27UlqQuBuZs0a/geNJLtPH8
	BY=
X-Received: by 2002:a05:7300:7b94:b0:2b0:5028:bafd with SMTP id 5a478bee46e88-2b856453d5cmr2860785eec.8.1770498521927;
        Sat, 07 Feb 2026 13:08:41 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:987e:6d8e:7cd5:6e71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855afdbfbsm4504628eec.11.2026.02.07.13.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 13:08:41 -0800 (PST)
From: Jason Hall <jason.kei.hall@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Joe Perches <joe@perches.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn.roy.baron@gmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakru@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Jason Hall <jason.kei.hall@gmail.com>
Subject: [PATCH v8 2/2] scripts: checkpatch: add RUST_UNWRAP lint
Date: Sat,  7 Feb 2026 14:07:46 -0700
Message-ID: <20260207210805.196759-3-jason.kei.hall@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260207210805.196759-1-jason.kei.hall@gmail.com>
References: <CANiq72kXaFkL34g0V3isOp39VqfN5Oaj9O_A0o1ipERFWhWi2w@mail.gmail.com>
 <20260207210805.196759-1-jason.kei.hall@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Warn against the use of .unwrap() and .expect() unless accompanied by
a '// PANIC:' comment. This enforces safety standards in the Rust-
for-Linux project until upstream Clippy lints are integrated.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-linux/linux/issues/1191
Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>
---
 scripts/rust_checkpatch.pl | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/scripts/rust_checkpatch.pl b/scripts/rust_checkpatch.pl
index 56c1bc29d3f2..9a4e256a4ec4 100644
--- a/scripts/rust_checkpatch.pl
+++ b/scripts/rust_checkpatch.pl
@@ -9,7 +9,21 @@ use warnings;
 sub process_rust {
     my ($line, $rawline, $herecurr) = @_;
 
-    # Reserve for future Rust-specific lints
+    # Check for Rust unwrap/expect usage.
+    # We skip lines that are already comments, assert macros (common in tests),
+    # or have a '// PANIC:' justification.
+    if ($line =~ /^\+/) {
+        if ($line =~ /(?:\.|::)(?:unwrap|expect)\s*\(/ &&
+            $rawline !~ /\/\/\s*PANIC:/ &&
+            $line !~ /^\+\s*\/\// &&
+            $line !~ /^\+\s*assert/) {
+            return ("RUST_UNWRAP",
+                    "unwrap() and expect() should generally be avoided in Rust kernel code.\n" .
+                    "If the use is intended, please justify it with a '// PANIC:' comment.\n" .
+                    "See: https://rust.docs.kernel.org/kernel/error/type.Result.html#error-codes-in-c-and-rust\n" .
+                    $herecurr);
+        }
+    }
     return ();
 }
 
-- 
2.43.0

