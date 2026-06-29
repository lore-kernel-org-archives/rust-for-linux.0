Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47FF18871F
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 23:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782777158; cv=none; b=j7gi/SewNLpCTwIWoY94nigE8yVItzFK8QcutKQaPAe8kmHLRiMjoJ9vwwHFTy9gS4e0pqGR5SLndbE6sj/Vq1fddrIJkT/nH/r7Okp0Ol3z1K2XKVr3fqGGeAMEu8qb1qqJXwpOxRdbB+AbkRFz2jAxJ9jSyGXwVw1l4XOHCXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782777158; c=relaxed/simple;
	bh=/YesFAzjiF3FD2gqZps6AKusQynSaO2qnscK3FRwcGw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BecZISUnTGVWbbxYaYwn1VvUIG/nsOLKNafs2DFCKwjHSksv3Zq4NrPzmJy3lNH34SmvscSDpgKnKAJaE6ugJZfx1EIZpmkZ4csVqOngOdbkTb1yQ4y3ZBcrzZnMtgW8qKKIr4fmEFWJyyMXKnsO5PZNTnmLB2ZjwsSLWp6H2mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=ZiCxp1LN; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="ZiCxp1LN"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30e18c3e0b8so2462127eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 16:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1782777156; x=1783381956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D2oLeNNuJZM70JSO5Eq4+E3Y6+UkhUeB6Re0sh2O2xY=;
        b=ZiCxp1LNydKIoYTXOtsWJhFJvwzNH+RBrqlmNqzAcC53Jlq1GLOdf4GDBMXIq0cMv8
         1UWI8NAe5MwTAK4aDu7MU6rnQblc+X0bilJp1SfEGwn6eiC3Lcmwhm2aKomsZwzvJMjA
         3/aXZKhTkjvl+Piftok/W2Gj7e2DQd0pfnvcGLgqzDwXDEo7P/T/K+azr4n/luSbobE/
         Gzi6h92GqNaBch9wps2YJF4pwbE6H4UVnVAOWj1NdytVUKO+pUODkIautKgarIMF0YKW
         DXhfVstffrKhhSMHHDF404yoTWgrMTjy6Af+xRUWJ3jQBRexlREICQoYXUewty6tJPYq
         zHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782777156; x=1783381956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2oLeNNuJZM70JSO5Eq4+E3Y6+UkhUeB6Re0sh2O2xY=;
        b=G/1m7OGtwnHRJhUhas6UfHO0eTqEbvVoX3KITUu/X7A8kdr8XtRjE/eqh+AUow11J5
         mJSHnx0wzuvKwBCDMluqjuws/VXspSAX5785GqiXKRhFNZpPuQimIj/VU68iETSNkSj9
         4RUg+ybiAOC233I4fS2ER0d+X4usgb0BUhGGMloMIim7oypo38bBFaalWwSgNTRw0G7s
         hc/cwY79W3EMt3y6yp89rZvng9hKPTseiFKkCYdG3TLcd8g2KpgggJjU2GbntxYj45ko
         fNHurvTCZwjJy4uqjFL9YpVNVnM+wuYYxFW+g3NHKImobR3GDPtylB6SNHzG7W2fHcm6
         SwJw==
X-Forwarded-Encrypted: i=1; AHgh+RpmCwTums6sLSC9vCyNBQs411wfXeQKeNxrByRBi5IlXRSRfj9s+Seg5On9oH6+KwPrOUKKq+RxtHlirH7fiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze8z/WjZ9rXEw1sbO5xhLhXGefZhnjAC2bnsTkRKa0mQc7sKM9
	cC/CSotwaJsFY0kguYkKM4ZUUC7DnrffhxKsc5A9qC/bsRtjxpgySpY6ThRHsqAIq/o=
X-Gm-Gg: AfdE7cl+y9I/YQbJq7R7PGTPXKrLz97SR10PCIcwV7L8r1+NsIiZjDXIA+i/oCEy1GW
	nsoYCW4apR/OknaT1NTO/awRWTQj7/TTvi/MG5SCmPn2Xel3+fTwRFTwnaLiQPPjJBGfFetBjpj
	HP/v6heOwVWzAHld/J43H6cAYxqO1wPb15LOx1zGU8fvjo3len8CbZKvtwl0pchQc4JFng7nmCO
	M97x/fpmFQTivndAoRqYrLtLc/em4H+gVeju/nmJ9wOaoWC6CfaClXpr/25ZrpB776P9c6za0eP
	lxD4LXFmRKpvR/tguFQLiDiNBa9egH0/9gQagc63wDlcc+cgRGL9IpzLRcubLdfBk/B3FVq+RmZ
	vcWyVrqCKkYzGDclD9eREXX48I2+aZB9Ts8i4gVWnpPY3AtQkU9IikNmlHza5XB1R4r/bMkoUIC
	WZAUvLl8tOzY/ARN5TUbwagF8iUney/1emrTSgFl0kbe4zZG7klFSOdp8RGDXD
