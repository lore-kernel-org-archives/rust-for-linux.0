Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE0848F018
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 09:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968928; cv=none; b=eUVPbDfoiwCnAsUABAnGu4gVkFt8HJCT4nZ9Ong4ShSBEDSrTmAwZDmVyea5bBA+MssJLeOFrqCxvdiYZgGtmrwNTCf0YhntY5BZjOEESBMGrLETorbe1TY/RIT3D79HMm7g1I2H/JN1DVuFnixEYnNlzHkJH+lgVKbuy/OBmSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968928; c=relaxed/simple;
	bh=Pe0ZjbdtqJ34ZuVR03sAPd5IzlevgH/YKkeJWSISC6o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Jo4WwtBetFX3LH+weq26dPPoCwCaHIlPYfqNUvtAnCBpKgphuJBJV9NRoR48/Udz8DmcT38rZecfA5JZ/i9l/8HuhCODC8mYgyqQBdrwRYDzgFSQeKArmvv6j5bz+Ld29jjZbG71nMBYKbo2VYTiIiNfeKeLLFichRGO0hQcMi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dsLW9XuG; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dsLW9XuG"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso30977555e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 02:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791968924; x=1792573724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yNj7ZKyhQnUw2YiRQPZiQ8batYyqgFaaTZueylCQvsE=;
        b=dsLW9XuG/DeE68KAR7F4sVocsyqLIQiH1ZSZwd46BeVrvJIy7NmhSKSlWwS3ejXVTb
         SafRhXjFLrtYSFeLsUAmge5NCI0EY1Et6PWxyoKydmuqFUk/a8rfgDF6FGQL2IWnkkb4
         EgTkqSWINSDTvioACOYDyezrQjCDcwfvDm8f52l7n6ndiUrtCbB2GzPk5hbSDA8y+lX5
         36mbbjoLNGxLuI7fX8kpe953cnQpacthReLTp+Q+dBw/LD72d7b1svQLjIBPJDYJpZ+m
         oP94Bos4i2cYh547TP5YRQ2gBx3RDD7JP8OwAEH4g33+wdS92sVHhYA1T3t6J00kf8KV
         4Arw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791968924; x=1792573724;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yNj7ZKyhQnUw2YiRQPZiQ8batYyqgFaaTZueylCQvsE=;
        b=k2uEK7pIgaztJzkMChyiDsBYtBY0+UIeLC+cI9gsYpfufNjF9MLtX9eU07596VMXAH
         t8O2iK9PlXbkPnAX3SrI8FeJMtIs34biG5DjGId8Qn175BXb9vk06hPqKV21nj+3+lGa
         CRzbOJpt7RO7x78Elq9RbacjBSkrDa9jepauViQu2wqZ2A4OeCgyIsSWMGNffIMJiP2r
         arZrGN3vZcvtEdfLswhcUEWkCA1OPXovtO85tUjVfGeTwF9kpbS56X869V4nrCjwi96n
         /3thQyrQ1ODfwYaLxdtD4jNFwoMrCt8J6O/8e8G9Ia/RymJajMv0JUr7LELdwdFYZSLA
         KYCQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6WiZG+mYVc5FPtaBXCmTMX5bGEx3ZMwAoz8MCBxzIHZTzSnQWPZd7DGdsXqk936M3JkcLeQ6e3Em0stKgzw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJiUZq8wUCiP2kOv0iQAzRvWkduIYlok1+jwgtwVPUEEwq0bzfV
	I4KbdhXkLazX/ya1bQNkM2qImv9yvxxcvGoZVKJpOW0W6eAcNhkPPNfvg3P4U7zJBECKZvNyrif
	HfDIXPh9Ro+kCRfIWCA==
