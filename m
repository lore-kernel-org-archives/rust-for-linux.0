Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B32424D70
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 09:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786441361; cv=none; b=f5Y1numdMdvTy89FoOay8qnpoaA0QQchlRkoaH2jcA+CM3bMjq1tsYiwSeJnV7Shl/ToJuhmkcUS8POu0kr9C1U5lxw2mnCPJt2n0D+TjJ7GNO1bDpfRQDIyjUP3PP1KyHTMtQib5XfOFjUvmIXo5XBAKyf9K+CrapDCA5XAbV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786441361; c=relaxed/simple;
	bh=3GtPDBtfDSI5Fg2TNJcbEvcKP7Jiow8UZdpWvMuWxk0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hei479FEyzbE512ODOAfMx4Q32VNQ5/fG0l7+LRkrjkqUvrcgk2sfkrxt8/5jr/NACKWSsrMfd8Mrg3JwdGFKHcMUywe8Rb4oYmIZUv0LnQl4cD2AbXTPhKPcr8ralB/NrZuaNJrZfhraBSG1bDNZBRZQUfrw7Mkh43VEx9TBzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com; spf=pass smtp.mailfrom=wyliodrin.com; dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b=IUwQbBtv; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b="IUwQbBtv"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47ffaa8ebbdso2269265f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 02:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wyliodrin.com; s=google; t=1786441358; x=1787046158; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vDbf3rFmEbyUidca3UBZclD6tLiyKIeDuCnP/rYnFg0=;
        b=IUwQbBtvtneF7lZvik9PzYS0WQ4NQbagYsGZvhcikWXXwk6pHNlGrAXs6bQ6ClF5V9
         bDMMmt5ygAjWoonBBOMQXIxU7RvvSOX01BZTqJoORjB4cVZKs2Jy8cVnNJZCJXf+GvsO
         MSICWl3AUcLYD5VU7FBtDKa55KO4mnOxDAR+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786441358; x=1787046158;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vDbf3rFmEbyUidca3UBZclD6tLiyKIeDuCnP/rYnFg0=;
        b=G9D6tyFGESWKefcv5wp2Y7sIyAG0d6MjCNVjLlX2NENEvtVZYYstw9UlOXL4Wbhvlk
         Fm1MnI7/c9j2oru8QyWjGiDfP14mWfiQJAVwHr2MFRs31iXZgmcuemGPEgdjxzf6y1CH
         Coc85pYAf3xD0QPYVnDEY1FKSoc5Rh0Taan6QT9Dmp6pVuKLlwL7CBZjE990li2MV1jg
         rqvzl2yHNIlM0AsyFniJXaaTn1bHXT810HQjmKjDzNgVWGwWayn+gX9+EnRXAvw414P0
         6QkPs3b3QBBaGhO8gDC80vFYvxNM/ImFYh/jygQ41i0621jvswtON8jwC1/Lhm21Ns1W
         Lz8g==
X-Forwarded-Encrypted: i=1; AHgh+RoRiGbHvj+OpLuPmSQfcA+2STALpaO1yJp8RDm2OxeK6xWVBnbThRht+gniRCfXFAybFTjJ4paHmGUCXdjyHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLXHYrPA0MnYdBgVDexQ/RhbE462HysoUerWTZIHFpRujp4Ny7
	tIdY9F7z6cgPbTYCOov7svbNCbP6HwaIAXtXSb+as38tke9DdoA5SpXXkyF7p9LAb8w=
X-Gm-Gg: AR+sD12ZFq0mYvTmh6/lZHOGab/U3dSF9wzCnNeeMO/iS9aEtPOuuHh52bwXiuDS3dD
	RHgsOJm4s3IsTump63jj8R+iUa5tbq8iCBC2u6sGy3DV3q5Y5cxiKIYov5PAv0Yo8JCiH19SVPf
	hlPUInXXyaOvIF8O3EulYFkKHtnoqrs0cJLHEVuq2Gk9xTZY6gsx4/GDK6r0wqqrK/QJtoaj0MQ
	GnTIp4SWnRPJw4DV242tEp9Z82ONzc778sMeiqzDKWrC/Bwdge0Cs17GeK1mdUt4AL3VMGFRmju
	rmW4L58KEp7gWKCplZ99UX9Nb70QgVzCa+TzgjyiYKMP5oAq6K8QUOmrB6Dui9cDqFdaEiMvPsW
	vRPb2jRcYyCW4ws/n0UPDFXC6q3WfhILXmXCeKe+gl6HEGWuOcQI3qKiqVel6dQzUxdpgoFbhkW
	xXxnDEo5H5O/vp5m23Ux294CJjdYh5RIJC7n0q4+GSB9Z5lE2Fbvp9GtPPz7VvTgPAUbTDm4ikR
	Tw0baBroqWzLLlJhDi3UlXfIR+WSj10NeslFg==
