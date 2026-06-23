Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E1C3A3E73
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 04:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782190553; cv=none; b=rHgtFvHXKJyXl1hsLPxHMJy38Uwlcq3aL4dHRH/H8ERhJwpxv8KX1DEXbQihEfX4eSmzeXoP7bPkt8brS8Zh3JgPkynjjcJkGP8je7lvr8NuRF/+w8/UAfmHjsq+d71404C7neWRFH8mh8SE1Re3cg5duRepHPIyV7NiuqSoeXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782190553; c=relaxed/simple;
	bh=dOOuhz0gbslsD4ST8T90RiWeq/7Jv/QR4cCMBYVI1hY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=smRcS7DpX/7LeIMvn0QgDAC6I7Ui4zn3opljJZknNwB1wMJSGMFiTUWZrPZ6duTieGwoo09hqYrCPA/Ua52/CeXlcDHEXsMDqKhUVYSBCVByi3up4lwTHy1FFBqjmfFuwP+GIdj/TtfKSbvxL5DK7bMflkPGfr+w/2gQ/Mmq3pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5g7aXWG; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5g7aXWG"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c40397e746so31927225ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jun 2026 21:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782190552; x=1782795352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFkOkaN8XWyxvc+VzvECi+ZxhC9H35TOQHN9OYiWt/E=;
        b=c5g7aXWG6OnkRxu7j/T0CXq7snxW9d0lWuLsrpRhsp5tZua8CXoToHbdtlJaUGIKyu
         XXwSUTgRIcHpy2vEe6ivFPM+IJohQwAMP9VokzBwrUEsdPkUNjGF0DW6Xiumz4krKmyD
         oGcBU78604WZkviApyN+DTVSmFHm7XO6mYJXUBQubET5EZwKUSZNlocUzLOAFIwK3A4/
         JWBk/EEaHg1G+d4IHFCnm5kwiDkf0x15k7gBeMdpT7tPvFIk04ADvinFc4T9rAHG3c4X
         0M2gnX4jQc52aleKN8NazNjh4CD0/YqLhha2WqRWriHnAXIvy7Z49p+juCXztix8TvxT
         05YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782190552; x=1782795352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RFkOkaN8XWyxvc+VzvECi+ZxhC9H35TOQHN9OYiWt/E=;
        b=eEETXszIDGVGsvpt86uFCnDUxe/mWgY/j+WdeY0CkEK5+1pJixyj4sHOL4HunyEGei
         NJQfKdbVVs9MsuFF/Vw4TB19jBYtoDON4IZIyJ1rYQlIt1zRGEOxKsI8OBrXexFkE1pu
         8sAGE3iCmu49ENTyxKf6P8s1uoZGI1hqO4ZgU732fgMnXl82JxOwxfqQLj6cYV90R1df
         6/nlMebF+Erj5MWLl3AWxu1rz81uJFiWqvYhjENR0m6SWqBa7dvjFcGfwjDCf9DwbxAm
         ygrMDfVrYB2yQbiHxbxW5gM3LrgegBqzei5yB4ZrlsjOsQZoDK0oe+rKHRCDX+u38HvZ
         jIPQ==
X-Forwarded-Encrypted: i=1; AHgh+RqF2RHDZy6MNYUr2NyYDgbDhtbUD1OKTF7F4mXlO0g/MSA5wuAApqDga6Lb70JqiuG8I8orl9c6cPnYtt5V9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqBVfaADXlPAGlFzAvE+GcdA3SQMfqpCQwII4SWYpTj4P5iCg3
	Y+IdSBgXeUIh+xqjhB5YMFgxy+TKXQWvXcDA3r8BYZyF9/B/TkY4vcGA
X-Gm-Gg: AfdE7clps1mTBtdvWKO7u6LqQPzBucQ/C1e/ElKmFkdsBY9ktYmebydnMfJQ081dZAx
	KM+s4eYqJ5E6dBV6GjTLeUJXycw4+3CMNCWGIlhv6AIf5fONI4rQG5dgf1M0mAv75FdGD5/0cNu
	y1GLEbqaEsmfKry2tCPfX4jflq+VVaS8jZK9BdS5JxqzlmGY7XgGMq4HRdr1SqexCReLGzbEdyu
	SQBeoIZ0jJTupPEQNZVPpkD3XGuRWogCL1PkcGvUNNCTELnEwGr1j2jZcM67VR60Wsh6lrgVIsB
	gNcc/CQPTm9FX29VkC3LPzmVOxubdSGxxrgrOIcWyYNN7NyY25KYMBLfpfVEEHiRRIuMGR6MqwG
	R0Z7YdzYWJki5Jz4e72KwWIatuJGncea0LtGNglOKgW1sTrEUF3mwqkPxYZ1gcO1vHTwfqCUwwd
	4kCDM6iqmvYC2bxkD8nz9XDb4kAEYKVsQmp+1rcNms
X-Received: by 2002:a17:903:32d2:b0:2b2:ec46:dfed with SMTP id d9443c01a7336-2c742b5ae34mr136450075ad.31.1782190552159;
        Mon, 22 Jun 2026 21:55:52 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8cf0sm89734785ad.50.2026.06.22.21.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 21:55:51 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: akpm@linux-foundation.org,
	rust-for-linux@vger.kernel.org,
	linux-pci@vger.kernel.org,
	jic23@kernel.org,
	bhelgaas@google.com,
	lukas@wunner.de,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	djbw@kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan.Cameron@huawei.com
Cc: alistair23@gmail.com,
	boqun.feng@gmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	bjorn3_gh@protonmail.com,
	gary@garyguo.net,
	wilfred.mallawa@wdc.com,
	aliceryhl@google.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	tmgross@umich.edu,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 11/21] PCI/TSM: Support connecting to PCIe CMA devices
Date: Tue, 23 Jun 2026 14:53:56 +1000
Message-ID: <20260623045406.2589547-12-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623045406.2589547-1-alistair.francis@wdc.com>
References: <20260623045406.2589547-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

In the next patch we are going to add a PCIe CMA TSM driver, as such we
need to ensure that is_pci_tsm_host() will allow us to connect to CMA
capable devices. These devices don't necessarily has DEVCAP_TEE or IDE
support.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/linux/pci-tsm.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/linux/pci-tsm.h b/include/linux/pci-tsm.h
index 950e2c36a4ca..80e76ecefe71 100644
--- a/include/linux/pci-tsm.h
+++ b/include/linux/pci-tsm.h
@@ -3,6 +3,7 @@
 #define __PCI_TSM_H
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/pci-doe.h>
 #include <linux/sockptr.h>
 
 struct pci_tsm;
@@ -130,7 +131,7 @@ struct pci_tsm_host {
 	struct pci_doe_mb *doe_mb;
 };
 
-/* physical function0 and capable of 'connect' */
+/* device is a TSM host and capable of 'connect' */
 static inline bool is_pci_tsm_host(struct pci_dev *pdev)
 {
 	if (!pdev)
@@ -142,6 +143,14 @@ static inline bool is_pci_tsm_host(struct pci_dev *pdev)
 	if (pdev->is_virtfn)
 		return false;
 
+	/*
+	 * Report capable if CMA is supported, which can be supported on any PCIe
+	 * device.
+	 */
+	if (pci_find_doe_mailbox(pdev, PCI_VENDOR_ID_PCI_SIG,
+				 PCI_DOE_FEATURE_CMA))
+		return true;
+
 	/*
 	 * Allow for a Device Security Manager (DSM) associated with function0
 	 * of an Endpoint to coordinate TDISP requests for other functions
-- 
2.54.0

