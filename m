Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3523D2494FE
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 19:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765913075; cv=none; b=rdgrukXKcfkXxtwZJMbuaMr/zqOxtBcBocCc1i1Fpp9nnoZ7i2mhCn+ca4TG8z3F/R8jan9mE5jnrTPGMdRDprw4z+C4pz4PARukjgtCExKKdFrRgaj7NTg5yPBc2rXJZbFonxv+ayh2cvKQAKuaqP2MblnRqnPweRaMlphNVLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765913075; c=relaxed/simple;
	bh=SWHEdBxZo+FRHgj7C4w5tSRd4qW/bziiVVJ4X7sXMYU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TfsZfiVB2kFyvI/yRIiR0jv5wH8gnItTXmE2/GWnVvbV1cb7GaowlYDv51g+++aroR5qFEPH+Tl+1EzdlRUxKPGKpEdXFm3TrPBIlLfU5RvetJgmgpHdSMJHhNv5QU2SaAN6NYvnDGHzBLI1lIMawQcylXnffUDiWSkPdM29aDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VZUeLz0i; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VZUeLz0i"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7b89ee2c1a4so8677878b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 11:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765913073; x=1766517873; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5q23d00oE8UFGkLbHQX+aW+agLtL7gXbtiEaOVDZIWI=;
        b=VZUeLz0iqrXN7Jzyq/vXnwkBHUOQWqK3CncSp5ZJ893ka6lJfzyjInT7FiRno13NGn
         4WsdVWCCaFtOk275PPeNfOKBx8+t7EhpiASixjmc+ueX/otryi2ejs0rpeTqZeT3tBhg
         Ih3hwc0hR68jfm0sMH6R4v958QWYaugheKFUyGGo3bHwz2diCsjTDVAUpOhzYMHQr0SE
         GDw+MT/EdhwAv4jaIQOK8BUZWAUnC6CWnsBJb6k65zz2O7xbjA10J137PDa0uzfvqnjV
         tT5PHXLMME65zfqy534sWmN4aXCMMFjsj2A+FRG7gnPnEWIuNdx5rm1dvLpfRPWzjsn8
         0R1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765913073; x=1766517873;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5q23d00oE8UFGkLbHQX+aW+agLtL7gXbtiEaOVDZIWI=;
        b=bqEOzh9WYS+L6InNwopmWPQH+wqaE7BhyNJGvABkXFppGpnAXpahIKQD1rHWAox5X/
         5V+gg7/N2Zh5dJp3hKsOlAyKgGFy5B/E2NnB71hChG6Yl/oz0a9Syo+SNlYd+daDH5yd
         ad9xJY6WYDECOsEyZfWjbg6Sxvc7nIN9Nr+A4M9FKZjtFNrp2DW1o9tdhOQCEHb8iMrP
         z4zWurWjD19zjHAT2InANVhsfuflGg5aKg5MpnY6RnIdWFrLNEwo5fDR/doMh4eUZZVe
         ZbKBQZ4lZpY+Sf9S5P5DnMo6cd79+jD/cYQiqc6n+Ro1Hp+th4ZsPBuMfedUB0vIKmGF
         7pYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlvZXR78f0PbTwCji5qQ3afAFD27gR5Tg3Kr2JCvhX/dTI0r6ky7qZHQHszz0P3ds8fgucwHSb3d/97XyOtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMralOd2pzYllxzB9ctxrvvSPzxw4FVMm2eUxrjVyoing7UnZF
	uQMnu+AOHJADNASaJUZ6d6xRnE7WxEcYx3gQiTfiA6lp4Yd0eo9XsQ+SX2lUiyiy3vgGgIqa7XL
	fK0bSyAGWAQ==
X-Google-Smtp-Source: AGHT+IEAslWa1QKiMy5RK/NKN4ucsuPFRI0rRfM41tmE84fajfDkDYHFW8H/IyF5Ctfmskm8bfxOthlI91V8
X-Received: from pfbjc42.prod.google.com ([2002:a05:6a00:6caa:b0:7f1:471b:64df])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1c83:b0:7a2:7cc3:c4ed
 with SMTP id d2e1a72fcca58-7f66773937emr15039039b3a.4.1765913073454; Tue, 16
 Dec 2025 11:24:33 -0800 (PST)
Date: Tue, 16 Dec 2025 19:24:28 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOyxQWkC/12NwQ7CIBAFf6XhLAa2rYon/8N4KLClmyg0YIim6
 b9L68V6nJfMvIkljISJnauJRcyUKPgC9a5iZui8Q062MAMBrRSgeAqGa/KWvEtcaXGspTZWo2V
 FGSP29Fpz11vhgdIzxPdaz3JZvyGQsA1lyQW3ulw0jcGTaC8uBHfHvQkPtpQy/NqHPxuKLXtdq 8YYBbLb2PM8fwDiHSwX5wAAAA==
X-Change-Id: 20251029-soc-bindings-9b0731bcdbed
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765913070; l=2111;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=SWHEdBxZo+FRHgj7C4w5tSRd4qW/bziiVVJ4X7sXMYU=; b=8iknRXoVdF3S0A5SXduSnn1QPNg/ocKZIoc/Al3SGdwk0Hao7jVeJ05tLKi9uLYfN7ifzN4wq
 Gz9wAk55AHfCMQssWiRV5yoTd+lCgux9L2xzPuyfk6kskr8HzG/Vatf
X-Mailer: b4 0.14.2
Message-ID: <20251216-soc-bindings-v3-0-42ecdc8c117e@google.com>
Subject: [PATCH v3 0/3] Support exporting SoC info from Rust
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
 samples/rust/rust_soc.rs                    |  82 +++++++++++++++++
 8 files changed, 236 insertions(+), 2 deletions(-)
---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251029-soc-bindings-9b0731bcdbed

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