X-Received: by 2002:a05:6000:1449:b0:47f:fa17:ae0e with SMTP id ffacd0b85a97d-4814ad8a600mr2615990f8f.11.1786441358189;
        Tue, 11 Aug 2026 02:42:38 -0700 (PDT)
Received: from [10.0.36.57] ([217.73.170.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a709624sm3388917f8f.22.2026.08.11.02.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:42:37 -0700 (PDT)
From: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
Subject: [PATCH RFC v2 0/4] rust: usb: abstractions towards the port of
 usbsevseg.c to Rust
Date: Tue, 11 Aug 2026 12:42:27 +0300
Message-Id: <20260811-rust-usb_control_msg-v2-0-ef79c92bd898@wyliodrin.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQqDMBBFryKzbkqSRpGuCoUeoNsi0sSpDmhSJ
 mor4t0bPECX73/++ytEZMII52wFxpkiBZ9AHzJw3dO3KKhJDFrqQpZSCZ7iKKZoaxf8yKGvh9g
 KxJNBKbUtVQlp+mZ80XfXPuB+u0KVwo7iGHjZr2a1V/+tsxJSFHlurTHG5tpdPktPoWHyRxcGq
 LZt+wFLAZY3wQAAAA==
X-Change-ID: 20260801-rust-usb_control_msg-ee34e002b818
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
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
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
 Alexandru Radovici <alexandru.radovici@wyliodrin.com>
X-Mailer: b4 0.14.3

My end goal is to port the usbsevseg.c USB driver to Rust. That driver is
small enough to make a useful first target; the remaining piece it
needs is sysfs attribute support for USB devices, which I plan to send
separately.

Porting the driver requires:
- retrieving endpoints and sending control messages API (this series)
- enabling sysfs attributes API for USB devices (future patch)

These patches add the USB and sysfs abstractions needed to port
drivers/usb/misc/usbsevseg.c to Rust: retrieving an interface's
endpoints, and sending and receiving control messages.

Patch 1 adds `AlternateEndpoint`, along with `AlternateSetting`
and the accessors needed to reach one. Patch 2 adds the
control transfer methods and the `Request` type describing a setup packet.
Patch 3 adds the sysfs abstractions. Patch 4 adds the sysfs abstractions
to `usb::Driver`.

The part I would most like feedback on is the typestate design in patch
1. `HostEndpoint` is generic over a direction and a transfer type, both
sealed 1-ZST markers, so a function can require e.g.
`&HostEndpoint<In, Bulk>` and skip checking the descriptor itself. Control
endpoints get a `Bidirectional` marker rather than a direction, since
bit 7 of bEndpointAddress is ignored for them. I am not sure whether
this earns its complexity for the drivers we expect, or whether plain
run-time check would be better.

Only `as_control()`, `as_in()` and `as_out()` are implemented so far;
`as_bulk()`, `as_interrupt()` and `as_isochronous()` are skiped for now 
as no current user needs them.

I am not sure about the soundness of the sysfs absgtractions, especially
the lifetime annotations of `DEVICE_GROUPS`.
Feedback for this would be greatly appreciated.

Signed-off-by: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
---
Changes in v2:
- add sysfs abstractions
- add DEVICE_GROUPS abstractions to usb::Driver using sysfs
- rename the `control_` methods correctly
- use `Duration` instead of `i32` for control functions timeout
- fix control function 0 value timeout from "for ever" to `USB_MAX_SYNCHRONOUS_TIMEOUT` 
- add `#[inline]` to short functions
- use `u16::from_le` to read `wMaxPacketSize`
- rename `Generic` generic type to `Dir`
- impl `max_nak_rate` for `HostEndpoint<Bidirectional, Control>`
- make data `&mut [u8]` for `control_message_receive`
- Link to v1: https://lore.kernel.org/r/20260801-rust-usb_control_msg-v1-0-655bb444b52c@wyliodrin.com

---
Alexandru Radovici (4):
      rust: usb: add endpoint abstraction
      rust: usb: add control message send and receive
      rust: sysfs: add abstractions for device attributes
      rust: usb: allow drivers to expose sysfs attributes

 rust/kernel/device.rs           |   2 +-
 rust/kernel/lib.rs              |   2 +
 rust/kernel/sysfs.rs            | 602 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/usb.rs              | 227 ++++++++++++++-
 rust/kernel/usb/control.rs      | 367 ++++++++++++++++++++++++
 rust/kernel/usb/endpoint.rs     | 516 ++++++++++++++++++++++++++++++++++
 samples/rust/rust_driver_usb.rs |  14 +
 7 files changed, 1725 insertions(+), 5 deletions(-)
---
base-commit: 8ba098e6b6ff0db8edf28528d1552be261af30d4
change-id: 20260801-rust-usb_control_msg-ee34e002b818

Best regards,
-- 
Alexandru Radovici <alexandru.radovici@wyliodrin.com>

