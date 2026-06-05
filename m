Received: from mx-lax3-3.ucr.edu (mx-lax3-3.ucr.edu [169.235.156.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B983C26158B
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 05:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=169.235.156.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780635781; cv=none; b=CL3Re9V7ZUhVQWqU2SVnss/ErMK+VbYNGOgIgVIYvrcSsnNY/NBG04RBjxZzI28xjiiyfXW5SiVcMcA9rMgvNWFeOts/62ILEnXXcFUrfVsjob1Aod8hJt8bY8jUCogD1X/+xnh6Ea07oCNPBEOYaoDpqU3ZGZSX8PhtG2dM/uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780635781; c=relaxed/simple;
	bh=l+o3TgwRAGVmPXg/iCT+MVatDU9PmYwn9Z4Sd9erMrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h5ip/KewlysmrmNDdSb9Yf/OxgWjOSTcnwudWCj/FwMJfDOlP6gmYsFLB7tBXJf3UcagOzEtIIkBmyOJ5tmye2zugxDP98Z98HLecfLdFveFizP9vsBExGmb11D9/rCV8Z5ZI9oCeDRVqyCnMjymj0EmNX0iTnWV5+oXzkI0Zns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ucr.edu; spf=pass smtp.mailfrom=ucr.edu; dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=EPmULaYu; dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=ZdxDexeP; arc=none smtp.client-ip=169.235.156.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ucr.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucr.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="EPmULaYu";
	dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="ZdxDexeP"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1780635780; x=1812171780;
  h=dkim-signature:x-google-dkim-signature:
   x-forwarded-encrypted:x-gm-message-state:x-gm-gg:from:to:
   cc:subject:date:message-id:x-mailer:mime-version:
   content-transfer-encoding:x-cse-connectionguid:
   x-cse-msgguid;
  bh=l+o3TgwRAGVmPXg/iCT+MVatDU9PmYwn9Z4Sd9erMrA=;
  b=EPmULaYuj63g7gFgje188lM/xKW+NqWwCjwRMMUkGQt2h346mzGoAE+Y
   qw03cgYCF1EOxDha+ZPrkT7e2aEWV+W+USSOkktcd2WP9ckVmSxK6WdZ/
   CdlREdaHuLWnv7DKGvGeyRMjnXj3HvotytIJrBEmh19duFYlzsKo1hofX
   cc76TkZ7VyTGGI2c/x/nGysE9XykPUHLboGKIsjbqrWnGO2ofg/mt+DeE
   ewrMMKRdi/7kNIfVWe7TJ3ZMMvcQxqfKc+qHAQy7zmGlDvEznW9o5koLN
   fnHo2UpbCxLOxN9vbQWW71ThABBTRDaMI168tXrROnREg/36WZFCfhLOJ
   w==;
X-CSE-ConnectionGUID: 2FIajm79RxOuIgEY5aUUGA==
X-CSE-MsgGUID: 5uOotqXYRvSWRK51W3bOlw==
Received: from mail-dy1-f198.google.com ([74.125.82.198])
  by smtp-lax3-3.ucr.edu with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Jun 2026 22:03:00 -0700
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30761ab3483so5046842eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jun 2026 22:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1780635779; x=1781240579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vYz1kPdznzFRAAzIbeRAvh17VTwnGc5Hey6O8cpJkig=;
        b=ZdxDexePtYDXaB1S+3HZbbJoaE9sbH3X177Yz95yu7trspW+UVgcqjWTx8E6SpXTqe
         wmYldJWBmnyVUUsuakFBToXhnVfwC03f5s97ody18b7sSxmTOYoV57UOs+Kdm8hXFmNE
         tLBl/T34V/Ceiezp980CW30vNycbzQ3cRZwV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780635779; x=1781240579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYz1kPdznzFRAAzIbeRAvh17VTwnGc5Hey6O8cpJkig=;
        b=UPulQJILNINkevLTVov0Os/udpL87CRpT8wx4teds+WYz+dz8SRBJ5mddcEYV8+XgF
         RWdhBFmQo5gJEalKmyJr8vr0X7S9HnRKHEkLNshbGpjJK6MFuzf/3j+lbjx4+NCk3iP4
         /sv8dOvQvSm9Iu3y6zO0fHMXEa0j86DD0pH2YpOn3zXyxSUanw3tPzAbvLhX1d71xPg9
         cbPrjWR1idrc9dg6Ik3o4h9l1No0IgEbbbsuifs3J8ST73pq5EjL20qdvJF0sVvDYulM
         jqM/3hPKufOAz2SQKKZmD/jCrN0hAOLulqTku8qByxix9m0MyMJLa3m7i+MZg+k26uxp
         CZcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9m3uDSep04G8l6yhGoCB7/ihyYOmp99UPAgURMHOmUbWMPwT5zZcH4ZVhFITpZMonOh7YD2VYHZjFo3YDysQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtKw3SCJnNC/3zbDqoF2OO9hcFt61ThhlOn2rNRX2ighrWdrpi
	rwS4i3TdM8v1Mrwr8CSh0TuPNA7LVCWlkWDV5Vdk63pY6+Guf42xNc9/hNprbJRiTPkRPa79OHr
	qq5GUPhhhaKss4kaupmqFCt2V6RZyDPjYkrwpjgrEthPEPvsOvU1YA2fjm1z8pjnOuSPlqw==
X-Gm-Gg: Acq92OHkbP67RV+HTDbaPj727HHfgl1RDa6jrBWXbGZjjOibJ7oMSVqS3PXQ9chvZRB
	4FBKJSGOX41b2M9hKThcHg1O7r0xkGQH0rPg0QCfhN8soa2Xbcs/0TGRzUxjrPex/JVPYoa22o+
	3qh9BzspBwR+nm2lmlqtftpzXqngFaKmjiLEwB5WV1kXZrRld/b2m+HOdRu8NMEj5ppu8LkXPsR
	Cpw+HMLPZWHj+YvG3OQH5cmWTybOK28HFA+3B4htwdq3h3ggLTEF0L3+YeMvKnmXQ7Xw7fI4r/e
	A/Kh3N5hHNKtcff9HTwijJKTm34zPquWzkkwQXMwbvEGRbeKHu0ADhA6R8MFR4nDgy62aMApk2h
	tEr3CvJWJ1QyFtK/mtUS0s5Pm9So8hOkNVKthUgGM9+S+2IjgTFgOQWKyDovpHo9hyFWFVNQ+oI
	3CKoqma6BubF5k1nGerI11isHeuKN3sV66dsk215D/eROayaOoiQjBiWOXreN9xxxiX1Z9a4xxq
	O7bkJmm5rE5
X-Received: by 2002:a05:7300:8c09:b0:2d9:fa9c:87a9 with SMTP id 5a478bee46e88-3077b27043fmr1032277eec.5.1780635778505;
        Thu, 04 Jun 2026 22:02:58 -0700 (PDT)
X-Received: by 2002:a05:7300:8c09:b0:2d9:fa9c:87a9 with SMTP id 5a478bee46e88-3077b27043fmr1032263eec.5.1780635777988;
        Thu, 04 Jun 2026 22:02:57 -0700 (PDT)
Received: from ucr-secure-48-10-13-243-195.wnet.ucr.edu.net (ftd-border-nat-ucr-secure-v348.ucr.edu. [169.235.95.220])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df9bbd4sm6121079eec.30.2026.06.04.22.02.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 04 Jun 2026 22:02:57 -0700 (PDT)
From: Yuan Tan <ytan089@ucr.edu>
To: ojeda@kernel.org,
	boqun@kernel.org,
	rust-for-linux@vger.kernel.org
Cc: zhiyunq@cs.ucr.edu,
	ardalan@uci.edu,
	pgovind2@uci.edu,
	dzueck@uci.edu,
	Yuan Tan <ytan089@ucr.edu>
Subject: [PATCH 0/1] rust: revocable: Fix racing access during revocation
Date: Thu,  4 Jun 2026 22:02:46 -0700
Message-ID: <cover.1780635248.git.ytan089@ucr.edu>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linux kernel maintainers,

We are developing a tool called FerroLens to detect potential unsound
behavior in Rust code in the Linux kernel. FerroLens reported the following
bug in rust/kernel/revocable.rs.

There is a potential race condition between the call to
revoke_internal/no_sync and try_access/try_access_with_guard on the same
object. This occurs due to the use of Ordering::Relaxed to synchronize on
is_available.

The race occurs in the following scenario:

Thread A (Revoker)
1. is_available.swap(false, Relaxed)
2. synchronize_rcu() begins

Thread B (reader)
3. executes rcu_read_lock().
4. is_available.load(Relaxed) returns true (stale value).

Thread A
5. synchronize_rcu() decides it doesn't need to wait for Thread B because
   B's critical section started after A's grace period began
6. synchronize_rcu() returns
7. drop_in_place(data)

Thread B
8. UB: Thread B accesses data via the guard.

The safety comment for revoke says there are "no more concurrent users",
but that does not prevent a new `try_access` from starting concurrently
with `revoke_internal`. And because both accesses to `is_available` are
`Relaxed`, a racing reader can still observe the old `true` value and
create a reference to `T`.

If `SYNC = true`, `synchronize_rcu()` only waits for RCU read-side critical
sections that were already in flight when the grace period started. A
reader that starts after that point is not waited for, even if it still
reads the stale `true` and obtains `&T`. Then `drop_in_place` can run while
that reader still holds the reference, which is a use-after-free.

Here is a poc kernel module which demonstrates the issue:

---
use core::{
    hint::spin_loop,
    sync::atomic::{AtomicBool, AtomicU32, Ordering},
};
use kernel::{
      bindings,
    c_str,
    error::from_err_ptr,
    prelude::*,
    revocable::{
        self, Revocable, TEST_PHASE_AFTER_DROP, TEST_PHASE_AFTER_SWAP, TEST_PHASE_AFTER_SYNC,
        TEST_PHASE_BEFORE_DROP, TEST_PHASE_BEFORE_SYNC, TEST_PHASE_READER_BEFORE_LOAD,
    },
    sync::{rcu, Arc},
};

  module! {
      type: RevocableExample,
      name: "revoke_poc",
      authors: ["Priya Govindasamy"],
      description: "Poc for potential race condition in Revocable<T>",
      license: "GPL",
  }

  struct DeviceState {
      value: u32,
  }

  struct RevocableExample {
      state: Arc<Revocable<DeviceState>>,
      race: Arc<RaceSync>,
  }

struct RaceSync {
    ready: AtomicU32,
    done: AtomicU32,
    go: AtomicBool,
    abort: AtomicBool,
    reader_may_enter: AtomicBool,
    release_reader: AtomicBool,
    reader_holding_ref: AtomicBool,
}

  struct ThreadContext {
      state: Arc<Revocable<DeviceState>>,
      race: Arc<RaceSync>,
      thread_id: u32,
  }

fn spin_until(flag: &AtomicBool) {
    while !flag.load(Ordering::Acquire) {
        spin_loop();
    }
}

  fn wait_to_start(race: &RaceSync) -> bool {
      loop {
          if race.abort.load(Ordering::Acquire) {
              return false;
          }
          if race.go.load(Ordering::Acquire) {
              return true;
          }
          spin_loop();
      }
  }

fn read_state_value(state: &Revocable<DeviceState>, race: &RaceSync) -> Option<u32> {
    spin_until(&race.reader_may_enter);
    pr_info!("reader: coordinator released reader to enter RCU critical section\n");

    let guard = rcu::read_lock();
    pr_info!("reader: entered RCU critical section after revoke started\n");
    pr_info!("reader: about to call try_access_with_guard after revoke started\n");

    let state = state.try_access_with_guard(&guard)?;
    race.reader_holding_ref.store(true, Ordering::Release);
    pr_info!("reader: holding reference while revoke continues\n");
    spin_until(&race.release_reader);
    let value = state.value;
    race.reader_holding_ref.store(false, Ordering::Release);
    Some(value)
}

  unsafe extern "C" fn read_value_thread(data: *mut kernel::ffi::c_void) -> i32 {
      // SAFETY: `data` comes from `Arc::into_raw` in `spawn_read_thread`, and each thread takes
      // ownership of exactly one reference.
      let ctx = unsafe { Arc::from_raw(data.cast::<ThreadContext>()) };

      ctx.race.ready.fetch_add(1, Ordering::AcqRel);
      if !wait_to_start(&ctx.race) {
          ctx.race.done.fetch_add(1, Ordering::AcqRel);
          return 0;
      }

      match read_state_value(&ctx.state, &ctx.race) {
          Some(v) => pr_info!("REVOKE_BUG: thread {} read value = {}\n", ctx.thread_id, v),
          None => pr_info!("thread {} saw revoked state\n", ctx.thread_id),
      }

      ctx.race.done.fetch_add(1, Ordering::AcqRel);
      0
  }

  unsafe extern "C" fn revoke_state_thread(data: *mut kernel::ffi::c_void) -> i32 {
      // SAFETY: `data` comes from `Arc::into_raw` in `spawn_revoke_thread`, and each thread takes
      // ownership of exactly one reference.
      let ctx = unsafe { Arc::from_raw(data.cast::<ThreadContext>()) };

      ctx.race.ready.fetch_add(1, Ordering::AcqRel);
      if !wait_to_start(&ctx.race) {
          ctx.race.done.fetch_add(1, Ordering::AcqRel);
          return 0;
      }

    pr_info!("revoker: about to call revoke\n");
    ctx.state.revoke();
    pr_info!("thread {} revoked state\n", ctx.thread_id);

      ctx.race.done.fetch_add(1, Ordering::AcqRel);
      0
  }

  fn spawn_read_thread(
      state: Arc<Revocable<DeviceState>>,
      race: Arc<RaceSync>,
      thread_id: u32,
  ) -> Result {
      let ctx = Arc::new(ThreadContext { state, race, thread_id }, GFP_KERNEL)?;
      let data = Arc::into_raw(ctx) as *mut kernel::ffi::c_void;

      let task = match from_err_ptr(unsafe {
          bindings::kthread_create_on_node(
              Some(read_value_thread),
              data,
              bindings::NUMA_NO_NODE,
              c_str!("revocable_reader/%u").as_char_ptr(),
              thread_id,
          )
      }) {
          Ok(task) => task,
          Err(err) => {
              // SAFETY: Thread creation failed, so the raw reference was not handed off.
              unsafe { drop(Arc::from_raw(data.cast::<ThreadContext>())) };
              return Err(err);
          }
      };

      // SAFETY: `task` is a valid sleeping kthread returned by `kthread_create_on_node`.
      unsafe { bindings::wake_up_process(task) };
      Ok(())
  }

  fn spawn_revoke_thread(
      state: Arc<Revocable<DeviceState>>,
      race: Arc<RaceSync>,
      thread_id: u32,
  ) -> Result {
      let ctx = Arc::new(ThreadContext { state, race, thread_id }, GFP_KERNEL)?;
      let data = Arc::into_raw(ctx) as *mut kernel::ffi::c_void;

      let task = match from_err_ptr(unsafe {
          bindings::kthread_create_on_node(
              Some(revoke_state_thread),
              data,
              bindings::NUMA_NO_NODE,
              c_str!("revocable_revoke/%u").as_char_ptr(),
              thread_id,
          )
      }) {
          Ok(task) => task,
          Err(err) => {
              // SAFETY: Thread creation failed, so the raw reference was not handed off.
              unsafe { drop(Arc::from_raw(data.cast::<ThreadContext>())) };
              return Err(err);
          }
      };

      // SAFETY: `task` is a valid sleeping kthread returned by `kthread_create_on_node`.
      unsafe { bindings::wake_up_process(task) };
      Ok(())
  }

 impl kernel::Module for RevocableExample {
      fn init(_module: &'static ThisModule) -> Result<Self> {
          let state = Arc::pin_init(Revocable::new(DeviceState { value: 123 }), GFP_KERNEL)?;
          let race = Arc::new(
              RaceSync {
                  ready: AtomicU32::new(0),
                  done: AtomicU32::new(0),
                  go: AtomicBool::new(false),
                  abort: AtomicBool::new(false),
                  reader_may_enter: AtomicBool::new(false),
                  release_reader: AtomicBool::new(false),
                  reader_holding_ref: AtomicBool::new(false),
              },
              GFP_KERNEL,
          )?;

          let m = Self { state, race };
          revocable::test_hooks_reset();

          spawn_revoke_thread(m.state.clone(), m.race.clone(), 1)?;
          if let Err(err) = spawn_read_thread(m.state.clone(), m.race.clone(), 2) {
              m.race.abort.store(true, Ordering::Release);
              revocable::test_hooks_disable();
              while m.race.done.load(Ordering::Acquire) != m.race.ready.load(Ordering::Acquire) {
                  spin_loop();
              }
              return Err(err);
          }

          while m.race.ready.load(Ordering::Acquire) != 2 {
              spin_loop();
          }
          m.race.go.store(true, Ordering::Release);
          pr_info!("main: released reader and revoker together\n");

          revocable::test_hooks_wait_for(TEST_PHASE_AFTER_SWAP);
          pr_info!("main: observed revoke_internal after swap(false)\n");
          revocable::test_hooks_allow_through(TEST_PHASE_AFTER_SWAP);

          revocable::test_hooks_wait_for(TEST_PHASE_BEFORE_SYNC);
          pr_info!("main: releasing revoker into synchronize_rcu\n");
          revocable::test_hooks_allow_through(TEST_PHASE_BEFORE_SYNC);
          m.race.reader_may_enter.store(true, Ordering::Release);

          revocable::test_hooks_wait_for(TEST_PHASE_READER_BEFORE_LOAD);
          pr_info!("main: reader reached try_access_with_guard before load\n");
          revocable::test_hooks_allow_through(TEST_PHASE_READER_BEFORE_LOAD);

          revocable::test_hooks_wait_for(TEST_PHASE_AFTER_SYNC);
          pr_info!("main: revoker completed synchronize_rcu\n");
          if m.race.reader_holding_ref.load(Ordering::Acquire) {
              pr_info!(
                  "BUG_WINDOW: reader still holds reference after synchronize_rcu completed\n"
              );
          }
          revocable::test_hooks_allow_through(TEST_PHASE_AFTER_SYNC);

          revocable::test_hooks_wait_for(TEST_PHASE_BEFORE_DROP);
          pr_info!("main: revoker reached the drop_in_place boundary\n");
          if m.race.reader_holding_ref.load(Ordering::Acquire) {
              pr_info!(
                  "BUG_WINDOW: reader still holds reference immediately before drop_in_place\n"
              );
          }
          m.race.release_reader.store(true, Ordering::Release);
          revocable::test_hooks_allow_through(TEST_PHASE_BEFORE_DROP);
          revocable::test_hooks_allow_through(TEST_PHASE_AFTER_DROP);

          while m.race.done.load(Ordering::Acquire) != 2 {
              spin_loop();
          }
          revocable::test_hooks_disable();

          Ok(m)
      }
  }

  impl Drop for RevocableExample {
      fn drop(&mut self) {
          // Safe to call more than once; only the first revoke does the work.
          self.state.revoke();
      }
  }


Makefile:

obj-m += revoke_poc.o

KDIR := /lib/modules/$(shell uname -r)/build

PWD := $(shell pwd)

all:
	$(MAKE) -C $(KDIR) M=$(PWD) LLVM=1 modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean


Note that this bug could not be triggered on x86 architecture because it uses a Total Store Order (TSO) model.

Yuan Tan (1):
  rust: revocable: Fix racing access during revocation

 rust/kernel/revocable.rs | 56 ++++++++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 19 deletions(-)

-- 
2.43.2

