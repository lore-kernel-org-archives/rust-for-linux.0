Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9510D386C03
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 06:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774508153; cv=none; b=gzSQW3xpenvXojC1xLCcAEhsC7vklLTnP9eXpQcvX5MBz7vXEQXkTGiVlxyW0AfA9+21rfnehhuK7LtmipgaKORew4XlD2+f3SsPQ+XnNoQj/+YehUl7w35/i8kZJ/w4Wl+yBaLxVLeOSC1CwLjIvcZp3UqrrXVRJoWh2O/ZDnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774508153; c=relaxed/simple;
	bh=hWACJCm7r53Q5H75gEfnyAgJvlWtpnUUVTZ+Hp4P0UA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MhIBFlCDHIkaKjnKx4CeWmJRySCVTuS3LmM0/ZwglUVKHU2ihAtnlDyCmGE21ER5Xjf1x1g11rJBpPuy2vkt6C2PILOV80Q7Pbj0vnSfz17xMwd4nHCbn+/GeiJX8I5BDcJ7FgOX51inxSoZtXJ34Hg1mNH/Hb0J6O6qi/+N5aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G8D7t3kj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G8D7t3kj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72235C116C6;
	Thu, 26 Mar 2026 06:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1774508153; bh=hWACJCm7r53Q5H75gEfnyAgJvlWtpnUUVTZ+Hp4P0UA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G8D7t3kjzNkejxIUES4VLYx8z7kTxcEfJDp7o7HL0E/9Ld5rvo0T6nYSRZfr46v9M
	 vcL+wB/Dq1aLGQW5sd1BJFweb+iM4bANowOem4cxlzjxFu4Q4kvMmKNaTRZRxBsohi
	 r4NviyE94U8ryyqGlZBcd5O4jqpTugQJ7KxjaaaI=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EDF109E55C;
	Thu, 26 Mar 2026 06:55:53 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Thu, 26 Mar 2026 14:53:06 +0800
Subject: [PATCH 13/13] drm/tyr: add gems field and gems debugfs interface
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-tyr-debugfs-v1-13-074badd18716@linux.dev>
References: <20260326-b4-tyr-debugfs-v1-0-074badd18716@linux.dev>
In-Reply-To: <20260326-b4-tyr-debugfs-v1-0-074badd18716@linux.dev>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774508149; l=5720;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=hWACJCm7r53Q5H75gEfnyAgJvlWtpnUUVTZ+Hp4P0UA=;
 b=0I8NGYZ+GgIfjLLOjMIVyxirZSdCsbl0gM2HJO9plD9V5+oU5EzUqN8c5xXagNpoPcXRgLxgn
 KDIcTa9dM39DuYCrwUsHXrWBntiXJ26ZbFLP8uOrgP8PR0xwvQlKe+D
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Add gems field to TyrDebugFSData; populate gems in Firmware::new and
register gems read-only file under debugfs per-device directory.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 drivers/gpu/drm/tyr/debugfs.rs | 93 +++++++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/tyr/driver.rs  | 10 +++--
 drivers/gpu/drm/tyr/fw.rs      |  2 +
 3 files changed, 101 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tyr/debugfs.rs b/drivers/gpu/drm/tyr/debugfs.rs
index edbdb83a5b132..d0e9e268aeac2 100644
--- a/drivers/gpu/drm/tyr/debugfs.rs
+++ b/drivers/gpu/drm/tyr/debugfs.rs
@@ -8,14 +8,19 @@
     debugfs,
     device::Core,
     drm,
-    drm::gem::IntoGEMObject,
+    drm::gem::{
+        BaseObject,
+        IntoGEMObject, //
+    },
     fmt,
     fmt::Write,
+    impl_flags,
     platform,
     prelude::*,
     revocable::LazyRevocable,
     str::CString,
     sync::{
+        aref::ARef,
         hazptr::HazptrCtx,
         Arc,
         ArcBorrow,
@@ -24,15 +29,100 @@
 };
 
 use crate::driver::TyrDrmDriver;
+use crate::gem::Bo;
 use crate::vm::Vm;
 
 pub(crate) static DEBUGFS_ROOT: LazyRevocable<debugfs::Dir> = LazyRevocable::new();
 
