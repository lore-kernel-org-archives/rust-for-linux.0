Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C616190074
	for <rust-for-linux@vger.kernel.org>; Sat,  9 Nov 2024 20:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731184238; cv=none; b=jsal2GM/2zkbjz/K/1qHNFV8rNbetWL9SeAYPDfRF9daxrJ7tTJv5pGWjBesry+KEcp0HFt76VagUED5VpW+Un6z1u0HSCliNSMRWgfNM0Pq4UOPeW55P0EUKtg+Oj8tmrwrAMjoiJxvPZ4P5Y6IxUE6uGMkjgU8E1gJsC63ttw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731184238; c=relaxed/simple;
	bh=2H6S41IRcCn9Cb+JAGXeMkPfayPmFqX4nU3fok/DcA0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dNnNTnjLoVRXSBe11qVk4ntU9wStPlcgX1R+870bjnx5YP0uh/QHkq/y/EJ4KjLlbH4f3c3fEE4FZduguozMTH3vY2D6DWyiGAmv5QKY/Rn1crCCAUgOb7s+wFr0PPC3Nt0sb634GyG8GG+9th/JL9NmTQeMEtFhhSPBxc76Z1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpVaAU/K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpVaAU/K"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB659C4CECE;
	Sat,  9 Nov 2024 20:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731184237;
	bh=2H6S41IRcCn9Cb+JAGXeMkPfayPmFqX4nU3fok/DcA0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UpVaAU/KPiDDgBzvRqpcsSs1UfZMYyGbcKGNQEUuMlRyrYXfRcu/Hnx7730V1ImId
	 vxc8YiwJXL7TxaXQsrF/K8BHEAmM08u66TsvB2bKZjCgN6T9bHOyyrtzSPAQvBOiMd
	 5aCg3eSQmOKo+2KMadLZgBU/aCZ8EQ6QOolB4wKfYgwNpXlr0MJNCGyuKkeHXiJClu
	 Ncxt4pG1b2bE2qzFphsqboj5cGROKqWcsxfnKd7gpemqjBssxycWl9xGNtk6mOjPdF
	 bpYvQkMDhei80o3LMuMCMzxeCvpFZ8jpaayZyr5PzgnXDZtbltUr/sMpbjB6x2GMbX
	 FAQsp/KWDccGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AB6D5E381;
	Sat,  9 Nov 2024 20:30:37 +0000 (UTC)
From: Jens Korinth via B4 Relay <devnull+jens.korinth.tuta.io@kernel.org>
Subject: [PATCH v3 0/3] rust: Add pr_*_once macros
Date: Sat, 09 Nov 2024 21:30:06 +0100
Message-Id: <20241109-pr_once_macros-v3-0-6beb24e0cac8@tuta.io>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE7GL2cC/3XOPQ7CMAyG4augzKTKD22BiXugqgrBoUakrpxQg
 VDvTmBiQZ7ewY++l0jACEnsVy/BMGNCGkvY9Ur4wY0XkHguLYwyG61VKyfuafTQR+eZkmw2dgt
 NqE87Y0V5mhgCPr7gsSsdmKLMA4P7ZWy52qqqbdq6kVqG+xWzqzJFGonxcIkOb5Wn+CEHTJn4+
 Z04mw/8d81spJJnr6xuQ7BKwyHfi4skumVZ3mEA3HvtAAAA
X-Change-ID: 20241107-pr_once_macros-6438e6f5b923
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Dirk Behme <dirk.behme@gmail.com>, Jens Korinth <jens.korinth@tuta.io>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731184236; l=1315;
 i=jens.korinth@tuta.io; s=20241107; h=from:subject:message-id;
 bh=2H6S41IRcCn9Cb+JAGXeMkPfayPmFqX4nU3fok/DcA0=;
 b=fCkxcu4Pb9MFk+4BXy+Xgx27D/0StGavmNENGRTa0pKZ3YkyQoZvvKdfHXSc6LHzvU5HBTOZT
 Ji5dF3s5F6/ATS3xBKheY2zPx+T+ZS2GOWKrHk5pU8PSBhQDc3aV6F+
X-Developer-Key: i=jens.korinth@tuta.io; a=ed25519;
 pk=bG0q4Zyj3o4d/r326zKL7ym+/tXzyykcjh+U0M13iyc=
X-Endpoint-Received: by B4 Relay for jens.korinth@tuta.io/20241107 with
 auth_id=270
X-Original-From: Jens Korinth <jens.korinth@tuta.io>
Reply-To: jens.korinth@tuta.io

Add Rust version of pr_[emerg|alert|crit|err|warn|notic|info]_once
functions, which print a message only once.

v3:
- Fix rustdoc error, formatting issues
- Fix missing Signed-off-by
v2: https://lore.kernel.org/r/20241107-pr_once_macros-v2-0-dc0317ff301e@tuta.io
- Split patch into do_once_lite part and pr_*_once macros
- Add macro rule for call without condition => renamed to do_once_lite
- Used condition-less call in pr_*_once macros
- Added examples
- Removed TODO in kernel/error.rs using pr_warn_once
v1: https://lore.kernel.org/rust-for-linux/20241106.083113.356536037967804464.fujita.tomonori@gmail.com/

Co-developed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Jens Korinth <jens.korinth@tuta.io>
---
FUJITA Tomonori (1):
      rust: print: Add pr_*_once macros

Jens Korinth (2):
      rust: print: Add do_once_lite macro
      rust: error: Replace pr_warn by pr_warn_once

 rust/kernel/error.rs |   3 +-
 rust/kernel/print.rs | 160 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 161 insertions(+), 2 deletions(-)
---
base-commit: ae7851c29747fa3765ecb722fe722117a346f988
change-id: 20241107-pr_once_macros-6438e6f5b923

Best regards,
-- 
Jens Korinth <jens.korinth@tuta.io>


