Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5CE1D6DA9;
	Sun, 30 Nov 2025 19:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764530634; cv=none; b=EqSaIr3a2sDDGe/DR8Y7V2d7wqFOVGSRNJxd67fh+BMmkO6bzCxBUAV8ciXYxoJYTevde+fRsAy/ebXgLtcWqRh7lZY6+116XCDlKzYl2P6z+PviCtXTSOLOnfXpgxuXP1WHaLejPJ2MKPLB1N6yOKBTSwDU2PngBfM8wjgg87c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764530634; c=relaxed/simple;
	bh=LfyJtq19fCJsTFJlJrjsLsvcphuceOuD2EkZHb/GLjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GF0Z33u9YXoDTGbeGtkNd9eORC7+2D7M7b32TqfBIgWShvyIqxL22C8fycbZCEDHqtR4UvvFCU1/JML1fkP3uikXusuZq79HHGsC/12S0T6tLbrBOC6HKX6UUN/BNtBpI7I8Fswcnxdz4glfVMomVrNeBNY60ERyfVKGSr02V30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dJVtkoqj; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YmfSd3xh; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dJVtkoqj";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YmfSd3xh"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dKGw472sbz9tZk;
	Sun, 30 Nov 2025 20:15:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764530149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZP04gDkooPufSMQBLiXSkYDe99N1J5STbRVLnGCgcmo=;
	b=dJVtkoqjERnMwCI//dWCJjFGBOWZV1PgFITUphFgje04pFI4SWLa0Q6An+1sTma3V8S/43
	Te8oKbDyKsDxzv4FCpYml6YZR/vBRpvfIgRZlW7gy5waZI7ddts9Vd30vp2R5eYf6TRE66
	IqPevzlnbZ8vZvtPsMSu0YBbCbdU9gi82Us7bUXJCuqjBDBKgD/PkIkcadQ0vAxwmwT7Dq
	hTxk8Q1Bs5zPibC0puyhhdMt5rbLkK9q/i3bDX3V4XeJiFpa043sQ+OxPiKB3OEHV6OZ3H
	Uf7CPXTdt9PNNGyXRCSjPW1SCOPBgxK7stIqATjN4BnEgXTtUDiS0lduwOXlMw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=YmfSd3xh;
	spf=pass (outgoing_mbo_mout: domain of mhi@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=mhi@mailbox.org
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764530147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZP04gDkooPufSMQBLiXSkYDe99N1J5STbRVLnGCgcmo=;
	b=YmfSd3xho59ntL2ABoh5rtp3R6sF2NUirCK6E3NCYQaq3pqe40Z6W5ud8CmXbqPOmbKcx2
	tziiZ0tqoR/BUam+cRwTh0wv6C83K8b2X6SMfMT/W7X8wSbDZpSUwGCk1WMJuLxhHNY8Ra
	RoPH2bu9TGY3IV00QRwU8FRDRIbvk0pQR6U8Uvx9CaTyBQptjJ0rxRtg6MT6TikJlr2N9q
	RHkaBbZJbHUQox6wTNSm/f+m6ZzKif2jeF+XuiX206Ny0ZjxLB/Ufq2Kkx95UkFtkR/l31
	x0bUMGfNL4kpH4aVCD4XSnwjaMad9yh7mFfEJMtCd55Wjr3BAa16gI62NYpB/g==
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Maurice Hieronymus <mhi@mailbox.org>
Subject: [PATCH v2] scripts: generate_rust_analyzer: Add message to sysroot assertion
Date: Sun, 30 Nov 2025 20:15:35 +0100
Message-ID: <20251130191535.77498-1-mhi@mailbox.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 72e8bde94fa02b52e33
X-MBO-RS-META: rqa74k8zoc71if5dy97jciz7coeg733h
X-Rspamd-Queue-Id: 4dKGw472sbz9tZk

The assertion that checks whether sysroot lies within sysroot_src
currently fails without explaining why. Add an error message that
prints both paths to make diagnosing toolchain issues easier.

Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
Changes since v2:
- Rebase to current rust/for-next
- Send patch to all people received from scripts/get_maintainer.pl

 scripts/generate_rust_analyzer.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index d2bc63cde8c6..06c220c9ceee 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -156,7 +156,13 @@ def main():
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
         "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs),

base-commit: 8af7a50167833b6b22e30c008bbf95ab3ff1a5fb
-- 
2.50.1

