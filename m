Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3415242B75E;
	Thu, 14 May 2026 15:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771448; cv=none; b=asyOjValKV9LWHVDCGOtKt4XjxrxPePsvR9IPV6m+BVhqFEBPWChti6zpZBypfcGNQ61PtEJwU/FXJ85oxemRwi+UfqpD/YODxejef+wrO3IFkgF4nVETbOOCPTK2iNL89jbJU0TuykQiOU+iTRNl156wEy76mJ3A0QwLGiZLzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771448; c=relaxed/simple;
	bh=vpnqcCkdkxkjCbHeMjUGkoQBZ0cBqZL5/yo/spdfsjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MgmUCLupDenHkeHmasf7ZxYPpEv8wxhbvBqC3LH8Sf/9xh9osCiZx4j7PNUa9vHGsqh02lEmXt87Yn1ZjPu5TCxDLOsriu9nxHEr0/epKnmr98Xar+bUUA37bzEAFGodqsS8ShEpmPrt0rpt2yaubfaQT0WJKswzbKHRiCkceVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=je8I2rY8; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="je8I2rY8"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A24F1477;
	Thu, 14 May 2026 08:10:34 -0700 (PDT)
Received: from e143943.arm.com (unknown [10.57.23.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 08B3D3F836;
	Thu, 14 May 2026 08:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778771439; bh=vpnqcCkdkxkjCbHeMjUGkoQBZ0cBqZL5/yo/spdfsjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=je8I2rY88tHi3txa9qyczzTte3znDUsNnImNnqM3bSgg+rMmEeLus8il0/aKoZnXO
	 wcyoCrhZOdIT88VL+sRruDZw94CPVg6c9IK7pRVYSFncLk0W24EJLa1PDfiSBgMW1m
	 LCh6OfW5GCvHlSIkOKDRPkjOdXioKvp7bN/1J294=
From: Beata Michalska <beata.michalska@arm.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/3] rust/platform: Add support for runtime PM
Date: Thu, 14 May 2026 17:09:04 +0200
Message-ID: <20260514150957.3501924-3-beata.michalska@arm.com>
In-Reply-To: <20260514150957.3501924-1-beata.michalska@arm.com>
References: <20260514150957.3501924-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wire the per-driver dev_pm_ops pointer into platform_driver
registration so Rust drivers can expose PM callbacks to the PM core.
Also add a TryFrom implementation from Device<CoreInternal>
to platform::Device so generated PM callbacks can recover
a platform device from the generic device pointer received
from the PM core.

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 rust/kernel/platform.rs | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 8917d4ee499f..d100adc2ef76 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -72,6 +72,11 @@ unsafe fn register(
             None => core::ptr::null(),
         };
 
+        let pm_ops = match T::PM_OPS {
+            Some(ops) => ops,
+            None => core::ptr::null(),
+        };
+
         // SAFETY: It's safe to set the fields of `struct platform_driver` on initialization.
         unsafe {
             (*pdrv.get()).driver.name = name.as_char_ptr();
@@ -79,6 +84,7 @@ unsafe fn register(
             (*pdrv.get()).remove = Some(Self::remove_callback);
             (*pdrv.get()).driver.of_match_table = of_table;
             (*pdrv.get()).driver.acpi_match_table = acpi_table;
+            (*pdrv.get()).driver.pm = pm_ops;
         }
 
         // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
@@ -218,6 +224,9 @@ pub trait Driver: Send {
     /// The table of ACPI device ids supported by the driver.
     const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = None;
 
+    /// Runtime PM callbacks
+    const PM_OPS: Option<&'static bindings::dev_pm_ops> = None;
+
     /// Platform driver probe.
     ///
     /// Called when a new platform device is added or discovered.
@@ -555,6 +564,15 @@ fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
     }
 }
 
+impl TryFrom<&device::Device<device::CoreInternal>> for &Device {
+    type Error = kernel::error::Error;
+
+    fn try_from(dev: &device::Device<device::CoreInternal>) -> Result<Self, Self::Error> {
+        let pdev_ci: &Device<device::CoreInternal> = TryFrom::try_from(dev)?;
+        Ok(pdev_ci)
+    }
+}
+
 // SAFETY: A `Device` is always reference-counted and can be released from any thread.
 unsafe impl Send for Device {}
 
-- 
2.43.0

