Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9F91D86DC
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766749186; cv=none; b=HFBLVnYw72TFnWCMn1mz04hx7OHAh6Siaal3+2d2N5h873i6vG/eNUZDGd1i/TizEvv+Abw6expsBu33flll9gOyU9s15WTIZB+ChnHV/3VuYVS+ngo6xq/Y3rMlD0MTPgRTOdBbcfIFpKa1ptDdsHHOCDmB4S0CY6I3t9Cgxx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766749186; c=relaxed/simple;
	bh=ejONzTVU0FdmdyDekUr8YEFyQevob5Y9vbn53RBZ8Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GdteknZsDlqK4IP7SKsot82zDcITfZHpF56vG7fOv+kIkooeNi/n4tI8TAUfwod+culdCaRBgK6Hqv7Ny/CIKf1B5fx67GgOuy8ZNXoua1fiTvL1XKqICQDSOVl4KSngoNXVVlscKU3voZxZtqeU6uiOQzuAQm7QcJRZ0/IZkNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICeUjw+w; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICeUjw+w"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8888a444300so78319546d6.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 03:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766749184; x=1767353984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tmKT01VlgiVDtYWOF8z6L//YBXMRlOGnlMxAj6FU8N0=;
        b=ICeUjw+w5OHQskyKx9agrJ3n5nKEj0nAFhrkZVXcZWgyL48hqGQcm4pcvtWjlJThmq
         8zuT/rHWdvHzuWoWIU8aCFLuXDk8uWvBFwNLxGQH65VcT3dqlYJjhJVFmzTA0GwetecK
         lgWhjTlP1sU4nP7EFIuQ/OxkxBufyOyiwDe27F+nL9Oz7Zq7nyz2CaxdxQIw8MstYiDm
         euw1kx6Rl1lQc3oy9Be0mmJ3WcvSdY5ZpRDGdlelsRzRInQAV3XN3z4q3lYVw5qs1ftE
         mZTW3AwglQ1VP3UBVzffCde64Q6GdiGX9qTbeSJJKsUUVfneSfZvaUhHCHRAiISaVDFk
         aIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766749184; x=1767353984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tmKT01VlgiVDtYWOF8z6L//YBXMRlOGnlMxAj6FU8N0=;
        b=vkkwzuGksNGTaPstmxKQUk9COUK11BPblNLjAsFRIaAztQ8Zp361a2SrlGxcis2CGz
         JBQmLd6tAcc08vXwf/QOCkJHVuK15xPlNjHrSCgvtAN8w2iZ3xxrUFZP8um66wbjI89q
         nGdzkRTB1onExpkZReysEfZJwykI4EixwauYJ8MSMzD2MCpcAoXtNPb1JV7ZWP1YnpHF
         pETmGoqdWjG1cdeoOeI13ZbP8ilEUdlZ52D3NGnl1pYlmMDMB0Br05h41oQiYX3c91z2
         1yQtmxpE1sSvXbSG5SXQRDW6kmwp13cGHlAhwYT016HO1MTyDxXLByzOnon6AmiyB9FJ
         /XXw==
X-Forwarded-Encrypted: i=1; AJvYcCXyWF/gSoye0ge3Xd4aj1MkpIvVQZ2qA+9JraVOzGb8SQBfWFXcMLtA0S562tMJ20/dJw1GMUldjIT1aP2ZPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlAELrcEzlWbYce+Fh7qEcgIMUwzQ9OO6lcZTptduegJpjxf8R
	8mJCL5dTiKTQyyPUjG+Shur+uONUczS/bGOTuvZLMJdTvaKSayP+ISGQ
X-Gm-Gg: AY/fxX5Nb1DEGTDDiPtaEJHWWSuJCc1WTfyR91CsKp7GOx9YDvekSj1SZNU8LKBqUcn
	PRbddWwzOmIO9jCX3b5rLtnS7/06lMoal9bG/xrWEvTdunZQNFqvGJCvqSjs7iE8ZUnEt/Q+0jl
	yAyj9qoTnW5OcS8/qwXJ6qBYIHG/b5u6l8cIZhyWxxOmLWiraUQdodPZ3O5EadsPmJRKTRepomT
	moKO4t+SsDzLpLuBpofNttCFjCqhzFpgttAgJdOn1cbiMspC+SOH/yOTe0evjxqyp+ue6QSVgyX
	nId3ngk69FLz5wnPG2NswcniMdhCyCDh4z1PmaadczsnylsJR3NOm21f1jo5eFfaGd+3kejwdRS
	SjFbXPH15i+TsmJzJ1xFp9/fPUyga+p3PU+BTYw0d4M4ykjGmF+57XMpAwf3N9FE4TBbJGx3k17
	H32iG76KF5Es/H60atuGJNTvT8EePuYGBRPDtZZwFSDk0qzV9Fp46VjyeT8tkGx2eb5FAhLejWU
	tVLL7Y+bldA4ro=
