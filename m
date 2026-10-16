Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B1A55D89E
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 17:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171142; cv=none; b=PA7y1iZ6cFY4sxyXEiWM6dcRESwCkGw5NQC0IIjeAZYmI3YuYz1PAFMtW9ZQV3iHpK5nvDawYVpezvIfguirvb9CFpu00IiEZ4jUzYjev8kFXiGw4uA7fnNfjh22b7924ja6nagA3ctBA775VrwCi0vXbWlgo/LL6maAjiGSz2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171142; c=relaxed/simple;
	bh=p296wWzG81mB0U61JcZUSzy8NUNJlvUNPBagkr1+eKI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=izI0wUtedOkQr/hBH+313QDnIr9QbYtrtiEaYpS0RyZkwMm1JEpN+7J3eyGEOLIIrt+lG/7BEihhpKL5YLxw4xcylpUzZMcyqtdk+uVhOTJk6yZB2uCKWssGlU3tkurdP7vBBr8Ys6DtPzeTA8Qw3daCvBXrczJb1CoWEkiLBho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=ir/a525m; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="ir/a525m"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15ea896ddc8so139762c88.0
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 10:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1792171140; x=1792775940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ODyKqipWGtxVK+aNRjwbobnihO9iwJvaEgWs23/B/o4=;
        b=ir/a525mw0G00IPOeTBfOdXuNJOpzOziZUs18RGW4CYaGFHtK7m81hab956+BDXSXi
         Y+iOuLX57vvHrIgPW/45PhFw/idXNbjNdGfjLrN/NiBjphjjpzFQpcuS2PX03SR+K7cP
         SXFccWsWePJ1A1qVLFOEQS4MWLkJZk6xvnC/ufD+p6gQvtw83kdUQ9nvI6PTu5Axue7L
         KNd5tMzEnz9JGO598aOsOdRRtw1jMkK4/FwyQXDkUUwNzUi9movw+nDhbnFBgC90WQgx
         pdSy1ykRQHsc3a+r5bnkKMpm9Fgg4UPg5WEG2WAi74lbNVFYKhmt74mawD9R/FP3WLev
         u+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171140; x=1792775940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODyKqipWGtxVK+aNRjwbobnihO9iwJvaEgWs23/B/o4=;
        b=DdqwgilgLa0+sKeKcLhYz4hGU+Ywu07QMFoaIa74XAlF8CnMiV4KYOhBLjKbA34jFF
         l2IMeD6xe3/ndn1L8TT4xgogHqGm/2jJd7PSLB7EKZR9teVsglNAIsxYmusEyarERVyU
         tNMyNF4p/D2JlUKm9/kZklLonBHr6xYBJ4Aoon6sz4qW2DvdQcnb+ixcMED7xweBLs1u
         OBjF1S25WwhzbvH0++AGjMyfKccQhAWVdsoRkpzBIWBzUNSvkd8PKwk2of6B60ma7ftZ
         jpax2d/Tfm+7NHEN7G/5C2NUQ+3ggcn5CUxcZ3IzAJizQAl1e1gQTsBduDyh/srOe9fO
         XJLw==
X-Forwarded-Encrypted: i=1; AKwUvBzEG6yImHqy+oJl0U/I9KG175OHJEUu+HLrx73sYVVfEXSy5tqpVp+TbpKRek5JVH6JwnKVUi+p6CZmOVhvxQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJI3TWqnyB30ea6I9ZLy2VBh+6loLFVXQy/N66Ex4PuCrtgVbqR
	QqqLAv3K03Am6rJ9Hnf+0PF6MrShzjyWlgGEHjyuJmhlLCXA/Qi1hQNL48mk9h+1jig=
