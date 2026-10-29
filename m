Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250372;
	b=cUvkM+QSkSEH4TLUC/LHRkXeCZSvM4GsayHXJeaJKHQS8dFjO5vftVG6q6VgwfcIP16/
	 t/ilS/3s1W7UwiwAS8BAGbrF9d+MvGR61v8kgnLkw1w7hzNSaDk1PsmTDTSd/dQYoZBJk
	 y4N3txtgLyLMcAXhcMIKezn5SUgGa8lgjKwccEkwdUqaG7r3/DlI7tXxrOkCLmuHmXQLC
	 dEDMsJWs6IRq/0tpUBdkaOQJtd6H2r3PyiSHtHWfQxVRewnFkt7KyPGwZnTwiMh557WOE
	 L7ceXxBGC3+i7tMtapvwuGG5zYGosRRo82jrsA7bUpDqQ0K/CloEXs0+QIq5oNyfLjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JRnZbRztbK3uQmcjPiHrls6jXuhvcHYv7zJm0Q9BEjQ=;
	b=EbYLJKVog6x7TjzgBV1U0Xv8p+WWL4k49vIV2LicuA6ruxk3WrBKiN7dzFLpf257CKtP
	 p8vLBKthd836OYfybkwJOuAbyBYPH06tdQq5d6GVoz+gP+NEtGeYs74JIq6XmADehiaC/
	 Qb8XePL859Lt4EHYkiqNsXT5q//GRnnPBm4tSdnTtB2yfJZ0n/SJNFpSnZdj+Z/UfonSU
	 8RPqjvOqSRgXR4wrstK9LP9BJp9r2gWxpeCQ5dXU/sh5Hsx2BjGKeraDrxU6zOBEMwxHi
	 KmDc0Z1fIHnr5mwfNZ1dQo+0IhI74cpgP+TNabdN/LSdw72117lZxCFtFm8BfVmL42A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G8fxqTXT;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3695A606A31F
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 05:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3695A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G8fxqTXT
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e8b20a899fso11833425ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 22:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250371; x=1793855171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JRnZbRztbK3uQmcjPiHrls6jXuhvcHYv7zJm0Q9BEjQ=;
        b=G8fxqTXTTNESyQXKDfIY5Xm8WthtTd3j5AumXbjcPreruRzIvJMDLop8TkQXZylU3o
         IlEvSfcyGjWpqG5HLBexfP/zaWk5YYU3eDReWFuHsG3VrgOxLwqzhNxYvrFdaiwvtCbt
         /arHNvx02yfHlnSJ1jjO/tDYf/1o3w6+RJ7pGCPCqu3JILVZ05QQ83cPE61xNQHWd5nC
         HFBB2Q17w4/zRv+jCWFodkiXb3OrHw8kVX9cxRCiYzEr3xxF9zkYljFcUt2R/Yjqq8dg
         M2CFYURtpKrc4PkoREBYRaO4xVAgS3cWp7BxSi2Uy9RCLdpmE0h3DIPREbo3dcklQkFQ
         V76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250371; x=1793855171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRnZbRztbK3uQmcjPiHrls6jXuhvcHYv7zJm0Q9BEjQ=;
        b=hRS1Eg43f0PSmhW3n83fyZr3Qk9pL8g86mIK7y1t9m2zdjsy62Ul7549C+SYIop7Rh
         xrxMNRo0UxVOXqowyOi6FWydDN3MB56bQGjIlF2EXk0qH7IIyJTKX78Bws+gb2wpXZbU
         Feiu0/tHgYnbzuNkCefn49KO7WPA0dCFHjobFkSPT1bbEBcmF8Pb+uMCEZwOZOqvBmnb
         7yh7l3zNUXIvJN7yNnPq8lMPqFCSXbyG8M8sQOSTWhjwlApSmMwLlSc6FEKgpuycpzzY
         pfpQewtzZqa7j+KaxvtDspjUruvIKFqS4BiyWPJ5FDb5JAXLnL1Yk07FASzhIy35N/n5
         jhYA==
X-Forwarded-Encrypted: i=1; AKwUvBy9BchQExB5LuGu+5GBNwtVXPbZNahZ/cdCgUjmLKWmPcgVyJIzkIx8ExosAa6TYxp/S1deIxq2G2LxfcNU+w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIVNqytlflpiQ8b8bxIMWZrCJss2DxAIhXE5JSAQ5kgJH618978
	L1Coo6QuhaftilVQXdSpIZWO8e6ANPeVRZc2ZTpATBMtEZxmb/psIUX7
X-Gm-Gg: AYBFou16yoaveaVC1+Ys73jvLe2tL+83g5p0VEWFiBUC3GXVKW4qmEIiC7Y4ZE6zR3u
	Zg7qSFkazHaUthPGh2z+YTxcDLwzS3rW8OZdgEoOBS4IOPtf9V74+I69H1XRR6O+fdHDdaEReGM
	ryeRNckHkwUcAl8/filNPLgcKCR/WGnoE3+kqoK9a2I+0yFdNS1vOMn6BvZpDYMYzHTNa58nRV3
	PU/zPIOoLvzD7bAklBv7BoZGU6U3uyz8ZHyqvZj0j9xJJ3kp3F0JM40l3DyjuMPzmQinb+8uClk
	ax+xZnKyEVseFxG89GfAY79Gmi8QuC0Lfip5UEjDZD3JZKxOJ8NpqIx8kybhGR2fXOCFMLVKc5H
	nbvuB8Z4BxHa5MlWbboktgfZ3fRiXi5Y87AYZ82TXnTrQZbRN5MBROwrOz3vrJFaXFpk7K8Inpi
	sZ6Ss43yh1zo8fAHiuJ2L8HTMwo8nl0wtHOUYoeK3jTQeH/rk6tJ9IlxN6ADH1knnM+iY0a2bBG
	4miE5T+J2xsSXwjYbRE7bD2yAVipR8T4Rih/uMA3Wb7/SGDkymsNXgkiOtMyQhmYVoe32723C4I
	Eum4vefmAqGbCx38WfdAjPvPmJz4eg==
X-Received: by 2002:a17:902:c950:b0:2e9:61bf:6591 with SMTP id d9443c01a7336-2eb0058dfa6mr43576915ad.45.1793250371450;
        Wed, 28 Oct 2026 22:06:11 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:10 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:43 -0400
Subject: [PATCH RFC 02/12] dt-bindings: interrupt-controller: Add BL808
 PLIC
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
Message-Id: <20261029-rust-bl808-console-v1-2-b736ee920078@gmail.com>
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

Describe the BL808 D0 PLIC as a T-HEAD C900 implementation. Its
interrupt specifier includes the source number and trigger type.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index cde4bb6918978b40037774269cee85212d39d4aa..9c625dff1968ae6267b0ab65ed8d4e771c70c3ec 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -72,6 +72,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
+              - bflb,bl808-plic
               - canaan,k230-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic

-- 
2.47.3

