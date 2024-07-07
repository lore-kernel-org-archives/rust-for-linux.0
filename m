Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA98517C2
	for <rust-for-linux@vger.kernel.org>; Sun,  7 Jul 2024 00:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720312742; cv=none; b=uHPYEAxooQUVGxVRqublCWj2fjAhKSgx8ow3o33pQp836ZdMi7muTVPmHC8fnJoXEMDCpiuDppYfatS8HpEpytwUWTaT2gqqSbWqJKYwkAGcCX53WOxVlfIiUbAagzyWLVKH4YX4jJoHoYD7A7YS4SFbS7z2UNQjdZ2zRsjUHEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720312742; c=relaxed/simple;
	bh=dHtsEElXBy8Dxdb1s0vbepFzPMPOK9qK160QsPvk5aM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Bi1txHna3yMCbpAyDTeLtIPxAK6dzNq+gfk+Zb5bQa5c/5TTL2MFXJk1BkxnYhr9neIDF/UreZ+7y5mh76/eZPB9MyKL5PjPY6BrKPM1cjui8+vrJSMW1qebeRJMHeBKiOlQ1QHebxgNMjqFpJUZvridbAMDp/UzIhJWda/HtFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mnlr5N1q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mnlr5N1q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720312738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HjDxfyeph/HGU7uFboIxbBi4ztp61LafjDj/t15v1RY=;
	b=Mnlr5N1qoKT+h3kYzKTxCkFqJKiGOdzZUbQgwrAFkrPXZCKXqjhri8cF8Av28o3uXndReT
	OQKGVv3RSLmmrvtfVK1Uu1Rmqh1eX2iUPiUQdi1xETYptn9bJci2+Dyg6jxzegbqsN933W
	zQZ+q2EXTd6V+AR+JWJLr4BKgxkEkn8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-M7-Y-AfYNqulUS0WNOVrfA-1; Sat, 06 Jul 2024 20:38:57 -0400
X-MC-Unique: M7-Y-AfYNqulUS0WNOVrfA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4265cf3085aso9000475e9.2
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Jul 2024 17:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720312736; x=1720917536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjDxfyeph/HGU7uFboIxbBi4ztp61LafjDj/t15v1RY=;
        b=BX2RgG3uCL552LcpuQgKjO5n1O0d1bT2sy4trfS5ZCg4W+VJ4+B5DLhtE53L4e4KJS
         VDVe1fT727idOAsknBw2S8xNK48vUAL8enDkcjVZ3mC7nQu07GeUDzbZ9cICqU1dDEUc
         YX1x8GjMzUvPdz3Qkiens5vH1LSGf8H5PxormpCP8iloPp2cP33ZpmOrZHgSufBsJEdE
         xNOMwXf5lA4x4JXHL9LZnemxvAAfE31WwruiOIbrUrMi0SuTTdlAmRs/9d7ps0Z5EiON
         h6yuAaNw/o/AAScjKCEjJSBOa1rAtyQUAIXK78xm/3WDc9RxIvPGDoGuc2v96TenCY6v
         gPrg==
X-Forwarded-Encrypted: i=1; AJvYcCV33kiI4QbQe1jTBXkbE/MK2B4szMt7u73mVcO3Pg8y3E9PRli5xhWn2U11xJ1oZK0EiCZq5sqIucGi99JOPHjMRY1rVcvkJetWm6qwxAg=
X-Gm-Message-State: AOJu0Yxk+VA/pDmFB/wziq2X2tWhIdc3/FsPIA8HHee1JWAZyevDad5E
	JSLTDjdm7x0aSQtor472QKuBRO5FeqMAPqyPT1O57BaUfDwmgcDXLJLYsBhUYlEPUgCgk2JEe6l
	gRAbewJBcb9nuB7i9FcCfpa5BUFv1Pl5iZSO/AoHrtpiNO2+maSrqGlZlevRjp2oV
X-Received: by 2002:a05:600c:12c8:b0:426:59fe:ac2e with SMTP id 5b1f17b1804b1-42659feacb0mr27592475e9.29.1720312735907;
        Sat, 06 Jul 2024 17:38:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJBWPjFKjE9hN4GVsF5scJWgyYGeayk2+QfvlRcxyJDpRfL21TuRmjpWxSfPWyLZCx4VzNvA==
X-Received: by 2002:a05:600c:12c8:b0:426:59fe:ac2e with SMTP id 5b1f17b1804b1-42659feacb0mr27592415e9.29.1720312735446;
        Sat, 06 Jul 2024 17:38:55 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4265476ce75sm45822415e9.1.2024.07.06.17.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 17:38:54 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: mcgrof@kernel.org,
	russ.weight@linux.dev,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 1/2] firmware_loader: annotate doctests as `no_run`
Date: Sun,  7 Jul 2024 02:38:25 +0200
Message-ID: <20240707003835.69090-1-dakr@redhat.com>
X-Mailer: git-send-email 2.45.2
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

The doctests of `Firmware` are compile-time only tests, since they
require a proper `Device` and a valid path to a (firmware) blob in order
to do something sane on runtime - we can't satisfy both of those
requirements.

Hence, configure the example as `no_run`.

Unfortunately, the kernel's Rust build system can't consider the
`no_run` attribute yet. Hence, for the meantime, wrap the example code
into a new function and never actually call it.

Fixes: de6582833db0 ("rust: add firmware abstractions")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/firmware.rs | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 386c8fb44785..106a928a535e 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -26,14 +26,18 @@
 ///
 /// # Examples
 ///
-/// ```
+/// ```no_run
 /// # use kernel::{c_str, device::Device, firmware::Firmware};
 ///
+/// # fn no_run() -> Result<(), Error> {
 /// # // SAFETY: *NOT* safe, just for the example to get an `ARef<Device>` instance
 /// # let dev = unsafe { Device::from_raw(core::ptr::null_mut()) };
 ///
-/// let fw = Firmware::request(c_str!("path/to/firmware.bin"), &dev).unwrap();
+/// let fw = Firmware::request(c_str!("path/to/firmware.bin"), &dev)?;
 /// let blob = fw.data();
+///
+/// # Ok(())
+/// # }
 /// ```
 pub struct Firmware(NonNull<bindings::firmware>);
 

base-commit: 997197b58bf6e22b8c6ef88a168d8292fa9acec9
-- 
2.45.2

