Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E57A214A84
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jul 2026 00:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785111403; cv=none; b=CIcCZuwsuPPl1UTbJ/zF3Oz52QEqynZfJB3XHMg+XjCY5QsIJ1/br/uB8bzo2FRDJ0zvBlPI2edtEK++OfWJ23uL8RLdrNkH/Ro1MIE4xNMKB9GM40EHWl82BhL62TwrYW8rjIP2ywC9alBDRFIkB0jAx4A9HKTPi43qyEAgwMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785111403; c=relaxed/simple;
	bh=YZfh4lOFhIfDRifl19Rkforp38T4P7E5soEAMEdMEPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RDa8LeVjMhKAZdGOaCQ6XXUrL0Jvd6VyVPgvnCt4QdShFyN9qtaVwY1WBtMlYSH353ZwESosQbf3BPrg3x/uXMDbnc4VWL1+/BlcwwBEy6FlaDLLDJ2yD0t9+QOFMa5eIJcCMj2qYlL/UOcacIJ5nX643mMnfRDzYH0rPYDiVoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMvS46Ue; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMvS46Ue"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b966dd74so13227245e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Jul 2026 17:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785111400; x=1785716200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mF95jYXUiLPtf4O2Fy8j4aIn774igpRbGR6wn7JFZYs=;
        b=gMvS46UeGyx1ZFUFDBVX5dmaai8vLS1woWwpW/yLBU+Wr0pNsuADr+Op1XW0cFzZss
         xewRmcTm1F9AoYI/6RlSDlQxI9JlKOx0W2pyTnXMvqOWr6tK5bBYYSxGl3xb3Ni6bgzA
         SAA2W9nD+On2sANURx1wpjLux0O5H6quON2Het1ADuPGFVpK87Ape5AORzXmJY/5KqHG
         ylcH4zaGIl7MwHh/NYwPjEqb+lurj/yL9Zo6lbed8t6uPn002+kLeCyg6sg7yCgaOVZy
         zvOI4RfyG1XhX7mcr3VJCBQaeNGc4RZjPZ5P+8jkXd6qHm5ov0D7IhdO4+cnxYo36ELv
         lTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785111400; x=1785716200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mF95jYXUiLPtf4O2Fy8j4aIn774igpRbGR6wn7JFZYs=;
        b=L7xxNPf96rwYiN/HBM3z+jb/rjZnBdFjzOCvrsqHeybHXa81l6ND2Vya4WZHm7JP1j
         HwHXbycn255oJ1DaVoX73h42q+x9HbRMGIwyuRXqYQDPtfqyVP5USXyfrZfqT+iN6Mxj
         kLAebCW6Tg8ej4dfDfiqvkIR+/QrOz23sn/7yHirzpNnV2J3Bkkb23ndi75nLFVRSzpd
         YulxCbG8aSXk/smj/k+yZ+DVQAHbwD1LKyLg8jGP9zRfBnd993H+oV3wtwaEaxR6mNEO
         wSavuROB3kxZbx0vgH9O6x79PqnHn0qqvotb5CY8MovFCDSbeHQpyhN7X/utshkpu8qe
         DMAg==
X-Forwarded-Encrypted: i=1; AHgh+Rpv4UEQKBinPDYAJBzxvFOfeEN8hk0XPR4upvE5+kf03b+dHO1MQzEe/cFXpTg+ggl4+QKjQF3t6UGpKNjt0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwePKI6CIMscX3mgolbgndGgr7MBAiuXm2I+FlFU4nct3jR/LP8
	SiCDyTEAc6LW+++IK5+RZZDsu7p9HMFUjF7m92G8sUNo2TKaXJF5sG9C
X-Gm-Gg: AR+sD11HYo6AF17lIniKLBAIjj3EhDb0nqYaQbnYPOW3IxgnTzkA5shWBjrp7rK/jVQ
	cu0leq90VfDSnpOSULUcPpJ+K3F2cospxMQSFA6UEUTXQGKckdMDLm9EvvFCTV2icmC57YntTJj
	eq++knkz2EO0A/BDmf21Z+Rvj2P0SEZ4POFNhAc+KEskshnMEvHNv5/vuvqvKQWQqnRpUAzJMLd
	AS47fSLB4Hcf+nEzyiMThhwwb1dZvq2AWjZ0tVGWfmNlkOaEDZXN52ixDX633qzKieltpxfQp9o
	YUoCML9hS7f/EeQG8kgO53iD8s+54GkT/1CY7LTv8OfcjwN8KtNYwtHTl76W7TiOKgRJlkrWTER
	wEUpJ4xCA0rORwvkRpQtz1mj9NI42n4+bbn5cWYX5kfSXZYud4QsRdouYmyhHQj3CaBsJvVRqla
	AzdE6x4gKrnqdZM+6Ioidz5KQTpS62yFQlQNCBYH9XRorwYR5ewRpdTgmJRLL44Yyyxw==
X-Received: by 2002:a05:600c:4ec8:b0:495:3f68:699b with SMTP id 5b1f17b1804b1-496b56f3705mr84130915e9.9.1785111400175;
        Sun, 26 Jul 2026 17:16:40 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b485f65csm176403555e9.5.2026.07.26.17.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:16:39 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ojeda@kernel.org,
	akpm@linux-foundation.org,
	jani.nikula@linux.intel.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	ljs@kernel.org,
	andrew.jones@linux.dev,
	masahiroy@kernel.org,
	corbet@lwn.net,
	qingfang.deng@linux.dev,
	demiobenour@gmail.com,
	ej@inai.de,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v4 5/5] MAINTAINERS: add entry for kconfirm
Date: Mon, 27 Jul 2026 01:16:23 +0100
Message-ID: <20260727001623.2794156-6-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727001623.2794156-1-julianbraha@gmail.com>
References: <20260727001623.2794156-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I will maintain all files introduced with kconfirm.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3c01eecfa2..c7066ccef6c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14041,6 +14041,13 @@ F:	Documentation/kbuild/kconfig*
 F:	scripts/Kconfig.include
 F:	scripts/kconfig/
 
+KCONFIRM AND KCONFIG BINDINGS [RUST]
+M:	Julian Braha <julianbraha@gmail.com>
+S:	Maintained
+F:	Documentation/dev-tools/kconfirm.rst
+F:	scripts/kconfig/kconfig.rs
+F:	scripts/kconfig/kconfirm/
+
 KCORE
 M:	Omar Sandoval <osandov@osandov.com>
 L:	linux-debuggers@vger.kernel.org
-- 
2.54.0

