Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AE7208D0;
	Sat,  4 Apr 2026 17:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775322089; cv=none; b=FX1zdiETu+VU9xljRHKH0Bi+HnkxdjIv8DI/N+KkR2WbVbZsHIoQfSVla7Ejx6Dk7O5BnAyHQwo1mQemAG0x2XMgvCDg2veOZVxva2Di0lfgwKJ3KIs10MPv8bwAu0qWE1tl79qWsbq5X/6klIxmjRswe8KbCHyKVANYIV26B6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775322089; c=relaxed/simple;
	bh=xCIEH7BDQOWe++khXPx4h519mVjvTQzY/l30EjdlPtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ukFPEWbUYUO2fiVrfUTscWGi1eCckL9i4TMjNoepyBVWb6axk0WyzHn/uNCz7vRxP9mLXByz7QcwghZxF2Abl4D1/MBj9nPCF761bkQzFT5FpifxQEhYoP8vo2oDtt8j1MYtAZjiZAjYaZzuHKB70dqKY0iAyS6kfWkDIoADwd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GqD+DTMy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GqD+DTMy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8281AC19421;
	Sat,  4 Apr 2026 17:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1775322088; bh=xCIEH7BDQOWe++khXPx4h519mVjvTQzY/l30EjdlPtM=;
	h=From:Date:Subject:To:Cc:From;
	b=GqD+DTMypbuOGQ+RdzMC24NISIGVUQ3a6zno2aCjh0NY3nPBUItsQbSq3cDCfkbMh
	 fhKw5ipFiRrEk4ZPuRLx23smh52nnQzDoYRzh4N4HIDGeYNheuZ0pf+iuhlN2Oi8tg
	 n6sTAGiZKZ7vlPTnxun/+3O1TbYvLyaXkIb7LJRs=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C63FE63FE9;
	Sat,  4 Apr 2026 17:01:28 +0000 (UTC)
From: Igor Korotin <igor.korotin@linux.dev>
Date: Sat, 04 Apr 2026 18:01:27 +0100
Subject: [PATCH v2] MAINTAINERS: add Rust I2C tree and update Igor
 Korotin's email
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-update-rust-i2c-maintainers-v2-1-42f929828eb1@linux.dev>
X-B4-Tracking: v=1; b=H4sIAOZD0WkC/33MywrCMBCF4Vcps3YkSUOrrnwPcRGmk3bAXpikR
 Sh9d4MrVy7O4ufAt0NiFU5wq3ZQ3iTJPJVwpwpoCFPPKF1pcMY1pnYNrksXMqOuKaM4wjHIlMt
 YE9rQRns1RGQJirAoR3l/9cezdNR5xDwoh1+z/mtuFi2a1nti7+PFN/e+3K8zzSMcxwefJJiWw
 AAAAA==
X-Change-ID: 20260326-update-rust-i2c-maintainers-1a7f190ccc1c
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Igor Korotin <igor.korotin@linux.dev>, 
 Igor Korotin <igor.korotin@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775322087; l=2018;
 i=igor.korotin@linux.dev; s=20260125; h=from:subject:message-id;
 bh=xCIEH7BDQOWe++khXPx4h519mVjvTQzY/l30EjdlPtM=;
 b=thSs31gc9SQlyHIiiskN6qH7mSIRnHu5esRoQWmylAj3Tr0UkV0mFPCnLayLrKwHq4fCArboF
 QzJws/PqyaiDBYFEBHUI4ToXM4e/yonkb5GRCXq/ZkzHZZXDjMRJzaI
X-Developer-Key: i=igor.korotin@linux.dev; a=ed25519;
 pk=SjZ//wxnynZgJJgTqANyU10A7hdQQdDXLvXIr+zWroE=
X-Endpoint-Received: by B4 Relay for igor.korotin@linux.dev/20260125 with
 auth_id=720

Add a git tree entry for Rust I2C development and update the
e-mail address.

The tree will be used to collect patches and provide a basis
for integration and testing, including linux-next.

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
Changelog
---------
v2:
- Add an entry in .mailmap linking the e-mail igor.korotin@linux.dev 
with the igor.korotin.linux@gmail.com
- Improve commit message to provide more context
- Update GitHub username from ipv6forever to ikrtn, thus update git
link. 
---
 .mailmap    | 1 +
 MAINTAINERS | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 5ac7074c455f..3a11f89b3d5b 100644
--- a/.mailmap
+++ b/.mailmap
@@ -327,6 +327,7 @@ Henrik Rydberg <rydberg@bitmath.org>
 Herbert Xu <herbert@gondor.apana.org.au>
 Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
 Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
+Igor Korotin <igor.korotin@linux.dev> <igor.korotin.linux@gmail.com>
 Ike Panhc <ikepanhc@gmail.com> <ike.pan@canonical.com>
 J. Bruce Fields <bfields@fieldses.org> <bfields@redhat.com>
 J. Bruce Fields <bfields@fieldses.org> <bfields@citi.umich.edu>
diff --git a/MAINTAINERS b/MAINTAINERS
index 77fdfcb55f06..f5bf555bd32c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12021,11 +12021,12 @@ F:	include/uapi/linux/i2c-*.h
 F:	include/uapi/linux/i2c.h
 
 I2C SUBSYSTEM [RUST]
-M:	Igor Korotin <igor.korotin.linux@gmail.com>
+M:	Igor Korotin <igor.korotin@linux.dev>
 R:	Danilo Krummrich <dakr@kernel.org>
 R:	Daniel Almeida <daniel.almeida@collabora.com>
 L:	rust-for-linux@vger.kernel.org
 S:	Maintained
+T:	git https://github.com/ikrtn/linux.git rust-i2c-next
 F:	rust/kernel/i2c.rs
 F:	samples/rust/rust_driver_i2c.rs
 F:	samples/rust/rust_i2c_client.rs

---
base-commit: bf074eb6891be799174ff42e0051492681fdc045
change-id: 20260326-update-rust-i2c-maintainers-1a7f190ccc1c

Best regards,
-- 
Igor Korotin <igor.korotin@linux.dev>


