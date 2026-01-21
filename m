Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C3536B05A
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 18:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020663; cv=none; b=Poy3grRrwMCw6z7IlZru3vHWbUDVJnkK0v1HlEwymRZcmsEvqOP/LDGuNo9ZxT046yWNPcXNxOxOEr1xWB3CmrM/A3+JfcSbniWSxglYUDWv5sti1pwSg3AbTalmydzucYkoyAVR5wBMKiKTO+kJ/Me1KtCsCqBIgUxUxCHPAIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020663; c=relaxed/simple;
	bh=8T1qZVajvSALxKbn1Sgv203jG4lWXIBnloTGX4o8U2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sJnU2kMULtrzSTzOGvmpLLMM0P1cxjZbKNdUyw/66Rwbsz2gqsJWqxwXYwBSjNUMTWvyclYylrhRsiNI/TzXqZ78xi+3/eBYOa2dmqoxA4Q2+lBCmmywRH2UXErTymhbxU8KSftO+9Hk1w4b89gSVYxcVccbxkS1UgunWAdIC64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RudXW77b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RudXW77b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10C1C4CEF1;
	Wed, 21 Jan 2026 18:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769020663;
	bh=8T1qZVajvSALxKbn1Sgv203jG4lWXIBnloTGX4o8U2Q=;
	h=From:To:Cc:Subject:Date:From;
	b=RudXW77beLzcaLcdgGX+h5Xm5+3I9fn4Y1tFrhtA0NJWpg26c9rT5rizuzlncgrBj
	 ocAJpf0rRrGQDU5YuNkbRAw1ehv6QgkwwV0O08oTL+qKnsv1LSKe2GgYjMlu7mU3Jn
	 3EJp1jRUNgqm5xL7GiIrqb7IfbPoRldWhOrikM6Wd35ebodmcz6WY6onMI45AhicfP
	 4rYRz1UspK8yFoXiT2DD9+YNiBsqXf3hKCEum3ryYnn6wDr6yKic9bllmxWG+LXTa1
	 ocqpJNKlpkAgd7qipA6zbeG3R9NeZ1uejJ8IFyhDSm8zhb4PtSav3kjiRTbqQ9zJ4D
	 Fn32N/Hb8EG3A==
From: Miguel Ojeda <ojeda@kernel.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
Date: Wed, 21 Jan 2026 19:37:19 +0100
Message-ID: <20260121183719.71659-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rust kernel code should be kept `CLIPPY=1`-clean [1].

Clippy reports:

    error: this pattern reimplements `Option::unwrap_or`
      --> drivers/pwm/pwm_th1520.rs:64:5
       |
    64 | /     (match ns.checked_mul(rate_hz) {
    65 | |         Some(product) => product,
    66 | |         None => u64::MAX,
    67 | |     }) / NSEC_PER_SEC_U64
       | |______^ help: replace with: `ns.checked_mul(rate_hz).unwrap_or(u64::MAX)`
       |
       = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.92.0/index.html#manual_unwrap_or
       = note: `-D clippy::manual-unwrap-or` implied by `-D warnings`
       = help: to override `-D warnings` add `#[allow(clippy::manual_unwrap_or)]`

Applying the suggestion then triggers:

    error: manual saturating arithmetic
      --> drivers/pwm/pwm_th1520.rs:64:5
       |
    64 |     ns.checked_mul(rate_hz).unwrap_or(u64::MAX) / NSEC_PER_SEC_U64
       |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: consider using `saturating_mul`: `ns.saturating_mul(rate_hz)`
       |
       = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.92.0/index.html#manual_saturating_arithmetic
       = note: `-D clippy::manual-saturating-arithmetic` implied by `-D warnings`
       = help: to override `-D warnings` add `#[allow(clippy::manual_saturating_arithmetic)]`

Thus fix it by using saturating arithmatic, which simplifies the code
as well.

Link: https://rust-for-linux.com/contributing#submit-checklist-addendum [1]
Fixes: e03724aac758 ("pwm: Add Rust driver for T-HEAD TH1520 SoC")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
It would be nice to clean this up, so that Mark may start enforcing it
in linux-next -- thanks!

Completely untested, so please beware. Also, I am not sure if I am
missing something here, since saturation arithmetic is already used
a few lines below already.

Cc: Mark Brown <broonie@kernel.org>

 drivers/pwm/pwm_th1520.rs | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index 21b4bdaf0607..fb95f994f963 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -61,10 +61,7 @@ const fn th1520_pwm_fp(n: u32) -> usize {
 fn ns_to_cycles(ns: u64, rate_hz: u64) -> u64 {
     const NSEC_PER_SEC_U64: u64 = time::NSEC_PER_SEC as u64;

-    (match ns.checked_mul(rate_hz) {
-        Some(product) => product,
-        None => u64::MAX,
-    }) / NSEC_PER_SEC_U64
+    ns.saturating_mul(rate_hz) / NSEC_PER_SEC_U64
 }

 fn cycles_to_ns(cycles: u64, rate_hz: u64) -> u64 {

base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
--
2.52.0
