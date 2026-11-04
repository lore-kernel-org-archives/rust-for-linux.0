Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751406;
	b=aAMLo0zBiVkhqUSeJTmzK53D8mKmpsG+bdWH0E4vQAWoa/8QKNoMU8okDIRew4B4cn2d
	 TtS6gTg2rQNdKK4E5dhfBIbnYmvEFuVadeMKLEJseAMAbsloYXCURZKZ5p+cwwfhjkth9
	 A0ef/PwUZtQU19Gz2NZuWnr+RRI75lnZUaL0EueNuVT8encilwaJ/1s0ZEP7SD7GM72Ij
	 Ih7fOvP4VdM3t9YL39ZNkDRlc6pWyRItIUcwyZm5RPHwOSYtNLN+60/HSRiP9/QtE9LxP
	 DnCboB4ooNsyKpKEV7u4yf43K5IO+pjeVJMmGDPo2wPtcpWfvqvhMwl23sf1QBiVK8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bGh2bzDPOIEbGfktXF6GfR5yaUnmEtGY5mtfwzboFEI=;
	b=5B9HrMf/ima9D4BdD21isV5gpZb6c9OcMqGwNUsXdqEqRNU2dLF2dy/keVMXbqtSY4WW
	 IUTG0STi5Lqm4y6f0n7xfDNdIqzgJvzR5v6GFASVyKp5f/jHKEMqSYu/2KR4otKJ4YYvu
	 MBS0HuMjABC0kw5d7oxS7vFzdeZVBhcAzIZOpWe82wJbGkm5wdoL3ve/cR2t1QzN9+Zo7
	 MZ+DZFvEF+sPnb7teaQmk+8ssg6ROTDuji/VUDPBJ1q+HTB5wrl2kdwMuge4h54ZI+LIq
	 lR2KZrR11awM7GcSDVCxIrME4dtdRMDXAMVn+ofcixSS1Yq1KyejWx1oJSJEQqU8t+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uci.edu;
	spf=pass smtp.mailfrom=uci.edu;
	dkim=pass header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=daBYPC2f;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB156606A31B
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 00:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB156606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=daBYPC2f
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-19430bf08d8so23418c88.1
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 16:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1793751405; x=1794356205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGh2bzDPOIEbGfktXF6GfR5yaUnmEtGY5mtfwzboFEI=;
        b=daBYPC2fpEkPS4Xyq2tOvF2DnTXtmoRs5mx7pqVO0XSYAfoS+l39iqhNIvsXfZiceC
         BdABPrKAOCy/SwU1t2Ec1WKyIcxewjlTr0Mqwt+/C5Exo3xyH/daXOOUIHMc/aPtPsWF
         9wz4dHKAUDxME+MirYBzgF9UAVNS6Yu0jHgPHkGORjhHDYcOydgRk+iLA4E2TpbqcHYy
         eKma1yfX7RK5eGgMAVLKNhWQuspLuQS4qPH4WLOAAL7y/xsuGwwcZh7lYdd1RK/P++su
         EcWH362U1J3v8I2CaeKml0F+qAm5CPpQjhm36wQnavrR+E3IyKq5pvW7uQ1nNesolrRd
         6HjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751405; x=1794356205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGh2bzDPOIEbGfktXF6GfR5yaUnmEtGY5mtfwzboFEI=;
        b=Ivim8GFmvGIMwMxwVi6o66M6ZMzKxYBsEKuDj4ssoia3xJ68F/0DGzCcoIQz9uK1/J
         7/7jHk95rf+6z3LAAgx5sDgMSVcCTBNbPBSRBVI95QNwO4epLXTndtIRljnzxHUXeSPw
         TenFy5IX7ITG+vO87XiHfEJqWyxKZvv0noGIVXgaXai0Y9M9loth+0FHMgDVpSGz5g0U
         /fbTOAcLigIRAMBduM3Is+m52YcRrpBFbP6TIyG3tuogZ+avkmcUlHLRUJzQvcl3bneQ
         KJ16neAoVLzCAcBvoTbNi1dh1YCqpZY/vyntcWp73OHREkEvxRI3kKEjnSKtbwgdx2Yr
         OkoA==
