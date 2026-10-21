Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582691;
	b=zp3kwSgTUWICJvgij+XbewRZsPWrS7hVI9QYTdFhCmvPGmMcKrjHjDYjMi48D9OOscIC
	 o+YRrv5rJonO9islQgluvWOBsluONEI9Mbf/rQc7XnZiCEZTprJyJvUkTtlkbib8cbl57
	 /yagWMyszPcQhxFEwgbayJp7d9/TlVHFlWDNd2TQGwp/NoZ/0WbxkUOI8mvHenbv2CSjn
	 0a4K6G3vIontF5kHrjv1m/rTACgdB0atfySlq9RwHqw/2uVYOXIXecllZr8VSz86B8OuE
	 Vd+LQbrrIqUcF1RujVmBnqmzxU7TNCGYRTaCDX3nzDN8gy9W60lhgPtVbr/22WtFU6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LnA3nxFQKLVJsHSgevUcTeI6s0Y0Q/eJ7d0Dh717ddw=;
	b=EWZ0u3QIQUHxxtTlxB9J7AllW9go6LbGbmp40Pu8c8WpD+AMYlkCv+lXHcf9t80irVFy
	 tg4+wZI1V1iRco3OhQvMFynB96SaJt2PDWyPaBvSeTqqIm9AWoRs2q3OTV/agIe2047e9
	 8d38LA5PdyeWZuCUPqSWfvMkibCi9pAlwC4ouAHZ+EoxQXx35R7N5D48FTpH9PSnOsWgM
	 t7dJ37tkU5HEPA4WlM+8QV1UMKT9bO97Sv4cq1PWTSdyvEl4lzeU1KniXlOiIb7dZF8ro
	 r/AewewYYOdycrx6ZZP9qTMa1AFXA4o/aeKy4FEfeXnyrtYKXsgYgwiPJh9Z4ZpCTQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=uNCgBPMI;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA09B606A31B
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 11:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA09B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=uNCgBPMI
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e5378b281aso2949045ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 04:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1792582689; x=1793187489; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LnA3nxFQKLVJsHSgevUcTeI6s0Y0Q/eJ7d0Dh717ddw=;
        b=uNCgBPMIjp5KzXLfhAJ3bJ0wk40UU2FhM9hXxcwIsq6ld7G3bXhwhMRSU8NS+SNloD
         NXBVRr7SPorMrkc244+Lo2bQCaEIkF+rUKbeAK7R0+ILa1Etr+ehU26IB61J/F4ikWKH
         km6FsJe4FwnASmizhh3DxOAmPGmM3DAbqKJ9acCdgVPucV675WhzYrJdr/xKUMWePa5v
         o++SRwmGuKK34gIlATcRxZ0vlkxeBu268TwUdan62qDMWw2r+aVyilrGtfQ6oBLj0Gq8
         +e+PUDhg7bHgnhmR1YWSIq/uTng8B3qIDel9ISAR4CUdUF2mmFspk6lgWgaqe3Z2iCNv
         hdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582689; x=1793187489;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LnA3nxFQKLVJsHSgevUcTeI6s0Y0Q/eJ7d0Dh717ddw=;
        b=w4u3pdggiYdKgAWnHtD39yqCLydnWh8uLHnKwgA9pbIc/mWtpc5/xGTusPgAPyDXxh
         e45lmBMscr889LJwA35ivchyu0gdAgbjtEn/yoUD6la9AlgE/5R64l5CYnuQZJpCiwYx
         IrbPbp2qyBTWSGCEzY8Uv5gZJBR2M+eHDC/TOHlgrJUnwWBmiGQxRAW2sAYBIKCVKHiC
         hTE4uj9W5xhlw8f3h1699+P2TirmaKvhJHRcZ6kDzMiXV5b+xwwOq/6tXW7UeBTUT8lU
         lVnSdTZK4dlR8XbZ3B+WXvunFFBwXi3UPqC/mjqUrMVKZESNjMoclns1647yQpg+/VEu
         heWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwinAfnX3KxjL/JSZ7hei/+ckT5kFpexutlLnT6Hp2zE8ZX0kNrfaRNeuiXR0u8NV5M4bFLhNUjPv/hlBdqQA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKFAryXwXQBNTq5OafoTG8cLlFvAc7AIKcvT2gdtdE1dh7n72M2
	eoYLaQtMItyTwdtL6mX3GlCYlpVroVnJkYakgPdAU0LM3AvZf+lCpKnwlSjhhcz5aA==
