Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BC11D89EF
	for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 05:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779168921; cv=none; b=o0MJDG65CxjH73uwbJjk4coB+GJDiGkj90kml5xpnV98k7QdPjI/MS2eNYah4C4MkrZqy89x3IRkw3hWS2sCkA71bSreM6jk0IesP4BahSvTL/TTawNfu/A2Bl1wdLItevLD6gpASykVG04h5qN/ScqSmdnGquMv0zUImlTK6rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779168921; c=relaxed/simple;
	bh=MzOQ5Pt5s4zhpYWvG5X1Gx7JCP+doFfRKRAXWizMD0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jt00oUiVvOWAGyPqTSMfy7i0pI+aAjMeJw0GuSguQnfgMKAsaQPM6m8WOfyS+gqPJFls/2+CPRKm6K0ukb5YRQ7xiyvDfZC3DgWJ7TiW2zwX8V+LQ0kP6tVbNYY3ZnmCoyIMKLmCFtCzJTI/OeptWitU7i98oF7qQvq0PrszyVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m+9GuP1+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m+9GuP1+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF3E6C2BCF5;
	Tue, 19 May 2026 05:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1779168920; bh=MzOQ5Pt5s4zhpYWvG5X1Gx7JCP+doFfRKRAXWizMD0s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m+9GuP1+c7rtqDw3acfvEQINMIzeLZq911iehUWVhRgVZCma2rNiVQQ8Gs6W0XAPD
	 qyafCgt0jpRNed9S2xy2jj8a6iQaRolcBFad90z0hpYZJSXvxWBdURqeMJgRQU4u0r
	 cSBQB47itAXJ5X09aZ2hiZZTxMKySjLTDTd1qJ58=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2866CD4851;
	Tue, 19 May 2026 05:35:20 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Tue, 19 May 2026 13:34:42 +0800
Subject: [PATCH 2/2] samples: rust_misc_device: use vertical import style
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-miscdev-use-format-v1-2-11d526ba0edc@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779168918; l=1443;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=MzOQ5Pt5s4zhpYWvG5X1Gx7JCP+doFfRKRAXWizMD0s=;
 b=PhTXsILOq2s+5tTEFUo9io3ipRSI7Enl3eczdH5Q5o/rHdAnqvAlfdiH4ZwQn2Wht5ryUdViT
 DQ2nzApDszOBT03h8KplssmKqvv+iOlyE/s8Zx0I0E/S+QAk+Z7S4Py
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Convert `use` imports to vertical layout for better readability and
maintainability.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 samples/rust/rust_misc_device.rs | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index 87a1fe63533ae..41e26c825060b 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -97,14 +97,36 @@
 
 use kernel::{
     device::Device,
-    fs::{File, Kiocb},
-    ioctl::{_IO, _IOC_SIZE, _IOR, _IOW},
-    iov::{IovIterDest, IovIterSource},
-    miscdevice::{MiscDevice, MiscDeviceOptions, MiscDeviceRegistration},
+    fs::{
+        File,
+        Kiocb, //
+    },
+    ioctl::{
+        _IO,
+        _IOC_SIZE,
+        _IOR,
+        _IOW, //
+    },
+    iov::{
+        IovIterDest,
+        IovIterSource, //
+    },
+    miscdevice::{
+        MiscDevice,
+        MiscDeviceOptions,
+        MiscDeviceRegistration, //
+    },
     new_mutex,
     prelude::*,
-    sync::{aref::ARef, Mutex},
-    uaccess::{UserSlice, UserSliceReader, UserSliceWriter},
+    sync::{
+        aref::ARef,
+        Mutex, //
+    },
+    uaccess::{
+        UserSlice,
+        UserSliceReader,
+        UserSliceWriter, //
+    },
 };
 
 const RUST_MISC_DEV_HELLO: u32 = _IO('|' as u32, 0x80);

-- 
2.43.0


