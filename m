Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B31419B3EC;
	Mon, 12 Aug 2024 18:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723487178; cv=none; b=lUHgW1NWeQPEGhtHjLoxjKDbM/AjMfnGEzrcA6zl5UTXKCFAIESy+xo0xI1MUfe5V6DSbtHQ71hoq40BJECHEohwgzC83AjQa51jw16FTmHoBUcDjU2GuN9ZJ9+h2SbrkJMbVLh3DKee4RiPrvFTuID3JXgOHaAFIpZnORsEk20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723487178; c=relaxed/simple;
	bh=blDL6gfz+IKgF0QGtqP0bU2aIjtbW4lMlGcoQxrbKCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GgbtsI7e4r0iQfPZo7jJdIEAO32iHSUPEEr0dyLJoaGaJiIHsJZ6IokxAihtf2rQiRNIbY0v4+EBz2uD5FbGC7NSE2RXeY5A41DhwpexemiMDbufOxBvAK8To2VT9aOi1BtZdYs5AHEaQ4gYhcO4Uj8uXL/UtgRP5MoK2WNi3/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j0ejD2cK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j0ejD2cK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC2FC4AF0C;
	Mon, 12 Aug 2024 18:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723487178;
	bh=blDL6gfz+IKgF0QGtqP0bU2aIjtbW4lMlGcoQxrbKCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j0ejD2cKN1Yda7MLbZ1sGcQbdEykpeupJ5GzPzGRGxYBhzuKhNwTbgYdHuXLkWvDK
	 /RUO4uugW0iM0P/QTXZA2Iph+OGwWBO9VpBZ83LwxJo2DOVZ0IBnRNYEgUhKSQU91u
	 yxvHaWSNEezuB/y14tKW15XS1MF/Ir6HnqsiRxpnlZxXYfUw6KDF491K8qq3ZI8Xil
	 9USenuaFeAd6QGmwCPocQ2MUj5Jklpflnt32sggrRqvJkEftwifrXb5ZLM9ZzncQJJ
	 pnX0qMZiwpWdiOFwhZpC73tM7TKDkRnSm5IEiUHlSwSiz2+KeEiAADLfFw9leKcXL8
	 L8lVNrPJBzkzg==
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
Subject: [PATCH v5 24/26] rust: alloc: update module comment of alloc.rs
Date: Mon, 12 Aug 2024 20:23:10 +0200
Message-ID: <20240812182355.11641-25-dakr@kernel.org>
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

Before we remove Rust's alloc crate, rewrite the module comment in
alloc.rs to avoid a rustdoc warning.

Besides that, the module comment in alloc.rs isn't correct anymore,
we're no longer extending Rust's alloc crate.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index be2bd0f1e74a..b2a41359a18d 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-//! Extensions to the [`alloc`] crate.
+//! Implementation of the kernel's memory allocation infrastructure.
 
 #[cfg(not(any(test, testlib)))]
 pub mod allocator;
-- 
2.45.2

