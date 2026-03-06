Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5D4372698
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Mar 2026 19:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772825910; cv=none; b=e+f2+BU+dQl4ozu8gxloJxcbFxWIEzBJsGJZwWzq7j0/LItCw2hfMaSdXy+8Nk4Wya0Pn+AgTAtcaTF/9bh1p2X8dE6MT7vpRPIfq3jugbvN8ciM5TvgIq08Nbr43F5+vQ1YXlSvU0CETANQLTbf08r7o1vTa+3Eqm8i7AJhkt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772825910; c=relaxed/simple;
	bh=fv11/xjhLSF9sYGb68IX61N7BTZecdWaDT1sFssHe9Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZtmHQmSlgv81PY9KhENDNQNeQDOeFYSOTU8JjDgiyLJLD+LdmZDSqlns7xYdgfai6g35ms7YLCtKJqqmFvmr49VDA3qXV7RG5a3BWNFgcmZL47kQgFvqFS7AljwtTvRhKNsreJYkuLyy29KkxUr8T5H4mZYV/Shb7F50XlErYCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=rrrAqfq3; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="rrrAqfq3"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id E76E6240101
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Mar 2026 20:38:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1772825907; bh=Ls4w/CEl22Q9YZGGSbqFegv4lfoIJVTGvihdh85VMKY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:To:Cc:Autocrypt:OpenPGP:From;
	b=rrrAqfq3i3UlDMLYfLfsr3s2HlVXZDgQ2d0w3oUrAsxX3q4kDM1YTKB78i9FP1JjZ
	 0mpqYGzkjJ5GgqWNXEC3NquqRBDJruN0K2zyMOKF21v/AXa43m3ESzMRIxEGhuw7T4
	 yxJHfcMrivvWYXfeBEvpV9yiyFxY6NFAO8aQQJQ5Fm2+Bi2May7vgpkXtifyqB7Bo1
	 TqtDnLIuI9/4vo2qku0f8mq7ObHkkVKHtvSd1F7IPgt1caf7n2bpk2ylLAbPAj5FNE
	 jlRZ4jMtPOU9KTecTPXtSqdvDKd829zWFYTAuO/Bc0N/0r8o+vrLZoMcqGKiIsac4l
	 ko6Dys2kK87PQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fSGsr6qM2z6tx8;
	Fri,  6 Mar 2026 20:38:24 +0100 (CET)
From: Markus Probst <markus.probst@posteo.de>
Subject: [PATCH 0/2] Introduce Synology Microp driver
Date: Fri, 06 Mar 2026 19:38:27 +0000
Message-Id: <20260306-synology_microp_initial-v1-0-fcffede6448c@posteo.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABotq2kC/02O4Q6CIBRGX8XxOxqQSvAqzTnES91NxUBZrfnus
 Wyrn+du59zvRSIEhEh08SIBEkb0UwZ+KIi9mekKFPvMRDBRsxOraXxOfvDXZzuiDX5uccIFzUC
 Zk72xspOlqkm25wAOH5/ypdk5wH3ND5b9+OvrItcrLrikYY1Lmyf1kChAVZ45KHaurE6C/E/6K
 pyXuzJAH6lRlXLSCied0ol/jM5EoNaPIy66SPLIaLCCNNv2Bib+HW/6AAAA