X-Gm-Gg: AYBFou0QzZvwlwUezGo4n7yAM5y/uUXRx/sy7kfXtgl7fcgeT5PaEt3YyL1H3TP2qWu
	tzU74UvWOaiK/9q7vgyCZAprNRreuWa2huHAWWqIqRSoI69paL9Eq40aw+oai1KsaFErc/qKVXP
	HYdARiQScgxCXiuAxUA7LpYVZ6HO0ZYH+0RDsjiVt80e/F1EnF/Lgd+4k0NbiZ5Dnzc8r+Ir7tQ
	phHPNFw8hilheuoiDLmeKrfJiuU5rAdrgNEcTmPZCy0oSEKInQr6f9rop93OIfRJU2p0W1b0HHg
	8Hr9AJfbnRiNSDMnwZujIXNeCGgSWPguYViD1ZsuTCNcRisalDkveNa5wKWhpJuse+dn1fzWZ6E
	g4LNJGPzanmT1Aecqce8+oJ6VWNuX1ySLrfFXrSMhv8HsEmonaY3XQfyehLze/YOtXXYzvpv2hV
	QIuLerEzIAAugsMocIVgB7XN2L55MjR1Y0EXbCpgIMW3Sz623uN0xBPVLON3aKBP2mOSpdmOSw7
	4LzW56cEtzgyQ7H4beif+3W/D4rIwqR+k5nuLL8wKWHVY1cfMw8z3ktDeCFSOnZOgc=
X-Received: by 2002:a17:90b:5887:b0:3ac:17c:6e82 with SMTP id 98e67ed59e1d1-3ad86d0efa2mr1526965a91.45.1792582688977;
        Wed, 21 Oct 2026 04:38:08 -0700 (PDT)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad813eb9casm4023732a91.15.2026.10.21.04.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:38:07 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH v4 0/6] Add Greybus Sotfsvc and UART Node drivers
Date: Wed, 21 Oct 2026 17:07:48 +0530
Message-Id: <20261021-gb-uart-transport-v4-0-c308ce821d45@beagleboard.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OTQrCMBAF4KtI1kYyadNWV95DXEx+G5CmJLUop
 Xc3LSIusps38L6ZhSQTvUnkclhINLNPPgw51McDUT0OzlCvcyac8YZ1wKiT9IlxolPEIY0hT2c
 uhG6EaFWtSO6N0Vj/2s3bPefepynE935ihm371XhJm4EyyjuuEWqUrWyv0qB7GBkw6lOIjmzmz
 P+dtuTw7CCrpAQrrNRQdqqfAwyqklNlpwPNsENAZQv/rOv6ASmlTRBIAQAA
X-Change-ID: 20260810-gb-uart-transport-9255d6557c4c
To: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Markus Probst <markus.probst@posteo.de>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9289; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=cE5A9sYdDEi2wwpwaPodlCoa7kF7qPSfXRCNfY9L3tA=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBq2KQTnyXkImG+PipIpDDKBXHq1U9KxOOKXSxaG
 RAtZrq1hd6JAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCatikEwAKCRAFzvXHieVa
 dImGD/9j7rJDE1LsYWOKhyCthqYIXsitAH8l+aLCtocGlRF/uLJvsxs78iTXnIJfTr2iyFjTzAv
 eWcMoWAK6y/DbkMtbYems+P02HvcX+iHXytCZQSj1VaHvDx/OBKPdfwa5bVyLrUHBHBpPWlBcnF
 rrUiCZmcwcb8GtUFRXfSPQ+mXBZOoH/ECOPwmO0yZHJeRrL6Lmy1xH+cj4Uu9GroAs1jt6QaDOq
 DKvtGcyJbzjlRwUXACuyAK4ACMuBV/zpZ+2r9DNikw66aXR0sBDBdHtec7EFnv3xfZjyJO59qsi
 VC8Q+Arzft0W1eq9yeQvmoOKoBR+DaVtQZ5XNMevrQUp+QlmrreXD12mQ0V8O7GesL6ZsVcBnkh
 JE84lHxBX+P/Kj0/PUupikvtakg0v1/njwF6fHzcQNciZiNmc34bxBb7ao/IoiRHw3ze5GY9J57
 X4Uo+V0XXu/swIR4sJjiY4ih3b5toRd6mQj7M4CXYuN4Ub62NnseR2Y5Xdi0Ea6cqJNKAlZpL0o
 CHoIlbFjYVQ4FSgJMrfdwCg+5wTr9F+nP3AcLM47GB9Ypei9llCLhJAxRXA67ZQCuhNRKCBqC/6
 qwCk3NCxla6WUPHcBHvDWXn/dEIQkOrTCG42kzA7/RatYGwmGd+JfyoDchR9TaLkwyj3VNWPwlV
 Vq6uVHlR5cZCOrw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

