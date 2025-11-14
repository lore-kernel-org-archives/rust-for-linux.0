Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C852DCF51
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 06:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763100132; cv=none; b=RAoUmzvV+Ne6L9a3Z+NKxXOvkK1X08VgxlixX8UPqZJzbFO7Cd/CQxJ1fMGR005hN+SacGMyqEkh4mAQ8bKECeJ0JNjW0TSbQopKjM4xIil1yeVu1lrC6isS1kwjwqhA7a6E7VbApsWSUcHN+PBO6joB9i462D77vAZJ3fQ7XeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763100132; c=relaxed/simple;
	bh=cqqGnUznfbAbWyjGKSTxxYISmjyGKi+MzqFQzxu1muI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGTQXJB3UPgukKbL3kiRMagAz8MxoF+hYI43Uih4jvyJcZMIdA09YiKy9fTFCV2K+T8GpItY3NoQmcBTnRqcmaFohqtiwr+X6rbDWnJuLeBw+WN3rpcby3NRxpyhd3xxHwt+eP/Nx8ruI3mLe0TAZGq5wHzsKHhx1J2RJne5blE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjQJqSs4; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjQJqSs4"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-882475d8851so16732776d6.2
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 22:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763100129; x=1763704929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M4Y9tkSFAzqofs4NQrj/HfNR2C/q3nK+241BHW7i6Xk=;
        b=cjQJqSs4P1m3UUdFW7Hw8QvuM81D3pUFlrNBX5/wxTcUoG5bswVtr1Plo5cTzu4rIq
         ZJiywmM2ZL/tvfN4+emD6xoVFo2AbD6rcGlAQ2qzL1PPYTQ+cajmDstuoEkoFmn6mGeY
         zZs40YwYPzJInVDJRMmblKnCSzAaqV2MfCXCyBquS8GV2hXecjWQB2ocWMfv2ILihWkW
         gctBibpQi2dciweH1o46vsGj0ef3BBlHzoyHCMREoLn7U+EQkBEEsV3a7P3UBcpSJSQ9
         fwQ+HB12AZMajJKqs72Vlqd0JGbUWBAITQCHNmCCXcQOFZ6O5/SP+lMyti2cMqlvIbgr
         PDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763100129; x=1763704929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M4Y9tkSFAzqofs4NQrj/HfNR2C/q3nK+241BHW7i6Xk=;
        b=maeTpKandGYoyMUQ1IrsxCQLz0nWkzI/6kcYfr0RKSwIbucAKFM8n6/FFHBK2f0Csg
         ffMnoqA8YdnL/8ywv05NjZ+BrP1xPIEz5HPS7tQofI5JWSquIRjsSJbL/AfG4+RwKnp7
         hm78IewmUgrLVRGIqHoXWG8GQB5efTB8cwOlH79EZlkoj3JrSxaeDvn1aFfak3PWlMKD
         m+rstvUFOdaOIv7ym6qdEB1M/ZgRuthb33NBr2a4H4Efx355RrVYuCBgPzRXNUuVlm5R
         03TDFNWAgH5WY7h4rnlfTf45QNsp2DSqxeRl4SQKDGBWheYYQUup5dMaCwgqNjtBflpg
         fPPg==
X-Forwarded-Encrypted: i=1; AJvYcCXLkE7uBFwBzrT0wYvMjXo+UMPwNR+UoygaYB3ScRt0gBvIXBM7h38jl/9Gg0La17QfF2EcA9MCS+6nH4tv+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Kz+vZSh8Gtk2wI2U9kni38uHsBEVX+lu+3SuRHGxU7VFND1c
	JJ7ljX3wo6Ka7jlj/o60q00oQ3mBatyM4yflmaYf2MFVn08LWZte72Ma
