Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793286125;
	b=lKBAJFSKTkSoVzHPP7A3NEwKfneZglwfOQRn9cz5o399qmgkYCThtAkFsqLMsaughn8x
	 psC4P5VWDqdz8QHMKc2nhR21U8sY7GSJ+rOerEoPyZ5q69apClLwowax4zrdLkfy94jXR
	 CAkN9ANakuEaBMFnDEaIuLaBivRVJTrk9rYhHZrWhYkxrsJ7I8bOnq9ePFDgQD3W6v4aA
	 qiLDjGgZHuvuI9ulGnrNIiYs9CLDah85KDzIx6bnrQIS6xmAtM43Er6TX4+oLvvsenTuH
	 5CMscoMup0eR/mokf8oYCoKTMypmrp8ekunkjcpK55rRbyHDeLliP2NDzEO7Hm8sIYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2dzY1VlFFnKOfznTWW/4WF7kG0zTG9oXRoGUydpsGfY=;
	b=N0Jrx7j5Z9Aj294OnwetyEAKGZ8UpGWGPsxLiKqy5dEvPXQkNO9xGZMC6OqsikFZ8Zjc
	 qxGA3QMZOaVwJyxutYXRocdeG8u7xgq+SiAwhcoBulDSmYfR3/PeYwJZAom8YjMlpE414
	 cUZxKIzOLxKUKxwpoD3zsjnz3iIQ2S68PG4xv4NiXkQmz/z8aizwhMFS3wr2dEC4gJHRx
	 oerXW7JI0P/nkX2TRhxpuxpZOC1r2XQppP4NnnKHFm3xfnHfwBKouSRaz0qaCEimBfUoc
	 9DDiPSD1hC4j84tVJSZ1TzL+xxplTdFU2Ojml8NzuogzuW60Z32krnnjShu8xrKGnpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqMw4KqB;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BC8606A31F
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 15:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37BC8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqMw4KqB
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba3b1199f6so2352218e87.3
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 08:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793286122; x=1793890922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2dzY1VlFFnKOfznTWW/4WF7kG0zTG9oXRoGUydpsGfY=;
        b=eqMw4KqBocIxMJmGei4723yesql9KLte9N+AZ5pOiWjjIoGut3mKmKnbPvGwi22AkV
         UAn/zbJKsOcsfwdI7CFbvJJFVxzDV6kdFq8JZHXhaXb/CUicufWgb4qScQdW0gJ56or8
         1/RyvFydhPtEwlYa6eBroZSDoPDOc1PtkJ8URie8mM6GBHZ6GK6e1zsw3hZuav8evHc5
         0hkqcU+SHvQ4BeTuyTy4Fm9/hmbG/hK6NuhuKvH6tPhUjAuztA7AmtM2ZbAdYN42uXkQ
         Iwzc9Eh6l3piRuonxFgDcVe/4aiWSOO/rbaP1Rdpa/6VwaFvs2mCH/XiXnXUTOQx5eNx
         MdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793286122; x=1793890922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dzY1VlFFnKOfznTWW/4WF7kG0zTG9oXRoGUydpsGfY=;
        b=zrsloXgVo3fDp6hIsogv+NncHsUGkXmMvxqS5ElXxeHReZr5ezL+LvzgfGk/5NG5w8
         nDzh4OhlFdi0YxXSne6alMgIksdhd3id2A7sogxq2SlZ7gwflsEtgtny4UKE8c/d5cf2
         uyKPfkUZWExfIu0rDMmpse18Tx9bkxgy2z0KLI1NOLC8OS57RlR8RkMDXwSQk3KTVVgc
         oher09y6TfnSUnII5u8A+3dj4pN5+t637AAduG9/PACx0ycEjJWOm1SL4tmal7Vcgacr
         TR0ByCkkDqkispWG02OLFwsQhVHNlF1aMlHDD+7KOgJv3Hsb0DuNfZuVFdjpJJcfPVuA
         8TNQ==
X-Gm-Message-State: AFq9FYKtiD4ac7qwAmtlOzG/BCzKRY+D00zytOK+EXNpTF07JM2rpOpL
	oSVQ7CQDa1I35IdF+iSaMv4N4maMrvkGF5Mkmn9NhUz3S2PvcGMIT7ww
X-Gm-Gg: AYBFou1V6truuXw5XNrVnHYqBxtpRJeX5l9Jni6YacO0xJpPzWkApMTEjFmQYG/7ZcV
	eC0a1NSJscMDQeJCB6dFaEATRLtbBQBK16PaODrUW7IabJ0EkRDpKoY9fSNi8FQyXh53r8zLgDZ
	mKDv51ejVb3ubxaLjeW146VIj2ANdALjz6VKEEH6rMwXmxo/LzLyZytn4EaQ5++hW4e8M2gBF3M
	QpYP9A/4pYayj2PnA267oZIaPScgMKt5qg0ri0yzTPZ3XSB3dTR/ALOeZbcIR7KUjVHTtom30nv
	A+2PSAdgKl2HaQ21A0sGhLgUKOmhJFw1wiQoF0BRMpz1kXACegz1EbZ8fdxBDc75VniWrsU9Lfl
	QMMkgiwzTvoZJrf+p05+PzfnZfLltNVQ+NWLg4eBaeqA9TzGDpEjlMDdsyZH9rkIsjoSrI8O/Kc
	d14Aj9mrCfdr8ZGBb5NA4yhIzKFqY4B0EQQyEFT+VGg2+YDCjferAWvdctJAI/UZDDjEQC62K4G
	hOfD3aauBHbs5DyYQPDVcYiHOpP2zlkwfJyVGC2OEvCYj5xK+Dun4ESqpSuYecqqD1stx9Iimr4
	E6ywmPwySUQ3uyy8wmP3/kaUwnW/26PeBpGGb5I=
X-Received: by 2002:a05:6512:3a93:b0:5bf:a193:7a5b with SMTP id 2adb3069b0e04-5bfcad4618bmr2446673e87.34.1793286122095;
        Thu, 29 Oct 2026 08:02:02 -0700 (PDT)
Received: from archlinux ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca5a485csm1306117e87.57.2026.10.29.08.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:01:59 -0700 (PDT)
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
Subject: [PATCH] rust: macros: add descriptive doc-comment to internal fmt function
Date: Thu, 29 Oct 2026 17:01:47 +0200
Message-ID: <20261029150147.11989-1-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add descriptive documentation comments to the internal formatting function,

explaining its role in parsing format strings and wrapping arguments into

the Adapter helper.

Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
---
 rust/macros/fmt.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/macros/fmt.rs b/rust/macros/fmt.rs
index ce6c72493..676156dc9 100644
--- a/rust/macros/fmt.rs
+++ b/rust/macros/fmt.rs
@@ -6,6 +6,9 @@
 use quote::quote_spanned;
 
 /// Please see [`crate::fmt`] for documentation.
+///
+/// This function parses the format string, extracts named arguments from curly braces,
+/// and wraps arguments into the `Adapter` helper.
 pub(crate) fn fmt(input: TokenStream) -> TokenStream {
     let mut input = input.into_iter();
 
-- 
2.56.0

