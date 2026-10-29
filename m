Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250390;
	b=YA4awZpeOmVhXk9pyy8+kDswpUroFN83rEfOYCzKs/GrrnsXr6mCAmB2Z0V/gereVqY+
	 cbT9Mr0xn4QE/TleCVa+4bUquS/bDE5H3o5i2Z0To3Di81X0HD3+kOzvfxH+wzdoxw4zn
	 nI595/8mNRwGXDFvuVzgJMKljfdAhI24WsxThJmweOCaDptME6cIDnp9krvmAIjSKlazl
	 8Mj+3S97t98YiU5B7DpwS9CVYIwolD3tD+Mp3RGSY+lC0rvENtH7H5gEiaDoS0wxMh7FG
	 SltSpF7eFPOargjUmmFnYqkI0iWH7OSaKfu0ufD9K07auyKzwevYByp1JPXB5ENB72w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CovTA5I7uRtS+rK/MoAKpr4q/R4ofKrh6kdcg3ZjsRk=;
	b=s9IhFzUibI4lmP7tiI7p68sKbTQC8nFD2GEmdr1tzRST4a5ilheiQpV30Gjmk3xVkfTB
	 SVTwNr8x26B6E/5v22J1Jqa7M1tkRvGvwCppTXBHev3j9aal2RN1L1jxW0yMSxxI+5gge
	 Q/97Ijqpd4yaxOhDTyhZ9e5VxhI9kDET6vnHuhl/A66QQBL79D7pHIMBnHBYmJbpXtPJl
	 fdxlCj38fboVMw57WKSqKaNjcOOLincA21nydP4CVAwfVuB8eGGnzFncj/s1hRvIerGRj
	 UPlYLvITIS+TqikMy2mUPnAwWp05KsFq34pHBAh7QxjfXCL9O94Ivml6WZOlLRZsfIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iwxsLAlm;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47282606A321
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 05:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47282606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iwxsLAlm
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2e7c8213b09so5359285ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 22:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250389; x=1793855189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CovTA5I7uRtS+rK/MoAKpr4q/R4ofKrh6kdcg3ZjsRk=;
        b=iwxsLAlminzYvBptDnBRm5gwKSr6xNCJXMFvGuDNq0B6sxOcBReZ34X15VYNkogTLq
         BCsstjXwc94FjXK/lY/5Fw2+rM0edRohKTYo8s9Trd3WGF0eMK0GFUxCrw5yDELYHMk9
         hwMJIh1iNO2j0n3YzTWCHRizeFEpMoCD8Tqoa2k0BXdriokc3guSNz9e9UYwqB5oGwLH
         L/DcmDcwMTXWm50BtOe+zbUtX4f0y0yP8mNAEveiEDaL0xuzoP/IAhmvy6/u2tDm98mH
         10LnEZGfAFpQaU9stluVmRqJQvLJMZAnbUf3c8x9DWNqYQbq/R35LQVUnFG4XQoTvmlo
         +2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250389; x=1793855189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CovTA5I7uRtS+rK/MoAKpr4q/R4ofKrh6kdcg3ZjsRk=;
        b=TmHAO924t1B8G+JpdLLkdE1T1WaBu7iBbD0QhzkzT4EIAC/ZUqna3j+hj3N9oLPRe3
         d9PrjWT7zyCzIEh4VWsx16BlY9DgcXjaM5ZLxtTcQC6NtCbjgkX6GYnwYMfSdMNkRgrR
         sQK8ZHy3vpsX2Yrwb0ACs+ZtUHjRE0yEyqyjA7QoCyUl2lkeyDqhQFkKHYfBuTqwzlQY
         O4BwveDXE3496EsUrA1frYWdsV8dBl6G4WXO2MvYeOXvXgaI3ZEAZ0ltJXKLBtWvZ1za
         OlN+bmhsufmVJ2sdELt5NHTs1BK++7Hkd875/LCRNzqU7MUvmgITaSD3eRi0BzZ+Mv5O
         Pc7A==
X-Forwarded-Encrypted: i=1; AKwUvBwCGlCAS1vp2336YdstHHvKXmsiis1p6HLeAJNfGGzlj6Zzcwdi0r/yJWQWuT281gfGq5fBUqNhCi+qkMEruQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJkb4n/97Fqve+eAIJ4VrB/hBkcQPr8InqrW5MORyTQsj6maq9H
	r/fqqdIjeldMvy+xggqxliQutQfRIqFrQR3FaQ7gB+FtJQLatsBlWZX4
X-Gm-Gg: AYBFou3euMjkHurBLipmuevClJQybGDBjs6S1LV2xm+dfT+pcnL/tbDp36Y5+Azrmqo
	qGxUSjdlda1bZ2p//NOP6f9wJNYm07ksGqivsNHHtmtRhYGJXtiZXWEw9u5Dd/CiYcsl+Zb3uY/
	kS4bbjyEPfqYwoO8deb5tDGSieRGugxr5PulMwQuuX9lNIELot8Ht8gXuyw6yUNQclnWoCHRKSQ
	cFNQSdGoKwHAajmSgWhzaZ5ITnebY1xaDaoUfIum6Yu76y8cByPwtfiMy62EiClvbUkUs54eLt7
	n9TgzFjiEYY+Lh3xSCsbXgyJIDD/8FKjTE/uTR8Hui32g417zfomxratfjdJuoN2x4T9t4g13JR
	MOfeXaaS8/fO7AX2vnBziBSF/DYz62pUCNmSj5QMjKhgn57TXaiZj/2sbR4bLvXMMo5gMaD006/
	jyE8rgWg2XVC8ZVeyK2yRh9XKTK2UtKH/aXjtapmdjxDxP4ZgHieum8/4LmWPkVen8nFwkI8vHN
	bWsH9Qco8degkvTc9aYKq0UyyKfIeZgI/W06YlYUYZ2jeDDVNvZCvhJwPDiepHZcX37h+ECxyjF
	CUcu3Xzq95AYZllaF4VOeHByg88L
X-Received: by 2002:a17:902:cf4c:b0:2e5:467a:7a6b with SMTP id d9443c01a7336-2eb004f2a79mr39853755ad.10.1793250388648;
        Wed, 28 Oct 2026 22:06:28 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:28 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:45 -0400
Subject: [PATCH RFC 04/12] dt-bindings: riscv: Add Bouffalo Lab BL808
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
Message-Id: <20261029-rust-bl808-console-v1-4-b736ee920078@gmail.com>
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

Describe the Sipeed M1s Dock carrier, M1s system-on-module and BL808 SoC
compatible chain. Initial Linux support targets the 64-bit D0 processor.

Use the bflb vendor prefix shared with Zephyr.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 Documentation/devicetree/bindings/riscv/bflb.yaml | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/bflb.yaml b/Documentation/devicetree/bindings/riscv/bflb.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a3c14fcc6c2e9fd6297cc2556c1525f4bf8e90c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/bflb.yaml
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/bflb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bouffalo Lab RISC-V boards
+
+maintainers:
+  - Kwanghoon Son <asdfkwang@gmail.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    items:
+      - const: sipeed,m1s-dock
+      - const: sipeed,m1s
+      - const: bflb,bl808
+
+additionalProperties: true

-- 
2.47.3

