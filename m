Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B10F158A32;
	Tue, 23 Jul 2024 18:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721758372; cv=none; b=d8zV1d20BL45PmAZ6Iax9g8HJ7rVfhOzNS18AN01UkCOi436IyOArcExSa5W+zzGP6dOeOwIqUh866RG0ze0Fgx3J844Ga0iH5e+NKR1+z1V/KhqvvDIpkAY4+/8uIPhbv1wxxjbkweejk5KR+c123G5BnY5H0VM/J5rCDko9wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721758372; c=relaxed/simple;
	bh=ifLa6ui520OxD4tx6GpOL1mZtUOCjuqJJxFCxi3qo5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rIH1KdPu5iJambbGMnZ/eIt0uR+awNsAjuuJB+Etryb61ossl1YnGlsZGMgMzhoImOAQGb1ZnX3nBz9slD2jz8hsfZ71G026fgcVCUhzh6OLj63/tWTR4wXOIjYvK6kiUXTkYw46BByQKHQODEO4XZ7JLiF+p+YHqA00Y3k2Zr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdTrNimT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdTrNimT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDDAC4AF09;
	Tue, 23 Jul 2024 18:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721758371;
	bh=ifLa6ui520OxD4tx6GpOL1mZtUOCjuqJJxFCxi3qo5o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hdTrNimTX0/gfTHgSGZoFmyF1daiFhFp3RcVFXy3Z1FWilSHjnN5DFRMjhFSO6rbd
	 qgu6sUkW92cLIqvrtJFtPWeF1TILjkgG42fMbLGKsBZSPcbXQBiM/t0QcJamXj5lY5
	 wR8QhjcGGIUaBUSxDPcWTaXp8/EQ5aYE/eIIeBx6RcX4JNYqQwGeoz3pgtjD975Z3y
	 L5fvLLI7EeXF1LtxDngf/2iwXpEeiKjBWktrSadsuMQFLf3XU6GzkSABFzV92OhF0o
	 3qfWeDp9ONMjDc7tGt3Vmlc9VT509onYY9nqkJCQ11DguV42LBzkkPySGyQAeaIL+W
	 OP4Xqx2ia0+sQ==
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
	acurrid@nvidia.com,
	cjia@nvidia.com,
	jhubbard@nvidia.com,
	airlied@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 21/23] rust: error: use `core::alloc::LayoutError`
Date: Tue, 23 Jul 2024 20:10:10 +0200
Message-ID: <20240723181024.21168-22-dakr@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723181024.21168-1-dakr@kernel.org>
References: <20240723181024.21168-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use `core::alloc::LayoutError` instead of `alloc::alloc::LayoutError` in
preparation to get rid of Rust's alloc crate.

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

