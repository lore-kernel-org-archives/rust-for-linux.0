Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76012155352
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 21:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.84.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724101400; cv=none; b=EGV3ScA9AgZrzChbAAagzgMkDfxbf+kaBzTm4Fx0fUt3buDzMYZYJp/cTlzly5bRVIBv6zgEYbxr/eOtClrCg7w8uJhyT8VieS30P9XtqHHe+gwLE7v0moebfAE9XRhRLD+5TM5XKCR6jI8+bSYvvEkC5d0UGLJA/HhAe0eZnRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724101400; c=relaxed/simple;
	bh=zs7Re/DSiHPAazALbNBJ70MCUbD8/wUG5v6MNWWsWH4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CFUL+WwZDbGu99ebSvEaQp9xvT9Rxx3j5ChUUa2WoURRxtbGd4DJFNj4UnbaMPc4BHBcQKOeNNJSCX3B9r7Ts4n+Al1eQ0Lf1gXcTFADsDSH8h2bBJfFgppeWkGj82KEyzpWRIk9EP8euGTEI/ZTUGL3wivOXx7OGM4iR0F9Qig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iodoru.org; spf=pass smtp.mailfrom=iodoru.org; arc=none smtp.client-ip=176.9.84.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iodoru.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iodoru.org
Received: from localhost (localhost [127.0.0.1])
	by mail.desaster-games.net (Postfix) with ESMTP id 5C8671F004;
	Mon, 19 Aug 2024 22:57:37 +0200 (CEST)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
	by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8vT1LWHd64yL; Mon, 19 Aug 2024 22:57:37 +0200 (CEST)
Received: from ymir.nue2.suse.org (unknown [81.95.8.245])
	by mail.desaster-games.net (Postfix) with ESMTPSA id 3844514007;
	Mon, 19 Aug 2024 22:57:37 +0200 (CEST)
From: Michael Vetter <jubalh@iodoru.org>
To: rust-for-linux@vger.kernel.org
Cc: Michael Vetter <jubalh@iodoru.org>
Subject: [PATCH] rust: fix typos in documentation
Date: Mon, 19 Aug 2024 22:57:31 +0200
Message-Id: <20240819205731.2163-1-jubalh@iodoru.org>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistakes in code comments.

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 rust/kernel/init/macros.rs | 4 ++--
 rust/kernel/net/phy.rs     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/init/macros.rs b/rust/kernel/init/macros.rs
index 02ecedc4a..9a0c4650e 100644
--- a/rust/kernel/init/macros.rs
+++ b/rust/kernel/init/macros.rs
@@ -145,7 +145,7 @@
 //!         }
 //!     }
 //!     // Implement the internal `PinData` trait that marks the pin-data struct as a pin-data
-//!     // struct. This is important to ensure that no user can implement a rouge `__pin_data`
+//!     // struct. This is important to ensure that no user can implement a rogue `__pin_data`
 //!     // function without using `unsafe`.
 //!     unsafe impl<T> ::kernel::init::__internal::PinData for __ThePinData<T> {
 //!         type Datee = Bar<T>;
@@ -156,7 +156,7 @@
 //!     // case no such fields exist, hence this is almost empty. The two phantomdata fields exist
 //!     // for two reasons:
 //!     // - `__phantom`: every generic must be used, since we cannot really know which generics
-//!     //   are used, we declere all and then use everything here once.
+//!     //   are used, we declare all and then use everything here once.
 //!     // - `__phantom_pin`: uses the `'__pin` lifetime and ensures that this struct is invariant
 //!     //   over it. The lifetime is needed to work around the limitation that trait bounds must
 //!     //   not be trivial, e.g. the user has a `#[pin] PhantomPinned` field -- this is
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index fd40b703d..91dac63ff 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -491,7 +491,7 @@ impl<T: Driver> Adapter<T> {
 pub struct DriverVTable(Opaque<bindings::phy_driver>);
 
 // SAFETY: `DriverVTable` doesn't expose any &self method to access internal data, so it's safe to
-// share `&DriverVTable` across execution context boundries.
+// share `&DriverVTable` across execution context boundaries.
 unsafe impl Sync for DriverVTable {}
 
 /// Creates a [`DriverVTable`] instance from [`Driver`].
-- 
2.35.3

