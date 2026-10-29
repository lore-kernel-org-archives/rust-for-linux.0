Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250381;
	b=x8bz0B099kTI5L/2VoubyVmqRS8bEFre2zAI+Qq2hPPSwP47ZHETES8IWecOyxZN4XkX
	 UqQwDOaDyLiiAfRWehD+MNurRq0YbPr0HM89sdrGFAdU1UppfKsYkM46h6kBQgv4lbyxq
	 oUX0IemUJrvYjn5C+1J9wQ/wCN3F0cV1Z9hYTUYN3bnjjJS0bsiy9mysszWwibCUt4NBF
	 H/Jma0dA2tJsgSKTqDa9mz+i3VadB2Qkj3gAHN/uzKuqlao9qleFUzra7bCheYC7IX0Fw
	 VtoYIEuHf8Yjh2hAn+WyH6OPcBYzw3hqPOCoMBpSWi4/rKu45DPyFYz6feXeOGGBiaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4pcGqj7EcqEBhg8rTi3U2rPWxfkoRdeov/It4k+I+Yk=;
	b=1oUgoee08qpXfli6x32Nzko+EiL3TU1sT4DXwi2ripYYj3JOJ5NP27NFbaevBR3mfwXs
	 SmKEBGSLCTzJ/Bo+sPKwRFDg9XyPS1UsgfdQOrIZwhCWsGkmlFWmOycZ8LLvcHGgurmhp
	 A1rMAd+8FF3HrMi1ZNRvv5NiQCRpK54eh+ZHXf6GWAgqgia+Kq8saykQqrEtti61IdPsx
	 UpvMTJi9noH6K3Irk5Ye8ttu7HJXu8+zQ2zgqjfuT7jVgTU9CbsNvPYwDvEUe7bg7MCMd
	 glWb2ECPYAv/oJ/E4ZMnfjpzqGMxAEyGgKjAQVf0gyTZB+2hcQjllpJAC7R8FnPcu1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+O8EIyU;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C409606A31D
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 05:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C409606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+O8EIyU
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso11208005ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 22:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250380; x=1793855180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pcGqj7EcqEBhg8rTi3U2rPWxfkoRdeov/It4k+I+Yk=;
        b=z+O8EIyUDM3BtcD1Yx+C7oAh11I9nR0MCUlgL3ALaofjFPr87O3qwTHMb0KwOteZ9R
         0cwM3kRXpkcEfO6qrZAvwIAcuKigraV94opIHJDWIKiTMpviMPbYON3NUoFaY+WaQP93
         6PEyAtpOt5C+yA0/Gg/CqAGt4oydFJKCV6/vsqxNYhjRfM6RBgikOTsAIR22StKRpk+x
         Amjxt+VRUPM2Zaz2nCnjzuWiAvSwLW5LyYUB+YrvkWE7Az61qyadK+F9l1psyB+MPrZW
         zdutJqgc+QZFFjS19kim6bzhO5GYFyUkwhFHVTGrPerT+qmNxMQFykUbqErajqkROqvM
         bF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250380; x=1793855180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4pcGqj7EcqEBhg8rTi3U2rPWxfkoRdeov/It4k+I+Yk=;
        b=X7bcUt8liwDJ+JNbgmndDaWMROJxVF85ME7vnl3aT1OjFJ6OkI7aXij5ijRqpQQP9j
         BbHXflfEV+YAFZp5vA5ySnFy/vo6iMKSnsyemKPSri0ZQx8lwUUMu80EXPmvng4OMW1P
         DG/yDN1rXezTBjnBKWSUUNS0wO3MAiqwKwIDntrH8MyMUvJtFDwkEk6cRRn5zvYePlr+
         21At9fTVRnDOwJCASQR4kFfrh7LYRuhUb6HyfTRurMfX/MLRaZiGFuMzsU7qeYF+nhrk
         Qtj2vn4M06uxAJtCU113oNWCS3z8DjEhhwaMhZQgbQRQrMRR2LgP2zcNxqtEY0QSWui0
         TukQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPd4eIGSWxeTjrTaB8+SKn/nzHUc9cEKg/NI3DtQRf4PboO9/V7gHk1MgyF3+5gqYnOZ1f3BaYJzR2wKChSw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJtlk9X40y+fWeTLe3yyNg1trvD6wM+I9Dadm3M9q3bU4ZGJ7Bs
	wkF1dZwUHevxlyZZxi9urdqlyf377K9tcsYSSkjx7xoH4FSdmU07r5sw
X-Gm-Gg: AYBFou38gBkAEQP1CxyZCRpJpzvXgcN0HVXY+Kjy90IrH3jY5knCbf1MvlM1hsHfsps
	EOSfg2MOHTdysitHd0/egkHS24aDxv8GCna8qasFmZemRHc5Sv1snDOD4ShCqM+CmAz/r3g4c5n
	PRnyfKfdZqDgu0bmywlC1k4murCendmLDA+yZUmVxSYdzLFKe9X6lnzJYL+LcLQznFDvCMDm1mk
	nM15CKcE0AEUqTkA+fEIPbEthymLdm0PB98UI6bkc1akv6QTOsSQVMBvFVBIRpbrOhLFotqFEcC
	7ZUHHp7F+rltyF/kQl6awYi1ZHU8asJ2M6CWAY/8SK809GHaRQ0vyrb+znIW8tONZ9NneeskRZU
	VCR1G3wyFgNxUhd9+IMNedEOHMEonKlkJ7pNbmast2vLOhxybMoSI/UFPJBFXdPgZWbM4JnO7t9
	j9b34OwA/uhVi2ABJGHzVdaIxnNz8UnAN1/0DX3fZOPFxYz8xWGk/vHLpiH0/RRFXbIsHoGGOvP
	m425XZD9kz35c0W/x3MuhTB9HeHiHGDah4YTyKWAdLFdWuyKUjAZdXaD52hPThArGTacg8K0noX
	GLb9ZDvxB/q4PUB99dp0ZONXYEFM
X-Received: by 2002:a17:903:380b:b0:2e9:9c65:1aff with SMTP id d9443c01a7336-2eb0041ee21mr39673785ad.45.1793250380523;
        Wed, 28 Oct 2026 22:06:20 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:19 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:44 -0400
Subject: [PATCH RFC 03/12] dt-bindings: timer: Add BL808 CLINT
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
Message-Id: <20261029-rust-bl808-console-v1-3-b736ee920078@gmail.com>
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

The BL808 D0 processor uses the T-HEAD C900 local interruptor. Add its
SoC-specific compatible with the existing thead,c900-clint fallback,
which accounts for the lack of a memory-mapped MTIME register.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index d53f52e80d887b40c0d20049d86867c8a5b6fae2..3934c0842751e02174c1be6074548e3e1e8f11fd 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -49,6 +49,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-clint
+              - bflb,bl808-clint
               - canaan,k230-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint

-- 
2.47.3

