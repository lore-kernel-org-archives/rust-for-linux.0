Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393D535E526;
	Fri, 16 Jan 2026 10:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768561033; cv=none; b=gRV5JuCIhRKBmmxAx02srMvS3jESOLy36kKHcovJpE/nkgbWyOtNBy1pdeGnzoIFIWiYygFaPO5bnj2vs7oid4hAGWlsQ9HviAnJP2OFWBbZGooAHciXVm5era4ujDWg2RHkT3vH9P0R9tmEnAVfj/b7H9yuoW5Nj+dMAdt5nqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768561033; c=relaxed/simple;
	bh=2AQPEo9XqhbgrhubYNt7efKElv59azpT5rRvRhjuwV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DVfA9p/3QLa78mRn0ImNBN0a3rWqko9tennQSEkksXH7ZhxHPXosLVX9bt8Nivew2J7HeFKnRV59EYtAA2MTqPTZPl3UMCYMSMkoo8QWDfdnZgFJgMsGgDPPZyUCKztBjQWIY6O6ZJYPASjqycghpyNJMhv8AsVOsTPtbrFaVYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pmtUwxd4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmtUwxd4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A382C116C6;
	Fri, 16 Jan 2026 10:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768561030;
	bh=2AQPEo9XqhbgrhubYNt7efKElv59azpT5rRvRhjuwV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pmtUwxd4W/virfB6gOq2FngredYnOWiUYqYTtD7vCiSN4/hNAiH5Zy8uCOm13Krhd
	 Nj+3WCtxfON5vjagbdUjjhVipw1m0YRH3EqDfl+4fu2fyDU+XgyLs82b+BeLWukwGm
	 dluaTqkSO87XPpgTuuTiGbTsK3WG+HbN4ADFxmHYy55/qJBcAbG0ZLTZ3tbP7vRxai
	 GuDwxrIa8w8Sohf7UjMZ8EM3v1FqnTu3Fmg8xIBOKa2doSuvuwYv4wARYOsm1p2ID9
	 Upd65FG1UNUqHcQox7R6XI8ZE0VcSSlp4lm3aOWSmtHSDZUl39LCeMuu2ZDIic3d8D
	 D0vI3jiIROXrg==
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
Subject: [PATCH v4 14/15] rust: pin-init: internal: init: simplify Zeroable safety check
Date: Fri, 16 Jan 2026 11:54:29 +0100
Message-ID: <20260116105514.3794384-15-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116105514.3794384-1-lossin@kernel.org>
References: <20260116105514.3794384-1-lossin@kernel.org>
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
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v4: none
Changes in v3: none
Changes in v2: added this patch
---
 rust/pin-init/internal/src/init.rs | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index ed2e1462e176..42936f915a07 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -414,17 +414,12 @@ fn make_field_check(
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

