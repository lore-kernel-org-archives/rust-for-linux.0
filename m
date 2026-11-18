Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012293;
	b=hRgQXsYC6TXHMH+XtuUHEqAUwGQrl42qOv3/s9wMIMwuogv6WP9rKF+AR51SkJXbLOrT
	 Za05avAevR4CIFnEpUX24COkRdr7J2zxZ3mvbLb7bfsVdeID7AnZVZehMI2aQQH/sRBD9
	 qwFP9W1RpNOkgNpz2YadMsA2g2kj3Fn51LbetRfF3mCKZm0HdozcOLgLXCPakXxpvYdHO
	 3auYSW9dMNflTdP4WPaYgTiA16GWan4nCF+LJsoDlwmLot19X7gG4WYLjXQ2N2uYFhS3j
	 RW9MeQs/O/HRAjD0Es4cc15TnwdINDWglqMg0j9YGFN5k0aBa7+ppBJffvqThwStmuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012293;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ubbcaQRI420DuZaCj8SdRzHrFDe4BCUcBjNnGL9SLL8=;
	b=Vlko3ZXoOqwEA1p5PSLJ4zhcwrBHkk4PDOueJKJXIHqMa31nWefoRivtmfsI8csGUbo+
	 pQiTDrrwkmsxHk3mG1QducLLJj+qJcxgSl9Rzbvh+KR5fJQAKA6pWjjyIaHbO+b2yez2Z
	 nbnTWn3JdG2OCtCS6RHFTDWUtFni8wJr7OaNpkfKGLA6rY1A6v2utt6sHR8CxVBy1cmw7
	 WR2wIOUK4S9b4/t2/3VcZfw66KO7GrDj8W0Kym6xY4MCtfKw9NGVYp9JyBsbrkqHLPuke
	 ib7MsifIJ7t2J2eaHJSI5KCCtUe64uL/8Etz2oiE4vsoIZ8xlAsSVl5OYOw8Ij/LgIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hIrQF8Wv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B841F60A2609;
	Wed, 18 Nov 2026 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hIrQF8Wv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC00B1F000C4;
	Wed, 18 Nov 2026 14:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012293;
	bh=ubbcaQRI420DuZaCj8SdRzHrFDe4BCUcBjNnGL9SLL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hIrQF8Wvtz2eulyCHY6XcUtISCG8SHlBzMj5ZY3YNZd440CIeXWGfTTbrX+JWPSZU
	 gy2Xdwcq7BNTUp1CKsPGwRsW2glTPTrtsLWVtIE8ip3cltCodv2+3py/IYvQAmXWii
	 wWcQ8uF43XDP8IW6Qkr4mfte3NSwTKnpjEopQ29bP27yp7ql1BMfgO0/08YFk2sUY+
	 5rGIsgBBE6GD9OZsv6MJFdCwv33S/ClgcOtVTYb7zlxkD/jNOYcg8tJnm4nJrnDBI7
	 56GZB/3yTSg6ti6fLr2um2jgRqEkYRcx2q9yN4pTm0x+31+wIOQ06/T0YFsmG90bL6
	 /pW1XZ7SfuMKg==
From: Gary Guo <gary@kernel.org>
Date: Wed, 18 Nov 2026 14:31:20 +0000
Subject: [PATCH 1/3] rust: pin-init: internal: allow
 `clippy::large_unopt_stack_frames`
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-dev-project-vis-v1-1-2a5f433bb516@garyguo.net>
References: <20261118-dev-project-vis-v1-0-2a5f433bb516@garyguo.net>
In-Reply-To: <20261118-dev-project-vis-v1-0-2a5f433bb516@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795012287; l=1173;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=1MhJq8D8AqTKa9/r0aVOlHd37XsnnIy0H/ZaDd0wyf0=;
 b=H2jgkh/j3kC+OPRPwGapsreOSKbvFOkwVDoE3bxV0y/WhxR+GPE5MoqlTY3Jz6Nl1gEPi07I/
 EqYlPSBxqs6Bfvk4vgr6Aeh8pBR/JhPhR9fKc9yRsMgzAEfTXh2LE/q
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=

From: Gary Guo <gary@garyguo.net>

Since Rust 1.102, Clippy renames `large_stack_frames` to
`large_unopt_stack_frames` and make it warn by default. This is a good
thing as in such cases pin-init should be used rather than potentially
leave unoptimized large moves on stack. However, this also triggers in
unexecutable code paths that pin-init generates for field duplication and
exhaustiveness checks. Allow it on the generated check closure.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index ded2b5283376..c78f8d3ca309 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -572,7 +572,7 @@ fn make_field_check(
     };
 
     quote_spanned! { Span::mixed_site() =>
-        #[allow(unreachable_code)]
+        #[allow(unreachable_code, clippy::large_unopt_stack_frames)]
         // We use unreachable code to perform field checks. They're still checked by the compiler.
         // SAFETY: this code is never executed.
         let _ = || unsafe {

-- 
2.54.0