X-Forwarded-Encrypted: i=1; AKwUvBw1gi/9X9rHVjoxNtJQo/YMQqeCspO2RSH1F4gnRa+CQ5H6+uFytHN30t9foTLiTOLZFBVip+Db8kuityWD6Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VVrdYiw24L4g7cMeIV4uN/CdDcqvr9jvELPZzKb8pLAt7JI3I
	MMXg4JWXOvuaagkP5G9xvH1QgIKTQnkJDbwU6hZZbiYEtpnbqUcHMWTbec1oIPomcJY=
X-Gm-Gg: AYBFou31ka10Fwnzr7p6Ev0alLT8BiONVugRSKTp/J2GK6Jx8L8z7b9VvWYA+zbuSlr
	nn6n64BKrQUQ2+L4TALifa6qy2kTsS5ApVxkiykqj4L62edk+G6KHYAqS4ERp0vdpl3aOik77qe
	WEhkzw6wiTnR5vM2MWApEQi5e/mdjt6D+3yKb9PJBeH/HKsProeOyHr76w64rN9RaukavaDpmyM
	6AiTzEeVXANyHys/s25/+Z9VbMzxVRvfWMCz8jIkyAXA1YlBSeGgdhVUeYQ6xivfOSR8t4MMysj
	Ub/GI92pRkFiNL1k7gHApK37UvSfywBY52t/y3rx8Ky98tYvO3oHWKg++Z+ddb+7cmHIcUe/fzq
	Sdnv1ZsErzpNJWD48nMKUwa1mXzNwe5vfIETolLBRU8GNb0/Mkp+5w0F9AoU+AaNwMutZojgPVu
	ZmUqk/GzJCDIVuoA/G4PVq5b0I+xtmu6yQHqysDuoVHBncJpR5FEimYlKSu7Gm0S/2GNbOfMqBO
	9svV5rBSaEMiY578REllV6m/XYGWkK1Qkejr7vPj0FbJOCpY313xLwl/BfvCqozlOIzdsc30xDR
	vYmlhMMmvqHbLRftlQa799VvMgNl3gPs4PuiqcMvwCXLbWqtsXXaABDGhIJT3BedFV6f
X-Received: by 2002:a05:7022:5f06:b0:1ae:d447:6c84 with SMTP id a92af1059eb24-1aed4476cdemr15514404c88.19.1793751404652;
        Tue, 03 Nov 2026 16:16:44 -0800 (PST)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm2181904eec.2.2026.11.03.16.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:16:44 -0800 (PST)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: igor.korotin@linux.dev,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	wsa+renesas@sang-engineering.com,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 0/1] rust: i2c: fix adapter refcounting during unregistration
Date: Wed,  4 Nov 2026 00:16:42 +0000
Message-Id: <cover.1793488795.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear Linux kernel maintainers,

We are developing a tool called FerroLens to detect potential
unsound behavior in Rust code in the Linux kernel. The tool
internally uses an LLM to detect bugs.
We then perform manual analysis to verify these reports.
FerroLens reported the following bug in rust/kernel/i2c.rs:

`I2cAdapter::inc_ref()` calls into `i2c_get_adapter()` to
increment the reference count of the underlying `struct i2c_adapter`.
`i2c_get_adapter()` can return NULL without incrementing the reference 
count if the IDR lookup for the adapter fails. This can happen if the
adapter is currently being unregistered through `i2c_del_adapter()`.
However, `inc_ref()` does not consider this NULL result.
It must always succeed and cannot report an error.

If an `ARef` of the adapter is created and then `i2c_del_adapter()` is 
called, the adapter is removed from the IDR but it is not freed until 
the `ARef` is dropped. Cloning an existing `ARef` in this state calls 
`inc_ref()` and ignores the failure of `i2c_get_adapter()`.
This means that the `ARef` can be cloned without incrementing the 
reference count for the module and device.
Dropping that invalid cloned `ARef` will then call `i2c_put_adapter()`
without a matching module and device reference, which can lead to a 
use-after-free.

