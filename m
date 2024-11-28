Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2EB1AA7AF
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Nov 2024 14:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732803213; cv=none; b=IHBZrZh1pJGWh6m9KtNO6EdXkb1sW1no1O5ElJBcpsxcBuknP//kvCHS7DH/2mxGhZ4jlFctKBikvI9YHImlsEQc2scaatLXPDc3GkHLP39ZUWD/FIUGBsoh4CpJiNQbYFkBGoL6kgTkzvx8eD4nD4FmXl1VwnOKkOgKHIdi02k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732803213; c=relaxed/simple;
	bh=SJh0Q+xP9tm3ci5BzCF7qILnNgyglrEBDytRma2l6/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=f7nElURtUsaE22EjFK+Tkzu4vbRCw49O5hFg91Q2Xf3U/H4xw7LIOTUCwhoZD9ePkAK6zE5rZtl8fVUTta1HQZ8PKgkFusOQDInUisQFkClm83r8Z1S3KIY1hWMstJ33H1UHMoUsRwLx524gzt8YbO/sl6XSFBMeenH3qY/EPdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ht+SWkOT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ht+SWkOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732803210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y+ivnks9eHKc2cnO5lo7WNGX+jATBqoLL3Di+tggXlE=;
	b=ht+SWkOTkzCQdAyWAKjxaRUlJqEUzI0XEHg5nwz8jXojZrBAgr7rPYS3vjTY8B1i1Wev7/
	TzdKQkmBQwR2oumy42dpsV9IKMWjiQcZtRcsHNophdKfeXXwdBmXKaz1JgJVbRxIfLC9OC
	65mrJty54pL7De8F2K5xq5aqAfKO+wo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-cCM8kLgYPAiUIqranRpJvg-1; Thu, 28 Nov 2024 09:13:29 -0500
X-MC-Unique: cCM8kLgYPAiUIqranRpJvg-1
X-Mimecast-MFC-AGG-ID: cCM8kLgYPAiUIqranRpJvg
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38249bf9e82so431190f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Nov 2024 06:13:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732803208; x=1733408008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+ivnks9eHKc2cnO5lo7WNGX+jATBqoLL3Di+tggXlE=;
        b=gJfJXNpnshmS/8YWcPELqnNITaGHKsJ2G8tnyubkdBDC1fPWQVP7FNnQfGCwg4Czsd
         MhWK4zPsWK8zmUbC/nlW1SHWv3A4MrWUK0gp6+fIGOl9Dp1uX3CWZjA4w2waQALGHiUx
         gyyJCTZPaluY6PNdPtW4RM1t9SYM9E5eKFyEO28E6wqHn59IvKI2j76VrPIkLpaozkE2
         7HSk6znqjWWxn6ZFjhl1Ja17Opzw6TBmOniru3ZKxWY4E5GGSgz//gAeq68CSxUenzhI
         oggz0zm4YyWUZDxIcyk9oafvVj0wnjHaAuW4oozX0hU9XBcDAenDXMNOqpWp29x5HdCi
         4pAw==
X-Gm-Message-State: AOJu0Yxj57WVFFeiDYZ2qRU3ciSyO/seqTmllIup4AxrXzSxwc8Mylxh
	vU1q58mPTGIY8dQ4PdhXODAh/cXaP/AAJN11NxmxT/JG1MJIVywKlwqGYd/gcKAwIbLjoMOYWjq
	c6yziOthilkPVXphDqvfM5CkTcdPQgCwxJfEQ+6aTr78/8OI5/bDKIRYrThEN2y4HFT+l5PtU0N
	WbPNc5zPbh5njukdVwqUbcsp5eaounGOIkzsjwELJMBoadU2c5
