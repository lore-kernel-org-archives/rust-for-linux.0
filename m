Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EB622126C
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 02:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765767294; cv=none; b=pgCsyEV80kTrFVDpOsu0WsIVCeVvHv5HFATq7dLlG4wkxizgZvrsmfu3uedWKP9LDerhOyq7TgeJevemBEZELGZB69D0c8I4YpfiuP7V6Hgr+l/9O4f5gnlBRfmZj9PQbxy2uibbkDpxORpV6xDSpiBr0Hsd5PRMNrSJDeiIkHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765767294; c=relaxed/simple;
	bh=OZpQGwLdHBh8hnjQRhC78YEbdmHP4sP/KDISZGBHfLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KrdXq4AD+8nD9vuCCVOOjR7WTwuIUQDanvFutsohL6DECQHe1vywNYKnTn7vI4UgjNcA8WQkpVX5HqiaoaKVCIaaJqCIEugryxkEJAFuVmFoYfAi97wTd4g2w6ORwCHglBTC1OeX5qOKtRXR9tpFrxLcxpMnE3DrhYS/ZmvttKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjGLRyi9; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjGLRyi9"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b5c81bd953so328495785a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 14 Dec 2025 18:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765767291; x=1766372091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B67shbMqTgY6v/9Tv+VflehYM/ScLwG61ilBqh+emag=;
        b=UjGLRyi9xPKXSTKzlhUw0Mp9fcnFDxu0/f2pvIoDlU7f9T7WmG0/9jiN3r1KshQ4Or
         kWDRXzh1gs1oTZ3yQM6EW5iVRx4Lo3EvEK54EMxo8EC3PExCErSNuLAjYAW8SgBXzirr
         +IGTOzy/xmiJSG0+NXEVbXYk2p+4kt6cc+INVpYVk5bnX2r9GnMCUJn36vW7VhXMb49d
         NgiWr0VEEUeVx+aybrKSg+zHtAqnrq1CCBXshZrA5sd8NI1oXrCeZPa+7h21U46XestR
         1bgn8CxJggOO0raVtRTBJy03IarNgc5ZwiGmn/oA1pJ3Y38hTCngOi5pWSEi0FSJH9Hi
         Uu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765767291; x=1766372091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B67shbMqTgY6v/9Tv+VflehYM/ScLwG61ilBqh+emag=;
        b=eYj3BD8FsOihFHgTtDurBf700iCaP3rpsLu5QuJifaReeNIIBB0z0EJn71gA+RYAT0
         Et8ehL+M48BRdDYuWOfdJr/M/n8+EpVBXHqp0IUTTgqqmZidRj9fsDuLCtRgkWwHLkSn
         eJSK7JmGUotUe0FvA51Gbg19a4qBif+3g0OmlSEAKR1A4Gbk1A7KUY3OLZY5uPZIeKVg
         mj4twFNmCb3SKwa8l/hJRG1p795n0L1P03LzKzg9eAEEAU+rs6NV8HKBakaJOe9EM6WI
         0cGyls6JU1W4v5GgZ71wMKi17YscKJ1QSRgZYEcjnBFrAejOzzqNF91eptfjbNby5g+Z
         ouAg==
X-Forwarded-Encrypted: i=1; AJvYcCUBtuRSGtOrsBhyOeeikD+HtOetArfLcyspx1dir80X8nK8Ncb+zWtE1hBIK0c5bVYvmh0olB2aTZgtuMzSAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsfByU1GYakeeZBuJISSrdDe7LqmEFoj3etpNgUea5nJZwcbFW
	PNmAQfN4M1MneXbExXzDEpApsud0VglwCyp1uwbTrj9b9Md8f0xlJK12
