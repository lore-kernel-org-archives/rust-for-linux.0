Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7328635;
	Sun, 23 Nov 2025 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763895634; cv=none; b=o6YYLZspj2PF71ehLrbJf989eN72iluPB+aT85aFJGUYMPUk5ctAkBrc7hW9ek2Iv/pFWSTNgTGjcFIZ9LO0CJkK5Fub4HlK9Kzwul6rI4voJtnuaNrSi8JjWq+Kczdi2HU1wto0gV3DCZFtt3LwnDHQ/NURW4qRT3LxHAwjlqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763895634; c=relaxed/simple;
	bh=q3lZVvvGSSl+r9x0TySxIWm5F68Zyn23kHnjVhrGWwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJzv+PyQZqa1fYX6fS3MEuwx+G65gipN5IL1y4fxNcLGHtsE1BitLbTzMlWi9hdbImx8lVITr0CBsU7NXkTnUPYEsCYBCH4B4XfYhP5Fp8IDLsMOeOQ9ksSc/FrpOkeSR+55+wop6v1kFQ+ZJKlXh88yr7IAV0zU4lYhcNfBQTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WhFBBFvf; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hClkF7gY; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WhFBBFvf";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hClkF7gY"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dDmFh37m2z9st4;
	Sun, 23 Nov 2025 12:00:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1763895624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5p5rWuCRjguzGBOE8Ie1nL3MaOiIiTcvZjrKRQN6Gzs=;
	b=WhFBBFvf/aNagLG53aU0thXjoDktx4glO7oUBjEfZAfnM6jScLYkwRzsFyzV74nZttXYn9
	8BodBxWE80V10GsssogQRRqdQiPMdZyLpm1P1vgTb4da+MV1nW7PeO7PsunQLF0WJx7+72
	LLN8i7QyVWAfIVOJSP8R11p5wx60UvqrJw39i9PYVeWZl58hAu6JlV0EiefLJQ7+bsElXb
	rC/r5+CjtXlj0+wCX4+ANyT+xsxggs4ciF7tHLxLX2uGzSskokchMO/W2nVh6CIzuYxNpj
	BJXqaQJ6bmZmpXS9NDFO1CTnnPmDFD5H7lG0jeoToWqa1Yaevn88RmhQy9scWA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=hClkF7gY;
	spf=pass (outgoing_mbo_mout: domain of mhi@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=mhi@mailbox.org
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1763895622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5p5rWuCRjguzGBOE8Ie1nL3MaOiIiTcvZjrKRQN6Gzs=;
	b=hClkF7gYWjos+qYREHpvbxsseBTwY8mMk/umOo/5Yi0uoRU3xzvG6ngJVO5TAtC6in15K3
	+v46vE6mihjiMtdDFS0g3NlHojpc0hGxhTrE9Ocy3WM2QUFda4KB5EOtls26Ee5KVSHwZg
	LFCOyNseI3qCw4ts5RH9wydHewtAGDzvyf/qKNrWv1gQSJKwr7NZC+LGrPmYH1y4t+nv6w
	K1ROI98YcanJdavXOLfYy12gMpF6hdj0tfaHMXlJvnSGdgD9CzwVuJSy1bDOHMjLkNc2of
	a9O1AZoeOMaFUbRpZnaImepGZHAQX0KHlGmRaBSDSodXx32IhJA6f5bIu28IlA==
To: ojeda@kernel.org,
	alex.gaynor@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurice Hieronymus <mhi@mailbox.org>
Subject: [PATCH] scripts: generate_rust_analyzer: Add message to sysroot assertion
Date: Sun, 23 Nov 2025 12:00:10 +0100
Message-ID: <20251123110010.21096-1-mhi@mailbox.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b9670f5a8961fcbb07f
X-MBO-RS-META: gggmcrr4eut3ftapo1e9crymznmsxiyx
X-Rspamd-Queue-Id: 4dDmFh37m2z9st4

The assertion that checks whether sysroot lies within sysroot_src
currently fails without explaining why. Add an error message that
prints both paths to make diagnosing toolchain issues easier.

Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
 scripts/generate_rust_analyzer.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index fc27f0cca752..b2fc6e8aa8ba 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -193,7 +193,13 @@ def main():
     )
 
     # Making sure that the `sysroot` and `sysroot_src` belong to the same toolchain.
-    assert args.sysroot in args.sysroot_src.parents
+    assert args.sysroot in args.sysroot_src.parents, \
+        f"""
+        It seems like your sysroot and sysroot_src do not belong to the same toolchain.
+        The sysroot folder must be inside sysroot_src.
+        sysroot={args.sysroot}
+        sysroot_src={args.sysroot_src}
+        """
 
     rust_project = {
         "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs, args.core_edition),

base-commit: 494de8f67b1e586b0190eb7f835e97c97f6b81b1
-- 
2.50.1

