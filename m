Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BB319CD03
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 20:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766780231; cv=none; b=NBIFMn0oHNqLX3HapTBQT9USn5BW8PhsU3EUGWkw3GQns1S4T0Bl2nR6RFWadR5s7ZMX0+hKVke+vW2i9lO5FcYC0dlrbgBZbodM5KemfMU3wYP6Ajuz76Uq8BpuxLrLOSRZWMIX0/9qyx6h4fecIqqXixBZQTKmB355YL75xbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766780231; c=relaxed/simple;
	bh=EJZnm+nb7wp4N1/Qx2A5S5NYOck4zDB9NKIAZUvomcM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fBtBn6DPLxbeIbs88wIVDM/eZDk03vwQbtIrJ1H/xS69CY/amBScgnUb3Vz7BnWfDjGYb+GynvR32u9mWHBNZliEL6qEHoujnGFYIwSYUpT8EYc07lz/fEnFnEMMgsj3QOhyYLb71IPXFcSlj48dUbBmaFf5ebC3KMGL13s0+RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ChFd6paa; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ChFd6paa"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-29f2381ea85so160834245ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 12:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766780229; x=1767385029; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6eveUFtxNbUfDohad6RgR884RRq+dP44lxUGpayeCq8=;
        b=ChFd6paaVS7GMK+0EdIoiYpcicJCXh45M0Hopmo08HWdg0GDk9kAmgf5e+UJdwax6e
         I7yFJvQHled/7E9cWHG759RBqXeSZ+TUhz4EbL/D0Z6TaY+BkcDxZgeL1CgCad0hhZT3
         qwDThm43LftNNMqirlZPMyoyq4kkYoZvndSaqSObDQ/rqsQL5u78q+ofjQHpDd1D2zWd
         vY8JcCuuCXIaaL78zSX8G7JBnu3U8i4zuiIbQAsMD3gvbm0V3r+dYkPp9QllueS8rs80
         g9no2QjUElCq9JiRbMzhJe7r/sjrK0oYBvTSXvmUYmw3YDL2CkSTPCiQmnqE1kLZTqTA
         t4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766780229; x=1767385029;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6eveUFtxNbUfDohad6RgR884RRq+dP44lxUGpayeCq8=;
        b=GWweHFHDtVsApcvJUCths46df8RQ1djPN9MeqriAE7nHsa+TKBA1ylRsNo5uinkpkh
         YVUa3cvYLmac4ia9+iDAjlqMK8yNNQDm5fT1GqxXnMJK0XpVB3qBqMcJ2ZkJnkcCZOJv
         crlguKwBWSCTk/wQBr662M2YV01gds8cGLsLch1Uxapa2Q5V783Qst5MO48mYKJ7gkun
         zVQ9lz/r59Uk7rY4qH19WBnqZp96KzHxEktW+C1w/6quIHSOZR+MkWVM/fa1+TMHkf8g
         NqWvN3fE1E9r9NCPMKNbJ+kS5YRnVYn+rnXQqYv1fh3Nx1LwDH2YEVPLOajItIfLR4ao
         uMdg==
X-Forwarded-Encrypted: i=1; AJvYcCXk4W19vvvddDNYHyHefJLYkaupRJVcS+GGgAnvDMDwpV8MvHPzzCh8CAHadruDTOAjVXGa3+7YERTTOqnx2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJMqSvFcIm1sQbpkMeBSx3Tb2GomhFb4PXNvjXk2nXh/uwlniy
	64wsRFNc7Y1bNcQXXhCWpB6uRADApGbfN6uW2qFpJzF8KnYlC7e/DwxpNUbkjgldv9CEJhOU/Yz
	ZYvilf1Vu6w==
X-Google-Smtp-Source: AGHT+IE4QJwGsSuuHiJKIKZKMUosUK0fvkacPv8eFrbmu8E0Rp34fdrRpcO2IJnwjAGeyDwoI/bCaj/Yf2hm
X-Received: from dlbps8.prod.google.com ([2002:a05:7023:888:b0:120:5def:9544])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3b0e:b0:11b:65e:f35
 with SMTP id a92af1059eb24-121721aba46mr19602611c88.7.1766780229519; Fri, 26
 Dec 2025 12:17:09 -0800 (PST)
Date: Fri, 26 Dec 2025 20:17:06 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAELtTmkC/33NQQ6CMBCF4auQrq3pDEXAlfcwLuh0hCZKTWuIh
 nB3C25EE5dvku+fUUQOjqPYZ6MIPLjofJ+G3mSCuqZvWTqbtkCFBSisZfQkjeut69soa6PKHAx
 Zw1Ykcgt8do8ldzyl3bl49+G51AeYr+8QAq5DA0glrUkvtCauVHFovW8vvCV/FXNpwE+9+9KYN JxNXmuiGqH50fk/nSetkclSRQAlr/Q0TS8KxVSgJQEAAA==
X-Change-Id: 20251029-soc-bindings-9b0731bcdbed
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766780228; l=2267;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=EJZnm+nb7wp4N1/Qx2A5S5NYOck4zDB9NKIAZUvomcM=; b=jNxDeFBVLe2fQNtDym0xPu6sOMqHn6El6v46vhwk/EH4SIQUwVxi8GnMzSKebWQ455e3dipgL
 o3Qocc4iLeDAOLN7jmUQNXb0DkTtbCH20uHXax0gjOmi9XxX6Bh9/18
X-Mailer: b4 0.14.2
Message-ID: <20251226-soc-bindings-v4-0-2c2fac08f820@google.com>
Subject: [PATCH v4 0/3] Support exporting SoC info from Rust
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
Changes in v4:
- Switched `c_str!("foo")` usage to `c"foo"`
- Link to v3: https://lore.kernel.org/r/20251216-soc-bindings-v3-0-42ecdc8c117e@google.com

Changes in v3:
- Renamed `Registration::register` to `Registration::new`
- Inlined registration function and avoided `this` usage, per Danilo's
  suggestion.
- Link to v2: https://lore.kernel.org/r/20251216-soc-bindings-v2-0-1fb394cc921a@google.com

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
 rust/kernel/soc.rs                          | 135 ++++++++++++++++++++++++++++
 samples/rust/Kconfig                        |  11 +++
 samples/rust/Makefile                       |   1 +
 samples/rust/rust_soc.rs                    |  81 +++++++++++++++++
 8 files changed, 235 insertions(+), 2 deletions(-)
---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251029-soc-bindings-9b0731bcdbed

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

