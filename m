Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601538;
	b=cXDxJZvl7XN1fAMRDPmkqjp3XI49rJofgXVttTpWd0y5kVZIrsVG07KiXvuIeWpDcuzn
	 l20R5YO6Mhcz+unW7N4wTcdAqmUAODaFbA01dIKUR1SK/asrc6f8Wmeo2mkCPbam64hL6
	 r56htrtMV9exoxnA0/caQg/3odSMTCNlWMFvXqKOltiAOr2hojzslYYYKcaymr9FpIf/j
	 bf3JUtIL3zL1q7vxiDuD+D7OAdZqI0nymWa7gvi4jvaT7isQJ7BC7NfdTOTvVpqmbphzR
	 mUYedYNYGcdU+SH2e1GO4ioRxtHs3QmvSyYYGVwS6McMES+HZLxRXYFIVn8ShM6YOag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=59ejQt0DZ682CJ3qOErWLZhd2Fb+1az71At2oyBOpNo=;
	b=Sifah8lMSd3UPGGhjut1yd9VPQ2atWIZcpDvtGxAFwTgTSySPMbe87Fn5T9hH1eTirvX
	 aYmjpKjQu/Qj+AZfxOWr4rd630JYM+H1ps8/QTKk0dklPb8IES2woe7FGmVAmLmTIGu0D
	 0XJrAxb91TD6CpiSFqo/2Hhb0X3RWsm0PlWBCRIYVsPZNFi0WGPhhSVwNS+lrTM9Hlo/F
	 8SYYK+zja14CVQWm2EF3pKBY1OHLN8Hy+K5AolM4Rp9uQW4DbChE/sIzo+aN0dYFjiqkb
	 NUw/9aeoJ/zz7O+BcuMmTKGFLCgJ2IlGdDb0DnTGSFZAJAba1kQLzMWJD8pSZ0/hvTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uci.edu;
	spf=pass smtp.mailfrom=uci.edu;
	dkim=pass header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=R2pdk0m9;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8468606A330
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Nov 2026 20:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8468606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=R2pdk0m9
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-372bdb942dbso1585519eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Nov 2026 12:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1794601537; x=1795206337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=59ejQt0DZ682CJ3qOErWLZhd2Fb+1az71At2oyBOpNo=;
        b=R2pdk0m9kctP99lTTCcUlW7Q/p0IaEYnhMhVMKpcSUAmvdgecgofqnlnQshCkMOCwk
         5TrxSkqpE8m9PCuYycabJIzmHiO5hMh+6CeAncYZXL75zyAIUUB1zGJ/GS5Wn3ZH9RyP
         UARSbPODbtoREItc9uH1efrlwGikktSd4DQ67VAhPvW8M2oxOGELMGfDJkbn9vgM1GGw
         5ujosY7urM1T352ijFf59hYPNvLapK5htf5ISPoF4W9ScXIgjpr/bJUZJD5YmCqq+q0D
         sXXM7PGR/Oi9bYUzQsNh0Kjo0/tSsVnqdTrMNdclXEx1L8TUDpp9sKFkXiSdmCneohyC
         EyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601537; x=1795206337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=59ejQt0DZ682CJ3qOErWLZhd2Fb+1az71At2oyBOpNo=;
        b=CL495Aibdy6k2iPK26esJc5d7G1BN71HWw1x9BdDOaBr6aPSM0MsMC0ZgQAA2QPD0J
         9ZHNT4Pl5mqhhOZt4HVcLqGAI4BuvlGdgEyYBYkF1BbVBRE6u2CNtRwKNiDrW6aeG06v
         aqkgBMtzis3hFHqRWgF+oKNaND1zKSfjmYVqUMhIU7wFcrpFX3qFkO1i80YkgvaUP3MY
         cCcOl7Gs6uE+OLQ2rYqGk9Ehn7ydIc0i3IePdHKORWemklagxTlctSWeOMRs7MQakBgP
         StfRuHcdAt9zrZsngjGHAVKdO3W4Ly0EFLVCBf2mhN78WFznTicRmVCeaIJPGh9LHl5p
         AbaQ==
X-Forwarded-Encrypted: i=1; AL+hErHl6DwNR9jrWN2hO7RDSlilRHsM0zwt5ApR2Kl9AyG+AL7sBmcVcgHJ5B8WiWu1wF0OWhUF17/QGMszdj8sIg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qay97s7DC7jN9eO7YXIJouCWNIhVWLsC3IZJDA2SWYcEvCyaK
	jy302zxwVq/EXzR/v29woAHjUR1HdX0Yr5xBGPy/iw0iHhhFv9gRLwoHoVIri7rTkj0=
