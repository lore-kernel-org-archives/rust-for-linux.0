Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEC3176ADE
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 09:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763889963; cv=none; b=YWFSoNZIrRt3DCdd3mv8V3h8UOVsIFuvHwKAGjOat0APm1kN89NCGatefojTHmtDQwPEmRc/M7gugL/73DPOzVCt51cc8IE2X34BlhvkguFRCKKisXE95zc6qHAEUU358Ccqq70qAg81IygiZv9hnzWkU9Yf58MveFL03821XKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763889963; c=relaxed/simple;
	bh=IPEwVncrH6ErF+52BbShzNtxbAYEnVjh2jDi81dnwhs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oNp1J5dBifZE5QE1L5HYetl+JlrhONCiS1dfcwVygkAoWbbbQnlw+sc67Le4Hjm0lOaKZY5lFfKWdqoP17tSl/cexTTcAm7QqRicL/ixQZqm6gAncKY1zYZkbRaFeVrZT3KxNfOBPdLNW2qC+kt4uvZNbBwtF+5T4GBvfkHbz0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDRb5VTi; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDRb5VTi"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29586626fbeso41368145ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 01:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763889962; x=1764494762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTc0MgLeOubcwcfQp1wa7TpaWq1ZdIbTR1ydG9HUjeU=;
        b=TDRb5VTiJtW17HHBut2yTE/IUD0dRZKfYD70ghL2VfKxmJIzvyvkfZY7PgY/lWebnS
         +eO7it6Gpy5qiGru543pptW5r95vyrTXqyJqv4331K3PW5N35BqVzf9D19GONvfKGtR0
         etq9TgwAY/LUa8K/Cgvzw5mqTocVGYJzHqXvTUdx5x6LnUx//xdPKf5Cb8yJvVPnG5QW
         xJeDowIhfB+eD45SlRt/IALfCz26YzHQ9xvQC9LB++HJD1S2bMZAqBBTiEKGEKEN2y18
         JSDoO/t8O2Fe0SEAcH2HwKuS6RBfSAC/6VhA0S8+DqDTiHIO/IOfPce3ztZ6zyy6DvLw
         VQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763889962; x=1764494762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dTc0MgLeOubcwcfQp1wa7TpaWq1ZdIbTR1ydG9HUjeU=;
        b=X5b+RRPuM3uJrF+FD9rvmnGFBdTvQU+sfw5JhnGPkDJ6/aI54Wz6RI4ym6E2galwve
         J/DCUZrsujaRM/B0F9v+p9H2puoHg67WGxEtZeD8wtc3GG5LVNw+3TGVuwR2CEx4r7Wr
         aVsnSee7arLx07fNEgMWHQvv3/9p1eLM2V9O6pX9y/xF8FHuWMKsjzZinAKLEiP04fi9
         lrkttvaUYyV3fRz22IGUnaM4y5ems1m0ExgeoHN47VCRdUsybZYac2X6C+e6HAXqqwGG
         6nkZ3EbxeO4Qfb78mLAvgyfofD/7xTKqe4UHhb1XkdO0tlPHqjtKITXukOhQ6EcA4R4x
         3hkw==
X-Forwarded-Encrypted: i=1; AJvYcCW4u3fVk8Jvvwn0rN5HqeF1CJD7QI6DZNEU4kM9BXlIrr3AvRDLg9rFDNBsI0snJgWFG8z/RT6ZQ9EOklG1Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzELkgtv8iYcIUESnT/0TwZ8IQ4UvvYPzB5+sRgsPaTImFmKd4K
	bcv25g+9zQOoNjm+GGgLNUn1Sln6xzRfiDfPf6LTLrnfx95wd8/rBBdj
X-Gm-Gg: ASbGncsTyKyPJQ0Yh6wB654pOZXv6hVOfajheCZ8Pr+2eo5jqD7ptrF/zMuFEq6sKEM
	PAkGhl5NxaWIsg2SWZac/MD8W9sCaazqtNgfLdDLlpoz0a1UwZ68h7eQB5C5mhahbr9ndHPXec/
	HxIyNY8dvfD1Ks4zEiSbs3yJJurltk9TiKKd2uvVSN7Am/aTyZrGuT+eU0dRZ3UgtuKR95+CRP/
	TUiVzu/6J5Lza8xqfBSAwukLA1EPOdUIltCVpmnUlTrvPF/RACEV+TuJhhjkITRSKNgaY7pOfFs
	UfzifeZlcYzzg+bcKIOErWdm9rFULnFmmoqrjD6XWWy3xv+lrxQm47WHV1126ta1CNNoBrOPc1f
	G40sCZ98a7pgFk+yba3K5VB1XcVXwzoA0r/SxgathCulktBmTrBZ0+yUBl1MbS0JjaP1Jz3CaCE
	KbCtBBuK8lb8WPZ2qWpQGTHkBdpg==
X-Google-Smtp-Source: AGHT+IFojSe5onG6l0184Qd+32Us2flx99qw215kwkBj86ninqiLXlY2kvADM9/iJBS4TWCcsIsZyA==
X-Received: by 2002:a17:902:f548:b0:295:4d97:84fc with SMTP id d9443c01a7336-29b6bf3bcc0mr89250955ad.32.1763889961522;
        Sun, 23 Nov 2025 01:26:01 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 01:26:01 -0800 (PST)
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
Subject: [PATCH 02/10] drivers: gpu: Update ARef imports from sync::aref
Date: Sun, 23 Nov 2025 14:54:30 +0530
Message-Id: <20251123092438.182251-3-shankari.ak0208@gmail.com>
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

Update call sites to import `ARef` from `sync::aref`
instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 drivers/gpu/drm/tyr/driver.rs          | 2 +-
 drivers/gpu/nova-core/gsp/sequencer.rs | 2 +-
 drivers/gpu/nova-core/vbios.rs         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 0389c558c036..264c2362237a 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -16,10 +16,10 @@
 use kernel::regulator;
 use kernel::regulator::Regulator;
 use kernel::sizes::SZ_2M;
+use kernel::sync::aref::ARef;
 use kernel::sync::Arc;
 use kernel::sync::Mutex;
 use kernel::time;
-use kernel::types::ARef;
 
 use crate::file::File;
 use crate::gem::TyrObject;
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 2d0369c49092..9c689f0b21ab 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -14,12 +14,12 @@
     device,
     io::poll::read_poll_timeout,
     prelude::*,
+    sync::aref::ARef, //
     time::{
         delay::fsleep,
         Delta, //
     },
     transmute::FromBytes,
-    types::ARef, //
 };
 
 use crate::{
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index abf423560ff4..7c26e4a2d61c 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -11,8 +11,8 @@
         Alignable,
         Alignment, //
     },
+    sync::aref::ARef,
     transmute::FromBytes,
-    types::ARef,
 };
 
 use crate::{
-- 
2.34.1

