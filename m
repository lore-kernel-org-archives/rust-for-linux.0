Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422502;
	b=jq0FIVN01Ir5K0+9lHAyByDZyhnAcvl+NbUQ3dQkR52N83DT7iQbVQy7GFAzgzZ50kcf
	 /SzhVkmjq5G9FJkmFcPTi+jqNtzWtS2j1H6EgtdsvW27p6gbcTN6COCnKox9cbSV2X9j+
	 cnxNczNnLrgq/MRuI9hQ25qjg66sMDuuyEgJ5qcprvwklcsUdq3TMJrkVJ5pvxKa/quMT
	 QAMvMVaRDPCwMhFGjp26TMdBrjs4rZC5x1tZlEu05XPpLW+tVSiSO1kcWmFIOBUIZl1wH
	 n/17KQ0HuRxILhNlaVMuFj4A9RTFaFYFX5IO5DVvQivLK9dgRo8cjYveaNIRMtGUAeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NbwxaCoFVM88SQya2OKeSfNIuBou+PH+5kursy37q3g=;
	b=gN6XlWOrMPharUX81n4Ec0QpNFvfXWx/JDnwjIqaisjKHmr2wvl86arso0BEhfhGxv8t
	 zcXJGmAflpl+Vjyl2yxT7H4L52NUegmzEDXqCaqJrXYjPJ+sboA/JfcZIpWfLecgGyXu8
	 nOwKugdcI+b33VkuO06Pg0llFuuqptk4K1sKlOawm83CyWVbC/6H8PCqjGr0+GFxJC2ZU
	 jBsOJU6iZcJszBbAc2U+kqvTjbjz0JM7IWavfuObQDfyYW2Ui6BzEIotLZFwtRYlg4k72
	 7HaApOqKeKWl6FIlvZOJUMZCmAuxUN7XuJHA6vXfUuxf6vDnbRXmOv94yiDmeIXZcFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uci.edu;
	spf=pass smtp.mailfrom=uci.edu;
	dkim=pass header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=FfhOyhiW;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73AE606A881
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 18:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A73AE606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=FfhOyhiW
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-18818daa3e7so73053c88.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 10:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1794422501; x=1795027301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NbwxaCoFVM88SQya2OKeSfNIuBou+PH+5kursy37q3g=;
        b=FfhOyhiWYewAEuIiDGz6LZHfBz1iMYw1cCpU3+ZjE/m1eewKCMUV89HYRVkhq4FdnU
         yHH8PxyGbYmSlJCi0Gd678D0rFt997JIWKag/tp3/MvVP49iB/zyvgGZHquFycjYVMAZ
         ulo+t5xjJmpdzwz+8dHhr1joy1zWbsyJdD2S9YGpAN3FEz5hqDRnQLbplAUuX90dUuBi
         y5ORvI+t1AcNg9u605k9DNACJ99EJBZ8OhmZPC2s70AdwJfNWemuFlbFcoJQGS8Ayazd
         UQhI3ZtpMmcil0ztSeuaiGjJvIQj7wWIUhlK5LgfEF/f/CYpxbgdMPpNYi0i+VfW+eRU
         w8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422501; x=1795027301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbwxaCoFVM88SQya2OKeSfNIuBou+PH+5kursy37q3g=;
        b=Z/qA1I2dKqqcKWbOe3iDeJs2mGG4B+Nc++QAoadDVnNk3rAiLKINxnArel3TF7f0Pf
         OhgWWVg9Oq/SEU7CsyRIb/hZSfk+R3Tsn3iVOxTEAAhCVfJEEfDRA6/bw7xHqndcAFOy
         rszer3ndqegYyATgeA3Csv5TI33jZ2G2LVhkltAOx2CPZGwIc0cnjzydoAllX7/6+DxI
         Z4UHOiCnfa/faPW8tDnbuX172p3zUU/M1Mwjv48e0jAyFYKyyHuAWvOFnxTLczd+4og5
         glc06m6uj4HWHzgTCH00I6LgZF4uVac5y5t9PfM0gmsxhQWl0SFfLZgtlxzk1S72KHb6
         YA1A==
