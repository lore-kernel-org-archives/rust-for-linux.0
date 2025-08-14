Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E232EBDC6
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 09:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755164100; cv=none; b=vCL+DRwbGmDvuTHYosf0l5x0uhY1n0aWN9jC3FfF3GI6KMcz1oIu2JwksyBSdy6dTUB2lJ1qZNT+IRy6k7vgp9yzagd5gvoarqo1zDtB8r+pQvcI+4dkOnBoHJ8qe7J+62KGkU9RF6vUNZqHE2ppsP7JFm62D/G6on8o3GuMBEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755164100; c=relaxed/simple;
	bh=iJoYPl3qNwWXMrX3Fe3H6Bnv++cB+fO9kMhqD86lXPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kubQ05dOVU5X86gzbL+J++FsW0hdP5GJE6pxkA9MZ1wPxEAxe6cHSREQ/uZj86tK6K87mp0Pd31LQWywZkQ2RLO3DozLmCimhjApTeoNqRNdHU5Sh1TPn8geI/fs8ZXEvUE320pCx0e2R+GUjorbhrL1LlYhMw966dITaGxSR2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XyPKPwYV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XyPKPwYV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8A7C4CEED;
	Thu, 14 Aug 2025 09:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755164100;
	bh=iJoYPl3qNwWXMrX3Fe3H6Bnv++cB+fO9kMhqD86lXPA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XyPKPwYVBe5G1kB9RwNDuQcNWUKn/1ZFA8YuxAbzbhE1EGysM2+Hd8RieWOCZOCYv
	 DjGxyGRvfysHEW16ByC6y0STwaeC6XRAwNmEWJDG7E1F3DhxVYYzZw1MMptkfhbJ9/
	 N2rYGdHmXIOMjmJLxXNuAPgwSK/v4t/3rDfKoLToTEzMrvUaUS/xLIQ5toiHM/gMew
	 fredUWCb+BksixWp+8DhgG8/Te4fugSnKw3wFIAOgY/3kAADwigOBPYIAAWGkGMzlB
	 gmNAayxEXx/XRbz+F8+x+kB3xNvKv5maPxvkog712nsCBdBPxaYRohrp+1bBokqAZ9
	 7zjHzvhJOvzjw==
From: Danilo Krummrich <dakr@kernel.org>
To: lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	Liam.Howlett@oracle.com,
	urezki@gmail.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	abdiel.janulgue@gmail.com,
	acourbot@nvidia.com
Cc: rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 6/7] rust: alloc: layout: implement ArrayLayout::size()
Date: Thu, 14 Aug 2025 11:33:45 +0200
Message-ID: <20250814093427.19629-7-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814093427.19629-1-dakr@kernel.org>
References: <20250814093427.19629-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a convenience method for ArrayLayout to calculate the size of
the ArrayLayout in bytes.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/layout.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/alloc/layout.rs b/rust/kernel/alloc/layout.rs
index 93ed514f7cc7..5c3db8e9f930 100644
--- a/rust/kernel/alloc/layout.rs
+++ b/rust/kernel/alloc/layout.rs
@@ -98,6 +98,11 @@ pub const fn len(&self) -> usize {
     pub const fn is_empty(&self) -> bool {
         self.len == 0
     }
+
+    /// Returns the size of the [`ArrayLayout`] in bytes.
+    pub const fn size(&self) -> usize {
+        self.len() * size_of::<T>()
+    }
 }
 
 impl<T> From<ArrayLayout<T>> for Layout {
-- 
2.50.1

