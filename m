Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A893191D1
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 21:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768338630; cv=none; b=oR5CKphGvfIBQltIfRSY9aD5bYZCEa0LzBW4vMdQZ4fCvshRJhzEMKZh1ubLBGyAwuDbVzzqfudxJCIORxrtZnWDDojmMu4YX74jVhHhjdQawM3FCU/1VX5ARhW1HXzUHhiMHtEt5FZeLkfOCFSGPEdBXHU30aA2uPqXJlYUMUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768338630; c=relaxed/simple;
	bh=nYSR98aCQFnWtxzT16o6zqxKZ/dLmZwdrr5XfgbvdVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jz2+A+yJpgjLsHwh09gxkDPwc5tqxZAtrNIl36AEHy/F9rByLio1JdMS//s0VyBtKzrIiI6WcD4TmRZY1y7+NV+YPjGWy+sGQGDIiJiwLIJJ9BH8fdqVo1I6Oja9+jbo6Es0w18Lf2s1bUcdUehjxq6umsO6usWPNefswG1htPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aee8+gyR; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aee8+gyR"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29f1bc40b35so86931695ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 13:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768338628; x=1768943428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50PrcAaqBfL5mCsWE6bSE1QitHvKwqM43RLRqrMTJnM=;
        b=aee8+gyRcCNn6dh2tsvEa4zltMzAAk57iYI8TO9b9BtH8IifKWB6RhgTWilvvaCW4W
         l4LtPIULV/jd26uqVX/MXw5JLWMIV4QaJBMzjgloVpFk0duZT02RWPk9CufnIXyVM7Fo
         Fpp6LYvpLafgx4XaD6oa9Dse/6Z1sAKGh9HH4i9OYESU1+7AylbePwTPl/R/ZzlIzR+d
         /C/PXsmYkGov+LTNNj+NrXCCEfMSkFQtCnK67+WP6RPMgOGKYVwJvdUgcnvoUYYPsYmM
         B+TVyRcyNPXel7J7AmoyRZ7kWWMw2bzcz0bPibhYk3OxVoHOb9+zbwaqjRcEYKe/m4Wc
         ACWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768338628; x=1768943428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=50PrcAaqBfL5mCsWE6bSE1QitHvKwqM43RLRqrMTJnM=;
        b=i30I9BTC52WiThWQiy6QvbqiMJjNtcK/VMN8CQo5zWega09Tk3pxb0n5kSOyPtadAM
         B0vTbH/olZ4e3FMODn/kRvJxDUr/fjqdRcMWyqYT41HkEp14Jz/ojniZ21qnPy77L8JZ
         jKp6coj1VZ9WgaPjh0OK3nEOD/hT+agg7KXXWyYCPOfpXRRiGD7pieiXbOcYELJwxeo1
         mbrmGy16PfxGx33lmz1eJuRCMQ5o0iaf12JmqV4aa/tWT08dn+Xp5lOdQnW+NNkKaklt
         7Wjan1D7l3JGh4ZE0yTw+Qq5wNoJCo7LUoa5weLC0glrqHdALL2LZpl/Uw6SOOwJZgds
         8hOg==
X-Forwarded-Encrypted: i=1; AJvYcCWxWac6Jp1PShcCi82ybMaJTio2JIKJgOxowWyAKMdait5i99KDcmUMmH6FjeTiegPJugD0pI5Cn5/FuJIOUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkOEwT/Wj7pzN927wuSdjXYODhmNStEVws8RnkMefwMIf9CG1X
	DbupRf5yG4uSMPRkXWdd6WyZLQx3crnykMu0HSSJEdHbyT7VPLcnRCicmKYpINia
X-Gm-Gg: AY/fxX40BMdCeS/+OsTdX4C2O3uA0RExMcOkHbthed1t6IYZ0vmD7+KsWfaN3Y9gfzB
	TZVrcnA1XKxzqvK7G5qdmsqqq6uO70fZJ4+mYnLcMB5qqXf8mCe+Mfj0IDnSlWOHExZT1leVqmb
	ZvIpctyimxC+YDy8w2bkgWYdi9HyLos6xpbKv/wXTfqgOZUHmO3zvY53htZrHnoCawGTqmD7ijF
	X7ZXHFnkhVUmnepVLxGjkdnAFYawZme4odGCAbSKHR9rzXQDF2Lyf8vyMgBFT1e5grh3/W9xH27
	3opcOIYWPVhInw1GakuQDq+/tp8qJ/Xx6tyyAbK0qV9j7KGl/3aNwslaw74dwNsiLNGuufNweAw
	0T/461R27//mL8+pcPRDdV4fx1nMdciZWPgsUyGcGoFWR8NVGtWNVEsdV/lGGg0nz/GbH7YZX4j
	IzyXeVOINHKLc0fgkBILsVNjdoaSZ25RtvpNK1n47He8wzM9uMX26gQ5klgCrs5Q==
X-Received: by 2002:a17:903:22d0:b0:26d:d860:3dae with SMTP id d9443c01a7336-2a599da5ddamr3426495ad.3.1768338627905;
        Tue, 13 Jan 2026 13:10:27 -0800 (PST)
Received: from kailas.hsd1.or.comcast.net ([2601:1c2:1803:3ab0::73b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd4401sm211759035ad.92.2026.01.13.13.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 13:10:27 -0800 (PST)
From: Ryan Foster <foster.ryan.r@gmail.com>
To: joe@perches.com
Cc: foster.ryan.r@gmail.com,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2] checkpatch: warn on Rust comments with rustdoc links above items
Date: Tue, 13 Jan 2026 13:10:25 -0800
Message-ID: <20260113211025.637889-1-foster.ryan.r@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <bfb5bee02f2e69ce1eb8c526dd4cfb82de326226.camel@perches.com>
References: <bfb5bee02f2e69ce1eb8c526dd4cfb82de326226.camel@perches.com>
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

