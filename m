Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2264E2EA169;
	Fri,  9 Jan 2026 22:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767996620; cv=none; b=EsO0sDUB0NaIqUpDSenZIZ1Y0YsiZHGExl9ROADXsQ1ssK3DejT+kPuWY7oU73jGkRz2B/8lEk7Oiuow781OOvYeFwM8LNWegoaDEA7Xp6FqatX+rp9tVz1p2NhkJJISKL08LqyXowINsU/Ed7g+oY4Y28HAMdA7TP4d0vD51Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767996620; c=relaxed/simple;
	bh=2W1iTUBgvsnp5oAmflU0AVUKzbJhC2Fjd0ifipEIFEU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m5jefWfsGf0+Rre1cMkEesoYDqS4WHiL/YGdXqi8zm5sk8H54y2VS2cuGGsto8NPStHoqFXiXjcihhXxqIEWJphdgbkvMOqZaKIExnjESsaGBHDdRq+L7wDkWXA2Rz3EAr1DT8wNYmz1mCw7WdPXs8iNNjaR2HoQuMTjHMzl45I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wdmnhj8F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wdmnhj8F"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEC94C4CEF1;
	Fri,  9 Jan 2026 22:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767996619;
	bh=2W1iTUBgvsnp5oAmflU0AVUKzbJhC2Fjd0ifipEIFEU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Wdmnhj8F9T7iJi/lSK8myxBR1fJPomBzoK1qWZHQ/4P7DoXaR+tkFxbuzVv2oe7cG
	 FxTrWq80aHlWUccXtGtLWTo4gu+jPpN6ytF3kDP46Tf76K2GgaOSPlq1dlAzPXsfYN
	 ZI1R+tfqV1JgCGuNAHWVwL1HhwpKu9vpeZonsYzSavKyiOrLseCOB8KGGTL8VvO0HG
	 I+WKlixxp13oqRhOmj7ies1k2nEhy5+vQIsPNYxeaSyhm/ja/oPMpMffBUKqLQxsUF
	 Ejw9HX38IiX3M5Ja5B+i563rF8DpHr8+g33ECI5oxxNjHoNB2YrKMcC4Y6V6lslKmC
	 zFy+FI6IGn7pA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B672D26D93;
	Fri,  9 Jan 2026 22:10:19 +0000 (UTC)
From: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] rust: take advantage of newer rust-analyzer
 features
Date: Fri, 09 Jan 2026 22:08:59 +0000
Message-Id: <20260109-ra-fix-primitive-v2-0-249852a4145a@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHt8YWkC/32NSw6CQBBEr0J6bZvpAQRdeQ/DAqEHOpFPeshEQ
 +bujhzA5atUvdrBswp7uGU7KAfxsswJ7CmDbmzngVH6xGCNvRgyhNqikzeuKpNsEhirmsrCcU1
 V7iDNVuVUOJSPJvEoflv0czwE+qV/ZIGQsGdXm2teVs+C78PUyuvcLRM0McYvk0IYWrAAAAA=
X-Change-ID: 20260101-ra-fix-primitive-78154fe8173f
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jesung Yang <y.j3ms.n@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767996618; l=1670;
 i=y.j3ms.n@gmail.com; s=20251225; h=from:subject:message-id;
 bh=2W1iTUBgvsnp5oAmflU0AVUKzbJhC2Fjd0ifipEIFEU=;
 b=1C/FkyOX7o/dYF5NnyUjd83hEVHbSc66gWk4yWnzsjn5kU1lr4RaFlby2ud0r2EU7eGmh8U6A
 vi/WX6lLDYWDX6UidwsBsPX2b09zp7P+DLGZuvCMJaeYpk73V7LGAdu
X-Developer-Key: i=y.j3ms.n@gmail.com; a=ed25519;
 pk=2yVgO1I+y7kkFSF2Dc/Dckj4L2FgRnvmERHFt4bspbI=
X-Endpoint-Received: by B4 Relay for y.j3ms.n@gmail.com/20251225 with
 auth_id=586
X-Original-From: Jesung Yang <y.j3ms.n@gmail.com>
Reply-To: y.j3ms.n@gmail.com

As discussed in [1], we need to support multiple versions of
rust-analyzer to take advantage of newer features without breaking
compatibility for users on older toolchains; we must maintain support
for rust-analyzer v0.3.1940 (2024-04-29), which corresponds to our
current MSRV of 1.78.

Hence, this series revises the approach taken in [2] by first adding
multi-version support for rust-analyzer. Specifically, it enables
support for the v0.3.2727 (2025-12-22) release and newer, which is
required to resolve inherent method resolution issues for primitive
types found in recent versions of rust-analyzer.

Thanks to Gary Guo and Miguel Ojeda for their feedback and reviews.

[1] https://lore.kernel.org/rust-for-linux/20260101-rust-project-reduce-size-v1-1-4cd66e9e02d9@gmail.com/
[2] https://lore.kernel.org/r/20260101-ra-fix-primitive-v1-1-def809357b4e@gmail.com/

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
Changes in v2:
- Implement multiple rust-analyzer version support.
- Rebase on 9ace4753a520 (Linux 6.19-rc4).
- Remove an unnecessary new line between tags.
- Link to v1: https://lore.kernel.org/r/20260101-ra-fix-primitive-v1-1-def809357b4e@gmail.com

---
Jesung Yang (2):
      scripts: generate_rust_analyzer: add versioning infrastructure
      scripts: generate_rust_analyzer: fix IDE support for primitive types

 scripts/generate_rust_analyzer.py | 196 +++++++++++++++++++++++++++++++++-----
 1 file changed, 172 insertions(+), 24 deletions(-)
---
base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
change-id: 20260101-ra-fix-primitive-78154fe8173f

Best regards,
-- 
Jesung Yang <y.j3ms.n@gmail.com>


