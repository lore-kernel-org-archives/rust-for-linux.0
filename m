Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0CD3321B1
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 09:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244164; cv=none; b=sHcj1ULfrBeNJQ0f1CPNfg3GrBTmmr6xSW8Xil6nkQfGIytQDRXHNf8SHZV++v3mvaZc/FT9W+7TQPaah9pj65Lt2IETe00JH/IqZvNeY7dI0Taj3Lq9hiB7kr8+0tqDfJoxwFWvNtu12qRFjLWs7F1PQwOtRy23iB4wp0Fdic4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244164; c=relaxed/simple;
	bh=ubBzsvdvi4CPPSq8r6r63vK+XNzjHX2CU/Xs07mhl4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nv2YBmgl+X36XH3t7MGwi6Pz8USUQvS17HPg4rsySJrlx0OGRHqGSGJqss/l8R61orByoXFj/aLJNUFZpgU7JHVO2+8Y90xD8naAXpmeIxtE+HQXhn3t/LmY3nXyNk4F8XaBsqho05dfWVjsJX/pq/ID0qEE0Z8QxJtfl30Thrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=A0keWuRI; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="A0keWuRI"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c79467f128cso974460a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 02:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1776244162; x=1776848962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sT90Da8dxnzlMMkK3ArmGE7gcm3zpo3Cwr+6iFpQpk=;
        b=A0keWuRIsJxgGzsyA/DFNLpYSJoNQRyAHQXS9HgKMKIkySBA/TWm1AFBifCpuNHm+X
         BobZAiur5c8Pr9vlIXqcNEttlb5s5VMgTWn9bNtX1oKT0gcMcVPTcaVD9c8AOyWnWK5u
         dmPhUqNmBYz6cojD7uLLKndPyGn/TGFEYWWDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244162; x=1776848962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0sT90Da8dxnzlMMkK3ArmGE7gcm3zpo3Cwr+6iFpQpk=;
        b=CGUHrUcZ2PTmrE66CKzaYkrLNz+8kkkeGtcS4FbBLSLRSJSFNsejA6NDYzwbv8iwT+
         902x4g7HFTtUzQGHjUJuvcuYiZ7R3fJAtWQQ8hRhfqnx4rN9COsUyFG84fQUdrPUXDqj
         d5aoxhWJeMy0fY2CjkgBmHkHu4EeDedNpVGPiFJf4MK3bjsh/AAUIVV6mmM+uaQtnrVt
         IN1o3AzqbuKRiihMt3D/QY2lZ1KCMw8D5c34HstbuCHQLNfHbvcB89ThjUhJM7iuDQm3
         wXT7suzug5MW3+V0DE1VEYpjgbg2lDF4tdyrrBWc1/gqfarzINBm5AF7AYF3YiSgVZJT
         Drqw==
X-Forwarded-Encrypted: i=1; AFNElJ+oQho2NAXkbVS+uyHQ/tIFcS7CJxHczXdkeJZSaN0NdVBvy/8iein0rp0SMBkcP3DqkEHB+ZZcg5CXKYSphw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC2PGS0LbImtxjg9mCwDtZSrXMwqhLIQkCs8XJNltJn/XXBk1Y
	60i/YJL57YV9NksOoy4iPhCBkTDfn5rMC7GJCC8xHeMVZLPMPSJ7e7mr8IiXi/JghRQ=
X-Gm-Gg: AeBDiev3CcgFG2o5yuy1V9gVbKRlQU6QWQVqzWftmXjM0rJS/LWIry8sfhDt9Wxblqm
	UihbEgWTBFs0QLnCFXhX22aEMvgtyjWq4EKLo4WXT1YmRpzAkFQppNjnKtZXzvvNGnq5NAjL8vh
	jRX01txZ9n4y4ZSoWpGbhdW56wbGi/C8TWU7Vdowyw17vZXKFIXD2QkuKVuIy9izn7d/ibhztZg
	37xsS5IF8EV6NC3D2UT9SViXtZTVqwOPceQy1bS5lxjIW6XObV4ZMg0FJGZS8R7I3bfU0c+NnZz
	dcPsgSKZbppfbPLS3URqjeVxnbQq0zgyucptvNUHt5ub+4mfy5OR+yLQTdXiwzb6QvgUjslib+3
	87bDkPVZhxB0dTTkNPPk6iugu1h+8unBp1qK+qiuxiknyjOnlCyU632CKocb12XKq2AOWnyVENQ
	NJ04A002wbuGWgd10Qb7lSvMFiVRQVCjEzGypXCBQHCcSzL+19TBXSvFsph48=
