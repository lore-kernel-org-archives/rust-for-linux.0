Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CBB270545
	for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 05:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779168921; cv=none; b=Jr8wBSt78Xj11PGbtuiUCi0R0Sr3Y/cC6EcM58P4rX6+cxnYZG38zsV5GOFxPGEO4+vQM8kuSF5NjJG0kzDm7Suh5EqEuJYtWwuss813hmPutgwAaIiTBAjqgNqiyIJb/heLn+/dWABwE/F5PIImMCKU/Vx7bj03rhNK9WEj2Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779168921; c=relaxed/simple;
	bh=AV47rjXFO0/wbv6GFtBokp+VX/PNUmOVVoRmvyG9Rk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pt9tOqFhy+OP/Cx3ZCrh0gA5iPgaRc6aFSrcMb7vr2iaTy1lbznTnvq4FzY6SinaWAfKvZWoCz4J00ZG1TAUuDUyACeFSFhOC2e3xvsNoVwUzZVunb0py6SjVMqLFSS21chdndMcg/xD5kXUG0X5Wmv6RE9KD8bO0xpNHMzW770=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uc7S+XFN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uc7S+XFN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1515C2BCC6;
	Tue, 19 May 2026 05:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1779168920; bh=AV47rjXFO0/wbv6GFtBokp+VX/PNUmOVVoRmvyG9Rk0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uc7S+XFNDN91hI9y1gsYxrsN1RmvF5WhxeUl1Hpyzjk4gj8wbgCe6O6dwpAxgJSg6
	 rXq4ITXKen/ZxvlUBWJMNcyEk2AVm9etdypB/cHXBjowBxt/d0SWz1Sa1DeC7T99Za
	 +3kHnXjIJZYbr6kKdzBCIbDH31Nn5pRHDJfxTT9Q=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2717CD4F3C;
	Tue, 19 May 2026 05:35:20 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Tue, 19 May 2026 13:34:41 +0800
Subject: [PATCH 1/2] rust: miscdevice: use vertical import style
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-miscdev-use-format-v1-1-11d526ba0edc@linux.dev>
References: <20260519-miscdev-use-format-v1-0-11d526ba0edc@linux.dev>
In-Reply-To: <20260519-miscdev-use-format-v1-0-11d526ba0edc@linux.dev>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779168918; l=1407;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=AV47rjXFO0/wbv6GFtBokp+VX/PNUmOVVoRmvyG9Rk0=;
 b=t9Ye+6Xap/iUlkXHP+CfWKY317+CU3NfiNg33SO7TP5E8DaKgbD3GEmVk0cJbbkMV2+iA2yln
 4a0I3B59UXiDRej/luwIRtV3QTaV4m5Ip8YTrV+QuHmr/Tk05blj0Sd
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Convert `use` imports to vertical layout for better readability and
maintainability.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/kernel/miscdevice.rs | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index c3c2052c92069..05a6b6b9770f2 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -11,16 +11,38 @@
 use crate::{
     bindings,
     device::Device,
-    error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
-    ffi::{c_int, c_long, c_uint, c_ulong},
-    fs::{File, Kiocb},
-    iov::{IovIterDest, IovIterSource},
+    error::{
+        to_result,
+        Error,
+        Result,
+        VTABLE_DEFAULT_ERROR, //
+    },
+    ffi::{
+        c_int,
+        c_long,
+        c_uint,
+        c_ulong, //
+    },
+    fs::{
+        File,
+        Kiocb, //
+    },
+    iov::{
+        IovIterDest,
+        IovIterSource, //
+    },
     mm::virt::VmaNew,
     prelude::*,
     seq_file::SeqFile,
-    types::{ForeignOwnable, Opaque},
+    types::{
+        ForeignOwnable,
+        Opaque, //
+    },
+};
+use core::{
+    marker::PhantomData,
+    pin::Pin, //
 };
-use core::{marker::PhantomData, pin::Pin};
 
 /// Options for creating a misc device.
 #[derive(Copy, Clone)]

-- 
2.43.0


