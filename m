Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF1237E5DE
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 20:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784061038; cv=none; b=Kwl/z1M/WzW038DfRUXkP0LIeL96bzUpenmZduQLv9Z31suYt3eVCYnF0bd+3oaxWZ+VtR+whlADnshxrogGcOTeOJbVTqqTW7KODTrJ2aZTDLoAdegvpw/ywyptg0EZ3L8L0v6dyOPNayoGXGOIOmI9hrWt65Sx2Zb+a/KCLHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784061038; c=relaxed/simple;
	bh=D8qGb2HpnhjSNxZrO4pwb9SIQkas0c+AUM9EGB3yks8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J1Hy+9QEAOCNFX/CJXpNZ+0BoT1NPZ/y71hF53YbwV2ZKwulIu2IslXerZS82jy7A6PkPD6LVhVfmkxYWZPgAEU5VT2TsR0LBrdgJf7BRfl716F4T3WQweAfM2AYoYwLS2fKWZp7Gc/xql0om5gQzjCbzEu7R3c9BW5b5ahw2/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=qb3Mj6SQ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="qb3Mj6SQ"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c999f162c9aso2843025a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 13:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1784061037; x=1784665837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gpHdYKPp7VuXzHGJOmzUPBS6Ddz2C4Ua+T7rhFg/Bao=;
        b=qb3Mj6SQdfGtSvemA3dYnHvxWjHi3bcLFwReifzgr1sG8cj0kpdv5b0xA9mZA4WAfg
         3MLj9GxkWtvq2aY/B0fKt/U8HtlP8lQaNVA9IW6rUwpqEJfSnmoxqyIA772x9doNfq2I
         7ibiZQCaUq1mj8lY3LrugmeI41j4elaDgOR0610yCpANnT6ytmNN70tOJcD/ajWlociO
         /kIBgAFpDXTXFdfqUhygOI39t9XmaIWUzQ1ddxi4yGXCCzK7vVryaIrcxe9NEGcpllRz
         5AINPhqZDfixJAe1NsAuBDoKB7sdW8B3JGs68DVsCyj3cGxqPtI1u5iA2pMrJknI5km6
         fv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784061037; x=1784665837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gpHdYKPp7VuXzHGJOmzUPBS6Ddz2C4Ua+T7rhFg/Bao=;
        b=at0AruCliL3DoMY3hIBJ6GkJwQsDeMO1FCDcdZoOqJpr+nec2fg+z95XqIg37FiRVu
         jaekI0rb+hkaNtqqc+Dhl4bRIEp60gJwIBuJYKB9uNjA3AlE24LnIfZcKuFUY8l5mYJt
         KuL/kDLmc8xWRFM0X80m+NH670Sf+CXTbAc2PzH94W52NpN1EoPoraekBIrWeM7u+akz
         3Al3jFm8xI4wH/Si8Tnt714+2CYPaI994wDslbm1sybN7+4PQCjBbxaZ8kSYA3Y8qj+M
         ZQhtUGOfcvg9cBAtugc0OOF7EIIi/9VS19VoYVPfjp5kpwSYhW830Uih+oxrd5N7+6yX
         oh/A==
X-Forwarded-Encrypted: i=1; AHgh+RrZeAtffAbH9Z0MZnTUcbclBiGybRmB9OkDa1P5lk7rP9ktZ+NpVKVf46TMl+bsjiEPgL4g2iy+TGxNSmPFVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx79dnCN9l700V6e/G/gRsrz9zvCXld5NobBbDwHhvjnQPhY/XS
	fZ2qjZExlhQQ2nng+2EMDzUVIzzy1ylWqy7dVcKwXWGGvj8/Uc5m45c/GMeFcJYRTj0=
X-Gm-Gg: AfdE7cmVncOQBIlZnDnxqitRLFyz+B95BSqRwqyxkyHqgCM+d1GyDT1mHoO61XdCJ1J
	4EYyRvVHKeWS/nTkWdWUhs0jvEpdwz9mhTP7W+mFb3G2TwADLdYIFCYbFEcsTQ3ErZxyz7lOIQa
	SRgjkl5gNxRQSLA7EdAs7ZuJy/IjMSrrhnvt0QqLRnSA/yqn9l9sseZtc6zqJGUQqTgU5sxitoM
	1ypgstnZJUuT7soA3IcoLS1vOf1D3Ny9/A1dY3i6QDl+zSzeKm/2Yk0v8U72Age30cRCtcFaOPk
	ZRYPMRziD4rt3kBqZ+gB/BDFCUt5Q8XiXqOnZk/1myZaPMIu19zgptKZevdioWu4k/86viLYYtu
	F5ZeyBqT27qC8iB9+lHn2IkEhLz4adw84qRqsE3uminsgZf9aTQ7v4DbisF9Bau3+VzjB7Gm6By
	NFXX2TP2+SiRP1zxT71kiF5s0r8AFPXMDIbxrw8MVIJ1BkT6S+gQ==
