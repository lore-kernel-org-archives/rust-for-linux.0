Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1106D20D508
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Nov 2024 23:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730935744; cv=none; b=a9kFm3m7rnEL/gUh1lpVAHxuavguV5BC+UqjWE9cdfcKYjBexw/FneOJKzofBPZAvyghCitUdsFSvArRjxYc1Q4dpmxQdu1dknSiwe2LJBofc53urnoZ+kbaKV4HTzgmz1+WXn+jfWnJphb3Xa9gi/1oyoBTU4fVF/N0ljiIP3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730935744; c=relaxed/simple;
	bh=tw5fLm83O0UTmbo9rIYoAbdVNaWkQiP+TDLFds65lNo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o+MLvjuowuCPxCtrZ4Z6oLzxO6RyW05+oICmnirsY+VI7L4jnb76s9JgqH9n0v2BtTVnHP/AFMZjLj/JVWJH66UGcJ3pX7uVYcWjFhFdJi/QSOWNOTkVjRvXhXkH/K8ICs/mCmm038hCvwx1N8hIc5jsxeG+uXLlL5SH2+FXmHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvcXe+fx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvcXe+fx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A69E7C4CEC6;
	Wed,  6 Nov 2024 23:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730935743;
	bh=tw5fLm83O0UTmbo9rIYoAbdVNaWkQiP+TDLFds65lNo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=TvcXe+fx5cyniaVtl4cn55a1HFKQlE8T4siOD3x65lRfMovVJVPPUB1cDvQNz95MJ
	 kXvIXYefTBB8rLIdjBmNvF8uekRuC19z12e29tTT2Fw6qWvnQD85Ew83ksu7+NTdZm
	 iTnWEOPb1OpgxKSVf48K7jlELmCd2Zsjxu7DBJxZZHYtIT/yCZUSVlx2J3PX13rbOW
	 5ZqGxrwejKa4RBZi9Js4Oo0+oK2Dq8om5R2/ljaFycoP83NXbzUP5JJ6860Lu6xN0F
	 D4+GBYtiPHd4J+95lUzWYW0rEJ6JZZcoJ7Z3qm362LIAjLaVzC/6eT2uiWtYaTd/fC
	 mkaFnBfUc/vmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9929CD59F7C;
	Wed,  6 Nov 2024 23:29:03 +0000 (UTC)
From: Jens Korinth via B4 Relay <devnull+jens.korinth.tuta.io@kernel.org>
Subject: [PATCH v2 0/3] rust: Add pr_*_once macros
Date: Thu, 07 Nov 2024 00:28:30 +0100
Message-Id: <20241107-pr_once_macros-v2-0-dc0317ff301e@tuta.io>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ/7K2cC/03MQQ6CMBCF4auYWVsCLRR15T2MIbVOYYztkCkaE
 8LdbVyZt/oW718hoxBmOO1WEHxTJk4Fer8DP7k0oqJ7Mehat01T92qWgZPHITovnJVtzQFt6G5
 HbaCcZsFAn1/wci0OwlEtk6D7z5iyztRVb/vOqkaF14MWVy0cObHQeYyOnpXnCNv2BZlrqAijA
 AAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730935742; l=1165;
 i=jens.korinth@tuta.io; s=20241107; h=from:subject:message-id;
 bh=tw5fLm83O0UTmbo9rIYoAbdVNaWkQiP+TDLFds65lNo=;
 b=Sh9XFH3RvKvlt28Wir7l4tE3kbQ9S0dnphTIpAAuVJnAo2M+IMtK3QZsf5WDeQAcRXExciXXb
 3i2L4fJMk+JDO9j/kVH73OXbO+JeQ3pvUI+WAfSgUoHMDRIWt/mALeD
X-Developer-Key: i=jens.korinth@tuta.io; a=ed25519;
 pk=bG0q4Zyj3o4d/r326zKL7ym+/tXzyykcjh+U0M13iyc=
X-Endpoint-Received: by B4 Relay for jens.korinth@tuta.io/20241107 with
 auth_id=270
X-Original-From: Jens Korinth <jens.korinth@tuta.io>
Reply-To: jens.korinth@tuta.io

Add Rust version of pr_[emerg|alert|crit|err|warn|notic|info]_once
functions, which print a message only once.

v2:
- Split patch into do_once_lite part and pr_*_once macros
- Add macro rule for call without condition => renamed to do_once_lite
- Used condition-less call in pr_*_once macros
- Added examples
- Removed TODO in kernel/error.rs using pr_warn_once
v1: https://lore.kernel.org/rust-for-linux/20241106.083113.356536037967804464.fujita.tomonori@gmail.com/

Signed-off-by: Jens Korinth <jens.korinth@tuta.io>
Co-developed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
---
FUJITA Tomonori (1):
      rust: print: Add pr_*_once macros

Jens Korinth (2):
      rust: print: Add do_once_lite macro
      rust: error: Replace pr_warn by pr_warn_once

 rust/kernel/error.rs |   3 +-
 rust/kernel/print.rs | 143 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 144 insertions(+), 2 deletions(-)
---
base-commit: ae7851c29747fa3765ecb722fe722117a346f988
change-id: 20241107-pr_once_macros-6438e6f5b923

Best regards,
-- 
Jens Korinth <jens.korinth@tuta.io>