Here is a PoC kernel module that demonstrates the bug:

  // SPDX-License-Identifier: GPL-2.0

  //! Faux I2C adapter sample.

  use core::ptr;

  use kernel::{
      bindings,
      device,
      faux,
      i2c,
      prelude::*,
      sync::{aref::ARef, Arc, Completion},
      time::{delay::fsleep, Delta},
      types::Opaque,
      workqueue,
      Module,
  };

  const FAUX_TARGET_ADDRESS: u16 = 0x50;
  const READ_VALUE: u8 = 0xa5;

  module! {
      type: I2cPoc,
      name: "i2c_poc",
      authors: ["Rust for Linux sample"],
      description: "Faux I2C adapter that demonstrates a race between adapter removal and reference cloning",
      license: "GPL",
  }

  static ALGORITHM: bindings::i2c_algorithm = bindings::i2c_algorithm {
      __bindgen_anon_1: bindings::i2c_algorithm__bindgen_ty_1 {
          xfer: Some(faux_xfer),
      },
      __bindgen_anon_2: bindings::i2c_algorithm__bindgen_ty_2 { xfer_atomic: None },
      smbus_xfer: None,
      smbus_xfer_atomic: None,
      functionality: Some(faux_functionality),
  };

  /// Owns the raw adapter registration and its faux parent device.
  struct RegisteredAdapter {
      adapter: KBox<Opaque<bindings::i2c_adapter>>,
      _parent: faux::Registration,
  }

  impl RegisteredAdapter {
      fn new(module: &'static ThisModule) -> Result<Self> {
          let parent = faux::Registration::new(c"rust-i2c-poc", None)?;
          let mut adapter = bindings::i2c_adapter::default();

          adapter.owner = module.as_ptr();
          adapter.algo = &ALGORITHM;
          adapter.dev.parent = faux_device_ptr(&parent);
          set_adapter_name(&mut adapter, c"Rust faux I2C adapter");

          let adapter = KBox::new(Opaque::new(adapter), GFP_KERNEL)?;
          let raw = adapter.get();

          // SAFETY:
          // - `raw` points to a zero-initialized adapter with a valid owner,
          //   algorithm, name, and parent device.
          // - The `KBox` keeps the adapter at a stable address until Drop.
          // - The algorithm callbacks remain available for the module lifetime.
          kernel::error::to_result(unsafe { bindings::i2c_add_adapter(raw) })?;

          Ok(Self {
              adapter,
              _parent: parent,
          })
      }

      fn index(&self) -> i32 {
          let raw = self.adapter.get();

          // SAFETY: A successful `i2c_add_adapter()` initialized `nr`, and the
          // adapter remains registered for the lifetime of `self`.
          unsafe { (*raw).nr }
      }
  }

  impl Drop for RegisteredAdapter {
      fn drop(&mut self) {
          let raw = self.adapter.get();

          // SAFETY: `new()` only constructs `Self` after this adapter has been
          // registered successfully, and Drop runs exactly once.
          unsafe { bindings::i2c_del_adapter(raw) };
          pr_info!("removed faux I2C adapter\n");
      }
  }

  // SAFETY: The I2C core serializes transfers through the adapter bus lock. The
  // wrapper exposes no access to the raw adapter, and removal waits for users to
  // release their references before the allocation is freed.
  unsafe impl Send for RegisteredAdapter {}

  struct I2cPoc;

  impl Module for I2cPoc {
      fn init(module: &'static ThisModule) -> Result<Self> {
          let registration = RegisteredAdapter::new(module)?;
          let index = registration.index();

          let adapter: ARef<i2c::I2cAdapter> = i2c::I2cAdapter::get(index)?;

          pr_info!(
              "registered faux I2C adapter i2c-{}; fake target is at 0x{:02x}\n",
              adapter.index(),
              FAUX_TARGET_ADDRESS
          );

          let deletion_done = Arc::pin_init(Completion::new(), GFP_KERNEL)?;
          let worker_done = deletion_done.clone();

          // Move the registration to another execution context. Its Drop calls
          // i2c_del_adapter(), which removes the adapter from the IDR and then
          // blocks until `adapter` releases its device reference below.
          workqueue::system_long().try_spawn(GFP_KERNEL, move || {
              drop(registration);
              worker_done.complete_all();
          })?;

          // Wait until i2c_del_adapter() has hidden the adapter from new lookups.
          // Successful references obtained before that point are released
          // immediately so they do not delay deletion.
          let mut lookup_removed = false;
          for _ in 0..1_000 {
              match i2c::I2cAdapter::get(index) {
                  Err(error) if error == ENODEV => {
                      lookup_removed = true;
                      break;
                  }
                  Ok(temporary) => drop(temporary),
                  Err(error) => {
                      drop(adapter);
                      deletion_done.wait_for_completion();
                      return Err(error);
                  }
              }

              fsleep(Delta::from_millis(1));
          }

          if !lookup_removed {
              drop(adapter);
              deletion_done.wait_for_completion();
              return Err(ETIMEDOUT);
          }

          pr_info!(
              "i2c-{} is absent from the IDR while an old ARef still exists\n",
              index
          );

          // This calls I2cAdapter::inc_ref(), which uses i2c_get_adapter(index).
          // That lookup now returns NULL, but inc_ref() ignores the failure and
          // clone() still constructs another ARef. Dropping that invalid clone
          // would issue an unmatched i2c_put_adapter()
          let invalid_clone = adapter.clone();
          drop(invalid_clone);

          // Release the only reference that was actually acquired. This lets
          // i2c_del_adapter() finish and the worker destroy the registration.
          drop(adapter);
          deletion_done.wait_for_completion();

          Ok(Self)
      }
  }

  fn faux_device_ptr(parent: &faux::Registration) -> *mut bindings::device {
      let faux: &faux::Device<device::Bound> = parent.as_ref();
      let device: &device::Device<device::Bound> = faux.as_ref();

      ptr::from_ref(device)
          .cast::<bindings::device>()
          .cast_mut()
  }

  fn set_adapter_name(adapter: &mut bindings::i2c_adapter, name: &CStr) {
      for (destination, source) in adapter.name.iter_mut().zip(name.to_bytes_with_nul()) {
          *destination = *source as kernel::ffi::c_char;
      }
  }

  extern "C" fn faux_functionality(_adapter: *mut bindings::i2c_adapter) -> u32 {
      bindings::I2C_FUNC_I2C
          | bindings::I2C_FUNC_SMBUS_QUICK
          | bindings::I2C_FUNC_SMBUS_BYTE
          | bindings::I2C_FUNC_SMBUS_BYTE_DATA
          | bindings::I2C_FUNC_SMBUS_WORD_DATA
  }

  unsafe extern "C" fn faux_xfer(
      _adapter: *mut bindings::i2c_adapter,
      messages: *mut bindings::i2c_msg,
      count: kernel::ffi::c_int,
  ) -> kernel::ffi::c_int {
      if count < 0 || (count > 0 && messages.is_null()) {
          return EINVAL.to_errno();
      }

      for index in 0..count as usize {
          // SAFETY: The I2C core supplies an array containing `count` messages.
          let message = unsafe { &mut *messages.add(index) };

          if message.addr != FAUX_TARGET_ADDRESS {
              return ENXIO.to_errno();
          }

          if u32::from(message.flags) & bindings::I2C_M_TEN != 0 {
              return EOPNOTSUPP.to_errno();
          }

          if message.len > 0 && message.buf.is_null() {
              return EINVAL.to_errno();
          }

          if u32::from(message.flags) & bindings::I2C_M_RD != 0 {
              // SAFETY: The I2C core supplied a writable buffer of `len` bytes;
              // the null case was rejected above.
              unsafe { ptr::write_bytes(message.buf, READ_VALUE, usize::from(message.len)) };
          }
      }

      count
  }

