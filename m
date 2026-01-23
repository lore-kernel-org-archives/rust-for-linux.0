Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDB2248176;
	Fri, 23 Jan 2026 17:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769191149; cv=none; b=XyahqiKMkomD1qArphiVFMbPqZHYODWqw51X/tB5IQRX2CUHZZiWuWE4gUQZAvsV6aCMBdRw9+29r+EKFcwwgsSlpAOQ5gYcD11/kHL9wonxG+QRdr8zwV/Waenh198rLwt8bRXvVcsN8K0wLbOHM3Vm9963B9v8HY3zhcbGi/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769191149; c=relaxed/simple;
	bh=aTqrIlLZAZ3Vtxta/T/iC9T32Liq5KpRL+vvhmuqCdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P1qRC24n3uaTeJzaS++Jx6qjmoKhvXkxMDiXozMS19s35iBS1PJlwsS/VH7sVjuPMI/Me7dw9826n8IlmKjK5Q0dJLi1h++u5BqEmQ+geRzHbUWccxPOTdqeQhpwYILUViNf8BY+xjbd8FP1V17tlKHXUqN59Ob6Gl72bNbxC6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvCL+TGe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvCL+TGe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58577C4CEF1;
	Fri, 23 Jan 2026 17:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769191148;
	bh=aTqrIlLZAZ3Vtxta/T/iC9T32Liq5KpRL+vvhmuqCdU=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=RvCL+TGeeCCsZvDsWhioknOI52Jk6yLQ9rAj7fvJ1MGlrG9o3Uf6BnZtR2NxTx/20
	 6jSvr10JTNDDMsHzAJrH2kyiL5pUZT6IzImWW6kr8tqreFNrdU8sH7iI8jc8FAexY4
	 lxjjk7GH2ZiO+AEPMFdz4eeb1bRfI/aA9OdUqCCG+sG4IDJguas7YFfXZ0hX2JJ+DH
	 ob8dm/cIi294GO56kbqXI7uU3xfjPSpa4as1aCrZ//wVAZi6ncxq8BSCTeLSHfe4j7
	 E3BOCEjF6oeAWoEiXibEe2EYLjBje/nbYspGJJQNW6JS2E2UUdO5/TIWMEhwnqVMtf
	 cAZQdiKL9Bo+Q==
From: Gary Guo <gary@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] rust: device: support `dev_printk` on all devices
Date: Fri, 23 Jan 2026 17:58:38 +0000
Message-ID: <20260123175854.176735-1-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Currently, `dev_*` only works on the core `Device`, but not on any other
bus or class device objects. This causes a pattern of
`dev_info!(pdev.as_ref())` which is not ideal.

This adds support of using these devices directly with `dev_*` macros, by
adding `AsRef` call inside the macro. To make sure we can still use just
`kernel::device::Device`, as `AsRef` implementation is added for it; this
is typical for types that is designed to use with `AsRef` anyway, for
example, `str` implements `AsRef<str>` and `Path` implements `AsRef<Path>`.

Signed-off-by: Gary Guo <gary@garyguo.net>
---

Notes:
    v1 -> v2:
    - split change to samples/rust to subsystems
    - converted more cases where `as_ref()` is only for dev_printk
    - Link to v1: https://lore.kernel.org/rust-for-linux/20260120181152.3640314-1-gary@kernel.org/

 rust/kernel/device.rs | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index c7b5db9dcca1..94e0548e7687 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -601,6 +601,13 @@ impl DeviceContext for Core {}
 impl DeviceContext for CoreInternal {}
 impl DeviceContext for Normal {}
 
+impl<Ctx: DeviceContext> AsRef<Device<Ctx>> for Device<Ctx> {
+    #[inline]
+    fn as_ref(&self) -> &Device<Ctx> {
+        self
+    }
+}
+
 /// Convert device references to bus device references.
 ///
 /// Bus devices can implement this trait to allow abstractions to provide the bus device in
@@ -720,7 +727,7 @@ macro_rules! impl_device_context_into_aref {
 macro_rules! dev_printk {
     ($method:ident, $dev:expr, $($f:tt)*) => {
         {
-            ($dev).$method($crate::prelude::fmt!($($f)*));
+            $crate::device::Device::$method($dev.as_ref(), $crate::prelude::fmt!($($f)*))
         }
     }
 }

base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
-- 
2.51.2