X-Received: by 2002:a05:6a20:6a2c:b0:39c:4b84:d90f with SMTP id adf61e73a8af0-39fe3c6796emr22382238637.8.1776244161341;
        Wed, 15 Apr 2026 02:09:21 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7957ecee24sm1074619a12.1.2026.04.15.02.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 02:09:21 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Jens Axboe <axboe@kernel.dk>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v5 4/4] samples: rust: Add `uring_cmd` example to `rust_misc_device`
Date: Wed, 15 Apr 2026 09:02:15 +0000
Message-ID: <20260415090851.4897-5-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415090851.4897-1-sidong.yang@furiosa.ai>
References: <20260415090851.4897-1-sidong.yang@furiosa.ai>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the rust_misc_device sample to demonstrate uring_cmd handling.

The example completes asynchronously using a workqueue combined with
complete_in_task(), showing the full async completion flow:
IoUringCmd -> queue() -> workqueue -> complete_in_task() ->
task_work -> done().

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 samples/rust/rust_misc_device.rs | 62 +++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index 87a1fe63533a..4059348a56ad 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -98,13 +98,15 @@
 use kernel::{
     device::Device,
     fs::{File, Kiocb},
+    io_uring::{self, IoUringCmd, IoUringTaskWork, QueuedIoUringCmd, UringCmdAction},
     ioctl::{_IO, _IOC_SIZE, _IOR, _IOW},
     iov::{IovIterDest, IovIterSource},
     miscdevice::{MiscDevice, MiscDeviceOptions, MiscDeviceRegistration},
     new_mutex,
     prelude::*,
-    sync::{aref::ARef, Mutex},
+    sync::{Arc, aref::ARef, Mutex},
     uaccess::{UserSlice, UserSliceReader, UserSliceWriter},
+    workqueue::{impl_has_work, new_work, HasWork},
 };
 
 const RUST_MISC_DEV_HELLO: u32 = _IO('|' as u32, 0x80);
@@ -151,6 +153,51 @@ struct RustMiscDevice {
     dev: ARef<Device>,
 }
 
+#[pin_data]
+struct IoUringCmdWork {
+    #[pin]
+    ioucmd: Mutex<Option<QueuedIoUringCmd>>,
+    #[pin]
+    work: kernel::workqueue::Work<IoUringCmdWork>,
+}
+
+impl_has_work! {
+    impl HasWork<Self> for IoUringCmdWork { self.work }
+}
+
+/// Task-work completion handler for the sample device.
+struct RustMiscDeviceCompletion;
+
+impl IoUringTaskWork for RustMiscDeviceCompletion {
+    fn task_work(cmd: QueuedIoUringCmd) {
+        cmd.done(Ok(0), 0, io_uring::TASK_WORK_ISSUE_FLAGS);
+    }
+}
+
+impl kernel::workqueue::WorkItem for IoUringCmdWork {
+    type Pointer = Arc<IoUringCmdWork>;
+
+    fn run(work: Arc<IoUringCmdWork>) {
+        pr_info!("IoUringCmdWork::run()");
+
+        if let Some(ioucmd) = work.ioucmd.lock().take() {
+            ioucmd.complete_in_task::<RustMiscDeviceCompletion>();
+        }
+    }
+}
+
+impl IoUringCmdWork {
+    fn new(ioucmd: QueuedIoUringCmd) -> Result<Arc<Self>> {
+        Arc::pin_init(
+            pin_init!(Self {
+                ioucmd <- new_mutex!(Some(ioucmd)),
+                work <- new_work!("IoUringCmdWork::work"),
+            }),
+            GFP_KERNEL,
+        )
+    }
+}
+
 #[vtable]
 impl MiscDevice for RustMiscDevice {
     type Ptr = Pin<KBox<Self>>;
@@ -220,6 +267,19 @@ fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result
 
         Ok(0)
     }
+
+    fn uring_cmd(
+        me: Pin<&RustMiscDevice>,
+        ioucmd: IoUringCmd,
+        _issue_flags: u32,
+    ) -> Result<UringCmdAction> {
+        dev_info!(me.dev, "UringCmd Rust Misc Device Sample\n");
+
+        let (action, queued_ioucmd) = ioucmd.queue();
+        let work = IoUringCmdWork::new(queued_ioucmd)?;
+        let _ = kernel::workqueue::system().enqueue(work);
+        Ok(action)
+    }
 }
 
 #[pinned_drop]
-- 
2.43.0

