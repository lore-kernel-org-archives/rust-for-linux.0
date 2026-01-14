Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C49D335545;
	Wed, 14 Jan 2026 18:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768414873; cv=none; b=MHaTR5BK/S2u1oXZTuW7aRNolcFi6jbMZg8WhrNiEUfYc2T3m6bA5cmkoIlaVcL+Oo/NG0Ah3UiPJ7IGct02u8Rsfh8dOmzyp63yzL0q00vR6zBwgL36rJhLJuYcWWRXqVnAu5u96tEKxxw6XMFpiZkJnIAU+PMWpRH/iBtC17w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768414873; c=relaxed/simple;
	bh=TovhvhkSCtl8GhxeFk8OsjYd3H0Q7/U6ekdPYLk5f8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zc5VZLmGf7ULUbqQpuASSQ/QWAZRcjQpMY7Klr9vgFNdbi6lIQbK8wFov7dZLALz1BNTkQkcOpNwPKfucSzAlEBY5ZXnRqASqUouZ6vPzoVpykBvI1oEGY8a3GzWN24fHfwNVYPMfwcBlr3dmZ7oFu0pYr0ndV3IHl0WQlFLP/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdZ15p2s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdZ15p2s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C06CC19421;
	Wed, 14 Jan 2026 18:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768414873;
	bh=TovhvhkSCtl8GhxeFk8OsjYd3H0Q7/U6ekdPYLk5f8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SdZ15p2s6UNs7yG5j0GIz7OVAMfFJIEa6AiKTiWTf/T5HcZGuGKWYBSCqHOOMOynJ
	 jkyGTmG0g15Z4bBudf7KsN4VELPi9AJxO/UsUlw/WUyKgf7JqbrqL2s7+U2vwJgR7l
	 v6JiIBff8eT8ne8AeKgfraM+esWxvWXOwqwy6fekLnNHBAR9Y4o0AEmNzX4uqP28yh
	 DKx6WM7bo7gxoqwIm+9GfWipGopB3MojtYO9llF/SyIA+2j7QYmkav7mSLAEdI8A5f
	 8F+q8y5Wmnm/b4NOU6hr/218VAaVP5TyqqjnWsesaV/6Ypqc/bLZUvoQ/wboz9wXm/
	 MBMCy+W1mBTyQ==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/15] rust: pin-init: internal: init: simplify Zeroable safety check
Date: Wed, 14 Jan 2026 19:18:49 +0100
Message-ID: <20260114181934.1782470-15-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114181934.1782470-1-lossin@kernel.org>
References: <20260114181934.1782470-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `Zeroable` type check uses a small dance with a raw pointer to aid
type inference. It turns out that this is not necessary and type
inference is powerful enough to resolve any ambiguity. Thus remove it.

Suggested-by: Gary Guo <gary@garyguo.net>
Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v3: none
Changes in v2: added this patch
---
 rust/pin-init/internal/src/init.rs | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 523741e62bd7..1b43e8847aa8 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -415,17 +415,12 @@ fn make_field_check(
             #[allow(unreachable_code, clippy::diverging_sub_expression, unused_assignments)]
             // SAFETY: this code is never executed.
             let _ = || unsafe {
-                let mut zeroed = ::core::mem::zeroed();
-                // We have to use type inference here to make zeroed have the correct type. This
-                // does not get executed, so it has no effect.
-                ::core::ptr::write(slot, zeroed);
-                zeroed = ::core::mem::zeroed();
                 ::core::ptr::write(slot, #path {
                     #(
                         #(#field_attrs)*
                         #field_name: ::core::panic!(),
                     )*
-                    ..zeroed
+                    ..::core::mem::zeroed()
                 })
             };
         },
-- 
2.52.0

