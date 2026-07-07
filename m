Received: from mail.noirlang.tr (mail.noirlang.tr [217.18.210.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C153B893A;
	Tue,  7 Jul 2026 07:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.18.210.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410167; cv=none; b=KJ5oADI7p6j6q00J6AmJ/7htzRT7TaGMVnH+IDAZny61nk3aoBM+Yso2Sp/ZhRot8Ofc35gVN3GTSWo7I50PBeeJSRcA85qV+YGqIyruHid6pGZlAkHblSMX78VJQdnt2z5qFHMjaiYQlR/FBwMoPmzDP2Go3cAz1QdVKV2YQYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410167; c=relaxed/simple;
	bh=hrmBLMiatJ8vY8OdwuU8D1+x1QryxpSafNnMjQYo6Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SBZUkc8DHgYPY8Tdn57TObmwE4F7l85ex9TET2YdI96f5eMASzIM73VF7QS8JZc+v593PoEjd/qLxQZsmyms9OSYVfMihIbtnDnq8nCSwgOh+HadGUZQEJAUdmINL4q0gMHQLgoNAyl9PX0fKCzDopC6FfMbfxRD/4dopup189g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=noirlang.tr; spf=pass smtp.mailfrom=noirlang.tr; dkim=pass (2048-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b=X1iSBZqr; arc=none smtp.client-ip=217.18.210.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b="X1iSBZqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=noirlang.tr; s=mail;
	t=1783409804; bh=hrmBLMiatJ8vY8OdwuU8D1+x1QryxpSafNnMjQYo6Yk=;
	h=From:To:Cc:Subject:Date:From;
	b=X1iSBZqrEvHNrgxeTc4WxbAU8RqopdK6PRPJNTKVDA+ZEmdEWJY1EVrQ+cOrs7hof
	 oBd0COle7nyGM6p/LXb9eCMJ9sr6Ze/01m2VIyjqRnF8znpTZkSqwWwX8BhCGUNpQt
	 u/TU8LM1mOgl6235SHE6oqctdje3bgaLrzjFV7S6nD1FfiSI8C4atrCV27uh9gllzx
	 r5D4GlqR0jHSZlviWuRVEjQw+Rq6VqB3YAxHbCK8fySPYWExPNTUI+NicZDoPagruH
	 O2oKSGqXhDxQpe8F6PBBK51Ey5bPxlYuFkEhCe7tR0fT4Aks+ofeBZS7Pj9OEEEKFh
	 4Nt8df6PFeybw==
From: melihemik <melihemik@noirlang.tr>
To: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	melihemik <melihemik@noirlang.tr>
Subject: [PATCH 1/1] rust: prelude: improve generated docs for `build_assert`
Date: Tue,  7 Jul 2026 10:36:39 +0300
Message-ID: <20260707073639.33133-1-melihemik@noirlang.tr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The build assertion macros are documented in the `build_assert` module,
where rustdoc can show their purpose, where each macro should be used and
how a failed assertion is reported during compilation.

After the macro definitions were hidden to avoid duplicate root-level
documentation, however, rustdoc stopped rendering the explicit
`build_assert::{...}` re-exports on the prelude page. Readers of the
generated prelude documentation can no longer tell that `build_assert!`
and the related macros are brought into scope by `kernel::prelude::*`.

Use a glob re-export from the canonical module so rustdoc renders the
prelude entry as a re-export without inlining another copy of the macro
documentation.

Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://github.com/Rust-for-Linux/linux/issues/1242
Signed-off-by: melihemik <melihemik@noirlang.tr>
---
 rust/kernel/prelude.rs | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index ca396f1f78a6..b65f718d72bf 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -85,12 +85,7 @@
         VVec,
         Vec, //
     },
-    build_assert::{
-        build_assert,
-        build_error,
-        const_assert,
-        static_assert, //
-    },
+    build_assert::*,
     current,
     dev_alert,
     dev_crit,
-- 
2.55.0

