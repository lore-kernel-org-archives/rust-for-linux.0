Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D439C51A759
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 22:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908246; cv=none; b=LqeQuq/Rz8CllQ+NJqtFGfIs115OhLotiz7ZFDITutba9kYlxDDM545J1dFUwAU6/K8pavwZe38E/l6NNAkMHhreSXkV/mgT9EwOHHiAe/fkeS2jlnLsXtCCpVFghzsLlRqEpz5DW3bdHKBDWSyrpICZCP55VV9kwx0tsRuGB8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908246; c=relaxed/simple;
	bh=6WXSA4nf0Fly4tunlt2IbwfTkbx9zucjFXABdBiGc2k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=klC9DxpM0gJOJBWTwzoLVd00K5LFIG6Nu7eM2VUNrLoQjv7ZZXi2totsyLkNxEjzjmqa8dLJqqyg4iYOzLr/D1gllDAageA5I9evQ9N0TC5EonD/edyLJjUW/wqrR/AhKDt3cq1bPJ8sCnRueJA61Ux6kHgWki4Tsatt5i1m2X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=W6XNsY74; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="W6XNsY74"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso3581296a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 15:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1788908244; x=1789513044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZHXZDGuTUHe9bZbvWR8znkC1eyqqIPnc5J8l+6ssveM=;
        b=W6XNsY74//mNX29gVRYMb7oDr2CwxwZfkucyS6O30IiBfuFvhD/IryjapIe2zQxc7w
         uQYZFfWKnRyh3R8gC7xWm+nD7FsciglKwKsYlxApADKC3F3mQOvfOQVcNHpw81RQ3UqV
         IWV2IPP715VDAbeY3NcPF+QK9XekY66ouLBcQcBTnQzEEDlHFaDCIgK+9F2PcESQIDFd
         1DaDSUo5czdHOq+RBgnlnbC9gLHwk7zAwSry68RL3AJdYXgmTIkgY2ORwJEXe1Jg1jSv
         TjWQTmKjtrg2lUV4cSX9e/GMuUUFXBEko/9PVJIJwBzBb+by+gI6UM4y+V49pQQ9F2GG
         gxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908244; x=1789513044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZHXZDGuTUHe9bZbvWR8znkC1eyqqIPnc5J8l+6ssveM=;
        b=ncXlPp/RplD/fyJ7DCe6cL0dYZ3/Yg9oq0n/P+boU62YqrjM0Qzp7OPE1G3lKc6kWV
         utmNKWL34VxhUa44g03o+PSepkLHE1NIAlcV1nWCiqBP3egii4/fdfn1LCuGybVB8fyJ
         Ut3AvE//3Nb4QO4DH7Jkz+gondALzvOKrpYoWUe+8FeL0x9iu8YNbw9F3UjzrMlfwy4f
         jSN5JE4I0gvnRnKwWaEPbaQWR0DstfzJE2mCH3iorjmA3/UmGOyVwRb16wF8uyK39OFb
         oJfntU7irfw26tDmG77g8+8U1FwOggsmuFTLI4DWqukr10lUNci+glNXbojrirvpLY35
         13Ug==
X-Forwarded-Encrypted: i=1; AKwUvBxdl6sDSTI8hTuAwOfsvuZWI6mgnCkOvjG3v5DWon4XM+5sZb4UNNb7VcvI8sBTRwk4Ve7N7QUz6nUJVV6kJQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lsadpepwB5q0ZvVJaTEBNDTIyfgap4rNp8OPsGYOb6Lh3U4aGF
	+Z860UpBb77aCGyP1ZxEM9dT5jH87dVF0lKTLh1Rfk3eVhEK2NxTzMf39DAxbMjZpUM=
X-Gm-Gg: AYBFou0kj8Bv2rWEFOLndJUFe93BPL7/RCxdCAsl4W6O+R/rR5wwtuI/o2CHKC/3GE9
	Ek3YsiJt42pfKsp8yRAXoHcSUAP1I0S+kpL6AIjd5GIH/1NzDspusX/bZnrXX/ao718e2YFi+pN
	iBM4FCRvyc1ABxC42dsZFTrqbe7aTVJ2NGhRcPxFteTmUlk7nXSvv5sL1bCW0akdiqSpM8tf0t2
	3SA3sYJJfRTuq4uYw/Ro14neHse5VICeF4Ky7h5QlBbz7hEyQebbXXDe2nEEuDeeXFvd8MLDE9u
	r/hNTqC32n0imutEqW6hN84HIYSyL/gs57Cv/YwfZ5AweOrCRnwOHggfXFAxYTBBeuHdT0IFmL/
	oMu+PCB6bXP93P/Q76tpcpRP79dyPegD1FMIXe2+IkeoDLaGHoBJvrxjF8Z5hCMJeQUKQdTe0Kg
	Ur5YPxFSbsIdkCY8Hqs9xPQuQ3BQWauwwHYUp54/X53x+B7OtVKGqWdr7DDbH6V9UM/EN1rmmYI
	jeRCeeS6bvIeVTl+CbYcz7GMA==
X-Received: by 2002:a05:6a21:6e97:b0:3d0:cc29:ff63 with SMTP id adf61e73a8af0-3da39ee15dcmr50629639637.12.1788908244323;
        Tue, 08 Sep 2026 15:57:24 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3369856a9f7sm19881462eec.5.2026.09.08.15.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 15:57:23 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Cc: ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 1/1] rust: io: Fix `Region::drop` trying to release nested resources from the wrong parent
