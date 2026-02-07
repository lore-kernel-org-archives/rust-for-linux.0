Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658F7314D35
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Feb 2026 22:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770504556; cv=none; b=glBRbcc6N4JWXCEaacSbAG9fWrpux354H35UJyqCr3ok47HGdvB0xbJ+WYW0ZnKZlhoGGSCVGxI03p7uJrYYD6HCJZdPj8kyujo66vqZCmxYbDqnZZQJNTf4VTV33el4erSGMQ5cbfC0QIMoqeAz/UZd9ZLMmkGr6mg12hOkSc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770504556; c=relaxed/simple;
	bh=uQirNH56o08PQezOI08ix5FjG39GPzqmN/bNEBVo/4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XLZ7iHVXmZliZSQTsVxljeOu9Levd3OAuyxQ//hHhH+PBepRMzqoUtnV6tXvK1725ey7nwFoVSaWFfTb0J5PtjDxWBBzGDEM6aeIj18RMD+BR7YFugbjzhJUDKmdXvx0t+zoG/2S+B+Qq27ARXKQYkc/ARMBl/eedsPA3gEwMsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PwDaZQ20; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PwDaZQ20"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1271195d2a7so1441745c88.0
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Feb 2026 14:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770504555; x=1771109355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EcHLlTg9s6jqE6NFJ8zFZFNhespaoej6nRnFgBGlWs=;
        b=PwDaZQ20N5L09YiO6s2WDz/wSEGdYaE3HwcVzu7FR2DNfjoGXy6IXpEvqobGF5keDY
         nC3mvv8eunpmuTVjRR9FrE+y+0w/zxX46GXJraNVzeSNz0aDtjdJViObKGWxoYGN5GRR
         t0La0XJ+VNmuyru0wtbsuWwjHFKOCK4k/2a7YuOC/wUqKK7JsOpmGR+9f59Wb3tQ9gvW
         hYSFu4IW1Ab4SZLfdiQUorFLJufrodbazdtp7PsLHbrRhab6Nn1Q8YvIjYyJwGJYwOIg
         cCmxolOC0Tpa8F10/Qb9u6Kvhgl0dtyJxvVSIt7cDttgpAj1md3fZr8RFaLeWZfarjXY
         Svnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770504555; x=1771109355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/EcHLlTg9s6jqE6NFJ8zFZFNhespaoej6nRnFgBGlWs=;
        b=UcckWqCKbgUX8+zq3F2C20M3ZnKSIotyOtqi8jAxvIueLc4xtzqe191rTCCd5YGZG/
         1wU5qY0CwBb9qaAZy4Whfo+4GjOvgMGyPc80NX0yHcZu8Gnkmkc/98YphmlkZ3n6AUXv
         c5M0xvPC0IVjKcZyUA4jQbe73qI/ZyGRdrQIPEI8l/gDnxt0EL5YuLbR9Ia0D//VzJOG
         P/ngI6ealafrmZ2zKQGKc5c596dEt2/r6IIF2Zky84cpT8uJn5SZ/0SOi3WN4N6dt2vz
         d+PMgbFrSphVacpBO7KBkorp0dsStE7hTeeWwedCFTMbgoacyrn8zQd8empIaWjVKTgo
         Sh/A==
X-Gm-Message-State: AOJu0YyUovwzINEpIPP3k9CwIgOc+23++odoD9mU47OiRNgeYeT3+288
	svDeytOiq+qSh3+7hmcB59cszqgkE1bP7n2XR85P4xMu4nVGWdMcOwQH
X-Gm-Gg: AZuq6aJtzPNf2I18tc8lTC34zkxD6v0KpvfWxc//GFnDB1n8PK88Z7e1Jgu5MD13m0R
	oCMUL0bMoCmkGCUmBTWaMX7PJBSgLWvYHpxswKhIjMzXoEvshjJ/LMDjKkQ3W59IyR0xtgJ/DYB
	Ju3BjA7FVYaPDXifQi0r+vz+jwG/qn9Vh2CwmNlwNGUmI316HK3zyt0t5zIfvG//y5Qv1nJNMoN
	y2denCqWEwSnPTMd/3KNVQ6BRGzCNhc+xXakwYvMQUnTbCMA1T+15dTvbNFOX+9WJe5h6UIkOmw
	MVn2LvDGUn9aiONxj25ODHCwiY3+bWvAf1lmAfv7gwCWZW4aRuh/FmBy197PG0pUE94GsrRF9tA
	g+BJ7jXN5+oOi/ufORTAns+KkFhtpE5QVa7YIGhk9tpaOP/IWKVlqbldabKgr+RqJ0mPcykw0Ec
	UaGWJRngMcelPXxEXO1b6Osy1sXi2oy06PAo0IZii5DVQG/pPFgasIQZq7forVZBgV
X-Received: by 2002:a05:7022:24a4:b0:119:e569:f275 with SMTP id a92af1059eb24-127040597admr3161433c88.30.1770504555446;
        Sat, 07 Feb 2026 14:49:15 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:987e:6d8e:7cd5:6e71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855afdbfbsm4648131eec.11.2026.02.07.14.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 14:49:14 -0800 (PST)
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
Subject: [PATCH v9 1/2] scripts: checkpatch: move Rust-specific lints to separate file
Date: Sat,  7 Feb 2026 15:49:06 -0700
Message-ID: <20260207224907.234815-2-jason.kei.hall@gmail.com>
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

Create scripts/rust_checkpatch.pl for Rust-specific linting logic.
Add a conditional loading hook in scripts/checkpatch.pl to call it.
This will allow Rust linting logic to be maintained independently.

Add a new entry to the MAINTAINERS file to track this new file.

Suggested-by: Joe Perches <joe@perches.com>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>
---
 MAINTAINERS                |  6 ++++++
 scripts/checkpatch.pl      | 14 ++++++++++++++
 scripts/rust_checkpatch.pl | 16 ++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 scripts/rust_checkpatch.pl

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c0bdd08b74c..57831dc30e6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5880,6 +5880,12 @@ R:	Lukas Bulwahn <lukas.bulwahn@gmail.com>
 S:	Maintained
 F:	scripts/checkpatch.pl
 
+CHECKPATCH RUST LINTS
+M:	Jason Hall <jason.kei.hall@gmail.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+F:	scripts/rust_checkpatch.pl
+
 CHECKPATCH DOCUMENTATION
 M:	Dwaipayan Ray <dwaipayanray1@gmail.com>
 M:	Lukas Bulwahn <lukas.bulwahn@gmail.com>
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
index 000000000000..56c1bc29d3f2
--- /dev/null
+++ b/scripts/rust_checkpatch.pl
@@ -0,0 +1,16 @@
+#!/usr/bin/env perl
+# SPDX-License-Identifier: GPL-2.0
+#
+# (c) 2026, Jason Hall <jason.kei.hall@gmail.com>
+
+use strict;
+use warnings;
+
+sub process_rust {
+    my ($line, $rawline, $herecurr) = @_;
+
+    # Reserve for future Rust-specific lints
+    return ();
+}
+
+1;
-- 
2.43.0

