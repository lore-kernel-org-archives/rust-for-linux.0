Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821995;
	b=dA6Ka3P1ruUUd2OA3lMlwf1ePFi2Ufr8Un6n4Si1aV6l9AoSpGnBULcb3tMn1mEzhcEj
	 271m+rOR9LN1yKo4Ul9Do7Ra9Tb5FJ9FcMzsx4AY/ckvTEmGKO3nw6T4XxdCFhNaLc28m
	 sMyjha0JjqdyZ7VGZ1Csd9+TYttb7ZA3w7mNZg5l9MlX3bhpFPLcu/I9bhkXO8u4PKmRr
	 mhTfJ5xNZr83hzrdk8EFV9bmeojTOQMzc8h/aalxXv32v8M9cr1mxnhTx5uNSIwrEpMdM
	 08Cm3aRD13j5t3570q6WlAZ8TaXYKuTdh3jjxY0l2/iaxI0WLGBhW6pq4Kvj/AQL5Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DgMXGwoDfcCa/yJ887xjBK4NIqHOZAB7bCFC/enAXGE=;
	b=uGURHOz5B+psXNVUVaRMMfPonuGbGq7/JB+0yXki9/YxqIlaeKl9w7R9G0HM2r+m67Ca
	 tvcCASZABOxSO9IBnxgMa50hvaBT1ymL8Do0EPIRJnuOjBJHq/xj8qxqSCejWIILhIvcw
	 LoKqJVaaDZzihO/QV6CQMiQLH6DHf1untK+KEqJGtdxApa5Do8XYT5kpZARxttoXPc4Ar
	 cNrPY7uXDPHW6pFyyHF7cwpKk+B9YdMxUEY7CHwsT6D0VrgzqqneIurRsqBiMrTLiR62p
	 wR7qK4GKpuXggZfoCSm8V3X1CSzEZ4iCxLiVai2JbxTN1Iew88fCDiR79WUiQOk4Kew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tBHUKu/L";
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CED60DBA74
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 19:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99CED60DBA74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tBHUKu/L
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7ce77f98658so356885137.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Nov 2026 11:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793821993; x=1794426793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DgMXGwoDfcCa/yJ887xjBK4NIqHOZAB7bCFC/enAXGE=;
        b=tBHUKu/LnasYdYAU1cvEDaQRvA/Z484rVSLtxKLBECgB51adJInJ4xjk7UZDtbOpGl
         GlOOnYgKZaUk9Qsgd8vxNyJ9s9fQqO1B4uEKW70g865fssUla6aZB8Y+T5VE8h/J0BaW
         te2GZrXa5037Np8XziK41bhGVsN2epuONd1tRwHmRujGBU7dSmwjkBJsCGwn4OgCQ8xy
         eAmrkP1eg20lydkOg5bl0AVgqs+LbHWA6IhYhfq+LEzk625Ri1KrYZCCFgIU5DYw+DGT
         FR2TcoDH1eX+30MkzprEYvVsnW3ZY0cZlnFRV6VbBTu/lESmX+yovd82RB8WPWe7Ccv5
         CVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821993; x=1794426793;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgMXGwoDfcCa/yJ887xjBK4NIqHOZAB7bCFC/enAXGE=;
        b=TYi7Jw9hKy3i9if++JeZRbEw9CId32awF3nAATO4onnK+MydkJuVjD43uozry1UsKM
         ++5At2bN1hhagVHUgmNy3VrRKLRxn/3E6CkHX08hUA+1t0J/xFRHa2vXJCIs2fy0hLzZ
         AHMiWHChPtbbpRHpq8OUNuPNeXOHI0YjDEVolopl3NpFDyk9H23Cc1WAnEbiOt7zyja5
         C/GpFmSVCJZO46ilChB2rjLGj1wsGEYnh8erqUCJEKm+sn3UPsUfwaIWVZ/JhFCZ3Ze4
         +Jk+JTznnF2/Hif13CyUcMj7NEqrM1/c36pqfp0PSbSR2IhAednFlR4sZsJV8b8iMPiZ
         FA9Q==
X-Forwarded-Encrypted: i=1; AKwUvBz6cF6kPTD56W0uvLbBUWrjAC+MjjviU+YOJwb20P9J4lIYqnfQ6A/d067Z3dzPnBwtU7eRlxGutSWF1C3Cjw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9LWklyhrzML35c1TUeDijfSEVFEmH1y5AzcbZz9eX/Xx7w6kaL
	LLeNtzafCQwueRwBppb6wAGj/TWnITGYfxMZBt4HQeUJfTIOK9PiOG4=