X-Forwarded-Encrypted: i=1; AL+hErHojnHFxHPjLD5/J91QCiRPzyggJ82sigbijzpA8PaEEBqn1pVPJkp8uuT4s/zsc7dDDhrm/Oh4XCjaV6ifAQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8PFKroEr4Eb6x8N1Ysv+0n7N+B6QHNGFRcTjLAr4T5AE/SUvW/
	hiNVaMGE51TolybjR4CIpnAkrSBk7Z9I+9vANr33OWPdeLSpO3I5X/pAaBV9EHSo5/4=
X-Gm-Gg: AYBFou0BJblpDgww/DHmo9DPY6p89GNLPylFL9M+qOYYvvpvrSdS6r4U4T1wgk91951
	tE6P5w+NxZONUlyCi92e0iP3/xenG+WhBF/4M5zeGbwltSGbe+SVCHrRULadOV1eAJUqW1hQkDF
	thceYJ3I80QWWGyspXbuU5fyEcHRQz6t/uBe1lolGeDRq179AHqCvEOLO5nRYc3pkeC8U925YUQ
	VtIybnoPu+Wu1SKCrS16Pf3abmLAv/QX+htmqOXJpMTx1KCaWFiTlF8iqTetW6bXd/6wi65Gibf
	yoPCRtoSOXNCU5HAIODUKQrzfU2kCUkEiL52t24wZbvSj9SnZJESwpsDFMP4qPJjRwqJlipbhE6
	lVQ3VKnTxG06Hmj86u7KLAwnsCOtP1CCdexi3Vzh2ZnnHAAtZGSpuZeEb8p/rZL81gz6qsq2pxn
	vM9AAgQlNxOLFfzdj00iQaj4k+CI2+WX5yBkRu0H5i9BojYkvFBvAE0iqg0U6hMj9+l+SoqupMj
	9nfWfo2UNoZ+sKUfN9CUwCTmYSye+y5zOYpyIIoB4TccOvN+HKGBxTUpwk8WB8LyRnr6xM1HWLu
	LxxQSN5fi0hKvlUD4pB8LvW6GngnxufqCmwZQBJYnvbduSq1ijZ8jtX9Kldhj6rR8z5W
X-Received: by 2002:a05:701b:451b:10b0:1b2:67f9:43cb with SMTP id a92af1059eb24-1b4f5f5c6f8mr197321c88.17.1794422500528;
        Wed, 11 Nov 2026 10:41:40 -0800 (PST)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm36593441c88.10.2026.11.11.10.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:41:39 -0800 (PST)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: dakr@kernel.org,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	lyude@redhat.com
Cc: driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 0/1] rust: scatterlist: pin `Owned::sgt` to prevent invalidating `DmaMappedSgt::sgt`
Date: Wed, 11 Nov 2026 18:41:37 +0000
Message-Id: <cover.1793652314.git.pgovind2@uci.edu>
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
FerroLens reported the following bug in rust/kernel/scatterlist.rs:

`Owned<P>` contains an indirect self-reference. During pinned
initialization, `DmaMappedSgt::sgt` is set to the address of `Owned::sgt`.
`DmaMappedSgt` is then owned through `Owned::dma`.

At the moment, only `Owned::dma` is marked as structurally pinned.
The `#[pin_data]` attribute therefore only considers `Devres<DmaMappedSgt>`
in its `Unpin` implementation.
Since `Devres<DmaMappedSgt>` implements `Unpin`, `Owned<P>`
is `Unpin` and can be moved.

Moving an `Owned<P>` instance could also move the `sgt` field.
This would cause `DmaMappedSgt::sgt` to now point at an invalid location.
Using this pointer would then lead to undefined behavior.

Below is a PoC kernel module that demonstrates the bug. It shows
safe code calling `Pin::into_inner()` on a
`Pin<KBox<SGTable<Owned<P>>>>` and then `KBox::into_inner()`, which moves
the value. `DmaMappedSgt::sgt` now points to a stale location.
When `DmaMappedSgt` is dropped, `dma_unmap_sgtable()` dereferences
the stale pointer, resulting in a use-after-free.

// SPDX-License-Identifier: GPL-2.0

use kernel::{
    bindings, device, dma, error, faux, page,
    prelude::*,
    scatterlist::{Owned, SGTable},
};

module! {
    type: ScatterListPoC,
    name: "scatterlist_poc",
    authors: ["Priya Govindasamy"],
    description: "ScatterList PoC kernel module",
    license: "GPL",
}

