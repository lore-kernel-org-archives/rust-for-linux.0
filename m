Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B40F194A75;
	Mon, 12 Aug 2024 18:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723487162; cv=none; b=Qy+PhNtkDNmL8y3GFSBIVANLUvo3qWViHgZ1aBUKgPoXWfI/ZQdT8n2+ewW59UJTl3uCacl1IYDOYxmPRjjnjpy15LPDd156mCIQAmK/pKxK6A9Kd74jCEGn7phjWr+mzqUxEaN9O/HLEhMPXEfOtcGANQ6w/3tPEeFetp7jq7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723487162; c=relaxed/simple;
	bh=tl80HVK20EtCGNYhPnG7N36D8g8ociS1KN//HywX5k4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KfesOG/kfwG82XZ6QsVckvHsr+JevRe3njBy8mclQlIk1J7sQF/u0xIuNauyrVix/k5GPSVCOwmprW1dzrAFc7BpcBc+UnJBUMcDjTTQ2aj+fdtRZkEIIfXy1/bDyINlr/KNDnoelvJQkOjHswNReeu6hw1BLKVG8miXrzHW8v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fE8d51Uy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fE8d51Uy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB24C32782;
	Mon, 12 Aug 2024 18:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723487161;
	bh=tl80HVK20EtCGNYhPnG7N36D8g8ociS1KN//HywX5k4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fE8d51Uywi9gQkO5aVDXQS6bCB1Esv9I/pGSi59+t323AQL2pLKex1YwXjRRlx6d5
	 /eMp8maDX8Z24YUglnm+TSz8p7tRMIXY6wA+hBLiVjTzJB8Z8UI4V7rfMUIySu8X05
	 NbpWU0BEcdDgCiWUCEJnk3RlTEtUoBjFYUZ8WYduUgOgZvaMJuvH5NX8w8Gb1L7yJN
	 UOC7iLtJy1PUyPNFyWha7v5bQqsNZqK1J4V/j69V+bjeeiTqX8Fh8BY5ogM0CUP9H0
	 XS038gpPB6uo1XOmJhNY4JDsPmsllDzyaQFHv2n1Vfa6YQEuYH9rcE9xx7NjVAw0lk
	 iaDfSWN3spO5A==
From: Danilo Krummrich <dakr@kernel.org>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	akpm@linux-foundation.org
Cc: daniel.almeida@collabora.com,
	faith.ekstrand@collabora.com,
	boris.brezillon@collabora.com,
	lina@asahilina.net,
	mcanal@igalia.com,
	zhiw@nvidia.com,
	cjia@nvidia.com,
	jhubbard@nvidia.com,
	airlied@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v5 21/26] rust: alloc: implement `contains` for `Flags`
Date: Mon, 12 Aug 2024 20:23:07 +0200
Message-ID: <20240812182355.11641-22-dakr@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240812182355.11641-1-dakr@kernel.org>
References: <20240812182355.11641-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a simple helper function to check whether given flags do
contain one or multiple other flags.

This is used by a subsequent patch implementing the Cmalloc `Allocator`
to check for __GFP_ZERO.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc.rs | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index 820ef6072e02..be2bd0f1e74a 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -34,7 +34,7 @@
 /// They can be combined with the operators `|`, `&`, and `!`.
 ///
 /// Values can be used from the [`flags`] module.
-#[derive(Clone, Copy)]
+#[derive(Clone, Copy, PartialEq)]
 pub struct Flags(u32);
 
 impl Flags {
@@ -42,6 +42,11 @@ impl Flags {
     pub(crate) fn as_raw(self) -> u32 {
         self.0
     }
+
+    /// Check whether `flags` is contained in `self`.
+    pub fn contains(self, flags: Flags) -> bool {
+        (self & flags) == flags
+    }
 }
 
 impl core::ops::BitOr for Flags {
-- 
2.45.2

