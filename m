Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4FC47DD42;
	Fri, 22 May 2026 17:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779469983; cv=none; b=VN2YB0LqgL8piLlM3K5IGGFaka8UH90bgNcKASpbpfYxWpJfUaYpGlZm0VWT7Jf5XwCeksA0csu6uKpzAgevBFNUf8YNie6p/YdRKxa5W4vqL1BhvzGG5CAg33RODNi/jLs3SGKl30Dl5bXXHSDARW33oriRfymn+eCaLDM3s0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779469983; c=relaxed/simple;
	bh=QHPl3FdxSK5t2AimauYdUsFspKALGMrQLr9cwIIAC5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r/8ubj/sLkN+YoMrnkokDbxIrkxp3eTbrM3UKBIx7cucig4MXT638KOk2AZGGbRF3QzJcbyHkNutSPqq+efqsVMJG2uIufZcd2wRaZfXW6oNlMpj/5XCwiePS/VKvYBO/b3CE0VUxzRs635YqzTRciApt3lklLkXSDVCjYWraUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKW2hEEJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKW2hEEJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778321F00A3F;
	Fri, 22 May 2026 17:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779469982;
	bh=KNGi0wIN15aq3Bf92E24Fes1mI/qLY4ql43zmrD3jWI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dKW2hEEJYcecByMpiN8INKPZPVasOsr8/cwQ2PcZqcmJ2+YdGKVaYAmj4GCHL8Jze
	 SNicTSneN0mH36FGB9MNBpzqOI5+0yUH33LzR4pa20/qAIXKenTIt87WEc2poGja+p
	 Xt/rcEQ/p5ctKh08VCjj2T6Ot9oRsh7+ju1Lvi0MbUElhw8D5F663nQsND3sEMORwk
	 yq1pxEZ+QiSlINnhotfB1hPfJIlnsh5l18cFuWblddtKRAb+GkZK/M/rgPZ8VY4XyN
	 kiasRRY+DnWgwcy0nfoS8mT6f8BkYzeWihBIhPdTgYUPCGpeoZziBn6qLyWTf++zJd
	 5K9r+C3BXrEtQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 22 May 2026 19:12:46 +0200
Subject: [PATCH 1/6] rust: binder: use strict provenance APIs
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-binder-strict-provenance-v1-1-3d6e9406e864@kernel.org>
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
In-Reply-To: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973; i=tamird@kernel.org;
 h=from:subject:message-id; bh=QHPl3FdxSK5t2AimauYdUsFspKALGMrQLr9cwIIAC5Q=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFkCfdNy+PeH5S9SvWm90WDOIvXko5qSW/r3zLt1obL/p
 uJx17vsHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKa6eg0jww3Zj9Ouv066WWHLbL00cvuSNWV6z6OWrttZYXLz/4uGzWWMDG1LxK5
 EsbUyJDBrPW7IWOV2w4Zh0+9LpvbOm1ZxhySJ8wIA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Replace the pointer-to-integer conversions in the Binder Rust driver
with calls to the strict provenance APIs.

The strict provenance APIs were stabilized in Rust 1.84.0 [1]. Since
commit f32fb9c58a5b ("rust: bump Rust minimum supported version to
1.85.0 (Debian Trixie)"), the minimum supported Rust version is
1.85.0, so no polyfills are needed.

Link: https://blog.rust-lang.org/2025/01/09/Rust-1.84.0.html#strict-provenance-apis [1]
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 drivers/android/binder/node.rs             | 2 +-
 drivers/android/binder/rust_binder_main.rs | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index 69f757ff7461..d710940c3c8f 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -321,7 +321,7 @@ pub(crate) unsafe fn remove_node_info(
     /// An id that is unique across all binder nodes on the system. Used as the key in the
     /// `by_node` map.
     pub(crate) fn global_id(&self) -> usize {
-        self as *const Node as usize
+        (self as *const Node).addr()
     }
 
     pub(crate) fn get_id(&self) -> (u64, u64) {
diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index dc1941cd2407..d487638266e3 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -511,7 +511,7 @@ unsafe impl<T> Sync for AssertSync<T> {}
     _: *mut kernel::ffi::c_void,
 ) -> kernel::ffi::c_int {
     // SAFETY: Accessing the private field of `seq_file` is okay.
-    let pid = (unsafe { (*ptr).private }) as usize as Pid;
+    let pid = unsafe { (*ptr).private }.addr() as Pid;
     // SAFETY: The caller ensures that the pointer is valid and exclusive for the duration in which
     // this method is called.
     let m = unsafe { SeqFile::from_raw(ptr) };

-- 
2.54.0

