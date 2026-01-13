Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04822FB0B3
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 20:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768335703; cv=none; b=Vg9XDp9I4UeR0VXLd5muiFrvPhyTHZyW2dsj7fs+FV+MC+8Syo0PCIHtxt4GrXDtmSlfCa39e7bV1eMagJz5QbXc7Dkah7SqSXk5m6JVRBkUjyBpfj9WynH8qJ3chN7mi/bwUEzgygDvTeMJ3dvELzzVOLKFHlEOPY68FoQl/d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768335703; c=relaxed/simple;
	bh=mTlU51QifGosjYNSBQR8uTI8bCZuwmnmwF7aa30HUQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hq59+H+sZeCw9zR8RUS+8SKtKhEAi1b6dmLxAXGV1IXQy9ucjEZS2mv0d9hlDHJT+flx8C+M/kxc2R85mu2mZMCPhj8AVvKA+vbDy97SyxsA7DrC+6iUdg06qXoRPysMiK2cbct1Nt4Dbtw4a54hlwkoLZ0BpUuB+l87nLA3w8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAMxserv; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAMxserv"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a09757004cso72655515ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 12:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768335702; x=1768940502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LXuCzUKqWnjN6/8ck3FY/TEw/wJBfBn1Ef6/teMp+ws=;
        b=MAMxservcGcln+6cJpWvKviKZyzwunUJ36Zc7FX6fhtZ7vTrF7owdZiLcBlywyOnRt
         C6NwqFioyhZd/wgaxFRNtf7u7nO0cHq+DB+n2a15ml5t/7jmYBLj0jwPGSDzsZw9TETS
         keFBsh0xKO2J0jl3t0IdP3x6QeniYeYYlTTXb9fx8qsOvIeydCGws4iI1YFcP1vWSqOo
         lsC+YmHF66tcBMdz5QHX3FcmdvWiMFjewq97Vlc8S519snsULYHoJpuBJseS7gUyd7VE
         jbdUneK1D36cjiL46RzkDoYrMbk0bdoZin+CG4zo2U5LRLL+rZ9J4HMlGXSfj2q9ZPps
         P8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768335702; x=1768940502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXuCzUKqWnjN6/8ck3FY/TEw/wJBfBn1Ef6/teMp+ws=;
        b=LkGNlSpPhLFVHnucpjL3W+Kyz/zhNRymUp8flV8KPPkgP+t2VSYd6n7F/kHE1CIDEG
         zHXw2GD7DJYLIclCjkprK5uIAKK0mViyIPasQx/QDOvhVEs29CF42yXEdwrFP7TgAF0l
         2fLeD3kiWb35F68vT4ba+2xn0ROYypPrv6dsJEBTDTQz+gUb3mYV5bmc55NUDiXSaFGt
         raHjXR1RTwUqTWPGaAJshqNJJVl79WHJjXdC52D1FkzwT+j5Wq3COX9jnlHJQX3GuuxD
         BO6SPdyCr4WwAq2cZRSRyA8qytsD404p8YhA76xjGBfbQlB+TDF8RApvKLjsDbc+CVur
         lSQg==
X-Gm-Message-State: AOJu0YwPhbcGcAjHiQbLuBNw7b/9Tk2Yjz7pOA3jZw8CqXlqtdGVXf7i
	XlOpXNT8WJH1mwrA2v+k5JDsPVaQX5C4hZ3XdIXTcmtdg6WgvdAsIj6OScihVqnQ
X-Gm-Gg: AY/fxX6H6SWVtWh9VWLQV5OJKGFLPsx2CQDHSaicaAAUHoJkluFruGhbpOihKwjZTT8
	O9xU0zr+KSbLGrDd/pfaJKc2YJhOe2P+KiRvF5lVCLtDT16qP2SHGrDIVcWpp+g+b1IOvLxgf48
	Yh9rQ6XwxeZ77bDOVKDj2fqk6pKQY7RUPtoEkXHy8Tm86gPVYbBOy+5tiPWJZ6QbT6ks/tHiimK
	lf/VzZ+JPxF8DnCg8Tv2PawUjlGb29LXpR3N83wgzkIW5cWSdStwiTfebKsxlOv/QGyqp0mu/fX
	0j6HjzNcmdMlbNB4Se7bC7l0ykRRamAwrzeWK69pXVt3aS5WTc1XkW0XE7z7tOPUEg/jnm8T804
	fH4k915T+J+td/yWenIJuC/yHeU48rlM0VhE3BnI0GcJ8wBzObCSJ29Ufq5NknmjJIy64e024jH
	TYJCwd1NEIfx/rmLuTmRyTInBEyHNIoI688KbvC4IpDLhoNdYGcU4=
X-Received: by 2002:a17:902:d4c5:b0:29d:7b9b:515b with SMTP id d9443c01a7336-2a599d89aa6mr2393305ad.20.1768335701825;
        Tue, 13 Jan 2026 12:21:41 -0800 (PST)
Received: from kailas.hsd1.or.comcast.net ([2601:1c2:1803:3ab0::73b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2b3asm206034115ad.88.2026.01.13.12.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 12:21:41 -0800 (PST)
From: Ryan Foster <foster.ryan.r@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org,
	joe@perches.com,
	ojeda@kernel.org,
	Ryan Foster <foster.ryan.r@gmail.com>
Subject: [PATCH] checkpatch: warn on Rust comments with rustdoc links above items
Date: Tue, 13 Jan 2026 12:21:38 -0800
Message-ID: <20260113202138.565332-1-foster.ryan.r@gmail.com>
X-Mailer: git-send-email 2.52.0
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

