Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781257;
	b=0y8HprXYLX+lgf444W4ISBgbI6BGF4E/UIUOyLtpx8bIjRob8ioH+UScBTXJgVDU603E
	 MkpF6VzhCIiZcFL9JMI8tVLW68kk1e9unJTOlj5aX2l2yapJ1hTj/x3giC1hC2rEpG6Ha
	 uuFt+yf0SkhVKYU+SfkiLl0/lGLdlGqfrNHLzHcYsoA1E7DfU/HB7vgtJao2iC54JajQJ
	 2Jt7K8tivIowFj+barvvYmPnXnzJjUbhqs48iwdu6pwu+X4KtJwyH6csG6A5UBliJtquE
	 gVyNq56GXIhq1tn2rbLq8SrCzeIdiWi/sGceHSk3Hogu22zd1uyYCFbLllLkubEVg6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781257;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=Yah2ivdfcmEYck9GJjp5TM7e4/qC0WA5lRSFKMzyiF0=;
	b=kRI8X7YPNoM3qx0XZT4k68mNWOqufkACeqRSG62IRw1LbkzCi5nP39zRHZ9QPn6HsrTU
	 6MrDW7gqATGZZFgPd+69qDpSSJFTE50BiK/oyko3xSfHCgfwLM1bwufpCRCeH6BoOzR2X
	 hPVk4rRFkfuKpgXY56cOgFd/0mDjRb2bOcUcXjwF4z6b2SFfSTAlXUeVAjNugTA5S6k37
	 Avi5HWaN9cPjw5H8WvwzDU8ajLjz/2bPo7WBVtsiIjhE9Z9bNyHHbMvTlMQ8QbEcWukmH
	 AlzfnAzqEqpTB8PByH35jGFpMNv6ynxS5fy0QK8GZAB7oOnG1diKpLZX1SubxksVewA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b="BLpo/By7";
	arc=none smtp.remote-ip=220.197.31.6
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7E4606A31C;
	Fri, 27 Nov 2026 12:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A7E4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=BLpo/By7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ya
	h2ivdfcmEYck9GJjp5TM7e4/qC0WA5lRSFKMzyiF0=; b=BLpo/By7BGGkd4hJ35
	vvB0dXjFt93TM11gsv0qrln/LG71SQxB5wwPK8DDC3hv4NnNxcJ5R1wq+WYh4KLX
	VsaFkoC4+oAPUbdUvX6L0VGynx0B5r3AiYE98GInRwxOl8tI4ZjgfWcT9QVJJhmG
	P4TW/Up+Orm0RxJR4AuKxGme0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnVyRxcglrD_ebEA--.58649S2;
	Fri, 27 Nov 2026 20:07:17 +0800 (CST)
From: Bilal Hashim <AeeSec@126.com>
To: Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bilal Hashim <AeeSec@126.com>
Subject: [PATCH] rust: configfs: initialize AttributeList at compile time without UnsafeCell
Date: Fri, 27 Nov 2026 20:06:46 +0800
Message-ID: <20261127120646.664-1-AeeSec@126.com>
X-Mailer: git-send-email 2.47.0.windows.2
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnVyRxcglrD_ebEA--.58649S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFWxCF4rKFW8Cr13try3XFb_yoWrKFW7pr
	WDGFW5Jw4UJF43JanrJrWIg348Grn3JFyYkw1Dtw1Iv398JwnFqF9FgrWSy3s0qF92gwnI
	v3y0gw1293yrZw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi1EEUUUUUU=
X-CM-SenderInfo: 5dhh2vbf6rjloofrz/xtbBrBXWcWsJcnVqqwAA36

The configfs_attrs! macro currently declares a global static AttributeList
wrapping an UnsafeCell<[*mut c_void; N]> and populates it at runtime via
AttributeList::add() on every macro invocation.

Although the static identifier is lexically scoped inside the macro block,
the static storage is globally shared across all invocations and threads.
When a function invoking configfs_attrs! (such as make_group() in
drivers/block/rnull/configfs.rs) executes concurrently on multiple
threads, or while C configfs concurrently reads ct_attrs_const, the
unsynchronized &mut writes into the static UnsafeCell cause aliasing UB
and a data race.

Replace UnsafeCell and the runtime AttributeList::add() calls with a pure
const AttributeList initialized at compile time inside the static item.
This eliminates the data race, removes the runtime pointer stores from
make_group(), and allows the attribute table to reside in read-only
memory.

