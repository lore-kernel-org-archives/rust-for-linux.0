Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089A53090DB;
	Wed, 14 Jan 2026 18:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768414837; cv=none; b=HxTB9cqGhuiNVEqS/1tjdaSRsI2RFAAFEWnnlJB7UHI6eUHhedOE+6aTC0HS/Okcvu+z2KvWtVYCaZwkVe1QpfEXLik5gTsUD8L0ZsITtCgWc3NPiIdA1R4aEmlDf4O1bPx4Yhk5OHG2XqB5wxhxcHIlCKC0AF7/hjCfVkpA/d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768414837; c=relaxed/simple;
	bh=CV47w0ujXkYDPyzD7fO9jbF9FgkD1cEmDT3s7Z+BjSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CwTAEATsB/8L110dJdxXi8kplIyeEUl3geIxD42sO9anLqPPWCoTc/ZNifPm45/GLPTdSuPVIu+NRRZ1XD2bbUQaHSGZA7CJ+ETZ84F30n0rGdL5O8QctkwAx0thhoKhmqNdGjMUWMF0HCO462ezafeh2iCZ0JmTEJk4SU2iunU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTD4+e6S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTD4+e6S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE9E6C4CEF7;
	Wed, 14 Jan 2026 18:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768414836;
	bh=CV47w0ujXkYDPyzD7fO9jbF9FgkD1cEmDT3s7Z+BjSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aTD4+e6SNJ9pULMTpK3N/BA36Js9SV9VAX/P4WBYhk97n7qyOtO1lKscZfAX6B5ZX
	 WTWckuO+/ZZGvDMk0unqT8t2VXJqsQ4LKXzlf7c3Xj5FEdujQydFC5zrbHLqPCaVbt
	 tEZDpuwfGHenLwUkH2AXzPoEAUJMOBnOai4olQcx9HBUo9st6oQlO8HATYLYmPEiog
	 gCpTjYG7kzdUGuColqkJDJ7z3PtxoytXGkXQ/XN+CR0H9bWIIt2EU4OH61JhwGZiYg
	 /wPnmeZjr9Ku2WUw1So6kx68OHO/FlxORL0nKXakFvLrC13yp0bwdl+HGFSCSMUVd1
	 V9gcXKJqz2fgg==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@Kloenk.dev>,
	Tamir Duberstein <tamird@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/15] rust: pin-init: add `?Sized` bounds to traits in `#[pin_data]` macro
Date: Wed, 14 Jan 2026 19:18:43 +0100
Message-ID: <20260114181934.1782470-9-lossin@kernel.org>
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

The `#[pin_data]` macro uses some auxiliary traits to ensure that a user
does not implement `Drop` for the annotated struct, as that is unsound
and can lead to UB. However, if the struct that is annotated is
`!Sized`, the current bounds do not work, because `Sized` is an implicit
bound for generics.

This is *not* a soundness hole of pin-init, as it currently is
impossible to construct an unsized struct using pin-init.

Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v3: none
Changes in v2: none
---
 rust/pin-init/internal/src/pin_data.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index fb4b8507c01d..9a43085f0864 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -231,7 +231,7 @@ fn drop(&mut self) {
             // if it also implements `Drop`
             trait MustNotImplDrop {}
             #[expect(drop_bounds)]
-            impl<T: ::core::ops::Drop> MustNotImplDrop for T {}
+            impl<T: ::core::ops::Drop + ?::core::marker::Sized> MustNotImplDrop for T {}
             impl #impl_generics MustNotImplDrop for #ident #ty_generics
                 #whr
             {}
@@ -240,7 +240,7 @@ impl #impl_generics MustNotImplDrop for #ident #ty_generics
             // `PinnedDrop` as the parameter to `#[pin_data]`.
             #[expect(non_camel_case_types)]
             trait UselessPinnedDropImpl_you_need_to_specify_PinnedDrop {}
-            impl<T: ::pin_init::PinnedDrop>
+            impl<T: ::pin_init::PinnedDrop + ?::core::marker::Sized>
                 UselessPinnedDropImpl_you_need_to_specify_PinnedDrop for T {}
             impl #impl_generics
                 UselessPinnedDropImpl_you_need_to_specify_PinnedDrop for #ident #ty_generics
-- 
2.52.0