+impl_flags!(
+    #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
+    struct BoStateFlags(u32);
+
+    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
+    enum BoStateFlag {
+        Imported = 1 << 0,
+        Exported = 1 << 1,
+    }
+);
+
+/// Writes per-BO debug information for the "gems" debugfs file.
+fn show_bo(bo: &Bo, f: &mut impl Write) -> core::fmt::Result {
+    let name: i32 = bo.name();
+    let refcount: u32 = bo.refcount();
+    let size: usize = bo.size();
+    let resident_size: usize = bo.resident_size();
+    let mmap_offset = bo.mmap_offset();
+    let mut gem_state_flags = BoStateFlags::default();
+
+    if bo.is_imported() {
+        gem_state_flags |= BoStateFlag::Imported;
+    }
+    if bo.is_exported() {
+        gem_state_flags |= BoStateFlag::Exported;
+    }
+
+    writeln!(
+        f,
+        "{:<16}{:<16}{:<16}{:<16}0x{:<16x}0x{:<8x}",
+        name,
+        refcount,
+        size,
+        resident_size,
+        mmap_offset,
+        u32::from(gem_state_flags),
+    )
+}
+
+fn show_gems(data: &Arc<TyrDebugFSData>, f: &mut fmt::Formatter<'_>) -> core::fmt::Result {
+    writeln!(
+        f,
+        "GEM state flags: {:?} (0x{:x}), {:?} (0x{:x})",
+        BoStateFlag::Imported,
+        BoStateFlag::Imported as u32,
+        BoStateFlag::Exported,
+        BoStateFlag::Exported as u32,
+    )?;
+    writeln!(
+        f,
+        "global-name     refcount        size            resident-size   file-offset       state",
+    )?;
+    writeln!(
+        f,
+        "--------------------------------------------------------------------------------------------",
+    )?;
+
+    let mut total_size: usize = 0;
+    let mut total_resident: usize = 0;
+    let mut total_reclaimable: usize = 0;
+    let gems = data.gems.lock();
+    for bo in gems.iter() {
+        total_size += bo.size();
+        total_resident += bo.resident_size();
+        if bo.madv() > 0 {
+            total_reclaimable += bo.resident_size();
+        }
+        show_bo(bo, f)?;
+    }
+
+    writeln!(
+        f,
+        "============================================================================================",
+    )?;
+    writeln!(
+        f,
+        "Total size: {}, Total resident: {}, Total reclaimable: {}",
+        total_size, total_resident, total_reclaimable,
+    )?;
+    Ok(())
+}
+
 /// Per-device debugfs data.
 #[pin_data]
 pub(crate) struct TyrDebugFSData {
     #[pin]
     pub(crate) vms: Mutex<KVec<Arc<Vm>>>,
+    #[pin]
+    pub(crate) gems: Mutex<KVec<ARef<Bo>>>,
 }
 
 /// Writes VM debug information for the "gpuvas" debugfs file.
@@ -93,6 +183,7 @@ pub(crate) fn debugfs_init(
     let debugfs_data: Arc<TyrDebugFSData> = debugfs_data.into();
     let scope_init = root_dir.scope(debugfs_data, &dir_name, |data, dir| {
         dir.read_callback_file(c"gpuvas", data, &show_gpuvas);
+        dir.read_callback_file(c"gems", data, &show_gems);
     });
 
     kernel::devres::register(pdev.as_ref(), scope_init, GFP_KERNEL)
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index e1d5e908de876..a6d8760070d44 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -154,9 +154,13 @@ fn probe(
         let platform: ARef<platform::Device> = pdev.into();
 
         let mmu = Mmu::new(pdev, iomem.as_arc_borrow(), &gpu_info)?;
-        let debugfs_data = Arc::pin_init(try_pin_init!(TyrDebugFSData {
-            vms <- new_mutex!(KVec::new()),
-        }), GFP_KERNEL)?;
+        let debugfs_data = Arc::pin_init(
+            try_pin_init!(TyrDebugFSData {
+                vms <- new_mutex!(KVec::new()),
+                gems <- new_mutex!(KVec::new()),
+            }),
+            GFP_KERNEL,
+        )?;
         let debugfs_data_clone = debugfs_data.clone();
 
         let firmware = Firmware::new(
diff --git a/drivers/gpu/drm/tyr/fw.rs b/drivers/gpu/drm/tyr/fw.rs
index c46320bb54516..4d5efa79a7348 100644
--- a/drivers/gpu/drm/tyr/fw.rs
+++ b/drivers/gpu/drm/tyr/fw.rs
@@ -222,6 +222,8 @@ pub(crate) fn new(
                 parsed.vm_map_flags,
             )?;
 
+            debugfs_data.gems.lock().push(mem.bo.clone(), GFP_KERNEL)?;
+
             let section_start = parsed.data_range.start as usize;
             let section_end = parsed.data_range.end as usize;
             let mut data = KVec::new();

-- 
2.43.0


