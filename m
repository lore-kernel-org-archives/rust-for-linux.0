Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8700336DA14;
	Wed, 19 Aug 2026 19:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787169167; cv=none; b=Hj+SX1KRDqRsvAmuwOpgRJpJtg1eLlOaaDatzLARuHFjJ/NhnLaBjyd2uxFBmTE5+meVfUoPgOTd2cEhvCpHgXhuCsHhRC10uxskZjR1P+Bcr073Tsw7NQFR0KmZaj+OpZlvmxH9iLNvI31md9xIoUydG8exOcwtO5dfjM6UMvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787169167; c=relaxed/simple;
	bh=0SiPbcO8RTxkJ2sgrJEH8OIt4uYhOTDri5NzPEOlVGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AwCOSn21+S7DvxaYceHjmobgWgczso9iVKGpUSnxt7K+7XCjiL9+o6Fl5nPO1bzqWqq2DFm7VQkptwl3YC6Hszw3hiNeYq5MyxOb5g0Wm+p7u5QvSYLW3SlTmPuDP6awrRp8tcKTrVQX8Uk8r4OrNMts5Do4w30ky93fXWQgwFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=oOeQJkV7; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="oOeQJkV7"
Received: by chaosmail.tech (Postfix) id 641501C867F;
	Wed, 19 Aug 2026 19:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1787168825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iTrVRI86i7nzPnQemQQuLNohM7hyMo7ba924tYiRDQ0=;
	b=oOeQJkV75DketDeXBHBhat4BSzyD8jN4/kCZmwqxbzeRULr/UqNXWrO9CdWAnWDIqLLEWL
	YMtAbr9D60b+LWhQBE/yUu/hOTxt/nc9C0P/cIPrleSJdXWPv1ibYQ1WbjUs4NJaVnUiTl
	Y2fesbdiKBqWu+L2G2/iNNrIEfoL6kQ=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Wed, 19 Aug 2026 21:47:01 +0200
Subject: [PATCH RESEND v3] Fail the build on RUST=y and RUST_IS_AVAILABLE=n
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-evolve-to-crab-v3-1-2d8e1b48052e@chaosmail.tech>
To: Alice Ryhl <aliceryhl@google.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Gary Guo <gary@garyguo.net>, Jonathan Corbet <corbet@lwn.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Neal Gompa <neal@gompa.dev>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787168824; l=2582;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=0SiPbcO8RTxkJ2sgrJEH8OIt4uYhOTDri5NzPEOlVGc=;
 b=ZV1BoG5ylpPkpsLkbn5+2Un+RzMHVh6oncvJKe7JAtOB2wHCMQfEuK50hxSQcLG2vqYsQt7aA
 /LQnpFwHnYDD7WnghHVr9sysTFtuaw/jRbKzQhHNJYbbUTffWBVA+/u
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

The current approach of silently disabling all rust drivers if the
toolchain is missing results in users that try to compile their own
kernels getting a "successful" build and then being confused about where
did their drivers go. In comparison, missing openssl results in a build
failure, not a disappearance of everything that depends on it.

This also means that allyesconfig will depend on rust, but since the
rust experiment concluded with "rust is here to stay", i believe that
allyesconfig should be building rust drivers too.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v3:
- Collect r-b tags
- Rebase on 7.2
- Link to v2: https://patch.msgid.link/20260521-evolve-to-crab-v2-1-c18e0e98fc54@chaosmail.tech

Changes in v2:
- No longer a RFC, let's make it happen.
- Update the docs.
- Link to v1: https://patch.msgid.link/20260510-evolve-to-crab-v1-1-208df84e67be@chaosmail.tech
---
 Documentation/rust/quick-start.rst | 6 +++---
 init/Kconfig                       | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index a6ec3fa94d33..764c81d0dd59 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -321,9 +321,9 @@ Configuration
 -------------
 
 ``Rust support`` (``CONFIG_RUST``) needs to be enabled in the ``General setup``
-menu. The option is only shown if a suitable Rust toolchain is found (see
-above), as long as the other requirements are met. In turn, this will make
-visible the rest of options that depend on Rust.
+menu. In turn, this will make visible the rest of options that depend on Rust.
+You can check the value of ``RUST_IS_AVAILABLE`` to determine if your toolchain
+is configured correctly.
 
 Afterwards, go to::
 
diff --git a/init/Kconfig b/init/Kconfig
index 5230d4879b1c..0eca3dfd9349 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2207,7 +2207,6 @@ config PROFILING
 config RUST
 	bool "Rust support"
 	depends on HAVE_RUST
-	depends on RUST_IS_AVAILABLE
 	select EXTENDED_MODVERSIONS if MODVERSIONS
 	depends on !MODVERSIONS || GENDWARFKSYMS
 	depends on !GCC_PLUGIN_RANDSTRUCT

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260510-evolve-to-crab-8cba1768dcd5

Best regards,
--
Sasha Finkelstein <k@chaosmail.tech>
-- 
Sasha Finkelstein <k@chaosmail.tech>