Date: Tue,  8 Sep 2026 22:57:22 +0000
Message-Id: <a71c5593cfc66e21f24d9c07ae3469fc4f8ea501.1788901318.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1788901318.git.pgovind2@uci.edu>
References: <cover.1788901318.git.pgovind2@uci.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Io resource regions can be requested beneath a specified parent 
resource.
But `Region::drop` does not consider the parent resource.
It releases regions relative to the global resource root.
For nested regions, it may fail to find and release the child region.
This can lead to resource leaks and leaving the name pointer dangling.

Fix this by storing a reference to the parent resource in `Region`.
This ensures that the parent remains valid for the lifetime of the
child region.
The `Region::drop` implementation is updated to use the parent
resource when releasing the region.

Fixes: 493fc33ec252 ("rust: io: add resource abstraction")
Reported-by: Dylan Zueck<dzueck@uci.edu>
Assisted-by: ChatGPT:gpt-5.6-sol
Signed-off-by: Priya Bala Govindasamy<pgovind2@uci.edu>
---
 rust/kernel/io/mem.rs      |  4 ++--
 rust/kernel/io/resource.rs | 38 ++++++++++++++++++++------------------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
index 32a919099dcd..245d8e1e5e6c 100644
--- a/rust/kernel/io/mem.rs
+++ b/rust/kernel/io/mem.rs
@@ -173,7 +173,7 @@ pub struct ExclusiveIoMem<'a, const SIZE: usize> {
     /// range represented by the underlying `iomem`.
     ///
     /// This field is needed for ownership of the region.
-    _region: Region,
+    _region: Region<'a>,
 }
 
 impl<const SIZE: usize> ForLt for ExclusiveIoMem<'static, SIZE> {
@@ -191,7 +191,7 @@ unsafe impl<const SIZE: usize> CovariantForLt for ExclusiveIoMem<'static, SIZE>
 
 impl<'a, const SIZE: usize> ExclusiveIoMem<'a, SIZE> {
     /// Creates a new `ExclusiveIoMem` instance.
-    fn ioremap(dev: &'a Device<Bound>, resource: &Resource) -> Result<Self> {
+    fn ioremap(dev: &'a Device<Bound>, resource: &'a Resource) -> Result<Self> {
         let start = resource.start();
         let size = resource.size();
         let name = resource.name().unwrap_or_default();
diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
index 17b0c174cfc5..0a94a4eb3e7c 100644
--- a/rust/kernel/io/resource.rs
+++ b/rust/kernel/io/resource.rs
@@ -27,15 +27,19 @@
 ///
 /// - `self.0` points to a valid `bindings::resource` that was obtained through
 ///   `bindings::__request_region`.
-pub struct Region {
+pub struct Region<'a> {
     /// The resource returned when the region was requested.
     resource: NonNull<bindings::resource>,
+    /// Parent supplied to `__request_region`.
+    /// The reference also prevents a parent `Region` from being dropped
+    /// before this child.
+    parent: &'a Resource,
     /// The name that was passed in when the region was requested. We need to
     /// store it for ownership reasons.
     _name: CString,
 }
 
-impl Deref for Region {
+impl Deref for Region<'_> {
     type Target = Resource;
 
     fn deref(&self) -> &Self::Target {
@@ -44,31 +48,28 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
-impl Drop for Region {
+impl Drop for Region<'_> {
     fn drop(&mut self) {
-        let (flags, start, size) = {
+        let (start, size) = {
             let res = &**self;
-            (res.flags(), res.start(), res.size())
+            (res.start(), res.size())
         };
 
-        let release_fn = if flags.contains(Flags::IORESOURCE_MEM) {
-            bindings::release_mem_region
-        } else {
-            bindings::release_region
-        };
-
-        // SAFETY: Safe as per the invariant of `Region`.
-        unsafe { release_fn(start, size) };
+        // SAFETY:
+        // - `parent` is the resource passed to `__request_region`.
+        // - Its lifetime is tied to this `Region`, so it remains valid.
+        // - `start` and `size` identify the region owned by `self`.
+        unsafe { bindings::__release_region(self.parent.0.get(), start, size) };
     }
 }
 
 // SAFETY: `Region` only holds a pointer to a C `struct resource`, which is safe to be used from
 // any thread.
-unsafe impl Send for Region {}
+unsafe impl Send for Region<'_> {}
 
 // SAFETY: `Region` only holds a pointer to a C `struct resource`, references to which are
 // safe to be used from any thread.
-unsafe impl Sync for Region {}
+unsafe impl Sync for Region<'_> {}
 
 /// A resource abstraction.
 ///
@@ -98,13 +99,13 @@ impl Resource {
     /// Exclusive access will be given and the region will be marked as busy.
     /// Further calls to [`Self::request_region`] will return [`None`] if
     /// the region, or a part of it, is already in use.
-    pub fn request_region(
-        &self,
+    pub fn request_region<'a>(
+        &'a self,
         start: PhysAddr,
         size: ResourceSize,
         name: CString,
         flags: Flags,
-    ) -> Option<Region> {
+    ) -> Option<Region<'a>> {
         // SAFETY:
         // - Safe as per the invariant of `Resource`.
         // - `__request_region` will store a reference to the name, but that is
@@ -122,6 +123,7 @@ pub fn request_region(
 
         Some(Region {
             resource: NonNull::new(region)?,
+            parent: self,
             _name: name,
         })
     }
-- 
2.34.1

