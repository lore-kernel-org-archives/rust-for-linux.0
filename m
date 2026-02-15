Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F25717B506;
	Sun, 15 Feb 2026 20:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771186232; cv=none; b=GqiYYKOfTDW5gwZb6gtmZuDxgupsvh31AFWTeJDavMc7hNaejMw5YeK3vS0y8LQKZQ2AUJXsGCGx0lxkOXvyD7dV3+lU7InxoD8lEerew89ygKpvBC7T3qM5HaXtq5UucfMFTad4+tkxnS2TlsyyU6vPmC9wMzquK6eOXpVw1u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771186232; c=relaxed/simple;
	bh=7F+NWeZtSNQVLWzFP238s1m63aRH41BDt8ZMuIRw4Xc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GxzxrkgjbsXWx+5/+0jCvueGQ5NamSJ4VLC2g74m9EQXs8xdRdhXcnzGvVTw16KOva59d2AibDjFx41cTtHtN4HlGdekQEtUx86IgkC5xrELLQm9KpA3Rbw56P0ViKnbCJfp/GlOrMrVqvNRi7rtO5Q34GjpIB3YXdoT6yN//4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmY78Euo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmY78Euo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E831C4CEF7;
	Sun, 15 Feb 2026 20:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771186231;
	bh=7F+NWeZtSNQVLWzFP238s1m63aRH41BDt8ZMuIRw4Xc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VmY78EuoUTMvjyjshpGuCOEYIFnwtdauB1Peh8nzQm3k1Kc3iTgKnTEbnot+x2x7K
	 MbTYqgOSVA5zhZzo34PLemN2ktzcjjSm1cSGUzgMEhH7AXtKUn3icw0GnMilRsFZ8d
	 FxCH/EbJ/b0QlyuOTg38Hlv92w/+y/kqq7Fq5I7BKbXbDaLJ9uAFFR1VRawCUcbZNC
	 XT7hLEdZo7mrX8tm0oZv1ZZvyrUcpWGvSf9oNNdRE0FEewWTKXZ6TeicETtHT7SnJk
	 GcOYnsZwolNyTVLumtU3/JC+sdt3seYnKTD1GJIiZ7On42ivR9Hldh74WUhUjbTy9+
	 iLJwiv/MGlkuQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Sun, 15 Feb 2026 21:10:15 +0100
Subject: [PATCH 1/2] rust: add a wrapper for the `num_possible_cpus` C
 function
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-cpu-helpers-v1-1-fab13d817a5e@kernel.org>
References: <20260215-cpu-helpers-v1-0-fab13d817a5e@kernel.org>
In-Reply-To: <20260215-cpu-helpers-v1-0-fab13d817a5e@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1510; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=7F+NWeZtSNQVLWzFP238s1m63aRH41BDt8ZMuIRw4Xc=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpkigpV9OhieGKwHPWEbyZcVpa7kpjD5VLV9gFY
 e9cbA4Fc3iJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZIoKQAKCRDhuBo+eShj
 d2ioEACs1GtmSxPcB6GSVfzohU2hRnzZuIK/ZoO9JaeEr9LizgZ+UY2WbU7Pt+fVf2/1/7SrN3p
 MJz8DaCzLblQv8LgtHxEkIYlw/vZb+eXr1wjlrdtKd0ENlu7ZzKQ5DiUW6KlX1jaX80/SLq7wsD
 1MdEPZhY8La3HfiLbij2KrSDLZU5btgmmOTDFXArIu9GhmDqnbQ6z8FsmqKZEA0OPWzb7kFfOG8
 hr4q3Lw8BD65xkNtX7mmja0x0XxNWmkpomEPefn47XNV/OGqH7gbl/q9FLe3LFMG8AEeFKs1AG8
 qK9wNcpJu5ZCgP3r/K0CXefZrmGuo4gYor902TRHcKMnoj/2UELZZ1NuMayLE1dBfA1r9LW4Dlx
 D5m698VxHhuf8HT6cnbjA8bo3Qzf9PesoG4W4J8bJJCaEM8JKTUgSLgjw0P9/Fuh9uj2m1uwArO
 AYqVQ/OFLx17SP4lwZL6xsAo+9Xcp9XQ0IEr6n0wneNesKC8pzKU36vO3Zz1qJ2NUSGVCkh3E4Q
 39ZeAxsKP28AMZp1R2XDJ8ccORQZfXAIy+kWAPuMGxwodL2GtfrWIl1rmyO2xIn9joiOidXmD0u
 alSgNx6s9t8CtM7Xba63PbhEx7OJzjiQRwe9i7Tla+tPk7DIpAOVNqcpEwJ29LfY8EDtXRuQvMf
 tPSUja8QgZc1uwQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This function returns the max number of CPUs that can be online.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/helpers/helpers.c  | 1 +
 rust/helpers/num_cpus.c | 8 ++++++++
 rust/kernel/lib.rs      | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 79c72762ad9c4..a19d6562fcb3a 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -35,6 +35,7 @@
 #include "maple_tree.c"
 #include "mm.c"
 #include "mutex.c"
+#include "num_cpus.c"
 #include "of.c"
 #include "page.c"
 #include "pci.c"
diff --git a/rust/helpers/num_cpus.c b/rust/helpers/num_cpus.c
new file mode 100644
index 0000000000000..daddacb0418d8
--- /dev/null
+++ b/rust/helpers/num_cpus.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/cpumask.h>
+
+unsigned int rust_helper_num_possible_cpus(void)
+{
+	return  num_possible_cpus();
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf1200428..7040e105dd3b9 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -366,3 +366,9 @@ pub fn file_from_location<'a>(loc: &'a core::panic::Location<'a>) -> &'a core::f
         c"<Location::file_as_c_str() not supported>"
     }
 }
+
+/// Returns maximum number of CPUs that may be online on the system.
+pub fn num_possible_cpus() -> u32 {
+    // SAFETY: FFI call with no additional requirements.
+    unsafe { bindings::num_possible_cpus() }
+}

-- 
2.51.2


