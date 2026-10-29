Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250457;
	b=zI1sRZH7o6nKEUx+XU0c99SqmqgNH77By/JcBvofdDdLUO0Axc8pUiVuj+eDbOeQBOfq
	 RZMculR6aOY2l+53LeB4o2hhsevhqsTLYGMhJ93Pbylkf2FoO7GkNL2KUHnUBQcJfJ/yD
	 1Di4hvxJA22LTb40nTh8nRv84XrwpJR0Y3w+36baTeWFRS6/HP0rbktc/ZxI6RUAK5Tpi
	 4LHzhrhDRmsv4fG/RPzSXxm9vCphSeCP8P/7sywGJRJEeMqojtRf9JX1zLLCn5AYQTooY
	 O086BiQCxg3x8wk9HqVmpx358/mCXeAMbOpfbsMKgDJx1HQszwTsRqwBjyf/KOxxGgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kXI6IHEoyVt3a8/+pcNKwK7JZFFGDNWx/cQqbNDN63Q=;
	b=30AioDwgZ4rnTQcIRH84jPIAf1suJRxxN/i4hh5HwDAqtUXw3I1BBKt6iZkbM7ROmlbX
	 spma/r0AIt13tBAIYTUG3ZrdW7nL2d2RUfhnBBdPhtXHYfDadQ8jjdmUisUooZLyueFld
	 mmuQP3zbPTcTV6UExhfw1WeLsHwD998tmPxNt5H/I3tXy03/UAVCfBRpynYVXOFQWTtRV
	 p43XSHFAgKsZINR0U5kHI4yBPaaVKby2UX4l3JRk9HkIZPVWXyALhGU7MSo/XFAbn5Dzv
	 yZD8CvvGdCTFuuEcFQFbE0forkOxu81EJToAY2wv8zC+J8sCunW/+iO5ZGmSRhpUvkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3BbByNv;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A8C606A31C
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 05:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A8C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3BbByNv
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2e831901331so13447135ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 22:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250456; x=1793855256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXI6IHEoyVt3a8/+pcNKwK7JZFFGDNWx/cQqbNDN63Q=;
        b=m3BbByNvwVTB61CMHLiYJL8DEUQo3qdr97nQ+INggGQWNXYxuBhs6564SGou9mckbf
         8rMZ6mAEPe8pnfrrQDQvfoTRvLcbLdErwvhuvdZ6fHAj5OtYZaU22cn/PdKdnt6BbpNe
         XDodhGEIuY1dL6zQy5GTOyiA8zlLyZmN0KeofYJzI+GnLqLaPSJj//bcdLzSUsJGAw/L
         JKgR4xGuvprCIbFeUgmWsfX8a8oCH3GchhBPHoqA4aYG7FNiiJSxW7GmwR5+3Pm7SjHF
         eDWtTVoKG42ubA8r5DEbt80e813z+LbUxlbgs5y+DyZwQA/cV/40EsNXmladHSMSfkcx
         kXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250456; x=1793855256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXI6IHEoyVt3a8/+pcNKwK7JZFFGDNWx/cQqbNDN63Q=;
        b=zukc+JAZISbNe3gaBiQjnzTQN9p55mdBS5+nuGEmOoOfJDObe8BrnyTwkSBDmMY5FK
         VjtFCvENI98FutH5JphX/DfVy13vsVxfJzlluhxgu/h5jBBu9Uk+dQHhCvudIb17Nooe
         8NaWeD2o7Vn7e/HRQJgE5ODA4YQVeCVYYTLvVmbTWqT+OsK36imBSCc1Outl2E1nHgCB
         NAqAQWM1DbcEXIMr3pkQAHLYSeXDwoat0ghZjmq9kVcOUBkh6CZau/EnZgIDnNvVMz8/
         fNQ341yARCLEVaPGh4DKS+PQUK1grcpqB6elNiP714r6t8fZJsQr/2mKOaU8+eUGyk+g
         h3kw==
X-Forwarded-Encrypted: i=1; AKwUvByPtKdff4z58FmN2mQ0j+m2r+lbegXqq6ADPpGexdUVgpvOAFKmzRYqnegDH2mzj/k3ACj7aa70b3cJJIxN9w==@vger.kernel.org
X-Gm-Message-State: AFq9FYL/nHoBXDI6O2c9MWxEshL1SIW97+jUjcexBVrU4VhtYPeWpCPq
	oABBJPNy4/SLTG+uscHAGj5UdK2k4VfY5Lbd3v7ryruUblGSA5TgIefO
X-Gm-Gg: AYBFou1S/IRhtyZF0EjmzsP60PSjFX0aZHHqXETYA3d/8VpXccR1U8UlEosaQYgrqKY
	zMUW+HCLxRtdmx89QhxZ+QlnFUgoi2JkaSy0v151XJ/anhkIt4axcmvVlKVjuDkuGQe6DOXport
	WQGES35zS1Zv23VqowlzWyYwLxlYrQDGQAk5SREJ8v9syvkD2odSiUSl5CLnTZSTtMmMNLUJx7M
	aAj+CJjQTxKQq9CvqM0L3Ej1q4LaI2PTFbKc/P4F7SyHiRrsq2HuVxj4jym+YA3x0vRZgcmKDvd
	VBnr+cugj/dhwm4zpzcQuW8Cxv/TjjQ3LSD/ps9ZdZyKEZxD4zFvMcOOigYHNiLLQlELxQtUTYd
	aQAS44R0i4l9U5GCaDnCKier/8pACK9adJ+wsGdzXNGm8gdU2QlVPdbL+rNPWuZzGdHlzL0DxOb
	5w9UdL8F5RCDQu9McKve/MRTsyS9qcHMfG4+EtQx/InIi0NWdXh/Lb8a5oqfKKIbMvXMRHipefS
	FQWsC8B5NOxU/MwcE6+0rStUxufrpm/X4RKcB0QZvof3lf0Bd22uPtcnviLMBpk+Gaohj2upFXA
	yvT0dA95GYLaQ18CsCWk6QD4Fr0U
X-Received: by 2002:a17:903:38c4:b0:2dd:ad73:c93e with SMTP id d9443c01a7336-2eb005025a8mr38954575ad.31.1793250455691;
        Wed, 28 Oct 2026 22:07:35 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:07:35 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:53 -0400
Subject: [PATCH RFC 12/12] MAINTAINERS: Add Bouffalo Lab BL808 support
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
Message-Id: <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
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

Add a MAINTAINERS entry for the Bouffalo Lab BL808 platform, device trees
and Rust serial driver and abstractions.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 801f964899ba790a8f71fe61f9b3777a494dabd5..b76d3e168468bf6139c958a81b626c73b422c0d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4926,6 +4926,19 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/imu/bosch,bmi323.yaml
 F:	drivers/iio/imu/bmi323/
 
+BOUFFALO LAB BL808 SUPPORT
+M:	Kwanghoon Son <asdfkwang@gmail.com>
+L:	linux-riscv@lists.infradead.org
+L:	linux-serial@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/bflb.yaml
+F:	Documentation/devicetree/bindings/serial/bflb,uart.yaml
+F:	arch/riscv/boot/dts/bouffalolab/
+F:	drivers/tty/serial/bflb_uart.rs
+F:	rust/helpers/serial.c
+F:	rust/kernel/serial.rs
+F:	rust/kernel/serial/
+
 BPF JIT for ARC
 M:	Shahab Vahedi <list+bpf@vahedi.org>
 L:	bpf@vger.kernel.org

-- 
2.47.3

