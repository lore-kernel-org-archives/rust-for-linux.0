Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250432;
	b=AN8wYbCKqN0DDpjL00ks1ekRbK8n3QGydUkZ2RlP+8XRWEd69IQEOeeJe+/zGOj5hBqp
	 8qf+N8JwbPXJj6L/3kMtp13No51l13mOTI6ZpK6/CExBBZQueTpqGaF0PlQaOEyUTiekF
	 EMYFbKDT73E8Izi5FqbgP3dmIQopPzs7RI2VHe6pr+0zvZy6sb/fUyElWAz45KS9haZ+y
	 rlrEupjg/CzpAIjSCwiE35fqmdoM2V89hAzU3zn/kdbIlHTzEHLG3QgiHbGBbj7jQA0uq
	 nDNP/CIbrUUkBP41JNlFK5RYAyS2vp60AJTX1/fi/pKTpeF6m6Ap3C9i2Fmjt564Spg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rjNfMp/WtzafGcb6uGtU9HJkhzqRTyKQwukVNkTGdko=;
	b=hr16AJb+FLslAEydFBvmhxYoAFJ7Q1hUgMhN+p7kTSyOHQfZ5G4QK+B0JA+PhVUG1mne
	 cAeC7lopSD0L1u/rlv+VQsW/RDEUTtKfXIMpyoWAAsDJnswwst1xE8XnWT2Or6df50K0I
	 oMPI7fjbcNoM0bG9460MNAuAbWqUpacrgOUehjxqA7bxLnDaCNgO6j+BSg+2oQsC2xlCE
	 rihAnM75o0agIiDBk9kPZHAbNoBNCjO+JQFpg09ng4O/Qktu2QdsNGa1BUTchOf+jsHLZ
	 2Yxm/BuX2P6yh3AcyjGN5pzaqmhgDFG4/PwK06U3n9aTnry6bi50Eis3orHKLMtLKdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gxXBWzOI;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46326606A31D
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 05:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46326606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gxXBWzOI
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9cf928dc9so1626665ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 22:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250431; x=1793855231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjNfMp/WtzafGcb6uGtU9HJkhzqRTyKQwukVNkTGdko=;
        b=gxXBWzOIzzYbbu6ef6LGYmLO8fWD6f0eljqy64TeJkzZMhV0XUHIcnw9LU4bReY77a
         naHCdoXxYHI4UkY49em4x42TiVquywCZf3why4XjZ9wmk3fkxQ0BQJoFBznNDeuQivh+
         g5V6u5REf8JcdbMq4jiXBNa1vOFFVpdzX/SRPF1GpdD2iQFsDXpdc96DPh77RJdl+Fvu
         7f+acoURMStFLIeC0rnxbsQq32wMFfFekoojVjAPRDV1SGiYdrto7tiBORSbnisc954A
         4dLySoYXUWBh3yV4B7TXljbtbC4/s8NlPS4c5j0j4/AofIkRLy+J7axNwsC8bSudtHiB
         TBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250431; x=1793855231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rjNfMp/WtzafGcb6uGtU9HJkhzqRTyKQwukVNkTGdko=;
        b=SE9SkEPm8h0sM3dy1CRhQEkd67r/L2y1+sWxAHCR1uyPXqvU+8enIub1/Z/8l/o1UJ
         LUvFkeRb5ZPYhRNDpokNDDnGwFgINNcAqbE9As5lQp10W1PVY/U94OfIV4+qlBLujCBd
         R2Zs9CVD0CLcDr27yRk5iQ0ajPNfaUVSBni/2qisTRPCSDWScnvH8LjpbMx+S+S2UO8v
         69KWCcd08OUYwjajQoK5lNCjGeZZHTFHd0IXZf+sVvnpITF9jq/5/P7qgII8qoYJvXeL
         Vr1GVhuh3uCMLWmtG31C9y4iSXgtzEDE8Yi2IqcF0FprL6nV433D2RCTUw8OkTGubkF9
         IJTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgrSoJnQuSQiW+zn8KYE8Pq79laxnciFhvr+IZX43MqmUBSb4H4Oy5+248hJIYjKbZbC8ARjHB+HQyGe54fg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI9ZCyY1ZHJpfaD3ZBnbT/hZ+QizKUbmFmt2D5oayZclOADEIzb
	1vtLRp9NKKAZ3L6Dj9EhVEiAVB1421lIXsQq5Rlr6W0XC0BTh1UPH/3V
