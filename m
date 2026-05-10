Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FB2155A5D;
	Sun, 10 May 2026 13:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778420613; cv=none; b=t5vDjYDHGl3+je+7xYaU0eV1Yc2N6e1ZNF+7xnLhS830yqGcRJO/uBPMJCTLPfSbc2tlnvOsvw+fuq8vCGCXiXP1XldZFfXLBHUPrj0NWsggYT+r5ngUU+ga3j/lUSBGoMIs8+73hgh27WyZXlVs4XHPn55cfrZ4G0hQNaK71Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778420613; c=relaxed/simple;
	bh=f3b2nDrUqqclobb0LSMc0bTuoKEEa2tRn6iWj2Xbu0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZhI/p+bu0AED0y22zaZi0NnIrI1M0o9Ze+5A6987UxU+3JKqdTRrhq4/gDCRZW/nKOh0vQJ77SPriVt6IL745AM9VX57Wi9jhIQDT+UdVpnlkzewy7K7xaRKyqCkQw7myeQTTy+RvAijvvA/zoOz6tvsyVEbWQGhng9w4y3AC/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=hC45j1Ss; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="hC45j1Ss"
Received: by chaosmail.tech (Postfix) with ESMTPSA id 837841C81C5;
	Sun, 10 May 2026 13:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1778420182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KBHTdWfQUGkfiveZ8RyTHqvma5+hbi/W4KboB12Veyc=;
	b=hC45j1SsLHC1lrKBzHjfY+4deOKbTqsB0f1hRR0141ij1ByokNXyq/LI7AXVmoeCP4Mg9V
	XO35xZTl0rko19X98qur3hPGup/eXhPzB0Xvi/DkMRqknSZeDjNkGYtP0wgnqnYgxh2IQ7
	BBFTycpEO26WGX/7bHC6HtWkyQCTebw=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sun, 10 May 2026 15:36:00 +0200
Subject: [PATCH RFC] Fail the build on RUST=y and RUST_IS_AVAILABLE=n
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-evolve-to-crab-v1-1-208df84e67be@chaosmail.tech>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0MD3dSy/JyyVN2SfN3kosQkXYvkpERDczOLlOQUUyWgpoKi1LTMCrC
 B0UpBbs5KsRDB4tKkrNTkEpBRSrW1AM1f4cN3AAAA
X-Change-ID: 20260510-evolve-to-crab-8cba1768dcd5
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778420181; l=1018;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=f3b2nDrUqqclobb0LSMc0bTuoKEEa2tRn6iWj2Xbu0E=;
 b=Tcg55G6TFTr/znCZBHPyXoaNYRVT2dXmNxnGrN9MXepX8nZQjnSx7RgxO07aR1THL2kYzVCsT
 7i1BBrQOMynDa5xyEWQLFImkG6P71L5TuEZxrUbIXf4o6vDgvxiRU5R
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

The current approach of silently disabling all rust drivers if the
toolchain is missing results in users that try to compile their own
kernels getting a "successful" build and then being confused about where
did their drivers go. In comparison, missing openssl results in a build
failure, not a disappearance of everything that depends on it.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 init/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 2937c4d308ae..f7d4c7ea764f 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2190,7 +2190,6 @@ config PROFILING
 config RUST
 	bool "Rust support"
 	depends on HAVE_RUST
-	depends on RUST_IS_AVAILABLE
 	select EXTENDED_MODVERSIONS if MODVERSIONS
 	depends on !MODVERSIONS || GENDWARFKSYMS
 	depends on !GCC_PLUGIN_RANDSTRUCT

---
base-commit: 1bfaee9d3351b9b32a99766bbfb1f5baed60ddef
change-id: 20260510-evolve-to-crab-8cba1768dcd5

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

