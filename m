Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F5E14E2C9
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jun 2024 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718804399; cv=none; b=uHSmgCiU44tTdZgPf12hDreErmqG5M5R559/PCCAZhsaUy88qPO74P18Y+X4UjBt3DQoy6aYjeQKEtsCYla96M6s/ZFcpNm9ZCmmC+8bIF9MCNShh4XZnJnmUf4W3Psrc/GIb+ebWTZK1ll/9vquK89RU1v3+dYFH589+DK3l3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718804399; c=relaxed/simple;
	bh=yoUSiebyZwPezfOuX7s9C6epUS/lrYXVNbKLZgN8Mcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c8XiY7EWdTBEtFiJtCkNUR6eSfH9RfThg8JjF4G/YTbTQO6BNHPenz3Glw8ehFfEj8hWCL1KGajOYVeYzWG4Sr62YitK4Z+/cHtHDwMUX0vBLEou87nelwnL5mpASlni+9cOHsCviaLsuoNs501Xp8MxjGfsAbn06ifH/jqcNHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EOYsfPtd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EOYsfPtd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718804397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FZbEz2+OKO7jvDSaixeSjrJwNZQXFC+rdqXvSkzyVgQ=;
	b=EOYsfPtduY4Xc5Rpac4jYfGoubIVKWuiCxuDd56hMZelYeLJJ1jTDgsibaWGw6+YUfK2ET
	C+QJTbD/fTYaKUvLhDmwaASXxuhK0Jua2UXsr/nTpPdCRpdq6uADwf1t+yjouIrDHXG5yu
	B6m4Sv0bQvY5Ykq6fLVXOCvVgStkaF4=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-O5MeXc_nMH2D1QLBr-bYJw-1; Wed, 19 Jun 2024 09:39:55 -0400
X-MC-Unique: O5MeXc_nMH2D1QLBr-bYJw-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52cc9f05f2dso890427e87.2
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Jun 2024 06:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718804394; x=1719409194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZbEz2+OKO7jvDSaixeSjrJwNZQXFC+rdqXvSkzyVgQ=;
        b=L/8H6Vr0VrOcSu5Hzlr/Y9Zu80dt+vm61lKeyQuZCOOjC6Th47VzJECVBRjuRBnrHZ
         MUNCZ9lZeNzq1zRNateNaheaFUqJe6wPvUA3aWiYeJQ1KZMfdXpac6+sULVTrNc8ZokN
         4VnTvYzOD8m201vnljNqjXUve9Un4gfbLGjeYgD4hNzQZq5ehqN2QaZUxa86Bhvop/Hu
         qM+kWWULFrsoybI2aQGB6vj8G1H41tSYVXDmVpMYpyX6SNvlM/CkfAyvEEI7xia4c0Ci
         iiryy9w9x79vAiVBu1rMooJRVVmbNCv7AZ3zzjgFc82SMnQBQS4/hRycuTAK+Ko01PiF
         AnBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGY6RKCG4QtHQCwlKR46KRC76VONGv0UZStsi+M42gUsCO4+HON6PgWdoli1f1r44zgc4D476stFpfbnPbfdtP+h6yIwxrYlpHH9kNU1c=
X-Gm-Message-State: AOJu0Yxk/tBgUWn/Jz8dHL5f2qgRyLdqc6lvduxJxvfasnZGbkRwNCV2
	wP5yZfRhWvsMnpqOCP50n0GwrSx+yKV8B4zWtTk/lmvNB5qw6r+Z4E4fN98u1rq3a4yK96Qtmrd
	xG96WVdXwTVQlLyE37MSEri3axesgQx+O4C4hrg/GpIeYaCT5Sak9RbCwP/LV3QkWdqXsKEhT
X-Received: by 2002:a05:6512:3195:b0:52c:818a:28f0 with SMTP id 2adb3069b0e04-52ccaa28b8emr2045163e87.6.1718804393800;
        Wed, 19 Jun 2024 06:39:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrT34xhLEjKoVc5EMURoInN/KBbDQOLCB+X18OFUg9VuGWj2C31lBWX+NQSLSzreovD6dQGg==
X-Received: by 2002:a05:6512:3195:b0:52c:818a:28f0 with SMTP id 2adb3069b0e04-52ccaa28b8emr2045146e87.6.1718804393395;
        Wed, 19 Jun 2024 06:39:53 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9676sm263824245e9.24.2024.06.19.06.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 06:39:52 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>,
	Benno Lossin <benno.lossin@proton.me>
Subject: [PATCH 1/2] device: rust: improve safety comments
Date: Wed, 19 Jun 2024 15:39:17 +0200
Message-ID: <20240619133949.64638-1-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Improve the wording of safety comments to be more explicit about what
exactly is guaranteed to be valid.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/device.rs | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index e445e87fb7d7..851018eef885 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -30,8 +30,10 @@
 ///
 /// # Invariants
 ///
-/// The pointer stored in `Self` is non-null and valid for the lifetime of the `ARef` instance. In
-/// particular, the `ARef` instance owns an increment on the underlying object’s reference count.
+/// A `Device` instance represents a valid `struct device` created by the C portion of the kernel.
+///
+/// Instances of this type are always reference-counted, that is, a call to `get_device` ensures
+/// that the allocation remains valid at least until the matching call to `put_device`.
 ///
 /// `bindings::device::release` is valid to be called from any thread, hence `ARef<Device>` can be
 /// dropped from any thread.
@@ -58,7 +60,8 @@ pub unsafe fn from_raw(ptr: *mut bindings::device) -> ARef<Self> {
         // CAST: `Self` is a `repr(transparent)` wrapper around `bindings::device`.
         let ptr = ptr.cast::<Self>();
 
-        // SAFETY: By the safety requirements, ptr is valid.
+        // SAFETY: `ptr` is valid by the safety requirements of this function. By the above call to
+        // `bindings::get_device` we also own a reference to the underlying `struct device`.
         unsafe { ARef::from_raw(ptr::NonNull::new_unchecked(ptr)) }
     }
 

base-commit: de6582833db0e695ba0c548e3cc2ad7dbb6aa260
-- 
2.45.1