Output:
==================================================================
[  327.590920] BUG: KASAN: slab-use-after-free in driver_deferred_probe_del+0x6e/0x220
[  327.590942] Read of size 8 at addr ffff8882c2a3b4e8 by task kworker/14:1/167
[  327.590946]
[  327.590961] CPU: 14 UID: 0 PID: 167 Comm: kworker/14:1 Tainted: G           OE    N   7.3.0+ #69 PREEMPT(lazy)
[  327.590969] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE, [N]=TEST
[  327.590971] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.17.0-debian-1.17.0-1ubuntu2 04/01/2014
[  327.590975] Workqueue: events_long _RNvXsb_NtCsbuTvttuFvbr_6kernel9workqueueINtNtCsjYlAz7NZ3Sw_4core3pin3PinINtNtNtB7_5alloc4kbox3BoxINtB5_11ClosureWorkNCNvXs1_CsdBGacU8yhfH_7i2c_pocNtB1Y_6I2cPocNtNtB7_6module6Module4init0ENtNtB1d_9allocator7KmallocEEINtB5_15WorkItemPointerKy0_E3runB1Y_ [i2c_poc]
[  327.590997] Call Trace:
[  327.591000]  <TASK>
[  327.591006]  dump_stack_lvl+0x97/0xe0
[  327.591017]  print_report+0x175/0x6f0
[  327.591025]  ? __virt_addr_valid+0x18e/0x3b0
[  327.591032]  ? __virt_addr_valid+0x345/0x3b0
[  327.591038]  ? driver_deferred_probe_del+0x6e/0x220
[  327.591043]  ? kasan_complete_mode_report_info+0x75/0x230
[  327.591049]  ? driver_deferred_probe_del+0x6e/0x220
[  327.591053]  kasan_report+0xfa/0x130
[  327.591060]  ? driver_deferred_probe_del+0x6e/0x220
[  327.591069]  __asan_report_load8_noabort+0x18/0x20
[  327.591073]  driver_deferred_probe_del+0x6e/0x220
[  327.591081]  device_del+0x3ee/0x730
[  327.591092]  device_unregister+0x1f/0xc0
[  327.591097]  i2c_del_adapter+0x234/0x360
[  327.591107]  _RINvNtCsjYlAz7NZ3Sw_4core3ptr13drop_in_placeNtCsdBGacU8yhfH_7i2c_poc17RegisteredAdapterEBI_+0x36/0xc0 [i2c_poc]
[  327.591115]  _RNvXsb_NtCsbuTvttuFvbr_6kernel9workqueueINtNtCsjYlAz7NZ3Sw_4core3pin3PinINtNtNtB7_5alloc4kbox3BoxINtB5_11ClosureWorkNCNvXs1_CsdBGacU8yhfH_7i2c_pocNtB1Y_6I2cPocNtNtB7_6module6Module4init0ENtNtB1d_9allocator7KmallocEEINtB5_15WorkItemPointerKy0_E3runB1Y_+0xaf/0x200 [i2c_poc]
[  327.591123]  ? process_scheduled_works+0x7b2/0x14a0
[  327.591130]  process_scheduled_works+0xa1a/0x14a0
[  327.591150]  worker_thread+0x90f/0xd90
[  327.591158]  ? _raw_spin_unlock_irqrestore+0x38/0x90
[  327.591167]  ? __kthread_parkme+0xd9/0x1e0
[  327.591177]  kthread+0x332/0x410
[  327.591183]  ? __pfx_worker_thread+0x10/0x10
[  327.591188]  ? __pfx_kthread+0x10/0x10
[  327.591194]  ret_from_fork+0x2ed/0x630
[  327.591202]  ? __pfx_kthread+0x10/0x10
[  327.591208]  ret_from_fork_asm+0x1a/0x30
[  327.591222]  </TASK>
[  327.591238]
[  327.591240] Allocated by task 4703:
[  327.591327]
[  327.591328] Freed by task 167:
[  327.591416]
[  327.591418] The buggy address belongs to the object at ffff8882c2a3b400
[  327.591418]  which belongs to the cache kmalloc-512 of size 512
[  327.591422] The buggy address is located 232 bytes inside of
[  327.591422]  freed 512-byte region [ffff8882c2a3b400, ffff8882c2a3b600)
[  327.591426]
[  327.591427] The buggy address belongs to the physical page:
[  327.591483]
[  327.591484] Memory state around the buggy address:
[  327.591487]  ffff8882c2a3b380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  327.591489]  ffff8882c2a3b400: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  327.591492] >ffff8882c2a3b480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  327.591494]                                                           ^
[  327.591496]  ffff8882c2a3b500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  327.591499]  ffff8882c2a3b580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  327.591501] ==================================================================


Priya Bala Govindasamy (1):
  rust: i2c: fix adapter refcounting during unregistration

 rust/kernel/i2c.rs | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

-- 
2.34.1

