Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F0C212562
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 00:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765845820; cv=none; b=gifbd4tp6ZcahN5D382rTIpYMNzhKokqlqMbgJyVKgi0Jau6oSmdQXekaQibvQhqSSDw7YG92FGWIynDAGXwihBmkXobPskUFkiBCrrbXGoGn6IkkiBQ+2iOyPC+Kdx5g5hz15KJW5MrITM4o49TlnKm6er/RsRyfbErtL+NKsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765845820; c=relaxed/simple;
	bh=PyeETD5Et8qzyxIU5Iy/WhoF4VtRXaZwMnA07qYPMyk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gczalKeWh1ioIq1LX3Xn6dTMUHfQEfSgZsNmY78rlph73Z+uO9LVHM8Yugk1YXGVCWbO1sfCkaG+VO5FMGBKL6R4HWidCt/NbVzwEPYM25Xoej32SDYuW3MsDnZfXEi1pMUiZoharV5Zdfp4n/DKaWyZppBc0Qe+SJJ23R5Egjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OawY7Z7k; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OawY7Z7k"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b630753cc38so6707970a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 16:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765845818; x=1766450618; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BlRe0FbWROa6LjdFwHQuNy0ZaxgyaagPIpqmmAmTpYA=;
        b=OawY7Z7kyC1NUmuFEzK9lvgccw8bomaHk4ZjEKYnkkJTkgKfxCNr6gaOGtQW92RhqK
         tk4OkVHprLHsEyiTRoOtABzgJmjkWRP48jE+4/dh7meA05kJoeSUppKKpnJh/3m3newk
         3UurzKwLk/cxw+MhFzKd58nRK2FUoDn+t6B8kqfraHdzq6FATBDNNvYzn1VnW4SZ1enb
         l1WE+oRArcrkzrt8VjaJkoyHkhbb9vLTLGyJ5/Mo0HJiFabl5pI+80MI26EAlrmbvSgY
         YRTlgzLFopmMzJ9ehOv5mcdyZU7D5noa6pzwYQ/dI/fzj8QCXqs85S97/JtGtU2AQPiT
         FXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765845818; x=1766450618;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BlRe0FbWROa6LjdFwHQuNy0ZaxgyaagPIpqmmAmTpYA=;
        b=fXEEKuuP6xH8qL/JcBmXfpk771HGbBuOSz+LAXDwE3ysbNh6UmfLR2FZLMjoJPDJ52
         gzILFPYVq5Sv23UaWM6uLpo7+IVIGDzSQhcq/rIPzORGlb5lCEt18zO+96sJBkaiq60r
         YaCgEoHeyjKAX0Apn7lIKpis5QQZ045kgqH3PX4jEskpHu8+3uVJnq4JAy31lf4UAFVK
         fTkV10KrsKhuYIexqAYlfMKPzzP/F/88yk2MTvQNi4ayVFquyXDuMIKBmhXP7CrxPgtF
         hi5ADhhytFVzBDxPrLj6SakATsWmj1hodD/EWQ4ZHFZuPxY9S77zjLC8r8nYv5yi4PPP
         /dxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU//VQrOOx3hZzhIh9k+oQytRgG8Au8X12rc7swMdH7aSI0DsktpywYCaC8DHL5CjRf7NMXmYrSAvtvFt0GCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgz3MGrmW7+WeVQvPPv4m6VWLzI7vAAhZZn/x/B44eAElGgbhh
	72AapQtuHFw9CQCGg3hFrOo7XT003mybmJR3twC4oxmoPjKL+2J5f02zVtdJLnpnW1fmtRq/DkW
	7q31QgH7QsA==
X-Google-Smtp-Source: AGHT+IEdozRvaReujCs6rZVI5kMkCLsMwu9+oinULyjU9huVS/xNzHgo8xPQmJXcrTTiyq76TLtEyePY9ger
X-Received: from dlbbu15.prod.google.com ([2002:a05:7022:220f:b0:119:9f33:34a2])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6887:b0:11e:395:7dfc
 with SMTP id a92af1059eb24-11f34c19259mr9767061c88.28.1765845817971; Mon, 15
 Dec 2025 16:43:37 -0800 (PST)
Date: Tue, 16 Dec 2025 00:43:32 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADSrQGkC/1XNwQrCMAzG8VcZORtp64bOk+8hO9g2dgFtpZGij
 L67dZ48/j/ILwsIZSaBY7dApsLCKbYwmw7cfImBkH1rMMoMWpkRJTm0HD3HIDhatd9p67wlD+3 kkenKr5U7T61nlmfK71Uv+rv+IKPNP1Q0KvS2veh7Rwc1nEJK4UZbl+4w1Vo/xvyazakAAAA=
X-Change-Id: 20251029-soc-bindings-9b0731bcdbed
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765845816; l=1854;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=PyeETD5Et8qzyxIU5Iy/WhoF4VtRXaZwMnA07qYPMyk=; b=8+3oGV117HohB0OB7siuHN55b4Irp1rb9g/DbS2X2KrHgkSaOxAmCCfiSqqFAheL4ADUXTcOo
 Bk6izLcsOIhB0LKOK3NCl21/RE0nT0OtJ9BPIxGByw+7p4uzGhL90Yx
X-Mailer: b4 0.14.2
Message-ID: <20251216-soc-bindings-v2-0-1fb394cc921a@google.com>
Subject: [PATCH v2 0/3] Support exporting SoC info from Rust
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="utf-8"

This is a fairly straightforward binding of `soc_device_register` and
`soc_device_unregister` which allows a driver to export basic info about
a SoC.

The last patch is a sample demonstrating usage, and can be dropped
without issue.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
Changes in v2:
- Switch to new import style
- Increased documentation. Some of this had to be gathered by looking at
  what is done in practice at the moment, as documentation was absent or
  did not match code.
- Remove `Device` intermediate abstraction
- Removed unnecessary pinning of `BuiltDeviceAttributes` - it only needs
  to be pinned for registration, not to exist.
- Aesthetic renames (`Attributes` pluralization, dropping `Device`,
  etc.)
- Use more representative values for attributes in the sample driver
- Fix swap of example values in the documentation for machine vs family
- Link to v1: https://lore.kernel.org/r/20251212-soc-bindings-v1-0-db51044ce805@google.com

---
Matthew Maurer (3):
      rust: Add soc_device support
      docs: ABI: sysfs-devices-soc: Fix swapped sample values
      rust: Add SoC Driver Sample

 Documentation/ABI/testing/sysfs-devices-soc |   4 +-
 MAINTAINERS                                 |   2 +
 rust/bindings/bindings_helper.h             |   1 +
 rust/kernel/lib.rs                          |   2 +
 rust/kernel/soc.rs                          | 145 ++++++++++++++++++++++++++++
 samples/rust/Kconfig                        |  11 +++
 samples/rust/Makefile                       |   1 +
 samples/rust/rust_soc.rs                    |  82 ++++++++++++++++
 8 files changed, 246 insertions(+), 2 deletions(-)
---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251029-soc-bindings-9b0731bcdbed

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