X-Received: by 2002:a05:7300:4304:b0:30c:ab73:3c59 with SMTP id 5a478bee46e88-30ee14a5132mr930139eec.41.1782777155885;
        Mon, 29 Jun 2026 16:52:35 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-30ee326c7a7sm1707486eec.29.2026.06.29.16.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 16:52:35 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: ojeda@kernel.org,
	gary@garyguo.net,
	rust-for-linux@vger.kernel.org
Cc: peterz@infradead.org,
	zhiyunq@cs.ucr.edu,
	ardalan@uci.edu,
	pgovind2@uci.edu,
	dzueck@uci.edu,
	yuantan098@gmail.com
Subject: [PATCH v2 0/1] rust: sync: Make Guard::lock_ref unavailable if Lock is not Sync
Date: Mon, 29 Jun 2026 23:52:33 +0000
Message-Id: <cover.1782763889.git.pgovind2@uci.edu>
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
FerroLens reported the following bug in rust/kernel/sync/lock.rs.

Guard::lock_ref() returns a reference to the Lock stored in the Guard. 
Guard is Sync if T is Sync. However, Lock is Sync only if T is Send. 
This means that a reference to Guard can be sent across threads and 
multiple threads can acquire a reference to the Lock, 
even if Lock is not Sync. 

The following scenario is possible:
If T is sync but not send, 
Thread A: Creates a Lock<T>. Because T is not Send, Lock<T> is not Sync. 
It cannot be shared with other threads. 
Thread A: Locks the mutex and gets a Guard<T>. 
Since T is Sync, code says Guard<T> is Sync. 
Thread A can now safely give a &Guard<T> to Thread B.
Thread B: calls guard.lock_ref(). This returns a &'a Lock<T>.
Thread B now has a reference to the Lock. In this case, 
even after Thread A drops the guard, Thread B still has that &Lock. 
Thread B can now call lock.lock() and get a &mut T.
This is unsound.

Here is a poc kernel module which demonstrates this problem:

use core::sync::atomic::{AtomicBool, Ordering};
use kernel::{
    bindings, c_str,
    error::from_err_ptr,
    prelude::*,
    sync::{
        lock::{mutex::MutexBackend, Backend, Guard, Lock},
        new_mutex, Arc,
    },
    types::NotThreadSafe,
};
use pin_init::stack_pin_init;

module! {
    type: LockRefPoc,
    name: "lock_ref_poc",
    authors: ["Priya Govindasamy"],
    description: "Sample module demonstrating cross-thread Guard::lock_ref access",
    license: "GPL",
}

struct LockRefPoc;

struct SyncButNotSend {
    value: u32,
    _not_send: NotThreadSafe,
}

// SAFETY: Access to `value` is synchronized by the lock in this sample, and the marker field is
// only used to prevent `Send`.
unsafe impl Sync for SyncButNotSend {}

struct HandoffState {
    lock_ref_ready: AtomicBool,
    guard_dropped: AtomicBool,
    relock_done: AtomicBool,
}

struct ThreadBContext {
    guard_addr: usize,
    handoff: Arc<HandoffState>,
    thread_id: u32,
}

fn guard_matches_lock<T, B: Backend>(guard: &Guard<'_, T, B>, lock: &Lock<T, B>) -> bool {
    core::ptr::eq(guard.lock_ref(), lock)
}