X-Gm-Gg: ASbGncvdGn3Bihgd0cfzYV99Emzu+5IsAN/x5VoNJWEPfWLfolttkVS3zohOz3jh5eV
	jKYE7b5VdPZDfydabu4E9ptpgCtXHxlMSU7S7iullYVv4ppjCbiJeGNGF25S3f61A+CTjl4eY1O
	bsed1/wChF2wzqUPvuawCuyjSvWqdjG/115diaazXKCNXDkQyZTwjEQeITB3Q84klwUxabfwZPw
	mMP/LhbyYgWxvjcQZifdMLzXFh3MwBL9R9YDQWs5Q7VZnxSBJhBI+2PWjD0Uf4HMZQ3QhcByyzA
	kTlij6awTXxqZe6c28DM4Mwy61jooTXnfK3CzDgmTsyLlMqTcuRySK8W9eQGwhYkH1qbAZEdaKO
	GmS/imXxZNGpdYlnOJl3RH8LO2uufteDx0KPcSeWOUKnKUYDx+bT2pGa1vGTCC5vYtMlJ+PQHra
	TThM/PLQtTHCwTtRMJrv/SxCY+A9PMik2D9H05FiKqKWK15OPg8ybldsp00AWT4lLm7mGKa2Shn
	93vv0DwbllP+sx50VRDhokLcg==
X-Google-Smtp-Source: AGHT+IFOowcYbc9UGPU4UebT18/wT1TWItdGa2duoIxyYpu1Y9Ct0AVw0VIZkYW4g95lx8nUutCv9w==
X-Received: by 2002:a05:6214:230b:b0:880:48c6:acfb with SMTP id 6a1803df08f44-8829272cecamr22599146d6.49.1763100129390;
        Thu, 13 Nov 2025 22:02:09 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88286313d85sm25654276d6.23.2025.11.13.22.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 22:02:09 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7E053F4007E;
	Fri, 14 Nov 2025 01:02:08 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 14 Nov 2025 01:02:08 -0500
X-ME-Sender: <xms:4MUWaUW9TBngdUlsebKEWVEd3CPthB-EXkSOuq3IdCiukes6Y5szNg>
    <xme:4MUWaW9-x1xvX4_KVR7LvoJJ3kx0vhkm0AePy3IYfXg7khNFl2b8s93PfyFQr2Gji
    3UiclpRUQTmbgECB8eSBKQNa3EtRtlWdXl96vu5-z_OGYTWF0WX7g>
X-ME-Received: <xmr:4MUWaUZISAgxSvwIO9mKinPxBFdqnXYRGsf1oDuMLzlSzq4lp9bTejbVt7ZXlcHhmfWE2aPemogLg0pgGpnA2g4OmBakVS3o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdeltdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvvdduhedvgfegtdejgfehffeufffffeeuhefgfeefleejfedvudehjedvjeet
    hfenucffohhmrghinhepmhhsghhiugdrlhhinhhkpdgtohhunhhtvghrrdhsthhorhgvpd
    hprghrshgvrdhmrghpnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqie
    elvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdr
    tghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvuddpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepfihilhhlse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhnghhmrghnsehrvgguhhgrthdrtgho
    mhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrgh
    dprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggr
    khhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:4MUWaWdAmYwHEAuS6myJzKnT4uJVjW9o-z_a2L1EYAB0lvKVcS8m5Q>
    <xmx:4MUWaWoX20fc7ei8YseV6O-Ra3DfDJJ0bw-D6s-I3vEiKFuoFxBdcg>
    <xmx:4MUWaVDoGLuMTUZMLynTNvZ5WEaDD8ob9iKSi5A0M8abJBrqDbquQg>
    <xmx:4MUWacXXzBJXtZ0bIm3rPx-REalMYIpkFo4euXmDsAnNB0ON2qa0LQ>
    <xmx:4MUWaR6OgGj6v81DpA2pb_nAG_45aIZyIoRw-oAjM1gFN7YGmjz0Hsy7>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Nov 2025 01:02:07 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: "Will Deacon" <will@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	reg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Matthew Maurer <mmaurer@google.com>,
	David Gow <davidgow@google.com>