X-Google-Smtp-Source: AGHT+IGV8BHHtX/GVo7I0/97UaUQUtAkvaXwseFZpyG4xX7ayE5yjIfCJ/90vxAgzY9uXJbR9su+2A==
X-Received: by 2002:a05:6214:248b:b0:70f:a4b0:1eb8 with SMTP id 6a1803df08f44-88d8203f029mr371419736d6.13.1766749184014;
        Fri, 26 Dec 2025 03:39:44 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d96bec1d3sm165930696d6.17.2025.12.26.03.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 03:39:43 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id DB8BDF40068;
	Fri, 26 Dec 2025 06:39:42 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 26 Dec 2025 06:39:42 -0500
X-ME-Sender: <xms:_nNOaZz7d5PDPwIEHoTgeLWMoK0trC6INblxeKYyn0mb84Dhg8q4IA>
    <xme:_nNOaeIgxk7dv9vjr8-6y4IEoF1dMRTkkWrTvz2H4jJrrLyWp7KZ0DXoCbQ0GsLNp
    HxxSFWjV0q1FTBTttD9YJeKienGATafTF04wtjr2aZrGUihJhbWcA>
X-ME-Received: <xmr:_nNOab5UiwuM6njQyvoJmfrMZ6X3P47J4zHQX1EYHlCsu5nbGZwzsyjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeikeefjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfhvghn
    ghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnh
    epgeegueekgefhvedukedtveejhefhkeffveeufeduiedvleetledtkeehjefgieevnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshho
    nhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngh
    eppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvddt
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtghomhdprhgtphhtthho
    pehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnrdhfvghngh
    esghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdp
    rhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtph
    htthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgu
    sghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgoh
    hoghhlvgdrtghomh
X-ME-Proxy: <xmx:_nNOacwXode_EDdi-iJ4R4d3HemtSSIBt3_7C4tiZqfE2_Vzc5sFIg>
    <xmx:_nNOad9QHGw-4GCVx7menAHWVyWa_upulO2RWYd9m7AWDl4L3fH8Ww>
    <xmx:_nNOaQGzvbsYU46FMowqg0-rE1kbngIdm52hyUtT5heCLhVXj4yYVA>
    <xmx:_nNOaXDW77woyuMzmWjbQOb2dwGkexT6SqPF0SY2ZaYkTqWujGMYLA>
    <xmx:_nNOaUmEYnwCrT1xfj2QtgmcPSQ1CWghtvtvWxbyVCsULNFOUf1-a9PU>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Dec 2025 06:39:42 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Dirk Behme <dirk.behme@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Liang Jie <liangjie@lixiang.com>,
	Drew Fustini <fustini@kernel.org>,
	David Gow <davidgow@google.com>
Subject: [PATCH v2] PCI: Provide pci_free_irq_vectors() for CONFIG_PCI=n
Date: Fri, 26 Dec 2025 19:39:38 +0800
Message-ID: <20251226113938.52145-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 473b9f331718 ("rust: pci: fix build failure when CONFIG_PCI_MSI
is disabled") fixed a build error by providing rust helpers when
CONFIG_PCI_MSI=n. However the rust helpers rely on the
pci_alloc_irq_vectors() function is defined, which is not true when
CONFIG_PCI=n. There are multiple ways to fix this, e.g. a possible fix
could be just remove the calling of pci_alloc_irq_vectors() since it's
empty when CONFIG_PCI_MSI=n anyway. However, since PCI irq APIs, such as
pci_alloc_irq_vectors(), are already defined even when CONFIG_PCI=n, the
more reasonable fix is to define pci_alloc_irq_vectors() when
CONFIG_PCI=n and this aligns with the situations of other primitives as
well.

Reported-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Closes: https://lore.kernel.org/rust-for-linux/20251209014312.575940-1-fujita.tomonori@gmail.com/
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512220740.4Kexm4dW-lkp@intel.com/
Reported-by: Liang Jie <liangjie@lixiang.com>
Closes: https://lore.kernel.org/rust-for-linux/20251222034415.1384223-1-buaajxlj@163.com/
Fixes: 473b9f331718 ("rust: pci: fix build failure when CONFIG_PCI_MSI is disabled")
Reviewed-by: Drew Fustini <fustini@kernel.org>
Reviewed-by: David Gow <davidgow@google.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
v1 --> v2:

* Add Reported-by from FUJITA Tomonori, kernel test robot and Liang Jie.
* Add Reviewed-by tags.

Thanks!

Liang Jie, I added you as Reported-by because of [1], if you prefer not
to have that tag, feel free to let me know, thanks!

[1]: https://lore.kernel.org/rust-for-linux/20251222034415.1384223-1-buaajxlj@163.com/

 include/linux/pci.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 864775651c6f..b5cc0c2b9906 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2210,6 +2210,10 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
 {
 	return -ENOSPC;
 }
+
+static inline void pci_free_irq_vectors(struct pci_dev *dev)
+{
+}
 #endif /* CONFIG_PCI */
 
 /* Include architecture-dependent settings and functions */
-- 
2.51.0

