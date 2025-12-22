Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F59B299952;
	Mon, 22 Dec 2025 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766406964; cv=none; b=C2oP73lolXx9bzPe8HrZVWJhpmWMAZPfejxO2uI2t/yhqks6tiivfZ3K534if8LmgoixGe0SVLi+vE0heP50kv0l+2xQyk08Nc1jdpov4pQVoGKWEfPUxnFaCg21/4QIuP8tHUcMQ179OVa1ADuBQ+3XRSc2agQ0OcaKTjwbQBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766406964; c=relaxed/simple;
	bh=8DQ/FR0EAoq7PDZ/SgyPus1AoqbyZO25KcfK/QGVXsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lbEGGwGRvqVZ7OcdB4ejGlojzpsF5h+LxIgpmvMd+idh3prhySeJ/DwmsGuRb/521JIeQMMLbx1TPkBEf+NFthazCcUVxhQNiE/xWy/wkKBqnQP66C0ouFWONa4d7LSS/FXZFOfYAWqQwXyv5vVmRSiEkf5IPz2+8KnkPgDHJTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/GSrRbX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/GSrRbX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9702DC113D0;
	Mon, 22 Dec 2025 12:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766406964;
	bh=8DQ/FR0EAoq7PDZ/SgyPus1AoqbyZO25KcfK/QGVXsI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q/GSrRbXMMmybHtwZJpyTtUXmAqu6G1xCXKTR90ULLFwfUmo5+aRNNzzjZ1zh+7IW
	 6EZ8bAbnkCUXLtiQ23C8yNevxDEzCAlIQKj2Jvx7B7K1yxww4hvkpe1iFnL60Y+dvc
	 D4PrwC0LQ4K3rz4dPpzZx5eYbWiNkLQLuSpT8BzlJPjTfp68J5bfWUXO8wNgV7g5qU
	 UwXxL84HnMFrkaCsRgEyDgKyF4zM6hOATjJzxSPgxBZ0bry8AIzseRUG88BL/wxqpo
	 t2Ih3D+HwSuugSCCOQvPOQqJ6uBqV0ix091UHQuShWySgGHIZvqu2b0SFPb+OclyU1
	 fOc/E5bWD+CSw==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 22 Dec 2025 13:35:33 +0100
Subject: [PATCH 7/7] samples: rust: debugfs: replace `kernel::c_str!` with
 C-Strings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-cstr-driver-core-v1-7-1142a177d0fd@gmail.com>
References: <20251222-cstr-driver-core-v1-0-1142a177d0fd@gmail.com>
In-Reply-To: <20251222-cstr-driver-core-v1-0-1142a177d0fd@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766406931; l=4838;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=mqXYZLE8JU4rujJv0HsYLd4wAnkasrCISB5W8jpNYxM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMUGgCsZl99Mn//Bri041qr3BeQnX2BRwTwL68uHBvH2I0a3BegqDksFKDC2IuKmuie9xLKLC/6
 BFHiPvXjSWwg=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 samples/rust/rust_debugfs.rs        | 17 ++++++++---------
 samples/rust/rust_debugfs_scoped.rs | 20 ++++++++------------
 2 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/samples/rust/rust_debugfs.rs b/samples/rust/rust_debugfs.rs
index 025e8f9d12de..2888619443d3 100644
--- a/samples/rust/rust_debugfs.rs
+++ b/samples/rust/rust_debugfs.rs
@@ -32,7 +32,6 @@
 //! ```
 
 use core::str::FromStr;
-use kernel::c_str;
 use kernel::debugfs::{Dir, File};
 use kernel::new_mutex;
 use kernel::prelude::*;
