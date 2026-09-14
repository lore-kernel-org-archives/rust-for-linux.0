Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90764351C13
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 21:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789422425; cv=none; b=Jwr6pFr0pepP53/s8bwSAZYkuboPDRPE4GfZOQWtrMjmtH8QPcwk64ybOWTkm+M0ZOqcv9ixgW4968hKuIUhgHVAaNz+VlTXWQ/Ccy/+4vfyyXzy6gIRCdC+CqgsSrV085FnTzqiCOjpak01Tjnaix8phkXQ+9cwsCJpazUwCpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789422425; c=relaxed/simple;
	bh=CY/f2hN4UQOlxJtg6UWeDJVFbX629VP6sjUUlxo+jeE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gcejkeKXVO81glmYwEMLwEp7E4MAaxE5Rr8z6QM60zubbNNI7/lJwy4MgPWOgEfZkT46vsr2haUAoO2VSaL9YPceZMtGUa6dvjiu8sNo1qugS6o2LIGhQ6S0zALipneW8zfrJZcObXFiatIGWFNpC4rJqnZMTcjHo7KhHz5meII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=ItnDDV7p; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="ItnDDV7p"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso1834410a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 14:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1789422423; x=1790027223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7brlrxyohWylh2jFDmkwzifLgny6Iwix4M2exaTm/9M=;
        b=ItnDDV7p3Ge5IrAy/Nic0B8z4Gtt9Ypnt8w9roU5byIN3Ifj/g7uCoQuJUdCh7WdF+
         TBnK5PKlr72Ya7f5RhPnNtiDQTqerGcRUB8CRnDsJg1OcuKzRixC9L/u1r9cfnfAxvDa
         GQmENdHha1P3qGLVBWYglPGELnkhZZMGscKmaWDbW3NSZtwm0aTbZaduvnmKsJWFXPFl
         syoSMAV4E3WxIrXCGSNWG4oEukJyT6JPOiPDziST+8+NvLV4BrR80vDqdAfCOzq6ausI
         pvW1zR8REtq6cLc6zkKrbear0UBei+GUt1vBYNMcH+FB4n4VQ7KrDG08z1iLodCpIUdx
         0Odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789422423; x=1790027223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7brlrxyohWylh2jFDmkwzifLgny6Iwix4M2exaTm/9M=;
        b=VsRBlZiotXJwQXAzjfznXrKBanOSUnmeJU422qlICSS4KJqnKEuQqIkPUEAv2b+E/H
         ZMAyfVGebQgvylRmGOWo04P1ERfYLcJGHYq2j/4TcYd61+hZNL6Z+ksOP1J+VqeBN52c
         guq7REtaKaU/t0ax9N5J0G1zIBheL+iLZ1lZSsJN0USi/hmoBJTKLzq/wlF/z2Ga1WYI
         ssHmAqexx5UP+DEYgleVmICB47eaLtzhZ8tE9NFOg/Ncabk1RUInYu2VC7K48P6t7wLE
         Hyj1sEiYo2l0XtCXVwHsMvMISSMQPo1zRo4ugEn0R0XkCa2m7LAKZXcOwmPcbkcDTzwg
         C//w==
X-Forwarded-Encrypted: i=1; AKwUvBzxVSFqZf7vlPat6Q3nsIek/Hpya9IXB7Dwh8J+vRuhrCMSpAjZdcYjYKlrzVx9Kcy5Okc4rZ+Cb8X33atySw==@vger.kernel.org
X-Gm-Message-State: AFuF++lxDsal9ukgz+Sm6/CnTlsGLYFkW4+4swkDA0G/XjgzKoXMCDBd
	1xaaA9KuoG9qjTxd5Z1AeBxu0n4fSm2IBgHkyht2KhkfOrbqcAZMlxmW9Z+q9z32eIs=
