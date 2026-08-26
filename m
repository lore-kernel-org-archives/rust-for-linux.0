Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C12846AA81
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762094; cv=none; b=cNbFIFT4A/crvwv47KjJWZsAvoCn7iN7IBZj4ZV3feOikN7r+xwJ6Ep82O1h7nPUgvpa6jJu9I+0WWg95tQB42OvhPFnNnDtD8w8fi0nnUhGhhAvvfd2HSybwGk/hlYImoEVEjq11Zkfv676H9906g/XBsg17RmPCC2xdcRnDj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762094; c=relaxed/simple;
	bh=dlpnjenRKlTOh12uFfi0ftSMSH2CF9Uel0+u8iAGFXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EId05bPiAZ51WT+zfsC0JiWMUNMKfSV9QERBkFa1Q7eiK+wwCNCGitIATt+P+Wgxa2AGhEWEij2zqUNLzJPzcU5DyP1ks2VKbv1vsklKo47z/Acg1alc7CeEEdmSTRJiD+Q0vtZ64NMMo+3O3DXHl2BJOn+FDXZUFHaPUZY2fI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=lLpVXOPp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="lLpVXOPp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so8916975e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762087; x=1788366887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dA2lE/gtA/CbYkkrJu7IaBkzRDM8/vT0VxRhU8+R4ns=;
        b=lLpVXOPpcn2rTxbl27mzf5JK1IzH4FuOUaX7gbVQ4UaR6chRvx9bBxxpqQt3bTOV/j
         uesNB863nSYzmDzMmjzEhcqQRBaglmIr6j0O6wYhHKcUuwyjX0EE+pqJALs8mV2FYWb9
         5FosvxfOevoFnhgwOMuilbBHMB/a3GAp0bo6sAIyKjvTcfZ/vbMFI5f6Naw0qAnkW5zj
         7u1qvSjf0HZBxlf+isfid2ujkAodIrk8RiBOYbA03Uavn8arHkkHoLrQkfbMsFDhg3uS
         QKhLyy6n6urlKUZLtPAZrx/FYMDl6Dskqh5RpvCFuwoUP4r6v7iWpFg4A2F/0K3JTQac
         QAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762087; x=1788366887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dA2lE/gtA/CbYkkrJu7IaBkzRDM8/vT0VxRhU8+R4ns=;
        b=mcncMQMBx4+JokeCozeqFun5Fq1rzNMXKaLrvziQpqAATSIZykQH/koV9+KvWopTC2
         5QVLie2KWhtqCE9Ev4If+rhPI2MUnN4+9tphs6NMpMeC9AC4WKzR/0oMVP8ZbsyFqy4w
         M9anJ0ynYSPc2y7foRszZOfxwo0rjzV48RAmPM4/H+7q3buYqd0zaRoZQWpHHe2BRATY
         ZldshIu6bEXRkQeXiTaJzNyMp1pCQ/3i9PZdymJnfc6x7nEczOagSXaceIJQoenPDecw
         hhspVqEGiMzFePnbT0b7Q1/LKaVB3taEenrt6VJJFqKMnI0k28cF6rM7cinYOroYBlRM
         ixig==
X-Forwarded-Encrypted: i=1; AHgh+RqrOlOGFHckAV4ahZ8adi+fH79AifbfsmLsUQ3kgrlOg8vtGr4GSFHcTd9h5IRWC8qczRec1omTu6QJOEZcrQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n84KrEIxTVT3wbUzllMeEJ/sABJr7tRDOAfZy9csoGGwgKeEBp
	pwS47CZubtdLvwsRqvJUkP4DTWBSARk3VGvYGKNX6BklBjHWJiH0Gw59BLB6HdwU8Q==