X-Gm-Gg: ASbGncvWDQLgphPGj3agVpgj9IcadwBm0xMuwVTvTY+hpZqc7qT+2e2vtVcgFA9etzS
	+3EwOeavNfmKZvzrSCzaYwq8qu4NsZgYtHyeD9YYBM36h9wnlxwz/mGPe0cE4ksELfmQnHsvfDO
	fja+4Ax5hcorJj3aE/p1eFYS3OBMGnOHCPBctEdqGKd7Ledy1yBzfyAfZ1zDS2UyrS0CIUxkW+y
	eEauqbkhXs7/jEBtMI2CZMmJPeD+KNjP++GBuqmQibS30oixQrgBQ==
X-Received: by 2002:a5d:6d05:0:b0:382:4b80:abdd with SMTP id ffacd0b85a97d-385c6eb6ce2mr6248563f8f.21.1732803208211;
        Thu, 28 Nov 2024 06:13:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzs9kOwW4KCqCU83SaXXdsgyGIxgmc5Rib/xImsEnns56tdvoTIASvpFVBrLhP206OdnyeGg==
X-Received: by 2002:a5d:6d05:0:b0:382:4b80:abdd with SMTP id ffacd0b85a97d-385c6eb6ce2mr6248537f8f.21.1732803207812;
        Thu, 28 Nov 2024 06:13:27 -0800 (PST)
Received: from [192.168.10.3] ([151.49.236.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd92eabsm1714407f8f.111.2024.11.28.06.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 06:13:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: boqun.feng@gmail.com,
	ojeda@kernel.org,
	benno.lossin@proton.me,
	axboe@kernel.dk,
	tmgross@umich.edu,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	gary@garyguo.net,
	alex.gaynor@gmail.com,
	a.hindborg@kernel.org
Subject: [PATCH 1/2] rust: Zeroable: allow struct update syntax outside init macros
Date: Thu, 28 Nov 2024 15:13:22 +0100
Message-ID: <20241128141323.481033-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128141323.481033-1-pbonzini@redhat.com>
References: <20241128141323.481033-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BZpTeIBgXdlFNtY8Gj_PHOi8gYQsmx1peYe5OGcQT38_1732803209
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The Zeroable trait is a marker trait, even though the various init macros
use a "fake" struct update syntax.  Sometimes, such a struct update
syntax can be useful even outside the init macros.  Add an associated
const that returns an all-zero instance of a Zeroable type.

The exact syntax used by the init macros cannot be reproduced without
forgoing the ability to use Zeroable::ZERO in const context.  However,
it might not be a good idea to add a fn zeroed() inside the
Zeroable trait, to avoid confusion with the init::zeroed() function
and because Zeroable::ZERO is unrelated to the Init and PinInit
traits.  In other words, let's treat this difference as a
feature rather than a bug.

The definition of the ZERO constant requires adding a Sized boundary, but
this is not a problem either because neither slices nor trait objects
are zeroable.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/kernel/init.rs | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletion(-)

diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index a17ac8762d8f..a00e7ff6a513 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -1392,7 +1392,12 @@ pub unsafe trait PinnedDrop: __internal::HasPinData {
 /// ```rust,ignore
 /// let val: Self = unsafe { core::mem::zeroed() };
 /// ```
-pub unsafe trait Zeroable {}
+pub unsafe trait Zeroable: Sized {
+    /// Return a value of Self whose memory representation consists of all zeroes.
+    // SAFETY: the Zeroable trait itself is unsafe, and declaring it (whether
+    // manually or via derivation) implies that this is not undefined behavior.
+    const ZERO: Self = unsafe { core::mem::zeroed() };
+}
 
 /// Create a new zeroed T.
 ///
@@ -1444,7 +1444,7 @@ macro_rules! impl_zeroable {
     {<T>} Opaque<T>,
 
     // SAFETY: `T: Zeroable` and `UnsafeCell` is `repr(transparent)`.
-    {<T: ?Sized + Zeroable>} UnsafeCell<T>,
+    {<T: Zeroable>} UnsafeCell<T>,
 
     // SAFETY: All zeros is equivalent to `None` (option layout optimization guarantee).
     Option<NonZeroU8>, Option<NonZeroU16>, Option<NonZeroU32>, Option<NonZeroU64>,
-- 
2.47.0

