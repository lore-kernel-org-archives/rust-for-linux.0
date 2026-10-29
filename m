Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250363;
	b=5VtIADnnSvUHQzqjkv3Ju9OLmCsrQbP+II1WdR0JVXWGR80R56iWB2TlEVrTIm+NO1O/
	 ez/tvAfB8fQ0Te4PptAeQe4AW4JdVx6+8EFqxvp73OG4PtVBzBg6U5iUTGoxwlmZNy0JI
	 BfQTXIeT4lnQDkAjWtntfnyBC8tk5ee84/QsF/hCOABoV7Y5hZ1AwPHxhclpXIpvRumY9
	 nXfetV+htC+LSl1gvsOYkDWgnYmFCj4ZnxFnAQqkKwbqoTDf9KydbnyrkrO06wCKprcTk
	 j74HpkWKFyixSTWJJche0zPw+sTQZIwgjjxmx40GifDX1BIAU5C8dT4k0ks3Ee6R6EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=D8F/HdGuSu6Gc0aayMmmYPmWYbhMQ7jikJBXSJ8mNwQ=;
	b=TVbDzYegrQksGnpUziMbPLDVdXl7hhVY+KBXZQEOvvO6xb1Amvlwr97bjWMgXaNoUxvA
	 KTUE+dcf5z+n0kvjkj7zC1462z6eYNqtp9tOwRz3zC+6BHb98fc6b4xPLRkjtkbSoqp+b
	 FmgD4ay6AGLV7T+45GmWX9FIzADwNC6I2lOpKxn13nnnZhec1IRb1zQT83eCDkcsoPFmS
	 BscWfkE2n9J5vjBsh6NaFp6yvspPkoSKobvP2Yf/hJZv6q9VVCkIkFST8zOw+8hu3e9dB
	 +w4/Iqnt96D7rf6VJkZpcELMGNYjEesSR5cvpVIRw9z3Y5Zfs5buGS/s8TgNo8TO17w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gl8ey3GB;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A68C606A31C
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 05:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A68C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gl8ey3GB
Received: by mail-pj2-f6.google.com with SMTP id d9443c01a7336-2e987949882so12404375ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 22:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250362; x=1793855162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8F/HdGuSu6Gc0aayMmmYPmWYbhMQ7jikJBXSJ8mNwQ=;
        b=Gl8ey3GBmfht7cSiQpmGNQR7xbwxpuuCKBlHrmofBx3tYVS09O2r0+HnIp4+gY7eQb
         wVQTGz8djp2TKsDRr7wy8f938wlJDT0gNIDUcgLF0g7YkAixOl1Y0bJJhi82SYVnn8/M
         TsTd34RjtjMt8hACDdnaHMbxL8GCwep6ZN5HmMiMPTXMqKj/HMx6BDQ9NvDp6qcuiFZ1
         kS3Zd1977XVul4kACm4u0F0kGNRhBP+YsnyhWmWDNlEyhNLn4phCpAWx/hn+7Qxta/6x
         uNMlNzL5Ppj1aNieFMykIoMPwGCx1qS2CNO5TldnIcnGVEWizAOyryoFETmlD+L20m9o
         SYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250362; x=1793855162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8F/HdGuSu6Gc0aayMmmYPmWYbhMQ7jikJBXSJ8mNwQ=;
        b=T7QWao14RkkQ/7qJHZy9y4pzgc5kugCK74tvUUU1f752AIZVJq29IIKDtjXuoehHyG
         Gm+V/5jpT2pYFVoOTcYWJs5XzIHyZTw6/5vIIziWU7it+yBt7YJfxKToocZtteyQWnbR
         PEl1n2l/zcXRhMJCsX1ai6MgE5f8eNclHYUn6NaBEMF75h1H8/uDVjBa2psp5FiRotT2
         oW837rPnQn2XA++WQMXwyja3M2jL3glvHsEsbsH0kY4LcfwTLMarg2uuGgcYx0dhpNsu
         KIhYncWUNzKC6KDxXjcK4sX9rSGXjP+SDS+NrhY2Pogkdv56tkBJAqY/YAoodMhTZOO+
         tOyQ==
X-Forwarded-Encrypted: i=1; AKwUvByOk608a8mCvRjg6gb2Xr/J+pJfJtSfdHa+HuYyj6PQaBht/OjO0zzl1k+36Emt0KxByS9n3y8rT3/Fy/uSwQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLaMYtbHVuZVlTSslx0JNz5y2Zyk40Drb+bs9ll9pV/CfgE0TT5
	+W/Nw6jrAneQO2yjLk2kK22BXrH6K6xlNrq2GEh7vQMJOR96/1d4JvpD
X-Gm-Gg: AYBFou0ik0tPDuBrj8CVbj3jXGNX1j7FmeMFYuYg/UikYfTmi2UpICqLYk7c8CluyBV
	RosOi0OWMT/sNEoc6oZTT5Qak0ssqC8CNWq20A33EGnvUq4TLQQWaoOyNFD7/2fla9iPt6I1Uua
	MlGWrNPcKdH+IT56/pAoE/TTDP7yQF/A8xDhZALKh1ALJZV10aIGESu2+PB9uUAB7KiYTs2Dms3
	0G+gjQv9tjwSMIBS8iICR8CGsqDpRp6c5S0gTB1RzaBroq/5sj3Y65XjAjVrEiThfSn+ybHFKyj
	IKer0ksCcS8m1dCeSJL/mecoGsJwfvJArUTUrXTkaBDXYKRUc/yS3mh8/cn6Elzkv+/NiS3bB1o
	Fbb87pji6eueeqGKXO/B5dScgsaxh6BTcibqNfBmJD9Fb8KdkRoy2M2OwbG6KFVwhJK+eRGjCr7
	A4NHN+TiNyVeYNTDdoCxgZqfmD94BaNhiLFLa55YeSaKJyqF1n1MSAevCTM/z8c9y1qzKzXV/B6
	FBfOJmMhsbHszeNyDdBDdvkCuuME33WmayZDcEebEKMRYmG4E4IO17lNspjlPE0BWrbGFOfjHI2
	HKI4FlD207uqY//BuOwqIj/Gubpz
X-Received: by 2002:a17:902:e88d:b0:2e9:5714:6081 with SMTP id d9443c01a7336-2eaffcc020bmr39772385ad.0.1793250362514;
        Wed, 28 Oct 2026 22:06:02 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:02 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:42 -0400
Subject: [PATCH RFC 01/12] dt-bindings: vendor-prefixes: Add Bouffalo Lab
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
Message-Id: <20261029-rust-bl808-console-v1-1-b736ee920078@gmail.com>
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

Register bflb for Bouffalo Lab Technology (Nanjing) Co., Ltd. Reuse the
prefix already deployed by Zephyr, including its bflb,uart binding.

Link: https://docs.zephyrproject.org/latest/build/dts/api/bindings/serial/bflb,uart.html

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1012f08e26f7f105ad846ab3629ac..24c670ff75b6f482ede1bda3b59c70ed9116042f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -249,6 +249,8 @@ patternProperties:
     description: Shanghai Belling Co., Ltd.
   "^bestar,.*":
     description: Shenzhen Bestar Electronic Technology Co., Ltd.
+  "^bflb,.*":
+    description: Bouffalo Lab Technology (Nanjing) Co., Ltd.
   "^bhf,.*":
     description: Beckhoff Automation GmbH & Co. KG
   "^bigtreetech,.*":

-- 
2.47.3

