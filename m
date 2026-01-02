Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE1D2727FC
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 22:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767392061; cv=none; b=oQX8AsbdvnYsobaK8Pe/43Tcm5esCmq9zuXS9iv2xKVLLcWUG9sgBNOvpjL8o6BkTUFp0p+T8Mu5XqJ+9MTasZWJC04cdgehqimPsywVhzptQJUwKkPsC4ZdtJCZnjVYhmX0M/oda6ani017oKfpkVASB0tqeARk5BncHY1AvRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767392061; c=relaxed/simple;
	bh=BXnDH38sAKTaU6fZXWIje2HtBe6o+6O97pyAsFykX10=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VLUG53vpFAI99Fd5e4xFk2PQBSbL+dcMtGIJKObiT0+X7apsRBHu4r/FCZLbZOyyAIPbu+VIuDkIQ+UhKwNGsHgyPJdDdY3yqbw2S8LgKiuVPScmWkb1jETl+Ri4HL8gRvxwB3JgNbGdWjEQaQ3r2fk0CmxFWzfXrW5p1zUno9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbmtXJjg; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbmtXJjg"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-559748bcf99so10725578e0c.3
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 14:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767392058; x=1767996858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6eDZoYciOr2lYVwtxpxq+97yZ/JvKudSVZ9w95niiU=;
        b=XbmtXJjgDKRUYD0cXSdYAjyC3rIF8IUyKgWYOE/WCDlCxyy/UNCIEWs+N5wby1eLAm
         VHbjiV0Z18U9DuX7cIJfmM7t9p+ANStGjkd3K3E67SKlP8m6fgDFtDbrD05Yv1+rpjb/
         /XMK9N8BI2MIaSDABqk1ejKG4LtJLretyGvGxqeP7OiVGQPH8hUeD9x1Kp3UrJpWHlfN
         n8QxM/wRRPK+ZrrmcieLxHQsU1NLsett/MwKt0FjEXUmg6h9Dsrcwm42RwQIf9Dnxpon
         fMStvkrVcytGKfxmz/8gGLvP545U6wf+miXfw5NMMa7BOzjFDZmF9A8iMBh9h4IrPTAP
         hqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767392058; x=1767996858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r6eDZoYciOr2lYVwtxpxq+97yZ/JvKudSVZ9w95niiU=;
        b=t8z/xKchgGGFAS2UFRj0IcD8kCM4W6c6pB+R4JPBxFKqfGrfAfrxd/EvxBfBYn5Ixh
         Ic6+V5vmRc7QpGi0U5HGRrWfmZ+lOQ3yMPLm27P3Sjrvozs62/RJMotu1XutlEMkmqDz
         uNlPzYtOyneH2VAQ+EPbAWgH4UvGHujTi30Qs8KxQ/Yg9rPNArSINdFaHLVtJT/4Uy5T
         3brT1e2G7yglGMyB9da1fbf2vk4kTK+FWl2W0Rjz/et0z7TiGR9oeiBriDTM4fNil4Np
         X8xoiPcKdoSmG4JDeUyW0CQrygQYT4YqnCQD+0A98dTVsyMUve0ZGJzi58YOavfernp1
         0vZw==
X-Forwarded-Encrypted: i=1; AJvYcCUDFKbQ3ukHJUCrSJp2GBr81519/HziTKKKr/rL+r+akuyDTnl4qZf3M56Jv2PKWc9QxlXUkwtRFNGOlFH20g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQEgg9RSbVb5BC2AWkMhzujKHyq9W5KBN6oTzWBLdWpoY3OBFk
	A05C9pghdU+FG/RP66MC90ROw9fpqQQdrAl59n8Mv7RwTC03Jmw4mmrqRdRIlw==
