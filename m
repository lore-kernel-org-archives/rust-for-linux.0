Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED7430DD21
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 16:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763310073; cv=none; b=ZVQPbytqUh7Hyg0d0Vv8OB0Anl89er83y+eGbZ0IikcIlwawkS7Lkkh9RFaKtRUeTEMcU69AIeI21KmTvnRoueFkDntkmkPNVpfo/Z0iZpiOMh/Z2MV+s/PrFKguWR3keqS/e9rOPqIP8lOGlDoxRBdoqwvAtp/9xLCRJOqmsY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763310073; c=relaxed/simple;
	bh=N9GwHhrwXN8T79d8/Wm55vHCpVfeFpHBwIK2TWPVdn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z7b9XSSDkpw+4xT3i2xK9KE2I4HeYNuQ9+rBYAeyMfuwR4iSDhFFR/xNwaysy2Ey70pc7M2Ivr72ZU/kYebV8Rj0OaAKg0UIB/769IFfuX73juhPH3Sip48xdmn3qMyTf+lyQrSBKtzOER7e2uOUhnerlx486g3ZuQ5bN2Y+wQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HopCOVo4; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HopCOVo4"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b566859ecso2608834f8f.2
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 08:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763310068; x=1763914868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pe0NDiKKx/YsK06c9Pcjlf1S4iXAJv9h0oYfXcJlB/k=;
        b=HopCOVo44lcbJYVV6t93go2m5ubwHajmGcrKvHSA2aaymttgSgflo9oiOLc8PHRX98
         F79Y5+ZF6Hxf/KxZkXX42uy1L+QLphHCaH7fSwUa2k8FQVRgdpxHKfFnxfUfD088o4EK
         Ezzver8Vz4PldXny9wr+cND6EjSRQjb5LNncZBwjRMLCIL3YeOnynwCtxAhvPtxYWguL
         UK0HxKNzrvDEKQ+CIawqHwREkhW66Pji9HkA9en8DmJ8as1PZlNI9djJIsOcsgBQQCX8
         87Bk8KwYEKwOECADVaGK+7StnyfvseWu5a1ehlv4cCU+rq6g5L+cTlb2Yes2S/V/07ax
         bJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763310068; x=1763914868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pe0NDiKKx/YsK06c9Pcjlf1S4iXAJv9h0oYfXcJlB/k=;
        b=Nr47XeS0mRTXg8qyQ0CF+gHlJbR6ksKOKXhleWWJ5roeIOxm+SUTMGtcw1/YtpiUES
         XUcDFCTGx8YGzmArWraE5SMsJ0Gj9ph0YrJEHZvv6RWeAsfNx3qC2fhK28PkkF16EZYX
         qI3Gh6xmEMUq/mRZS3Dk0+xqogY+R68XBIB+XjE6y5FNYrNmjvPcZmcYDK+ZeawQ8oBo
         VJbME6P9VszjX9+YiGwRn9Jpve6L0J4ExkoYyRz5n303txOJhsDHEX3Ew3+unJxROoZx
         2brRx/W2o7vsDiohyQ1PunNk3IO4qk95KVP/E4MZxSCS+Q7MROBODI2zneSxjlmZBrK8
         V5Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWZqvMlsRx0WFci+l7HDbF1VioGXLt0cgcsbofOkyxVJxF2MkkR/5Vhq9xxstglWdLwnYHh0U3XKcKHlIHPrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9NstXNcBxIpATeBtPH5Cfbvz7AaUQPF1zquvQwu1xToqSrfG1
	rx/1H2Y2cF3lQzTSklxq/kY2P4QT6I8tzQUvoPAy8oiyYNreA55UdmuO
X-Gm-Gg: ASbGnctmsd/RLjeQPzj4rbMZzimM1pXPRSnPiPcvKdxlD6t9vAtVdezy3h7isJyaV9a
	uxaJQ7TpO5eZ+yv0+Atj831YoU65StZr0iiQTFkmpzNi6w0QjIvyFjKwGr8THCCgNbOJ9mdYlCZ
	xzkeNjev6OCE9l91WSKC4sBgGzkgDu0mLSHcDRZ11NlBi/Omjqld/O2Btk1G/9fI8FQbIaqVJsI
	/h0ZDnkNO5hhhKDGXFB2zUSfl6sVt99eZKherPstzgO4yf5XLgR3bo/Xb7W8W7R/CDTxpw1HTIC
	SZQ0JJk6jG4tq8NvKQJIK5RTDIFegDKO4TWhJUEgb3vr45GV0iTKSEkkBGGtKHknkl6NkyyX5p4
	5cbusvx5tYxdycbJ6r3sUPcAuVhTKbr/Wp8AnxIzP8ErnXY+fGvEL003pryXG3LsKkIfKx9/ngi
	KpxpqQlqTRepPUWio=