A Greybus network needs an SVC (Supervisory Controller) to bring
interfaces up, assign device IDs and connect CPorts to the AP. On a
UniPro network the SVC is a real entity on the bus. On transports that
merely carry Greybus messages - a UART, an I2C bus, a network link -
nothing on the wire plays that role, so the SVC has to be emulated
somewhere: in a user-space bridge (gbridge), in coprocessor firmware
(cc1352p7 in gb-beagleplay), or open-coded inside the host driver itself.

This series moves the emulation into the kernel and makes it shared.
This was discussed in a prior RFC as well [2], but to keep things short,
removing the need for an external SVC greatly simplifies the greybus
network setup when nodes are directly connected over common transports
such as UART, I2C etc.

    gb-uart-node          gb-softsvc              greybus core
   (transport, serdev) <-> (SVC + host device) <-> (bundles, protocols)
        NodeOps            module_insert()
     submit_message()      module_remove()

gb-softsvc registers itself as a Greybus host device and answers the
SVC-side operations the core expects during interface bring-up and
teardown. A host driver implements the NodeOps trait to push data
towards its node, calls module_insert() to announce a new node,
submit_message() to hand incoming Greybus messages back to the core,
and module_remove() on disconnect.

The first user is gb-uart-node, a driver for Greybus nodes attached over
a plain serial port. Framing is HDLC, with a one-byte address (0x01 for
Greybus) and control byte, followed by the 16-bit CPort ID and the
Greybus message. No SVC firmware is required on the far end, so the node
can be a bare microcontroller speaking Greybus - a BeagleConnect Freedom
over its serial link, in this case. The testing is performed with
greybus-zephyr [0] implementation.

Both drivers are written in Rust, which is why the middle of the series
is abstractions rather than drivers. Only the APIs these two drivers
need are covered: protocols.rs abstracts the SVC-facing parts of
greybus_protocols.h, and types such as Greybus Interface do not
implement AlwaysRefCounted yet. The intent is to grow this as more Rust
host drivers appear rather than to abstract the whole subsystem up
front.

Patches 1 and 2 are small C-side preparations to the Greybus core:
exporting gb_connection_get()/gb_connection_put() and adding
gb_connection_hd_find_by_intf(), a lookup by remote interface and CPort
id for callers that only know the far end of a connection. Patch 3 adds
a CRC-CCITT abstraction, needed for HDLC frame checks. Patch 4 adds the
Greybus abstractions, patches 5 and 6 the two drivers, and patch 7 the
device tree binding for BeagleConnect Freedom.

Open questions
***************

- gb-uart-node imports types from gb-softsvc, so the series carries the
  Rust-to-Rust cross-module calling setup from nova-core [1]:
  gb_softsvc_exports.c plus the Makefile plumbing that emits crate
  metadata and generates the export list. This is a workaround for the
  build system not supporting Rust cross-module dependencies natively,
  and it should go away once that lands.

- Connection create/destroy and interface activate/resume in gb-softsvc
  currently just acknowledge the request. Callbacks into NodeOps can be
  added when a transport actually needs to act on them; I did not want
  to invent an interface without a user.

- Zerocopy is currently not being used in grebeybus/protocols.rs. They
  cannot be derived yet since types generated by bindgen do not have
  them, and it seems explicitly forbindden to manually impl the traits.
  So using old traits from transmute.

- The bindings are supposed to be created for actual device, but any MCU
  that supports Zephyr, can run the greybus-zephyr firmware with UART
  transport. So not sure if adding a beagle,beagleconnect-freedom
  compatible is the correct choice here.

- The individual patches can be spun off into independent patch series
  if required. The reason for this single patch series is to provide a
  complete picture of usage.

- Since gb-softsvc currently is not being used from a C driver, no C API
  is provided. However, if required, it can be added.

- Writing to UART from gb-uart-node is currently a bit broken. I am not
  quite sure what the safe way is to go from a non-bound device to a
  bound device. Any suggestions on this front are welcome.

- I am not sure if Rust abstractions should have a seperate entry in
  MAINTAINERS with me as the maintainer, or if they should just be added
  to the respective subsystem entries. As mentioned by Miguel Ojeda
  [3], this is upto greybus maintainers. So waiting on their inputs. I
  am available to be maintainer for the Rust abstractions for greybus
  if required.