X-Received: by 2002:a05:6a20:6a0f:b0:3bf:a8d7:4f4a with SMTP id adf61e73a8af0-3c34d71984fmr5968562637.40.1784061036618;
        Tue, 14 Jul 2026 13:30:36 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-13b924258a2sm76521483c88.1.2026.07.14.13.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:30:36 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	ytan089@ucr.edu,
	pgovind2@uci.edu
Subject: [PATCH 0/1] rust: cpufreq: Fix temporary write in Registration::bios_limit_callback
Date: Tue, 14 Jul 2026 20:30:34 +0000
Message-Id: <cover.1783456063.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear Linux Kernel Maintainers,

We are developing a tool called FerroLens to detect potential unsound 
behavior in Rust code in the Linux kernel.
The tool internally uses an LLM to detect bugs. 
We then perform manual analysis to verify these reports. 
FerroLens reported the following issues in rust/kernel/cpufreq.rs.

In `Registration::bios_limit_callback`, the expression 
`&mut (unsafe { *limit })` creates a reference to a temporary copy 
of the value pointed to by `limit` on the stack.
Therefore, writes made by `T::bios_limit` go to this temporary 
instead of the memory location pointed to by `limit`.

Additionally, `limit` may be uninitialized, such as when
`Registration::bios_limit_callback` is invoked by `show_bios_limit`
in drivers/cpufreq/cpufreq.c. Therefore creating a reference from 
`limit` is unsound.

Here is a PoC that demonstrates that writes made by `T::bios_limit` 
are not persistent:

  // SPDX-License-Identifier: GPL-2.0

  //! Rust cpufreq proof-of-concept driver for the `bios_limit` callback bug.

  use core::sync::atomic::{AtomicU32, Ordering};

  use kernel::{
      bindings,
      clk::Hertz,
      cpufreq,
      error::code::*,
      macros::vtable,
      prelude::*,
      sync::Arc,
  };

  const LOW_FREQ: Hertz = Hertz::from_mhz(1000);
  const HIGH_FREQ: Hertz = Hertz::from_mhz(2000);
  const BIOS_LIMIT_KHZ: u32 = 424_242;

  module! {
      type: CpuFreqPocModule,
      name: "cpufreq_poc",
      authors: ["Priya Govindasamy"],
      description: "PoC cpufreq driver for the Rust bios_limit callback bug",
      license: "GPL",
  }

  struct CpuFreqPocModule {
      _driver: cpufreq::Registration<CpuFreqPocDriver>,
  }

  struct CpuFreqPocPolicyData {
      table: KVec<bindings::cpufreq_frequency_table>,
      current_freq_khz: AtomicU32,
  }

  #[derive(Default)]
  struct CpuFreqPocDriver;

  #[vtable]
  impl cpufreq::Driver for CpuFreqPocDriver {
      const NAME: &'static CStr = c"cpufreq-poc";
      const FLAGS: u16 = 0;
      const BOOST_ENABLED: bool = false;

      type PData = Arc<CpuFreqPocPolicyData>;

      fn init(policy: &mut cpufreq::Policy) -> Result<Self::PData> {
          
          let mut table = KVec::new();
          table.push(
              bindings::cpufreq_frequency_table {
                  flags: 0,
                  driver_data: 0,
                  frequency: LOW_FREQ.as_khz() as u32,
              },
              GFP_KERNEL,
          )?;
          table.push(
              bindings::cpufreq_frequency_table {
                  flags: 0,
                  driver_data: 1,
                  frequency: HIGH_FREQ.as_khz() as u32,
              },
              GFP_KERNEL,
          )?;
          table.push(
              bindings::cpufreq_frequency_table {
                  flags: 0,
                  driver_data: 0,
                  frequency: bindings::CPUFREQ_TABLE_END as u32,
              },
              GFP_KERNEL,
          )?;
          
          let cpu = policy.cpu();

          policy.cpus().set(cpu);
          policy
              .set_min(LOW_FREQ)
              .set_max(HIGH_FREQ)
              .set_cpuinfo_min_freq(LOW_FREQ)
              .set_cpuinfo_max_freq(HIGH_FREQ)
              .set_suspend_freq(LOW_FREQ)
              .set_transition_latency_ns(cpufreq::DEFAULT_TRANSITION_LATENCY_NS);

          unsafe { policy.set_freq_table(cpufreq::Table::from_raw(table.as_ptr())) };

          pr_info!(
              "cpufreq_poc: init cpu{} expected bios_limit={} kHz\n",
              cpu.as_u32(),
              BIOS_LIMIT_KHZ
          );

          Ok(Arc::new(
              CpuFreqPocPolicyData {
                  table,
                  current_freq_khz: AtomicU32::new(HIGH_FREQ.as_khz() as u32),
              },
              GFP_KERNEL,
          )?)
      }

      fn verify(data: &mut cpufreq::PolicyData) -> Result {
          data.generic_verify()
      }

      fn target_index(policy: &mut cpufreq::Policy, index: cpufreq::TableIndex) -> Result {
          let Some(data) = policy.data::<Self::PData>() else {
              return Err(ENOENT);
          };

          let table = unsafe { cpufreq::Table::from_raw(data.table.as_ptr()) };
          let freq = table.freq(index)?;
          let freq_khz = freq.as_khz() as u32;

          data.current_freq_khz.store(freq_khz, Ordering::Relaxed);
          Ok(())
      }

      fn get(policy: &mut cpufreq::Policy) -> Result<u32> {
          let Some(data) = policy.data::<Self::PData>() else {
              return Err(ENOENT);
          };

          let freq = data.current_freq_khz.load(Ordering::Relaxed);

          Ok(freq)
      }

      fn bios_limit(policy: &mut cpufreq::Policy, limit: &mut u32) -> Result {
          *limit = BIOS_LIMIT_KHZ;

          pr_info!(
              "cpufreq_poc: bios_limit cpu{} wrote {} kHz\n",
              policy.cpu().as_u32(),
              BIOS_LIMIT_KHZ
          );

          Ok(())
      }

      fn exit(_policy: &mut cpufreq::Policy, _data: Option<Self::PData>) -> Result {
          Ok(())
      }
  }

  impl kernel::Module for CpuFreqPocModule {
      fn init(_module: &'static ThisModule) -> Result<Self> {
          pr_info!(
              "cpufreq_poc: loading, expected sysfs bios_limit value is {} kHz\n",
              BIOS_LIMIT_KHZ
          );

          let driver = match cpufreq::Registration::<CpuFreqPocDriver>::new() {
              Ok(driver) => driver,
              Err(err) => {
                  pr_err!(
                      "cpufreq_poc: cpufreq driver registration failed: errno={}\n",
                      err.to_errno()
                  );
                  return Err(err);
              }
          };

          Ok(Self { _driver: driver })
      }
  }

  impl Drop for CpuFreqPocModule {
      fn drop(&mut self) {
          pr_info!("cpufreq_poc: unloaded\n");
      }
  }

