Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821988;
	b=1TXkmfftXHyJapHQhfjdBVAe10+7lpyMXhI1qhFEq4EFrcRHbRRdtEEswwqrLgzfZQsh
	 3knRVRhDk8cO8xnrMAoXHpqVLtiE5V9tNkZ+kRNHClIVa47+KmDi68mlDKDVNs7S0HcbZ
	 XCkGKBSaeIsLDANAxzdX9NwaW1k8Ajx+mVYrN6+bnA23jf/p4Kq3gnyRr6jVsW77H4j0a
	 mtrvODKId6ejkh3Qsq90qTtREkZWvTuGGbR5CK8K4lOmxWsNyYxQMjfzSBQdQ5D1li8q8
	 H1pxS3m2dHauO9ZsRvmnQgXeZhOqy6/MDn3J1S6Kz+JDbuLqlK26UyrcrA7GrpuHesQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gMjeWv+UkvYo6nLDJ7Blb/ve8ZddA4qwyDrBgZSxLB4=;
	b=4RMCcpo41qJbl/xtItFXWMrr0mYJ10elwNKDMIJYC7uNixAkWHQepmA9Vk7Md7e0immO
	 70hB7vb5+7c5I2r0nKV/sGut1fD8CI5u+DRzlrZXkMzZD4OzPUjgZfgMjfmJR/lCa/J4Y
	 xPGIohM8JY/KbCh3l5supB8d7MdeD3MywGlz2PxdbkioqNLxVue7METMV6VPoyqAJOnk8
	 nNJ92fSKr9zZozIjXO6+zjU1xAjbYTwm4xeqmSZoZGBEnP7Tqiq3AZq0rdQS97vDulyxW
	 nc2IdFPGMxa7dI3gLitcdXsyyzB826n6WSTJdnDBExkRtgRJFzQACYN4R4gwY/I/YRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWFct+A+;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C2360DAFF7
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 19:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43C2360DAFF7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWFct+A+
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7bec5112765so680637137.1
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Nov 2026 11:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793821987; x=1794426787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gMjeWv+UkvYo6nLDJ7Blb/ve8ZddA4qwyDrBgZSxLB4=;
        b=cWFct+A+ENABxpltFW4OvhI2UHyMJ/SPh5Kz3Rmmp8mMhmCIakKCOzrc6AOAn5WOWZ
         dkoCi0ffd785/WBlo+c1R3WXHPjyZeeR0V2sLlmCfnZQuolJtot3WT5Up6UsBWvpJjLi
         QBHV19jOszQDfRXNEPwMMgi6CMFs1uJu/lJ+3Yb1ukXhqKdukk8PBnq7kyJtcyOHyEa7
         +fhRWjjwJOlNHK4jIUejARhd3n+l0i5fboUbqopKescAOkZBSJUAn4IMcVtIZtdEGbJu
         PhMPsly4rP3RzCcSUsO1+wYTjYufB5X4fWRIeWMcoLGJYMuy3gQPOF3l9ykAmT5Ig2tq
         KOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821987; x=1794426787;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMjeWv+UkvYo6nLDJ7Blb/ve8ZddA4qwyDrBgZSxLB4=;
        b=lzF/uCQfYtfdzhDNQfRL2w0Ej8a66B/YtCsbZ17i8eiOFR8ZmXeOLtrMJ/UEkBDd8X
         EV1S/wCcR+SlzbF53L7dWl2Acb97fiM33TJEXBSQpq004eQbTdRq+4s1QUV9X2CGBTsW
         BrqZeY1Xnjia8PhCDUwlFVXaN6BcYiB44lX3JATlMHfdlBajU/N1/EkIVbhOqbbj6l0d
         B/TsG8OGjsPVr5omqVmB3pqFriDiA+h5wZGKxz9y0X/3kX23yq2LXoM6Ku4s11VBFQxh
         rqjlMWTThJXCkXZe4fXuXU68Hya6MbW0+OJs4jXtu4zRNqFSxNFFcs1frw0qvP0k0UVD
         1T9w==
X-Forwarded-Encrypted: i=1; AKwUvBx5b6q6Vjof1sRIsV/C+wL8FYo5N5LRwuwAtMULm8xOEZ6d0OwNoZ5zvdqiD5xc6l1CtTPc61bLTiMHtQMjPg==@vger.kernel.org
X-Gm-Message-State: APuU4Z827CYE+Is7KlWw9n0eMyY3Pt0C6jsllkwpikYeJUPQ+1uAEAOu
	jjsgsykqqJG9CED+1YxcXLhgv1Rbmr2tWL2OxP1I9hHgicacwJukRlo=
