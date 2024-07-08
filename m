Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A122414C5A7
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jul 2024 20:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720469254; cv=none; b=LSmItXPMsxKEipa9vNX3eZiN8kTuh6GkRaBg/nv7ukIOfDUpPIZ8C8X4vycOcWGTaohNmhvitP9yazazv4UTh3aXjTH5FojP/M/kQBcciWNM6bxjnkMaoRLZD34QC2U8UQZa8xtRliF6Qxwm+9UjVgOUkj1qPIN8sZkFEnxe92s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720469254; c=relaxed/simple;
	bh=bdhvU9UNHx8t9DL/tSkNjaiRfS1x2EaARCAwMAwHCUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l4MoQx7E3/BILv7cLbYHcig7KXwWqGtrHN2btHaz7QwCXWfhg3VIlpdjN+MQTw7bxTovqIUCv13i1axyuJfSXav3iD5pfZ/0RbWQ+7KkVFUujnZGKpbH2fa1IQLrSGDV0hrq/kRhaX14HjrdYNKSfdaSIytQYHXZMxqcoQhDWDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PpadB+yT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PpadB+yT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720469251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yL5D2HYEXnL7bQRI7uUNDG51u5Y8rGadc9gkXbyKQGA=;
	b=PpadB+yTrV2FxCisANW21+mojkBBq03tviSStI7lUl6TJdm+CMNgIsLRgSY5Ueu1rTMBzp
	OrmWuqxsfLcQaRVv9NRFssZXIaoX06aAmQtCQl0kSYNJVc62rPsfXGKqHEIRcZEW3Rm8tU
	AihARY4i/bj6r20UyR0A0Sgn4Fwa6lM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-mDf3iB0TOyOHUUFNDo8E6Q-1; Mon, 08 Jul 2024 16:07:30 -0400
X-MC-Unique: mDf3iB0TOyOHUUFNDo8E6Q-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4265d010266so18332375e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jul 2024 13:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720469249; x=1721074049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yL5D2HYEXnL7bQRI7uUNDG51u5Y8rGadc9gkXbyKQGA=;
        b=VfjOpBaFhP9lV7SLIIwFK+Dc7gXPZsEOliEYsDRtWBLZc9qX+Y1Z4O3HqAeVEAE/7a
         9ijXLA1LKtihH0OpgEVDGeBRo8eRuss4zQEuQCmquOfHSA+OuCGvQ3G0AW7XgEKa83CT
         7zXWiv3aWnSWcImQN0nlx7VRaRdsoEO8/j6C26kGFpFcKribU9jdgajCPmGDXYjXV1XL
         4hikBSDRzMwofXA8fBRk2c8nHomiQAvlbPX1HiivxG8iHJmFf7KkQJBuPnwWMIaRRT/3
         q/x8d86nujY8TusB9AbD4DdFxraYnbLzs8FE/6Z8XiETkxgyIGjunn4pXbUlXbazOfl4
         8upw==
X-Forwarded-Encrypted: i=1; AJvYcCX866xNuBTMbz7TwjdZnM9wT2gj5LPqkmgvKxWMfr6G1Z7qvkQIGJzicMge5lRKACcemmAV5q7YMo2sos0ZkXVEyroPFNvO6366kI4YwLY=
X-Gm-Message-State: AOJu0YzzKABmmvZD8O04XcUp0ond1KyqvhjzSijZhUv1vzwZW9RIA3H/
	0ulc8OCRrvigZznC6QmpCoM5hja14leIqXosJ/DFHoh3gMNwsPsqFzREIxls0btiKc+xzqV7/qC
	/j5PhaW4jK3WNSjy4w0170SIhYqcWnhU7Y6YIyakHT6ay+moOhso9pxzjt3c6WCjA
X-Received: by 2002:adf:ffc8:0:b0:367:4e05:bb7b with SMTP id ffacd0b85a97d-367cead1ed1mr404416f8f.53.1720469249399;
        Mon, 08 Jul 2024 13:07:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH63gQqjJCEcokYKLmBaEJmumwTy7f+NP2A4sWqUyKY29gIBVynPTjxXAGDrCc3mTaIESJUug==
X-Received: by 2002:adf:ffc8:0:b0:367:4e05:bb7b with SMTP id ffacd0b85a97d-367cead1ed1mr404405f8f.53.1720469248992;
        Mon, 08 Jul 2024 13:07:28 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4267259a118sm572885e9.1.2024.07.08.13.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 13:07:28 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: mcgrof@kernel.org,
	russ.weight@linux.dev,
	gregkh@linuxfoundation.org
Cc: chrisi.schrefl@gmail.com,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v2 1/2] firmware_loader: annotate doctests as `no_run`
Date: Mon,  8 Jul 2024 22:07:20 +0200
Message-ID: <20240708200724.3203-1-dakr@redhat.com>
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
v2: (no changes)
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