X-Gm-Gg: AYBFou3Ba1dqKiyCNvgWJb3IZ8nBMbfNI5nwSQ/BSh007FsYqnlpt+HFpW7+N2mxgdo
	duD7kXfCnChWeTxXQ9jg7h830y3toatAw5IcuhlJG81hjeuHsXt6WcjlJeHnpjV0wzOhE03A11g
	BBJfFBTejuNHKfZIhh2n38gSiondKmA3o5Itqvy8eMch3de8J2ixNkfy7WlnmeeUk1yoG45Lj3d
	ZXDPJsed+AxIDoQ3JB0z3VdytamZaqvaiK67Hy8KFsVvhaqdLDMe61wJ9Pjj0BznXiEST6D3yjC
	moCR0kXaDGPiPQJtPiKc9uADF4gvdrKVcIrmewqOeq2vLoGEHQoQ+7uKbxUE6LjsuHkvwECj468
	HgCGOtLK9cYN7/dfd7zkTgOEkKYLbx3Lu6D3ZGFZeechzqEDSK1T8qPhHJadDAe+XZM11gCKgaM
	q4CKSfFGHtgEG3rkBdUWiTIxrF6t5ldAa3S2mlZbBXWFbLMQtqPVeZ1zXgJU+M7VEEezR45RWer
	pJqQobtwJ78MkBXkmumdB59So/IEHO+BKpASsVhB46LKyPtxXmzVPczSVLbRYq456HR91yboIVH
	68hnbDHNf8o4+DszjNuxMpiJ3WsM74/BEaCh2JNMYfXQrJjY8o/VGssj/fcImMmeLG9UKdN74V1
	ErHKLy00E5dzxXCE=
X-Received: by 2002:a05:7301:90b:b0:34d:755b:d60b with SMTP id 5a478bee46e88-37968b8a031mr2946772eec.34.1794601536671;
        Fri, 13 Nov 2026 12:25:36 -0800 (PST)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-37956bad134sm11725372eec.27.2026.11.13.12.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:25:36 -0800 (PST)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: m.wilczynski@samsung.com,
	ojeda@kernel.org,
	ukleinek@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	elle@weathered-steel.dev,
	linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 0/1] rust: pwm: reject over-aligned driver data in `Chip::new()`
Date: Fri, 13 Nov 2026 20:25:33 +0000
Message-Id: <cover.1794600927.git.pgovind2@uci.edu>
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
FerroLens reported the following bug in rust/kernel/pwm.rs:

`Chip::new()` does not check the alignment of the driver data type `T`.
This allows a Rust kernel module to choose an arbitrary alignment for `T`.

`pwmchip_alloc()` reserves `size_of::<T>()` bytes for the driver's
private data. `pwmchip_priv()` aligns this storage to `PWMCHIP_ALIGN`,
which is defined as `ARCH_DMA_MINALIGN`. But, `PwmOps` does not restrict
the alignment of `T`, so a caller may provide a `T` whose required
alignment is greater than `ARCH_DMA_MINALIGN`.

This can result in `drvdata_ptr` pointing to misaligned storage for `T`
in the underlying C allocation.
If `drvdata_ptr` is misaligned for `T`, that breaks the safety
requirements of `pin_init::raw_try_init()` which requires a valid,
aligned pointer as an argument. This is undefined behavior.

Additionally, `Chip::drvdata()` can be called using the `Chip` produced by
`Chip::new()`. It creates a reference to `T` from the misaligned storage
which is also undefined behavior.

Here is a PoC kernel module that demonstrates this issue:

    // SPDX-License-Identifier: GPL-2.0

    use kernel::{prelude::*, pwm, faux};
    use core::ptr;

    module! {
        type: PwmAlignPoc,
        name: "pwm_align_poc",
        authors: ["Priya Govindasamy"],
        description: "PoC that calls pwm::Chip::new with a PwmOps implementation that has unexpected alignment",
        license: "GPL",
        imports_ns: ["PWM"],
    }

    #[repr(align(8192))]
    #[pin_data]
    struct DemoPwmOps {
        #[pin]
        value: u64,
    }

    impl pwm::PwmOps for DemoPwmOps {
        type WfHw = [u8; 16];
    }

    struct PwmAlignPoc{
        _fdev: faux::Registration,
    }

    const DEVICE_NAME: &CStr = c"pwmchip_add_poc";

    impl kernel::Module for PwmAlignPoc {
        fn init(_module: &'static ThisModule) -> Result<Self> {
            pr_info!("pwm-align-poc: init\n");

            let fdev = faux::Registration::new(DEVICE_NAME, None)?;
            let dev = fdev.as_ref().as_ref();

            let chip = pwm::Chip::new(
                dev,
                1,
                try_pin_init!(DemoPwmOps {
                    value: 0x1122_3344_5566_7788,
                }),
            )?;

            pr_info!("pwm-align-poc: pwm::Chip::new returned successfully\n");

            let chip_ref: &pwm::Chip<DemoPwmOps> = &*chip;
            let drvdata = chip_ref.drvdata();

            let drvdata_addr = ptr::from_ref(drvdata) as usize;

            let align = core::mem::align_of::<DemoPwmOps>();
            let size = core::mem::size_of::<DemoPwmOps>();
            let misalignment = (drvdata_addr as usize) & (align - 1);

            pr_info!(
                "pwm-align-poc: T size={} align={} drvdata={:#x} drvdata%align={:#x}\n",
                size,
                align,
                drvdata_addr as usize,
                misalignment,
            );

            if misalignment != 0 {
                pr_info!("pwm-align-poc: BUG: drvdata is not aligned for DemoPwmOps\n");
            } else {
                pr_info!("pwm-align-poc: drvdata happened to be aligned; try reloading or increasing repr(align)\n");
            }

            drop(chip);

            Ok(Self { _fdev: fdev })
        }
    }

    impl Drop for PwmAlignPoc {
        fn drop(&mut self) {
            pr_info!("pwm-align-poc: exit\n");
        }
    }



