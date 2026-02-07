Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9679F3382E4
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Feb 2026 16:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770483190; cv=none; b=goYZzGvZXNzmVJ1ampNMyh4YfOzrHR03/3TBIpJSGwir1GWRORvFhioOLQysIURZHOxFPZrqxTHXWUbPQ/XMyPI0AGCp7pgLV3Tcag2ihRhJdRBH3Bmyl7ZTHweLN+zKotpr1CJCWBEOEQd7jNX6C3Z9tYt6KPLKd2KsNw4gyhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770483190; c=relaxed/simple;
	bh=1PFEnQSQHK+HxFV+EnhDucivwjFM9S83+Z/X8r6YxYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yn4ivdmJs6AMt68zeg0cv4bCGDIcnS7OiwZVwiG1yHlIQYIVexabctZNcGKFEc7tXrTJ4IvL+naGqCKxxnldJDCqPdfv0VYlzYrM8q/mhHcLAa6GUs2GwhzquzysPUuqJsZkzRL6+bovndTWBReIgpNaZHHZow/23fSFeyUHU8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAO94GJ+; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAO94GJ+"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b785801c93so4353337eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Feb 2026 08:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770483190; x=1771087990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bn5hyN+m1LqNXQxKRBXBAhoYRIb38PYsM30rn8LzHo=;
        b=NAO94GJ+upNZ1xjZlVEaTmcENOuVfl6cQgqcd+gWHkWBG/ydmYzNkZSE3/vJ+gXpbc
         POa7BjOQE000A/6lhy9QVLbqBXoPiPuJchhE4iigqksloLvUqjYCwZGqaQW/myWPBRIi
         yy50ijtjBHly1sn7n5Ot6n7LxGEahdizUeWt8lnTXlTshzt1wqOaGoT/bLR4Sgbxnxf2
         9S0pPOvIo4APKQUCrppHywmYjbjoDBOXzkZFJYlTvH+IngnBYdRT4W0R/8+AGYZB/dNz
         +poNtOkDnAKs6vpj62sjYK0nLzn77bmijFRGjttRAwFes++CisW1qptO+DRuuGhfri1f
         9WoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770483190; x=1771087990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9bn5hyN+m1LqNXQxKRBXBAhoYRIb38PYsM30rn8LzHo=;
        b=mmBJ2bHBHyI424B1GNFPxyA/T0RIIklqJzmn/dGTRIbKC3oNLzsvWa2zGtQEhyqmig
         ZzKsjWtTAfBMT1XblGC6Qg7cktTxGBKJzPckE1RbSyvHlzMODfQxFY2S69fv9TCYTyl1
         M9XEX500DsYmN3xJnnps6hdOGKqdbwSdizb1TNkilMz1J6qNPlbSuZA+kafSG4sY8VEl
         tY84qzriild1wBdsZq1l7g0QwOSjcU/cuR+58KbruhsGCnLn+DKMulGFHxiaIr86P8U3
         A/T3GIbfo9PrR3pw4ssB3zRzLY1A7ZJVmSp6A8hjgDRZc2W1KTl9CTox5HPknDeiBMjr
         a7vA==
X-Forwarded-Encrypted: i=1; AJvYcCVpm9euvHEZGT59JLYyIF2kaPgLE4p5rZ+KTrXZt/Ih5tbEnsMQXoQcnGLMmOUddtg7APbwFybQ3Exksn+RZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx13jER6QtrPCskq+tb85h5WPwuCrTdBzfnrBg5WsCSskXKYo8y
	VyxebtUcUfaEOfJNKaJW9E1IT4BHa8/4Hqcd9DRPSLucC5rPGhJoMxmt
X-Gm-Gg: AZuq6aKzmsQmfyQ4NjmcidRSEWN/a5Z6WbKLdPjRzQ5VEhnEww9tcdY4XmHbJGeWjrv
	8RdwwyeGRZid5Y6DVLS+28Ack1KYY24ASVtsXSvyZcY7PfZ6qotTP2ZAlWIKCjE0tafOtNlG8gr
	iVLbGuCy/RIeVsgWHGnx+aDcbmQvpFCny9a6KxVo8DOw0EzWUTOePEHy39xYtxSjVxxWuj492bM
	GMyGLy0SObWvMNraPLsClgS/rUkPN4xLJIl7CXgkeoLCy1h+RJm0JPFlF066QIdFhdZca4U25h/
	hFpkLxz1qsWCTkXf5yzi8EZoCBBNvrnGPLHfm7KLfN1Abm8UFMIFNfxOlgrb8YpVxuHUixow6mf
	ua6BiCRDni34z8cEwOYkiGuQVXAyQgUsNCFYu6SLT8FyXBJltLaE0l+tFBzzmMDMn69LKSgkSjq
	CJwPdY9Oo2h4VgfATOOK1U4g6eZ1IZWcZtT2MeHP5iObtkBZJWa/ULcXdb6ZJmTtPB
X-Received: by 2002:a05:693c:60c3:b0:2b8:6b32:1cf1 with SMTP id 5a478bee46e88-2b86b3224fdmr781427eec.29.1770483189514;
        Sat, 07 Feb 2026 08:53:09 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:22c3:7b0e:5e40:3e51])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855ad8da2sm4438907eec.5.2026.02.07.08.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 08:53:08 -0800 (PST)
From: Jason Hall <jason.kei.hall@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Joe Perches <joe@perches.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jason Hall <jason.kei.hall@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH v7] scripts: checkpatch: move Rust-specific lints to separate file
Date: Sat,  7 Feb 2026 09:53:05 -0700
Message-ID: <20260207165305.129822-1-jason.kei.hall@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiq72n+C1xU43ZjiAE35rx-NHWAOZyNHK0_kuYAGCpo4BkU_g@mail.gmail.com>
References: <CANiq72n+C1xU43ZjiAE35rx-NHWAOZyNHK0_kuYAGCpo4BkU_g@mail.gmail.com>
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

