Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D6D21D2D7;
	Fri,  4 Oct 2024 15:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728056602; cv=none; b=lf5az1Up6sw2wAu0sFR7VH7x/UtphvzurxETEjjyuDLMpZ4pOOsa0lCCiArRuV9pcJ11W96DcyDUKrWczGa/PcM1jiph22562t4lmw235qdeYgvpaEgPJ30JxaxMTQ0U44Wfdzkwy9MuR6VC7SiWsPvzCSoTX7xE0ec3pl7wBgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728056602; c=relaxed/simple;
	bh=83eAnIr1D5O9vSM1uHBUzB+eFQ2uxXd/+rUZl+c6k2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TCEOm4Tg13/u645po008aCfOQc+7b2156UGP6JKbIntiePgYuDk3RehdNoqWWtcFO2doQyJIMeTsU9AcVm3UgW2744R5cOp1rQd8NKTWoPniwb2AgI8Mmq1527EphBBvwyb4IgYcihd49YSrtG8A1W7mYdAoqfLdI1vHuFz133o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RAX5Fxuo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RAX5Fxuo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84BBC4CED1;
	Fri,  4 Oct 2024 15:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728056601;
	bh=83eAnIr1D5O9vSM1uHBUzB+eFQ2uxXd/+rUZl+c6k2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RAX5FxuocB81c4eS/xKda7a1vgBAAor7uSqS3MWtBwA7kw+xQ3UyS2nA03SKUGH+Q
	 pLhGAhPALTKoIQleAVL6AR3hqdHJEbrttt9mfwcZoRRbnLsIcq88/xrOL+IzCR8kPo
	 YoNd6gYwsTQek/s0Z3T91AK3r9l/HO1hxOshZy3AsZJV5ba1DNcxjoEs1hit3lWLa+
	 ELkhPNrbPYlJQwcYLil7DckqarR2yCx59JC0TBqlq5eFefw8zweVV+nq8t2aQy1syn
	 gBBaFWaEfo3J/eWy1zAi5mY80aDTblQfk8AXC2fYIo4PGhj7rGBd0WvvcBTMP2kCB2
	 uwabeVJOIAXxw==
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
Subject: [PATCH v9 14/29] rust: alloc: add `Box` to prelude
Date: Fri,  4 Oct 2024 17:41:18 +0200
Message-ID: <20241004154149.93856-15-dakr@kernel.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241004154149.93856-1-dakr@kernel.org>
References: <20241004154149.93856-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that we removed `BoxExt` and the corresponding includes in
prelude.rs, add the new kernel `Box` type instead.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/prelude.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index c1f8e5c832e2..d5f2fe42d093 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -14,7 +14,7 @@
 #[doc(no_inline)]
 pub use core::pin::Pin;
 
-pub use crate::alloc::{flags::*, vec_ext::VecExt, KBox, KVBox, VBox};
+pub use crate::alloc::{flags::*, vec_ext::VecExt, Box, KBox, KVBox, VBox};
 
 #[doc(no_inline)]
 pub use alloc::vec::Vec;
-- 
2.46.1

