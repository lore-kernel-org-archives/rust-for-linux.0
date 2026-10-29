Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250423;
	b=1ijSO+qCr7PdVX8toXQoPJT+mq5uPAnz4zNPkKLzMi6phF8fsa2+uomQYtnH4FA1NFmo
	 FOBTHBXd88XPQW+udZY+cjcuuqDxt28kWi3sTi45Yp5nFAhaJHh2GTJsLYmC89/97+SJj
	 g6/V+dtp7ALV+r4tsKCY3MSJlCZiWDP90Fpw9X07USf9lV4HIscYXpcsw/iPSXmbg1Pgd
	 oG0tbslg9kS0ivKZ2fGjxX0n2jjqgC5W/Eb7z4QBxIut4uDYVt+b39pq5x3oOQtxIt4eG
	 E9mmAqJiijBB17OynJQNmHPd99ME4t1JqiJd+4Z9tFh1WxtfPmKARVwYH4qjEQK8ClA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Qf62xHUcdwxTQhTGo7oUzUtykTsLWeHZ04Gslg9ulB0=;
	b=NKHdzRRQ47frJ3pAxuvV0ujAoW2k8AaicDpV9XB5vqnwb8dZPNJ5AyeQDFc6tU1A5UhN
	 HbwmhyDB1SU+YqQR3HZG63D07zXofsFUgvFqFxTSnjpd3QvgplN/nBotNiSNiuu4gI0u+
	 0HUBo4DZSsEQL32ZmRkLVPSYhYTcHpJtCVeqmKvM2SqH98q5aN7/WBRebMN9I6aKMHtie
	 MP38XmZnAiinEbbqCLZ1M7uy/MrcC5xNDqd1cZD/V+dT9VFOpyT5/vafNR+kfu0lMBQMU
	 OFzKMRVmrlOo7GCTJXklQpx59OduX3ciLVwNStEF0W32aiy0FJnzviHIawv87BODvYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jwi35f5T;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F62606A31D
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 05:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7F62606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jwi35f5T
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e96502e447so15016455ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 22:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250422; x=1793855222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qf62xHUcdwxTQhTGo7oUzUtykTsLWeHZ04Gslg9ulB0=;
        b=Jwi35f5TK9NEOrvRXbIbHQzmViWwUkuV5Yy2ISL3C1ivrmVTCemVIljYoOy17cn6tr
         JpellHJL0zQ2nZkUX3/lgwEsUKH1BYRMQMIOsP3IslcYVdkK8PelyG84J99oY2ImCKp/
         55ll32AMYAjoWN/vskYDkhwQXaWxDKazw31V5nbbsQdJINvYsITVg01imn1HCcwPlRJq
         aBMgGbvl9K7u7gZKwBWNZmEHSCVJJ20ApkXi5XJqIsPHH7R0GJqbOEs1zj3ndDEh1Af6
         GrDz4L1HQ5WSRC0GzdaQATInrIFjtfW5Py2Iz1/GTzjdm3V1u/2N3AUZIn/G/n1lvNHL
         s3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250422; x=1793855222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qf62xHUcdwxTQhTGo7oUzUtykTsLWeHZ04Gslg9ulB0=;
        b=ZWqvHrilJgbnpcRQkIDmqZlN2+vHr4zmvd06mhVsR6wbwVlraxG3FFYbva9fT1SNrw
         ULvzQJ+U7IT6nUac1Uch40dGXgCfbvIAjO7W1FecprXOOcAmSojot4YkJ+y42wjpopEe
         HI9zS7tIJs3VfkFBqVwloZqEq7p6ft8qNTqnQeGCb8VjMu85dqnhLoIZiwDaTW4+GHAq
         kopeyywswDj9GoYF4WglRqt0zp8GokuKeSWFO62lWq24FtkUeTLo/R5oY4br822hH2DB
         YpmJ5hw9L+X1aV6TIluQruCe3nYyItVCMMwNGulErNghwG5DER/RHaNNGeIzzFvrBuBb
         rX2w==
X-Forwarded-Encrypted: i=1; AKwUvBw7BOqmyyBB48X6tPfqNfHYJwBlEjbUL3uZunCVdyMvzQXd13yDBFGF5CtsPs59pno/us9VngRyb03Hxa8c5Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIVIBzqZ6bBjS2pNSU+Qh1gmsgQNUUp1Pt4YT+BYDWmpCSzheQn
	LgbeM0VAJxXH9Qd57NJTwePchxL1Gv4dWRMmuYeTeoGP2QaBJIdBTuk/
X-Gm-Gg: AYBFou2eH1Oc5/Nc6j/+jm961Dqmccyb2zfIHFDmnuG24Ds6SdmxVV60jXfszmwXJZO
	bZkfVVlZ6q93y4nJxh74sbhi5O0dRf5SUufYpKcFa8Ug/rBE+X8U17naijwVgUV73/DjCi/ZBE2
	1lnMpi4D3dtDGPOasaXCUpp7aD2q4qdyso65q9gx7oBSmjyuUPxFKlUTBXzDg1NxJA7EgR2VIUS
	lMOrg9dJl6xGs9B6+rdtTD8f6gE2KIrmatZQzgl0T9wWzTbAuMBZAHBTczSn4YzXXH+RSOSpRPm
	NqAfwFSQHhHRl07PFlmL9P4O9rX43Yzwt/PD4K4Odx/bCeNwCCd4MEU1ELAB+AArRN/zeMhJ4ef
	QPxBoAIZxfLhIQDEqZbi5ntG0aGJZicrBvG0CFXPFMWxee2lBcwsoxNm2GLZkavEBlD8l1n9/Nc
	0w2iukthKztkA2FK8/vpla47vZW+0yUlhzcWuv0jD7eeq3kJNnT7hGW5gV5jFlJUUZ+cdxTwK2d
	4O1xjJVXfej/rlViINoyHqsRkmVRYBOxwOau2lY1Z9ph1ipGMt2+5XKElB5lQ2NSpTTUgGkNbuU
	GSlxNMoBBfoWjbQExSELoO9kYvxD
X-Received: by 2002:a17:902:c40a:b0:2e9:4048:3031 with SMTP id d9443c01a7336-2eb0054029bmr40770025ad.39.1793250422229;
        Wed, 28 Oct 2026 22:07:02 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:07:01 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:49 -0400
Subject: [PATCH RFC 08/12] riscv: Add Bouffalo Lab SoC selection
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-rust-bl808-console-v1-8-b736ee920078@gmail.com>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
In-Reply-To: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Kwanghoon Son <asdfkwang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2

Add a platform selection for the BL808 64-bit D0 processor, including
the T-HEAD errata and common clock framework used by its UART.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 arch/riscv/Kconfig.socs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index cecbce0c498384d3283ed23cbf2514391eee361d..ea4667da7716a9a8d2ae156c422b277064b42530 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -12,6 +12,14 @@ config ARCH_ANLOGIC
 	help
 	  This enables support for Anlogic SoC platform hardware.
 
+config ARCH_BOUFFALOLAB
+	bool "Bouffalo Lab BL808 SoC"
+	depends on 64BIT && MMU
+	select ERRATA_THEAD
+	select COMMON_CLK
+	help
+	  This enables support for Bouffalo Lab SoC platform hardware.
+
 config ARCH_ESWIN
 	bool "ESWIN SoCs"
 	help

-- 
2.47.3

