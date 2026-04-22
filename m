Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D7E372ED7;
	Wed, 22 Apr 2026 20:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776889703; cv=fail; b=o8O40ywBqsOC5rH/u8lP5oDmVGvw3iAf8SutqAH9hU0uuTSzFlhgt1Lv6X2jdn7NPvj1yi6TupOA5eWKTLoZSETjR0fkyorjBKx7MwKOK1cHCzy/KHAqQqxHlO+DbL55FjhATwazSiJ66oGgY3Uj9HuHwxyajDKEVaQclnrYAj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776889703; c=relaxed/simple;
	bh=hCUH0cuXBQsvAyITPUAwUJy2cprE0vfwK77qId58BnE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=D4tRd4adop5BKJ4wgu5v2Y52WewjbrNQOroEHfn1p1dtpdRINjvGlQK2E3C8dr9dHQAhDeya5ZJpnrrDeVCk8MWwu0Fv9EZOL795gsNQnmXXjw777In88DK5LhG26S3L6X5MHytMJJxFg0g9hhK0ENZyL2sypJby0RHv67nPDnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dJVMmJY1; arc=fail smtp.client-ip=52.101.48.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dJVMmJY1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/N7BxZVFL5jh1VwMnLbPXlkeYRQn9YC2Px/B4WX753YMYfFvUtLjQEraajoMVOw1nUsH6qx389Mp94etAYsvqVjOa9q0nOEeNXsulEQ7mmby/9ZJMHFv8mamhhOcWkQmc4e9VIf9mVCdLHrm+kgyLOZ2F6PqkHsyrhdCkUFBRSn6c9HIzcq8aXqec9doLzzbRBRL4hRrQoFVl7NM9Nwiu+aPu7x/3ekgT0MtkW3qW5OWkOqwQp3aSp+qgmzjlbVdN7KVcgSsr4+0dM5Zbs7ka+iq6LlnJgNb7TJxH2BhKszZvNGcMw1LHdO5mhNyoFJYuU2D9n/OmgBmhOdqFbs3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9v6czE4rb07iYbGbEWKW4EcPaa8dBCt2xwaRiyUTIEs=;
 b=iWqhV49rk3JXm0UdRwY3rpFpvLqYgEJyKIIrOcxEkR4ITaWRyA8neY1GzAbMZ4wgnLsIh6fyK3O/giALYNUSzEUfSMj8yafdTb241bWD4pvaNZVcsvEdo3Cn+t9squXX0muBP0xMt9RVbqkquKxqaRD6xL8mT+wW/SsQELzgeCEFeMFy0iLTtMckKHBXsER9TJhoXrM15HW/N+n4re/tP6YJb3RCXx8XTfsgtW7dMgVig+DjzyKxcakd8zfSuM2HlVGDozJCXXPR2i7vhuj47GGeT0OFv+nJCNmzfN+HR3+zjzcTUocZm3avSW9vryZffCdGLtXf72wohpkmLj+Drg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9v6czE4rb07iYbGbEWKW4EcPaa8dBCt2xwaRiyUTIEs=;
 b=dJVMmJY1Lv/lNO+cHyf98nWunaAFXCE/ltopSBN+GeO+RO7oqhAXzt07LatmSTaG6KrJHXw9/opIZJKXdPF4iVbVGSS6VLQQ1D/MhXVTmCDKoX7GH/dw54tYL4uBvIVlp813LbN8tgDqlvgTnXj+4NXsXRY0i0GBBNWD4sHZ1f8KkfzFMOoNK6GynUfAfpNCdD2Jc7gQA4ACclesg29T5RfCeZrf3iAtKkz1X1qSaVF42x3mYM/bNXDftIIDuJM6hy4q0uHwTqVS4PIk/peuKyjR3VZSrlsc7gb7KVScZIxL9DYPeQoEP8qko8+PcVFzq4bdGJ/oG3YJ/7SEqpeKeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB7281.namprd12.prod.outlook.com (2603:10b6:510:208::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.20; Wed, 22 Apr 2026 20:28:17 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 20:28:17 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2] rust: maple_tree: implement Send and Sync for MapleTree
