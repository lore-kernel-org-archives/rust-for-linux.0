Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B9E16CD35;
	Mon,  5 Aug 2024 15:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722871347; cv=none; b=pCgPleqXGmvRUWd+RjoIgdIz8LU6XGETnBqqhn/saMy4bbmZA97vkdB0CbWA4jqQIMpugmKq22DcQkYM7wFsRbTPssDtx9ZQK9GfZjf4g8AGwM30d7dHktD/68j5D1BNPcYYdhI9feb97GiNyojyYS0gomAf3UyPygOp/NgZ98s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722871347; c=relaxed/simple;
	bh=Io2x+G7qKjrcvouOx2NWqdpFm0dKR4v0O7CzrkJKPPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TUX2JMqQlXKc9R43trz2o4N5gQfxvAAn5fcWaPbQyu1McBFqRk9fokz4wdBAtVeNEqPFTMJi79ZA8wEj9Yj+bbFR2yPzAdtx7kiSz5v8mE+ddfppOnADTZX7kmOuNLf8OPBdIlzvvm1B49FwS+RgDlWKDXlU4E+dXQy2LhyfPlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qoHEC5Ud; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qoHEC5Ud"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE009C4AF0B;
	Mon,  5 Aug 2024 15:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722871346;
	bh=Io2x+G7qKjrcvouOx2NWqdpFm0dKR4v0O7CzrkJKPPg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qoHEC5UdKarefAWF6zWNd2LvFyyq/4wBYNZgs6miJ6rFtPBVvOsC30fAeL88n+Gh5
	 uZQNESyqL8aEbnOBYoCjniO/U2YgYO2ZrKTcn/Iy6ZJrdJhFF3xntpiryK9mUD5Z+l
	 O5+q1s6FdysGzpYj+MpoBf4qKrVa3yUjrwqvN8gepAUkriIFx8hfj58N0LJT1RRfv+
	 a/Ro1u7l7plrczaR2exu4kVSBXWVNl3R3urzO/Yn52zdjxC5SW2XcgZjzoixC0Ix7x
	 SPxqv5DDTj8XOdWvdLo+wRTff1SDyK9iT5KFg9Bx//qbpsmRKsw9ZLtl+GHe8C0Lsz
	 ym3ShTTtCvHmw==
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
Subject: [PATCH v4 24/28] rust: alloc: implement `contains` for `Flags`
Date: Mon,  5 Aug 2024 17:19:43 +0200
Message-ID: <20240805152004.5039-25-dakr@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805152004.5039-1-dakr@kernel.org>
References: <20240805152004.5039-1-dakr@kernel.org>
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

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc.rs | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index 8a1cecc20d09..615afe69d097 100644
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
+    pub fn contains(&self, flags: Flags) -> bool {
+        (*self & flags) == flags
+    }
 }
 
 impl core::ops::BitOr for Flags {
-- 
2.45.2

