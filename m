Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750C7298CAB
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 01:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770255743; cv=none; b=soFxOj7bo8CV0DaF5Eqqlk4Z6btd+hOdteJNudOhZGPGAVKn9ACPDtxRsM7sC7UIa0kPPsyf/IXXasRkAEU/hpv8e59ymnLwYb5bx5s5a9dfarJ7OUparfYItpY/lk36bsxtmwUsE0+nP4jBDXQ1oamzehxtHbzXyCNTjkr9jPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770255743; c=relaxed/simple;
	bh=gn10Y6NPKsCmNVsWCFH/QBmf5hMYk7Hi3FCUJAjJ12U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ONRgfJ0hAukxgiX/l7nHHtv/snaWEIeCODQHtUassYXdaXvCv733K53EiVNwEz0CU3sl2krl1ZX9wVTLVt2meEq7CZCNleRdf0+COQeiM3YXCqh6XHfdQba5DJR7tv5ntpJQ/z7NvGfHmfiqkSL7JWlH8aHsErpjT+ISr8lR+z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9iVNaCF; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9iVNaCF"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-124a95e592fso1494360c88.0
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 17:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770255743; x=1770860543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fC9JdQupaFL0bYrlsOyosUwyhZcdzFHaPEvPFp+Yb/U=;
        b=m9iVNaCF4k5sHMJBc9ibSLfRKZTUZXg4IDzQamIILrY1OrswCpWgUOWosLapnqjiLb
         sv+2rKk5pRzMXSb8GMAXpx8iijeImvqIYtLLm3iS8hl6Jejs8C4ueteCJEpFeoP1ItCJ
         VkAzKYW8lMq0KbsT5/L75ph7zhIP+BPh74IymWlVqWyiD2lw8gMzF3xyBzWhHhmYgWL6
         MsHvvu0lzrm4vRKhnEv1rB7RGOGJmQle4d+4r42IlU6a6ztwDw34VSgehnGLt/OCT3cZ
         v9EafyanmFua0ez1H8JmijfbulT+cCNP2p0XWVlSmI1O0+h8cN6quEZY2llqJBS72UAb
         U1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770255743; x=1770860543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fC9JdQupaFL0bYrlsOyosUwyhZcdzFHaPEvPFp+Yb/U=;
        b=UIom2yDa7Zattj0v+UYXluKmsjYwf26qKG2UgvwLxK2z/h8skqaywr9EH/gXWGKtw7
         nPit61N0NFfTcQGxlQEKwrg0DP6rdfHd8rHVUJnLk7/R9AV+zAmqrzNLMCIFzhe/6Mly
         AwwKvzsS/PoZ+4NSK2ce7sMqeQMwqnRjxutwRgSb8kRmEcz4Zl1JjHW23d7eV/dAFq8D
         RyxqybbO3epgH0uh/7NZznNFPWzrmZDKoKVlD91+iUTHnrbWxefVpauPssrG+paYeK+q
         FBKJTuX/HfBRrGVxjaVSxuXeKMAYUqGrGpamqnk7cLERuuM4YtL1ke96NASIBauHNe1M
         duIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXVJAXlotlkaa2dPLPXHWKg1ya3W6be6hcSWAtqs7FnFL7QH2Ko9yT0IzvfgEGSrh62Sox6l1FnXHhzQ8YzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrGeKwlNFNgHIbXncXxm/DOTZng53lCKqnNpl8OulAzgMTCcKp
	VeXw7a0JeeQGAYsOYJzEQFkqkK47rtwVZeYxHf6PczIoNnSf/FfjMxfxu+qHaw==
X-Gm-Gg: AZuq6aL3gMfoXQns6i71G6cQNetXB+3Ednwu+XHNMu0kt6BRWP7IijlhyBDxBVBs2Y3
	LHan9KEAQ3/DH1Xvz9eXZAsvrtkEagtKe4XwFv8kLp8yuFLOXVATGfvn4PuveBaVnsQ0acDjBy9
	xybwAd3RVaGh3B3Cf3jiu5P9IY4Zx79ktUZWZxv8WEB4GdsexWNov3qD6v00k6YXqel7nuPM4CK
	BQQsvHIMqq58htOBRPAXvC4qKY8/9MaOoYQ+HmhN0ljaqEsqapQcyvrM2EdIdZDCTnDNVJNgDY+
	Re4njMnKxV8mXjP9Cll/xp2fudnilxMEemr2Gugn2tQLT8gGIA61rDHQEkvw+H0jyhY+sD2h/9m
	j4KlYiZ2VTXKGfkuoX0Ipna8grPYmdM0Zbt4HYZxH61X4N5rCTltEXm6cr1kkc0KTUjUYkKzlRI
	kfpJk16uvxWvryL+zJ0MvbyJwFu+pXWFgLVIaqwmTqd3WF61PifELghu3r08el+NE=
