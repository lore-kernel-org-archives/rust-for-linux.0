Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D6930E0E5;
	Thu, 11 Jun 2026 13:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781185700; cv=none; b=D2m2kUhxxwvu4TEKLSAIHC9qZwii+UIT7PIN0nUF+1IPDNM6P/jjcn+QEvRFIFR81fTr4jiDXtb3dCdoxDOiUWv375+Jdd1LDtfJC7ByUTNHS88v9UdFBoDkA7OJT8a9QVwvcPMc2gHtfbCREzEJWhIF/VCPSrV4aIdL9MHQpmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781185700; c=relaxed/simple;
	bh=dI7RDksMUVTchlgdbbeET0iTAKX0f8Xq0FbfIQjJHLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X51bEfsYOs9GfFR4NmoF8GEshLhDvecaS/CFBYujEKGAtU/tK+ogqCwdn6LF7FjV2e9h3mkckOJp9oxfwoaskm/V1BwiXoG71OVqqfxE06fHNEuUQDPbExcceKy7JWncwCnoIoVG2hOQzY6Q8RC3ewQz1Y3g/9N48xl9IYAg+C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6+J3hWz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6+J3hWz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED681F00898;
	Thu, 11 Jun 2026 13:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781185699;
	bh=TAYuWQ/bx1X6qxpmisJtDx2Gf26MjNzatOtWGjQ2k2I=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=f6+J3hWze6nn9z1yRTZ57H8ndHkJI8cPKnPQFpQIJd0oPcboIWyOdO0hkkRPeLF8e
	 ChVoi9aeIIWXlyTq+qzGA14MLq4knSumSlafkUrmOltJfasjh4n/80k3bF1DtDcgU1
	 N4gzMK6QznB5Ly5OQKJyB9lEBjW8c2AMaivSWsk9BVanNTTXW/NxWeinYSvHym52jO
	 utI0zUk1IGnH2TLCPpvinKwPA74SyCvzmIdioDOf6L57rDORx+b/ZwHTu97ppM06EO
	 u0EyWz6erKEkhVEBWTJMmrUyk6sBPI0uEoLmO3Y2tEt2Hs9M7IFfA01KUIlup9ZTUS
	 ANybl9IyDjPdQ==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: prelude: add `zerocopy{,_derive}::IntoBytes`
Date: Thu, 11 Jun 2026 14:48:01 +0100
Message-ID: <20260611134802.2052296-1-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

In order to easily use `IntoBytes`, add it to the prelude.

This adds both the trait (`zerocopy::IntoBytes`) as well as the derive
macro (`zerocopy_derive::IntoBytes`).

Signed-off-by: Gary Guo <gary@garyguo.net>
---
This is wanted because I want to convert the upcoming I/O projection series
to use `zerocopy` traits rather than keep using transmute module.

It is most helpful for derives in doc tests; I do not want to explicitly use
`#[derive(zerocopy_derive::IntoBytes)]` in the doc tests.
---
 rust/kernel/prelude.rs | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index ca260cc3937a..a97cb0af5d02 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -61,10 +61,16 @@
 };
 
 #[doc(no_inline)]
-pub use zerocopy::FromBytes;
+pub use zerocopy::{
+    FromBytes,
+    IntoBytes, //
+};
 
 #[doc(no_inline)]
-pub use zerocopy_derive::FromBytes;
+pub use zerocopy_derive::{
+    FromBytes,
+    IntoBytes, //
+};
 
 #[doc(no_inline)]
 pub use super::{

base-commit: 98cc68794c003bc76fc9da2e8a075e947eee5921
-- 
2.54.0