X-Gm-Gg: AYBFou28tn0LZ827+QPo6/mxdXruRBrBCtAHylgoscZ5A1qiU3YIe1WEojihrtDsGnE
	EXcV5gB5WAjliVQJwL7jO04HnSMzq6skecMwWas+ssU5s+Hb/z4fw+EsqVFDy5J+7PrmX3eem3V
	t4BwodRCMr4FCDlNzjrJ/e9sql4It4PCMEBuTERerDfKkcWmB35RiUbrhtGnFU10bXnqSIgv/us
	l+oGcQ9dpeB9Ft7dIoCI9VMyyV46gFTiZ5RpshEr6dka9tK6e+hsr7JCsIOny8rDNxTSJZKVP9b
	kntuWTAcUj9eJ6L5g7tRLlGoPX+RnZHRnvrFVK0fhEvxxlsZ0MMjdvlAmJcsBRGCCUhmSgaJdDj
	TX6AcThh6EZlzsURfFKiAriyuTXaXE+FfbRUb79w0RLYaLOMQaSUAPe5e6HukaEWzYk6nJWQKCr
	VNOqn6iT6UF5Tc/SXPlzbM7O85UOt1LYacFHe+9DShsyICKH4ZmfI6cTLi5HyK3FDi/k0mNZImO
	Jr/ue9Gp8Gcxja+Vh6pxwZBoZAY5SDrK6sJ
X-Received: by 2002:a05:701b:4309:b0:163:fd28:5658 with SMTP id a92af1059eb24-18512d2c812mr643227c88.22.1792171139313;
        Fri, 16 Oct 2026 10:18:59 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1831b75be5esm10373726c88.16.2026.10.16.10.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:18:58 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	aliceryhl@google.com,
	ojeda@kernel.org
Cc: longman@redhat.com,
	lyude@redhat.com,
	daniel.almeida@collabora.com,
	work@onurozkan.dev,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	tamird@kernel.org,
	acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 0/1]  rust: sync: Make `GlobalLockedBy::as_ref` unavailable if T is not Sync
Date: Fri, 16 Oct 2026 17:18:55 +0000
Message-Id: <cover.1791594262.git.pgovind2@uci.edu>
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
FerroLens reported the following bug in rust/kernel/sync/lock/global.rs:

The `GlobalLockedBy::as_ref` method allows `&T` to be obtained from 
mutliple threads even if `T` is not Sync. 

This happens because `GlobalLockedBy<T, B>` is Sync if 
`LockedBy<T, B::item>` is Sync. `LockedBy<T, B>` is Sync if `T` is Send. 
Since there is no requirement that `T` also implements Sync, it is 
possible for multiple threads to simultaneously obtain references to a 
`GlobalLockedBy<T, B>` and then acquire `&T` through 
`GlobalLockedBy::as_ref`. This can lead to undefined behavior if `T` does 
not implement Sync.

Note that a reference to `GlobalGuard<B>` is required as an argument to 
`GlobalLockedBy::as_ref`. Therefore, this issue requires that 
`GlobalGuard<B>` is `Sync` which happens if `B::item` is `Sync` 
(for example, ()).

