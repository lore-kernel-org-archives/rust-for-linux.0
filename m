Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1165349CD
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 18:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917308; cv=none; b=OjdAuU8X9FkudcFLDIQXMyz1XTv9GZJAUvTnhvY6N0VcOzqWMKA2/rXZ9srgzeebXKjH2PGF5tNbqqDq2NydJtPGK9WuDLeEGAUOK9b8pAFPyYCtk4Y6+a9TB30oLs9V4YT8fOVRZvSJFSpzfjlf+tluRWp4Ybm5Nv04bulsTZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917308; c=relaxed/simple;
	bh=/iRUa8Jop9ZIDIHXEGggbzqWv+kCL4oF4K7yt9Qm/1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tyvYYnSZtj/VgH0Cz4/1BkmE4Ynnx6FW82HnGy8sttqnriiVIBaVT17WOwRU55SJugqTzc/M2hEwWqcCnJQzanLR5F3IV51S1xznpwGIriSz9njdcJOMWMg3nvVNFndwQ+Cou/9wspquKzWhzGBseSB+ZHeyOlDJ6IU/JmeFDgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emwQI2yp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emwQI2yp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE471F00893;
	Tue, 13 Oct 2026 18:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791917305;
	bh=rYad4N+SCpeoxyLv/urV6+2tHBl57W3R7wT9tGbzhsM=;
	h=From:To:Cc:Subject:Date;
	b=emwQI2ypjOHGaVn80j69J2QkxDCDLMl5jvg0CBv2i7PXtrqGxq5xajy38W2Oz3j+s
	 px8e3fkuWtxQFxuR/YYBGopiuplO812UD4/NLICYPTcI2VO5wqg8ALfA1Y5HWovHRg
	 rHCAwKZzIQXS5ONxSx4MutCIfK43AcTEKa6NSNZVGpzYFlX3x2shruwlT7H/p8wsZ5
	 azX1goRKqDgp40v6GjPeIACztO77t60xiV9zUSiQiON4qg376DhOOUWBIduYbENQYm
	 9Co33FTaYdIZsd1g9Kjd6yC+QvenW000gcXLhzXqpIOAhc4epD1nNrrhx1RIbBx5ce
	 dd6avY5eiV4qA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
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
	rust-for-linux@vger.kernel.org
Subject: [PATCH 1/2] rust: zerocopy: fix link to upstream `README.md`
Date: Tue, 13 Oct 2026 20:48:07 +0200
Message-ID: <20261013184809.35143-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream moved the `zerocopy` crate into a `zerocopy/` subdirectory
of their repository in v0.8.51 [1]. However, in our v0.8.52 update,
the link was not updated.

Fix it by adding the subdirectory.

Fixes: 2808a3963988 ("rust: zerocopy: update to v0.8.52")
Link: https://github.com/google/zerocopy/pull/3434 [1]
Assisted-by: LLM
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/zerocopy-derive/README.md | 2 +-
 rust/zerocopy/README.md        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/zerocopy-derive/README.md b/rust/zerocopy-derive/README.md
index d62c79804342..49de31b8e082 100644
--- a/rust/zerocopy-derive/README.md
+++ b/rust/zerocopy-derive/README.md
@@ -8,7 +8,7 @@ non-ASCII identifiers.
 
 For copyright details, please see:
 
-    https://github.com/google/zerocopy/blob/v0.8.54/README.md?plain=1
+    https://github.com/google/zerocopy/blob/v0.8.54/zerocopy/README.md?plain=1
     https://github.com/google/zerocopy/blob/v0.8.54/LICENSE-BSD
     https://github.com/google/zerocopy/blob/v0.8.54/LICENSE-APACHE
     https://github.com/google/zerocopy/blob/v0.8.54/LICENSE-MIT
diff --git a/rust/zerocopy/README.md b/rust/zerocopy/README.md
index 3d11a6502cf0..8443f6166008 100644
--- a/rust/zerocopy/README.md
+++ b/rust/zerocopy/README.md
@@ -7,7 +7,7 @@ modified to tweak the SPDX license identifiers.
 
 For copyright details, please see:
 
-    https://github.com/google/zerocopy/blob/v0.8.54/README.md?plain=1
+    https://github.com/google/zerocopy/blob/v0.8.54/zerocopy/README.md?plain=1
     https://github.com/google/zerocopy/blob/v0.8.54/LICENSE-BSD
     https://github.com/google/zerocopy/blob/v0.8.54/LICENSE-APACHE
     https://github.com/google/zerocopy/blob/v0.8.54/LICENSE-MIT

base-commit: 3132a951a7e4ec2e18bc314877137deee96ab83e
-- 
2.56.0

