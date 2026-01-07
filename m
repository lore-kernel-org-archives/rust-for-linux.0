Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BCD286405
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 08:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767774541; cv=none; b=udfd9I32JeJ6yD+ooE09UYmDsTq0RdnGqUjHRI+pWhvkJ93wLnNy6f8oLQgGGdyuxpZjyG1BxBAYbpgW9Oks449Dgylb+P2k+pFdgJlPdVO6x7m67iikLDiuOofNDxO/ErvHoEW/xI6wn4kMN7TRYZ4Djaw39rT+c01w2vi6PJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767774541; c=relaxed/simple;
	bh=i43UTuxPGA+uPunskL9vqTNqipNuBn7cdlDOEX/aJ7I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ilaI/4CROYHj4a/2TD5hiaAGMFp1BB2jdSBvOahXsJVvjjE8VFo/5fJJP8vHLYrUClkiJNoPCOCos0MS0FtepQmsltjStqSh8CUmg8NYbvFm8a3NuZWHtKfj3rsH1TFVFQRq73ZUc74+OR7Zg8UPkcBWPLv5A7WL0ZxNgDIkWM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QuLDsI8x; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QuLDsI8x"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b802843b0bbso198598166b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 00:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767774538; x=1768379338; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ykR1GboNgwnEMIKRL/1Y0EAnwg+24L8gNnjuc/K5lGk=;
        b=QuLDsI8x8Dp/Lxqw8CniBxpCPQlqjCgFn+BUXLk2yy70laCv4rvKAaa4O5jeH3mwc+
         4+QOIgkpB9ZqiTPClqvSOckkm5Jn1GVUvl8YTok67noz7LU8UAVLO5Aj5FGly5zWvH3k
         LiNQ35X2tlGxQXZUggM6GTOFDp2Q4kA+GTBxdTWUvBeYgejw+q8qwQM23y2hvR8rtx/Q
         pPBdzVBJy+N9FOIgIcwylCKqoHf6KGOH+J4bo7DeNSUbAkRty91jmAljLKPmUAdi0OHf
         OKtjPR2kZA6VNUI+eOG4V4Uuytj1h/+qaxHVCUWvAEL/U49dDZbL7ycGyk3FlBiT8GnA
         ks7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767774538; x=1768379338;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ykR1GboNgwnEMIKRL/1Y0EAnwg+24L8gNnjuc/K5lGk=;
        b=wvtRXAzpqTfB9RVc+WQynNwK1USlKftg0qF8MbIcb/qHOUHZvczb4N78RLVghNAMJL
         IpwvO+4n64arjl/fBeoW/9okBpmFg2fJLh05UmkrrtYUQaMdK7dU8cARBkprAJPyJvtn
         sISv9hYSlbio3lmmpRXMX1p/GLNlVsu3N4J1T3b+X0UwXSirEUUbyCPQ8BN7Tgc3r3Ra
         dvrmzeUWfe/ivDnL/2iMa7H2aS6tR2ZZ9J2orO2FmPESaHR8r7t+wV9ll0YNVS/awfwi
         2ezPWSpIIwcCAAAT7lNPcf3ilPHYf2weBImdKSvT/W9f3JwmPZR9+EnEp/6QTG/2YxWj
         SUhw==
X-Forwarded-Encrypted: i=1; AJvYcCV9XgehbotnGT2urNltsOjl+eWnPTh6onZ27tkld+nAe/q9VPuP16j70Qj2b0RGPXc/MDvv9RqCHP9wreLUwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvDEz18aUh9InfKjE/YozkK51eylCN+kbqFYCfkAb7SoAxZ1rz
	i8ZRHe0trutzCh5Cz+mQ9rilwzwi3oJ69F7aJuNrOEhQz8hPLN93ypNkwR7y9koGHrSbpBeeqGn
	3Hg16e+E5Jv/Ek3Ka5w==
X-Google-Smtp-Source: AGHT+IHgTcljIXElO3Qhde2aZBgeDKkhzG9PcR4IzSIACuSEXLi+nYVOGX6mp6olHxoGUz0TdJjmOYbe3O425co=
X-Received: from ejctz13.prod.google.com ([2002:a17:907:c78d:b0:b7f:ece0:4438])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:1c94:b0:b73:70db:4994 with SMTP id a640c23a62f3a-b844535ec0fmr168003266b.34.1767774538076;
 Wed, 07 Jan 2026 00:28:58 -0800 (PST)
Date: Wed, 07 Jan 2026 08:28:46 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD0ZXmkC/32NQQ6CMBBFr0Jm7RimRUFW3sOwqO1QGpGSFhsN4
 e5WDuDyveS/v0Lk4DhCW6wQOLno/JRBHArQg5osozOZQZTiRIIaXFR8oA3+NePIynBAVdNFkmZ
 zriTk3Ry4d++9eesyDy4uPnz2i0Q/+6+WCAmr/l6zNpVuZHm13tuRj9o/odu27QtB63tGswAAA A==
