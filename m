Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E45D280335
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 21:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768340445; cv=none; b=IOFj70jDmli5NbDH8K1xXhmvk3jEM+prefnSxOW4C5uFgRLOH7K8w1GMdLd3HD5AhpqZekNvFFfZIes/Z3shENchUnQP/Pr1dkGLYODFw4zxIRk7NctptMTHDkB4ssWhxvKNfAqR9kL8Tn345Su5Nn8CCR6Ia2rYuzY/VMR0o2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768340445; c=relaxed/simple;
	bh=oPuHzzAROaDyrwraUaslbDGvvaeZlcJlUBn0u3nOYnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aS5R6ac8LleDepSoUMSmtBziUtu8yCjyUdHhuViayNL13/FOQZf6sd0SFoDFjg5gGX7yvmRe4F88L/zHjOwKs91kCOhw/KE1Ci3qgUi2dgqPC64Mxb5UQqrWBxHEOym2w7Jdf6i3nbwgo/4IOGe56SAWpJcPJ7ZxOeONciT9BWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5e9fjH5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5e9fjH5"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a58f2e514eso7604575ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 13:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768340443; x=1768945243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAIqo73FMDJayiWuG+S8wlCRyrhtbPcjzz3CogGbAQA=;
        b=M5e9fjH5EvtGEHPRNL40Gk4MhTnTgSrGS/4br+Mgexf/AhID0XbbYI3ZXtkgHni7ey
         RhGqwd2C/muwj56e6/UIXyeaBupGjKPq2pJ1+uupcXqgt3aaKIPH5Q6TZIlM4DmTaQoW
         lnGEGbkdkMVow1Qln/u2BloiMINC3VDZWDLjl/9u5ahBWHIBgSLFS158kKRNE2oFCHUM
         wCN64JgipTkLD+jz1bDXzB2GoBOVC174HAUH6EB0NqaCALO7r9A7dH7a6Z7hTa/jSzQv
         mE/8XviLjl4yPgz4XILxfYOo5t+AMp+C0APri4FpdWB2mzxCm5hrbKbyy6fwPFPkM9DY
         Gi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768340443; x=1768945243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xAIqo73FMDJayiWuG+S8wlCRyrhtbPcjzz3CogGbAQA=;
        b=Y/fZCZ55XvyTorZTtI46tP4dyPTxVbyVNtmuVz125cqKJHwAlD18oi0HIF/mV7NkGV
         YCHgHnzPLg/JZgWlz7P16OXu5Jn+edyDztQvBFjxZ78x1yy/3e3tIubXOuj9M4/sTaQx
         q/t1ye6q3N5N4MJ0ysxADFgHzmaJyQSo6DsMJStI0ZAxyZnCkW9n+febLwbR3shnGFgB
         jwQCROFGANcCXkFu5bi5KbBch2kWlwvabKkOW3YUpkbi/Px0QOmDWWCtQbUwEpmZwMJr
         0fdMhi+XDh3zCe1I92BheOkyPrt95KnRYGiDGNXRoMci504DilDq3+9GJI3SPmICLq9o
         OIBA==
X-Forwarded-Encrypted: i=1; AJvYcCWCQxjmNj/vgEUu9NgBC4/8rHHsMFYFPtLh//EsvV+lp3Ccqlnc/CTOtmizXCzhTC42z4QnKz4eQs1ek5fFDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1LYINH+eFkhTuV28I3sK+St0O5pPBuRuMi4yiTl0GVTsFQTOF
	BotHquinVK12qRqFXTvDvqnFFnKpr9m0rmUZGypdzhlFiclkiYSZMfO10logWs28