Here is a PoC kernel module demonstrating the issue.

    use core::cell::Cell;
    use kernel::{
        bindings, c_str,
        error::from_err_ptr,
        prelude::*,
        sync::{Completion, GlobalGuard, GlobalLockedBy},
    };
    use pin_init::stack_pin_init;

    module! {
        type: LockedByPoc,
        name: "locked_by_poc",
        authors: ["Priya Govindasamy"],
        description: "PoC for GlobalLockedBy::as_ref on a non-Sync value",
        license: "GPL",
    }

    kernel::sync::global_lock! {
        // SAFETY: Initialized exactly once in `LockedByPoc::init`, before use.
        unsafe(uninit) static POC_LOCK: Mutex<()> = ();
    }

    struct LockedByPoc;

    // `Cell<u32>` is `Send` but not `Sync`, so this type is also `Send` but not `Sync`.
    struct SendButNotSync {
        value: Cell<u32>,
    }

    fn assert_sync<T: Sync>() {}

    #[pin_data]
    struct ThreadContext<'a> {
        protected: &'a GlobalLockedBy<SendButNotSync, POC_LOCK>,
        guard: &'a GlobalGuard<POC_LOCK>,
        thread_id: u32,
        #[pin]
        done: Completion,
    }

    unsafe extern "C" fn thread_main(data: *mut kernel::ffi::c_void) -> i32 {
        // SAFETY: `data` points to a pinned `ThreadContext` in `init`. `init` waits for this thread
        // to run and then joins it before dropping the context or either borrowed reference.
        let ctx = unsafe { &*data.cast::<ThreadContext<'_>>() };

        // This is accepted despite `SendButNotSync: !Sync`. 
        let value = ctx.protected.as_ref(ctx.guard);
        pr_info!(
            "thread {} acquired &SendButNotSync through GlobalLockedBy::as_ref (value={})\n",
            ctx.thread_id,
            value.value.get()
        );
        ctx.done.complete_all();
        0
    }

    fn spawn_thread(ctx: &ThreadContext<'_>) -> Result<*mut bindings::task_struct> {
        let task = match from_err_ptr(unsafe {
            bindings::kthread_create_on_node(
                Some(thread_main),
                (ctx as *const ThreadContext<'_>).cast_mut().cast(),
                bindings::NUMA_NO_NODE,
                c_str!("locked_by_thread/%u").as_char_ptr(),
                ctx.thread_id,
            )
        }) {
            Ok(task) => task,
            Err(err) => return Err(err),
        };

        // SAFETY: `task` is the sleeping kthread returned by `kthread_create_on_node`.
        unsafe { bindings::wake_up_process(task) };
        Ok(task)
    }

    impl kernel::Module for LockedByPoc {
        fn init(_module: &'static ThisModule) -> Result<Self> {
            // SAFETY: Module initialization executes once for this static global lock.
            unsafe { POC_LOCK.init() };

            // `SendButNotSync` is not `Sync`, but this assertion currently compiles because
            // `GlobalLockedBy` only requires its protected value to be `Send` to implement `Sync`.
            assert_sync::<GlobalLockedBy<SendButNotSync, POC_LOCK>>();
            pr_info!("GlobalLockedBy<SendButNotSync, POC_LOCK> is Sync\n");
            assert_sync::<GlobalGuard<POC_LOCK>>();
            pr_info!("GlobalGuard<POC_LOCK> is Sync\n");

            let protected = GlobalLockedBy::<SendButNotSync, POC_LOCK>::new(SendButNotSync {
                value: Cell::new(0),
            });
            let guard = POC_LOCK.lock();
            let protected_ref = &protected;
            let guard_ref = &guard;

            stack_pin_init!(let thread_a = pin_init!(ThreadContext {
                protected: protected_ref,
                guard: guard_ref,
                thread_id: 1,
                done <- Completion::new(),
            }));
            stack_pin_init!(let thread_b = pin_init!(ThreadContext {
                protected: protected_ref,
                guard: guard_ref,
                thread_id: 2,
                done <- Completion::new(),
            }));

            let task_a = spawn_thread(thread_a.as_ref().get_ref())?;
            let task_b = match spawn_thread(thread_b.as_ref().get_ref()) {
                Ok(task) => task,
                Err(err) => {
                    thread_a.done.wait_for_completion();
                    // SAFETY: The callback has already run; this joins it before its context dies.
                    unsafe { bindings::kthread_stop(task_a) };
                    return Err(err);
                }
            };

            // Each callback prints before signalling. Wait for both callbacks to run, then join
            // their kthreads before the stack contexts or their borrowed values are dropped.
            thread_a.done.wait_for_completion();
            thread_b.done.wait_for_completion();
            unsafe {
                bindings::kthread_stop(task_a);
                bindings::kthread_stop(task_b);
            }

            Ok(Self)
        }
    }

    impl Drop for LockedByPoc {
        fn drop(&mut self) {
            pr_info!("locked_by_poc unloaded\n");
        }
    }


Output:
[91306.702534] locked_by_poc: GlobalLockedBy<SendButNotSync, POC_LOCK> is Sync
[91306.702563] locked_by_poc: GlobalGuard<POC_LOCK> is Sync
[91306.706793] locked_by_poc: thread 1 acquired &SendButNotSync through GlobalLockedBy::as_ref (value=0)
[91306.707231] locked_by_poc: thread 2 acquired &SendButNotSync through GlobalLockedBy::as_ref (value=0)


Priya Bala Govindasamy (1):
  rust: sync: Make `GlobalLockedBy::as_ref` unavailable if T is not Sync

 rust/kernel/sync/lock/global.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.34.1

