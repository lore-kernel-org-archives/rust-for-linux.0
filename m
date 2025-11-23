Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AA725BEE7
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 09:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763889975; cv=none; b=T9G4LTFwzBTttghROk3kKotrgERoRqe9QmWLPbOnuinv2OJjTBvK3+vEjL5BSq6uMEzVDamc2au0dV3uNTQ9FD2rD9Gy2kJaFOKlChCopxIVwU6ALRIyB8cFE89wrB0c+c6kInzym8I9I8VgxfZoYUdO8jCcURPeC7UGZHo++t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763889975; c=relaxed/simple;
	bh=hhfQrE5YZ3yIRunnDvDHhBDE/s9hEASQ0QrKj2P8WKM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A9nU+6mUTi+qv+FfmdC5lJjcco3MZZ+wjdxwirI9AEKWhEjyhWXPLbmk9rgxzpBvkGiVVll8rvgOUZFdAxguexUrT5OpCT3JZAVULJ6Dx/y0rwnSKW2sY11NIfyRlgbYr/x3oLFbXnwTKT4lQsc35ciu9krwwYhZ2Yel/hYnzyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiAV9r6F; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiAV9r6F"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29555b384acso41492825ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 01:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763889973; x=1764494773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+x/h+SXCaTPKwxrPZvI12zlFOq5qesnIaQFOZDdW/8=;
        b=kiAV9r6FmOiWCtQ6Ze4vNr0M53qDbdtc3997baVpmjkm3EjjJVhEOmQzAttiz4wMMl
         tgKKFYLpvHaOYEvfgplEMbF+CvFCdvcWHGHDCQAL8x5z2VFYXkrzF4IqZIuoBivGtJbr
         CckWkDH8RLjnhKTWJFT1rtOUddaoKCymFuqE+rkmFfPr5BQOOIFNQZihmuyOP29GFQ7x
         Yu8y740jqi+Qdh0CVdvt6i8VBs4JpB89zhMckAEzb6WvZ2hVGnCDUnBhwPkwEEEPY2Jf
         vqKwe29WtM2Yqn5TeLV5rt/AoNHLEifWSXzPnBrBzHKj8HJWO0QYNwifucYtF7Heg7aI
         Ablw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763889973; x=1764494773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c+x/h+SXCaTPKwxrPZvI12zlFOq5qesnIaQFOZDdW/8=;
        b=KMnr59GhNScOqQ+xMYadkbcUAJBVaQXsrBdd+54q6JWWUaD6Mkr7utSf8RryLVGTmO
         EUG9VhQaNSL9GbqPYHqP9PffpUD1U+E6/r3qwAIHffSFUVDfRC2Wc3G149TsgW4ZVUM7
         fI72oTvoRGASi5eurAz4BdPv4CmkAK3VTS+dx6zqYGlqfQTnJjI6wWM1yGFQi0DSMVfp
         URo8e/ZE2zPfQVrYK9S3rBnnRW5Et02na98l5c0Y8TsgDjVeVI5CvygBpHBD2k2HrpxY
         pl+jWSwELSF5ZqaZg1rrYY8LuSHK/AgkmZbBZBxQm4kL4IJfLSLTVVdu2XIesyHcVA3y
         3b4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOuNkWJIHWOrvm6F1FHZECwT0Yjo5fshSQu4YxQYGyUwFaWmEu8G/UFXDg0YCTK2oLhG2ZqE5H3Vwu+yXutg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy+Tg1k+QHok5/oyMmmZoy1xVI5tM/YqG89NqN91AS9DotimXE
	l3czwwcomPmJkAC0qCLjiJ/+2eLnM7P0ehvkEYIeBBw2NYwSGdyuYNkZ
X-Gm-Gg: ASbGnct2NDMnS1AYUkiNt2HiBptV4XYkETBTAtNnIpZJMBFi7Ua2Z2bRn3poyGKk9YB
	gXtEEu52nCzGsIGW2u0wv7b/ufXpDSuGoAI0t7nSpztYGe1g2GArbAmERQzwH2DOCKO1iIQ+3Iz
	cZ23j7ixm+F9Sj3XAXngbmqZt7siUdqaso0g22lcDYHsPiqdm/KnH1G/g8p4ZjSWKcUVhmYlCW+
	7nkVqSewOs4fh1b2q4sllx/3ccjBWqe96y4vbRiL4fa3LPcnZKxcuO6n/V2RisZtSMsI9RjEf+R
	d/qezkYJlhb1VLNS3iGwkbY20nILXAUWoMIcrTHhZHs9ks0wEkLyFech6bpNI5BCptNGhMDm6zJ
	EVzX0NbMeYTzDYOuOSecTsctK+HxMHQI4qpYDb7HElGddJWYzkBQot4CwWgsN8iOAR1CluTsU3k
	CSs3ghQf74rT/tLSv1fob+s9x6xA==
X-Google-Smtp-Source: AGHT+IFvuN898s0PRn7IHqlJzrCusouHL8HLAX1/JMZBn/PsKfoSrrGmFHNZ/OFvx15QZ7pZgA79MQ==
X-Received: by 2002:a17:903:3c30:b0:298:8a9:766a with SMTP id d9443c01a7336-29b6c6b2e57mr86965995ad.53.1763889973533;
        Sun, 23 Nov 2025 01:26:13 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 01:26:13 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alexandre Courbot <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH 03/10] rust: device: Update ARef and AlwaysRefCounted imports from sync::aref
Date: Sun, 23 Nov 2025 14:54:31 +0530
Message-Id: <20251123092438.182251-4-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251123092438.182251-1-shankari.ak0208@gmail.com>
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update call sites to import `ARef` and `AlwaysRefCounted`
from `sync::aref` instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 rust/kernel/device.rs          | 4 ++--
 rust/kernel/device/property.rs | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index c79be2e2bfe3..21bde8d95185 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -158,7 +158,7 @@
 /// `bindings::device::release` is valid to be called from any thread, hence `ARef<Device>` can be
 /// dropped from any thread.
 ///
-/// [`AlwaysRefCounted`]: kernel::types::AlwaysRefCounted
+/// [`AlwaysRefCounted`]: kernel::sync::aref::AlwaysRefCounted
 /// [`impl_device_context_deref`]: kernel::impl_device_context_deref
 /// [`pci::Device`]: kernel::pci::Device
 /// [`platform::Device`]: kernel::platform::Device
@@ -540,7 +540,7 @@ pub trait DeviceContext: private::Sealed {}
 /// [`Device<Normal>`]. It is the only [`DeviceContext`] for which it is valid to implement
 /// [`AlwaysRefCounted`] for.
 ///
-/// [`AlwaysRefCounted`]: kernel::types::AlwaysRefCounted
+/// [`AlwaysRefCounted`]: kernel::sync::aref::AlwaysRefCounted
 pub struct Normal;
 
 /// The [`Core`] context is the context of a bus specific device when it appears as argument of
diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 3a332a8c53a9..413221817ef1 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -14,7 +14,8 @@
     fmt,
     prelude::*,
     str::{CStr, CString},
-    types::{ARef, Opaque},
+    sync::aref::ARef,
+    types::Opaque,
 };
 
 /// A reference-counted fwnode_handle.
@@ -359,7 +360,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 // SAFETY: Instances of `FwNode` are always reference-counted.
-unsafe impl crate::types::AlwaysRefCounted for FwNode {
+unsafe impl crate::sync::aref::AlwaysRefCounted for FwNode {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the
         // refcount is non-zero.
-- 
2.34.1

