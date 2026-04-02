Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5B832D0DC;
	Thu,  2 Apr 2026 03:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100229; cv=none; b=rTHWrwcLzWVjZ+ZwQhyCzb4yWYqM2VyAh6nfgPJj2z4ddKRcTxLsobLk0qQC2SAzLc/0lzRGbcrI/0RnAWC43X5oJ6qTgNNf8MhHy6o+bTtMiE0nq2u5U630YM95Gqyby8PGVwISBcDlzd0a+iDtiFuQRh+jZh3sUQipFwYsHPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100229; c=relaxed/simple;
	bh=doSMiViGmwMuDM5rPkB2CTHK7xNoHLVvMHS/OAdAWO0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QuLtMxlnNPdfdV9ae6zUrqclDgLYorBvACCGNYqZaM6LWbiwuCdA7cHkQ5JpUBirKpdfUVt1LSclH4RopOyg6R4KA4iAJo0oVYo72qXrauy5o6YX79F2Mx3jHzVVL40ZYuOEOyfLKhSftOmyKjT1tw0PvFTDNZoSukJDCV8k0r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pw2q0Pby; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pw2q0Pby"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E104C4CEF7;
	Thu,  2 Apr 2026 03:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775100229;
	bh=doSMiViGmwMuDM5rPkB2CTHK7xNoHLVvMHS/OAdAWO0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pw2q0PbyY6BEbata9PLHyXugM1MJsp6N4Ot37w4p0YK1hAge9VcyyPrnjRCahliR4
	 Z/6/p5E0ig7C3L/CzNO18F5GUTkWs0qtiiY8Mcu8PLKXD+HwoKUeHpgmaig2GNzmCC
	 n+/PxxE4GzLUXepeAgxERUO27LWo+QwHQH9IBvXdVj+t7iKhOfhACn1C2ZuhCIJFVX
	 K0KUxSgtpGEtljxebsvDjhY8nkrd2o2xUVdcSIYIJqNcNC0u5fgWrtGYNS7enhBCRb
	 /aut3nrCsKlqeVAaT25hiwTkueA0uOidXbU9IzUFScQpbPhyUD5ZyAQEEv4N0G6Qwv
	 UafALmZcEhzuQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2922E111227C;
	Thu,  2 Apr 2026 03:23:49 +0000 (UTC)
From: Aakash Bollineni via B4 Relay <devnull+aakash.bollineni.multicorewareinc.com@kernel.org>
Subject: [PATCH 0/3] rust: workqueue: add safe cancellation and status
 methods
Date: Thu, 02 Apr 2026 08:53:45 +0530
Message-Id: <20260402-rust-next-v1-0-0940bb8f201c@multicorewareinc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAELhzWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwMj3aLS4hLdvNSKEl1Dy6REA+PExBTjNBMloPqCotS0zAqwWdGxtbU
 A6LXndVsAAAA=
To: rust-for-linux@vger.kernel.org
Cc: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775100227; l=2331;
 i=aakash.bollineni@multicorewareinc.com; s=20260402;
 h=from:subject:message-id;
 bh=doSMiViGmwMuDM5rPkB2CTHK7xNoHLVvMHS/OAdAWO0=;
 b=Vcosgj7HKX1yLZr5GDRW0Us3rYAn/WRoTqqGSMQkcqIzvXR3ZU0gp1TzurpL7BxgCEY4iqIKI
 mde0VvMo/sqCtzYrCh2JWyV96UDxXLfAZzsyqAIoE6Bk/HAqI61qtjD
X-Developer-Key: i=aakash.bollineni@multicorewareinc.com; a=ed25519;
 pk=r3Gonl+2k+8RozN9U/XwfICQdnRlAcLeeAfsExmurdE=
X-Endpoint-Received: by B4 Relay for
 aakash.bollineni@multicorewareinc.com/20260402 with auth_id=711
X-Original-From: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
Reply-To: aakash.bollineni@multicorewareinc.com

This series modernizes the Rust workqueue infrastructure by adding
methods for status checking and safe cancellation. These capabilities
are essential for implementing safe driver teardown paths, such as in
'Drop' implementations or device removal, where background tasks must
be stopped before resources are freed.
This version (v2) addresses the feedback from Miguel Ojeda:
- The work has been split into a logical 3-patch series.
- Spurious changes (top-level .kunitconfig) have been removed.
- Initialization for DelayedWork is now handled via a robust C-helper
  (INIT_DELAYED_WORK) to ensure correct timer function registration.
- Pointer arithmetic in the reclamation path has been simplified and
  verified to be underflow-free.
Summary of changes:
1. Helpers: Adds C FFI wrappers for workqueue macros and robust
   DelayedWork initialization.
2. Core API: Implements is_pending(), cancel(), and cancel_sync() with
   guaranteed pointer reclamation and layout safety (#[repr(transparent)]).
3. Tests: Adds a comprehensive KUnit suite and a standalone stress-test
   sample.
The implementation has been verified on x86_64 using KUnit (4/4 PASSED)
and confirmed to be race-free under high-load stress testing.
Changelog v1 -> v2:
- Split into a 3-patch series to separate helpers from API and tests.
- Replaced manual timer initialization with rust_helper_init_delayed_work.
- Fixed field offset arithmetic in container_of macro path.
- Expanded KUnit tests to cover DelayedWork specifically.
- Wrapped commit messages and cover letter to 75 columns.

Signed-off-by: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
---
Aakash Bollineni (3):
      rust: helpers: add workqueue helpers
      rust: workqueue: add safe cancellation and status methods
      rust: workqueue: add KUnit and sample stress tests

 rust/helpers/workqueue.c            |  34 +++
 rust/kernel/workqueue.rs            | 467 +++++++++++++++++++++++++++++++++---
 samples/rust/Makefile               |   2 +
 samples/rust/rust_workqueue_test.rs | 214 +++++++++++++++++
 4 files changed, 682 insertions(+), 35 deletions(-)
---
base-commit: bf074eb6891be799174ff42e0051492681fdc045
change-id: 20260402-rust-next-19ba03aad3f4

Best regards,
-- 
Aakash Bollineni <aakash.bollineni@multicorewareinc.com>


