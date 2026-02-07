Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E524315539A
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Feb 2026 22:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770504558; cv=none; b=ER6Z1nYhPusIY1ll/DbxujlbfZygxHhKt2YAPN0EZyM7Qt0Gi1lFtsX/4YTCb7+WWBGf2SAXy65gGv7G+YR0OoSOiq2Z7yesy48SgjObmyH/Ky4BhUR+p9uPOv6odhkRLjLlYTdvoKZaPhv97hONklblAfBMEMi2xusS9Xxm8Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770504558; c=relaxed/simple;
	bh=N9pershJ8e4rvEbkF8C/A07Ofmb0EdWd37g1Gj224KI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GtUc0j3oRW7eZS8Ie6/J3VoPAGRYtqL0YBMdHldd68vt8PCaxD9BHRbVTsuAMOYb65RnC2xdtSOl+p+9GdLqwV3S2I2lFWAyUh1terwM79IT/RYrsj/VFGNIe04O42VIKkt2Z6WtgXxiu3H707dvQhdwz4V/1kPSLb5KTGNWYN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdZY7ZhP; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdZY7ZhP"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-124afd03fd1so2536115c88.0
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Feb 2026 14:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770504557; x=1771109357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RAjLQ4BwQYjhZxICswmV4n1e2QMlosSu6zi3A56XsM=;
        b=VdZY7ZhP4SSkokZM07GwZo+TvnP6KFWBbMoPEF3bpFUZy5jgIU/nrSuLfzsG5sRvx/
         3VRAjw7K60i96LTULuUmuUgojFWiajeRh8X1CxRZeVezIzwYUK4fsJJbM8jv1YWl0whB
         LznawH2dHv5ak41/CchgaV3VcGCguYCjGHikuyTvuN7jXJIyOUEAxzPu7u/oJpk+uTEd
         mvPi45/8ZDcysSZpw9FNxUGh5CHe9Qd556mdtAv1I8Pos904+xgAuODQYbudDyN5phlR
         uWenFGv1LTzZzpEZ4o74hxYM8lgqf3+OKLWZIlAx5ULYJnCNHGjvf890FVIV+zIrO4q7
         LQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770504557; x=1771109357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2RAjLQ4BwQYjhZxICswmV4n1e2QMlosSu6zi3A56XsM=;
        b=YTIF8ijdLplaqCgegud42/xiQtu3euaJcQlSlsD6oEiLAHIFp3CC5rWZdg6xznebiL
         nY1cG1Oga//4JOWRrnFkdD2zCG1CdLLdjIcR1g7KQTYqt0di2q5fc3OPZQAphv+MaBJW
         bsKXZTT6ZAw3ou/1QaQF4+qaaAw4kf5UCrpcTqS9bByIhePp38rw3lGowqDJDXXpgUSQ
         M1Mce2cREkq2+zvtm7dN7+E50scHpKYVzBILCFw3iGUDzFOgmvyJyXkq4mTrtzeXTiOA
         YYUOnT+pHN+nDxj0I/8NIRYNm9ERlD8Ko38ulL32Fg4otIIZGNAXebK6BObe/KJUdb2s
         /Z6g==
X-Gm-Message-State: AOJu0YxmFHmn5aO1VU4O/ES+bRncZ52btr2HylYkCjp2UGFvVhR8qTag
	Zs6WFq/CfkhEoX8x+kjkPjAoHV+t5bgqxL9ySEx7fEPIcFw8ucTxeBX3
X-Gm-Gg: AZuq6aIJoBf5DWKkre62vx+7zDfYsh68fUvaRKCDwRNrmPGN3zsAnrjqAJgn9CXY5yA
	pwSDgmJlxELEx13zfpbojaflOJPyWvxD0Jv/YHiCe8J/HKZk8utEWQBejGQu1QiepmecGPXpril
	Fh0qWjan3Qj8H6As1KhA4DdQGp6jvnL7XOvKluJgXfPLgEYkUoF5pK8WUcHKNDn8uGPjx9++no2
	EACTafHVXRJUAU//mL3ROfQVXBBFc8uuBlK5eU08i2lkCMI4Ok4/frM5zlM+QEYfkBAzufVmpDR
	uhWajN9IORpJvQovaXnTTnKMEHwyzQPscam3A9QEa6u1x8jSPvTgpGe1qoSgY7MYuyNkDLp0/7y
	bYVohT3zI71F9/AaNzOwXbSSSkzpARJ8yQrcFEM0TtJ56PyMWZv49Z7yI3Llhg7bgvvBvYFflQj
	nFl96mzHFH0tvEi3wUAWnWqwpnfdvF3yUp4Gju+VfGk+CUf2iCnELS1MO1igtdF0Gu
X-Received: by 2002:a05:7300:e80a:b0:2ab:ca55:89ab with SMTP id 5a478bee46e88-2b856b55787mr3387299eec.42.1770504556959;
        Sat, 07 Feb 2026 14:49:16 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:987e:6d8e:7cd5:6e71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855afdbfbsm4648131eec.11.2026.02.07.14.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 14:49:16 -0800 (PST)
From: Jason Hall <jason.kei.hall@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>,
	Boqun Feng <boqun@kernel.org>,
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
	Jason Hall <jason.kei.hall@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH v9 2/2] scripts: checkpatch: add RUST_UNWRAP lint
Date: Sat,  7 Feb 2026 15:49:07 -0700
Message-ID: <20260207224907.234815-3-jason.kei.hall@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260207224907.234815-1-jason.kei.hall@gmail.com>
References: <CANiq72mB0N3GDe+w8qT_VU1ieMQSRBiEPaFdSVa-2GLDiDMEZw@mail.gmail.com>
 <20260207224907.234815-1-jason.kei.hall@gmail.com>
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
index 56c1bc29d3f2..fa7adaed264c 100644
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
+                   "If the use is intended, please justify it with a '// PANIC:' comment.\n" .
+                    "See: https://rust.docs.kernel.org/kernel/error/type.Result.html#error-codes-in-c-and-rust\n" .
+                    $herecurr);
+        }
+    }
     return ();
 }
 
-- 
2.43.0

