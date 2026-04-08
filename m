Received: from mail-106117.protonmail.ch (mail-106117.protonmail.ch [79.135.106.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8501734165B
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 09:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640465; cv=none; b=s+6xCEssYBWr+9fd5p62cR4AEWtctboiyfBjv4vNm9ZSd4icpLqqvYTXVAmSLNYQR0XjObkT84yoSCRoGRWdF1ftiQ8VRA2IgRaJ3JQzJvo2tNUQyuitHd4YfUyUE4iNVB8CcQbyksVWfSjBUe7ro00wrqb8Z1Zw7bEcriAHJEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640465; c=relaxed/simple;
	bh=O/7WNRnt3f/e4V0CzlPkU5EKVD7HIaINGXU3ZXXcQ0k=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hg/3suaLshldnGv3F7qhY7PaPLYNbtC+uH/PLGjt+9LobSbMZvDa/A6GGoDu7HAbYQ4lj7hfqUdKlWasWkixWJZvkhaQt8c4dJRhiej0tIy3mmisHyXEwbvk1Z44M0DmhIHknvDrf97sRL2RjFC1GOlnYBWp0A3G6Sxis8DBvu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=victorprokhorov.com; spf=pass smtp.mailfrom=victorprokhorov.com; dkim=pass (2048-bit key) header.d=victorprokhorov.com header.i=@victorprokhorov.com header.b=scuUAWFE; arc=none smtp.client-ip=79.135.106.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=victorprokhorov.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=victorprokhorov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=victorprokhorov.com header.i=@victorprokhorov.com header.b="scuUAWFE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victorprokhorov.com;
	s=protonmail; t=1775640459; x=1775899659;
	bh=IS953sWQ9Oz5YvrY8xxNyrhD6Q9Oc1g5LTxw8VY2mTI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=scuUAWFEYV3PtmgR07vYfFdt3NN30xb5EE9RWo2PtVsdiHqE13n9qd6WffyFAzRxo
	 4no3de1yz2SaLJrDqVygwk3MvfgYw12mt1dgiyMu+ocVKId6autBCUhx0R5Ol9za9j
	 l9DoiFMczYNx8gaHqgqh58D6BtBlDsJSaeVsxu4U06+PXSRNbXoo3j9JelG6pvHroC
	 nb4woYbv4movQhYIOsKnhITMfvGRjVQLsVcD0brsqhWPrrgt2OLAKm5Lnjs+m1nDv4
	 H4+xBG0QUMc1QTxbheITY4zszRRSWUd3dw4w3UNPf4lUeTb4LkgeLIv0RPpj1BIpLG
	 d4+qm4zPlelCg==
Date: Wed, 08 Apr 2026 09:27:34 +0000
To: "ojeda@kernel.org" <ojeda@kernel.org>
From: Victor Prokhorov <mail@victorprokhorov.com>
Cc: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Victor Prokhorov <mail@victorprokhorov.com>
Subject: [PATCH 1/2] rust: add `ptr_as_ref_unchecked` to `rust_allowed_features`
Message-ID: <20260408092621.580364-1-mail@victorprokhorov.com>
Feedback-ID: 108936981:user:proton
X-Pm-Message-ID: 981497805eb1119f39ee89e3e8670db4aeab1544
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Victor Prokhorov <mail@victorprokhorov.com>

Add `ptr_as_ref_unchecked` to the list of allowed Rust unstable
features. This feature provides `as_ref_unchecked()` and
`as_mut_unchecked()` on raw pointers, which are the named counterparts
to the `&*ptr` and `&mut *ptr` patterns.

The feature has been available since Rust 1.80.0 and was stabilized in
Rust 1.95.0.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1225
Signed-off-by: Victor Prokhorov <mail@victorprokhorov.com>
---
 rust/kernel/lib.rs     | 3 +++
 scripts/Makefile.build | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 0fa9d820fe7c..59916eba22e9 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -16,6 +16,9 @@
 // Please see https://github.com/Rust-for-Linux/linux/issues/2 for details=
 on
 // the unstable features in use.
 //
+// Stable since Rust 1.95.0.
+#![feature(ptr_as_ref_unchecked)]
+//
 // Expected to become stable.
 #![feature(arbitrary_self_types)]
 #![feature(derive_coerce_pointee)]
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 57cff77c2897..6a0862c9174b 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -316,7 +316,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details =
on
 # the unstable features in use.
-rust_allowed_features :=3D arbitrary_self_types,asm_goto,used_with_arg
+rust_allowed_features :=3D arbitrary_self_types,asm_goto,used_with_arg,ptr=
_as_ref_unchecked
=20
 # `--out-dir` is required to avoid temporaries being created by `rustc` in=
 the
 # current working directory, which may be not accessible in the out-of-tre=
e
--=20
2.51.0