Date: Wed, 22 Apr 2026 16:28:12 -0400
Message-Id: <20260422202813.2990181-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:208:335::7) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB7281:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff71458-f845-4046-df96-08dea0adafa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZeieTfaZBci6s8/mfjbpq5Pw+wVb/plLnck5aycfKqD8ejlg+tH98793KtfNxU7c6EU3h/p5knQKR9vC/rSwL5V9XQm+YOAhtjGUByd8bj2X1fJkHwJQeb3B/dL7Ngl5gFj38bw4fpc6khtBo4aq52C/ej7YMX3ScX40zCF7ESRbVTpu2YG9tfQyad73donQ/h4u3oR/PS/5X/F6Jzoeh75OaP3SfhvmJBlLLSJYQWSj0Gepx2Tzg7ya2ykMSeJpePeZEv82SShDTIxMaWQvcNMPJwXnjnYZJULVNf/ibIlFAy1i/CDBmSxEQwTXnYaFWHkn56KVnDe6z0kWzjK5oyacjsKAwinNld2oojqjQQ5hAeWQHF/X/OQ2wWPnLU3n68+hiB6R5/QCNsYi9xykAgFF+kPXKuoqVvak2AX3ANfu5Ow03mcDt/Lpm3yxFozNCnDjEZTTKiRiYxt4hjSeETPqE77ycAspRnXT9CT+OWFXbNZZ9HeiYW6as10pwOjl0VKZDtqygq0AfHlSKG6WDjufO3xn4BMUVPM5WVvhL+dFoPrhUTF7WlIIL4lz00X5zKQgTknrhT9H11CycqjWQJovHlFWA/6743X1eEPDXySbI4WpU9ljAgYuOiuiK0rU1sF+pdZtcuVLkKtQh7gC+lHzU2WsfW63HNyAgPHs0Bl+qgvdFloWVQvDHH2i0TKrH8ZUZ2HrkS+IiwDa8JNf3FI8nQ9me63bt1qjZc1BarA1eYGIWlFLA5er4VmFMzdzKcBsJqdxZCjmxFfCuk/j3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mpf24iJs+7M+rU+tqKe1Nc6KVIGqAAZTaf/HVJ7a3vmVoq2lqQ8FaPnzqHbx?=
 =?us-ascii?Q?lpQA+rmQgbcO+N1sS5B7AZpJs21KOkXRKt1z8Q8Xt5g1UinDhy+Ce465tyla?=
 =?us-ascii?Q?YfP+kqc2VnKBETGPVoreY6A1jn9pnGeEr2FLBTQ+rBw3RqtESvb8noR87Du/?=
 =?us-ascii?Q?WpT5jdrnIdpZD7g6DX6KXYPSwfUftkGxvZBEk0JLu61DqxREHSwpw4+0jlOD?=
 =?us-ascii?Q?MMILR/BrI4SjyaJbofCaXHl0FD6mX2TRDQARD4YuJNyDVevo9wivnDM7LmZP?=
 =?us-ascii?Q?Y3vWUSiP1udZSt9FVWkSgqzFvVrWvwyH11n0MywqxV7FHv/S7UhQFzfGGvWn?=
 =?us-ascii?Q?gM48qYlomUh6kMJnWxzygnfy8VzGk1TtU5p+o6b6NgYtvoy5s6mbnXj4tI2B?=
 =?us-ascii?Q?uGSp5eXHmZ1W6G4xO6dWuMTW4kVLE0HuA5K8xemiRtDFicxlVWj0mBACz3P7?=
 =?us-ascii?Q?b9iywyyFUSjSPxQVR0XEdnJJzKCWKt/BTbKSlurpq1gzIZA16CrGJ0hahaKB?=
 =?us-ascii?Q?DhYsl+UZdtWFzV4+3b28FnjtjMJfi38bXMUka7/JQyMdg3c6bo/WJITVXWDj?=
 =?us-ascii?Q?z8g2phUTqXkS7QqJsRPVVeCnBLNHVQOX9p5JFh4BaNOR21poWNwEbkVlbd7L?=
 =?us-ascii?Q?ZDLKn0IMxYGa7Ipz3XjM8xY9Je5ItPg3MksKzikqIycVjv71dIXM0t9t6XFv?=
 =?us-ascii?Q?VrVlZJOFgIrIfy7YPYwQtcvnkcBn2s6NLwDULN3XPn51l4Kxoj8f47r8SnfM?=
 =?us-ascii?Q?UkY3xe4kDGCBVflzaB1YCNBEIrTnkCnbP9nhfYR5e9A2pjQfWxAiv3cyyPkM?=
 =?us-ascii?Q?1oWiRuWhg7ZMmVDrE8fDySVJYy606+WVnKtAf/5xnX9SvhpxTcfET/Sk9hP2?=
 =?us-ascii?Q?SJSsafzVC3MCDSGRd9TYXR7BkauHZo6ABxZghF7yKr8i7E1FU71KgJ4Ft85v?=
 =?us-ascii?Q?jht9e2q461D+xcwgpVZKXTW6PbTDj/KRVEHT2UdGvQ+1I7b89xMh6+TdSWoy?=
 =?us-ascii?Q?bVZuAPIByLRiFRgj7eSlnP7g3J6xm8wuWWurZL7zNNTwZdeYHqHIMdUb76fe?=
 =?us-ascii?Q?ApY6z4tqLkxUL35jut44+TFEDwCtUVGIUbUaEB+f4IqPEh4zRR9A0du8s1aG?=
 =?us-ascii?Q?W1M/A2fa9c6c5LWjUSF0risXwwLFtC3YaUnStxSO1i2hYc7G1VTD+9rlWCUE?=
 =?us-ascii?Q?+ObhNfQ/a05Xv8OpigQFegzzmpeu5EA7GqXx0B2UAatG5F6cWwogKigDQRPV?=
 =?us-ascii?Q?IkILon3DSySBgZWURg3cXLIfm9mhkTBAaomxHVhDaTeEccxGI3IPcmd0Icb2?=
 =?us-ascii?Q?pyeaK88gYYloRcgbNyvPF7SVr6obx7h0y2E9oAfeIjtDn2LaCMPAt1TwaUS1?=
 =?us-ascii?Q?bWJxdZvESzHDYKGYl3Qlp7zcp/QiLU83l5ahlBU5j52BnetaBNHNWJ6IHy5r?=
 =?us-ascii?Q?U3TDoC/r/3UvXyRjhvd40zPoNycKulovMyDM18PeaZHuolEqYRCfScCI7L6J?=
 =?us-ascii?Q?OhWRD2jg9F+R7naeRIHgbCbfrdXHcS1sf+S8/oy4T4Am55o4cQhva4bj40Y/?=
 =?us-ascii?Q?jufDBFFRl133y0SNgxLRWDqNi1Yf+GYg+AeODS1IhrebKDKIQGNbPW7bQ6dC?=
 =?us-ascii?Q?C76loGp0sFuZ5S16dl/w/KDwrocFNvp56rPxm9uBl92eBYVbaQovSo+olO9F?=
 =?us-ascii?Q?o4u6BQhaoH/Rju7/i7ZSMhmu7/Nkw9C8+vnr8+k9STqLw4d6+dQovI5vl2mS?=
 =?us-ascii?Q?kzUaenrUUA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff71458-f845-4046-df96-08dea0adafa0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 20:28:17.0917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5fA6ztZauDY4Dooxsu0vErGLrTL3HWdNF6jWGRlj2bS6O+OpiBlAnGuyJTFARJWguIJa8X2BQGZKz7mAG1XHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7281

