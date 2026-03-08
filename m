Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6D330AACB
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 18:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772995282; cv=none; b=lKPV1ivJOtPw0nldQ9xhfqcjVEEjfYn2iST6rUCypO1jKJI3OVls9xLeZO3QUkF0AhQts96MaNM91UHaO6/ARZBM6+sE4TJ3s7tMPCzjb8bmRfZ1mf/4TVjFJQ3lq/RtMBJ8i7oUAtDIrwYevj3LlJtL9AjLIZ74o/jwKJg4doA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772995282; c=relaxed/simple;
	bh=Rll2LiAd7aJ8ZjObMsrm3nlYdAzbjAMx+r5VAi0oRKk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IZ7BzGG605Uyd3wGSVqgwrrzshjcUW4sx02tPJv0/liZR6juGfAzP3TUbfZyyRiz1Tj1pqqEoABdv7zhgz77Uwf26uE7+226t1teeBzAVAMeD8oVxEigcte/QQ8p+LFXUgLlcl4b8AlvLZ3HQTO67FNAd9uywUCeyWmziZsc1Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=HQ6/j56b; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="HQ6/j56b"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 6A6BA24002E
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 19:41:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1772995278; bh=Kb5QLxTf/WIFX1fpcVI2uQXKYdI4l9L0Is1c2qLFeDk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:To:Cc:Autocrypt:OpenPGP:From;
	b=HQ6/j56bF7znKcyZxM/1lpel2kwicKXw3pg1yUr4MG9K9EufLn9gtxnLaUGo2i5XE
	 9bpSv8Bg6y18Ak+GFH2mo5bzZCTgOkbTj/5oLryRbJDnkcYX0unjH1v8aBobHHSTPn
	 HqLIjw+HHzP/+F2/M8NRwxUf0E8pWMRgqa4QntB7Kp0JOj53CZN9TyNSfCjL0umUWV
	 cYPrDIhCMa6BzxNZuWlSS5yu7SMpeH8+cTBe4hBun5SpYeOGXtzv/tvA8zc6hQHiog
	 pytGWFl/4zVu/AxZfSbACHYET/NmF8FmsyXNe7NzAnR3X+fx5wF9K4qBfxQlk3yO2a
	 6wsBNvoBd5MZg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fTTVz6pClz9rxP;
	Sun,  8 Mar 2026 19:41:15 +0100 (CET)
From: Markus Probst <markus.probst@posteo.de>
Subject: [PATCH v2 0/2] Introduce Synology Microp driver
Date: Sun, 08 Mar 2026 18:41:17 +0000
Message-Id: <20260308-synology_microp_initial-v2-0-9389963f31c5@posteo.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJnCrWkC/4WPQW7DIBBFr2KxLhFQbIxXvUcVWQ4MyUi2cYGgW
 JHvHmpXandd/pHe/2+eJEJAiKSrniRAxoh+LkG8VcTchvkKFG3JRDDRsHfW0LjOfvTXtZ/QBL/
 0OGPCYaTMKTsYdVFSN6TQSwCHj73583zkAF/3MpCO429/mWOi5oIrGu4x9UXJQqYAtWw5aNbWp
 suC/FX6QTiXBzKCjXTQtXbKCKec7jLficsQgRo/TZi6KqsTo8EI8i10w5h8WPfPM9+N/n0yc8q
 oM86BhUbK1nwsPibwJwvkvG3bC++UCZJPAQAA
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
 rust-for-linux@vger.kernel.org, Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3087;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=Rll2LiAd7aJ8ZjObMsrm3nlYdAzbjAMx+r5VAi0oRKk=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBprcLF2rtp9UPti5j2ESXxsIwqi9SOT9mg6OdCJ
 HHpvmzlx/GJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaa3CxRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9L4gA//ZARmTJAmWfpO/6tGGkS7s/qBaydHxHu
 xNN07r98RalqWYnhKUKu041aK9Kf85v2pSdxnC2qD++xjNJx6+ux1fwHo0VTtnrQ4Y8MtjkQ9S4
 8ZL7EnP2icKDeFwJFH7DH0XyvG01+sf8HWvvSdkBWLFZFtevUZk+YNvqxgI4H9scsdw5LyO+sdW
 U2hAujXQyAAQa0zcXmFptHCvllNMsfKzskh0TY17RwBOoE20trjx5IKWxVhTzbigcBaXioSC0LB
 VUao1ZfuLThHHU+vvg+mFA2P19XDeAUBsy0RdmT3Qn3vmvU8Vc1xltzi1xEzI/Uk1jWIZN8ohjF
 J5jURaW9SlPN1mIOu7t/DUL5h6LXqKZZFIP27FcRMZ9o/sC70Qx1KE2s+UzfoHHAc8YY0m1WHMa
 0YCYGF78e5N/fuz6ycnogSKdyGRmYJj/fZWEnK1aRztI7xPPAI/2zdBQ449nRk+aNVyNdHhUQEX
 qwCKKIYjGezcWSHXjOkWq7Dveuvxicve6SpZrlOSN4Obv0hXPJx1XKK/kHNiNWkRGQwVC687BER
 EjVV87Q6ju6Q5JT6N1jbFaodwOCWcXwQ2t6bE1bSp26P2onYLUtP1J11v+D8wrx3eSghRAEZLiX
 GEBqnyXRp9v+12Jq38MO7F3kLqDh5RBpOJ1zl5YA0oyBg7xpxiTk=
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

This is only a initial version of the driver able to control LEDs.
The following rust abstractions would be required, to implement the
remaining features:
- hwmon (include/linux/hwmon.h)
- input (include/linux/input.h)
- sysoff handler + hardware protection shutdown (include/linux/reboot.h)

[1] https://lore.kernel.org/rust-for-linux/20260207-rust_leds-v12-0-fdb518417b75@posteo.de/
[2] https://lore.kernel.org/rust-for-linux/20260306-rust_serdev-v2-0-e9b23b42b255@posteo.de/

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
Changes in v2:
- fix missing tabs in MAINTAINERS file
- remove word binding from patch subject
- add missing signed-off-by
- add missing help entry in Kconfig
- add missing spdx license headers
- remove no-check{,-cpu}-fan properties from the dt-bindings and replace
  them with the check_fan module parameter
- use patternProperties for leds in dt-bindings
- license dt-binding as GPL-2.0-only OR BSD-2-Clause
- move driver from staging tree into mfd tree and mark it as work in
  progress inside Kconfig
- only register alert and usb led if fwnode is present
- Link to v1: https://lore.kernel.org/r/20260306-synology_microp_initial-v1-0-fcffede6448c@posteo.de

---
Markus Probst (2):
      dt-bindings: mfd: Add synology,microp device
      mfd: Add initial synology microp driver

 .../devicetree/bindings/mfd/synology,microp.yaml   |  49 ++++
 MAINTAINERS                                        |   6 +
 drivers/mfd/Kconfig                                |   2 +
 drivers/mfd/Makefile                               |   2 +
 drivers/mfd/synology_microp/Kconfig                |  14 ++
 drivers/mfd/synology_microp/Makefile               |   2 +
 drivers/mfd/synology_microp/TODO                   |   7 +
 drivers/mfd/synology_microp/command.rs             |  50 ++++
 drivers/mfd/synology_microp/led.rs                 | 275 +++++++++++++++++++++
 drivers/mfd/synology_microp/synology_microp.rs     |  82 ++++++
 rust/uapi/uapi_helper.h                            |   2 +
 11 files changed, 491 insertions(+)
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

