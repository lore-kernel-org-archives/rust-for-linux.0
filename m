Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1FE2F745D
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 15:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770911867; cv=none; b=SETnaV4saNCSHmEJJDl2HlViO77lmjTaTD3KHJlNHeq+rcP+L9xIqz+Ftv5lUlFpZYqCy6yXXGaGx30x/LiiaRQN+RzSK4msKeDaL/CLGx4sudTgDty6N9AOHbsaJ+9Bdop2WnkGBsKEcN0r1L9/KiGOf/TRGPki6Be3p93SOoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770911867; c=relaxed/simple;
	bh=xx5vtoxWJjT7XvfBzrA0HSHd4cDvDQz1mL/pHn50lX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EclT8hhk0B3YGfQSUaZFkKotR8lZ6bG/aPLtblUiW02/M3Ow7nb+O7pkctzp9H+oJ7cdaBwB0Ak+oAAfCMWwkLl+/6ENbcklegrh21RnhvfJRRP+BoWQVi9ur0Ou5YwZ5DqvBx7BcU12YYoo2YNlIi0Cmmqz+n2Rch6/pv45PQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBWJAisk; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBWJAisk"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so484230766b.2
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 07:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770911863; x=1771516663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eSoRTSdDM+KltOlpQFXcvNm2D2977GVOOaNl9r9qRBU=;
        b=UBWJAiskR2U/HHtMDrx95HLz/XNYN8rrxvHlpbFc6xlEcTYjyzFS3pPXF3l+Fcudle
         MtzFv7l3Gglg3xERFVw1ju6EPUOqZM3KkGlA+XFgFQjsed/kx+5XRF+SZ+XHez+Z7oTH
         qBqmsCbqkGDNCDKy0Db2v5pwu9OPcYod9Z5/X5KT34nuMJUcTPeDOLbvUTF7gaXQUoSs
         CSvQDY5D1HT8HVuMV0bRHGrN/IrfOkhsVoutNltlIMY7p3P/vZtbJ9tg0b0mOOjPvaQJ
         1kKocsdAFzfL9aIK1AZ//kRjII95Nw476D/HIJVUxg+TmJ9BBBS7uHHglxdzGu7xDNMs
         0zPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770911863; x=1771516663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSoRTSdDM+KltOlpQFXcvNm2D2977GVOOaNl9r9qRBU=;
        b=wKBECYPdLUonQRRi+KkYvC+t/S7iy54Yfr2omglHMo50FKdTG8VuoR2ArO92iPnLYO
         zruUuJ6agkmMeOWYQRkhiRIydovqTIdoNdMfwxTEUI+d4AWY5Bxwpa4I6S/DpQRP7vst
         IvXz61//7UnlSTl1bWMGpSfWD2xaVMeUC8HRvlLKCALXvu650jUDTZ3TlAJAbFQtxbxa
         XHduiFx8y2jHbC6u2iXbb/q0CGmLy5zHllCTf5YNaiDpbDkqvyGo9w1qwCF98UtspHF9
         onkQ1fh1AiU3fWasznADBkcATL7YPxRN12nF/MRf9ehVeLNfdh/+RM0bLVHze5q2E06g
         GIuA==
X-Gm-Message-State: AOJu0YxGy64Ymk1WVa60oCryDuibSwqX2ImqoYvacL1QIkH3pqmpM7TV
	aSIBZZvzRPkCnoQaKNFTRa0cY3NqEQXQ49Qe1dnkA6jqnU9BK/meijbGzucDIB1IrlU=
X-Gm-Gg: AZuq6aKzGAOvRz8us/SYp0mV8KJ/LE/m75GCYx/NHcaGn1/NIJ4O8sRQzqpH5yl28/S
	KFBHOdPVPG7ETUMdyN7mO/zKCffdOMMvbaV7qDMDbOaFJPbdfYEj+Aa7vEH2grV3B/Yp6RrPh0W
	7MXx41L0e/XGAE6mLTgPW6cQzi80GS6vc8Dq0iNkEvWauhU+eivhnAoCDjnb4f6SizKzQoy2LPq
	Tay+tVPwgpg3a77WqOFJbsrZP/EBk9XyCk7snvLRWyWJRzgYzrzKOk/sM/37W2E1voAtRu5YeML
	W57ovVVoEPPJ/6BbP+Abz7X9OzEJNSGbEMKE40k3drsRyIVnfUKxFaFPEhjGuU62KSmuOvGD7Sy
	YEzl80v8yqNw9qhhy87F5WAwfEwxdgDVzp+Ce6hNY78CGiwoWcuwRea1oaiRPQoT6x4ZwyEb5kX
	rBPpPoOc/ls68=
X-Received: by 2002:a17:906:f58c:b0:b80:751:ee62 with SMTP id a640c23a62f3a-b8f92a1fa88mr171760466b.14.1770911862956;
        Thu, 12 Feb 2026 07:57:42 -0800 (PST)
Received: from localhost ([121.91.57.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ebd986fsm173873566b.37.2026.02.12.07.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 07:57:42 -0800 (PST)
From: Ali Zain <alizainuimx@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org,
	Ali Zain <alizainuimx@gmail.com>
Subject: [PATCH] rust: list: Extend safety comment in List::remove
Date: Thu, 12 Feb 2026 20:57:35 +0500
Message-ID: <20260212155735.185415-1-alizainuimx@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clarify that T::view_links(item) returns embedded link fields
that remain valid for the lifetime of the reference.

No functional change.

Signed-off-by: Ali Zain <alizainuimx@gmail.com>
---
 rust/kernel/list.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 0d8a201f2..65d33957e 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -589,6 +589,8 @@ pub unsafe fn remove(&mut self, item: &T) -> Option<ListArc<T, ID>> {
         //   or in this list (with the same `ID`).
         // - We hold `&mut self`, so there is no concurrent mutation of
         //   the link fields.
+        // - `T::view_links(item)` returns the embedded link fields for this
+        //   object, which remain valid for the lifetime of `item`.
 
         let mut item = unsafe { ListLinks::fields(T::view_links(item)) };
         // SAFETY: The user provided a reference, and reference are never dangling.
-- 
2.53.0