The C maple_tree struct contains a *mut c_void, which prevents Rust from
auto-deriving Send/Sync. Following is an example error message when using
MapleTree in nova-core's Vmm.

This propagates up through MapleTreeAlloc to Vmm, BarUser, Gpu, and NovaCore,
causing NovaCore to fail the Send bound required by pci::Driver:

  error[E0277]: `*mut c_void` cannot be sent between threads safely
      --> drivers/gpu/nova-core/driver.rs:77:22
       |
  77   | impl pci::Driver for NovaCore {
       |                      ^^^^^^^^ `*mut c_void` cannot be sent between threads safely
       |
       = help: within `MapleTreeAlloc<()>`, the trait `Send` is not implemented for `*mut c_void`
  note: required because it appears within the type `kernel::bindings::maple_tree`
  note: required because it appears within the type `Opaque<kernel::bindings::maple_tree>`
  note: required because it appears within the type `MapleTree<()>`
  note: required because it appears within the type `MapleTreeAlloc<()>`
       = note: required for `Box<MapleTreeAlloc<()>, Kmalloc>` to implement `Send`
  note: required because it appears within the type `core::pin::Pin<Box<MapleTreeAlloc<()>, Kmalloc>>`
  note: required because it appears within the type `Vmm`
  note: required because it appears within the type `BarUser`
  note: required because it appears within the type `Gpu`
  note: required because it appears within the type `NovaCore`
  note: required by a bound in `kernel::pci::Driver`
      --> rust/kernel/pci.rs:294:19

Implement Send and Sync for MapleTree. The tree contains no thread-local
state, and all shared access goes through the internal ma_lock spinlock.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
v1->v2: Adjusted comments and imports.

 rust/kernel/maple_tree.rs | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/maple_tree.rs b/rust/kernel/maple_tree.rs
index 265d6396a78a1..2400c905270da 100644
--- a/rust/kernel/maple_tree.rs
+++ b/rust/kernel/maple_tree.rs
@@ -16,7 +16,11 @@
     alloc::Flags,
     error::to_result,
     prelude::*,
-    types::{ForeignOwnable, Opaque},
+    types::{
+        ForeignOwnable,
+        NotThreadSafe,
+        Opaque, //
+    },
 };
 
 /// A maple tree optimized for storing non-overlapping ranges.
