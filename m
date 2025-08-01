Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537D114B96E
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Aug 2025 15:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754062794; cv=none; b=jwxd8V20ICajAe2E5qPg4HpAHgd/D743W7GB0OhYl7tJIFH7yIbTvn6wD+uBSOlQ6srtyXe1rXXCCGpTnc7S4r6U2uijjd/JoNHPRHREB4nw6WMlt5vYc3whwkxwhP/K/TqA8apH2PLYxCF/903I/HfrnhQKR9ikvKWgur7fqmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754062794; c=relaxed/simple;
	bh=sYeu/tBV5GaOJV8ryVW+sfPBvv5PtI/DIvPueccfvio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OS0YijI6SElyxd2KepU8EQG52jxB6Ekr0eqJW+I8Eq9bxhc6xLXBGbe3cPfKTS/SVWJ81Znwc1TjOl///aNxSj1/ewkoJtwU0BpFrY212ckpzph1wBG6MwMjKoZP8hS071SoNgoVBZX3oBkHS9aKOJwWIdkGXNnM3rbnx+J4jTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuCK5YyG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuCK5YyG"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-455b00283a5so9824375e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Aug 2025 08:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754062791; x=1754667591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZy8Czd+7kBkPdimWl/WOTxDZ+LedUn/uN4ZUK9f4hY=;
        b=GuCK5YyGwcSp2S5nfNcfJvqMVkbp4iFjyVOf16wsGG7Cs6WqH0nFvve0SypJQtNGSv
         eAtUGRBPhzwpCSIR4MOTBGjsSaWBVb6C+F7XxFVg6Ej+GZctewRPPfziSQRieyXiq9ne
         CrdhOm9xNiqpI08P+AAVYowL8eKooWZQ2qCDdFtbFRgdJ04gOTrakBHeP7GzZ1COLbrY
         6trIS0vLg1bVRicaiKbl2RXNj0P6KtBDYJYMlDP1fnCgCiQjgC5YOPT4x2lFKtNCKHsF
         s9jGhAS06sRrdqrzgZndgBwFAFhxItvIUvT0bvnsl6zYqMvikQch2VqMoO08gYVqwgvb
         KTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754062791; x=1754667591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZy8Czd+7kBkPdimWl/WOTxDZ+LedUn/uN4ZUK9f4hY=;
        b=GQgVKR+JCWAemM1IuP+iE3HNjFIIbyx8913ORIUv5gHQbri4pX95ahNQkg6Uk7XpoO
         SmKBa164qEd+Fw51MfRjVKc3yzGNmyv1W1MxA7gC2kGSNmdOmY62YytKbpIZPyYDGeQr
         iqYeDxdQUDAKQfdGGGnoTuEX/QkfQNRT9yZcQh9lXwZyahZ0/W2K6pgxThn49fId51EO
         qCN7i8K1vSNCGledemYB2h8XUGDJNDHNVryK6vaolo5Fudsr0z2YRKP1usKgwzqX9Fzf
         Hn0+bEzEG06pbWItCC9gKO2uw8CktPEvo/uO5F/S5IPwj8gUSE/Nxbhim+fktyN6UOZA
         7dvA==
X-Forwarded-Encrypted: i=1; AJvYcCW5MYEBPx2a0IVr3x/aS70Zz+IZnxSd/mpBreMlV7a5gigHqQ3KGgnGI9WImsz3wtiIToXpXtJ3I2BZPvj7aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlnRZXFm/HPlfyKGqVFOPi4ctsmVOCzGV8L+j2pmZN4xLIPl+l
	9uSbo9keGnH44OTP0GmrNatepWj6tpU1/mEbk8+oeiFZ4n62dGPSmXgo
X-Gm-Gg: ASbGncs/LPIghFbWnopCfKfvGiesyWcSAFkSU/llgF2ZN+rsYAlpd0fzPCc15qVmjCW
	BZQ6mhN5a/A795lqa1lAqzqlbJKgBrIi1wCP6WXKOI7wtmbJDSiOZ5qPBszqDx0HaXU+3jxG5lQ
	PGAprRIh67gNaFL1H1I0RqiDS2pirCXolQ9+EfeqvT0GDdAgXaaRQrarYYhodRF+7mGFQZTcVmo
	Awbomem6YSHEtwa1aXFDkmwdehZWqjCiOiLFY+0/R1d28gma3MkzaNaD/hivypeKVxWGcEdLx8M
	yL4SiuEgkxI4ymiFNFEh3UhoH6YFsWfeekD+KtjbkA2Fv0XjKPhn3YedhIgAkyb6M7lYvXfMjKx
	vlhI/WxcYPwaYm0WmaxPQ/fKhVZjQj4h4HumDwKMu+H/FeYCD4RN7lYMQjDD2bk0OFRoAhq26