X-Gm-Gg: AY/fxX7cnw4hCObwdhWZeDQYLXgipf+oPOfcXQNI/kAUmRUKcYs4crmqQ45e/gg6vPV
	bpuUTgGfDP0MEBZANx5fSz6PBoH3p0dimMvFBMeCOR7+XkyZyFK8ziJrXfYsMJ19Kfh0hgV3NsF
	4Jbl8y5vINOxQMoVHHR8ri1noLEACq1iiDC/CXHIcCCiVv3DyIwyNZaJfP+Dgg2ddOxCHUDzrTH
	nYRoEItdFeEEwJ/B2tDdYv/AwxiH0/RBAxmQ/p8LPuCcvfX/41zucDrhrqiZI2rL7WN/l3i56Zl
	hx4w2cLDuOM1qb5Jh+XhAEqOhUagD/c1Cwifq30sear5KBWjbsnQGDIj3+RWk1gFbSfleCQ7tEo
	K3qKnR2Dqtr1++IHctucKP53k+zM/WrpZf+OKeTkTb8Hmm1Yr/shrT/tHl8mRSOZkY4FFaJbIMs
	h3kayBalZpbbZCB3N0yJmArTPb6EcZmDgyYf85zGevM69uXqpXZk0=
X-Received: by 2002:a17:902:f68b:b0:29e:93be:fe50 with SMTP id d9443c01a7336-2a599e4c426mr3398535ad.42.1768340443458;
        Tue, 13 Jan 2026 13:40:43 -0800 (PST)
Received: from kailas.hsd1.or.comcast.net ([2601:1c2:1803:3ab0::73b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc794asm209559595ad.70.2026.01.13.13.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 13:40:42 -0800 (PST)
From: Ryan Foster <foster.ryan.r@gmail.com>
To: joe@perches.com
Cc: foster.ryan.r@gmail.com,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 1/2] checkpatch: warn on Rust comments with rustdoc links above items
Date: Tue, 13 Jan 2026 13:40:39 -0800
Message-ID: <20260113214039.33999-1-foster.ryan.r@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <841bb4c27f174fb4f11aaf7bb5f070b96835b4b9.camel@perches.com>
References: <841bb4c27f174fb4f11aaf7bb5f070b96835b4b9.camel@perches.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a check to emit a warning when a `//` comment containing rustdoc
link patterns (like [`Foo`]) appears directly above a Rust item
declaration. This likely indicates the comment should use `///`
documentation syntax instead.

The check uses heuristics to reduce false positives:
- Only triggers on comments with rustdoc link syntax [`...`]
- Excludes special comments (SAFETY:, TODO:, FIXME:, etc.)
- Only warns when directly above a Rust item (fn, struct, enum, etc.)

Examples that trigger the warning:
    // Returns a reference to the underlying [`Table`].
    fn table(&self) -> &Table { }

Examples that do NOT trigger:
    // SAFETY: The `ptr` is guaranteed by the C code to be valid.
    unsafe fn foo() { }

    // TODO: fix this later
    fn bar() { }

    // Regular comment without rustdoc links
    fn baz() { }

Link: https://github.com/Rust-for-Linux/linux/issues/1157
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Ryan Foster <foster.ryan.r@gmail.com>
---
 scripts/checkpatch.pl | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index c0250244cf7a..1b09b9194c94 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3922,6 +3922,26 @@ sub process {
 			     "Avoid using '.L' prefixed local symbol names for denoting a range of code via 'SYM_*_START/END' annotations; see Documentation/core-api/asm-annotations.rst\n" . $herecurr);
 		}
 
+# check for Rust comments that should likely be doc comments
+# Warn when a // comment that looks like documentation (contains rustdoc
+# link patterns like [`Foo`]) appears directly above a Rust item.
+		if ($realfile =~ /\.rs$/ &&
+		    $rawline =~ /^\+(\s*)\/\/\s+(.*)$/) {
+			my $comment_text = $2;
+			# Check if this looks like a doc comment (contains rustdoc link patterns)
+			# and is NOT a special comment like SAFETY:, TODO:, FIXME:, etc.
+			if ($comment_text =~ /\[`[^\]]+`\]/ &&
+			    $comment_text !~ /^\s*(?:SAFETY|TODO|FIXME|NOTE|XXX|HACK|BUG|INVARIANT):/) {
+				# Check if next line starts a Rust item
+				my $nextline = $rawlines[$linenr];
+				if (defined($nextline) &&
+				    $nextline =~ /^\+\s*(?:pub(?:\s*\([^)]*\))?\s+)?(?:unsafe\s+)?(?:async\s+)?(?:fn|struct|enum|impl|trait|const|static|type|mod|use)\b/) {
+					WARN("RUST_COMMENT_NOT_DOC",
+					     "Comment with rustdoc link pattern may need '///' instead of '//'\n" . $herecurr);
+				}
+			}
+		}
+
 # check we are in a valid source file C or perl if not then ignore this hunk
 		next if ($realfile !~ /\.(h|c|pl|dtsi|dts)$/);
 
