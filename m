Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73B833C1B0;
	Sun, 11 Jan 2026 12:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768134475; cv=none; b=ueRBJUkKIQIN1kw1o2VAeqfgF+ccdRBNkzl37MHPwDo4JQRLrRwc0UZhkTFSqvxLrdJ/GAkezcl+wKnNkpCEO8+vO35yXgSVtOXMW/LTiQuwNwZlsEKTDeXofrQGqxG0H83C6Jmr8f7GjVWbtdKAzarFO1d8TXGxb5U9OfH2wWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768134475; c=relaxed/simple;
	bh=Bzn61yiWjjYUzn5UTax2wd+MrTVTJPya5IR9zeUBdxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZcnGazdzvdQax+7AA6BfP5oL5olFeZpspZR+6w1ry2pfjMgtmr/h+1dsdMLMrnrP28FhVfR6sskkmDbgns36O/FTdDy1olXJv5qfHERA38bwm4AHa3sdDtXJFY1u8F8ic/eIn5Y0d4sBK4dO4wzGUBD4elaX8UcM2Q3rlVAa7dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZolVx5s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZolVx5s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABDDC19423;
	Sun, 11 Jan 2026 12:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768134474;
	bh=Bzn61yiWjjYUzn5UTax2wd+MrTVTJPya5IR9zeUBdxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IZolVx5sdCDztq93fmFsJpHYn/NyQYOT0VmOC13jCms964VnSm1Pr3N6dnQiPRe3k
	 Fq1O3AUnBJ1XWia3hLPMKX9gwuxDVaTaSKzvoiZa7M4SJE2AKot8KoG1nNMDCyw0Jg
	 b+OC8DE+2HDLyDLloJCnX5+WGuOrjIaQfccCUT6H5mOSCC6XdYmBG/25B1TC1Nsq8Q
	 jS4XGFd6zwW3aypKzdh7RK3sdPmZiniF5PlclSrNEFT3irSdb+t1g1YYhxfjYMF0Xq
	 Vwje9weRggdi5eApWbNKNt5zPMQHXdlUOSO/DuVvrE0ggkPgzmnoTRWBTXlu9BA0bM
	 ZpSe8tYHI6lkw==
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
Subject: [PATCH v2 14/15] rust: pin-init: internal: init: simplify Zeroable safety check
Date: Sun, 11 Jan 2026 13:25:12 +0100
Message-ID: <20260111122554.2662175-15-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111122554.2662175-1-lossin@kernel.org>
References: <20260111122554.2662175-1-lossin@kernel.org>
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
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v2: added this patch
---
 rust/pin-init/internal/src/init.rs | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 40df01635a3a..17ae7b2e4f70 100644
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