X-Google-Smtp-Source: AGHT+IENrmA+Nij+klm5GxN1/eTA/qbaRJeYpBdPt1Zi1ExKIIY9cbANmFfIEoZa4HaaEfznzX43qg==
X-Received: by 2002:a05:600c:37cf:b0:458:a829:aa93 with SMTP id 5b1f17b1804b1-458a829ab98mr53229045e9.16.1754062790272;
        Fri, 01 Aug 2025 08:39:50 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953eba17sm105769175e9.24.2025.08.01.08.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 08:39:49 -0700 (PDT)
Sender: Igor Korotin <igorkor.3vium@gmail.com>
From: Igor Korotin <igor.korotin.linux@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 0/3] rust: i2c: Add basic I2C driver abstractions
Date: Fri,  1 Aug 2025 16:37:42 +0100
Message-ID: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series lays the groundwork for writing Linux I2C drivers in 
Rust by:

 1. Core abstractions 
    Introduce `i2c::Device`, `i2c::Driver` and `i2c::Adapter` built on 
    the existing `struct i2c_client` and `struct i2c_driver`, with safe 
    Rust wrappers around probe, transfer, and teardown logic.

 2. Manual device creation  
    Provide an API to register an I2C device at runtime from Rust using
    `I2cBoardInfo`, including automatic cleanup when the driver unloads.

 3. Sample driver (legacy table, OF & ACPI)  
    Add `rust_driver_i2c`, a sample that:
      - creates an I2C client device using `i2c::Registration::new()`
      - binds to an I2C client via: 
        - legacy I2C-ID table, 
        - Open Firmware (device-tree) compatible strings, or
        - ACPI IDs.
      - destroyes the I2C client device on exit.

Together, these three patches:

- Establish the essential Rust traits and types for I2C drivers.
- Enable driver binding via legacy ID table, device-tree (OF), or ACPI
- Enable manual device creation at runtime.
- Ship a samples showing typical usage 

Igor Korotin (3):
  rust: i2c: add basic I2C device and driver abstractions
  rust: i2c: add manual I2C device creation abstractions
  samples: rust: add Rust I2C sample driver

Changelog
---------
v3: 
 - removed unnecessary i2c_get_clientdata and i2c_set_clientdata rust 
   helpers. Using generic accessors implemented in [1] instead.
 - Reimplemented i2c::DeviceId based on changes in [2].
 - Using from_result in i2c::Adapter::probe_callback
 - Using explicit drop() for i2c client private data in 
   `i2c::Adapter::remove_callback`
 - replaced device::Device::as_ref() with device::Device::from_raw in 
   `i2c::Device::as_ref()`. It is renamed in device::Device.
 - Build Rust I2C only if I2C is built-in
 - Reimplement overcomplicated trait i2c::DeviceOwned the same way it is 
   implemented in auxiliary [3].
 - Merge rust_device_i2c and rust_driver_i2c samples. Resulting 
   rust_driver_i2c creates pined i2c_client using i2c::Registration::new 
   and probes newly created i2c_client.
 - Created a new entry in MAINTAINERS file containing i2c.rs and 
   rust_driver_i2c.rs in it.
 - Link to v2: [4] 

 [1] https://lore.kernel.org/lkml/20250621195118.124245-3-dakr@kernel.org/
 [2] https://lore.kernel.org/rust-for-linux/20250711040947.1252162-1-fujita.tomonori@gmail.com/
 [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/auxiliary.rs?h=v6.16-rc4#n299
 [4] https://lore.kernel.org/rust-for-linux/20250704153332.1193214-1-igor.korotin.linux@gmail.com/ 

v2:
 - Merged separated ACPI support patches since ACPI-table support is 
   merged into driver-core-next.
 - Added I2cAdapterRef and I2cBoardInfo abstractions 
 - Added DeviceState generic parameter which is used for `i2c::Device`
   as a sign if the device is created manually
 - Added `DeviceOwned` abstraction which is a safe reference to a 
   manually created `i2c::Device<Ctx, state::Owned>`. 
 - Added Rust manual I2C device creation sample
 - Link to v1: https://lore.kernel.org/rust-for-linux/20250626174623.904917-1-igor.korotin.linux@gmail.com/

 MAINTAINERS                     |   8 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/i2c.rs              | 498 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 samples/rust/Kconfig            |  11 +
 samples/rust/Makefile           |   1 +
 samples/rust/rust_driver_i2c.rs | 106 +++++++
 7 files changed, 627 insertions(+)
 create mode 100644 rust/kernel/i2c.rs
 create mode 100644 samples/rust/rust_driver_i2c.rs


base-commit: 260f6f4fda93c8485c8037865c941b42b9cba5d2
-- 
2.43.0

