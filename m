Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3D83C4B77;
	Thu, 21 May 2026 08:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352687; cv=none; b=lIqGuPcuXKst2d43FvQyVaFiwdwasV7kQcjAWMC5WeTEF7gKUwRsBqmRSxpIVkfg0FtmZJ7PGhCoksFyBd2JZCT3KxERsrTCAHgGdxKAx7G4Yw5iVzSgVYEMInr9GA3gdy7/15lUOcQ8ONmeBalyLhKljVVRciqg9kioEZvAfeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352687; c=relaxed/simple;
	bh=7BJFLEB6C86M5gqwrUoBf0DVLzH0TaU/5cXkYCFtTYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BXNT/jBqyDBbhSWyXeY4r+UAZtQ8khEyGHuJCnfLnm2qYTS8nYF9tDT7O77UpXQWX6Sr0GrlHTloUESLYr6G5ZtSO8jLezeI2UiKA/BiKXDfg/voYRMtraWpsSYdCj613xNT+k+ug78z41hXVcDEC4YJMCpknCMw/oL6UdGthE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=mqaMIEKM; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="mqaMIEKM"
Received: by chaosmail.tech (Postfix) id 22E2E1C9F6D;
	Thu, 21 May 2026 08:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1779352311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ShptbacUN80FAd+vsF5oT2K8kRUNoKGz5rer5JQfYgw=;
	b=mqaMIEKMMd+6/bcGxiu9mpGv/HfNxYnmU8zpTx4qGVObxW8zpkAnu2D9eDivVPzWW7z6yI
	spOoeQrrNoNwETBu4B7G1Wggxb7eCM9mmGqFJy6xeDmrqCE0XOp2KkwjLytdzGX1iC1WOz
	LJHXW1kRS5PDkegAoA7ulTuxf9j/Jic=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Thu, 21 May 2026 10:30:50 +0200
Subject: [PATCH v2] Fail the build on RUST=y and RUST_IS_AVAILABLE=n
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-evolve-to-crab-v2-1-c18e0e98fc54@chaosmail.tech>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOyw7CIBREf6Vh7TVAbEtc+R+mCx639ppaDCDRN
 Py7tK5dnmTmzKwsYiCM7NysLGCmSH6pIA8Ns5NebgjkKjPJZcdbwQGznzNC8mCDNqCs0aLvlLO
 uZbX0DDjSexdehx/Hl7mjTZtlS0wUkw+ffTGLLfdXngUIkFy5UZ2w6w1e6icfH5rmY0I7saGU8
 gW82yG3wwAAAA==
X-Change-ID: 20260510-evolve-to-crab-8cba1768dcd5
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779352311; l=2250;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=7BJFLEB6C86M5gqwrUoBf0DVLzH0TaU/5cXkYCFtTYk=;
 b=JeDfsJRRAFSdP+76aN+j2zPNtJtck8pPcvZhVBvrZoKRJlCIE+u0LqCCxO+gXmac6Nm4CZwYZ
 /9tBqcO4UWzD/Kgq20efdpWsp7+tpTaucplh/tClliuiZvn/mVxXm1J
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

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
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
base-commit: 8bc67e4db64aa72732c474b44ea8622062c903f0
change-id: 20260510-evolve-to-crab-8cba1768dcd5

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

