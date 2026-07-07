Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2F030DD2F
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412474; cv=none; b=XUxYrj3JHkU86NkGY7HEatqnjEe+rn+RAZ3HUH3nIYFgXzbMcQo9LMAVQN3I67/0WiVb0AMJk6IF3HrG8fVeqmnZP8TQeQ0th1nARQ3z/aSrZA4ebiLIV1mr7UHutE/bNVW0/mDsSWtiuTefLIjWgjg+aygXFJNuPR5k8f33SoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412474; c=relaxed/simple;
	bh=yxyDXZcLno5sE381KVa7TTA1EbuqjfV/GZXgaDAdujk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sbm11h79MJPBPeZKUXiL5LqYOcfF1csTq/P9wLAsvIvO0qU37c3LZoY02W0GBTpQkv1T/a6EfQ3keCGpRqFrKT3NSfSH8TnaF1lMibCHZY/+Dqw7vDYLkjv2ZTpt5ESMOm9YaTDLdU1+Ym2QyhJXz4X4FlU/+k8c7KNYpTxZa9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeUL3IUM; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeUL3IUM"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3825c406ffeso3089630a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 01:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783412472; x=1784017272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Fb4S8tu1I2dFGb/une/tIzUUASJq3fORw7QtUUZ71s=;
        b=aeUL3IUMUipvzSBukstYdzKR4Jp0BhFjhXgYI/dnq2NlVOSkcuPDh1n8msDLuwK2xO
         /i/u/aQAXcLUY49/hgxnFV6FESHmC1ernGdPRBY0/u0IFj8uJaPuiuXktv+n7YsUdK3Z
         mND5Iw/sVpOtItPuKaPPKGNs7o8Rmetmi6hS5sBbZXtgQp7ag4Bc6oOpby9AhjIr7Bc6
         60rC3cJ9KF2NY/SkeVsw1ZAGqEbDRNn8p2HCKynsb8oA+dyL2h5IsU8PzXXHDDCb5tpB
         BlI7C7wamCelwhar36hcMinmxL7OnYFoEmBV7StR6bLZLUN1xHvpDULdFk0qownj94UN
         C7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783412472; x=1784017272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Fb4S8tu1I2dFGb/une/tIzUUASJq3fORw7QtUUZ71s=;
        b=jhDEhJlsxTQ0KyqQB1AC6fDgbNjEqpWVHZ1rHKY8pzHxXRY3BnSacoTjHTj2zbLR10
         bVFzy4lL4pYCXaROObR+O9uIdq+6VWxTmNCaTQBHOmGWAb23l+2pxiqeDFlZOQrt3riO
         UK20hcvUJU+l6G+VNRHEJUTKUmRPUxKAmooWiaPSK+ZH03MrnfGck6KdsMaGsxL75lle
         eTTLTBI4OCfbj960fceo7m71DENjEEXMGCw9EJQ2kuY/zoLkL0VOKcedjTwgYqhqoPV3
         jXDVmyjNypoAD3EMBKARn0yXxc6sIq2MyqEr5jhdCtycfupZtLHEi78zdlAEsbraflTC
         VYEQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPSQpXXu6c1fVceLbhsO8Xptp7VhuKm1xhGd/gl8cWNHqVt9/9mUkuX87T+KDYjYi5nGIDZRKO0EUQQuoOMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze8/GR9ogtC1K+wvCMZblX0uqxmgnWbZPA7sOp2+ODEOF4tZ1q
	9hMRI+wrI5e4TVcdN/V+WOg+AuxZHuJmk5ODZA89R/+23OlaBw8exJvUYDNxxpWhQw==
X-Gm-Gg: AfdE7clFAvJcs0doXOPS8MY2VrhG9YgwS7s4AkVdQ92AlPnOi3pgC3t5lYxP+Gv6rmm
	Tn8syBOxDJLnR8/Z7wfT8oL717rzZGfiUcHH/KNNMECpy02kNSJBbYFB9Qs+kzu6gTr5DppYlbr
	aAJlQczDdXA2hZUy3D4WkS14xSvi4zZT83i521/ZYZAo+ZptxGDC42LSe862GNDz/JfIx/GwrWa
	vZj55DYePg98z1U04eqm6uZ+Jc7GrOZO+vT6PGLCk0fzZcJ+RWEbWSbf5K8hsnho3ov48pg98pE
	BhzHLLyaYhuw+H652ZpEm8CrJEjXDUIiEqhWfXJtAjUSUZIJOG99kSzIN++xgd+VuFb98grKAVm
	BqcOl+WROILoXltfWejPgfzY/rL23XjUP5YFfkkIr5GKYEAW7UDQADvbjgqI1MygwoZPyLxhxND
	u5tUaA/uEH61imgmkvkPt/W9GUqBUlabK66esVDS1oe4RrX/pLWvf8P6kOJg==
X-Received: by 2002:a17:90b:53c3:b0:387:e0db:3d87 with SMTP id 98e67ed59e1d1-387e0db4364mr1903194a91.34.1783412472075;
        Tue, 07 Jul 2026 01:21:12 -0700 (PDT)
Received: from HARICS-M-4G70.cisco.com ([2001:420:5448:1302:7815:d910:e12a:f166])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a8f521sm5696125eec.22.2026.07.07.01.21.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 07 Jul 2026 01:21:11 -0700 (PDT)
From: Harish-CS <harish.cs.ss24@gmail.com>
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Harish-CS <harish.cs.ss24@gmail.com>
Subject: [PATCH] checkpatch: warn on Rust unwrap and expect calls
Date: Tue,  7 Jul 2026 13:51:04 +0530
Message-ID: <20260707082104.90951-1-harish.cs.ss24@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust panic paths are discouraged in kernel code because panics currently
lead to BUG-like behavior. Add a checkpatch warning for newly added Rust
uses of unwrap(), unwrap_err(), expect() and expect_err() so contributors
notice them during patch review.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1191
Signed-off-by: Harish-CS <harish.cs.ss24@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 4 ++++
 scripts/checkpatch.pl                  | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index 6139a08c34cd..afa9787c1b9f 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -303,6 +303,10 @@ API usage
 
     See: https://www.kernel.org/doc/html/latest/process/deprecated.html#bug-and-bug-on
 
+  **RUST_PANIC_METHODS**
+    Rust methods that panic, such as unwrap() and expect(), should be
+    avoided.  Handle the error explicitly instead.
+
   **CONSIDER_KSTRTO**
     The simple_strtol(), simple_strtoll(), simple_strtoul(), and
     simple_strtoull() functions explicitly ignore overflows, which
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2b7a42bbdd94..5bdb065370ea 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3972,6 +3972,15 @@ sub process {
 			}
 		}
 
+# avoid Rust panicking methods
+		if ($realfile =~ /\.rs$/ &&
+		    $line =~ /^\+.*\.(?:unwrap(?:_err)?|expect(?:_err)?)\s*\(/) {
+			my $msg_level = \&WARN;
+			$msg_level = \&CHK if ($file);
+			&{$msg_level}("RUST_PANIC_METHODS",
+				      "Avoid Rust panicking methods such as unwrap() and expect(); handle the error instead\n" . $herecurr);
+		}
+
 # check for .L prefix local symbols in .S files
 		if ($realfile =~ /\.S$/ &&
 		    $line =~ /^\+\s*(?:[A-Z]+_)?SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {
-- 
2.50.1 (Apple Git-155)