X-Gm-Gg: AYBFou1rWDJPI5z/Pf2Tjg+tI4g9frU51FpR3MqGxJS8B3Yxu23+xP5tVTM3UVrxeMa
	IMHIi8aw/KwhE7oOXI8Qf4gR2O+v4m4I5D06h/2ActNAippJ3D1L7Tn32hgAWUnJSaw6J7vcx3b
	U4xExYT1sTHthnEs5suEXME4Ff8FTc2ZmlbBF1Uadei/WXIZAfrgVF74yv8iOhFnK4n/FY8aPFo
	yGXPG84J117gYgNYpPtCaRpRxHiAcGgnQiQ6oJJGFtxsZikiihzCuX13Xo0JJh40+FyDjtmU3M4
	FW2b6I1tI3A3bgbp9eMaG1U0BxSANLyxzLN6P4wAeHrbU92vksvI40f4PbIr7D3odSU+WCBJ2SU
	tnam3puXadRnJuRMbJJOkd5iM1eAartSX+8bUdhZF2qlUBm09fnHO/qkXqBxm6rgcwlt6uq3wJ5
	eoclS27yzGOoEyzJlbMsSY0/BZXyMW02U/DWjlrTZJWuETi18yAIgURILkHWzKiEbdGb2uZ/gJs
	VroVZacCdxt4CXyQpOvrXGcpMj0mnfxaK9JkQ==
X-Received: by 2002:a17:90b:3e85:b0:39d:f97c:bb2f with SMTP id 98e67ed59e1d1-39df97cbeefmr4308750a91.3.1789422422733;
        Mon, 14 Sep 2026 14:47:02 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33bdd76abcbsm4868640eec.22.2026.09.14.14.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:47:02 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: a.hindborg@kernel.org,
	boqun@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Cc: ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 0/1] rust: block: Fix unsoundness in `Operations::queue_rq`
Date: Mon, 14 Sep 2026 21:47:00 +0000
Message-Id: <cover.1789420324.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear Linux kernel maintainers,

We are developing a tool called FerroLens to detect potential 
unsound behavior in Rust code in the Linux kernel. The tool 
internally uses an LLM to detect bugs.
We then perform manual analysis to verify these reports. 
FerroLens reported the following bug in rust/kernel/block/mq/operations.rs:

A safe `Operations` implementation of `queue_rq` can retain a clone 
of the provided `ARef<Request>` and return an error. This should not be 
valid under the intended blk-mq ownership semantics, as an error 
means the driver returns ownership of the `Request` to the block layer 
which may requeue or end the request. 
The refcount of the `ARef` is expected to be dropped to 0. 

If the driver retains a clone of the `ARef<Request>` while 
returning an error, it leads to a mismatch in the ownership state of the 
request. The refcount of the `ARef` will remain 2 or greater. 
But the refcount alone does not prevent the underlying C allocation 
of the `Request` from being freed.
A driver with such an incorrect implementation of `queue_rq` 
can lead to use-after-free.

The Rust `Operations::queue_rq` documentation and type signature do 
not currently state or enforce the restriction that it is invalid to 
retain a clone of the `ARef<Request>` while returning an error. 
Operations is also a safe trait. Stating the restriction in 
the documentation may not be enough as soundness depends on the 
implementation.

Here is a PoC demonstrating this issue:

// SPDX-License-Identifier: GPL-2.0
use kernel::{
    block::{
        self,
        mq::{gen_disk::GenDiskBuilder, Operations, Request, TagSet},
    },
    error::code::EIO,
    prelude::*,
    sync::{
        aref::ARef,
        atomic::{Atomic, Relaxed},
        Arc,
        global_lock,
    },
};

module! {
    type: QueueRqPoc,
    name: "queue_rq_poc",
    authors: ["Priya Govindasamy"],
    description: "blk-mq queue_rq callback example",
    license: "GPL",
}

static QUEUE_RQ_CALLS: Atomic<i32> = Atomic::new(0);
struct QueueRqDevice;
global_lock! {
    // SAFETY: Initialized in module initializer before first use.
    unsafe(uninit) static SAVED_RQ: SpinLock<Option<ARef<Request<QueueRqDevice>>>> = None;
}

#[vtable]
impl Operations for QueueRqDevice {
    type QueueData = ();

