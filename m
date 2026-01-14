Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA3533507C;
	Wed, 14 Jan 2026 18:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768414797; cv=none; b=Divt5R1LffObV3HOTJ/tqxcw7cV7DcI0s21OxHOROfY9SYHpa72Id8ur81IQIwLy+I4R6DNEsYQ1kRQhO7ozOtRDDHYlRnnbn9PVzvVeGBNI21ovU6Sx4DX0kqa78UEggjSfwRnK+bkgkRJxD16jWMGUOSNDh/VXqRGzjjWg1GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768414797; c=relaxed/simple;
	bh=hGhXVZY+RziJfmqs+dCjxKw2YK2cfYgpw7/fwMocajI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mdsl/ibxJ7Q6IgaaKmSxmjrEFsLUMe5Y/EinwuoMPFaAueK5JBlfO8J0NPuCyCshcqyGyHDb2VyrGlJ8eTvz1e0ugcqZqQAcVSjIOx5S43CMIwBMcF2inVxO5xeH6LSOI580ARYzKuiMllZocDiY7bAMq0fszJXPrbES60cSjUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K19ZztKK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K19ZztKK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723D2C4CEF7;
	Wed, 14 Jan 2026 18:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768414796;
	bh=hGhXVZY+RziJfmqs+dCjxKw2YK2cfYgpw7/fwMocajI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K19ZztKKj5zaEaBygzkEZ/PQ6CaxLvtrCg1c+ICXboUg4FA07f6RY7KNq6BjwrdsD
	 X6w3y00//QuynlkJdzrcNZZIFgNOA9ZTUk3mn1qTUik2lTGjvkIKELSnciVa+X3iPj
	 A/+QW8Cpy6asmD2m0scWuXgQZeC5XJFiwD9WZRHgCRQEP0tWU7K6jW593k+k9bHeei
	 z6u3PGVkRRoXc7RwN7mHESZXfpiUgCIY3jVFWIJ6gmsSMfiUMGaIoSUAPyp36yMDty
	 o8Ds8BQWmcyzqH6/KD153h5Pf8wnisaQCd1B9MFZoaNq5zZ/C743pkL+9g3DulsknF
	 UP34NRD9vpv5g==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@kloenk.dev>,
	Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/15] rust: pin-init: allow the crate to refer to itself as `pin-init` in doc tests
Date: Wed, 14 Jan 2026 19:18:37 +0100
Message-ID: <20260114181934.1782470-3-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114181934.1782470-1-lossin@kernel.org>
References: <20260114181934.1782470-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `syn` approach requires use of `::pin_init::...` instead of the
`$crate::...` construct available to declarative macros. To be able to
use the `pin_init` crate from itself (which includes doc tests), we have
to declare it as such.

Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v3: none
Changes in v2: none
---
 rust/pin-init/src/lib.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 8673008f45d2..0e707f00061f 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -290,6 +290,11 @@
     ptr::{self, NonNull},
 };
 
+// This is used by doc-tests -- the proc-macros expand to `::pin_init::...` and without this the
+// doc-tests wouldn't have an extern crate named `pin_init`.
+#[allow(unused_extern_crates)]
+extern crate self as pin_init;
+
 #[doc(hidden)]
 pub mod __internal;
 #[doc(hidden)]
-- 
2.52.0