X-Gm-Gg: AYBFou3X0HfgIavr8FD6s+h4uD83SE0+2sYf3EDtnxvUl8yNuauRJoEE4ZWH2b7Kdej
	QXsE9n/LnfeU7nImYAtg22TJ6T7tqSelmm28Kb1HaJH3J9cz1zFH5VteIUcXiGiz2Ja6obwKRI3
	6byymFwsXDiwxfvDTf8Q0TC967axQjd88zKe59kb1Lqukow7HU8ZubhkhjYyY78vQfllR8BLsAt
	ytcSSRl8xzZxCwyXgRIuxV7PFqK5icEkZ0KXYftwLr4EFI5jTdGiPLyxVs8SlmUCcb+cRPvQNyW
	yIoSiFZcVEjLzEYfEGWvqgOtif6FSitjuXOA+cOgZmz4Vg7SY1E6vZJwlAspHBTgBtAIwuqnuf4
	JYjXOThlVxTyWoCUjgCWKlIcI3cm1nzUS+qHug/Cs53Bqr6EXGRc/C+Xc3K1wmFtz4C8HRpOo+s
	8eBXtlp0c2McbfDFInisUAE6VGopLwm74EgttuPJvnYeH/PYCcDWsL52AKJVoKrUt6skgoi8SX2
	BjamzuGKiBAKrG2DCrRpR4qT2K/LmcdeD3gQTUA+IdV5a+BdI4CEfcsfoIHaMs8fGrnnU/NauoA
	GOPXOBti8cysDHK7nfO6VkvahXl5
X-Received: by 2002:a17:903:11d1:b0:2e6:f3ed:a551 with SMTP id d9443c01a7336-2eb1aab257bmr10272905ad.8.1793250431325;
        Wed, 28 Oct 2026 22:07:11 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:07:10 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:50 -0400
Subject: [PATCH RFC 09/12] riscv: dts: bouffalolab: Add BL808 SoC
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
Message-Id: <20261029-rust-bl808-console-v1-9-b736ee920078@gmail.com>
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

Add the BL808 D0 CPU, PLIC, CLINT and UART3. Leave UART3 disabled for
boards to enable. UART3 connects directly to PLIC source 20; firmware
sets up UART clocks and pins.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 arch/riscv/boot/dts/bouffalolab/bl808.dtsi | 70 ++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/riscv/boot/dts/bouffalolab/bl808.dtsi b/arch/riscv/boot/dts/bouffalolab/bl808.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..c739c77960c4578b87fcf2bc096ef7c8cda089bd
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/bl808.dtsi
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "bflb,bl808";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "thead,c906", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "zicsr", "zifencei", "zicntr", "zihpm";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+	};
+
+	xtal: clock-xtal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		interrupt-parent = <&plic>;
+		dma-noncoherent;
+
+		uart3: serial@30002000 {
+			compatible = "bflb,uart";
+			reg = <0x30002000 0x1000>;
+			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&xtal>;
+			clock-names = "baud";
+			status = "disabled";
+		};
+
+		plic: interrupt-controller@e0000000 {
+			compatible = "bflb,bl808-plic", "thead,c900-plic";
+			reg = <0xe0000000 0x04000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <82>;
+		};
+
+		timer@e4000000 {
+			compatible = "bflb,bl808-clint", "thead,c900-clint";
+			reg = <0xe4000000 0xc000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
+	};
+};

-- 
2.47.3