    fn queue_rq(_queue_data: (), rq: ARef<Request<Self>>, is_last: bool) -> Result {
        let call = QUEUE_RQ_CALLS.fetch_add(1, Relaxed) + 1;

        pr_info!("queue_rq_poc: queue_rq call {call}, is_last={is_last}\n");

        let mut guard = SAVED_RQ.lock();
        *guard = Some(rq.clone());
        Err(EIO)
    }

    fn commit_rqs(_queue_data: ()) {}

    fn complete(rq: ARef<Request<Self>>) {
        // Required by `Operations`; this path is unused because `queue_rq`
        // returns an error instead of calling `Request::complete`.
        Request::end_ok(rq)
            .map_err(|_rq| EIO)
            .expect("queue_rq_poc: complete unexpectedly retained a request reference");
    }
}

struct QueueRqPoc;

impl kernel::Module for QueueRqPoc {
    fn init(_module: &'static ThisModule) -> Result<Self> {
        let tagset: Arc<TagSet<QueueRqDevice>> =
            Arc::pin_init(TagSet::new(1, 16, 1), GFP_KERNEL)?;

        // SAFETY: called exactly once
        unsafe {SAVED_RQ.init()};

        // A nonzero-capacity disk is scanned for partitions synchronously by
        // `device_add_disk`, which submits at least one real request through
        // this disk's blk-mq queue before `build` returns.
        let disk = GenDiskBuilder::new()
            .capacity_sectors(1_u64 << block::PAGE_SECTORS_SHIFT)
            .build(fmt!("queue_rq_poc"), tagset, ())?;

        let calls = QUEUE_RQ_CALLS.load(Relaxed);
        if calls == 0 {
            pr_err!("queue_rq_poc: expected at least one queue_rq call\n");
            return Err(EIO);
        }

        // The partition scan has completed, so the temporary registered disk
        // is no longer needed. `GenDisk` safely unregisters it on drop.
        drop(disk);

        if let Some(rq) = SAVED_RQ.lock().take() {
            pr_info!("using the cloned request later\n");
        }

        pr_info!("queue_rq_poc: init observed {calls} queue_rq call(s)\n");
        Ok(Self)
    }
}


Output:
[526592.634392] queue_rq_poc: queue_rq_poc: queue_rq call 1, is_last=true
[526592.634825] I/O error, dev queue_rq_poc, sector 0 op 0x0:(READ) flags 0x800000 phys_seg 1 prio class 2
[526592.634938] Buffer I/O error on dev queue_rq_poc, logical block 0, async page read
[526592.635868] queue_rq_poc: queue_rq_poc: queue_rq call 2, is_last=true
[526592.635877] I/O error, dev queue_rq_poc, sector 0 op 0x0:(READ) flags 0x800000 phys_seg 1 prio class 2
[526592.635890] Buffer I/O error on dev queue_rq_poc, logical block 0, async page read
[526592.635975] queue_rq_poc: queue_rq_poc: queue_rq call 3, is_last=true
[526592.635981] I/O error, dev queue_rq_poc, sector 0 op 0x0:(READ) flags 0x800000 phys_seg 1 prio class 2
[526592.635992] Buffer I/O error on dev queue_rq_poc, logical block 0, async page read
[526592.636051] ldm_validate_partition_table(): Disk read failed.
[526592.636137] queue_rq_poc: queue_rq_poc: queue_rq call 4, is_last=true
[526592.636143] I/O error, dev queue_rq_poc, sector 0 op 0x0:(READ) flags 0x800000 phys_seg 1 prio class 2
[526592.636154] Buffer I/O error on dev queue_rq_poc, logical block 0, async page read
[526592.636239] queue_rq_poc: queue_rq_poc: queue_rq call 5, is_last=true
[526592.636246] I/O error, dev queue_rq_poc, sector 0 op 0x0:(READ) flags 0x800000 phys_seg 1 prio class 2
[526592.636256] Buffer I/O error on dev queue_rq_poc, logical block 0, async page read
[526592.636326] queue_rq_poc: queue_rq_poc: queue_rq call 6, is_last=true
[526592.636331] I/O error, dev queue_rq_poc, sector 0 op 0x0:(READ) flags 0x800000 phys_seg 1 prio class 2
[526592.636340] Buffer I/O error on dev queue_rq_poc, logical block 0, async page read
[526592.636409] queue_rq_poc: queue_rq_poc: queue_rq call 7, is_last=true
[526592.636415] I/O error, dev queue_rq_poc, sector 0 op 0x0:(READ) flags 0x800000 phys_seg 1 prio class 2
[526592.636424] Buffer I/O error on dev queue_rq_poc, logical block 0, async page read
[526592.636441] Dev queue_rq_poc: unable to read RDB block 0
[526592.636495] queue_rq_poc: queue_rq_poc: queue_rq call 8, is_last=true
[526592.636500] I/O error, dev queue_rq_poc, sector 0 op 0x0:(READ) flags 0x800000 phys_seg 1 prio class 2
[526592.636509] Buffer I/O error on dev queue_rq_poc, logical block 0, async page read
[526592.636590] queue_rq_poc: queue_rq_poc: queue_rq call 9, is_last=true
[526592.636596] I/O error, dev queue_rq_poc, sector 0 op 0x0:(READ) flags 0x800000 phys_seg 1 prio class 2
[526592.636606] Buffer I/O error on dev queue_rq_poc, logical block 0, async page read
[526592.636681] queue_rq_poc: queue_rq_poc: queue_rq call 10, is_last=true
[526592.636687] I/O error, dev queue_rq_poc, sector 0 op 0x0:(READ) flags 0x800000 phys_seg 1 prio class 2
[526592.636697] Buffer I/O error on dev queue_rq_poc, logical block 0, async page read
[526592.636715]  queue_rq_poc: unable to read partition table
[526592.636788] queue_rq_poc: partition table beyond EOD, truncated
[526592.707488] queue_rq_poc: using the cloned request later
[526592.707550] ==================================================================
[526592.707560] BUG: KASAN: use-after-free in rust_helper_refcount_dec_and_test+0x18/0x50
[526592.707638] Write of size 4 at addr ffff888347c6cc50 by task insmod/81905