X-Google-Smtp-Source: AGHT+IGEG+Mxq+3HDVgqm6QTXs+Ipf1MK7I0z124mmANQk9ZITjfnkNKaKjZL3+F1/WvmqntvZF3ew==
X-Received: by 2002:a5d:64e3:0:b0:42b:3c25:ccea with SMTP id ffacd0b85a97d-42b59394964mr9530152f8f.42.1763310067772;
        Sun, 16 Nov 2025 08:21:07 -0800 (PST)
Received: from Vasilio.Home ([176.26.203.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae88sm21364243f8f.6.2025.11.16.08.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 08:21:07 -0800 (PST)
From: Igor Korotin <igor.korotin.linux@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Hung <alex.hung@amd.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v8 0/4] rust: i2c: Add basic I2C driver abstractions
Date: Sun, 16 Nov 2025 16:21:04 +0000
Message-ID: <20251116162104.171420-1-igor.korotin.linux@gmail.com>
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
    Introduce `i2c::I2cClient`, `i2c::I2cAdapter`, `i2c::Driver` and 
    built on the existing `struct i2c_client`, `struct i2c_adapter` 
    and `struct i2c_driver`, with safe Rust wrappers around probe, 
    transfer, and teardown logic.

 2. Manual device creation  
    Provide an API to register an I2C device at runtime from Rust using
    `I2cBoardInfo` and `I2cAdapter`, including automatic cleanup when 
    the driver unloads.

 3. Sample I2C driver (legacy table, OF & ACPI)  
    Add `rust_driver_i2c`, a sample that:
      - binds to an I2C client via: 
        - legacy I2C-ID table, 
        - Open Firmware (device-tree) compatible strings, or
        - ACPI IDs.
 4. Sample I2C client registration (OF & ACPI)
    Add `rust_i2c_client`, a sample that:
      - binds to a platform parent device using OF/ACPI table
      - registers new I2C client bound to the parent platform device
        using `i2c::Registration::new()`
      - destroyes the I2C client device on exit.

Together, these four patches:

- Establish the essential Rust traits and types for I2C drivers.
- Enable driver binding via legacy ID table, device-tree (OF), or ACPI
- Enable manual device creation at runtime.
- Ship a samples showing typical usage 

Igor Korotin (4):
  rust: i2c: add basic I2C device and driver abstractions
  rust: i2c: add manual I2C device creation abstractions
  samples: rust: add Rust I2C sample driver
  samples: rust: add Rust I2C client registration sample

Changelog
---------
v8:
 - Rebase commits on top of [1]
 - Applied kernel vertical style [2] 
 - Replace core::mem::zeroed() with pin_init::zeroed()
 - Rename `I2cAdapter::get_nr` to `I2cAdapter::index`
 - fixed some minor format issues
 - Link to v7: [3]

 [1] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/log/?h=driver-core-next
 [2] https://docs.kernel.org/rust/coding-guidelines.html#imports
 [3] https://lore.kernel.org/rust-for-linux/20251110112437.50405-1-igor.korotin.linux@gmail.com/

v7:
 - Rebase and update `i2c::Driver::probe` function based on patch 
   series [1].
 - use `i2c::Driver::unbind` instead of `drop` in 
   `i2c::Adapter::remove_callback`
 - Implement and use `i2c::Driver::unbind` for I2C SampleDriver
   instead of Drop.
 - `i2c::Registration::new` requires a parent device to which a new
   I2C client will be bound. 
 - `i2c::Registration::new` returns `impl PinInit<Devres<Self>, Error>`
 - The existing rust_driver_i2c sample has been split into two:
   `rust_driver_i2c`, which demonstrates the implementation of an I2C 
   driver, and `rust_i2c_client`, which demonstrates registering a new 
   I2C client bound to a parent platform device.
 - Link to v6: [2]

 [1] https://lore.kernel.org/all/20251016125544.15559-1-dakr@kernel.org/
 [2] https://lore.kernel.org/rust-for-linux/20251005102226.41876-1-igor.korotin.linux@gmail.com/ 

v6:
 - Add implementation of unbind for `i2c::Driver` trait;
 - Add argument `Pin<&Self>` to `i2c::Driver::shutdown` method; 
 - Adjust usage of `i2c::Driver::shutdown` in 
   `i2c::Adapter::shutdown_callback` in `i2c::Driver` trait code 
   example and in rust_driver_i2c code;
 - Remove dummy AsRef implementation for I2cAdapter. Adjust code 
   in rust_driver_i2c;
 - Add `i2c::I2cAdapter::get_nr` method that returns I2cAdapter index;
 - Optimize unsafe sections in inc_ref/dec_ref in AlwaysRefCounted 
   for I2cAdapter implementation;
 - Remove unnecessary Drop implementation for I2cAdapter, because 
   I2cAdapter is always a reference;
 - Remove unnecessary type definition `Ops<T>` in rust_driver_i2c
 - Simplify call of `i2c::I2cAdapter::get` in `try_pin_init!` macro 
   for rust_driver_i2c
 - Link to v5: https://lore.kernel.org/rust-for-linux/20250911154717.96637-1-igor.korotin.linux@gmail.com/ 
v5:
 - Rename missed pdev variables to idev (thanks to Daniel).
 - Import `crate::device_id::RawDeviceIdIndex` and 
   `crate::types::AlwaysRefCounted` in i2c.rs.
 - Switch dev_dbg to dev_info in the sample I2C driver messages.
 - Make `I2cAdapter::get()` return `ARef<I2cAdapter>` instead of 
   `&I2cAdapter`.
 - Remove `TryFrom<device::Device<Ctx>> for I2cAdapter<Ctx>` (unused; 
   to be reintroduced in a later I2C series).
 - Remove `AsRef<device::Device<Ctx>> for I2cAdapter<Ctx>` (unused; 
   to be reintroduced in a later I2C series).
 - Add `AsRef<I2cAdapter> for I2cAdapter<Ctx>`.
 - Use i2c_get/put_adapter instead of get/put_device for 
   `AlwaysRefCounted<I2cAdapter>`.
 - Update safety comment for `unsafe impl Sync for Registration {}`.
 - Tweak comment for `I2cBoardInfo::new`.
 - Adjust build-time assertion message in `Adapter::register`.
 - Link to v4: https://lore.kernel.org/rust-for-linux/20250820151427.1812482-1-igor.korotin.linux@gmail.com/ 
v4:
 - Renamed `i2c::I2cAdapterRef` to `i2c::I2cAdapter`.
 - Renamed `i2c::Device` to `i2c::I2cClient` for consistency with 
   `i2c::I2cAdapter` and to avoid confusion with `i2c::Adapter`
 - Reworked `i2c::I2cAdapter` to be an Opaque around `i2c_adapter` struct
 - Implemented AlwaysRefCounted trait for `i2c::I2cAdapter`. 
 - Fixed numerous comment mistakes and typos all over the code, thanks 
   to Danilo and Daniel
 - Got rid of all unwrap() use-cases in i2c.rs and rust_driver_i2c.rs.
   This covers 0-day kernel panic <202508071027.8981cbd4-lkp@intel.com>
 - Removed unnecessary casts.
 - Replaced all addr_of_mut! macros to &raw mut.
 - In `i2c::Adapter::register` method build assert if all ID tables are 
   None.
 - Renamed all pdrv and pdev instances to idrv and idev respectivly 
 - Implemented an ealry return in `i2c::Adapter::i2c_id_info`
 - Added all missing Safety comments. 
 - Removed `unsafe impl<Ctx: device::DeviceContext> crate::types::AlwaysRefCounted for Device<Ctx>` 
   implementation which came to v3 from v2 by mistake.
 - Added more details regarding i2c-stub driver usage in rust_driver_i2c
   comment.
 - Changed `i2c::I2cAdapter::get` return type from `Option<Self>` to 
   `Result<&'static Self>`.
 - Added Daniel Almeida as a reviewer to the "I2C Subsystem [RUST]" entry 
   in MAINTAINERS, per his offer.
 - Link to v3: https://lore.kernel.org/rust-for-linux/20250801153742.13472-1-igor.korotin.linux@gmail.com/
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

 MAINTAINERS                     |   9 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/i2c.rs              | 589 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 samples/rust/Kconfig            |  23 ++
 samples/rust/Makefile           |   2 +
 samples/rust/rust_driver_i2c.rs |  74 ++++
 samples/rust/rust_i2c_client.rs | 157 +++++++++
 8 files changed, 857 insertions(+)
 create mode 100644 rust/kernel/i2c.rs
 create mode 100644 samples/rust/rust_driver_i2c.rs
 create mode 100644 samples/rust/rust_i2c_client.rs


base-commit: ededb7bcdfdbcfbb7af93e3a543165a9553e1683
-- 
2.43.0