X-Gm-Gg: AYBFou0OdbSpOR5Nr+Uj8Yp7JpkFpPfLuiEMNBLfhJ5BPds30h7RsbO/NN0hfrEbklN
	D75/3w+F+b8AVHlDieQMwRnOTOKE3wTVSKS4f/Gg3372MvluFhC1BEk2kcd5VOejtSFBKM3PVd9
	gVvR5XSzrwl1Fi0UxTuQkxjwAHiC2gYcYwVOqcYjO+tuyMDuI21q2XC9v8fFEtx7TP+JWu9zSZC
	bx3wd665/GeG51KlDhxrzFR23cwu6AuuvjjokwW6BPVOwXQsKyP7BmA0UF5pBx7F5RLVJym8P8c
	/CvzkZbkIFrn2V07GsMmGOTOECjUfRiG5KZd+vyDzJP9i9yI15+iK08U0OEZ7iaL8REYUF6E22p
	hjkhoVNMt4dv9hzNfklACB3xfoiHJ4vhY0shMNIdleXUvIzm2t5TdmXjt37LbggzFhBnoZg06vM
	1UgycjsRaVt9aTP4OnmjT/Mxx8P3lSZHDS5UCembC0cczPHww4jF97BlzSJO8gxhbc2ZSWHxkOe
	9f0kuMIyQuaC5jBTq9t80xsXhI+bLhF+55vfzRMwwbKfF0myDlxS6YdsTv/NN5eJmOIDZV7BvJj
	m0o1c09v2pILiylp82XeKdjou6S8sATPfQNy76l0C31fOLp1TbQKxEsX/QWJRgrvqKtAwG79y2l
	NJW1E
X-Received: by 2002:a67:e70e:0:b0:7b2:f3ff:6b34 with SMTP id ada2fe7eead31-7d07277c9e4mr7768916137.1.1793821987289;
        Wed, 04 Nov 2026 11:53:07 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fd3e101sm2387237137.3.2026.11.04.11.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:53:06 -0800 (PST)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Igor Korotin <igor.korotin@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 1/2] rust: pci: remove TryFrom<&Device> implementation for &pci::Device
Date: Wed,  4 Nov 2026 16:50:14 -0300
Message-ID: <e04f96f1fb2af818d64d2d6061eb6b6ae793b594.1793818280.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793818280.git.nico.antinori.7@gmail.com>
References: <cover.1793818280.git.nico.antinori.7@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the `TryFrom<&device::Device<Ctx>>` implementation for
`&Device<Ctx>` since it has no remaining users.

This removal also eliminates a pre-existing lifetime soundness issue:
the input and output reference lifetimes were independent, allowing the
conversion of a temporarily borrowed `device::Device` into `&'static
pci::Device` in safe Rust. Removing the device could leave a dangling
reference.

Fixes: 7edc491f6fca ("drm: nova: Use nova-core to read VRAM_BAR_SIZE parameter")
Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1264
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/helpers/pci.c |  5 -----
 rust/kernel/pci.rs | 21 ---------------------
 2 files changed, 26 deletions(-)

diff --git a/rust/helpers/pci.c b/rust/helpers/pci.c
index a8540f90b13c..3822b7f47c57 100644
--- a/rust/helpers/pci.c
+++ b/rust/helpers/pci.c
@@ -25,11 +25,6 @@ __rust_helper unsigned long rust_helper_pci_resource_flags(const struct pci_dev
 	return pci_resource_flags(pdev, bar);
 }

-__rust_helper bool rust_helper_dev_is_pci(const struct device *dev)
-{
-	return dev_is_pci(dev);
-}
-
 __rust_helper unsigned int rust_helper_pci_irq_type(struct pci_dev *pdev)
 {
 	return pci_irq_type(pdev);
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 769d01d23429..0e9455fd544d 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -6,7 +6,6 @@

 use crate::{
     bindings,
-    container_of,
     device,
     device_id::{
         RawDeviceId,
@@ -535,26 +534,6 @@ fn as_ref(&self) -> &device::Device<Ctx> {
     }
 }

-impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &Device<Ctx> {
-    type Error = kernel::error::Error;
-
-    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
-        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is a valid pointer to a
-        // `struct device`.
-        if !unsafe { bindings::dev_is_pci(dev.as_raw()) } {
-            return Err(EINVAL);
-        }
-
-        // SAFETY: We've just verified that the bus type of `dev` equals `bindings::pci_bus_type`,
-        // hence `dev` must be embedded in a valid `struct pci_dev` as guaranteed by the
-        // corresponding C code.
-        let pdev = unsafe { container_of!(dev.as_raw(), bindings::pci_dev, dev) };
-
-        // SAFETY: `pdev` is a valid pointer to a `struct pci_dev`.
-        Ok(unsafe { &*pdev.cast() })
-    }
-}
-
 // SAFETY: A `Device` is always reference-counted and can be released from any thread.
 unsafe impl Send for Device {}

--
2.47.3