[526592.707674] CPU: 15 UID: 0 PID: 81905 Comm: insmod Tainted: G           OE       7.3.0-rc1+ #45 PREEMPT(lazy) 
[526592.707683] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
[526592.707685] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1.1 04/01/2014
[526592.707687] Call Trace:
[526592.707694]  <TASK>
[526592.707703]  dump_stack_lvl+0x97/0xe0
[526592.707734]  print_report+0x175/0x6f0
[526592.707753]  ? __virt_addr_valid+0x18d/0x3b0
[526592.707771]  ? __virt_addr_valid+0x344/0x3b0
[526592.707774]  ? rust_helper_refcount_dec_and_test+0x18/0x50
[526592.707778]  ? kasan_addr_to_slab+0x11/0x90
[526592.707782]  ? rust_helper_refcount_dec_and_test+0x18/0x50
[526592.707786]  kasan_report+0xe4/0x120
[526592.707790]  ? rust_helper_refcount_dec_and_test+0x18/0x50
[526592.707795]  ? vprintk+0x59/0xe0
[526592.707819]  kasan_check_range+0x2bc/0x2d0
[526592.707824]  __kasan_check_write+0x18/0x20
[526592.707828]  rust_helper_refcount_dec_and_test+0x18/0x50
[526592.707833]  _RNvXCs5tE4rEXLlPW_12queue_rq_pocNtB2_10QueueRqPocNtNtCsbuTvttuFvbr_6kernel6module6Module4init+0x3b0/0x590 [queue_rq_poc]
[526592.707849]  do_one_initcall+0x119/0x4f0
[526592.707852]  ? do_init_module+0x63/0x740
[526592.707860]  ? __pfx_init_module+0x10/0x10 [queue_rq_poc]
[526592.707865]  ? __se_sys_finit_module+0x39d/0x5f0
[526592.707888]  ? __x64_sys_finit_module+0x7f/0x90
[526592.707891]  ? x64_sys_call+0xa66/0x2600
[526592.707898]  ? do_syscall_64+0x11c/0x3f0
[526592.707923]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[526592.707927]  ? kvm_sched_clock_read+0x15/0x40
[526592.707939]  ? __lock_acquire+0xe84/0xfe0
[526592.707951]  ? kvm_sched_clock_read+0x15/0x40
[526592.707956]  ? debug_smp_processor_id+0x1b/0x30
[526592.707961]  ? _raw_spin_unlock_irqrestore+0x38/0x90
[526592.707984]  ? __this_cpu_preempt_check+0x17/0x20
[526592.707988]  ? lockdep_hardirqs_on+0xdc/0x160
[526592.707991]  ? debug_smp_processor_id+0x1b/0x30
[526592.707995]  ? kasan_save_alloc_info+0x3a/0x50
[526592.707999]  ? __kasan_kmalloc+0x94/0xb0
[526592.708003]  ? __kmalloc_cache_noprof+0x350/0x6a0
[526592.708012]  ? do_init_module+0x63/0x740
[526592.708014]  ? __kmalloc_cache_noprof+0x158/0x6a0
[526592.708017]  ? kasan_unpoison+0x4c/0x70
[526592.708022]  ? kasan_poison+0x44/0x60
[526592.708027]  do_init_module+0x23f/0x740
[526592.708035]  load_module+0x32dc/0x3f20
[526592.708045]  __se_sys_finit_module+0x39d/0x5f0
[526592.708076]  __x64_sys_finit_module+0x7f/0x90
[526592.708080]  x64_sys_call+0xa66/0x2600
[526592.708083]  do_syscall_64+0x11c/0x3f0
[526592.708091]  ? __x64_sys_newfstatat+0xc8/0x100
[526592.708104]  ? debug_smp_processor_id+0x1b/0x30
[526592.708108]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[526592.708111]  ? __this_cpu_preempt_check+0x17/0x20
[526592.708114]  ? lockdep_hardirqs_on+0xdc/0x160
[526592.708117]  ? do_syscall_64+0x217/0x3f0
[526592.708119]  ? debug_smp_processor_id+0x1b/0x30
[526592.708123]  ? debug_smp_processor_id+0x1b/0x30
[526592.708126]  ? rcu_is_watching+0x1a/0xc0
[526592.708135]  ? trace_irq_disable+0x3c/0x130
[526592.708153]  ? do_syscall_64+0x6d/0x3f0
[526592.708155]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[526592.708159]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[526592.708162] RIP: 0033:0x7ffa9b71e9dd
[526592.708174] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 23 b4 0f 00 f7 d8 64 89 01 48
[526592.708180] RSP: 002b:00007fff05d31c38 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[526592.708191] RAX: ffffffffffffffda RBX: 000055cafaff07d0 RCX: 00007ffa9b71e9dd
[526592.708194] RDX: 0000000000000000 RSI: 000055cade371cd2 RDI: 0000000000000003
[526592.708196] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[526592.708198] R10: 0000000000000003 R11: 0000000000000246 R12: 000055cade371cd2
[526592.708199] R13: 000055cafaff0790 R14: 000055cade370888 R15: 000055cafaff08e0
[526592.708207]  </TASK>

[526592.708210] The buggy address belongs to the physical page:
[526592.708216] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x7f873e235 pfn:0x347c6c
[526592.708227] flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
[526592.708232] raw: 0017ffffc0000000 ffffea000ccd8e08 ffff8883ab21e0c8 0000000000000000
[526592.708235] raw: 00000007f873e235 0000000000000000 00000000ffffffff 0000000000000000
[526592.708236] page dumped because: kasan: bad access detected

[526592.708242] Memory state around the buggy address:
[526592.708247]  ffff888347c6cb00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[526592.708249]  ffff888347c6cb80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[526592.708250] >ffff888347c6cc00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[526592.708252]                                                  ^
[526592.708254]  ffff888347c6cc80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[526592.708255]  ffff888347c6cd00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[526592.708257] ==================================================================
[526592.708283] Disabling lock debugging due to kernel taint
[526592.708285] queue_rq_poc: queue_rq_poc: init observed 10 queue_rq call(s)

Priya Bala Govindasamy (1):
  rust: block: Fix unsoundness in  `Operations::queue_rq`

 rust/kernel/block/mq/operations.rs | 35 +++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 10 deletions(-)

-- 
2.34.1

