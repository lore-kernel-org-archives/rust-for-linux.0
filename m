Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A123BB47
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jul 2024 20:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720469257; cv=none; b=A0YCyTOGNqhToodto53E5R6hybe2c45iHUAG1dDjNrsG8KbWOdvq+xDdurFUlg627pOqow6Dks6vs/vIljBPY5XnlmfuWoi3Qkxg6AeAPAzT29ZcTOEyme5m8GT65T/nK/JyPpJwu4r60YaRimnasqEYnlqzgDRwBod44q1F6Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720469257; c=relaxed/simple;
	bh=jbVPHV3tTIy+aA00s4W/dE7RaviWeAr/ugdsMlvyqUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lpuABGR1q+edGBYPXeMRurValgpcLQIJVBXBAIMUyjKYT0G6eFxdQX8g5nzxfO0iXfvt3Z9QNWscVQCIYHYp4U43RpwxqVGIKtnBhek1GKa3p7B1tdMhjqZumKV6AWzoKZPze72rGPDXeYWzcT1KfRtNwEGmdQj4gIEfq+gVKec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NQUQ1CQm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NQUQ1CQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720469255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QVe4zI8I8PUfShXSDJ871NFnI3GiGhdY8bM4ieLnzgU=;
	b=NQUQ1CQmmsjHeiPgiXP0cPiZhPxeHA/44DVcQ008z0dQMjfMhjWn8PpGIEkxbmip7Q//1h
	fGL4ccGzlBC0MSI9Op9fP8ZHv9ujfnyzFoWWtEjpuxyS6Hr3K0LtThYKVdgUfeE4wM67Dv
	85D6nmY75H29ouE8Xq4uNXTCtmc5Rgs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-eU8eF-XVOoCsrksBprz35g-1; Mon, 08 Jul 2024 16:07:33 -0400
X-MC-Unique: eU8eF-XVOoCsrksBprz35g-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3679ed08797so3068150f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jul 2024 13:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720469253; x=1721074053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVe4zI8I8PUfShXSDJ871NFnI3GiGhdY8bM4ieLnzgU=;
        b=VkFoHEpqpvZYbTvuYvCxausCKU0ow6sK3gHC0yc92B+BDU6WBL9MsTR58gAZRO3Zmo
         hoNHgIpPtrSLStFk+LzYKpj8g6bz5KKFQ+Nf7cRSrSrPBjbDSmeedhrtQS6S0we0sAC5
         cmUs8s0MJ5Zh+DXDpEIMwqrNGiR/WyB70PNRRm8MkR53MvbK2z+NPQAxTsUNb2Jrg83r
         qHN2GNx/YIZP76SZWngAvbrQNtlOq/rgKNHZ7mVHrQjSeXiNclNyN3KWqE2d0XDVhMFO
         k/ScC/g+73Whi6lic/2JWbC1tzwVktwkc+WIXlTPvTZGe3GFokhD/2C/qxc6Y/H9hJ52
         8neQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqo05oJ9YkDFL/CIEN9TxXaXIV/mG9HLY7F21wS5ZLYKvh/wS8N2G9yJhtafR8qOH3lutNn3ga2VMfmnM6yDHopVVLeS0fsrLEHdMLpUc=
X-Gm-Message-State: AOJu0YyX190dQn04FBlN+tNBnaauR4WazpAJTe3zF/1cLzmHmMqFvxSL
	G9qiQQCwjO0RGdYccOu/nNk5mbrveHdBALEjjqN2jEP3O2XYzI992xE6VPkrIRDwLLnSS+822WA
	/OlQoRQX+/9NfidMS7tylMQWodxxY7L4KgSb8i3yM0AoWSR463RIuDEOQD8W28A2u
X-Received: by 2002:a5d:64e1:0:b0:367:973c:aa7b with SMTP id ffacd0b85a97d-367cea4600amr586684f8f.2.1720469252831;
        Mon, 08 Jul 2024 13:07:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbQxYhK1647LvoL7uPyGdkYRjGlhVuxAY+e7ze+A8jjps1TWhysfjohUpZ5l+10Wn/iuw9Nw==
