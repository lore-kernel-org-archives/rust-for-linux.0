Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E64F1DDA3B
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Nov 2024 23:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730935744; cv=none; b=ZTZ6i9BD9RDbkmpUWQ4EFG8wElIYsA46IduA/X8tLbPqKabl8POKG6/cYWYP5BLgrW68s+v8YF2ZfNbk2lj3GORTbklwnvx/o/AGlMr1O+SM+vrh0Ddcb4MhGI7PjULcAU9lCt0timc1IJzPgn9gPxmH6jc0uEftdOWuyZRTLsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730935744; c=relaxed/simple;
	bh=FHGhaxX9A6w6dofyFIe2kgutlpUueSeGpMF8xdQrn74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L49/NsSNh2s7QTnOkJ33N8mvqKZFYw7vLaJKNUijjjfA/tbbGT7E/aAeWWDo6IIKKAAXMtz0sw0dPFyoJewIYeWaxR3g8dgPC7ElIuBI7NsNd4bdzXJ6gQX07v80Y4FSSo4MsWIzLThqCwSkpE0G2Qy3ONMBDzudnaCMxcfHTLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7Pr/Ppm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7Pr/Ppm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBC77C4CED7;
	Wed,  6 Nov 2024 23:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730935743;
	bh=FHGhaxX9A6w6dofyFIe2kgutlpUueSeGpMF8xdQrn74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L7Pr/PpmEgKRzdnRxIXhjPMo4UqFXmSiC1+JqVHqJ8y0IxonEEbfzM3coNNCThKln
	 8E2KKd9W+7KSao7jtffcm2lUZK/vRKcG2u387lhkqozc5dIoiechiqij6JTIutsQJ3
	 Fe0SYfQAF+3nTM9jWUCnLJZiZgdKV5JMOWQGCptNx1BLXGd/x7jd6omS5496rG6KOj
	 yiJrw7Zp7OiCXTl3CnBC54p0C7/YZ9DTd8CdDdm2XkTUgLoO910jVTtKgib8l8oeDC
	 TzKeswi82SlGVrqvZ71DRaZFVPUq0SM961YIjT6NhMyCKNQ6l7XESbgMhtASMVvkfU
	 1dnN+6Kib373A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB00AD29FA5;
	Wed,  6 Nov 2024 23:29:03 +0000 (UTC)
From: Jens Korinth via B4 Relay <devnull+jens.korinth.tuta.io@kernel.org>
Date: Thu, 07 Nov 2024 00:28:33 +0100
Subject: [PATCH v2 3/3] rust: error: Replace pr_warn by pr_warn_once
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-pr_once_macros-v2-3-dc0317ff301e@tuta.io>
References: <20241107-pr_once_macros-v2-0-dc0317ff301e@tuta.io>
In-Reply-To: <20241107-pr_once_macros-v2-0-dc0317ff301e@tuta.io>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730935742; l=871;
 i=jens.korinth@tuta.io; s=20241107; h=from:subject:message-id;
 bh=bZLBDxudHxGsVw5ADGygZHTwpiRJkVukaGhfv2uAfCU=;
 b=rCRDNFVHsl6EvjGErsf96ETgFVTCOcgf4A4s1Q94yDktDaDqLW5xgq2wU1C+7PZ1M+OLqzIUn
 gWNdGWRyyC3ClY9JuqFHxUaOnMkg6sZjn22Py0ggrsz2uQYA881j02Z
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


