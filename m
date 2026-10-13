Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB743DAADE
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 13:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899513; cv=none; b=ZHhUVxkYb6spj+WyGVsb+uWdOQtKlT98ah/IgcUVMJ0IgSBVkojGkKvnxNol2Hcai2gV2ZWg64DL9992BJIdoeK1+WDKqKpkqYDfJvhC/KmHWfjg2SGgrkXLdzSywhyMDpTysWsWG3loO3tgm5uQ7fRiSQTDzilEVfNSrKl7si8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899513; c=relaxed/simple;
	bh=94xdzAdqmTcNDnqCnYQoZftsBfIKPxXWy9vfhv98mig=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=UaUA8HtAUITyuCcBiY73tfu+RxWXCLaydf0cEfFuku7s7dyqZq+DmvSb0TPM2xRggUJe2A1oUt7schd1TZbPqpOVhAQfWe9CFvleK1FnDDLsS9s9xrXwSFB53RqJzmUYUSGgJ/Elmo1JxC1e/ZtOaDhYZ5peOdCDv1tnYfgdAjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Itp1PWg0; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Itp1PWg0"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so21074105e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 06:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791899510; x=1792504310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+4ac5uAtujNj2oC8ZsR4vWUeUoBZq8i4UhxrarlKp8g=;
        b=Itp1PWg0WSlPv8GGQavISGjAnWx0Qu1Ht/O9FKM1XeCTTta76fFQQt34QlwcC2Dl/+
         f0gQYsvYdARgEcx6FUZWt5i1jJIBfmTTSso95S8cRnC6pNJThyQJzhJsZIIU+JAMDoaK
         XJrdNUDUIzx8JJUpLjLHkn/YIj8ahZGgyPvf1pitAGZxN0XPO7+NgtyRKHoZ6S0sPFuU
         Nm8dbNBrL0zJleoEsYanJK7JPTRiaZPcUkBeNtj6hrw1Vi51H8Eoi4Ihzq6Z6JY43Y5R
         LZzwlBwqXfot/1KA3D7IzpVCci+xFw5kJYEOL7XidZ6ziT/fKJ88p6nr9x4MSfXe1g7K
         O7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791899510; x=1792504310;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4ac5uAtujNj2oC8ZsR4vWUeUoBZq8i4UhxrarlKp8g=;
        b=lEge5C5gTpAA/oNDjNl6djNT72zwc4I2xMTnIF3dBuBXBF9ls1yxeCvznyIAMiVI8K
         cBUcOtfOBvpetWV8XtGdIOQQkHiX6TF8r5GsHcxX7ViXPu4x3KVHb8lKthMrS1AOxwGb
         1RLmTQ16fRlBIBx2JDzGwRklh7h0jzLwdrZU4cmnEWjaR3ZpX5xNi8N0dmz78wmkTpEN
         ZjNdGaStC4MjNBNorXuTiTz3FTpUoiRFvroMmruPCie+0v2EOTD5NTkuLRbD25etfEam
         bYN7QnEbYF81etX8q1dEbHGp7WJqJvnLejGFCukxfbRcdep2RzXLpp7IHYnIQQKBpHL1
         4U0w==
X-Forwarded-Encrypted: i=1; AKwUvBxIPgHxWeKJ1KT4/rLTwCoDTY96p38rA2L18C/1e94LifRzPnrwXAnaYhDGquz4IyZdRBA2+Gptc6wcdIXi4w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJWOCUYkh5uW9kNdVsRiLwzpimH5YXHoyt0slC5ozgtVa/SJ6l+
	FTEQtaLw88gtvBYp6kbfRpR9BbJga2B/2pgh81OFPVIeIsDO80w/hhJtfG9EAey4sItioKuiiDv
	CgoykoQonOe81s8dPlQ==
