Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81696204C1A
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jan 2025 23:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736379313; cv=none; b=UStLFk68LfKoGTXM0NnQpPMkM2shYofLXYTFXxBXtaP+Z1rW9oacYqCsfdoKWA/xUe9VJXZqX3++5CY478GekGNuI5QX108EYd5+oxCEgcrUQ2nK55Vrz0xFOkYeWYX4cm6EkRnbo1WQ2u5qCQ/OS1frxP+cIs4jDRmEKhakjgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736379313; c=relaxed/simple;
	bh=CKHJ/lFWSVkPjxOxjDZC4znki4qzFYKMBX705l8ha58=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QcTa3tbnF4oGerjin6mfIfQ3n4EQspAblkZpRQWuyZWcoGfeET8KiB3xw+wfddBl4ltI5MHar8rug10ZkhVHyHsc3goYqL56JHF33SkbhKjxFZeiWa5Ur0oWoWknzW3sGMWC6J6IfKpb2OUg9+kOW6o2+8nJP8/xp7gOwMsNO9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uXr2PJi9; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uXr2PJi9"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2166a1a5cc4so3851195ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jan 2025 15:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736379311; x=1736984111; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gqhj0ixB52my3tDkcBBqhKKSd2GIEkc506F7tWVukqI=;
        b=uXr2PJi94Vx+kbBKDouasb35+zLkUbssWFRs8A88uhkOMUnAdwQMzet5PC1ZEIPspY
         KQSMahpMiYOdnd+Mj5ayz7dTiBdy7UdpHG0WXDov5isVSth7BbH3yTKWzeV6bfv63+Se
         9YjNedV8M+AAmWftifdfpeUT+rEgcNvLATyd4mY/CHBbPMroXEUy/VAest+XrlvnYwmk
         EgGIHcDjsQep7fJ5HfVsYP0qcPbh3aPbOjpnTKa+nvaW1iR+aR2+P5d0jo36nK5mRnPs
         VElbir1z4uJKqv5/HuIwLVT2CCOZ/n2lSnUXvJ8kOk/cAORopYFhFgiiyNw19hw1Q+Dr
         9/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736379311; x=1736984111;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gqhj0ixB52my3tDkcBBqhKKSd2GIEkc506F7tWVukqI=;
        b=rSXrzptsyVYOQZdPEbHCmjSGXvNH4iK//9bEh1YHkRTPKzSef3oOQeI3GqTO8TOsp9
         iVcP/2e6q2sy4XvaoOQDrohvWPkSuZUUnYWTKlfbIqNZZMI6xPCRR5cVG9PfSP1Ahc40
         RSmXkS5YfUrIgBzyLLFjvsZodTxTtFbNQ+OB+j2Z9V81aqRi9fzDV9KUL1oRiN7axOxH
         7c2a3If3ZqbWQfnC7v+Kd4MOOr5LjEMQiBc36UfcUu1o6/0HThSFVrCyucUwiOZwl2C5
         XwdDQbCMaeFKsWXKrjwdKgry1ZXyE2C9+9oJN7zgXBHgKgdGUsChWUt/ZzPIptjRwYtz
         5ElQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuvBN8BWVZ7rgPRDShVuFpj9AVUDEZFqIVuXxSHScdrUpZCFrpa2LVf8LgJOB+N11Kel4t//MiNuBMwCB8dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ef1CpF2Ea88R4y8YPQsM+PMqaorntKARPNYyXicUa12EYovY
	p96/JzG4wLyZjLtV2BOALI4169dzXwWoIJwPlpzBU1P2piBRXoPWiuUhF0dNOMNFRZwlVUwbNkv
	0mUiLwA==
X-Google-Smtp-Source: AGHT+IFwFvB4At01kqg469ZGNHEiX4L1SakP2bBAUMb4Btldo6RIZqC/Foer4mABJAQfNFh68NUwLdonnCW+
X-Received: from pgkk1.prod.google.com ([2002:a63:2401:0:b0:801:9268:c344])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4303:b0:1e1:f281:8d07
 with SMTP id adf61e73a8af0-1e88cfa6ac2mr7148028637.10.1736379310886; Wed, 08
 Jan 2025 15:35:10 -0800 (PST)
Date: Wed, 08 Jan 2025 23:35:08 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKsLf2cC/x3MQQqAIBBA0avIrBtQKYiuEi3UxhooDbUIorsnL
 d/i/wcyJaYMg3gg0cWZY6hQjQC3mrAQ8lwNWupOKtljOnNBWzxuJSIHF/fDFJSz7nqvvG3JQm2 PRJ7v/ztO7/sBAuh2smcAAAA=
X-Change-Id: 20250108-rust-btf-lto-incompat-0d258f1fb4eb
X-Mailer: b4 0.15-dev
Message-ID: <20250108-rust-btf-lto-incompat-v1-1-60243ff6d820@google.com>
Subject: [PATCH] rust: Disallow BTF generation with Rust + LTO
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthias Maennich <maennich@google.com>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

The kernel cannot currently self-parse BTF containing Rust debug
information. pahole uses the language of the CU to determine whether to
filter out debug information when generating the BTF. When LTO is
enabled, Rust code can cross CU boundaries, resulting in Rust debug
information in CUs labeled as C. This results in a system which cannot
parse its own BTF.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 init/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index c1f9eb3d5f2e892e977ba1425599502dc830f552..eb1076be6242cf349c12ef0f447696cb3a9976fa 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1962,7 +1962,7 @@ config RUST
 	depends on !MODVERSIONS
 	depends on !GCC_PLUGIN_RANDSTRUCT
 	depends on !RANDSTRUCT
-	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
+	depends on !DEBUG_INFO_BTF || (PAHOLE_HAS_LANG_EXCLUDE && !LTO)
 	depends on !CFI_CLANG || HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
 	select CFI_ICALL_NORMALIZE_INTEGERS if CFI_CLANG
 	depends on !CALL_PADDING || RUSTC_VERSION >= 108100

---
base-commit: 4b90165c7d1173e0f65538d25aa718ec7ecdd5d6
change-id: 20250108-rust-btf-lto-incompat-0d258f1fb4eb

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

