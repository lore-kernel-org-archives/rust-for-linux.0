Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D8C82495
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jun 2024 13:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718803267; cv=none; b=a4R/xVyEEdIQQvy8OihDGYJAFW1Jc29xuJ0Fw/71so43t9D1eDyMP7FkpDAVyMwcmy7jmGvY6JYgkpD7Jzw3KNXT/KZgSaFpspczXH7icCBMfvvBqXpzlpb1vrCfmV/GcN1QX23LRtPp3TxY+83UYMz+ZIe8e9xjk8mHT2AXoyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718803267; c=relaxed/simple;
	bh=5E8vDIqKgkn6pHLbqq57H2fNCs3I/Q5RwP7zBhlZdxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y5GLYMM0OkbiR85szvGpSgQt9I6KHFRSbiqxtfzeK4vlxmOGH7VzbPvRIybeNVCgST8fuaIuju2CZKUD8ngguOqlhHj489CKqn/7veiH00KvWGZs/G1oC41V1Ph/7eBdVEPC5XTpm2nj5v5754Anouxeg+t3RuNTfTNeDqfa8hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AtFRlduu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AtFRlduu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718803264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LzW8s4RIKSJhGPbfdH18YWjRsnO2uKYhRg795DPUmgs=;
	b=AtFRlduuvvzLOcfNWkj2L6qhhZymkL9PBZku7UbYdREWrKogbCbsefOe8grIWHJUuKyD6g
	luyWgtAvQ0jrATiDxL+5TLrf3ebrQQTOWDOi8TRvq9UdxQAKQb0CXC0HklUeljTD8439pX
	V4GWhS+jIKDnTQn2ffnRaDxO4tWJmfg=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-SOCYclwFOFeo4rcGE23ilg-1; Wed, 19 Jun 2024 09:21:03 -0400
X-MC-Unique: SOCYclwFOFeo4rcGE23ilg-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52c8126f372so2643477e87.1
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Jun 2024 06:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718803262; x=1719408062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzW8s4RIKSJhGPbfdH18YWjRsnO2uKYhRg795DPUmgs=;
        b=xQBaS1L+cgbNN0KilsB0PmgPD6t9aNpvIdnh11G/6x1Ifhw6tOeo2C85dICYyVrzfc
         X8e6qy1dOApQOW/QGWRYvZ3MRbLFcvLgqqE8TxZusm0+1L3DlU4uAwvYuLBV1G+qQRl9
         y3waHALg8Rwq0B2hmR/Jdo8JRuCQGDoDFDrsALry8k7dKjmd8DqYUiwn2pf981v+TFIC
         r/u35Q7pjYLhqB96Dgdte7MR4YnyLC6TvEefExYXbx6/gdSds4hbMYhS/e0xswJT3pXI
         UaErMbYjqTGlFuJXiMTohhwSEl+DHbZo0bjh1chC3jrYzTdCaC3ddLSV0VeDdG8YLVDL
         ZKpA==
X-Forwarded-Encrypted: i=1; AJvYcCU/aWNxS5IBSvHH7MXxKlNhmPun9p2SZbkve+bXKp8PUkp9k/ZojyrtcFD4Tb1WSYiNOm/HHayM7xLyx93lXSzmokwGwlCMAIKlZ1YYDJo=
X-Gm-Message-State: AOJu0YxO5efr8Iq2iygrQYI3OSVQiYECIaQh8O/YCMv3o2158FvY7bjh
	iqp1nakoeLVJDrHAoIGM53ARfWwAQRuXspx42EkynWYKhbOJrdtZQAhRk7wQyrijh53caqmSTbP
	ZquQYKdb31UL/xPb4pm7uITsmVXcY6PA2iXxnjFPr+MIsv6lgXyt/Cc6WvdLXPbNo
X-Received: by 2002:a19:5518:0:b0:52c:7f9a:5053 with SMTP id 2adb3069b0e04-52ccaa5d811mr1474828e87.23.1718803261897;
        Wed, 19 Jun 2024 06:21:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNPfhskyKxfy4zOknuSiPU5vN6I02mz1eNi1JlZbCDy7Nt2mfqo0eCZOlFuNltz/QguMqccg==
X-Received: by 2002:a19:5518:0:b0:52c:7f9a:5053 with SMTP id 2adb3069b0e04-52ccaa5d811mr1474815e87.23.1718803261469;
        Wed, 19 Jun 2024 06:21:01 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874e73c7sm262782545e9.42.2024.06.19.06.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 06:21:01 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: mcgrof@kernel.org,
	russ.weight@linux.dev,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>,
	Benno Lossin <benno.lossin@proton.me>
Subject: [PATCH 1/3] firmware: rust: improve safety comments
Date: Wed, 19 Jun 2024 15:20:12 +0200
Message-ID: <20240619132029.59296-1-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
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

Improve the wording of safety comments to be more explicit about what
exactly is guaranteed to be valid.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/firmware.rs | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index b55ea1b45368..386c8fb44785 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -22,8 +22,7 @@
 ///
 /// The pointer is valid, and has ownership over the instance of `struct firmware`.
 ///
-/// Once requested, the `Firmware` backing buffer is not modified until it is freed when `Firmware`
-/// is dropped.
+/// The `Firmware`'s backing buffer is not modified.
 ///
 /// # Examples
 ///
@@ -72,22 +71,22 @@ fn as_raw(&self) -> *mut bindings::firmware {
 
     /// Returns the size of the requested firmware in bytes.
     pub fn size(&self) -> usize {
-        // SAFETY: Safe by the type invariant.
+        // SAFETY: `self.as_raw()` is valid by the type invariant.
         unsafe { (*self.as_raw()).size }
     }
 
     /// Returns the requested firmware as `&[u8]`.
     pub fn data(&self) -> &[u8] {
-        // SAFETY: Safe by the type invariant. Additionally, `bindings::firmware` guarantees, if
-        // successfully requested, that `bindings::firmware::data` has a size of
-        // `bindings::firmware::size` bytes.
+        // SAFETY: `self.as_raw()` is valid by the type invariant. Additionally,
+        // `bindings::firmware` guarantees, if successfully requested, that
+        // `bindings::firmware::data` has a size of `bindings::firmware::size` bytes.
         unsafe { core::slice::from_raw_parts((*self.as_raw()).data, self.size()) }
     }
 }
 
 impl Drop for Firmware {
     fn drop(&mut self) {
-        // SAFETY: Safe by the type invariant.
+        // SAFETY: `self.as_raw()` is valid by the type invariant.
         unsafe { bindings::release_firmware(self.as_raw()) };
     }
 }

base-commit: de6582833db0e695ba0c548e3cc2ad7dbb6aa260
-- 
2.45.1