X-Received: from wmbfl25.prod.google.com ([2002:a05:600c:b99:b0:4a1:84d4:a0a3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:644f:10b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4a196611aa3mr173490095e9.29.1791968923883;
 Wed, 14 Oct 2026 02:08:43 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:08:35 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJJGz2oC/42NQQ6CMBBFr0Jm7Zi2KqauvIdhoXUKjcJgB1BCe
 ncrJ3D5XvLfX0AoBhI4FQtEmoIE7jKYTQGuuXY1YbhnBqNMqZXeYRxlwDfHx2ukkVBmGahFHz5
 48FYZ5azy5gh530fKem1fqsxNkIHjvF5N+mf/qU4aNZIlV+qS9srczjVz/aSt4xaqlNIX4J17+ MMAAAA=
X-Change-Id: 20261013-rust-workqueue-system-fix-5f9020c90f27
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=11650; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=CkEMDYS0ZHIn6s4iXVju+TtmXA2gfi7ZtLcTMIzMHRA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqz0aW65VWY1xCuEZuW8ormD1K6TIrIczojfZ0L
 VzKcwtQHgOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCas9GlgAKCRAEWL7uWMY5
 RnRLD/9H11TwmmzHgRvlQlSqjuunj+IQ1FKVL0hGu7og+VjQSiHWjUiWabf0zEo7x0wqvl1pGfc
 q5obfkqvb5kDzFMWIWS86MTMNdbUGruTRX6E0rWWtd2fHGayWYQtEcNo07Z5TOuLNcRV8fV7GNw
 YEkcsxtnnlJnaX2hfwTXk8HNLYKrU8cvhzuPYT357FVw2iFjwgofaJ4rJCUi01Rcbsx5trtqmKg
 VH6/LzzdpxWt8VTiPvoJUzo7mdG5Cr/CklJCsVO5sYKg4Vr6/mevHIu5Zy+PzGFbWrroCLYYOiY
 u1eB8r1vj2Cnr9mZP+VAkhyC3t5hryhit/OQy0e88FxOrFkPVg8rN2hYqIyOqgeM/d2keWjTAJe
 Sako/dPl894Dn+T6FpGXwFpNy5Ng5nqljD3kbm3gwm5LvjFLEFcDgdp5hjNEOY3PLzJf4LkE5mb
 6YL5LNBjPMS95wCbmmOPkRgpgQ1GuNZGBrGc27x31ZPRllMlzZ+uNhxY9V/qEqKqFj26o5j3iqg
 OAx/a+V5pt57ZCF7mD1gy8wpHRuCQGu6FKn56/KDsXi/Ra8Tigrps3bAJJH+1MxSqGoTZbw60D3
 lSKuZX2aHguaDDdQ6CB7n+dc5gF5aO5nXympMXPLVrseIHqugVa/qwbtvNfIN/iSNqpAQG3X+E7 Tl3MNmaArJKSlQg==
X-Mailer: b4 0.14.3
Message-ID: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
Subject: [PATCH v2] rust: workqueue: replace deprecated system_wq with system_{percpu,dfl}_wq
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Carlos Llamas <cmllamas@google.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

From: Danilo Krummrich <dakr@kernel.org>

system_wq is deprecated and triggers a runtime warning:

	[    0.857414] workqueue: work func ...WorkItemPointerKy0_E3runB7_ enqueue=
d on deprecated workqueue. Use system_{percpu|dfl}_wq instead.

Replace system() with system_percpu() and system_dfl(), to match the
previous behavior of the deprecated system() and convert doc examples
and tests to system_dfl().

system_unbound_wq is deprecated in the same way, in favor of
system_dfl_wq. Since system_unbound() has no users, just remove it as
well.

Fixes: 64d8eae3f895 ("workqueue: Add warnings and fallback if system_{unbou=
nd}_wq is used")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Boqun Feng <boqun@kernel.org>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
This patch was previously sent as part of other workqueue series [1][2].
However it's a fix that is independent of those series, so it's sent on
its own here.

[1] https://lore.kernel.org/all/20260726223613.1242940-3-dakr@kernel.org
[2] https://lore.kernel.org/all/20260807165252.3849875-2-dakr@kernel.org
---
Changes in v2:
- Also remove system_unbound(), which is deprecated in the same way
  and has no users. (Gary)
- Collect Reviewed-by from Boqun and Dongliang.
- Link to v1: https://lore.kernel.org/r/20261013-rust-workqueue-system-fix-=
v1-1-e9ec616e402b@google.com

Changes since [2]:
- Rebase on v7.3-rc7 and also convert the new SpinLockIrq KUnit test,
  which calls workqueue::system() and otherwise fails to build.
- Add Fixes: tag for the commit that made system_wq warn.
- Collect Reviewed-by from Daniel.
---
 Documentation/rust/testing.rst                    |  2 +-
 Documentation/translations/zh_CN/rust/testing.rst |  2 +-
 drivers/android/binder/process.rs                 |  4 +-
 rust/kernel/sync/completion.rs                    |  2 +-
 rust/kernel/sync/lock/spinlock.rs                 |  2 +-
 rust/kernel/workqueue.rs                          | 52 ++++++++++++-------=
----
 6 files changed, 33 insertions(+), 31 deletions(-)

diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rs=
t
index e3943aceceb9..73046523a9a2 100644
--- a/Documentation/rust/testing.rst
+++ b/Documentation/rust/testing.rst
@@ -97,7 +97,7 @@ operator are also supported as usual, e.g.:
=20
 	/// ```
 	/// # use kernel::{spawn_work_item, workqueue};
-	/// spawn_work_item!(workqueue::system(), || pr_info!("x\n"))?;
+	/// spawn_work_item!(workqueue::system_dfl(), || pr_info!("x\n"))?;
 	/// # Ok::<(), Error>(())
 	/// ```
=20
diff --git a/Documentation/translations/zh_CN/rust/testing.rst b/Documentat=
ion/translations/zh_CN/rust/testing.rst
index 6747d0012991..fdd88fa2fe40 100644
--- a/Documentation/translations/zh_CN/rust/testing.rst
+++ b/Documentation/translations/zh_CN/rust/testing.rst
@@ -93,7 +93,7 @@ KUnit =E6=B5=8B=E8=AF=95=E5=8D=B3=E6=96=87=E6=A1=A3=E6=B5=
=8B=E8=AF=95
=20
 	/// ```
 	/// # use kernel::{spawn_work_item, workqueue};
-	/// spawn_work_item!(workqueue::system(), || pr_info!("x\n"))?;
+	/// spawn_work_item!(workqueue::system_dfl(), || pr_info!("x\n"))?;
 	/// # Ok::<(), Error>(())
 	/// ```
=20
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/pro=
cess.rs
index 5372bfbd93b3..de5bca7f9fc7 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1728,7 +1728,7 @@ pub(crate) fn release(this: Arc<Process>, _file: &Fil=
e) {
         if should_schedule {
             // Ignore failures to schedule to the workqueue. Those just me=
an that we're already
             // scheduled for execution.
-            let _ =3D workqueue::system().enqueue(this);
+            let _ =3D workqueue::system_percpu().enqueue(this);
         }
=20
         drop(binderfs_file);
@@ -1745,7 +1745,7 @@ pub(crate) fn flush(this: ArcBorrow<'_, Process>) -> =
Result {
         if should_schedule {
             // Ignore failures to schedule to the workqueue. Those just me=
an that we're already
             // scheduled for execution.
-            let _ =3D workqueue::system().enqueue(Arc::from(this));
+            let _ =3D workqueue::system_percpu().enqueue(Arc::from(this));
         }
         Ok(())
     }
diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion.r=
s
index 35ff049ff078..1771bfc0ade2 100644
--- a/rust/kernel/sync/completion.rs
+++ b/rust/kernel/sync/completion.rs
@@ -38,7 +38,7 @@
 ///             done <- Completion::new(),
 ///         }), GFP_KERNEL)?;
 ///
-///         let _ =3D workqueue::system().enqueue(this.clone());
+///         let _ =3D workqueue::system_dfl().enqueue(this.clone());
 ///
 ///         Ok(this)
 ///     }
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spin=
lock.rs
index aafc80125f59..92ad133262b6 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -450,7 +450,7 @@ fn run(this: Arc<Self>) {
     fn spinlock_irq_condvar() -> Result {
         let testdata =3D Test::new()?;
=20
-        let _ =3D workqueue::system().enqueue(testdata.clone());
+        let _ =3D workqueue::system_dfl().enqueue(testdata.clone());
=20
         // Let the updater know when we're ready to wait
         let mut state =3D testdata.state.lock();
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..a872f9fffb90 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -67,7 +67,7 @@
 //! /// This method will enqueue the struct for execution on the system wo=
rkqueue, where its value
 //! /// will be printed.
 //! fn print_later(val: Arc<MyStruct>) {
-//!     let _ =3D workqueue::system().enqueue(val);
+//!     let _ =3D workqueue::system_dfl().enqueue(val);
 //! }
 //! # print_later(MyStruct::new(42).unwrap());
 //! ```
@@ -121,11 +121,11 @@
 //! }
 //!
 //! fn print_1_later(val: Arc<MyStruct>) {
-//!     let _ =3D workqueue::system().enqueue::<Arc<MyStruct>, 1>(val);
+//!     let _ =3D workqueue::system_dfl().enqueue::<Arc<MyStruct>, 1>(val)=
;
 //! }
 //!
 //! fn print_2_later(val: Arc<MyStruct>) {
-//!     let _ =3D workqueue::system().enqueue::<Arc<MyStruct>, 2>(val);
+//!     let _ =3D workqueue::system_dfl().enqueue::<Arc<MyStruct>, 2>(val)=
;
 //! }
 //! # print_1_later(MyStruct::new(24, 25).unwrap());
 //! # print_2_later(MyStruct::new(41, 42).unwrap());
@@ -171,13 +171,13 @@
 //! /// This method will enqueue the struct for execution on the system wo=
rkqueue, where its value
 //! /// will be printed 12 jiffies later.
 //! fn print_later(val: Arc<MyStruct>) {
-//!     let _ =3D workqueue::system().enqueue_delayed(val, 12);
+//!     let _ =3D workqueue::system_dfl().enqueue_delayed(val, 12);
 //! }
 //!
 //! /// It is also possible to use the ordinary `enqueue` method together =
with `DelayedWork`. This
 //! /// is equivalent to calling `enqueue_delayed` with a delay of zero.
 //! fn print_now(val: Arc<MyStruct>) {
-//!     let _ =3D workqueue::system().enqueue(val);
+//!     let _ =3D workqueue::system_dfl().enqueue(val);
 //! }
 //! # print_later(MyStruct::new(42).unwrap());
 //! # print_now(MyStruct::new(42).unwrap());
@@ -1024,20 +1024,32 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID=
> for ARef<T>
 {
 }
=20
-/// Returns the system work queue (`system_wq`).
+/// Returns the system per-cpu work queue (`system_percpu_wq`).
 ///
 /// It is the one used by `schedule[_delayed]_work[_on]()`. Multi-CPU mult=
i-threaded. There are
 /// users which expect relatively short queue flush time.
 ///
 /// Callers shouldn't queue work items which can run for too long.
-pub fn system() -> &'static Queue {
-    // SAFETY: `system_wq` is a C global, always available.
-    unsafe { Queue::from_raw(bindings::system_wq) }
+#[inline]
+pub fn system_percpu() -> &'static Queue {
+    // SAFETY: `system_percpu_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_percpu_wq) }
+}
+
+/// Returns the system default (unbound) work queue (`system_dfl_wq`).
+///
+/// Workers are not bound to any specific CPU, not concurrency managed, an=
d all queued work items
+/// are executed immediately as long as `max_active` limit is not reached =
and resources are
+/// available.
+#[inline]
+pub fn system_dfl() -> &'static Queue {
+    // SAFETY: `system_dfl_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
 }
=20
 /// Returns the system high-priority work queue (`system_highpri_wq`).
 ///
-/// It is similar to the one returned by [`system`] but for work items whi=
ch require higher
+/// It is similar to the one returned by [`system_percpu`] but for work it=
ems which require higher
 /// scheduling priority.
 pub fn system_highpri() -> &'static Queue {
     // SAFETY: `system_highpri_wq` is a C global, always available.
@@ -1046,26 +1058,16 @@ pub fn system_highpri() -> &'static Queue {
=20
 /// Returns the system work queue for potentially long-running work items =
(`system_long_wq`).
 ///
-/// It is similar to the one returned by [`system`] but may host long runn=
ing work items. Queue
-/// flushing might take relatively long.
+/// It is similar to the one returned by [`system_percpu`] but may host lo=
ng running work items.
+/// Queue flushing might take relatively long.
 pub fn system_long() -> &'static Queue {
     // SAFETY: `system_long_wq` is a C global, always available.
     unsafe { Queue::from_raw(bindings::system_long_wq) }
 }
=20
-/// Returns the system unbound work queue (`system_unbound_wq`).
-///
-/// Workers are not bound to any specific CPU, not concurrency managed, an=
d all queued work items
-/// are executed immediately as long as `max_active` limit is not reached =
and resources are
-/// available.
-pub fn system_unbound() -> &'static Queue {
-    // SAFETY: `system_unbound_wq` is a C global, always available.
-    unsafe { Queue::from_raw(bindings::system_unbound_wq) }
-}
-
 /// Returns the system freezable work queue (`system_freezable_wq`).
 ///
-/// It is equivalent to the one returned by [`system`] except that it's fr=
eezable.
+/// It is equivalent to the one returned by [`system_percpu`] except that =
it's freezable.
 ///
 /// A freezable workqueue participates in the freeze phase of the system s=
uspend operations. Work
 /// items on the workqueue are drained and no new work item starts executi=
on until thawed.
@@ -1078,7 +1080,7 @@ pub fn system_freezable() -> &'static Queue {
 ///
 /// It is inclined towards saving power and is converted to "unbound" vari=
ants if the
 /// `workqueue.power_efficient` kernel parameter is specified; otherwise, =
it is similar to the one
-/// returned by [`system`].
+/// returned by [`system_percpu`].
 pub fn system_power_efficient() -> &'static Queue {
     // SAFETY: `system_power_efficient_wq` is a C global, always available=
.
     unsafe { Queue::from_raw(bindings::system_power_efficient_wq) }
@@ -1097,7 +1099,7 @@ pub fn system_freezable_power_efficient() -> &'static=
 Queue {
=20
 /// Returns the system bottom halves work queue (`system_bh_wq`).
 ///
-/// It is similar to the one returned by [`system`] but for work items whi=
ch
+/// It is similar to the one returned by [`system_percpu`] but for work it=
ems which
 /// need to run from a softirq context.
 pub fn system_bh() -> &'static Queue {
     // SAFETY: `system_bh_wq` is a C global, always available.

---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261013-rust-workqueue-system-fix-5f9020c90f27

Best regards,
--=20
Alice Ryhl <aliceryhl@google.com>