X-Gm-Gg: AR+sD13tQhJhkgScIqwd4+phKCPi0ioqNo5QJzcJTkYYAgIbZylx3nGiLEUDKWmS3lj
	KZ1p3exgB4QPoFvnAo2PW6YfhNz3cwK4jUcF3FkO2ZNxKShpYYABlBM9Ywe7GAo0mF/Vm3lQilN
	S4JSMB1LJlDUGfr0TWpk2xHwS4EDJzT1JdimZJWFJneIGav21XcnZE0qKVBaysZpyMTmY7I7YWu
	gOTq03WG9a3hu+J5UikiWtk28ovFFntOooIb+G5uS+Th/AokfCfTiMFPf5syRz1s2Rz+5xRqPDr
	sT2mn+osSNtJlgTp0p5xpeFAckZ5hV+XNU9o2ghx1mj+ujp7r3q3MZv+O4N7VXjVDSukMmJyXru
	G+ruPstilRI+J3j+v5ewbX/wV2Ih8MjKb0+gKOaLPOMOOHnr3//m1Hon84FYBRJgKXZR7X5RgXk
	z546kyvkhSIlpSJw1iCrf+8z9IQwGpLVMgi4p0dSJFXKSJHTlnMOqIXc0Q8H4WRSswpQXGfHj3A
	kQ4AZOGdHexM98vDEwTpnnpknJ2qhKcLTwr
X-Received: by 2002:a05:600c:190e:b0:499:a277:e8c8 with SMTP id 5b1f17b1804b1-499dc725b50mr73945485e9.13.1787762086859;
        Wed, 26 Aug 2026 09:34:46 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:34:45 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Lyude Paul <lyude@redhat.com>,
	Janne Grunau <j@jananu.net>,
	Asahi Lina <lina+kernel@asahilina.net>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/23] rust: drm: reject cross-device GEM handle creation
Date: Wed, 26 Aug 2026 17:31:35 +0100
Message-ID: <20260826163359.4998-5-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163359.4998-1-mike@fireburn.co.uk>
References: <20260826163359.4998-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rust type bounds prove that a GEM object and file use the same
driver implementation, but one driver can own multiple DRM device
instances. drm_gem_handle_create() also requires the object and file
to belong to the same instance.

Expose the owning device pointer within the DRM crate and return
EINVAL for a mismatched instance.

Fixes: c284d3e42338 ("rust: drm: gem: Add GEM object abstraction")

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/file.rs    | 7 +++++++
 rust/kernel/drm/gem/mod.rs | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
index 10160601ce5a..0abb7813f011 100644
--- a/rust/kernel/drm/file.rs
+++ b/rust/kernel/drm/file.rs
@@ -45,6 +45,13 @@ pub(super) fn as_raw(&self) -> *mut bindings::drm_file {
         self.0.get()
     }
 
+    /// Return the DRM device that owns this open file.
+    pub(crate) fn device_raw(&self) -> *mut bindings::drm_device {
+        // SAFETY: An open `drm_file` has a valid `minor`, whose `dev` pointer remains valid for
+        // the lifetime of the file.
+        unsafe { (*(*self.as_raw()).minor).dev }
+    }
+
     fn driver_priv(&self) -> *mut T {
         // SAFETY: By the type invariants of `Self`, `self.as_raw()` is always valid.
         unsafe { (*self.as_raw()).driver_priv }.cast()
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 60491e5521e4..334e946833fb 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -186,6 +186,13 @@ fn create_handle<D, F>(&self, file: &drm::File<F>) -> Result<u32>
         D: drm::Driver<Object = Self, File = F>,
         F: drm::file::DriverFile<Driver = D>,
     {
+        // The associated-type bounds prove a common driver type; separately reject another
+        // instance of that driver before passing the pair to the C API.
+        // SAFETY: `self.as_raw()` is a valid GEM object by the trait invariant.
+        if unsafe { (*self.as_raw()).dev } != file.device_raw() {
+            return Err(EINVAL);
+        }
+
         let mut handle: u32 = 0;
         // SAFETY: The arguments are all valid per the type invariants.
         to_result(unsafe {
