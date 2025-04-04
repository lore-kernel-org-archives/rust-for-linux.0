Received: from dd44826.kasserver.com (dd44826.kasserver.com [85.13.151.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA0C2E62B6
	for <rust-for-linux@vger.kernel.org>; Fri,  4 Apr 2025 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.13.151.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743771202; cv=none; b=PFpeCKRjHV4exrnyBuA6Tf61SrlFYNA0B30CDhiMIsYMaYtFCxGTkqvGaA3kyrajeyPZLUgALM80ltnPZ9TyaE2Zi2KjrgPtifUy7vyfwCrimEWD49UnJBlvMRedBdIajRZLTmNQZkB49rK0kWR7vYOj9uEUbk2zNxJLhbaZ6WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743771202; c=relaxed/simple;
	bh=IQbIexx7U4n/w2Yb2vOmccv1WkdDsrdG/lcZeF/t8e0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=epI9DdU+FzY4bsPiX18DWUfhlwu8V+zuvuefqhxEk9+cOcKRp1JVrex5ojrhopxtk8WaiZ7uf2hb0z1iyYL9XU+G4kVdfkcpSm2z3ktbZxdMq45o1z9zhq/Dxe4+VCG3F7XTNecn5D8/VGML8FPzGGPMYyOlDOaZ1s/KRsJa8pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=o1oo11oo.de; spf=pass smtp.mailfrom=o1oo11oo.de; dkim=pass (2048-bit key) header.d=o1oo11oo.de header.i=@o1oo11oo.de header.b=bzK7EdgL; arc=none smtp.client-ip=85.13.151.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=o1oo11oo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o1oo11oo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o1oo11oo.de header.i=@o1oo11oo.de header.b="bzK7EdgL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o1oo11oo.de;
	s=kas202503061048; t=1743771196;
	bh=z47DcCXNanxmKsBCh2lCBaffxq1+E7ccllcSUaQDLJY=;
	h=From:To:Cc:Subject:Date:From;
	b=bzK7EdgL0nJ5kzbQCPHwd86Po9wW8VB4jaeOOddmvF3KjYvN2k3U6qkY7AVZtFIBg
	 tLj+8Yvvw2b7/q7+h75SwpL1fEm9UiuMWQdTAM9VdvfC+7leI+VmvkS9gBQ9PDYXn9
	 aBhRD32eArKBrE9MNxjqEX6lJyr61gi9afJ4/tSQtTHd1KmngUWOO8McqRTFZ+pApk
	 wBjUtFvWh/zTmgM+H/97BAhP+3xj8JmzdOMW6p/O+Kw5ZWMShZ58mcNwznHPLCi7sw
	 jFr3P6uH//MLI0filoPBhVxVSSXn6MXnzgh1pEJ/nB5whJwg1kpo7z84BFf9Pqrzu7
	 1wmFufoDN5zNg==
Received: from wl-r6-43.rz.tu-ilmenau.de (wl-r6-43.rz.tu-ilmenau.de [141.24.109.43])
	by dd44826.kasserver.com (Postfix) with ESMTPSA id B1FD2B6E01C1;
	Fri,  4 Apr 2025 14:53:15 +0200 (CEST)
From: Lukas Fischer <kernel@o1oo11oo.de>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Lukas Fischer <kernel@o1oo11oo.de>
Subject: [PATCH] scripts: generate_rust_analyzer: Add ffi crate
Date: Fri,  4 Apr 2025 14:51:51 +0200
Message-ID: <20250404125150.85783-2-kernel@o1oo11oo.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++

Commit d072acda4862 ("rust: use custom FFI integer types") did not
update rust-analyzer to include the new crate.

To enable rust-analyzer support for these custom ffi types, add the
`ffi` crate as a dependency to the `bindings`, `uapi` and `kernel`
crates, which all directly depend on it.

Fixes: d072acda4862 ("rust: use custom FFI integer types")
Signed-off-by: Lukas Fischer <kernel@o1oo11oo.de>
---
 scripts/generate_rust_analyzer.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index cd41bc906fbd..fe663dd0c43b 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -112,6 +112,12 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
         cfg=["kernel"],
     )
 
+    append_crate(
+        "ffi",
+        srctree / "rust" / "ffi.rs",
+        ["core", "compiler_builtins"],
+    )
+
     def append_crate_with_generated(
         display_name,
         deps,
@@ -131,9 +137,9 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
             "exclude_dirs": [],
         }
 
-    append_crate_with_generated("bindings", ["core"])
-    append_crate_with_generated("uapi", ["core"])
-    append_crate_with_generated("kernel", ["core", "macros", "build_error", "pin_init", "bindings", "uapi"])
+    append_crate_with_generated("bindings", ["core", "ffi"])
+    append_crate_with_generated("uapi", ["core", "ffi"])
+    append_crate_with_generated("kernel", ["core", "macros", "build_error", "pin_init", "ffi", "bindings", "uapi"])
 
     def is_root_crate(build_file, target):
         try:

base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
-- 
2.49.0