Output:

cat /sys/devices/system/cpu/cpu0/cpufreq/bios_limit
0

[  327.756814] cpufreq_poc: loading out-of-tree module taints kernel.
[  327.756852] cpufreq_poc: module verification failed: signature and/or required key missing - tainting kernel
[  327.761432] cpufreq_poc: cpufreq_poc: loading, expected sysfs bios_limit value is 424242 kHz
[  327.763857] cpufreq_poc: cpufreq_poc: init cpu0 expected bios_limit=424242 kHz
[  327.770173] cpufreq_poc: cpufreq_poc: init cpu1 expected bios_limit=424242 kHz
[  327.777130] cpufreq_poc: cpufreq_poc: init cpu2 expected bios_limit=424242 kHz
[  327.778584] tsc: Marking TSC unstable due to cpufreq changes on SMP
[  327.781279] cpufreq_poc: cpufreq_poc: init cpu3 expected bios_limit=424242 kHz
[  327.782682] cpufreq_poc: cpufreq_poc: init cpu4 expected bios_limit=424242 kHz
[  327.785466] cpufreq_poc: cpufreq_poc: init cpu5 expected bios_limit=424242 kHz
[  327.787647] cpufreq_poc: cpufreq_poc: init cpu6 expected bios_limit=424242 kHz
[  327.789458] cpufreq_poc: cpufreq_poc: init cpu7 expected bios_limit=424242 kHz
[  327.792583] cpufreq_poc: cpufreq_poc: init cpu8 expected bios_limit=424242 kHz
[  327.794484] cpufreq_poc: cpufreq_poc: init cpu9 expected bios_limit=424242 kHz
[  327.797198] cpufreq_poc: cpufreq_poc: init cpu10 expected bios_limit=424242 kHz
[  327.799800] cpufreq_poc: cpufreq_poc: init cpu11 expected bios_limit=424242 kHz
[  327.801306] cpufreq_poc: cpufreq_poc: init cpu12 expected bios_limit=424242 kHz
[  327.804141] cpufreq_poc: cpufreq_poc: init cpu13 expected bios_limit=424242 kHz
[  327.806432] cpufreq_poc: cpufreq_poc: init cpu14 expected bios_limit=424242 kHz
[  327.809162] cpufreq_poc: cpufreq_poc: init cpu15 expected bios_limit=424242 kHz
[  335.494129] cpufreq_poc: cpufreq_poc: bios_limit cpu0 wrote 424242 kHz

Priya Bala Govindasamy (1):
  Fix temporary write in Registration::bios_limit_callback

 rust/kernel/cpufreq.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