@@ -240,7 +244,10 @@ pub fn lock(&self) -> MapleGuard<'_, T> {
         unsafe { bindings::spin_lock(self.ma_lock()) };
 
         // INVARIANT: We just took the spinlock.
-        MapleGuard(self)
+        MapleGuard {
+            tree: self,
+            _not_send: NotThreadSafe,
+        }
     }
 
     #[inline]
@@ -302,19 +309,29 @@ fn drop(mut self: Pin<&mut Self>) {
     }
 }
 
+// SAFETY: `MapleTree<T>` is `Send` if `T` is `Send` because `MapleTree` owns its elements.
+unsafe impl<T: ForeignOwnable + Send> Send for MapleTree<T> {}
+// SAFETY: `&MapleTree<T>` never hands out `&T`; all entry access is serialized
+// by `ma_lock` or `&mut Guard`, so `T: Send` suffices (`T: Sync` not required).
+unsafe impl<T: ForeignOwnable + Send> Sync for MapleTree<T> {}
+
 /// A reference to a [`MapleTree`] that owns the inner lock.
 ///
 /// # Invariants
 ///
 /// This guard owns the inner spinlock.
 #[must_use = "if unused, the lock will be immediately unlocked"]
-pub struct MapleGuard<'tree, T: ForeignOwnable>(&'tree MapleTree<T>);
+pub struct MapleGuard<'tree, T: ForeignOwnable> {
+    tree: &'tree MapleTree<T>,
+    // A held spinlock must be released on the same CPU that acquired it.
+    _not_send: NotThreadSafe,
+}
 
 impl<'tree, T: ForeignOwnable> Drop for MapleGuard<'tree, T> {
     #[inline]
     fn drop(&mut self) {
         // SAFETY: By the type invariants, we hold this spinlock.
-        unsafe { bindings::spin_unlock(self.0.ma_lock()) };
+        unsafe { bindings::spin_unlock(self.tree.ma_lock()) };
     }
 }
 
@@ -323,7 +340,7 @@ impl<'tree, T: ForeignOwnable> MapleGuard<'tree, T> {
     pub fn ma_state(&mut self, first: usize, end: usize) -> MaState<'_, T> {
         // SAFETY: The `MaState` borrows this `MapleGuard`, so it can also borrow the `MapleGuard`s
         // read/write permissions to the maple tree.
-        unsafe { MaState::new_raw(self.0, first, end) }
+        unsafe { MaState::new_raw(self.tree, first, end) }
     }
 
     /// Load the value at the given index.
@@ -375,7 +392,7 @@ pub fn ma_state(&mut self, first: usize, end: usize) -> MaState<'_, T> {
     #[inline]
     pub fn load(&mut self, index: usize) -> Option<T::BorrowedMut<'_>> {
         // SAFETY: `self.tree` contains a valid maple tree.
-        let ret = unsafe { bindings::mtree_load(self.0.tree.get(), index) };
+        let ret = unsafe { bindings::mtree_load(self.tree.tree.get(), index) };
         if ret.is_null() {
             return None;
         }
-- 
2.34.1

