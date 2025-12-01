Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F5E313273;
	Mon,  1 Dec 2025 17:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764608502; cv=none; b=Hw0QMoNluAyVTR0XhU4VbNvMSx7HZ4AlSekgM5D6s2TcWBRevfGS61a7DfizVXO4xF5aVDwZQac5drSi30FFkH02vEGfaiWMdfHq9SeMqt2FXjQF/Pos8OUxrSFqxtSTX/ZznaCpj6ZI1KLJyVHG7MjNemVz9exAat15xZlNOUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764608502; c=relaxed/simple;
	bh=gfsHCvhtPFYeIbi8L1Ilc9hacNuLHCFyH02jhcMJrKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XfFgWSao/HOFjPoDD/uV7gRUm7+xPxqQsv9esExIxZCLK0XmD2F4Hfc01OUe+2cDlJygqzx8wkhSF+M1f5Fy/yayTT27QT03me5Cy4qYkbtWNBe32wwJljDlVsWNRU7Qdwmail1clm1vZlur1zLm7IMi2tXCczVWq9JCHH5WOfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ORM/Jb7L; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RSGT7zeB; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ORM/Jb7L";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RSGT7zeB"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dKqtp74snz9sv3;
	Mon,  1 Dec 2025 18:01:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764608499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PQORlrunRONnZ4mfFw2m6TOi5ATKjJtqoaH6BGDqxDc=;
	b=ORM/Jb7LouScw7B8T3izFU4aiNYzG2dXhwjgh+vhXLQ0SvjcgYaIHH3YfGRDDuSY9cyBUA
	Hky5hcGe+QwqE2dzzK7LlHy2rvBJhn3yAhwcTHb61GM6pj8MehRPYzWL/xO0FktV7NbG92
	Si/mJExA3vG0Rt6yISJkbgNYRV4peHjvn9ZthKtKIcinbRLLU8X/KduUwzpSGDWRFfF6mH
	A8VxDoi9zwQdgLshM/mNhQI5wvqo2NwlmeoGq1Q2LjWpjm1I7dB/GHPP7SRARw9J+Tz6Il
	9RBXXvyFcxhw4XXK+PabJ7X/FaPhdiupqb0vWaARuMxE4L/CCbYdiVfcPWhWJQ==
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764608496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PQORlrunRONnZ4mfFw2m6TOi5ATKjJtqoaH6BGDqxDc=;
	b=RSGT7zeBJCsFrv9KLbp6++4QhTX916VTCYQG+OWGkPgHkJLDmjMwRvG9REWRVh+FfDi9GW
	cZnekwS3oL60GhDRoI6M7ArSfhK7nOINyr+QniKbjKhg0hEARXb5Pn80/tkuH+vHhJLF/f
	wHyUA/BC6n2eGFRWDIkgxZZo1CyPv1T1aBPdhMQ14iuJpnZQIh6HtJgrfUSDI1nR23ZlDh
	2OjVeK9la7QB8fAFNhJvc6rVKuCI+cNK5MZJKbZZjSZuOpfze52Udio8Hpiz9zJ1us41nM
	j9sc8zrykTjRCNxVKA7QqxPhkjwTGkREex6nb4CPxXBGcxLVRyVaAYH67UK0wg==
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
Subject: [PATCH v3] scripts: generate_rust_analyzer: Add message to sysroot assertion
Date: Mon,  1 Dec 2025 18:01:30 +0100
Message-ID: <20251201170130.10922-1-mhi@mailbox.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f197018e583b4a94519
X-MBO-RS-META: 6px91f8tasdysn9siuqeegcjgk1a4e58

The assertion that checks whether sysroot lies within sysroot_src
currently fails without explaining why. Add an error message that
prints both paths to make diagnosing toolchain issues easier.

Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
 scripts/generate_rust_analyzer.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 147d0cc94068..446d405ef68a 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -213,8 +213,13 @@ def main():
         level=logging.INFO if args.verbose else logging.WARNING
     )
 
-    # Making sure that the `sysroot` and `sysroot_src` belong to the same toolchain.
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

base-commit: 54e3eae855629702c566bd2e130d9f40e7f35bde
-- 
2.50.1

