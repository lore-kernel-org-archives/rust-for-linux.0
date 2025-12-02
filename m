Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1D62E1EE0
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704277; cv=none; b=iJaHQG2RHyH2AEQpK2v400RdYVbYaTXmpV1AkOkXTotuSt69StGhDNL6A0O6l1iX5tvr3Uh2Or2WRuPxPEhMixbT5UvQxPkSMtDgt/plWNT0pNWaKo0anSymRc3OkmB/eQ1Kc0zyC1/WgZE7cabSNz7d21FO7g20NFa/Wc0Jnz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704277; c=relaxed/simple;
	bh=J4mncn1owE5s9oryWUtB//Q1Sk1bGK/HELXSuG+un0s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S3gTHHA9nL+/kKXO9oweFEnkhJHE9ft5tXjAqu4hPq0Tk3QIzElHDcCtT4naKOu5ZarPRXmGUKvIeCnJZncP4ISZwxPKi5lXOe5AQqnwAgjQwfOlSgkPRLO/k9pUHQrRcRJPnvv0aumSDZf1ho3tU98JxLvUmDWFixqvKKfWVOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kr6k+JQ2; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kr6k+JQ2"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47910af0c8bso39901295e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704274; x=1765309074; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jBoadXLKnf/GASk8KpNchuSWw2ZfdjysWDU1JTXwDrg=;
        b=kr6k+JQ2/m6vjAKcsN9bOz5oSbOwoJMeFXav80ajzYLwQTIaO0y/5WdPmSt0sHGD22
         xUqIjs/5ALkgxchInG8ZIbC2JIUdV/OLneSAwQbhy8xcm09nZ1Pjmc43+RHn54s/2AlU
         mgPwm3/mY+tELC076YksCegq3d/3wEnSetKPxAR3SQEBKbc8mH/LudKnEUBgkSWfalGy
         0rDKv7C1jyAenzVCGCoVbkQGBJWQBMnp9TJhSf1wXlGtltv//DfnKGiyCmtC1z92Bjci
         UoJnk+mNNRCo/mksNUScxZwzis/X0xHzueK0JcI7lSpCcs5j3IvH7GESy+PeGR9WplEB
         +8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704274; x=1765309074;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jBoadXLKnf/GASk8KpNchuSWw2ZfdjysWDU1JTXwDrg=;
        b=UzgNdsCCXaz5UpUmQ+EDWBFC7D6KiK0orBkXoSfizfO/+3E/9kmoBbfPapcTbLxdIV
         9FbBrJLYf1xeWxt8L74qrMdzEBA0n1Sg/bKVOkD0uE99p6eBZOkS1RpF6V/SGBgvbGaH
         eIdACn1Pzo31Ux+fScVNifNGXjtZPS/uVffjwYURiUUYG0lBzLdo49WFxVpM9ikbwzle
         K/cK1bz3jWtKpyys3ugUwphP/rHpeBRUqM36jq4bIW6sT9nhie75pFLvMZEob/RtfRr+
         C3fZQUDL950vQmDch8oqyteysVMWEkVqML7DcVdJrWEnv9vrWeSZtYlv1myTy5lVuQxp
         +xxQ==
X-Gm-Message-State: AOJu0Yx03GEjCxMeGfJAKSaJax+TrYqZj66EBj8HC98VEArN/tTH2RZO
	c/Us80CjYGeyHswqKfT1x2pMjxjbKv1Vh5yKdNfzRfbxn+I4qpITQCNrW2XvO0Rj+ek8as1f8ja
	uqvDODLCX4/eiaUEooD8DlHM/SLc80ZOctssieEVM6RjjM4bNu3u8rk4O4xT0KBjTTMbutBgG+0
	3U7GRwUHpWqptRtIGh40czwrI3d6KTDmyk4HmuWno6lSdT3ybkLHOt58+NtH8Mru8=
X-Google-Smtp-Source: AGHT+IGYXtAuSCHdFnDprDlJlDS7MRc2w0yjsLw0nyDtJVelCtYCehMi3d2+WKPRanZhoq5mv2NVvDvaKZy340U=
X-Received: from wmbe3.prod.google.com ([2002:a05:600c:5903:b0:477:9fac:c456])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f49:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-47904b24957mr308612715e9.28.1764704273701;
 Tue, 02 Dec 2025 11:37:53 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:28 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=919; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=J4mncn1owE5s9oryWUtB//Q1Sk1bGK/HELXSuG+un0s=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AG04A+yHtoTx42+kVX6fwxbh678vMqbWTib
 6ReIp4QyKqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ABgAKCRAEWL7uWMY5
 Rr6kEACnDfYEC4RehWPOf5VlOU/QhwioJ/OZYzaPJhx1hIueWaoEGnBrw7ThSHIdGFxpKV6BOat
 r5s8ojJ12e+M+eAgrpRVszfEGgRGwuneodz7C8WfmnXnQqsCfmKwF+fsft36+oU/WOVg8hIBBUJ
 bqw1bEskVMKPyuqUYvpCNsXCymocy0FHxlnc5mG2fcI7+hOVCDXjJDn8XxHva5PBkZRIFwwKHdK
 fnFiAbY/CSWdcMA0ZTxR2eeY0oQ6Zu2iOoJBJkIM5pwmoUI9kRhjpXaV6A7rEn4cae5THKVthA+
 1d9q6+NRWG7ZiruIO4QbNIbWgGK5IKVHp5r3K3NL5inrJxfbXeTvNCMKU8LBJia4zca7aZ7XBIk
 nMjYebh6qShbhKGDhu56N9ePotStB+G8SaqlmYlTITNOoxqfC81GDSxQd2yLMf1TANqk51HxuO2
 APiL/ShySGhzaijya8uIyAMSVoFV/RTHXBZ9qG+DboCrHGeDi307snOIyG6ZEfCA6peTaslFgw4
 jqAx82He19Zp27G1VKb22ublXj+3YnlXOAG3dD3y/hAxcMW82QnrQmv7KNBm4QO9iDLqjgVs9IC
 AYygqnrSS3nK/4SAIrv+aEMoPG7QzTek2MQy5Ejt+/0O+HKawULovJ4kabfW/dpI/jvJaRmYaBn 2fi5/ToxMM13V1A==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-4-a2e13cbc17a6@google.com>
Subject: [PATCH 04/46] rust: bitmap: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Yury Norov <yury.norov@gmail.com>
---
 rust/helpers/bitmap.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/helpers/bitmap.c b/rust/helpers/bitmap.c
index a50e2f082e47ad1bacbf453fd79d1fdfe2cc11f5..57e9e64ab0c385cbaec8ba3f169bc304e07cf419 100644
--- a/rust/helpers/bitmap.c
+++ b/rust/helpers/bitmap.c
@@ -2,8 +2,10 @@
 
 #include <linux/bitmap.h>
 
-void rust_helper_bitmap_copy_and_extend(unsigned long *to, const unsigned long *from,
-		unsigned int count, unsigned int size)
+__rust_helper void rust_helper_bitmap_copy_and_extend(unsigned long *to,
+						      const unsigned long *from,
+						      unsigned int count,
+						      unsigned int size)
 {
 	bitmap_copy_and_extend(to, from, count, size);
 }

-- 
2.52.0.158.g65b55ccf14-goog