-- 
2.52.0


From 4847892d292946caaf268a9f37b116394709c987 Mon Sep 17 00:00:00 2001
From: Ryan Foster <foster.ryan.r@gmail.com>
Date: Tue, 13 Jan 2026 13:09:13 -0800
Subject: [PATCH 2/2] checkpatch: warn on Rust comments with rustdoc links
 above items

Add a check to emit a warning when a `//` comment containing rustdoc
link patterns (like [`Foo`]) appears directly above a Rust item
declaration. This likely indicates the comment should use `///`
documentation syntax instead.

The check uses heuristics to reduce false positives:
- Only triggers on comments with rustdoc link syntax [`...`]
- Excludes doc comments (/// and //!)
- Excludes special comments (SAFETY:, TODO:, FIXME:, NOTE:, INVARIANT:,
  INVARIANTS:, NB:, CAST:, GUARANTEE:, GUARANTEES:, PANIC:, OVERFLOW:,
  BOUNDS:, etc.)
- Only warns when directly above a Rust item (fn, struct, enum, etc.)

Examples that trigger the warning:
    // Returns a reference to the underlying [`Table`].
    fn table(&self) -> &Table { }

Examples that do NOT trigger:
    // SAFETY: The `ptr` is guaranteed by the C code to be valid.
    unsafe fn foo() { }

    // TODO: fix this later
    fn bar() { }

    // Regular comment without rustdoc links
    fn baz() { }

v2: Apply suggestions from Joe Perches:
    - Exclude /// and //! doc comments using negative lookahead
    - Add more special comment tags found in tree (NB:, INVARIANTS:,
      CAST:, GUARANTEES:, PANIC:, OVERFLOW:, GUARANTEE:, BOUNDS:)

Link: https://github.com/Rust-for-Linux/linux/issues/1157
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Ryan Foster <foster.ryan.r@gmail.com>
---
 scripts/checkpatch.pl | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 1b09b9194c94..a5a462827aba 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3926,12 +3926,12 @@ sub process {
 # Warn when a // comment that looks like documentation (contains rustdoc
 # link patterns like [`Foo`]) appears directly above a Rust item.
 		if ($realfile =~ /\.rs$/ &&
-		    $rawline =~ /^\+(\s*)\/\/\s+(.*)$/) {
-			my $comment_text = $2;
+		    $rawline =~ m{^\+\s*//(?![/!])(.*)}s) {
+			my $comment_text = $1;
 			# Check if this looks like a doc comment (contains rustdoc link patterns)
 			# and is NOT a special comment like SAFETY:, TODO:, FIXME:, etc.
 			if ($comment_text =~ /\[`[^\]]+`\]/ &&
-			    $comment_text !~ /^\s*(?:SAFETY|TODO|FIXME|NOTE|XXX|HACK|BUG|INVARIANT):/) {
+			    $comment_text !~ /^\s*(?:SAFETY|TODO|FIXME|NOTE|XXX|HACK|BUG|INVARIANTS?|NB|CAST|GUARANTEES?|PANIC|OVERFLOW|BOUNDS):/) {
 				# Check if next line starts a Rust item
 				my $nextline = $rawlines[$linenr];
 				if (defined($nextline) &&
-- 
2.52.0