Subject: [PATCH 3/4] rust: debugfs: Replace the usage of Rust native atomics
Date: Thu, 13 Nov 2025 22:01:59 -0800
Message-ID: <20251114060200.12982-4-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251114060200.12982-1-boqun.feng@gmail.com>
References: <20251114060200.12982-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust native atomics are not allowed to use in kernel due to the mismatch
of memory model with Linux kernel memory model, hence remove the usage
of Rust native atomics in debufs.

Reviewed-by: Matthew Maurer <mmaurer@google.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Tested-by: David Gow <davidgow@google.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251022035324.70785-4-boqun.feng@gmail.com
---
 rust/kernel/debugfs/traits.rs       | 53 +++++++++--------------------
 samples/rust/rust_debugfs.rs        | 12 +++----
 samples/rust/rust_debugfs_scoped.rs |  6 ++--
 3 files changed, 25 insertions(+), 46 deletions(-)

diff --git a/rust/kernel/debugfs/traits.rs b/rust/kernel/debugfs/traits.rs
index ba7ec5a900b8..92054fed2136 100644
--- a/rust/kernel/debugfs/traits.rs
+++ b/rust/kernel/debugfs/traits.rs
@@ -4,14 +4,11 @@
 //! Traits for rendering or updating values exported to DebugFS.
 
 use crate::prelude::*;
+use crate::sync::atomic::{Atomic, AtomicBasicOps, AtomicType, Relaxed};
 use crate::sync::Mutex;
 use crate::uaccess::UserSliceReader;
 use core::fmt::{self, Debug, Formatter};
 use core::str::FromStr;
-use core::sync::atomic::{
-    AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize, AtomicU16, AtomicU32, AtomicU64,
-    AtomicU8, AtomicUsize, Ordering,
-};
 
 /// A trait for types that can be written into a string.
 ///
@@ -66,37 +63,21 @@ fn read_from_slice(&self, reader: &mut UserSliceReader) -> Result {
     }
 }
 
