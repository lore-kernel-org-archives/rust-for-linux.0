Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E819273D81
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 09:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763890068; cv=none; b=inofuL3uRC/qo6G+hN3vo39Kj2a3yZ/p3FlEkaIxYDRoqJ/b1i+0z6BpfaFSjbBZAydiy4A5QTNjuPcQELI/+H8Ujq5f11jLEOx4SXLRI6zqN3VxvoKtyCZ3d085vmVoKcRqLzTwH6v5Cwein/lkgXpqADzJJM7Nh7NX/0AOffk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763890068; c=relaxed/simple;
	bh=EtbIa6WcARTT+W4TNMAMANC6i+cL8dmR+u7Z213Dj/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bwMUHddfipilRPB634WeNB+Vezx3fzkZZ0H1VQemaaYI7KYSPYFJ/gAw1NDVMZfkY4icSX4Vgon37CwMgjINuoCzYNq7wHYyHSKhenRTt7g2CARNZNCGzhg+EfwnH/hkctGXEnn6A+SMicKTF0AgDIREmddtEvz7iaCptF2lDSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nP14G4Ei; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nP14G4Ei"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2980d9b7df5so42006515ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 01:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763890066; x=1764494866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfyBoPWUbKIvicMj0KWg+NHqLc+OcZyzD61cN8gqS4k=;
        b=nP14G4EiAIxsFMqXc5VQa9Sod/12GminXv9/Ql5T3ogm+HUDRKYf0HODr1VmGsflJw
         Q9bhdstzJ8131cHjBGerQW96hC8NZEMD2gz2GKq8l8Xy3l2bv4BSnqCcGQJXX6jtIae9
         Z4rAwGEkcj1dSa2vJTYoec0PrliO+Uet4Sh7hTXZOszvjv2guy9TCEBWTSlKd66lFK+p
         6qf/KpF+wRdn4UghuFeMpseXYXtDP7dxWctTdr+Wpv2lNIj3qss5ilcShlWZZASX1u/J
         r0R8VIQfpGB54XDrLsZyvpooJNUDG/Ha//01SKtpQ3PjUfiwgnV43uucvaOX+pPuuHZP
         JnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763890066; x=1764494866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YfyBoPWUbKIvicMj0KWg+NHqLc+OcZyzD61cN8gqS4k=;
        b=bGuYcvKhrtKf6opYjimtxK49yDUwTuFUnpwbEh9fqM3r4/Youqij2j3d3bSUa+fMPf
         LG+KeprMGOg2YzGpXo88IL4QZwp8CR2zV0BBPESpZxHOiDWML/fsKcRJVPuppWFMJ648
         wVqrlc9tei1QDmEaP/4PsNoYRoXDYqcokrGXGZeTO0LaQatcd5a+MJfcfRfklPvDJfaM
         fAKjQgc0NdQ0YKh4/rMkfapMRoF2xHFK4LAMJbIfSLGhE3qC+0uBIUg6AEV+T1mIxdjd
         BwH9lpygxBbpa2AYteOSZms2SFA7JKjHnO5gf86J0BwNvx7Pb9NYnud1m6Z/rfaQZ+Fb
         0IIg==
X-Forwarded-Encrypted: i=1; AJvYcCU4vRKnn9saaGUKKedRzvfodZ6SBKToByEis+IfvbuhV2DHrWSTf34aQ/CX4OUOmmD7MudEwoHuySNAoVi9ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YypbYNomamfaRbxOUmrnEi3fiSTCDmjqDZ5bQMbZD3PsJqPwY6A
	c9XhUmC9OfVa/TEZPBFDIHlXtebPG1jX99faOX+YprbmzwansA+L++eR
X-Gm-Gg: ASbGncvBxqCfZaWy1rvTgUO8dXDuB40tbtd7edCbs5zgp2N+bTFUkoElqZCHfxFlVlv
	u5ZbHJtqj7B1e5xpR+1tCei1/aDqxdoLpuC6eXzbaLSupkZQfEE3rMgu2Bd2jqE3I2cq/dg7ZVK
	S/tif+d2r/4Cd+8PdX2viWRB/MBrh6Fo9lJh1tqdOxvZyXRbnhVTGJgzgIpTh8ydkgd4/y1Zivg
	rEYg/PUn2eGqxSJ/aMq31SpAqNvezxw5Au3yTz4TEDA+uJLG9Th5eUtaxvLrySIT81fQTLCTpR9
	CKZG7vl8euMDuAQaA+7AULTgzD7TPmtmzn86RqJPL54GUfxb6XE7xZumEEf6U/RuET7xeI/8Mn6
	1llabQbHcf7mTHflP3Az3+W0jwrLXFlQXh+4FHhlCsVuNKrs4dzhgzL5KxCNgiW3MaGV3oPbWOq
	7mqG/hXnGjWeHenYqjzxvIMqVZxA==
X-Google-Smtp-Source: AGHT+IExQFsNPtBs1Xj5miLvxmintvWHhiICyxn8q5+dbslUtcud5J24RqOaI8yRZ14HHbP/D4VKng==
X-Received: by 2002:a17:902:db0b:b0:295:28a4:f0aa with SMTP id d9443c01a7336-29b6bf5f036mr89773335ad.43.1763890065882;
        Sun, 23 Nov 2025 01:27:45 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 01:27:45 -0800 (PST)
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
Subject: [PATCH 10/10] rust: kernel: remove temporary re-exports of ARef and AlwaysRefCounted
Date: Sun, 23 Nov 2025 14:54:38 +0530
Message-Id: <20251123092438.182251-11-shankari.ak0208@gmail.com>
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

Remove the temporary re-exports of `ARef` and `AlwaysRefCounted`
from `types.rs` now that all in-tree users have been updated to
import them directly from `sync::aref`.

These re-exports were originally added to avoid breaking the
kernel build during the transition period while call sites were
incrementally migrated. With all users updated, they are no
longer needed.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 rust/kernel/types.rs | 2 --
 1 file changed, 2 deletions(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 9c5e7dbf1632..4329d3c2c2e5 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -11,8 +11,6 @@
 };
 use pin_init::{PinInit, Wrapper, Zeroable};
 
-pub use crate::sync::aref::{ARef, AlwaysRefCounted};
-
 /// Used to transfer ownership to and from foreign (non-Rust) languages.
 ///
 /// Ownership is transferred from Rust to a foreign language by calling [`Self::into_foreign`] and
-- 
2.34.1

