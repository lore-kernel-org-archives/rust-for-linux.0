Received: from mx6.ucr.edu (mx6.ucr.edu [138.23.62.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF03F3D45E5
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 02:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=138.23.62.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780626235; cv=none; b=HleaWAUzRwAy8Xg0GdHE2/8fP7WMMuh6CSEhsislcivVzjzSupD4GHl/hvnRlVvyS86eOq7P27U+YHdF9R0B7CPILDvLftsYkn1kKzGHHdB8UT4TLkRk6iCtyYcizNLa926pjZ0v0Ag/sXeEk29nzK2B4KQ9Ku0D+ErCy6hNmf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780626235; c=relaxed/simple;
	bh=EkKOMsCa/udStFr77ymLaCp3d2/tcq9uAdUElqm6kSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KbpBjXPgPZFUMfCoQ/pVm4B7uWs3rYsPs8kBxCl9Xc//1Tjx8bARZaH7L03Wa8kn6Dm0/sLGTe9XjBthtetLx1lPfXEePWezh0AR4OrToAClrr12yTKNkdVzv6364Zu27cpmUQoz/BnOVF8v6UpDWOWNJI0/ou+vpOGkumQ9WAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=email.ucr.edu; spf=pass smtp.mailfrom=ucr.edu; dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=e549cncv; dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=el+gLcGE; arc=none smtp.client-ip=138.23.62.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=email.ucr.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucr.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="e549cncv";
	dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="el+gLcGE"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1780626228; x=1812162228;
  h=dkim-signature:x-google-dkim-signature:
   x-forwarded-encrypted:x-gm-message-state:x-gm-gg:sender:
   from:x-google-original-from:to:cc:subject:date:message-id:
   x-mailer:mime-version:content-transfer-encoding:
   x-cse-connectionguid:x-cse-msgguid;
  bh=EkKOMsCa/udStFr77ymLaCp3d2/tcq9uAdUElqm6kSk=;
  b=e549cncvSFueiw19vfXXwbAjBE7kYm2Y3rzQZw1PMWy6oUhYWFbDwNqS
   zlnRh5HypHM01YkAkDx8AAg9mlGKLS06jAKGqES6MK2/v+PlOWll9mld7
   3/vBDNIK470r4ChNsOliLUeFDCRZvbd2GpgPy8I+2TzP95qdnQ1IVRe33
   eUgtNeliL6VeCLFCbs9fliWXEUq5nUcfIvLjGjsGSe2jDhkyoPu2G9raj
   l29jURlmeRU6QyImeHYhXH1kKVoWrZRGXl4q6FP/zhv6YQhEJo7tfV+7u
   6rijK5V5MLs9tJ446MGD/5NczIUMLM4qMuGJ3c4GqdgFGxXacrWpZV0ad
   g==;
X-CSE-ConnectionGUID: milz31yCTDaCnmfDlGpCVQ==
X-CSE-MsgGUID: ZMxmEOgOQ8m9NWHP4Sq92A==
Received: from mail-dy1-f200.google.com ([74.125.82.200])
  by smtpmx6.ucr.edu with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Jun 2026 19:22:40 -0700
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304e4636205so1407949eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jun 2026 19:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1780626160; x=1781230960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XTB3tYSqeZZwGv+tDxtvZ26MxKjcck4RpWVDxAqUswk=;
        b=el+gLcGEhUdwflgsHhEd4fwk1qgIyWlBWDJVdGGO00m1WY0MY+pCjSdOx0UAo7s4M5
         NKOJZRzXDfz1CzC+J+ct3WdSlXGAyd2A+nmXoZ5knvdEgp2zPJqVLm8p4zLGMHQya7iB
         IJmiKZocxRhs/XHaDxgXVxN5zBElZl/npr+vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780626160; x=1781230960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTB3tYSqeZZwGv+tDxtvZ26MxKjcck4RpWVDxAqUswk=;
        b=CzlOb4q+0oPU3olsczJ+10F/n1IFtLonk9S+3LqSmCcQh62dEl89Q3ZF9nf3VUj2T4
         ISq8vMgPbwqIO7Vv/3EhEZ66UZc60BPcq6tBNnCY4YmVDLKSkCmsNItUKwI0WztI1cVN
         VRnzLAsKx8W6fobPhH8FBVfwpui2iysbNTf9DtVh8Lzv6J8cx8026fmn8CBgGBgRo/Ct
         z8M2hPdFDppJVLgv23XbraKy+JOkdfzaRMLc6yiwNqYj125cSQHmLn8V7jS/hgqwaqal
         Hh5rTKc9phaDd3pE+XW/iz84O1f5Rmv0M9+QIry04q6hlb3RR6m5fGzHcR3kiRy9Bo2m
         k+gQ==
X-Forwarded-Encrypted: i=1; AFNElJ86bYy3T4oQqyri9PRYhT0w1qsNqbS49BczdApnidrGwdZGTPXxfSTWCBP9K16LoJVs6W9xngyykLhF1DX0iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhAM7MwoFRLGHoUz1Z1kvonFB7ZpBAnLxrYt3mkeGs5nybY+Yu
	XKpI1rxLmRHRZjBJzvl9RLrLgk0Z91u94nZj8LqpvNpNxmxFkVh9dygMqzIJ8xL2r8YBfEwkRd1
	wIHsL1ef3Nn5qv20aA5FdWX1diNCSKmalEu9ef4OqY1a9i7eGWBYOb/CZ5ti2P5By9T0dzA==
X-Gm-Gg: Acq92OHbpv0FAR320OX/Si2TuPw1Mlkf6K3Lsyctj2PCVY/9SiWwNghmyDesyxpOGcr
	OR5wst9MEEnE4LSpcWlcygQ8nT69kGWmV6dihCaEc89MLpb+COJR93fN8sKs0SvUmhmWmpoNZeA
	SWucr8lHPMzS0YEjBFNr2QuFHjQggJDhkfM9Z9eCDeEkFeCE4JP+JQW5Lt2OI02LooUjVW6fEzh
	una8iC0abAwP0YjEg+ojTK484WiRLCZhfkWkPJnVIxjtoRaeA6A80TtvAaKhaq1t/WJue1OUWrW
	MlYlk3Piq3kQYegQVgGXzLKaQBKC7dlDN62/9HAf0FXcOc+DdcaGPryqbFcY1n8P7t5yT0B6OYq
	nym634VhssDo1k1Dd3+biqA7Pw4hLXu8P7NQHz4wJgLXP1Xh74PA97DpeKU3kjjKWSv7W0OZ5ew
	3VwKyvJTPD/JBKXjtucjRzDPiodZwwAgBdc3+fqxDhStenO+N5PHRYEaE8nDAVUrKV5gtKJFnfZ
	3keBXO6fHw3hI9RVJhzsoAfSmg=
X-Received: by 2002:a05:7301:678e:b0:2de:c5ca:c1f3 with SMTP id 5a478bee46e88-3077aeef992mr729178eec.4.1780626160228;
        Thu, 04 Jun 2026 19:22:40 -0700 (PDT)
X-Received: by 2002:a05:7301:678e:b0:2de:c5ca:c1f3 with SMTP id 5a478bee46e88-3077aeef992mr729163eec.4.1780626159744;
        Thu, 04 Jun 2026 19:22:39 -0700 (PDT)
Received: from ucr-secure-48-10-13-243-195.wnet.ucr.edu.net (ftd-border-nat-ucr-secure-v348.ucr.edu. [169.235.95.220])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db5610esm6431175eec.4.2026.06.04.19.22.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 04 Jun 2026 19:22:39 -0700 (PDT)
Sender: Yuan Tan <ytan089@ucr.edu>
From: Yuan Tan <yuan.tan1@email.ucr.edu>
X-Google-Original-From: Yuan Tan <kentertan12138@outlook.com>
To: ojeda@kernel.org,
	gary@garyguo.net,
	rust-for-linux@vger.kernel.org
Cc: peterz@infradead.org,
	zhiyunq@cs.ucr.edu,
	ardalan@uci.edu,
	pgovind2@uci.edu,
	dzueck@uci.edu,
	Yuan Tan <ytan089@ucr.edu>
Subject: [PATCH 0/1] rust: sync: fix Guard::lock_ref lock lifetime leak
Date: Thu,  4 Jun 2026 19:22:30 -0700
Message-ID: <20260605022232.31405-1-kentertan12138@outlook.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuan Tan <ytan089@ucr.edu>

Hi linux kernel maintainers,

We are developing a tool called FerroLens to detect potential unsound
behavior in Rust code in the Linux kernel. FerroLens reported the following
bug in rust/kernel/sync/lock.rs.

`Guard<'a, T, B>` is defined with `lock: &'a Lock<T, B>` as one of its
fields. One of the functions that it implements, `Guard::lock_ref(&self)`
returns that `&'a Lock<T, B>`. If `Guard` is `Sync`, then `&Guard` may be
shared with another thread. That other thread can call `lock_ref` and keep
an `&'a Lock<T, B>` even after the original guard is dropped.

But `Lock<T, B>` is only `Sync` when `T: Send`, because a shared `&Lock`
lets another thread acquire the lock and obtain mutable access to `T`. The
`unsafe impl Sync for Guard` only requires `T: Sync`, which is weaker. For
a type `T` that is `Sync` but not `Send`, this would let another thread
obtain `&Lock<T, B>` and later lock it, effectively enabling cross-thread
mutable access to a `T` that is not safe to send between threads.

This issue can cause UB in the following situation. If T is sync but not
send, Thread A: Creates a Lock<T>. Because T is not Send, Lock<T> is not
Sync. It cannot be shared with other threads. Locks the mutex and gets a
Guard<T>. Since T is Sync, code says Guard<T> is Sync. Thread A can now
safely give a &Guard<T> to Thread B. Thread B: calls guard.lock_ref(). This
returns a &'a Lock<T>. Thread B now has a reference to the Lock. Even after
Thread A drops the guard, Thread B still has that &Lock. Thread B can now
call lock.lock() and get a &mut T.

We're not Rust experts, so we may have gotten some things wrong. We'd greatly
appreciate any corrections.

Here is a poc kernel module which demonstrates this problem:

#![no_std]

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
    author: "Priya Govindasamy",
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
        "thread {} obtained &Lock<SyncButNotSend, _> through &Guard\n",
        ctx.thread_id,
    );
    ctx.handoff.lock_ref_ready.store(true, Ordering::Release);

    while !ctx.handoff.guard_dropped.load(Ordering::Acquire) {
        unsafe { bindings::msleep(20) };
    }

    let mut relocked = leaked_lock.lock();
    relocked.value += 1;
    pr_info!(
        "thread {} locked after thread A dropped the original guard; value={}\n",
        ctx.thread_id,
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
[949319.304760] lock_ref_poc: thread 2 obtained &Lock<SyncButNotSend, _> through &Guard
[949319.332467] lock_ref_poc: thread A dropped the original guard after thread B captured &Lock
[949319.356484] lock_ref_poc: thread 2 locked after thread A dropped the original guard; value=101


Yuan Tan (1):
  rust: sync: avoid leaking the lock lifetime from Guard::lock_ref

 rust/kernel/sync/lock.rs | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

-- 
2.43.2

