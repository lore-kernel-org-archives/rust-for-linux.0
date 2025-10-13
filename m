Received: from forward204b.mail.yandex.net (forward204b.mail.yandex.net [178.154.239.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51072690E7
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 12:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760359397; cv=none; b=fF++U8mDsb6/tdmF/Reg6vmNUAl5/6hoRbxj+5rivgp2ZXvg4Qr1Yb1nNv03iB9sJyXPCGbhvr3tHcvibbqw5te+jE6Usq9Cydm9+wP6BWV5en/E7i1G7PQHjr6Pu3oxUUnnHn4Zi7OJUwf1EXxtMERD7V+FzU0c7J2XBIh6bTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760359397; c=relaxed/simple;
	bh=yyDx7qEKd4D90NCAHBjGsIPtpghtJxaLED9u2DyfYpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lEEA2/ssnpM4vOirz+M80tRnOPWfRTzc2tIKhhxtJnvWL2u2w0g+UxSPzWbSpNp3CjcvHU4gDhzAEKJm2uyYf31cVKw2HgcQ+5qfBwVB2xySf1GzPJiMFVvbFk085GCcS4aXZa++6lsc9Jc3kTlkCF9GlYAjgfzUA9A2QRomx8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=E/Nz38NV; arc=none smtp.client-ip=178.154.239.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="E/Nz38NV"
Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d102])
	by forward204b.mail.yandex.net (Yandex) with ESMTPS id 2BF1083F18
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 15:43:07 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:2f3c:0:640:7ca0:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id 1C487C008C;
	Mon, 13 Oct 2025 15:42:59 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id efN1GCWLNW20-uPXEq6To;
	Mon, 13 Oct 2025 15:42:58 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1760359378;
	bh=NZOpdN7NVrmHLaSWR1NXTiizWB0mgeuNXR5L7hU7Wno=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=E/Nz38NV0xzIhjPHsuhwpLU1a54MxLZcHYaFCoRri0UE+mJHmtEtjUlAp5URhP3Qt
	 YnrxoeAvKSfon3Bf/XztYDbyWdFUkl6e318n8rYRT2TEteFjzfCiolrVQE5YOzEH6N
	 K9Hdqbn0xzTMJaJ1eqKj6Cybg62px0JaBclIXyQs=
Authentication-Results: mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	tamird@gmail.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v3 0/2] rust: refactor `to_result`
Date: Mon, 13 Oct 2025 15:41:37 +0300
Message-ID: <20251013124139.18809-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v3:
  - New trait `error::ToResult` added and implemented it on isize and
    i32 types (first patch).
  - Removed `error::to_result` entirely and replaced its usage with
    `error::ToResult` (second patch).

Changes in v2:
  - Removed `map(|_| ())` calls from v1 and replaced them with
    `to_result(...)?` and `Ok(())` (except miscdevice.rs, as it
    required `Ok::<(), Error>(())` which is less clean).

  - Rebased on latest regulator/for-next and fixed the build error.

Onur Özkan (2):
  rust: add `ToResult` trait
  rust: drop `error::to_result` and utilize `ToResult`

 drivers/android/binder/rust_binder_main.rs |   3 +-
 rust/kernel/auxiliary.rs                   |   9 +-
 rust/kernel/block/mq/gen_disk.rs           |  12 +--
 rust/kernel/block/mq/tag_set.rs            |   5 +-
 rust/kernel/clk.rs                         |  18 +++-
 rust/kernel/configfs.rs                    |   9 +-
 rust/kernel/cpufreq.rs                     |  12 ++-
 rust/kernel/device/property.rs             |  12 +--
 rust/kernel/devres.rs                      |  13 ++-
 rust/kernel/dma.rs                         |  18 ++--
 rust/kernel/drm/driver.rs                  |   4 +-
 rust/kernel/drm/gem/mod.rs                 |  12 ++-
 rust/kernel/error.rs                       | 113 +++++++++++++--------
 rust/kernel/fs/file.rs                     |   4 +-
 rust/kernel/irq/request.rs                 |  10 +-
 rust/kernel/maple_tree.rs                  |  12 ++-
 rust/kernel/miscdevice.rs                  |   6 +-
 rust/kernel/mm/virt.rs                     |   6 +-
 rust/kernel/net/phy.rs                     |  43 +++++---
 rust/kernel/net/phy/reg.rs                 |  22 ++--
 rust/kernel/opp.rs                         |  72 +++++++------
 rust/kernel/pci.rs                         |  13 ++-
 rust/kernel/platform.rs                    |   6 +-
 rust/kernel/regulator.rs                   |  32 ++++--
 rust/kernel/scatterlist.rs                 |  13 +--
 rust/kernel/security.rs                    |  23 +++--
 rust/kernel/str.rs                         |   5 +-
 rust/kernel/uaccess.rs                     |  15 ++-
 rust/kernel/usb.rs                         |   9 +-
 29 files changed, 324 insertions(+), 207 deletions(-)

-- 
2.51.0

