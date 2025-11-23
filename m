Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4F125BEE7
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 09:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763889948; cv=none; b=kQ5iDM1VeFkiszDePq04J5OQrrvgHHIrAMLM7BnYHqu3aAq64RLWOHp66eij+KDAnTLqQmYE16XshPB244h6dmZqgDYijw13vwLQkdnzCyqNvYvIVX1qv10RdPrpLzEMnQOCgZDv7ZlzGhhX2dfyX5vdi7Jc1aFD9OU55PMOlN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763889948; c=relaxed/simple;
	bh=wTWM3QKYInKA4bBe2L2dZ9eCGX4hj8ZHtci5RLiYGQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m+WbyCde+PUauc6u0gwiVT81RWtKfhU+nBhe+wgAPrxaV38IoDnNPBrOAuw8lAU25GMuRp58iDVRqlKudK1Fcky3U6S+iP2q7BJAua9aKg7Qr3KKQISLEzYHgcJpP/oAiXGvybp0CJoyQAc5sA/ylOUlvplhZR6mWt2YsW0a0u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQDo6+PD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQDo6+PD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29558061c68so45435125ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 01:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763889946; x=1764494746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHBuqhkFJfYaNnj9M7q8FhjsYY3lIhigbe8268nPJsA=;
        b=aQDo6+PDcehdU8I5RKMouIxayplKOMMKfEcBz2lZB87b0cCOPIwVTTdGf6uoyRETbu
         HUDeAw9lYgtVwww6rNOlYQhozpKSax6WoLl/uwtTLmS5Mu0M350ACJxhzcoQOYtnDeZ9
         Bb+jFItkhpqLWFQcBSFqXljdjvcfoYdYlMgnSEKItzZ/vttipCbqWIN+AOzxp+++GzDi
         17KGvz5FiE45TbgELI5exD0AZ+/Lom0He3rzCBV5IWuaRecEO5qcnpwCcqzATvi9rp/2
         rE27TrdO6thYIFsBds7i4Tso2u/DcHcog2g6wHXwxbRfg3qMo0MwWocQ93Q41/D4Q41N
         potA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763889946; x=1764494746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BHBuqhkFJfYaNnj9M7q8FhjsYY3lIhigbe8268nPJsA=;
        b=jLpsudvaluCsN9hXsK1UdBV8KVWm3CrMHn7TmpgtyU9kKTP682EJAWAttTU0SmtaOU
         kwwSsrUFHvS7+EL9V3AUGNtWtJMj/Y+ONHby253JQneIBRIL03Fo5h+rTM5320oXvB46
         Snz21xJuyo093nj3hdr2Vgj7IuZTjQenYM52unlMPAhkUiYXRSJx7kC2uT5bK2tfAgR6
         7Kc8rV6QKdw26G5VNGWuYZzwEXZ6kK9EPAhFMvWJ4Z1rERwkywXm3cLlDi/xfs9RTPHC
         PNw7z8zZMDt/hfiI3Dnk+pIos4VZ/W82j29PLx6Sh2ipMYZDecdRVCnI+LDatmvcr1rL
         0WNg==
X-Forwarded-Encrypted: i=1; AJvYcCVMVQ5VfqlQK5+KYjB8RUP5sOZqeWrBr4u0gOhXgEnXYXr+Tnbo62/HVRUcmqyAQzEV513/9kRJIUWSvCqfhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhcLcKx1hSAzgYPg3IeQv2ihmm24MnBErrkntXhb//7LY5ibNU
	Uip8vT9t7uUPa/r4wX8VoAnrF3pYeSBlh51vTx1eanQb4n7QJygCXQDw
X-Gm-Gg: ASbGncvp4USMGfLQakw90vV2UvPt/0hWgjZhX03DI1t1DAoBxqiS+ZyGV5JF9Qm1hRL
	5epGixOudOTvJVhVwV+YTTQvXoH70OmX/5JtESRsxeEnOsFKywAbbeyajTFrTXpXzhmJRrCN7jZ
	oPkEkibRG0lqla4D9wG2kXEtiEZZaao+F2DgMtQyNFIp/Ck3dyl032S23xjTNpwG2JWqYPel5BL
	qVS/1jBQ5b6hsQoQ5J/oW6IW6XjwyYrmNYT/OsRPWFBYwaCrcZvrFEDjzqTuOPBmM7Xq7+lVtH1
	BvluwP8/092UUopC8WNS+jpFXh7r+d9f9XFMUgC9A+0A/qQop8Ac/OhlxhWuwtiQRIVDfrGDsQ0
	qQBne5PMLjt/AJ8DPPvEWdGiX5ncJSvZnbuSSmUk7tqegSYwE95+tT7c480i8ipRQqhp4oieAat
	lnjcCuSLZTksZpRC4vl+CMRlRJvQ==
X-Google-Smtp-Source: AGHT+IHeRFkTHVTA6Srefmm0HL5WijnlyHgpdTjb/dQ8CxktDbPnk0dZz+0OIDZ55NxQOWacfTdN2A==
X-Received: by 2002:a17:903:947:b0:28e:a70f:e879 with SMTP id d9443c01a7336-29b6be8cb2dmr88701485ad.1.1763889946269;
        Sun, 23 Nov 2025 01:25:46 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 01:25:45 -0800 (PST)
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
Subject: [PATCH 01/10] drivers: android: binder: Update ARef imports from sync::aref
Date: Sun, 23 Nov 2025 14:54:29 +0530
Message-Id: <20251123092438.182251-2-shankari.ak0208@gmail.com>
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

Update call sites in binder files to import `ARef`
from `sync::aref` instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 drivers/android/binder/process.rs | 2 +-
 drivers/android/binder/thread.rs  | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index e5237e9ec552..1409129ff82a 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -27,11 +27,11 @@
     seq_print,
     sync::poll::PollTable,
     sync::{
+        aref::ARef,
         lock::{spinlock::SpinLockBackend, Guard},
         Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, UniqueArc,
     },
     task::Task,
-    types::ARef,
     uaccess::{UserSlice, UserSliceReader},
     uapi,
     workqueue::{self, Work},
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 7e34ccd394f8..033af3ce352e 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -16,9 +16,8 @@
     seq_file::SeqFile,
     seq_print,
     sync::poll::{PollCondVar, PollTable},
-    sync::{Arc, SpinLock},
+    sync::{aref::ARef, Arc, SpinLock},
     task::Task,
-    types::ARef,
     uaccess::UserSlice,
     uapi,
 };
-- 
2.34.1