X-Change-Id: 20251218-task-group-leader-a71931ced643
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4613; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=i43UTuxPGA+uPunskL9vqTNqipNuBn7cdlDOEX/aJ7I=;
 b=kA0DAAoBBFi+7ljGOUYByyZiAGleGUSjABbot8qDXUEI8ODRubW83VKPl0eymapHnZRJWHQdd
 IkCMwQAAQoAHRYhBIOSopRNZAcK8Ui9sgRYvu5YxjlGBQJpXhlEAAoJEARYvu5YxjlGyRgQAKxn
 ojjOyMkrCXzRvRYP1zrd59l10I0k1zwwvnTwtJfN30/RZWK2o2wL8pVE3ohgMQ2UhfWlBk0nkZY
 ZGpsubEYIJVICdEElPhbWjSHAr3rC4tIRCwsn5ZhenpDnTmeJVeba3WxT0Risijql10oUPbpLBl
 cDsjjO+VC2QvQMVN9q2Q163GQJHOJAvbeGE1VNnPkVfDT0xN9VMyzx9WMwjrBu9ltWOSTTGUC+a
 U7L8Q+FS335lIbCgphzJQK5XerhH/JfqHqeF/Jj5YPA7p1jBxxivXtFLA0rjF00VniSyawRrEmC
 s9l4biqnrHeK7cc4GWF+8pwUdIVSG9ZUBqOgc5Kfv3Cb2hJD26SKG4+3bE7yI0T/kPn7edxQBAt
 UrW7VnJho1Efq6zRAsxzzy1KEkjfW/vttEi7wT0q1xxKRGBEMQ91zPdUMBnFbL8XUhad39nA/du
 7XBjLBAOo7+fIeGjIYGFDl18uk4f3msTcFxMbItYRFE9OEmfImup05tuemeqKWTkH0t2g8QOg/4
 9Y/wOO0xCCEtdKCIv+Do8MmjpzxtH47w2h5YS7CUJrp0fB6O0Qb2bNrl/2qY8Gzod8qf06x96zv
 M8syMC4lFWcnVwcTK87oltVCTRQzKXnLjtUi33RUAYk4AjZS2yja2SyCHPsmIA0elu07rmtizuj 3n0Qs
X-Mailer: b4 0.14.2
Message-ID: <20260107-task-group-leader-v2-1-8fbf816f2a2f@google.com>
Subject: [PATCH v2] rust: task: restrict Task::group_leader() to current
From: Alice Ryhl <aliceryhl@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Christian Brauner <brauner@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The Task::group_leader() method currently allows you to access the
group_leader() of any task, for example one you hold a refcount to. But
this is not safe in general since the group leader could change when a
task exits. See for example commit a15f37a40145c ("kernel/sys.c: fix the
racy usage of task_lock(tsk->group_leader) in sys_prlimit64() paths").

All existing users of Task::group_leader() call this method on current,
which is guaranteed running, so there's not an actual issue in Rust code
today. But to prevent code in the future from making this mistake,
restrict Task::group_leader() so that it can only be called on current.

There are some other cases where accessing task->group_leader is okay.
For example it can be safe if you hold tasklist_lock or rcu_read_lock().
However, only supporting current->group_leader is sufficient for all
in-tree Rust users of group_leader right now. Safe Rust functionality
for accessing it under rcu or while holding tasklist_lock may be added
in the future if required by any future Rust module.

This patch is a bugfix in that it prevents users of this API from
writing incorrect code. It doesn't change behavior of correct code.

Reported-by: Oleg Nesterov <oleg@redhat.com>
Closes: https://lore.kernel.org/all/aTLnV-5jlgfk1aRK@redhat.com/
Fixes: 313c4281bc9d ("rust: add basic `Task`")
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
The rust/kernel/task.rs file has had changes land through a few
different trees:

* Originally task.rs landed through Christian's tree together with
  file.rs and pid_namespace.rs
* The change to add CurrentTask landed through Andrew Morton's tree
  together with mm.rs
* There was a patch to mark some methods #[inline] that landed through
  tip via Boqun.

I don't think there's a clear owner for this file, so to break ambiguity
I'm doing to declare that this patch is intended for Andrew Morton's
tree. Please let me know if you think a different tree is appropriate.
---
Changes in v2:
- Update commit message re: bugfix
- Pick up Reviewed-by.
- Reword current.group_leader to current->group_leader in comment.
- Link to v1: https://lore.kernel.org/r/20251218-task-group-leader-v1-1-4fb7ecd4c830@google.com
---
 rust/kernel/task.rs | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 49fad6de06740a9b9ad80b2f4b430cc28cd134fa..cc907fb531bceea6e8dc1175d9350bd24780a3d5 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -204,18 +204,6 @@ pub fn as_ptr(&self) -> *mut bindings::task_struct {
         self.0.get()
     }
 
-    /// Returns the group leader of the given task.
-    pub fn group_leader(&self) -> &Task {
-        // SAFETY: The group leader of a task never changes after initialization, so reading this
-        // field is not a data race.
-        let ptr = unsafe { *ptr::addr_of!((*self.as_ptr()).group_leader) };
-
-        // SAFETY: The lifetime of the returned task reference is tied to the lifetime of `self`,
-        // and given that a task has a reference to its group leader, we know it must be valid for
-        // the lifetime of the returned task reference.
-        unsafe { &*ptr.cast() }
-    }
-
     /// Returns the PID of the given task.
     pub fn pid(&self) -> Pid {
         // SAFETY: The pid of a task never changes after initialization, so reading this field is
@@ -345,6 +333,18 @@ pub fn active_pid_ns(&self) -> Option<&PidNamespace> {
         // `release_task()` call.
         Some(unsafe { PidNamespace::from_ptr(active_ns) })
     }
+
+    /// Returns the group leader of the current task.
+    pub fn group_leader(&self) -> &Task {
+        // SAFETY: The group leader of a task never changes while the task is running, and `self`
+        // is the current task, which is guaranteed running.
+        let ptr = unsafe { (*self.as_ptr()).group_leader };
+
+        // SAFETY: `current->group_leader` stays valid for at least the duration in which `current`
+        // is running, and the signature of this function ensures that the returned `&Task` can
+        // only be used while `current` is still valid, thus still running.
+        unsafe { &*ptr.cast() }
+    }
 }
 
 // SAFETY: The type invariants guarantee that `Task` is always refcounted.

---
base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
change-id: 20251218-task-group-leader-a71931ced643

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