X-Change-ID: 20260306-synology_microp_initial-0f7dac7b7496
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2464;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=fv11/xjhLSF9sYGb68IX61N7BTZecdWaDT1sFssHe9Q=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBpqy0pnxNVzxNCoq4MXDfkZ2eQRpdkHNkB4/6fF
 SWOI5VYAyCJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaastKRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9JObA/8CQ+rl85E9JdRYeq9tV+GgDjBtHSuL76
 ZAcV0IOAo3rCsZqQpjwAFDF9x3XuvJ/mKM9pnW3mEB4alG56ZorTDpMh1O859GRrioAlM91IQ6a
 zETjwweKKYKuoXNBwcCByk0gu3Ft/+iEG2iaHxhZyuUbjc9rAp1/2jNb38eJWmxS/7QiNiaslbL
 Ejw6ZNhXXo3M+Cjp4Bx6kannrM8FMDo9YlffVBf9/3MEA6u8Cn9ZX/VHhswNFkNP3S/5KFV7hLx
 Zb3dzCbV3zysWoh7uHIVbh9IPqwinaOv+01Nu21mCNCxbCtf6Bvi7kOqlxiRekGcky3P94LrEZf
 qtoo1WJM3ydEzvsZa64dkm7PZM+Bg7uqWgNVBpiCZF49l+kIpkq5jjWeNGhjhp6BiOjFzhgyLNS
 CS9TaDrJgWix+HBYyExiDv3XK/mhViGwiO236ZGvZPfAH+cdLfVCt27wYvWzai62rz+oVHkkclk
 eZzA0u+zIKHhFxkbqpfZ3V7rDLFEPMmY+gsNOLIS5iRd5noBBN2IHsCohub/NSu1zpLRc0WNked
 VacoqXemSLI/bNiI81Bvp6PmMVoaXMwxj6DvrXQlFckNDh2P4MI7wijoZKMcoBbo327iO4uaPnb
 ts4KWMBl7aTqOhBPeL8CwIpzf/FZDianyzcC0QBSa0LHXWkI/Qb8=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt

Synology uses a microcontroller in their NAS devices connected to a
serial port to control certain LEDs, fan speeds, a beeper, to handle
proper shutdown and restart, buttons and fan failures.

This patch series depends on the rust led abstraction [1] and the rust
serdev abstraction [2].

This is only a initial version of the driver able to control LEDs and thus
goes into the staging tree.

The following rust abstractions would be required, to implement the
remaining features:
- hwmon (include/linux/hwmon.h)
- input (include/linux/input.h)
- sysoff handler + hardware protection shutdown (include/linux/reboot.h)

[1] https://lore.kernel.org/rust-for-linux/20260207-rust_leds-v12-0-fdb518417b75@posteo.de/
[2] https://lore.kernel.org/rust-for-linux/20260306-rust_serdev-v2-0-e9b23b42b255@posteo.de/

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
Markus Probst (2):
      dt-bindings: mfd: Add binding for synology,microp devices
      staging: Add initial synology microp driver

 .../devicetree/bindings/mfd/synology,microp.yaml   |  75 +++++++
 MAINTAINERS                                        |   6 +
 drivers/staging/Kconfig                            |   2 +
 drivers/staging/Makefile                           |   1 +
 drivers/staging/synology_microp/Kconfig            |   4 +
 drivers/staging/synology_microp/Makefile           |   2 +
 drivers/staging/synology_microp/TODO               |   8 +
 drivers/staging/synology_microp/command.rs         |  48 +++++
 drivers/staging/synology_microp/led.rs             | 229 +++++++++++++++++++++
 drivers/staging/synology_microp/synology_microp.rs |  73 +++++++
 rust/uapi/uapi_helper.h                            |   2 +
 11 files changed, 450 insertions(+)
---
base-commit: 9fad1d148df6f36105159c2503d0ecb1397bc89a
change-id: 20260306-synology_microp_initial-0f7dac7b7496
prerequisite-change-id: 20251217-rust_serdev-ee5481e9085c:v2
prerequisite-patch-id: 52b17274481cc770c257d8f95335293eca32a2c5
prerequisite-patch-id: 680c0509490833f416b17eb3b918bb829ce7b90f
prerequisite-patch-id: 37016d6c07f0da898be02bf30110e8c0a30025d2
prerequisite-patch-id: 3dfc1f7e5ecd3e0dd65d676aeb16f55260847b25
prerequisite-change-id: 20251114-rust_leds-a959f7c2f7f9:v12
prerequisite-patch-id: 42c445ef6981e3a3740dbaaf307f4b810042e46f
prerequisite-patch-id: 90c7b200cca722a592353885e21af069101c4e09
prerequisite-patch-id: c664a52faa3d47000d252eb7603c9c08382e868a