@@ -98,7 +97,7 @@ fn from_str(s: &str) -> Result<Self> {
     ACPI_TABLE,
     MODULE_ACPI_TABLE,
     <RustDebugFs as platform::Driver>::IdInfo,
-    [(acpi::DeviceId::new(c_str!("LNUXBEEF")), ())]
+    [(acpi::DeviceId::new(c"LNUXBEEF"), ())]
 );
 
 impl platform::Driver for RustDebugFs {
@@ -125,34 +124,34 @@ fn probe(
 
 impl RustDebugFs {
     fn build_counter(dir: &Dir) -> impl PinInit<File<Atomic<usize>>> + '_ {
-        dir.read_write_file(c_str!("counter"), Atomic::<usize>::new(0))
+        dir.read_write_file(c"counter", Atomic::<usize>::new(0))
     }
 
     fn build_inner(dir: &Dir) -> impl PinInit<File<Mutex<Inner>>> + '_ {
-        dir.read_write_file(c_str!("pair"), new_mutex!(Inner { x: 3, y: 10 }))
+        dir.read_write_file(c"pair", new_mutex!(Inner { x: 3, y: 10 }))
     }
 
     fn new(pdev: &platform::Device<Core>) -> impl PinInit<Self, Error> + '_ {
-        let debugfs = Dir::new(c_str!("sample_debugfs"));
+        let debugfs = Dir::new(c"sample_debugfs");
         let dev = pdev.as_ref();
 
         try_pin_init! {
             Self {
                 _compatible <- debugfs.read_only_file(
-                    c_str!("compatible"),
+                    c"compatible",
                     dev.fwnode()
                         .ok_or(ENOENT)?
-                        .property_read::<CString>(c_str!("compatible"))
+                        .property_read::<CString>(c"compatible")
                         .required_by(dev)?,
                 ),
                 counter <- Self::build_counter(&debugfs),
                 inner <- Self::build_inner(&debugfs),
                 array_blob <- debugfs.read_write_binary_file(
-                    c_str!("array_blob"),
+                    c"array_blob",
                     new_mutex!([0x62, 0x6c, 0x6f, 0x62]),
                 ),
                 vector_blob <- debugfs.read_write_binary_file(
-                    c_str!("vector_blob"),
+                    c"vector_blob",
                     new_mutex!(kernel::kvec!(0x42; SZ_4K)?),
                 ),
                 _debugfs: debugfs,
diff --git a/samples/rust/rust_debugfs_scoped.rs b/samples/rust/rust_debugfs_scoped.rs
index 702a6546d3fb..358c47bae4d0 100644
--- a/samples/rust/rust_debugfs_scoped.rs
+++ b/samples/rust/rust_debugfs_scoped.rs
@@ -11,7 +11,7 @@
 use kernel::sizes::*;
 use kernel::sync::atomic::Atomic;
 use kernel::sync::Mutex;
-use kernel::{c_str, new_mutex, str::CString};
+use kernel::{new_mutex, str::CString};
 
 module! {
     type: RustScopedDebugFs,
@@ -80,7 +80,7 @@ fn create_file_write(
                     };
                     dir.read_write_file(&name, val);
                 }
-                dir.read_write_binary_file(c_str!("blob"), &dev_data.blob);
+                dir.read_write_binary_file(c"blob", &dev_data.blob);
             },
         ),
         GFP_KERNEL,
@@ -119,20 +119,16 @@ struct DeviceData {
 }
 
 fn init_control(base_dir: &Dir, dyn_dirs: Dir) -> impl PinInit<Scope<ModuleData>> + '_ {
-    base_dir.scope(
-        ModuleData::init(dyn_dirs),
-        c_str!("control"),
-        |data, dir| {
-            dir.write_only_callback_file(c_str!("create"), data, &create_file_write);
-            dir.write_only_callback_file(c_str!("remove"), data, &remove_file_write);
-        },
-    )
+    base_dir.scope(ModuleData::init(dyn_dirs), c"control", |data, dir| {
+        dir.write_only_callback_file(c"create", data, &create_file_write);
+        dir.write_only_callback_file(c"remove", data, &remove_file_write);
+    })
 }
 
 impl kernel::Module for RustScopedDebugFs {
     fn init(_module: &'static kernel::ThisModule) -> Result<Self> {
-        let base_dir = Dir::new(c_str!("rust_scoped_debugfs"));
-        let dyn_dirs = base_dir.subdir(c_str!("dynamic"));
+        let base_dir = Dir::new(c"rust_scoped_debugfs");
+        let dyn_dirs = base_dir.subdir(c"dynamic");
         Ok(Self {
             _data: KBox::pin_init(init_control(&base_dir, dyn_dirs), GFP_KERNEL)?,
         })

-- 
2.52.0