X-Received: from wrse13.prod.google.com ([2002:adf:fc4d:0:b0:487:250d:f1fd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1549:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a18e491051mr277806475e9.17.1791899509181;
 Tue, 13 Oct 2026 06:51:49 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:51:39 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGo3zmoC/x2MQQqDQAwAvyI5G8husUW/Ih5EszYUtU1cq4h/d
 /E4AzMHGKuwQZUdoLyKyTwlcHkG3budBkbpE4Mn/3TkHqjRFvzP+vlFjoy228IjBtmwCCV56ko K/gWp/yonfb/r5jwvN7CtnmsAAAA=
X-Change-Id: 20261013-rust-workqueue-system-fix-5f9020c90f27
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=10746; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=alrqA/CVVOMB2yKcbr8/hmwu2HveTok6+GRqc66yhCI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqzjdztXvrDSh3+7O+nOME2qMSaUbe86TyTNCHV
 wgDCiFtFwiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCas43cwAKCRAEWL7uWMY5
 RsgvEACTeKOgKbZ3lpTsSmNK1LW/T74TAuejSfba8H8q3w0XO1TTTxOWvw1IAKMha6kFoa1C1sU
 PYCxNdWPjp33+2Hcb8LK1XrglPGyTGTTbmwz9zdbclcR6oJXcmUnOa+v8Yt9YTlCGjX7tBESyJa
 dakiH21HfoXcVFAJv3DPREAWzW/PQWwqGNx7Dc4zQoYPinId8PPzKgSIcbQhtW8p5DeDd31fgDF
 QJ02JcnbIeiWouvRpzwxZ3EZBNMVal4Ap/GkBZUZmZ6JID/2SbfWbT9yvJNaLYTrgvGd+zpDauG
 inslaDfbvetKcxhuXW+vJ7mVZvgwKbEctpXY5s14178xZcgPPnWUMMKYUxjhcuqNCK5jqYLgFX1
 o3Nq/lf/ex9b4kEyWvpQhZBMSwvllvTgUc9Td76ZTuPPM74pGCMc8snkWrfwlQy0Pp8ADmio5ZW
 4Qd05W/kY36ZvFMwiVjSccFd4CCX1lOGlc+Y4LaxJZCoewnlbAgZaPcnU2hsmLrm+lStqYfLFWd
 /AdCA5qbVB/f3pXBAIsTTGMOuYWc8CUwwM5G1C1lAaYSqMTHKMEzWhhe/ljzwEtkRMmMwzi5Hjg
 pQwWxiZflW5Z6R/EQCkY3TdOE6yqtOJcBJnbl4j7ESlI+P+ey30YIH0SQM6+6I8AxIdMMyT0AgH CWqe2sWw3It96Vw==
X-Mailer: b4 0.14.3
Message-ID: <20261013-rust-workqueue-system-fix-v1-1-e9ec616e402b@google.com>
Subject: [PATCH] rust: workqueue: replace deprecated system_wq with system_{percpu,dfl}_wq
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

Fixes: 64d8eae3f895 ("workqueue: Add warnings and fallback if system_{unbou=
nd}_wq is used")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
This patch was previously sent as part of other workqueue series [1][2].
However it's a fix that is independent of those series, so it's sent on
its own here.

[1] https://lore.kernel.org/all/20260726223613.1242940-3-dakr@kernel.org
[2] https://lore.kernel.org/all/20260807165252.3849875-2-dakr@kernel.org

Changes since [2]:
  - Rebase on v7.3-rc7 and also convert the new SpinLockIrq KUnit test,
    which calls workqueue::system() and otherwise fails to build.
  - Add Fixes: tag for the commit that made system_wq warn.
  - Collect Reviewed-by from Daniel.
---
 Documentation/rust/testing.rst                    |  2 +-
 Documentation/translations/zh_CN/rust/testing.rst |  2 +-
 drivers/android/binder/process.rs                 |  4 +--
 rust/kernel/sync/completion.rs                    |  2 +-
 rust/kernel/sync/lock/spinlock.rs                 |  2 +-
 rust/kernel/workqueue.rs                          | 42 +++++++++++++++----=
----
 6 files changed, 33 insertions(+), 21 deletions(-)

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
index 7e253b6f299c..7bc07ccd1ebb 100644
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
@@ -1046,8 +1058,8 @@ pub fn system_highpri() -> &'static Queue {
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
@@ -1065,7 +1077,7 @@ pub fn system_unbound() -> &'static Queue {
=20
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
@@ -1078,7 +1090,7 @@ pub fn system_freezable() -> &'static Queue {
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
@@ -1097,7 +1109,7 @@ pub fn system_freezable_power_efficient() -> &'static=
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