X-Gm-Gg: AY/fxX7yEA1dpGJpIiveOemjEFHVtdiEE1J9/0r2rVl27UgFcOFZQ/CXVwtgKi02WNJ
	w6hNDq6qeAs1KOlBRWSQQ4flPpOeipkwqDmdQwqU/whXm2OfpnsTENgL0VUZIg5GL9gqbrRX2ic
	ZLcSM/atrmLjvhX7L1Fn9pGxmASAYk9C4xDyZViRdsi9/mVCzqUqD8haLhtSjTGJh3rcf7rz9nv
	MZua8HFkEB9jcj4beaZI7FEiPanUoLrMRZtluVI7GxjKBVXM/xBdw+6mJPOkGNrMa1JUsyB+k6D
	On9p3Sr7eoQJZi/M45DHWAXlSBuWHRBLP0KRzxyrN1oR61+/pcMQ9pameSRdAu07HojLtE8mo3d
	cqc0VZTdELOI47ZmcDiowerc+8Ysqb48PAc41mW0AxyeSmt1g3BrKCnxdEbNsob7vIGGaPdVugi
	MYqapVnjBEuqPvzLtZqVuFKHGVRa1J3QaaGArVVUyoY6i2Evz1COy6trIfFr/3r/+S6UbYErmeC
	gACLP2d8AMUHR8=
X-Google-Smtp-Source: AGHT+IEPrm3mJhjKN7UoHK/lnHsODtrzDz/crX3wXXtREUTn/MrMsUyJFJGuzZS4JmvRaUEjLfaVMQ==
X-Received: by 2002:a05:620a:4714:b0:8b1:728f:952e with SMTP id af79cd13be357-8bb398e2713mr1555240985a.31.1765767291178;
        Sun, 14 Dec 2025 18:54:51 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8899f5bbba8sm42165636d6.34.2025.12.14.18.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 18:54:50 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2F50FF40078;
	Sun, 14 Dec 2025 21:54:50 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 14 Dec 2025 21:54:50 -0500
X-ME-Sender: <xms:eng_aSmXzBT_NADsWwQWSgGwCOI-z91XOCEKuGYvqBecYboAoPRUDQ>
    <xme:eng_aZZx1TAEdj1MilEwuIy-cIA41HCQ_nMm0uriRF2VLhFkK3I_Bt1J90Xa8ssho
    Z1Cu0pln6kz9h_SwBnHtdiXaCC_aCzs2JwLSVw0NCnto8WWT6Kj9w>
X-ME-Received: <xmr:eng_aU-0sTvDVqpgBAyiHRsC7qhEwa47lEohptk7dGx-egORVxpl0NNTCEL6xhK8DrF3790dbkzQiOgvP5uEEu8AeNTZil5k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefheeiiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfhvghn
    ghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnh
    epgfetfffhheejgedtudeiffduteefhefggedujeduhfeifefgiefgveeuudeludffnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunh
    domhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeej
    keehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnh
    grmhgvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegshhgvlhhgrggrshesgh
    hoohhglhgvrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepgh
    grrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhr
    ohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:eng_aZE_XQ4XyLTW_HUou0u05B4opkjLlWT5nmXEiro7HOBMzyVKbw>
    <xmx:eng_aefnN38NOqcvL5fH6l0kFiEa4YWPtQPxfJX0vvMCArYzZnUk1A>
    <xmx:eng_aSlcUAcyob2KspsUznr5cqNkZqHt1D4TFRUqM7hn3jTFsJXArw>
    <xmx:eng_aVqzloAl3vZ5bi14gtSMyllrNVrbNmFaGZ1OY7moCP9cZr2ZQg>
    <xmx:eng_aXFdrKOU2Rn5h2I6dD0OLTx1RXnszPzHI7EPT91wsqXzFVVwUis3>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Dec 2025 21:54:49 -0500 (EST)
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
	rust-for-linux@vger.kernel.org
Subject: [PATCH] PCI: Provide pci_free_irq_vectors() for CONFIG_PCI=n
Date: Mon, 15 Dec 2025 11:54:44 +0900
Message-ID: <20251215025444.65544-1-boqun.feng@gmail.com>
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

Fixes: 473b9f331718 ("rust: pci: fix build failure when CONFIG_PCI_MSI is disabled")
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
I hit a build error without this:

../rust/helpers/pci.c:36:2: error: call to undeclared function 'pci_free_irq_vectors'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   36 |         pci_free_irq_vectors(dev);
      |         ^
../rust/helpers/pci.c:36:2: note: did you mean 'pci_alloc_irq_vectors'?
../include/linux/pci.h:2208:1: note: 'pci_alloc_irq_vectors' declared here
 2208 | pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
      | ^
1 error generated.

when ./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch arm64 --kconfig_add CONFIG_RUST=y  rust_doctests_kernel

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

