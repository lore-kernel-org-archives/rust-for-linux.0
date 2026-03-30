Received: from outbound.ci.icloud.com (ci-2001j-snip4-11.eps.apple.com [57.103.91.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AD3274B23
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 02:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.91.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774836183; cv=none; b=IeKkC9pkZIhB8FCTUfyDOfTHhB3tHFkI7QyNRBdQMuq3osO1sT6PpYptoxsVDwY8i+gprpapS1JqNTSDOMAZTg8zslCsYAxV8E000cFJzf/R4NbFD6FDmI+Xp1vwUZxmyNcuRRnqf7h9cN+inbxjP4PaVWYBxAoWuOJAxqFhw30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774836183; c=relaxed/simple;
	bh=arm+I/dq8T4DUBwNG8ltiIKdudhKafcMT404zBnEwBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JZKKKnUmAqIIjqEWH/R9mvLvl5rGh2b0ZjLG0ovecQdcG8s6YNCuze4pd7hM8L6mLF/Wf2QIT56TfxwTpCCSCQhXPF1bcWUieoL8aWD/KuZcrEJwDKTjIMczMpR6/KdXHucCo5YN9CL+wDzdWRJLXViP/fXJ6LKEQu5iBm+aZjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=n6dG29qC; arc=none smtp.client-ip=57.103.91.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="n6dG29qC"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-7 (Postfix) with ESMTPS id D669E18000E8;
	Mon, 30 Mar 2026 02:02:55 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1774836178; x=1777428178; bh=aKLoGve9VTVPehwuwGxQ1hVeHUvR3SPbf9NGXKJfwJI=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=n6dG29qC8L05MRC2Id4lDjf7kqO9Hf1SnIv8YDWcb6Kadf/DkeC3QFK6y9CXesNiOYPE42OZnbHaPVNv4G/gGqQOiKqJ7M2Dt8YAbex6TngthU/wJ7PiyMbWk9tFMTk402gNBa95XgsFSXyv+DywU1+/6VVuALjnd5MswKT0cHrFqtfCvOnUlIroznbAU1YTEXmJcZrQW2rfEpjYJ+3bozGOxQ0FmFBpSdmd6VBAR7hF6p5WOMjN95grYZY4KvTrLcF0Oxo0Xfp5cNAlJwLwEr2DUiFkVUugqy6y0P87IjdZ+DjCFWwgsY+MryPDoSnzUdZhonHfooCp0p3nHsKqZQ==
mail-alias-created-date: 1772007648188
Received: from localhost.localdomain (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-7 (Postfix) with ESMTPSA id AEF1518000CA;
	Mon, 30 Mar 2026 02:02:52 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
To: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamad Alsadhan <mo@sdhn.cc>
Subject: [PATCH] rust: replace `build_assert!` with `const_assert!`
Date: Mon, 30 Mar 2026 05:02:34 +0300
Message-ID: <20260330020234.16893-1-mo@sdhn.cc>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UzkpNqLkuag-fJi0mDwhHm2B76DJLc-m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAxMyBTYWx0ZWRfX36GNxNn4l4lb
 eZqoU5MSi3CLZvVASL+SOHIpuDbQtKDqWnWt0vN51tmMB7gh/7P0qC71sGJke3d6qFwLqPefU+6
 DZjd7YaEiwl+g45uvbA+aJM5r+b2+0CukQDet+vQ1v4Z6MdIF3vZ/teQu8SC/mFgLQ6y5mMSO3s
 Y3qERHSfVlo20ZABXfkHUbS6SxwBCjBirgV4cpzB4Y3gFGSSvp0EVO4/sWUVbNOjuPfMD+XK5wZ
 1YeO4UJLpmkXTRU5FUVpjNXxjKiL1LupoXpz8FaUoCSEq58pEGCW2tgdxsnmNGxcqwehCmbrqQn
 bz7vcpfQ1ao3zYealUYIjc3UPM5DPgMK+NhWc9hiTqrV4Fki76qzhWnFvpaVh0=
X-Authority-Info-Out: v=2.4 cv=SfH6t/Ru c=1 sm=1 tr=0 ts=69c9d9d0
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=fEKK6AvQFHovDqj4k0kA:9
X-Proofpoint-GUID: UzkpNqLkuag-fJi0mDwhHm2B76DJLc-m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 clxscore=1030
 suspectscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603300013

Several Rust assertions currently use the `build_assert!` macro
despite their conditions only depending on type parameters or const
generics, not runtime values.

Replace these with the more appropriate `const_assert!` macro which
should trigger earlier in the compilation pipeline. This is possible
since commit 560a7a9b9 ("rust: add `const_assert!` macro").

No functional change intended.

Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
---
 rust/kernel/dma.rs            | 4 ++--
 rust/kernel/i2c.rs            | 2 +-
 rust/kernel/list/arc.rs       | 2 +-
 rust/kernel/sync/locked_by.rs | 8 ++++----
 rust/kernel/xarray.rs         | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 909d56fd5..deacfc719 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -5,7 +5,7 @@
 //! C header: [`include/linux/dma-mapping.h`](srctree/include/linux/dma-mapping.h)
 
 use crate::{
-    bindings, build_assert, device,
+    bindings, device,
     device::{Bound, Core},
     error::{to_result, Result},
     prelude::*,
@@ -401,7 +401,7 @@ pub fn alloc_attrs(
         gfp_flags: kernel::alloc::Flags,
         dma_attrs: Attrs,
     ) -> Result<CoherentAllocation<T>> {
-        build_assert!(
+        const_assert!(
             core::mem::size_of::<T>() > 0,
             "It doesn't make sense for the allocated type to be a ZST"
         );
diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 7b908f0c5..55b763189 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -110,7 +110,7 @@ unsafe fn register(
         name: &'static CStr,
         module: &'static ThisModule,
     ) -> Result {
-        build_assert!(
+        const_assert!(
             T::ACPI_ID_TABLE.is_some() || T::OF_ID_TABLE.is_some() || T::I2C_ID_TABLE.is_some(),
             "At least one of ACPI/OF/Legacy tables must be present when registering an i2c driver"
         );
diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
index e10824239..b57cec64f 100644
--- a/rust/kernel/list/arc.rs
+++ b/rust/kernel/list/arc.rs
@@ -252,7 +252,7 @@ pub fn pair_from_pin_unique<const ID2: u64>(
     where
         T: ListArcSafe<ID2>,
     {
-        build_assert!(ID != ID2);
+        const_assert!(ID != ID2);
 
         // SAFETY: We have a `UniqueArc`, so there is no `ListArc`.
         unsafe { <T as ListArcSafe<ID>>::on_create_list_arc_from_unique(unique.as_mut()) };
diff --git a/rust/kernel/sync/locked_by.rs b/rust/kernel/sync/locked_by.rs
index 61f100a45..5d043e661 100644
--- a/rust/kernel/sync/locked_by.rs
+++ b/rust/kernel/sync/locked_by.rs
@@ -3,7 +3,7 @@
 //! A wrapper for data protected by a lock that does not wrap it.
 
 use super::{lock::Backend, lock::Lock};
-use crate::build_assert;
+use crate::const_assert;
 use core::{cell::UnsafeCell, mem::size_of, ptr};
 
 /// Allows access to some data to be serialised by a lock that does not wrap it.
@@ -100,7 +100,7 @@ impl<T, U> LockedBy<T, U> {
     /// memory location*, the data becomes accessible again: none of this affects memory safety
     /// because in any case at most one thread (or CPU) can access the protected data at a time.
     pub fn new<B: Backend>(owner: &Lock<U, B>, data: T) -> Self {
-        build_assert!(
+        const_assert!(
             size_of::<Lock<U, B>>() > 0,
             "The lock type cannot be a ZST because it may be impossible to distinguish instances"
         );
@@ -126,7 +126,7 @@ pub fn access<'a>(&'a self, owner: &'a U) -> &'a T
     where
         T: Sync,
     {
-        build_assert!(
+        const_assert!(
             size_of::<U>() > 0,
             "`U` cannot be a ZST because `owner` wouldn't be unique"
         );
@@ -155,7 +155,7 @@ pub fn access<'a>(&'a self, owner: &'a U) -> &'a T
     /// Panics if `owner` is different from the data protected by the lock used in
     /// [`new`](LockedBy::new).
     pub fn access_mut<'a>(&'a self, owner: &'a mut U) -> &'a mut T {
-        build_assert!(
+        const_assert!(
             size_of::<U>() > 0,
             "`U` cannot be a ZST because `owner` wouldn't be unique"
         );
diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index 46e5f4322..d4b3eac34 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -5,7 +5,7 @@
 //! C header: [`include/linux/xarray.h`](srctree/include/linux/xarray.h)
 
 use crate::{
-    alloc, bindings, build_assert,
+    alloc, bindings, const_assert,
     error::{Error, Result},
     ffi::c_void,
     types::{ForeignOwnable, NotThreadSafe, Opaque},
@@ -231,7 +231,7 @@ pub fn store(
         value: T,
         gfp: alloc::Flags,
     ) -> Result<Option<T>, StoreError<T>> {
-        build_assert!(
+        const_assert!(
             T::FOREIGN_ALIGN >= 4,
             "pointers stored in XArray must be 4-byte aligned"
         );
-- 
2.52.0

