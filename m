Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806E838944E
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 20:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783025896; cv=none; b=ph5bDsUEXEWLVh88NKYAX0vgQi7EzoVWaDE9VaouvyeY9W4uFabSUyjlQN/Sv5FWvFedo1vaoIaOp5iLndVBEiU3jgcydFQoZVmkLDzCvd+wAoU9NOXrdvIVH2Z5njSCWm4oKZtlIAkXnfft/RqE2Pbgm6BF+4K3qveWtZfd22Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783025896; c=relaxed/simple;
	bh=eF5D6+Wt5BLWEeYKq/RyVR1wdlMPFm78cz7Uq2W8x2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Yrd2BtzmAM1cY2ahtEf10NFdpKayEtF+khsF5eU8Sd0b+IY1/6V2CEcBBxDC6Lvgzevm0EB72/f0wLf3wDxd6YvvegzRSAPuQXWB/B4EwQE0XxdRybL+kZOESTNzz5RofhETl6x6cLlKjdVpxDmZYQ4g3BrNRBD3TkEAaHDFajg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmuwK51o; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmuwK51o"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37d46e0d246so2073108a91.2
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 13:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783025894; x=1783630694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kCqGLz9eDC84KN5xIK2F/aNKUXkei/tGGB2b27ruMZU=;
        b=KmuwK51oJew668MsbUlM+71qQf+PeZ0+VW+MmCrVwyyho3ojvI4rYaM5vNiHYaHaY0
         lfs6oM4UFJbyZvkASCWC5IHnSgnWIGAtJz0j3Y0NFGmSd3nRIs+mMMx2vPkI1fdZrL0p
         UQQlNO+BSWNOO7Gut2WlLO3nfeHvWHRl2P9RA//v6Oa+32deNZ1aQnSUYYo4nRZSYf6j
         yqcAoPX2VC32B8i1PEN1JPjJ1Sqn68zc5Z8mJWyUyT6pGiX+dCt6lBfZqZ6+JLEz5BKw
         MHlpBpJvaIUvahjV0zJp4WgtH8zXt/4HUi8rlmjUKFBzPhBBrLMAa9w1Y032P7jJosjI
         TfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783025894; x=1783630694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCqGLz9eDC84KN5xIK2F/aNKUXkei/tGGB2b27ruMZU=;
        b=fWI3uCmRNlnWGYPkzvIY5AE832m90dNZ0gvKsQ0leGPWXlrcdjMSqkGMD5sE6nay4l
         72CykI7wqClCzq+QhZy2jDSp4X+VC9d7DXM0hzIKKh/7aFjzKTJM2PDo067R7kukA0DS
         sJeFOEj9/rvUhXR4D2DebQXGzl8ndaQcy2G9aPhIftG2h77IOAvmiVRSUAIvStMvM/nk
         CMHz3HYpM+HIdD/bT/NCHgH3avNopeXn+ImVBiRG90s9UOHNktAFWIbzEWXCSQwDP7M+
         n1Wmxvv/U44nBfWt/RPXcJ/rtm6/80eI+EAOZ0OFt1I70vnihmnsr/nE+oyhH0tdu98D
         4VSA==
X-Forwarded-Encrypted: i=1; AFNElJ+ccDJVRcX+gaSSurPCcZFTyVNH7j7Ty0KXsp3kz387oeqAuj9FbrAS/oVPql9RL6+HYkZkan6RYx339p+pmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlNsVezvNUPbjyYxJgDPw7GtdayczD39b1xvtx2g0EZcq3t4G3
	p75ijHPb4aKNbVpsVqjsPgB2LmbC0byWqoeFYi5cwr7HDEno6kCLpAQ=
X-Gm-Gg: AfdE7ckArmAIpp+k+4sz/5zuCwr7+ueQv2BB4KJav2q+2+iTgnHO+lAxbFRBqBzfnsD
	t1pTjLYtedPYypqEfG+znDoIM6LypwNBuuGpCZ2/Jea16KzKaI5tcseAiFh0+90Xsdiqd7Xp1E8
	mqGgrBXVl1z34GWbjxNbXcV08gb9+lsUgecrd9ISHApLkbTno9wtiPUdPCYwo0M8/8tv+QGGjr+
	G+KUKWnDIdEBFZ+0uzHDvF10kZIYM+hAkgIS4ikcXP7V+P0U3VKdtnRUwKxOh1jlkudbeoNru5V
	rFLBt6AvTlIgrlMm7TbGpaspxqhw90UrcT0ELOox7fB+fdmxElMpU9QSzjgoDqAMnMePcQkHr84
	Q2rw6kj9NpHDWgJSvAsQ1ztowOUt7G47kHD4sjos0AUz6R6bBsD51oysvAwWFNRy6aoK4jOm9sX
	806tg81rsU+nW/A+UAW2Wg9KOCADIS2VcADi49UwaY2oKBSE6iA2hFPWNj80iSujjP
X-Received: by 2002:a05:6a20:734f:b0:3bf:e2f1:1b17 with SMTP id adf61e73a8af0-3bfed5d84b3mr8082450637.50.1783025893429;
        Thu, 02 Jul 2026 13:58:13 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc3ea61sm13220729eec.30.2026.07.02.13.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:58:13 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] rust_binder: use pin_init::zeroed for file_operations initialization
Date: Thu,  2 Jul 2026 17:58:00 -0300
Message-ID: <20260702205803.552476-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All types in `bindings` implement `Zeroable` if they can. This enables
using `pin_init::zeroed()` for `file_operations` initialization instead
of relying on `unsafe { core::mem::MaybeUninit::zeroed().assume_init() }`.

This change improves readability and removes an unnecessary unsafe
block.

Link: https://github.com/Rust-for-Linux/linux/issues/1189
Suggested-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Changelog:

v2: Removed zeroed_ops variable and moved pin_init::zeroed() inside the
struct initialization. This is just a code style change suggested in
the previous patch.

v1: https://lore.kernel.org/rust-for-linux/20260626214404.852685-1-nico.antinori.7@gmail.com/T/#u

 drivers/android/binder/rust_binder_main.rs | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index dc1941cd2407..cc9b10e41807 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -314,9 +314,6 @@ unsafe impl<T> Sync for AssertSync<T> {}
 #[no_mangle]
 #[used]
 pub static rust_binder_fops: AssertSync<kernel::bindings::file_operations> = {
-    // SAFETY: All zeroes is safe for the `file_operations` type.
-    let zeroed_ops = unsafe { core::mem::MaybeUninit::zeroed().assume_init() };
-
     let ops = kernel::bindings::file_operations {
         owner: THIS_MODULE.as_ptr(),
         poll: Some(rust_binder_poll),
@@ -326,7 +323,7 @@ unsafe impl<T> Sync for AssertSync<T> {}
         open: Some(rust_binder_open),
         release: Some(rust_binder_release),
         flush: Some(rust_binder_flush),
-        ..zeroed_ops
+        ..pin_init::zeroed()
     };
     AssertSync(ops)
 };
--
2.47.3

