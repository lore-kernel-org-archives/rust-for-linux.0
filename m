Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E1821ABD7
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Aug 2026 00:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785542487; cv=none; b=foprEbLKHTG0J8gto75QOGoZo9niGIOIfLOtxx4SryqfPOx8Kju5b7fRgrtVY3MptF+JKAWmZYtmQdfiq7Svd/lS0r9j58aRFwLbZ+rQ+tkBLz1btKNHZJkWBbyVgQ1njlK4+T4JDxFmVUR8LPGdJQQ7GJ9M7cOkVs4kacFhQis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785542487; c=relaxed/simple;
	bh=blUFlIt8O7oYpaqhv6zEZCtXsSnujw6mbv2SP3ymoew=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iQeDt6RsrCCxzWZzmqAx2MGzPyVZ+/FwbxOCZHJR51OyxX7iE2GAshRS/L7B8RSiVD4IwJxFbnOZyWfqzvPoGSsV2IZZWwdt07xUIvv970vEkxDnYsJ83xbPE85S9QH4yDQTvrxU9U8YS26XDUPLwPkdObMtzbafywdE5K8hHuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com; spf=pass smtp.mailfrom=wyliodrin.com; dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b=T+mIcf8K; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b="T+mIcf8K"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954dff6536so2225955e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 17:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wyliodrin.com; s=google; t=1785542483; x=1786147283; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=46CUrG4tc8/WbuOoYkVdgL8ks4nY5iubpA/vNK5op0g=;
        b=T+mIcf8KlZW3FJYe3HcBwOUPWDaUqrg93f4KDaL0zYVbiSAtjHL5Evs4c9k5FXd/TI
         bo4vjGOQxkBpofCoLrYVZibCBb5r/0NzVyocvLAnLBaqz66zit+QxeXi7YS7tYqzISqx
         tgazaKDGytjgH2/bXxp2fh6PGdh7pPnaYp7tE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785542483; x=1786147283;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=46CUrG4tc8/WbuOoYkVdgL8ks4nY5iubpA/vNK5op0g=;
        b=U7mHAQCiRKP1rqzabUruqhq5+/DjvgEPrsLWKoSKEIKB0qD4ucCJ9BGs5+uPllnJg3
         Rhgcndtm9s259Iy2rNOCduWS5wfdAsi545Jt+zRiUfx8LSqmMFJO38ignS+VIzV26kJw
         v7c1Bhj+5VHK5wjlTmrpMiFrhXjSldgbhowJt/Tqq4ntzZ9Im8ekl6QISg9kmyNzwmy+
         6I4pFdRXKj3VNC9kngZs2hPrWQZDVN+IdItHPBwLmXbjYopcx0iqFkIhusQBeMpAdSFu
         0KGjw268OyrQBp1589XPF5STheGUzJjP9ALB6+V1bdWnldVhxbPNvZx/KZ/FplBwP8rV
         tcPw==
X-Forwarded-Encrypted: i=1; AHgh+Rqff9Iyf9YpB7iRB74XkGYoEfqh8gPNwSVTkfVK1tz28CLSy8YP7FEp+3uCNWbd4OhUJqglnpm7g+Ey6APtRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw032Uyf4ioc5PQjSr+w6dk40fSUXhi6+7h5AyjHFN6Jo8U570E
	cFCRxPDyCGlOU2h4DAAwPMdQECEDb2NcyXjb0qT/ipcVtN9tt594KNxPwopFMjiLf31Em8K9rqe
	Y9eQKb/JAgw==
X-Gm-Gg: AR+sD11cHksCNfe9cf0drF6Axf6i4pIdA40d8A4+ukPCh1JNJ3NGn7WTlyvwBW7XOHj
	m5Nu+yw6W0yMPHmX0vISBgycUR8XK0xX093DOh92rvm2GTKhfmb9xj4BJJrXY3LMLFus7Vy+aV8
	vVep1OSBkQS0ta98ljsy3VMvvcR2SAaFsp/eK7yAhqrofWGE3EzYztgWcXOXEKDorjpaUgouqRr
	HrxsMetI4ekIzECWcYRH/IlfgJIhcP+9vYwfkpAqpiOU//GXESa/dGVy0IH+8eHvW4lu06aPSNR
	hEf9UyN7niLQNJjvd35YE5DsUGJFkY69AJoTKa2M+PreWlkj6aMStbhEDL4aXH1i8M8G3nY6ZMb
	caxfyMGAltTGaYanJ8tcm6S63t9gDxlC6jQ9jUttl9Cj4PGU/Cux6qHBNY+/PLHb7y/zC4lVSeh
	eMlSA4gO6nDA0H6bGDc5p11jn4KgJwie3aVV4ahQbCpd9KQrbrWnxPolx+3Hgl6+9cIMWY6vRAm
	7/BXYxarYzQNCZG204+2IgXxLOAxWmWZVhmBBStwQ==
X-Received: by 2002:a05:600c:4512:b0:493:a570:df7d with SMTP id 5b1f17b1804b1-4980c696278mr2027305e9.20.1785542483082;
        Fri, 31 Jul 2026 17:01:23 -0700 (PDT)
Received: from [192.168.2.138] ([86.122.199.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm6568935e9.3.2026.07.31.17.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 17:01:22 -0700 (PDT)
From: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
Subject: [PATCH RFC 0/2] rust: usb: abstractions towards the port of
 usbsevseg.c to Rust
Date: Sat, 01 Aug 2026 03:01:06 +0300
Message-Id: <20260801-rust-usb_control_msg-v1-0-655bb444b52c@wyliodrin.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwND3aLS4hLd0uKk+OT8vJKi/Jz43OJ03dRUY5NUAwOjJAtDCyWg1oK
 i1LTMCrCx0UpBbs5KsbW1AM8/bbBrAAAA
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
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 Alexandru Radovici <alexandru.radovici@wyliodrin.com>
X-Mailer: b4 0.14.3

My end goal is to port the usbsevseg.c USB driver to Rust. That driver is
small enough to make a useful first target; the remaining piece it
needs is sysfs attribute support for USB devices, which I plan to send
separately.

Porting the driver requires:
- retrieving endpoints and sending control messages API (this series)
- enabling sysfs attributes API for USB devices (future patch)

These patches add the USB abstractions needed to port
drivers/usb/misc/usbsevseg.c to Rust: retrieving an interface's
endpoints, and sending and receiving control messages.

Patch 1 adds `AlternateEndpoint`, along with `AlternateSetting`
and the accessors needed to reach one. Patch 2 adds the
control transfer methods and the `Request` type describing a setup packet.

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

Signed-off-by: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
---
Alexandru Radovici (2):
      rust: usb: add endpoint abstraction
      rust: usb: add control message send and receive

 rust/kernel/usb.rs          | 127 ++++++++++-
 rust/kernel/usb/control.rs  | 353 ++++++++++++++++++++++++++++++
 rust/kernel/usb/endpoint.rs | 508 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 987 insertions(+), 1 deletion(-)
---
base-commit: 8ba098e6b6ff0db8edf28528d1552be261af30d4
change-id: 20260801-rust-usb_control_msg-ee34e002b818

Best regards,
-- 
Alexandru Radovici <alexandru.radovici@wyliodrin.com>