X-Gm-Gg: AYBFou0raM8s0qowl3DQEZRhFnZYu0sjqBUxy2a4Cl6CAJqZM3RjNv+Ak6EeuGOTZg8
	Mr/AUhzK7/CJS2NUHsx7kKoQFFr1z53gfTkX3DmBFezFBSWSZbYZcOGgoRcVlORRfI8unXBBVh0
	2PVy7aKGOSDfVb9t6O0/1Vy0I3XAh82XqvshX9ESbUcX2OYxWpZs7pmzFd6uhS094+/U/+hBs/o
	khAeZxvUCu7F6spcybPpzdSQ5s5o9fT408EfcTzLgDyxFjHs/h2k17dKMvqgR4YjbL8cVcilaH1
	F4M+0Y+MjjpLATyxlZySVrxxxYj6xviYEj+wHgVnRHEmH55AAoYUW62VK6W5Yj/VR9nzRrvdDbh
	tAU8DvTc6ebRweQzkfeZ8NYEJu+z8UdojbXspJ6pdyurK62quaEQLdLGWSgnd52KNwQYTiBXh7G
	V/YgePnZ+I8P1O/DLpRn0C/YGukf2M7jnFJzRBa2eYnF+GB+tlwY1RnEs3G4tHQQi18Vjimj96d
	C4GjVpAg4EkCQWskP8BC434xDvOTo0T40toPyrrJdLXxq0gY+CGfMuioXjo2GL6PE8UM6TiUedP
	GOQpK9nCYfbjvJAA9U8mnwn0vPolScqc0DZUtM1tKgkauJ0HXF5xVj+2hfZqaOOjZYrU6HlECko
	v1bWk
X-Received: by 2002:a05:6102:5126:b0:7c8:3b8c:82ba with SMTP id ada2fe7eead31-7d072719a25mr5768547137.32.1793821993196;
        Wed, 04 Nov 2026 11:53:13 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fd3e101sm2387237137.3.2026.11.04.11.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:53:12 -0800 (PST)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Igor Korotin <igor.korotin@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 2/2] rust: platform: remove TryFrom<&Device> implementation for &platform::Device
Date: Wed,  4 Nov 2026 16:50:15 -0300
Message-ID: <f5edb8f2f92eff139eeabffe1acbb22354af5137.1793818280.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793818280.git.nico.antinori.7@gmail.com>
References: <cover.1793818280.git.nico.antinori.7@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the `TryFrom<&device::Device<Ctx>>` implementation for
`&Device<Ctx>` as it has had no users since its introduction.

This removal also eliminates a pre-existing lifetime soundness issue:
the input and output reference lifetimes were independent, allowing the
conversion of a temporarily borrowed `device::Device` into `&'static
platform::Device` in safe Rust. Removing the device could leave a
dangling reference.

Fixes: a38dfd60fe53 ("rust: platform: impl TryFrom<&Device> for &platform::Device")
Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1264
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/helpers/helpers.c  |  1 -
 rust/helpers/platform.c |  8 --------
 rust/kernel/platform.rs | 21 ---------------------
 3 files changed, 30 deletions(-)
 delete mode 100644 rust/helpers/platform.c

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index d62c7be1ca7b..787dd8ff8c6c 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -82,7 +82,6 @@
 #include "page.c"
 #include "pci.c"
 #include "pid_namespace.c"
-#include "platform.c"
 #include "poll.c"
 #include "processor.c"
 #include "property.c"
diff --git a/rust/helpers/platform.c b/rust/helpers/platform.c
deleted file mode 100644
index 188b3240f32d..000000000000
--- a/rust/helpers/platform.c
+++ /dev/null
@@ -1,8 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include <linux/platform_device.h>
-
-__rust_helper bool rust_helper_dev_is_platform(const struct device *dev)
-{
-	return dev_is_platform(dev);
-}
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index ac0a012ae1bb..f49aedcc94b1 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -7,7 +7,6 @@
 use crate::{
     acpi,
     bindings,
-    container_of,
     device::{
         self,
         Bound, //
@@ -557,26 +556,6 @@ fn as_ref(&self) -> &device::Device<Ctx> {
     }
 }

-impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &Device<Ctx> {
-    type Error = kernel::error::Error;
-
-    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
-        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is a valid pointer to a
-        // `struct device`.
-        if !unsafe { bindings::dev_is_platform(dev.as_raw()) } {
-            return Err(EINVAL);
-        }
-
-        // SAFETY: We've just verified that the bus type of `dev` equals
-        // `bindings::platform_bus_type`, hence `dev` must be embedded in a valid
-        // `struct platform_device` as guaranteed by the corresponding C code.
-        let pdev = unsafe { container_of!(dev.as_raw(), bindings::platform_device, dev) };
-
-        // SAFETY: `pdev` is a valid pointer to a `struct platform_device`.
-        Ok(unsafe { &*pdev.cast() })
-    }
-}
-
 // SAFETY: A `Device` is always reference-counted and can be released from any thread.
 unsafe impl Send for Device {}

--
2.47.3

