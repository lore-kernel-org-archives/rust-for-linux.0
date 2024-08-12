Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABF519A282;
	Mon, 12 Aug 2024 18:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723487151; cv=none; b=WEfd5RfFn1DGGq95GT1t9+Rbitk8fChOBHNS5o3hY2Idx6oYnw6Q1p0tyqSX1TtiYNez+AW0jhVWY0pIXT+1M2mY3QuSLSC/ltHs0/n5F4ebiHEK6+oHQGvX2CbcuAogMlXm+6WnIoKnOSCkLblqqyIg/9u0fIoCux8VmnJ3bek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723487151; c=relaxed/simple;
	bh=0dpQ6RwX2xjp+lowuXDw7W+vANiY3byDZScI1bxbWmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItPIfNVWvUkrM5UjHyMaZGStktCS8+DQjTYZPKmHFECttdXtQmnpdO4EkPK2SfDrMamizZ6YKbpTG6HVWyDPPODjQ7mr7ZkCJ19FHrSqF507VaeMCQ6CMFftGgd3EyUSADfSLIq/4nDuw11IEn+qt1C4+LWQBSn19tq931lJSY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFANQs8K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFANQs8K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1086BC4AF0D;
	Mon, 12 Aug 2024 18:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723487151;
	bh=0dpQ6RwX2xjp+lowuXDw7W+vANiY3byDZScI1bxbWmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RFANQs8KnWUbqjWcgpReCK3akBNyTxN5G7+ALY8zDgxdFBUbg91hMAYGLm8Cyy46y
	 8hQ3vT0NqM6HMBHSF7PX/VMuaWGV6mqSQsdqCsquwk3VNxrZsONORzV7d1nPVvZhFR
	 g2ojtllxh+Pkc9ypjJW9hBOU5J/CAVz2utpgqVYP5Ty+Itj77oCQRABIyPQHSL6bv3
	 cbZFxVx2do+sVzOMzZnlTpud1jdCOey3VwBjhOOZqaQYrwBUvp1JySoJIiPfkjS5Zp
	 E+FgglRyvAii+4VL4l9l8d129f9gLgWwCHBKnPLqu9NtmuAn2KirH56B/V7DCIW5gY
	 wP2q8rBP7VSEg==
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
Subject: [PATCH v5 19/26] rust: error: use `core::alloc::LayoutError`
Date: Mon, 12 Aug 2024 20:23:05 +0200
Message-ID: <20240812182355.11641-20-dakr@kernel.org>
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

Use `core::alloc::LayoutError` instead of `alloc::alloc::LayoutError` in
preparation to get rid of Rust's alloc crate.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/error.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 145f5c397009..2d012cc3881a 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -6,7 +6,7 @@
 
 use crate::{alloc::AllocError, str::CStr};
 
-use alloc::alloc::LayoutError;
+use core::alloc::LayoutError;
 
 use core::fmt;
 use core::num::TryFromIntError;
-- 
2.45.2

