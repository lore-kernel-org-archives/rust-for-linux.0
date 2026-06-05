Received: from mx-lax3-1.ucr.edu (mx-lax3-1.ucr.edu [169.235.156.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89103B777B
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 02:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=169.235.156.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780626240; cv=none; b=DCR8oygzQxBmdErTVO/+WzAyRlbcFJyqNA7H8FRGrpjuq5sudQDDPxsHb+4plPZ+aoO4Hl2K6IJfNvn4DkkYKUfI+DCJnflnd75xojQj37F5/4wSuOmLT3i05FLTdQ1yabAb4HnyGpvDOuqv9zDQPnhdjYiQW49Z1TEH8QSJgeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780626240; c=relaxed/simple;
	bh=EkKOMsCa/udStFr77ymLaCp3d2/tcq9uAdUElqm6kSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DTrQQy1yBl0Hbu2ngxAg4ik4E/et/rvStGe4nnw9RxtZL5Ba/dJeA6wcifTwytgp/NR27ldaBUzAiu4jgXOtKlzBrru/ssXGhR7fnqjYGJBfbBziBLWGUJRIHFlDxhUT06wJPMdj4SE0RDH+L/aREx7PqeeMdycbDYtuyNPSHao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=email.ucr.edu; spf=pass smtp.mailfrom=ucr.edu; dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=nuJ2uEdb; dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=dfGR4Jlu; arc=none smtp.client-ip=169.235.156.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=email.ucr.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucr.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="nuJ2uEdb";
	dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="dfGR4Jlu"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1780626231; x=1812162231;
  h=dkim-signature:x-google-dkim-signature:
   x-forwarded-encrypted:x-gm-message-state:x-gm-gg:sender:
   from:x-google-original-from:to:cc:subject:date:message-id:
   x-mailer:in-reply-to:references:mime-version:
   content-transfer-encoding:x-cse-connectionguid:
   x-cse-msgguid;
  bh=EkKOMsCa/udStFr77ymLaCp3d2/tcq9uAdUElqm6kSk=;
  b=nuJ2uEdbbrlVZ4gUbjIoyW8zLViqqWpxD/IanNvD5fEb//CogT98x6fm
   hamNsROCVymS7X8YQZF636qq9LSJtVOVQPupiMUQFDEcDpwRGYugMH8mX
   9EPhkgbzdBAI37PYtbHCBcqauIwfKnpivkqT+GfpJggP7AkDx6m+UKmed
   aGJGkn3QZSrfJH5BNMgzqSoNUyDfeRAwIR1ADat1YW3Uu7oU5jHWPOQiK
   QFLucamejrc6gS/UIOpylxrm30FpVYPbIawMwh24MHDps5KD98MraOeeh
   uUoxoxAfU6vxNV8q5gfnfb1mGvvjsP+h5Q06R6B1Ia3iaNNIO5kLDjNeH
   g==;
X-CSE-ConnectionGUID: 4xiha0ILQwKAY1ZhE2XyDw==
X-CSE-MsgGUID: TSAX1nMFShGeJCbr5AbMyA==
Received: from mail-dy1-f199.google.com ([74.125.82.199])
  by smtp-lax3-1.ucr.edu with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Jun 2026 19:22:44 -0700
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304ed777a96so723082eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jun 2026 19:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1780626163; x=1781230963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTB3tYSqeZZwGv+tDxtvZ26MxKjcck4RpWVDxAqUswk=;
        b=dfGR4JluEIFHLBHcNgGVTu/OhVpUn7wATvNwb7PUOWiZMtnSHHnHq0AQtKacxHiISQ
         XTAV5H0iiWJ5P2HKggETnJkFpnpfAB3mwVOFBb22JjtKZxR1gzjyuwtYIZIn7GgPjcTp
         q1JZnZTX9qK3k/I44hl0IgGJ5Ol68espEqIKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780626163; x=1781230963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XTB3tYSqeZZwGv+tDxtvZ26MxKjcck4RpWVDxAqUswk=;
        b=CJO9Rc02V6x2ibUHGwrmVfkG+DZCcSzawb2ljKTcJ07Jzx8X6ryq9PizJQH0cSo5c7
         21ZbvHYyhlvC8QrwLQjpa9X4Vg9k6bNuzVmSuzVoT9mqJqZP28rTZ0EgUZpCFyEC5lXx
         +grB8vB4Y1O2yK8LkyhpUT6HUoLuiPmEuQglR4cwhZy4IgvQe/EizGIV/pMDKTEZdGnn
         BYF2AYXd5k4w+OK2QTYVlmg9N7VGKVL7kpFiCZogT2G2O94c2/37DEmcfovsPet+ja5N
         OLU6OGPFs2vr14qH4ZKfLMgUAePJx2hzeP3Mm1nEufGqVoGTtADLPBfQqr+3Q2dWYwAE
         qscg==
X-Forwarded-Encrypted: i=1; AFNElJ8PSDfLTqUxblGRApuMl5uX+XN8/i7SUM2wMki7WaHI9bHD/hiu5xstG1P/pVyzC+PgunoY1CP+WOrQ6xlBVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgvpBBZ+UxIP8kMDNLCCj/XB/3mwyEm98mGBN5eEqENJ0y0rl9
	SCw0RBmXtUE8ocbOLuolDE0aT7Hqo2XNYyxHUpuoYfTn+ozNQcL2oeM2RBMfCPU2WeDXlcqmbkM
	XdhYBhmcIlEbYdjJJMQkO69uAC22tCW39lblfWE0UqwBzj3TSweaLypansCVWkhJVAUhCUA==
X-Gm-Gg: Acq92OEvR8lzjIVp8UQQXBdZqjtme+fXuQVKV95UNQkRgfF7O1FFxg9qCe/sFOME8Ma
	ILiZWqH7FU04kSRSG1ClQX/KSCV7PrO8muapYFJL60XsZp0rt547Kz2aEBggljYH4ht0s/b9ItS
	BH/nIOZVdSdyvzX6fcpC7IrynWoFODZZ5lgtA/SzRR23RKG6h+mtZAAwHIUWvSRzaBtVdk4CqYr
	iy/PwCdRcQEP6UZiOnNL1TJd0J9ajFWmtzFC45WMqYJGEqzw4V4wIihQA5Abe7B+c4tsiAh/NKi
	bvOTn+pP2BrApUxsnlY1TyrClsqwqhBIZPyhxCFsHUXIEKf7YG5hHh71YbifXRIKZHLmghDXGaW
	ChX7PMvHOjaKZ+Ke2CL0nVMgaiQY0Z7kKHFgRMsgW7faWXxB3Tl63C8CfJZKrJnCqYhQP9Sxeew
	FrmIZPJu9IRITg6ZXLgiikg9G7M8+LNdOBjPOF3JhH2gUhxZtJU+LK0kkqZjbSsvL8TTp5yUiEQ
	xWMfl5N4oLRkWy3/ez204TeK64=
X-Received: by 2002:a05:7300:7308:b0:302:b44b:b64a with SMTP id 5a478bee46e88-3077fd759bbmr262018eec.1.1780626163040;
        Thu, 04 Jun 2026 19:22:43 -0700 (PDT)
X-Received: by 2002:a05:7300:7308:b0:302:b44b:b64a with SMTP id 5a478bee46e88-3077fd759bbmr262001eec.1.1780626162538;
        Thu, 04 Jun 2026 19:22:42 -0700 (PDT)
Received: from ucr-secure-48-10-13-243-195.wnet.ucr.edu.net (ftd-border-nat-ucr-secure-v348.ucr.edu. [169.235.95.220])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db5610esm6431175eec.4.2026.06.04.19.22.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 04 Jun 2026 19:22:41 -0700 (PDT)
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
Date: Thu,  4 Jun 2026 19:22:31 -0700
Message-ID: <20260605022232.31405-2-kentertan12138@outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605022232.31405-1-kentertan12138@outlook.com>
References: <20260605022232.31405-1-kentertan12138@outlook.com>
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