X-Received: by 2002:a5d:64e1:0:b0:367:973c:aa7b with SMTP id ffacd0b85a97d-367cea4600amr586676f8f.2.1720469252532;
        Mon, 08 Jul 2024 13:07:32 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfb2327sm594147f8f.116.2024.07.08.13.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 13:07:32 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: mcgrof@kernel.org,
	russ.weight@linux.dev,
	gregkh@linuxfoundation.org
Cc: chrisi.schrefl@gmail.com,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>,
	Gary Guo <gary@garyguo.net>
Subject: [PATCH v2 2/2] firmware_loader: fix soundness issue in `request_internal`
Date: Mon,  8 Jul 2024 22:07:21 +0200
Message-ID: <20240708200724.3203-2-dakr@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240708200724.3203-1-dakr@redhat.com>
References: <20240708200724.3203-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

`request_internal` must be called with one of the following function
pointers: request_firmware(), firmware_request_nowarn(),
firmware_request_platform() or request_firmware_direct().

The previous `FwFunc` alias did not guarantee this, which is unsound.

In order to fix this up, implement `FwFunc` as new type with a
corresponding type invariant.

Reported-by: Gary Guo <gary@garyguo.net>
Closes: https://lore.kernel.org/lkml/20240620143611.7995e0bb@eugeo/
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
v2:
  - provide method for each wrapped `FwFunc` (Christian)
---
 rust/kernel/firmware.rs | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 106a928a535e..2ba03af9f036 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -7,10 +7,23 @@
 use crate::{bindings, device::Device, error::Error, error::Result, str::CStr};
 use core::ptr::NonNull;
 
-// One of the following: `bindings::request_firmware`, `bindings::firmware_request_nowarn`,
-// `firmware_request_platform`, `bindings::request_firmware_direct`
-type FwFunc =
-    unsafe extern "C" fn(*mut *const bindings::firmware, *const i8, *mut bindings::device) -> i32;
+/// # Invariants
+///
+/// One of the following: `bindings::request_firmware`, `bindings::firmware_request_nowarn`,
+/// `bindings::firmware_request_platform`, `bindings::request_firmware_direct`.
+struct FwFunc(
+    unsafe extern "C" fn(*mut *const bindings::firmware, *const i8, *mut bindings::device) -> i32,
+);
+
+impl FwFunc {
+    fn request() -> Self {
+        Self(bindings::request_firmware)
+    }
+
+    fn request_nowarn() -> Self {
+        Self(bindings::firmware_request_nowarn)
+    }
+}
 
 /// Abstraction around a C `struct firmware`.
 ///
@@ -48,7 +61,7 @@ fn request_internal(name: &CStr, dev: &Device, func: FwFunc) -> Result<Self> {
 
         // SAFETY: `pfw` is a valid pointer to a NULL initialized `bindings::firmware` pointer.
         // `name` and `dev` are valid as by their type invariants.
-        let ret = unsafe { func(pfw as _, name.as_char_ptr(), dev.as_raw()) };
+        let ret = unsafe { func.0(pfw as _, name.as_char_ptr(), dev.as_raw()) };
         if ret != 0 {
             return Err(Error::from_errno(ret));
         }
@@ -60,13 +73,13 @@ fn request_internal(name: &CStr, dev: &Device, func: FwFunc) -> Result<Self> {
 
     /// Send a firmware request and wait for it. See also `bindings::request_firmware`.
     pub fn request(name: &CStr, dev: &Device) -> Result<Self> {
-        Self::request_internal(name, dev, bindings::request_firmware)
+        Self::request_internal(name, dev, FwFunc::request())
     }
 
     /// Send a request for an optional firmware module. See also
     /// `bindings::firmware_request_nowarn`.
     pub fn request_nowarn(name: &CStr, dev: &Device) -> Result<Self> {
-        Self::request_internal(name, dev, bindings::firmware_request_nowarn)
+        Self::request_internal(name, dev, FwFunc::request_nowarn())
     }
 
     fn as_raw(&self) -> *mut bindings::firmware {
-- 
2.45.2