struct ScatterListPoC {
    _dev: faux::Registration,
}

impl kernel::Module for ScatterListPoC {
    fn init(_module: &'static ThisModule) -> Result<Self> {

        let dev = faux::Registration::new(c"scatterlist-poc", None)?;
        let generic_dev: &device::Device<device::Bound> = dev.as_ref().as_ref();

        let raw_dev = core::ptr::from_ref(generic_dev)
            .cast_mut()
            .cast::<bindings::device>();

        // A faux device does not provide a DMA mask. Point its streaming mask
        // at its coherent mask storage and configure both before creating any 
        // DMA mappings.
        //
        // SAFETY: `raw_dev` points to the registered faux device, whose
        // allocation is stable for the lifetime of `dev`.
        unsafe {
            (*raw_dev).dma_mask = core::ptr::addr_of_mut!((*raw_dev).coherent_dma_mask);
            error::to_result(bindings::dma_set_mask_and_coherent(raw_dev, u64::MAX))?;
        }

        let pages = VVec::<u8>::with_capacity(4 * page::PAGE_SIZE, GFP_KERNEL)?;
        let sgt: Pin<KBox<SGTable<Owned<VVec<u8>>>>> = KBox::pin_init(SGTable::new(
                generic_dev,
                pages,
                dma::DataDirection::Bidirectional,
                GFP_KERNEL,
            ),
            GFP_KERNEL
        )?;

        let boxed = Pin::into_inner(sgt);
        let table = KBox::into_inner(boxed);
        drop(table);

        Ok(Self {
            _dev: dev,
        })
    }
}

impl Drop for ScatterListPoC {
    fn drop(&mut self) {
        pr_info!("scatterlist_poc: module unloaded\n");
    }
}