[0]: https://github.com/beagleboard/greybus-zephyr
[1]: https://lore.kernel.org/all/20260622-nova-exports-v5-0-6191773fc977@nvidia.com/
[2]: https://lore.kernel.org/all/ecca8eb2-8e5a-4770-bcf6-3fb49773088b@beagleboard.org/
[3]: https://lore.kernel.org/all/CANiq72mA6pTmPJUk8g7y3Z=wetFMXdzHLiPEPChpY4OTg3OHiw@mail.gmail.com/

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
Changes in v4:
- Remove gb_uard_node::GbUartNode::unbind. Suggested by Markus Probst,
  since write is still valid after unbind.
- Add inline attribute where suggested.
- Remove patch 1. No longer required with modifications to the old patch
  2.
- Increse hdlc max buffer size to 512 bytes.
- Send module_removed request before removing from map.
- Also do not hold lock across interface drop.
- Link to v3: https://lore.kernel.org/r/20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org

Changes in v3:
- Fix incorrect email in MAINTAINERS.
- Make CONFIG_RUST_GREYBUS_ABSTRACTIONS depend on sysfs like
  CONFIG_GREYBUS.
- Fix cleanup in hd::Registration::new in case of errors.
- Fix comments.
- Fix Msg AsBytes impl as suggested by sashiko-bot.
- Use SpinLock for intf_map. This should be fine since we need locking
  only for getting the interface. We do not hold locks across operations.
- Properly drop message in case of buffer overflow in gb_uart_node.
- Link to v2: https://lore.kernel.org/r/20260827-gb-uart-transport-v2-0-a03bb1f5fbd1@beagleboard.org

Changes in v2:
- Fix possible null pointer dereference in
  gb_connection_hd_find_by_intf. Flagged by sashiko-bot.
- Remove prompt CONFIG_RUST_CRC_CCITT_ABSTRACTIONS Kconfig symbol.
- Add CONFIG_RUST_GREYBUS_ABSTRACTIONS to ensure that greybus is
  built-in for rust abstractions to work.
- Use gfp_mask in message_send callback.
- Only provide a Message reference in message_cancel callback.
- Add invariant comment for Registration.
- Call Registration->add directly in new, before constructing
  Registration.
- Add Send and Sync bounds to T in Registration<T>
- Set endo_id as 0. Is not used anywhere.
- Fix module_insert intf_count. Was hardcoded to 1 by mistake. Flagged by
  sashiko-bot.
- Check for empty intfs slice in Module::new.
- Remove module in serdev::Driver::unbind instead of on drop.
- Make gb_uart_node write atomic. Using temp buffer to build frame.
- Fix import style.
- Reorder beagleconnect-freedom dtbinding patch to be before gb_uart_node.
- Add vbat-supply and reg properties to beagleconnect-freedom dtbinding.
- Reference spi-peripheral-props in beagleconnect-freedom dtbinding.
- Link to v1: https://lore.kernel.org/r/20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org

---
Ayush Singh (6):
      greybus: connection: Add greybus_data_rcvd_by_intf()
      rust: crc_ccitt: add CRC-CCITT abstraction
      rust: kernel: Add greybus abstractions
      drivers: greybus: Add software SVC implementation
      dt-bindings: beagle: Add BeagleConnect Freedom
      greybus: Add Rust UART node driver

 .../beagle/beagle,beagleconnect-freedom.yaml       |  62 +++
 MAINTAINERS                                        |  15 +
 drivers/greybus/.gitignore                         |   1 +
 drivers/greybus/Kconfig                            |  35 ++
 drivers/greybus/Makefile                           |  50 ++
 drivers/greybus/connection.c                       |  47 ++
 drivers/greybus/gb_softsvc.rs                      | 520 +++++++++++++++++++++
 drivers/greybus/gb_softsvc_exports.c               |  15 +
 drivers/greybus/gb_uart_node.rs                    | 257 ++++++++++
 include/linux/greybus/connection.h                 |   2 +
 lib/crc/Kconfig                                    |   7 +
 rust/bindings/bindings_helper.h                    |   2 +
 rust/kernel/alloc.rs                               |   6 +
 rust/kernel/crc_ccitt.rs                           |  26 ++
 rust/kernel/greybus/hd.rs                          | 362 ++++++++++++++
 rust/kernel/greybus/mod.rs                         | 220 +++++++++
 rust/kernel/greybus/protocols.rs                   | 442 ++++++++++++++++++
 rust/kernel/lib.rs                                 |   4 +
 18 files changed, 2073 insertions(+)
---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20260810-gb-uart-transport-9255d6557c4c

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

