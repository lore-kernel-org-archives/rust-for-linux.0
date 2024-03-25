Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B7A1B7CF9
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 11:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711364705; cv=none; b=ZHswwzsSxg27URyk4yoo8lolJmsYL5ShJPvEbLl+2XpWesNriubdU618MmtVNr3kNeR6GPzbKepHlQvtpcCDMmBWMUS5pU5SuQeotMg9RkQJVexac2s3tImQ34XVGFp+67WpsKsSGnHEgB3uzAEstnzv2rVl2//FM8X7qUpk+vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711364705; c=relaxed/simple;
	bh=8qGxdPp0ebqQ8BJrXZEREU34pnPm9lzorTk5SAfMphc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O+ekn0USRtusC9LZp0G6GsxVsNDXx6cDNIIIMS+ARPn3/WqwyrpPgK7VK2xvsEKfh8JecxdAyM5vttXrssQS64UYAzualQybc5+iNQivlRaUOOvAK3XCRqIRCWYqF+TrTbcgaxovrSfa8iG8+nuKqEDg8ryr7lAVSuLOXFazFZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFTZa4Y9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFTZa4Y9"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41482aa8237so13569265e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 04:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711364701; x=1711969501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fP7Ls7uWKfPWUstbGnxIlos5de3ZaTK6YiZZAdmhw4c=;
        b=TFTZa4Y9AiX3lEz5QfBPOftVR6Jur1W8zgKznuFgi0TyiUTXtTsiUeprTr4KTOcUAH
         LrLk3G6Mi3Zivb8upDclcDNvf6t44gKUKLDdfn1o2DXgV7EBvy4Qav5EQKcE4Ce5OukD
         CD6QkUV5CXO1MvBILeOXrQtHlV/xpZ3xjpERFUe4QFdHa45pdg4tg8NONfvsQyd+JHLG
         VTvov9nIKOVso/jnVUv+wPHioxkc4MuhaN8B0slqVC7yIPrnA0Y1uhYTGSREMDkMZkx6
         6ji2WZ7C77wsn/h/Df8lWYfuu6ydCFkkOjcd3nIYYZm0dJHsposrY9IBWF+8SKlDAopX
         GTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711364701; x=1711969501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fP7Ls7uWKfPWUstbGnxIlos5de3ZaTK6YiZZAdmhw4c=;
        b=weS/S86yucNeUpzz5t7DIE0pI/4X6ym9ggswe/VQB/ZcGaG5CEcvmScyUMbTYucSit
         O7/ABrIkurkRFPPK2IUbGy9ZTsNoRU+3wgoJBa3du8lwk9Wzjd+tXwftMrlL3/Wk+o9D
         g1ZeMoK0O7Q88F5NWZkAV3IO3i/NJXh8raAHG3NzqB881tDYLra59Ankpt0KfCj9LY3S
         hB1jUv1JR1vpxR/i2zFsJnMTYYF9IG0wlSaj4RtFhsDaDDR2J9ppbj89jXE7mg1f3aED
         zjblDNfkT2scZCkMxp5ahxgpP2csFEVY1ZDNPy4MuL09JLM8rRVEjA+n5Mq1LKp7OTle
         G92g==
X-Forwarded-Encrypted: i=1; AJvYcCWTYRxlZivlKlSCQ8uZfPWyh85h33KPkOaXASjOIUSyKIoATIHrQtYS/cRZS348NZfBmnyf8gHIO1gStdF8KVdviypfE0Pc0Ovh1eHRjAU=
X-Gm-Message-State: AOJu0YyBu6v9QD+6Dj8FWONKPLSS9tt0p7JY2BSom70PX/Qu9ot69WCO
	cTYA638tXRRguxorNfPb2/+8n5elJBzi+uGeFYlz6UKGTukjrEr8bxMdVRFE
X-Google-Smtp-Source: AGHT+IEpXxoZypR14eQK5FYki2Gu1MMymhuncfKeObEHnarOhbyHzSE9i1TWnSknu+Fokk0sMtc1WQ==
X-Received: by 2002:a05:6000:1564:b0:341:c83c:374d with SMTP id 4-20020a056000156400b00341c83c374dmr4414226wrz.71.1711364700940;
        Mon, 25 Mar 2024 04:05:00 -0700 (PDT)
Received: from vincenzopalazzo-arch-dev.fritz.box ([2001:1620:71db:0:cc57:871f:84ee:1b83])
        by smtp.gmail.com with ESMTPSA id bq28-20020a5d5a1c000000b00341cf275252sm1833628wrb.94.2024.03.25.04.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 04:05:00 -0700 (PDT)
From: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
To: ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>,
	Kartik Prajapati <kartikprajapati987@gmail.com>
Subject: [PATCH v1] rust: kernel: types: Add `ARef::into_raw`
Date: Mon, 25 Mar 2024 12:04:26 +0100
Message-ID: <20240325110451.42277-1-vincenzopalazzodev@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the function `into_raw` to `ARef<T>`. This method
can be used to turn an `ARef` into a raw pointer.

Link: https://github.com/Rust-for-Linux/linux/issues/1044
Co-developed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Signed-off-by: Kartik Prajapati <kartikprajapati987@gmail.com>
Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
---
 rust/kernel/types.rs | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index aa77bad9bce4..b2a243bb810e 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -366,6 +366,38 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
             _p: PhantomData,
         }
     }
+
+    /// Deconstructs a [`ARef`] object into a raw pointer.
+    ///
+    /// It can be reconstructed once via [`ARef::from_raw`].
+    ///
+    /// Note: This function does not decrement the reference count.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use core::ptr::NonNull;
+    /// use kernel::AlwaysRefCounted;
+    ///
+    /// struct Empty {}
+    ///
+    /// unsafe impl AlwaysRefCounted for Empty {
+    ///     fn inc_ref(&self) {}
+    ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
+    /// }
+    ///
+    /// let mut data = Empty {};
+    /// let ptr = NonNull::<Empty>::new(&mut data as *mut _).unwrap();
+    /// let data_ref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
+    /// let raw_ptr: *mut Empty = ARef::into_raw(data_ref);
+    ///
+    /// assert_eq!(ptr.as_ptr(), raw_ptr);
+    /// ```
+    pub fn into_raw(obj: Self) -> *mut T {
+        let ptr = obj.ptr.as_ptr();
+        core::mem::forget(obj);
+        ptr
+    }
 }
 
 impl<T: AlwaysRefCounted> Clone for ARef<T> {
-- 
2.44.0