X-Gm-Gg: AY/fxX6mNQZN9Y7RMk/LJJT13OChU2FPAwowfjnOQSHJh+P3D4nqhrbYnvha3Y6vgbr
	wt3m9F8xiYBWR7yenk+zCpSbzOGSz8g5zWlGaMC8OSoxkXSz8Y9jhWH5ag0m0SGAypfthvY0uLy
	v4gMnWoz+R99xh8aEAVB1uAWisIHBVb7fQmlIhXRdcMmhFYUySbsBpxZLFUZGlLXvc7kPLCw5Ba
	oPxlNdUS86EU3KYc7XAMNjZQUkhTsN9vhPWYO5NMgQFVpn4ClruvFbKydyKFtsNN6QlI86qiUrw
	lph0ATBe4bHpyZ9HaC5o4LpzfrVDyQv2UuhjdUZXR7xei69HUPiYQ+OJzwkrErLz/zGkZPitoAy
	9O6UZmDTMF8SGB5aCMH0luh0YeB/hzRglNTVPYHjJRgP1Nn+M9TN+i8zF+fLYxibdmjFy/3tcgt
	Kxdfg6V3DIkEU9bdowhB+Vi8I7TxlHmA==
X-Google-Smtp-Source: AGHT+IGIsARfCgd5//D4UmLiREc1aDWqV7PK9qWSlWBBWPowHyvTYCk6XncFLI8Z8N2XnWEey2jwoQ==
X-Received: by 2002:a05:6a00:430a:b0:7a2:7bdd:cbe8 with SMTP id d2e1a72fcca58-7ff655b041bmr34350824b3a.18.1767385706150;
        Fri, 02 Jan 2026 12:28:26 -0800 (PST)
Received: from shankari-IdeaPad.. ([2409:40f2:2123:b1fb:b93b:b5b4:2357:c53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88cd71sm41163964b3a.64.2026.01.02.12.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 12:28:25 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	"Todd Kjos" <tkjos@android.com>,
	"Martijn Coenen" <maco@android.com>,
	"Joel Fernandes" <joelagnelf@nvidia.com>,
	"Christian Brauner" <brauner@kernel.org>,
	"Carlos Llamas" <cmllamas@google.com>,
	"Suren Baghdasaryan" <surenb@google.com>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Alexandre Courbot" <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Alex Gaynor" <alex.gaynor@gmail.com>,
	"Igor Korotin" <igor.korotin.linux@gmail.com>,
	"Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: "Boqun Feng" <boqun.feng@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Trevor Gross" <tmgross@umich.edu>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	"Abdiel Janulgue" <abdiel.janulgue@gmail.com>,
	"Robin Murphy" <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH v2 2/4] rust: i2c: Update ARef and AlwaysRefCounted imports to use sync::aref
Date: Sat,  3 Jan 2026 01:57:12 +0530
Message-Id: <20260102202714.184223-3-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260102202714.184223-1-shankari.ak0208@gmail.com>
References: <20260102202714.184223-1-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update call sites in `i2c.rs` to import `ARef` and
`AlwaysRefCounted` from `sync::aref` instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
Acked-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
v1 -> v2:

Used the direct module name instead of including the path again,
re-worded the commit title to rust: i2c: and
carry-forwarded the Acked-by tag.

Link of v1: https://lore.kernel.org/all/20251123092438.182251-6-shankari.ak0208@gmail.com/

---
 rust/kernel/i2c.rs | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 491e6cc25cf4..9f5f18792916 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -16,10 +16,8 @@
     error::*,
     of,
     prelude::*,
-    types::{
-        AlwaysRefCounted,
-        Opaque, //
-    }, //
+    sync::aref::AlwaysRefCounted,
+    types::Opaque, //
 };
 
 use core::{
@@ -31,7 +29,7 @@
     }, //
 };
 
-use kernel::types::ARef;
+use kernel::sync::aref::ARef;
 
 /// An I2C device id table.
 #[repr(transparent)]
@@ -407,7 +405,7 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
 kernel::impl_device_context_into_aref!(I2cAdapter);
 
 // SAFETY: Instances of `I2cAdapter` are always reference-counted.
-unsafe impl crate::types::AlwaysRefCounted for I2cAdapter {
+unsafe impl AlwaysRefCounted for I2cAdapter {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
         unsafe { bindings::i2c_get_adapter(self.index()) };

-- 
2.34.1