Tested with LLVM=-22 (verified zero runtime stores to DEVICECONFIG_ATTRS
in LLVM IR) and booted in QEMU with CONFIG_PROVE_LOCKING=y, exercising
/sys/kernel/config/rnull mkdir/read/rmdir and 372/372 Rust KUnit
doctests.

Signed-off-by: Bilal Hashim <AeeSec@126.com>
---
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -117,7 +117,6 @@
 use crate::sync::Arc;
 use crate::sync::ArcBorrow;
 use crate::types::Opaque;
-use core::cell::UnsafeCell;
 use core::marker::PhantomData;
 
 /// A configfs subsystem.
@@ -714,43 +713,32 @@
 pub struct AttributeList<const N: usize, Data>(
     /// Null terminated Array of pointers to [`Attribute`]. The type is [`c_void`]
     /// to conform to the C API.
-    UnsafeCell<[*mut kernel::ffi::c_void; N]>,
+    [*const kernel::ffi::c_void; N],
     PhantomData<Data>,
 );
 
 // SAFETY: Ownership of `AttributeList` can safely be transferred to other threads.
 unsafe impl<const N: usize, Data> Send for AttributeList<N, Data> {}
 
-// SAFETY: We do not provide any operations on `AttributeList` that need synchronization.
+// SAFETY: `AttributeList` is immutable after compile-time construction.
 unsafe impl<const N: usize, Data> Sync for AttributeList<N, Data> {}
 
 impl<const N: usize, Data> AttributeList<N, Data> {
-    /// # Safety
-    ///
-    /// This function must only be called by the [`kernel::configfs_attrs`]
-    /// macro.
+    /// Create a compile-time constant attribute list.
     #[doc(hidden)]
-    pub const unsafe fn new() -> Self {
-        Self(UnsafeCell::new([core::ptr::null_mut(); N]), PhantomData)
+    pub const fn new(attrs: [*const kernel::ffi::c_void; N]) -> Self {
+        Self(attrs, PhantomData)
     }
 
-    /// # Safety
-    ///
-    /// The caller must ensure that there are no other concurrent accesses to
-    /// `self`. That is, the caller has exclusive access to `self.`
+    /// Convert a static `Attribute` reference into a raw pointer for the list.
     #[doc(hidden)]
-    pub const unsafe fn add<const I: usize, const ID: u64, O>(
-        &'static self,
+    pub const fn attr_ptr<const ID: u64, O>(
         attribute: &'static Attribute<ID, O, Data>,
-    ) where
+    ) -> *const kernel::ffi::c_void
+    where
         O: AttributeOperations<ID, Data = Data>,
     {
-        // We need a space at the end of our list for a null terminator.
-        const { assert!(I < N - 1, "Invalid attribute index") };
-
-        // SAFETY: By function safety requirements, we have exclusive access to
-        // `self` and the reference created below will be exclusive.
-        unsafe { (&mut *self.0.get())[I] = core::ptr::from_ref(attribute).cast_mut().cast() };
+        core::ptr::from_ref(attribute).cast()
     }
 }
 
@@ -984,22 +972,7 @@
             @no_child($($no_child)?),
             @attrs($($aname $aattr)*),
             @eat($($rname $rattr,)*),
-            @assign($($assign)* {
-                const N: usize = $cnt;
-                // The following macro text expands to a call to `Attribute::add`.
-
-                // SAFETY: By design of this macro, the name of the variable we
-                // invoke the `add` method on below, is not visible outside of
-                // the macro expansion. The macro does not operate concurrently
-                // on this variable, and thus we have exclusive access to the
-                // variable.
-                unsafe {
-                    $crate::macros::paste!(
-                        [< $data:upper _ATTRS >]
-                            .add::<N, $attr, _>(&[< $data:upper _ $name:upper _ATTR >])
-                    )
-                };
-            }),
+            @assign($($assign)*),
             @cnt(1usize + $cnt),
         )
     };
@@ -1052,12 +1025,16 @@
                 // We need space for a null terminator.
                 const N: usize = $cnt + 1usize;
 
-                // SAFETY: We are expanding `configfs_attrs`.
                 static [< $data:upper _ATTRS >]:
                 $crate::configfs::AttributeList<N, $data> =
-                    unsafe { $crate::configfs::AttributeList::new() };
-
-                $($assign)*
+                    $crate::configfs::AttributeList::new([
+                        $(
+                            $crate::configfs::AttributeList::<N, $data>::attr_ptr(
+                                &[< $data:upper _ $name:upper _ATTR >]
+                            ),
+                        )*
+                        ::core::ptr::null(),
+                    ]);
 
                 $(
                     const [<$no_child:upper>]: bool = true;