unsafe extern "C" fn thread_b_main(data: *mut kernel::ffi::c_void) -> i32 {
    // SAFETY: `data` comes from `Arc::into_raw` in `spawn_thread_b`, and the thread takes back
    // ownership of exactly one reference.
    let ctx = unsafe { Arc::from_raw(data.cast::<ThreadBContext>()) };

    let guard: &Guard<'_, SyncButNotSend, MutexBackend> =
        // SAFETY: Thread A passes the address of a live guard to thread B.
        unsafe { &*(ctx.guard_addr as *const Guard<'_, SyncButNotSend, MutexBackend>) };

    let leaked_lock = guard.lock_ref();
    pr_info!(
        "thread B obtained &Lock<SyncButNotSend, _> through &Guard\n",
    );
    ctx.handoff.lock_ref_ready.store(true, Ordering::Release);

    while !ctx.handoff.guard_dropped.load(Ordering::Acquire) {
        unsafe { bindings::msleep(20) };
    }

    let mut relocked = leaked_lock.lock();
    relocked.value += 1;
    pr_info!(
        "thread B locked after thread A dropped the original guard; value={}\n",
        relocked.value
    );
    ctx.handoff.relock_done.store(true, Ordering::Release);
    0
}

fn spawn_thread_b(guard_addr: usize, handoff: Arc<HandoffState>, thread_id: u32) -> Result {
    let ctx = Arc::new(
        ThreadBContext {
            guard_addr,
            handoff,
            thread_id,
        },
        GFP_KERNEL,
    )?;
    let data = Arc::into_raw(ctx) as *mut kernel::ffi::c_void;

    let task = match from_err_ptr(unsafe {
        bindings::kthread_create_on_node(
            Some(thread_b_main),
            data,
            bindings::NUMA_NO_NODE,
            c_str!("lock_ref_thread_b/%u").as_char_ptr(),
            thread_id,
        )
    }) {
        Ok(task) => task,
        Err(err) => {
            // SAFETY: Thread creation failed, so the raw reference was not handed off.
            unsafe { drop(Arc::from_raw(data.cast::<ThreadBContext>())) };
            return Err(err);
        }
    };

    // SAFETY: `task` is a valid sleeping kthread returned by `kthread_create_on_node`.
    unsafe { bindings::wake_up_process(task) };
    Ok(())
}

unsafe extern "C" fn thread_a_main(_data: *mut kernel::ffi::c_void) -> i32 {
    let handoff = match Arc::new(
        HandoffState {
            lock_ref_ready: AtomicBool::new(false),
            guard_dropped: AtomicBool::new(false),
            relock_done: AtomicBool::new(false),
        },
        GFP_KERNEL,
    ) {
        Ok(h) => h,
        Err(_) => return ENOMEM.to_errno(),
    };

    stack_pin_init!(let lock = new_mutex!(
        SyncButNotSend {
            value: 100,
            _not_send: NotThreadSafe,
        },
        "lock_ref_poc.thread_a_lock"
    ));

    let guard = lock.lock();
    if !guard_matches_lock(&guard, &lock) {
        pr_err!("thread A: guard.lock_ref() did not return the original lock\n");
        return EINVAL.to_errno();
    }

    if let Err(err) = spawn_thread_b(
        (&guard as *const Guard<'_, SyncButNotSend, MutexBackend>) as usize,
        handoff.clone(),
        2,
    ) {
        return err.to_errno();
    }

    while !handoff.lock_ref_ready.load(Ordering::Acquire) {
        unsafe { bindings::msleep(20) };
    }

    drop(guard);
    pr_info!("thread A dropped the original guard after thread B captured &Lock\n");
    handoff.guard_dropped.store(true, Ordering::Release);

    while !handoff.relock_done.load(Ordering::Acquire) {
        unsafe { bindings::msleep(20) };
    }

    0
}

fn spawn_thread_a() -> Result {
    let task = match from_err_ptr(unsafe {
        bindings::kthread_create_on_node(
            Some(thread_a_main),
            core::ptr::null_mut(),
            bindings::NUMA_NO_NODE,
            c_str!("lock_ref_thread_a").as_char_ptr(),
        )
    }) {
        Ok(task) => task,
        Err(err) => return Err(err),
    };

    // SAFETY: `task` is a valid sleeping kthread returned by `kthread_create_on_node`.
    unsafe { bindings::wake_up_process(task) };
    Ok(())
}

impl kernel::Module for LockRefPoc {
    fn init(_module: &'static ThisModule) -> Result<Self> {
        
        spawn_thread_a()?;

        Ok(Self)
    }
}

impl Drop for LockRefPoc {
    fn drop(&mut self) {
        pr_info!("lock_ref_poc unloaded\n");
    }
}


Makefile:

obj-m += lock_ref_poc.o

KDIR := /lib/modules/$(shell uname -r)/build

PWD := $(shell pwd)

all:
	$(MAKE) -C $(KDIR) M=$(PWD) LLVM=1 modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean


Output:
[  360.591802] lock_ref_poc: thread B obtained &Lock<SyncButNotSend, _> through &Guard
[  360.617600] lock_ref_poc: thread A dropped the original guard after thread B captured &Lock
[  360.641550] lock_ref_poc: thread B locked after thread A dropped the original guard; value=101
[  362.580557] lock_ref_poc: lock_ref_poc unloaded


Priya Bala Govindasamy (1):
  Make Guard::lock_ref unavailable if Lock is not Sync

 rust/kernel/sync/lock.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.34.1