Output:

[935472.295875] pwm_align_poc: pwm-align-poc: init
[935472.300101] pwm_align_poc: pwm-align-poc: pwm::Chip::new returned successfully
[935472.300125] rust_kernel: panicked at rust/kernel/pwm.rs:561:18:
                misaligned pointer dereference: address must be a multiple of 0x2000 but is 0xffff88811a9bc8a8
[935472.300296] ------------[ cut here ]------------
[935472.300302] kernel BUG at rust/helpers/bug.c:7!
[935472.300357] Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
[935472.321291] CPU: 11 UID: 0 PID: 168877 Comm: insmod Tainted: G           OE    N   7.3.0+ #71 PREEMPT(lazy) 
[935472.326767] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE, [N]=TEST
[935472.330167] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.17.0-debian-1.17.0-1ubuntu2 04/01/2014
[935472.335684] RIP: 0010:rust_helper_BUG+0x8/0x10
[935472.338311] Code: ff 5d c3 cc cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 55 48 89 e5 <0f> 0b 66 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90
[935472.348377] RSP: 0018:ffff888163fe7610 EFLAGS: 00010282
[935472.351153] RAX: 0000000000000092 RBX: ffff888163fe7638 RCX: 79d6f1f055ce0500
[935472.355104] RDX: 0000000000000001 RSI: 0000000000000004 RDI: ffffffff85cb7348
[935472.359054] RBP: ffff888163fe7610 R08: ffffffff85cb734b R09: 1ffffffff0b96e69
[935472.365925] R10: dffffc0000000000 R11: fffffbfff0b96e6a R12: ffff88811a9bc8a8
[935472.369831] R13: ffff88811a9bc8a8 R14: dffffc0000000000 R15: ffff88811a9bc000
[935472.373766] FS:  00007fb90f158c40(0000) GS:ffff88842697a000(0000) knlGS:0000000000000000
[935472.377958] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[935472.380839] CR2: 00007f2817fd91ac CR3: 000000010c31e004 CR4: 0000000000372ef0
[935472.384553] Call Trace:
[935472.385839]  <TASK>
[935472.386965]  _RNvCsGIExRX8pES_7___rustc17rust_begin_unwind+0x8c/0x90
[935472.390092]  ? __pfx__RNvXs6_NtCsbuTvttuFvbr_6kernel3fmtINtB5_7AdapterRRNtNtNtCsjYlAz7NZ3Sw_4core5panic10panic_info9PanicInfoENtNtBS_3fmt7Display3fmtB7_+0x10/0x10
[935472.396837]  _RNvNtCsjYlAz7NZ3Sw_4core9panicking18panic_nounwind_fmt+0x5e/0x5e
[935472.400208]  _RNvNtCsjYlAz7NZ3Sw_4core9panicking36panic_misaligned_pointer_dereference+0x90/0x91
[935472.404082]  ? __pfx__RNvXsC_NtNtCsjYlAz7NZ3Sw_4core3fmt3numyNtB7_8LowerHex3fmt+0x10/0x10
[935472.407670]  ? __pfx__RNvXsC_NtNtCsjYlAz7NZ3Sw_4core3fmt3numyNtB7_8LowerHex3fmt+0x10/0x10
[935472.411102]  _RNvXs_CsiYPS3iQo6vD_13pwm_align_pocNtB4_11PwmAlignPocNtNtCsbuTvttuFvbr_6kernel6module6Module4init+0x599/0x5d0 [pwm_align_poc]
[935472.416147]  ? debug_smp_processor_id+0x1b/0x30
[935472.418137]  init_module+0x15/0xff0 [pwm_align_poc]
[935472.420132]  do_one_initcall+0x119/0x4f0
[935472.421738]  ? __pfx_init_module+0x10/0x10 [pwm_align_poc]
[935472.423926]  ? __schedule+0x171a/0x5910
[935472.425480]  ? __x64_sys_finit_module+0x7f/0x90
[935472.427411]  ? __lock_acquire+0xeeb/0x1040
[935472.429044]  ? debug_smp_processor_id+0x1b/0x30
[935472.430831]  ? irqentry_exit+0x1e1/0x870
[935472.432174]  ? __this_cpu_preempt_check+0x17/0x20
[935472.434047]  ? lockdep_hardirqs_on+0xdc/0x160
[935472.435746]  ? trace_hardirqs_on+0x3d/0x50
[935472.437405]  ? irqentry_exit+0x1e1/0x870
[935472.438833]  ? trace_irq_disable+0x3c/0x130
[935472.440421]  ? sysvec_apic_timer_interrupt+0x68/0xd0
[935472.442163]  ? asm_sysvec_apic_timer_interrupt+0x1f/0x30
[935472.444092]  ? _RNvNvNtCsjYlAz7NZ3Sw_4core4hint21unreachable_unchecked18precondition_check+0x30/0x30 [pwm_align_poc]
[935472.447576]  ? __pfx_init_module+0x10/0x10 [pwm_align_poc]
[935472.449472]  do_init_module+0x23f/0x740
[935472.450781]  load_module+0x32d1/0x3f20
[935472.452116]  __se_sys_finit_module+0x39d/0x5f0
[935472.453645]  __x64_sys_finit_module+0x7f/0x90
[935472.455093]  x64_sys_call+0xa66/0x2600
[935472.456370]  do_syscall_64+0x11c/0x3f0
[935472.457696]  ? do_syscall_64+0x217/0x3f0
[935472.459046]  ? debug_smp_processor_id+0x1b/0x30
[935472.460488]  ? rcu_is_watching+0x1a/0xc0
[935472.461701]  ? trace_irq_disable+0x3c/0x130
[935472.463044]  ? do_syscall_64+0x6d/0x3f0
[935472.464254]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[935472.465663]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[935472.467238] RIP: 0033:0x7fb90e91e9dd
[935472.468444] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 23 b4 0f 00 f7 d8 64 89 01 48
[935472.473776] RSP: 002b:00007ffd3d6cabb8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[935472.476032] RAX: ffffffffffffffda RBX: 0000559f8e9df7d0 RCX: 00007fb90e91e9dd
[935472.478187] RDX: 0000000000000000 RSI: 0000559f772fecd2 RDI: 0000000000000003
[935472.480301] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[935472.482103] R10: 0000000000000003 R11: 0000000000000246 R12: 0000559f772fecd2
[935472.484269] R13: 0000559f8e9df790 R14: 0000559f772fd888 R15: 0000559f8e9df8e0
[935472.486330]  </TASK>
[935472.487082] Modules linked in: pwm_align_poc(OE+) registration_poc(OE) binfmt_misc intel_rapl_msr intel_rapl_common kvm_intel kvm e1000 i2c_piix4 joydev i2c_smbus floppy rapl qemu_fw_cfg sch_fq_codel dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua msr efi_pstore autofs4 raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor xor async_tx raid6_pq raid1 raid0 aesni_intel gf128mul input_leds psmouse mac_hid serio_raw pata_acpi
[935472.498241] ---[ end trace 0000000000000000 ]---
[935472.499836] RIP: 0010:rust_helper_BUG+0x8/0x10
[935472.499845] Code: ff 5d c3 cc cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 55 48 89 e5 <0f> 0b 66 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90
[935472.499849] RSP: 0018:ffff888163fe7610 EFLAGS: 00010282
[935472.499865] RAX: 0000000000000092 RBX: ffff888163fe7638 RCX: 79d6f1f055ce0500
[935472.499868] RDX: 0000000000000001 RSI: 0000000000000004 RDI: ffffffff85cb7348
[935472.499871] RBP: ffff888163fe7610 R08: ffffffff85cb734b R09: 1ffffffff0b96e69
[935472.499874] R10: dffffc0000000000 R11: fffffbfff0b96e6a R12: ffff88811a9bc8a8
[935472.499876] R13: ffff88811a9bc8a8 R14: dffffc0000000000 R15: ffff88811a9bc000
[935472.499879] FS:  00007fb90f158c40(0000) GS:ffff88842697a000(0000) knlGS:0000000000000000
[935472.499882] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[935472.499885] CR2: 00007f2817fd91ac CR3: 000000010c31e004 CR4: 0000000000372ef0

Priya Bala Govindasamy (1):
  rust: pwm: reject over-aligned driver data in `Chip::new()`

 rust/bindgen_parameters         | 1 +
 rust/bindings/bindings_helper.h | 1 +
 rust/kernel/pwm.rs              | 5 +++++
 3 files changed, 7 insertions(+)

-- 
2.34.1