Output:
[  550.191296] ==================================================================
[  550.191312] BUG: KASAN: slab-use-after-free in rust_helper_dma_unmap_sgtable+0x3d/0xa0
[  550.191357] Read of size 8 at addr ffff8882f4db57a8 by task insmod/5029
[  550.191370]
[  550.191399] CPU: 1 UID: 0 PID: 5029 Comm: insmod Tainted: G           OE    N   7.3.0+ #71 PREEMPT(lazy)
[  550.191416] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE, [N]=TEST
[  550.191420] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.17.0-debian-1.17.0-1ubuntu2 04/01/2014
[  550.191430] Call Trace:
[  550.191439]  <TASK>
[  550.191459]  dump_stack_lvl+0x97/0xe0
[  550.191485]  print_report+0x175/0x6f0
[  550.191498]  ? __virt_addr_valid+0x18e/0x3b0
[  550.191515]  ? __virt_addr_valid+0x345/0x3b0
[  550.191525]  ? rust_helper_dma_unmap_sgtable+0x3d/0xa0
[  550.191533]  ? kasan_complete_mode_report_info+0x75/0x230
[  550.191546]  ? rust_helper_dma_unmap_sgtable+0x3d/0xa0
[  550.191553]  kasan_report+0xfa/0x130
[  550.191564]  ? rust_helper_dma_unmap_sgtable+0x3d/0xa0
[  550.191580]  __asan_report_load8_noabort+0x18/0x20
[  550.191588]  rust_helper_dma_unmap_sgtable+0x3d/0xa0
[  550.191599]  _RNvXCseDCAewP9wfK_15scatterlist_pocNtB2_14ScatterListPoCNtNtCsbuTvttuFvbr_6kernel6module6Module4init+0xac0/0xdf0 [scatterlist_poc]
[  550.191642]  init_module+0x15/0xff0 [scatterlist_poc]
[  550.191654]  do_one_initcall+0x119/0x4f0
[  550.191685]  ? do_init_module+0x63/0x740
[  550.191694]  ? __pfx_init_module+0x10/0x10 [scatterlist_poc]
[  550.191705]  ? __se_sys_finit_module+0x39d/0x5f0
[  550.191714]  ? __x64_sys_finit_module+0x7f/0x90
[  550.191723]  ? x64_sys_call+0xa66/0x2600
[  550.191732]  ? do_syscall_64+0x11c/0x3f0
[  550.191739]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  550.191747]  ? kvm_sched_clock_read+0x15/0x40
[  550.191763]  ? __lock_acquire+0xeeb/0x1040
[  550.191783]  ? kvm_sched_clock_read+0x15/0x40
[  550.191796]  ? debug_smp_processor_id+0x1b/0x30
[  550.191806]  ? _raw_spin_unlock_irqrestore+0x38/0x90
[  550.191815]  ? __this_cpu_preempt_check+0x17/0x20
[  550.191823]  ? lockdep_hardirqs_on+0xdc/0x160
[  550.191832]  ? debug_smp_processor_id+0x1b/0x30
[  550.191842]  ? kasan_save_alloc_info+0x3a/0x50
[  550.191852]  ? __kasan_kmalloc+0x94/0xb0
[  550.191863]  ? __kmalloc_cache_noprof+0x356/0x6c0
[  550.191876]  ? do_init_module+0x63/0x740
[  550.191885]  ? __kmalloc_cache_noprof+0x160/0x6c0
[  550.191899]  ? kasan_unpoison+0x4c/0x70
[  550.191914]  ? kasan_poison+0x44/0x60
[  550.191939]  do_init_module+0x23f/0x740
[  550.191975]  load_module+0x32d1/0x3f20
[  550.192009]  __se_sys_finit_module+0x39d/0x5f0
[  550.192045]  __x64_sys_finit_module+0x7f/0x90
[  550.192057]  x64_sys_call+0xa66/0x2600
[  550.192066]  do_syscall_64+0x11c/0x3f0
[  550.192072]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  550.192080]  ? __this_cpu_preempt_check+0x17/0x20
[  550.192088]  ? lockdep_hardirqs_on+0xdc/0x160
[  550.192095]  ? do_syscall_64+0x217/0x3f0
[  550.192108]  ? debug_smp_processor_id+0x1b/0x30
[  550.192118]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  550.192125]  ? __this_cpu_preempt_check+0x17/0x20
[  550.192132]  ? lockdep_hardirqs_on+0xdc/0x160
[  550.192140]  ? do_syscall_64+0x217/0x3f0
[  550.192148]  ? __this_cpu_preempt_check+0x17/0x20
[  550.192160]  ? debug_smp_processor_id+0x1b/0x30
[  550.192171]  ? debug_smp_processor_id+0x1b/0x30
[  550.192177]  ? rcu_is_watching+0x1a/0xc0
[  550.192190]  ? trace_irq_disable+0x3c/0x130
[  550.192205]  ? do_syscall_64+0x6d/0x3f0
[  550.192211]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  550.192222]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  550.192238] RIP: 0033:0x7fdbc511e9dd
[  550.192259] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 23 b4 0f 00 f7 d8 64 89 01 48
[  550.192270] RSP: 002b:00007ffd59690678 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[  550.192292] RAX: ffffffffffffffda RBX: 000055627cd6e7d0 RCX: 00007fdbc511e9dd
[  550.192298] RDX: 0000000000000000 RSI: 000055627be2ccd2 RDI: 0000000000000003
[  550.192303] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[  550.192308] R10: 0000000000000003 R11: 0000000000000246 R12: 000055627be2ccd2
[  550.192312] R13: 000055627cd6e790 R14: 000055627be2b888 R15: 000055627cd6e8e0
[  550.192332]  </TASK>
[  550.192336]
[  550.192338] Allocated by task 5029:
[  550.192480]
[  550.192482] Freed by task 5029:
[  550.192597]
[  550.192600] The buggy address belongs to the object at ffff8882f4db5780
[  550.192600]  which belongs to the cache kmalloc-64 of size 64
[  550.192613] The buggy address is located 40 bytes inside of
[  550.192613]  freed 64-byte region [ffff8882f4db5780, ffff8882f4db57c0)
[  550.192620]
[  550.192623] The buggy address belongs to the physical page:
[  550.192713]
[  550.192716] Memory state around the buggy address:
[  550.192725]  ffff8882f4db5680: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
[  550.192730]  ffff8882f4db5700: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
[  550.192734] >ffff8882f4db5780: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
[  550.192738]                                   ^
[  550.192743]  ffff8882f4db5800: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
[  550.192747]  ffff8882f4db5880: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
[  550.192751] ==================================================================

Priya Bala Govindasamy (1):
  rust: scatterlist: pin `Owned::sgt` to prevent invalidating
    `DmaMappedSgt::sgt`

 rust/kernel/scatterlist.rs | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.34.1

