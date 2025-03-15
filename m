Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3CC2054ED
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 15:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742053488; cv=none; b=ZVO3ev2udoUquDu5diOYIkc87Bbcuc39u79zDjxUxobP9yL6kRKoYMmd6GcmXyDnEzZkV4cqiyyH1+zvPHLztGrjeiGAp5R9btePdEn1kN+wsfItjJmxUjmf+rRFOJJJ1iSgkY20yUK75IRBXv4ALreqjYlwev3KPl7ytkkiyU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742053488; c=relaxed/simple;
	bh=hERTBrbk/N8w8Qq7P4x6ngWZ9KVCIzlc7iIfuRZalKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K8inYKsdKffARbbOvibPd8N40yNiXoumZQm1N9e16hHQ6pvDFSSv7A03uWH7hpXthu0aPcEc4GJzXBMErqq2HnGQI5wtj1B1o2PPUh62DT5t9oXmOclkyS7sf88GUHDSIeMMsxw57WY/cYBxIqzFqE/Pr9PMaZDgBeC9Nj7Y8fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpapJ6QW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpapJ6QW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420E8C4CEE5;
	Sat, 15 Mar 2025 15:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742053487;
	bh=hERTBrbk/N8w8Qq7P4x6ngWZ9KVCIzlc7iIfuRZalKU=;
	h=From:To:Cc:Subject:Date:From;
	b=fpapJ6QWZWeQuRLjiJSuPyVJMiHe3Twjaiy0g7mPka4SBHgUD17EGI0es63z3DzVE
	 xIwCGGYL3PZ9YulPYp53yPTnd3CRJXIpk9lMUU57yeRu78C5uFmzo+x18yKfi4Z/Sp
	 aFj6J/HOSlHJE4Tw7E51CRWH8Uslm3oBlRTLThR0VRepWd3lUu52stW3XGiPwwah5Z
	 zi66IXVK80RD9sjNCZeY0rye9Qd60yMbzNd8cYPgpIbMDrevrsmQ+E9J0SsCqQ17Kd
	 JWw+sSf06U2KpfrkaLoXvv5zLVBHtZBWMMw6fN6SVKcDf5kyJgDdYdaVJVREqAflNw
	 NMOZILKLMjQKA==
From: Danilo Krummrich <dakr@kernel.org>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: andrewjballance@gmail.com,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/2] rust: alloc: extend safety requirements of Vec::set_len()
Date: Sat, 15 Mar 2025 16:43:01 +0100
Message-ID: <20250315154436.65065-1-dakr@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the safety requirements of set_len() to consider the case when
the new length is smaller than the old length.

Fixes: 2aac4cd7dae3 ("rust: alloc: implement kernel `Vec` type")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/kvec.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ae9d072741ce..8540d9e2b717 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -189,7 +189,9 @@ pub fn len(&self) -> usize {
     ///
     /// - `new_len` must be less than or equal to [`Self::capacity`].
     /// - If `new_len` is greater than `self.len`, all elements within the interval
-    ///   [`self.len`,`new_len`) must be initialized.
+    ///   [`self.len`,`new_len`) must be initialized,
+    /// - if `new_len` is smaller than `self.len`, all elements within the interval
+    ///   [`new_len`, `self.len`) must either be dropped or copied and taken ownership of.
     #[inline]
     pub unsafe fn set_len(&mut self, new_len: usize) {
         debug_assert!(new_len <= self.capacity());

base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a
-- 
2.48.1

