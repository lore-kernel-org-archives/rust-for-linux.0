Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65179337B9A;
	Sun, 11 Jan 2026 12:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768134400; cv=none; b=jMCMpau2tQqg3TJOmpVxZYP+uoSazbJGTx475UDizNry7LLn6Uknn05D3Tdun9RAb7pjd5KElWPhH8G0QTWvXu5PRyEetqH76YzbRNKCNLRvCmeqpVU4Sj4Oyp4NhO87ZvnZN/7oGEg3ZnlKpZkywaekR+84u8kb0G1NtmI4haU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768134400; c=relaxed/simple;
	bh=N7HSaxNkQcuoNj9IXUHOPe2uzd5cDblZ/urffCH2WCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ax8+il4qMKpeu8iWOEunz5z0AVgsfpY0LHA8fPlpDA6gMwQC0iPAYncFIB/VmDHmdIMFinOZvVOCv7QQn+7W0SPw3ZO+QKczno/bXRuxZR5oS6OkItvIfpC3gdturtEwIPX2neq0Sbr2hJ8Jfm9FZBxzYiyCYkMclkhtOD6wwnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCuxopmc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCuxopmc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E20AC19422;
	Sun, 11 Jan 2026 12:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768134399;
	bh=N7HSaxNkQcuoNj9IXUHOPe2uzd5cDblZ/urffCH2WCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hCuxopmcV3V5+tGPCnqsCRq7t8DzMH5jAONJ7ar/vlQeF3O8oEy0S3FqIWSDjmmoT
	 VrOCWN2SuzF3rlAUdnU+U8JdjHGH/BBOjglKnetsSNcqTZBjPCWxtgKNMNOIIT9SvU
	 yt9fUFZZs3PCoGVkcBBtJOCZj4AzvbBrWpZFl+ufQExDH9LXKswfgq7zQLvsoXC2IF
	 8d5UBZN07ugy5jcng4wSUSHYqGT1whP1QZ8OeP2JNH8obyPtgiCFZ4vMm+t/8cHPDo
	 HjelA3o0ZRWSAJeKQuQKPPuq7pueTFWC3AJBCKSzir8njT7D0b5sGvaNSl87fGNp4s
	 TV/Ijj9LDUWKg==
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
Subject: [PATCH v2 02/15] rust: pin-init: allow the crate to refer to itself as `pin-init` in doc tests
Date: Sun, 11 Jan 2026 13:25:00 +0100
Message-ID: <20260111122554.2662175-3-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111122554.2662175-1-lossin@kernel.org>
References: <20260111122554.2662175-1-lossin@kernel.org>
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

Signed-off-by: Benno Lossin <lossin@kernel.org>
---
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