X-Received: by 2002:a05:7022:f103:b0:123:345f:5d9c with SMTP id a92af1059eb24-126f47720f4mr2264866c88.2.1770255742414;
        Wed, 04 Feb 2026 17:42:22 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:ede3:2250:7779:19b7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f4bb8b02sm3377242c88.0.2026.02.04.17.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 17:42:21 -0800 (PST)
From: Jason Hall <jason.kei.hall@gmail.com>
To: Joe Perches <joe@perches.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Dirk Behme <dirk.behme@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jason Hall <jason.kei.hall@gmail.com>
Subject: [PATCH v5] scripts: checkpatch: move Rust-specific lints to separate file
Date: Wed,  4 Feb 2026 18:42:18 -0700
Message-ID: <20260205014218.2202385-1-jason.kei.hall@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <a798e6a368639f7a1ce633a6dfecd088d6ed4123.camel@perches.com>
References: <a798e6a368639f7a1ce633a6dfecd088d6ed4123.camel@perches.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move Rust linting logic into scripts/rust_checkpatch.pl to prevent
further growth of the main checkpatch.pl script.

Warn against the use of .unwrap() and .expect() unless accompanied by
a '// PANIC:' comment. This enforces safety standards in the Rust-
for-Linux project until upstream Clippy lints are integrated.

Suggested-by: Joe Perches <joe@perches.com>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-linux/linux/issues/1191
Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>

---
v5:
 - Move Rust-specific logic to scripts/rust_checkpatch.pl (Suggested by Joe Perches).
 - Add conditional loading hook in scripts/checkpatch.pl.
 - Updated regex to use house-style comments.
v4:
 - Use imperative mood in commit description.
 - Fix patch formatting and placement of '---' separator.
v3:
 - Use non-capturing groups (?:) to optimize regex.
v2:
 - Switch from \b to (\.|::) to avoid false positives in strings.
 - Add : to PANIC comment check.
---
 scripts/checkpatch.pl      | 14 ++++++++++++++
 scripts/rust_checkpatch.pl | 25 +++++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 scripts/rust_checkpatch.pl

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index c0250244cf7a..f75cb70ad0dd 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -20,6 +20,12 @@ my $D = dirname(abs_path($P));
 
 my $V = '0.32';
 
+my $rust_checkpatch_available = 0;
+if (-e "$D/rust_checkpatch.pl") {
+	require "$D/rust_checkpatch.pl";
+	$rust_checkpatch_available = 1;
+}
+
 use Getopt::Long qw(:config no_auto_abbrev);
 
 my $quiet = 0;
@@ -2947,6 +2953,14 @@ sub process {
 
 		$cnt_lines++ if ($realcnt != 0);
 
+# Check for Rust-specific lints
+		if ($rust_checkpatch_available && $realfile =~ /\.rs$/) {
+			my ($type, $msg) = process_rust($line, $rawline, $herecurr);
+			if ($type) {
+				WARN($type, $msg);
+			}
+		}
+
 # Verify the existence of a commit log if appropriate
 # 2 is used because a $signature is counted in $commit_log_lines
 		if ($in_commit_log) {
diff --git a/scripts/rust_checkpatch.pl b/scripts/rust_checkpatch.pl
new file mode 100644
index 000000000000..69db5ded7371
--- /dev/null
+++ b/scripts/rust_checkpatch.pl
@@ -0,0 +1,25 @@
+#!/usr/bin/env perl
+# SPDX-License-Identifier: GPL-2.0
+#
+# (c) 2026, Jason K. Hall <jason.kei.hall@gmail.com>
+
+use strict;
+use warnings;
+
+sub process_rust {
+    my ($line, $rawline, $herecurr) = @_;
+
+    # check for Rust unwrap/expect
+    if ($line =~ /^\+/) {
+        if ($line =~ /(?:\.|::)(?:unwrap|expect)\s*\(/ &&
+            $rawline !~ /\/\/\s*PANIC:/ &&
+            $line !~ /^\+\s*\/\// &&
+            $line !~ /^\+\s*assert/) {
+            return ("RUST_UNWRAP",
+                    "Avoid unwrap() or expect() in Rust code; use proper error handling (Result) or justify with a '// PANIC: ...' comment.\n" . $herecurr);
+        }
+    }
+    return ();
+}
+
+1;
\ No newline at end of file
-- 
2.43.0

