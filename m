Received: from mail.tlmp.cc (unknown [148.135.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0C919EECA
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Sep 2024 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.135.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726753004; cv=none; b=T1flyTUGAel5j/EXXa4l8hBYwJEIxcM+9iDPlJdBRcPdOUt/1ZpfBrwUU/dFSteA+H9vgeMKO/Si4vrR/iPDa3eHmQlOqxihJ8HK2v3SJovxGLT7Gmzv8SXIhhdf0QBjgesSrdhCrVx5OxC7VpzSweT62ttc1O8ROS9o+Ug0HQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726753004; c=relaxed/simple;
	bh=7s7z8s8PYFj605b0pz69iQfPrDeoExUDO/ymT/8WqlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZWNE1HgZB59xSWBDVQwlPpsJ9OECCUDj8hXWo/W/42d3R8F96MjUJKSBpkPvpJj0nbVFVRO8saNBfc2EIR6847yZGVeUeWPZZQmxR2isUGXpTspsn3jwfoplsMWiB4hwJjiytRwX+MezQTRohHcNp9WdjqrXMwljOckHt2caLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tlmp.cc; spf=pass smtp.mailfrom=tlmp.cc; dkim=pass (2048-bit key) header.d=tlmp.cc header.i=@tlmp.cc header.b=ds5d3rFk; arc=none smtp.client-ip=148.135.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tlmp.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tlmp.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tlmp.cc header.i=@tlmp.cc header.b="ds5d3rFk"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1FE069951;
	Thu, 19 Sep 2024 09:36:31 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tlmp.cc; s=dkim;
	t=1726752992; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=kqk81g7cDt96LcsILwVIIivCeMHJdyCwfxcWpXlbjK8=;
	b=ds5d3rFknXs4NhwDc+/IHbaTjQp0IxNSle/sb3o2+qM8LVhhkvZV2yxQB7JCNiKK8LrKGc
	+YBOvfq5vzfyG7K73cZJNFCjNfoc9347pCcsEShQcm7qUrIdGX97lME3/zbWtve8c3L6z7
	nQvR4TfojLHohk5ZG9E8oZGzuJQAqxIgxpO/Sr7COzJjoxhm3gTfUo9Ina2pWud5S+DLCK
	G/eUhIZ/xdaS5H5EnhL3tJVbDWFK5CcPD7EtT9hlFeubRK71VyIev5dXh1RwHXXr6RbZ5B
	ig7dQjjbA/rWMgyMDGJUrdqVUL1bL+Hr3H/Jxaid91y53P8P6mrqg/d1pY88NA==
From: Yiyang Wu <toolmanp@tlmp.cc>
To: rust-for-linux@vger.kernel.org
Cc: Yiyang Wu <toolmanp@tlmp.cc>
Subject: [PATCH 1/1] rust: error: auto-generate error declarations
Date: Thu, 19 Sep 2024 21:35:45 +0800
Message-ID: <20240919133545.942223-2-toolmanp@tlmp.cc>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919133545.942223-1-toolmanp@tlmp.cc>
References: <20240919133545.942223-1-toolmanp@tlmp.cc>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This patch adds a new cmd_errno to convert the include/linux/errno.h
content into declare_err! macros for better maintainability and readability.

Signed-off-by: Yiyang Wu <toolmanp@tlmp.cc>
---
 rust/.gitignore      |  1 +
 rust/Makefile        | 14 ++++++++++-
 rust/kernel/error.rs | 58 +++-----------------------------------------
 3 files changed, 18 insertions(+), 55 deletions(-)

diff --git a/rust/.gitignore b/rust/.gitignore
index d3829ffab80b..ba71ef4a9239 100644
--- a/rust/.gitignore
+++ b/rust/.gitignore
@@ -5,6 +5,7 @@ bindings_helpers_generated.rs
 doctests_kernel_generated.rs
 doctests_kernel_generated_kunit.c
 uapi_generated.rs
+errno_generated.rs
 exports_*_generated.h
 doc/
 test/
diff --git a/rust/Makefile b/rust/Makefile
index dd76dc27d666..f5a1680fe59c 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -22,6 +22,8 @@ always-$(CONFIG_RUST) += exports_alloc_generated.h exports_helpers_generated.h \
 always-$(CONFIG_RUST) += uapi/uapi_generated.rs
 obj-$(CONFIG_RUST) += uapi.o
 
+always-$(CONFIG_RUST) += kernel/errno_generated.rs
+
 ifdef CONFIG_RUST_BUILD_ASSERT_ALLOW
 obj-$(CONFIG_RUST) += build_error.o
 else
@@ -289,6 +291,15 @@ $(obj)/uapi/uapi_generated.rs: $(src)/uapi/uapi_helper.h \
     $(src)/bindgen_parameters FORCE
 	$(call if_changed_dep,bindgen)
 
+quiet_cmd_errno = EXPORTS $@
+      cmd_errno = \
+	$(CC) $(c_flags) -E -CC -dD $< \
+	| sed -E 's/\#define\s*([A-Z0-9]+)\s+([0-9]+)\s+\/\*\s*(.*)\s\*\//declare_err!(\1, "\3.");/' \
+	| grep -E '^declare_err.*$$' > $@
+
+$(obj)/kernel/errno_generated.rs: $(srctree)/include/linux/errno.h FORCE
+	$(call if_changed,errno)
+
 # See `CFLAGS_REMOVE_helpers.o` above. In addition, Clang on C does not warn
 # with `-Wmissing-declarations` (unlike GCC), so it is not strictly needed here
 # given it is `libclang`; but for consistency, future Clang changes and/or
@@ -420,7 +431,8 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
 
 $(obj)/kernel.o: private rustc_target_flags = --extern alloc \
     --extern build_error --extern macros --extern bindings --extern uapi
-$(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.o \
+$(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/kernel/errno_generated.rs \
+    $(obj)/alloc.o $(obj)/build_error.o \
     $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 6f1587a2524e..bb16b40a8d19 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -23,60 +23,10 @@ macro_rules! declare_err {
             pub const $err: super::Error = super::Error(-(crate::bindings::$err as i32));
         };
     }
-
-    declare_err!(EPERM, "Operation not permitted.");
-    declare_err!(ENOENT, "No such file or directory.");
-    declare_err!(ESRCH, "No such process.");
-    declare_err!(EINTR, "Interrupted system call.");
-    declare_err!(EIO, "I/O error.");
-    declare_err!(ENXIO, "No such device or address.");
-    declare_err!(E2BIG, "Argument list too long.");
-    declare_err!(ENOEXEC, "Exec format error.");
-    declare_err!(EBADF, "Bad file number.");
-    declare_err!(ECHILD, "No child processes.");
-    declare_err!(EAGAIN, "Try again.");
-    declare_err!(ENOMEM, "Out of memory.");
-    declare_err!(EACCES, "Permission denied.");
-    declare_err!(EFAULT, "Bad address.");
-    declare_err!(ENOTBLK, "Block device required.");
-    declare_err!(EBUSY, "Device or resource busy.");
-    declare_err!(EEXIST, "File exists.");
-    declare_err!(EXDEV, "Cross-device link.");
-    declare_err!(ENODEV, "No such device.");
-    declare_err!(ENOTDIR, "Not a directory.");
-    declare_err!(EISDIR, "Is a directory.");
-    declare_err!(EINVAL, "Invalid argument.");
-    declare_err!(ENFILE, "File table overflow.");
-    declare_err!(EMFILE, "Too many open files.");
-    declare_err!(ENOTTY, "Not a typewriter.");
-    declare_err!(ETXTBSY, "Text file busy.");
-    declare_err!(EFBIG, "File too large.");
-    declare_err!(ENOSPC, "No space left on device.");
-    declare_err!(ESPIPE, "Illegal seek.");
-    declare_err!(EROFS, "Read-only file system.");
-    declare_err!(EMLINK, "Too many links.");
-    declare_err!(EPIPE, "Broken pipe.");
-    declare_err!(EDOM, "Math argument out of domain of func.");
-    declare_err!(ERANGE, "Math result not representable.");
-    declare_err!(ERESTARTSYS, "Restart the system call.");
-    declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
-    declare_err!(ERESTARTNOHAND, "Restart if no handler.");
-    declare_err!(ENOIOCTLCMD, "No ioctl command.");
-    declare_err!(ERESTART_RESTARTBLOCK, "Restart by calling sys_restart_syscall.");
-    declare_err!(EPROBE_DEFER, "Driver requests probe retry.");
-    declare_err!(EOPENSTALE, "Open found a stale dentry.");
-    declare_err!(ENOPARAM, "Parameter not supported.");
-    declare_err!(EBADHANDLE, "Illegal NFS file handle.");
-    declare_err!(ENOTSYNC, "Update synchronization mismatch.");
-    declare_err!(EBADCOOKIE, "Cookie is stale.");
-    declare_err!(ENOTSUPP, "Operation is not supported.");
-    declare_err!(ETOOSMALL, "Buffer or request is too small.");
-    declare_err!(ESERVERFAULT, "An untranslatable error occurred.");
-    declare_err!(EBADTYPE, "Type not supported by server.");
-    declare_err!(EJUKEBOX, "Request initiated, but will not complete before timeout.");
-    declare_err!(EIOCBQUEUED, "iocb queued, will get completion event.");
-    declare_err!(ERECALLCONFLICT, "Conflict with recalled state.");
-    declare_err!(ENOGRACE, "NFS file lock reclaim refused.");
+    include!(concat!(
+        env!("OBJTREE"),
+        "/rust/kernel/errno_generated.rs"
+    ));
 }
 
 /// Generic integer kernel error.
-- 
2.46.0

