Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250448;
	b=QmN2rWZCAr5vawBvBSKEfVyb8ZfJ2yZkCiWaTZIUy6sUtkJa/SVPldcWS3cSsT9A6izI
	 D2B/obW/cRHzZIlzhOF+tq20EolMH9Z+vjiKtqPASHIK1Is5QxtV1cco4HqtpRRvrAJeH
	 IxS+SJHTj7hO8dA3i2I1ndv52/srcsHZXgDvwAAYd54y2WuP0Hh18GFKamdApcwhztT+W
	 ayUqjRrv6X4CtTZ4ysW5SUliITWNrjopceDl96zlugC7PxtA0ZX2PhzIDO8+rZDrGYepz
	 RtllVuM97K2yHPVv8uEm7VUCkUT3QNtLrtk6t+OkJGCLdNGZz7wBl2SbBO7HJfZvmyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zQNT7IgbxAV25cmcgrqKQ0fkAq6sElRF1wG29F8EmV0=;
	b=nbxVsIbavji9PpELQSgYq1zgMExRchxwEW5xkURzeGB2f85LY7TNk1CmG7f8JRgLxNWf
	 IIsFL3K22GL1Xj+mH8X2y5NGU+xoEz6zz5mUDQSfRvO9blja1JUxlZ0mQUxROF2my7KNa
	 EA2ocLxftToMgMhWCA7asfqoR7492g73s4JNoipIPX1NYKyLbQ7kXiBi8u5PxtXFrTixS
	 2up9WSPnMLfBacXA4qf8E5tbNp00OMyNHdJTl1STACZR00fBsAtxZtdcr4ogLMrV9PX44
	 0TC4mHD1HY/0Vp7Pvt3sxZGjkHGqonbeWoWNfe8O6QLEDHASuDYvXY+HsfwdX1UI77A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzCXo7ur;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DA4606A31A
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 05:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19DA4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzCXo7ur
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e985106c0cso14958835ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 22:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250447; x=1793855247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQNT7IgbxAV25cmcgrqKQ0fkAq6sElRF1wG29F8EmV0=;
        b=bzCXo7urDa6UbYwZ1ZnzYmKQgEctapwj9XX3Bn8RdVeT7BZVAzczVg73uESuoQICT2
         AC1tRi1ifIsL/spuMAC9rXHH24zz9UzV0bhCXMj2znMtbses/nwzdcmtvOI5TAJHqUOy
         7+GNyz64WKsk8cLgTbITiFyuukodRlO0arxkZ+evUtBnU+2XGur4cTdovJh+wGvPDklX
         AhyBWENXiWs2bVx603vlVZKWr+Mxffheq7KzR76/2ypgD7WYRyvbta7WRUUbSSLsxg7o
         vvI7wl4OVrnLvJMoh9FEUupt8XF99EOQ4DASyrM0itQFZdOaOTZir1LGMOK4AAZiqgqc
         reSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250447; x=1793855247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQNT7IgbxAV25cmcgrqKQ0fkAq6sElRF1wG29F8EmV0=;
        b=hIfXZ+rsTaf+iuTkWyTBYMrsTkQMFI49IFGtS+YFOIDK054q3sFI5MUVQ798ZtBQsP
         kHHuanbYtgRWMkLcrH7Vb3izWv7gHeKexlSmMkd9vPfBKO0oCVoSxL0iNww6jw/ALPw1
         S9HAhcNLRVwyE+SHzhX1Jcvz99XPaySudFQTIewqqDjUvUqb7aBFRdO8KkpeRM2Cr6mF
         p5B4fETpgFEor3FS3zojEL8t3ADaBhp45OqNd5Hx4xUT549iW/q9NeOF+yDXwmjhhW9R
         D7/vYIDIHp8UCD7ENG7HhO6TKjcNROCncoW6Jt5+AzfixExtdh6nbU/vQ8BSlMO4eIew
         bqBA==
X-Forwarded-Encrypted: i=1; AKwUvBzBrMUnftXpt0dtCsUa2lYUP0noBu9kDLWO6EyYu/+dsduahU1MRJSNBtb/x03VYRbm+zXSFzwR1xPkmJHMcw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI1ZdjVUouxNn8rcqoQJ+oCTnH4+kwAkO+TqRPKXrhkAWzzWOwL
	a72vWFdQLvMo1wTnjMTR5I+JF2y+LVo0+74LAEQJnayGOS0Gn+N4p8/I
X-Gm-Gg: AYBFou3BitjgROhO4QlcLGIZP9qaFCCoEYQHoTFZfeBL6RpWNHXIYjxJY+awHx5WLWg
	yiG27+TrfIZ5rmj4Ii0V8Y++2Uylb4vUXz1t6KcUkCRPwkACxORcorrpPeQ2L7uAHwA+L0D17fu
	Z+YgrKeKiacBzAhWPqW6NNq3aDJNQjlzwXVjDOenZUa6djnQPOKWWCsEFCd7PAgIAl5/1xYWi41
	F3duUiiasiQGidF1F/QxJBinKYSGn0dF/3cH1/KHSrcW+CBdEq86RYj55ORtFeo7yVFqaIkv1iF
	T9UJql13oPSHS9lOhjygSe0uxsA//h2uaQNsY8u3bkiRd/S6omUsnFMAkf5WE2wn9yNmb1vvd+B
	PpT/J50cv0gpCH5hsNGnDByuEXBGFIaMWTOPTiRXtBWuUQIXD1Bl06D+amnF01dqf18Q6/7j7hB
	x+jrvbN2xV4Ehk46im3+xB0P93o3Kz3d6A1DbJf0h7kY1h7xhXvO/6Z+k2T5RTIOaHpVqdsN+FB
	wqtE0zNZ/oXckf2e/tLn9W2fZ9fyZ5cHYZCVeAl/rEvB1PgOMAS1szK7eGhnhHT2GR9o6b8OqW1
	T/urjK+oaIJ2EZoUsy58L2u1yLFH
X-Received: by 2002:a17:902:d485:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2eb004fc927mr39045165ad.27.1793250447442;
        Wed, 28 Oct 2026 22:07:27 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:07:27 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:52 -0400
Subject: [PATCH RFC 11/12] riscv: defconfig: Enable Bouffalo Lab SoCs
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
Message-Id: <20261029-rust-bl808-console-v1-11-b736ee920078@gmail.com>
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

Enable support for Bouffalo Lab SoCs in the default configuration and
build the BL808 device trees. The Rust UART driver remains an explicit
configuration choice.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511bb0760247f50d4b69b1e3a00527b..78a5580021d8cd654c33df931149a2224465285a 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -24,6 +24,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_ANDES=y
 CONFIG_ARCH_ANLOGIC=y
+CONFIG_ARCH_BOUFFALOLAB=y
 CONFIG_ARCH_ESWIN=y
 CONFIG_ARCH_MICROCHIP=y
 CONFIG_ARCH_SIFIVE=y

-- 
2.47.3