-macro_rules! impl_reader_for_atomic {
-    ($(($atomic_type:ty, $int_type:ty)),*) => {
-        $(
-            impl Reader for $atomic_type {
-                fn read_from_slice(&self, reader: &mut UserSliceReader) -> Result {
-                    let mut buf = [0u8; 21]; // Enough for a 64-bit number.
-                    if reader.len() > buf.len() {
-                        return Err(EINVAL);
-                    }
-                    let n = reader.len();
-                    reader.read_slice(&mut buf[..n])?;
+impl<T: AtomicType + FromStr> Reader for Atomic<T>
+where
+    T::Repr: AtomicBasicOps,
+{
+    fn read_from_slice(&self, reader: &mut UserSliceReader) -> Result {
+        let mut buf = [0u8; 21]; // Enough for a 64-bit number.
+        if reader.len() > buf.len() {
+            return Err(EINVAL);
+        }
+        let n = reader.len();
+        reader.read_slice(&mut buf[..n])?;
 
-                    let s = core::str::from_utf8(&buf[..n]).map_err(|_| EINVAL)?;
-                    let val = s.trim().parse::<$int_type>().map_err(|_| EINVAL)?;
-                    self.store(val, Ordering::Relaxed);
-                    Ok(())
-                }
-            }
-        )*
-    };
+        let s = core::str::from_utf8(&buf[..n]).map_err(|_| EINVAL)?;
+        let val = s.trim().parse::<T>().map_err(|_| EINVAL)?;
+        self.store(val, Relaxed);
+        Ok(())
+    }
 }
-
-impl_reader_for_atomic!(
-    (AtomicI16, i16),
-    (AtomicI32, i32),
-    (AtomicI64, i64),
-    (AtomicI8, i8),
-    (AtomicIsize, isize),
-    (AtomicU16, u16),
-    (AtomicU32, u32),
-    (AtomicU64, u64),
-    (AtomicU8, u8),
-    (AtomicUsize, usize)
-);
diff --git a/samples/rust/rust_debugfs.rs b/samples/rust/rust_debugfs.rs
index 82b61a15a34b..711faa07bece 100644
--- a/samples/rust/rust_debugfs.rs
+++ b/samples/rust/rust_debugfs.rs
@@ -32,14 +32,12 @@
 //! ```
 
 use core::str::FromStr;
-use core::sync::atomic::AtomicUsize;
-use core::sync::atomic::Ordering;
 use kernel::c_str;
 use kernel::debugfs::{Dir, File};
 use kernel::new_mutex;
 use kernel::prelude::*;
+use kernel::sync::atomic::{Atomic, Relaxed};
 use kernel::sync::Mutex;
-
 use kernel::{acpi, device::Core, of, platform, str::CString, types::ARef};
 
 kernel::module_platform_driver! {
@@ -59,7 +57,7 @@ struct RustDebugFs {
     #[pin]
     _compatible: File<CString>,
     #[pin]
-    counter: File<AtomicUsize>,
+    counter: File<Atomic<usize>>,
     #[pin]
     inner: File<Mutex<Inner>>,
 }
@@ -109,7 +107,7 @@ fn probe(
     ) -> Result<Pin<KBox<Self>>> {
         let result = KBox::try_pin_init(RustDebugFs::new(pdev), GFP_KERNEL)?;
         // We can still mutate fields through the files which are atomic or mutexed:
-        result.counter.store(91, Ordering::Relaxed);
+        result.counter.store(91, Relaxed);
         {
             let mut guard = result.inner.lock();
             guard.x = guard.y;
@@ -120,8 +118,8 @@ fn probe(
 }
 
 impl RustDebugFs {
-    fn build_counter(dir: &Dir) -> impl PinInit<File<AtomicUsize>> + '_ {
-        dir.read_write_file(c_str!("counter"), AtomicUsize::new(0))
+    fn build_counter(dir: &Dir) -> impl PinInit<File<Atomic<usize>>> + '_ {
+        dir.read_write_file(c_str!("counter"), Atomic::<usize>::new(0))
     }
 
     fn build_inner(dir: &Dir) -> impl PinInit<File<Mutex<Inner>>> + '_ {
diff --git a/samples/rust/rust_debugfs_scoped.rs b/samples/rust/rust_debugfs_scoped.rs
index b0c4e76b123e..9f0ec5f24cda 100644
--- a/samples/rust/rust_debugfs_scoped.rs
+++ b/samples/rust/rust_debugfs_scoped.rs
@@ -6,9 +6,9 @@
 //! `Scope::dir` to create a variety of files without the need to separately
 //! track them all.
 
-use core::sync::atomic::AtomicUsize;
 use kernel::debugfs::{Dir, Scope};
 use kernel::prelude::*;
+use kernel::sync::atomic::Atomic;
 use kernel::sync::Mutex;
 use kernel::{c_str, new_mutex, str::CString};
 
@@ -62,7 +62,7 @@ fn create_file_write(
     let file_name = CString::try_from_fmt(fmt!("{name_str}"))?;
     for sub in items {
         nums.push(
-            AtomicUsize::new(sub.parse().map_err(|_| EINVAL)?),
+            Atomic::<usize>::new(sub.parse().map_err(|_| EINVAL)?),
             GFP_KERNEL,
         )?;
     }
@@ -109,7 +109,7 @@ fn init(device_dir: Dir) -> impl PinInit<Self> {
 
 struct DeviceData {
     name: CString,
-    nums: KVec<AtomicUsize>,
+    nums: KVec<Atomic<usize>>,
 }
 
 fn init_control(base_dir: &Dir, dyn_dirs: Dir) -> impl PinInit<Scope<ModuleData>> + '_ {
-- 
2.50.1 (Apple Git-155)

