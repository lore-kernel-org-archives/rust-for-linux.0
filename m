Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3474519F411
	for <rust-for-linux@vger.kernel.org>; Sat,  9 Nov 2024 20:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731184238; cv=none; b=G/KCv5bDbnMfNOTrhPphvHL5wCySJYGRrNt/38Vu6qifV9ymitYEPxXXOF0KnXRJIMUxKbcaQSOZ2iJ5ztrXufCuZ1NHThTNSRUrp/6wlp0h/HuaL9/DCq7L9e6tsJOv7DgilWPExu+ugawTTcuH8WwO+Pt1UrHVwlY0Z6jC20E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731184238; c=relaxed/simple;
	bh=FHGhaxX9A6w6dofyFIe2kgutlpUueSeGpMF8xdQrn74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nb60TwEvzBChJype4N3ZjU9Uz/noaBWPvXZrPS5QFL8u7X8D/0ZHaIrvh/k70BadvLdFvRkJp0iJXdu091hQIDUkEDylCuOpg7NIespm5lP032UHnAyVqFvzJFar89wf2ONe3zzTQ75R0Z3ybcXf8MubhB2lREEDEu01edXwq0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tkeapy/Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tkeapy/Z"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0D89C4AF0B;
	Sat,  9 Nov 2024 20:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731184237;
	bh=FHGhaxX9A6w6dofyFIe2kgutlpUueSeGpMF8xdQrn74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tkeapy/ZdaLRLQ3MD5IIDNG7Yu6+QkNNgFMAdMTU5qUQqrJ020K3/dkKA2UULdVE9
	 8Nhv+d9D+RQ8xn99NDxMbI6Brh8kiGVhzcpzS1HZQPVWLBQFGWW6pNQnRuWoJkDwcj
	 fWpOQeJCXHvxEjUiGSMx5NRueMtEVSakEfDXFHtvzR4mr6P+QvMVcvO0llElvcwM1x
	 UnsaWhQby3auX4nBqX6zi/oGt/UFae46Ag+G+E9tzF7ETRIUbuoIwQWAeDrmm14Yyz
	 MI1PtVFsTIkCNJ/oYUzka5V3MmByWmsv1I1n2SxHtMyh+bUJCXrxMA84g2GvT/uZDD
	 TLKcR2+MHyx/Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03EFD5E384;
	Sat,  9 Nov 2024 20:30:37 +0000 (UTC)
From: Jens Korinth via B4 Relay <devnull+jens.korinth.tuta.io@kernel.org>
Date: Sat, 09 Nov 2024 21:30:09 +0100
Subject: [PATCH v3 3/3] rust: error: Replace pr_warn by pr_warn_once
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-pr_once_macros-v3-3-6beb24e0cac8@tuta.io>
References: <20241109-pr_once_macros-v3-0-6beb24e0cac8@tuta.io>
In-Reply-To: <20241109-pr_once_macros-v3-0-6beb24e0cac8@tuta.io>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Dirk Behme <dirk.behme@gmail.com>, Jens Korinth <jens.korinth@tuta.io>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731184236; l=871;
 i=jens.korinth@tuta.io; s=20241107; h=from:subject:message-id;
 bh=bZLBDxudHxGsVw5ADGygZHTwpiRJkVukaGhfv2uAfCU=;
 b=6+ZSRETK6UwifxPKFo41QPqrr0AH+c/soH4o+418zkt5npLUEhHomEIBZrcSLOb76qb5V8y7m
 qE5+OtNGiVSBEK/U0aDugS2KDwjtT3XYZ64sm3jwXoCi+pBiAMcDoIY
X-Developer-Key: i=jens.korinth@tuta.io; a=ed25519;
 pk=bG0q4Zyj3o4d/r326zKL7ym+/tXzyykcjh+U0M13iyc=
X-Endpoint-Received: by B4 Relay for jens.korinth@tuta.io/20241107 with
 auth_id=270
X-Original-From: Jens Korinth <jens.korinth@tuta.io>
Reply-To: jens.korinth@tuta.io

From: Jens Korinth <jens.korinth@tuta.io>

Use new pr_warn_once macro to resolve TODO in error.rs.

Signed-off-by: Jens Korinth <jens.korinth@tuta.io>
---
 rust/kernel/error.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 7cd3bbab52f208961390de03a255446950e9eb04..fe1b31506b30fba0ec9d5339d80c2a7fa76ce7c7 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -102,8 +102,7 @@ impl Error {
     /// be returned in such a case.
     pub fn from_errno(errno: core::ffi::c_int) -> Error {
         if errno < -(bindings::MAX_ERRNO as i32) || errno >= 0 {
-            // TODO: Make it a `WARN_ONCE` once available.
-            crate::pr_warn!(
+            crate::pr_warn_once!(
                 "attempted to create `Error` with out of range `errno`: {}",
                 errno
             );

-- 
2.44.1


