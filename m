Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DA72FBDE1
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763654793; cv=none; b=byKLUxKm5dygoEUpxU9U1vss9mK1qkUmwW+454zdQ8zSvdncWT5pGFwrPUBCYdz+EbJ2RZ5rHnRNKCQKKKTIA7ZsIjhCwXcXQUjmTQrJuN8sq+j+JDIGtkMEr7NbhfhDey2uBAEg00w9/t4UNJRKv+k1JltS4J8zKBMszu1PYTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763654793; c=relaxed/simple;
	bh=YtqQuMbINY8X0cPMRyDiTleL/Hu5LQdSweSh7//eQD8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type; b=ht5QWpX+I77CvKcH1Nky2JDMUrjlEaOztxkYFeE6411c7pRL84q4ZgBdlUCXHoeopPz5lcCVOzURJEMvJr3rjqJsHW8t2vCI5nltnq/9THGnLMNg+Av796onSo9nTXqH7fDL5A1cLpkQkoobwPsPnkdnqb/gjnsH/hYKWBoSLYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JWNgh0po; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JWNgh0po"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763654790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=36b9XZCKs/pgLpr/4TqFVX3kxLBLijcgRhSbLyN8kD0=;
	b=JWNgh0poL2+0R+KZjrAAwroDq38JMomuzwLN5aWsFQJNggweQ/cTrGg2sF9qlpZOeOLMtu
	M0MAmZ0Dnk5AJrE422cWUuyR1rG8P+eU276CdsNcc87IzFgs/qkUnPDrmSW8miu2tQE25M
	wz2euKJ17RftZkm27PUvodi2FFq5G1Q=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-4zNBLNXfMpuqj4ZcMAfIbw-1; Thu, 20 Nov 2025 11:06:29 -0500
X-MC-Unique: 4zNBLNXfMpuqj4ZcMAfIbw-1
X-Mimecast-MFC-AGG-ID: 4zNBLNXfMpuqj4ZcMAfIbw_1763654788
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-787d4af9896so15133677b3.3
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 08:06:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763654788; x=1764259588;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36b9XZCKs/pgLpr/4TqFVX3kxLBLijcgRhSbLyN8kD0=;
        b=KNHxbczByV0MU2aVKUiph4qBkPWKItVywiXZn7ZIcWxAzUtqNvVjdx0eAC9VvDw7PN
         KlvWASm2TNDEbOCki0J+fofV6ks55qK6b/E1C7qfHWsPeJGJj5wMsXQhEPt613CoPI28
         SpzgA+f82ZKoODiAFp6a/v2fI5QKqaKnDUvEGhB/rVA8So3Yo55C33astqevAxUMrrru
         Mc6pZ7EX8YhTDTllCACYdQkfJI9FXiC4MooKGXZ9tnEsRksrpG/VTxydS5epqNu70jAo
         hXNHPTPEZsxbCAmhl/cb0ItqGEmC99T835qFT4Ru1pR6tRAeeigkBR0CPfuWZl2EHwBI
         6ACA==
X-Gm-Message-State: AOJu0YyVIgFLXVWFKfnHUkuBFQpqnYKIRU78FROGafyIrUVbRC/J0Ai/
	sUUm76LgY6lrNHnqWEty/yhgMK1Fof9f2NEiwZ7Sdi2S8OB3iwXNFvHsoH132UhfdO3oPDXzlZO
	/etVQKQPpVgFdIw7VPkmn+js1knUM+d0c4oSkASz9PyhsCjwT2vVAXk0HF3guu7QQFTki
X-Gm-Gg: ASbGncuelJyFHijIuHcGR6quWxlKMt8hJbA+BepG9qzTYW7l4D9frJdN3G9jYEEBDaP
	1JgXmHkNoxj3WP7PKhbVAvksV0pYNqZ8LCzqE4b/Il0+EiEPzBSvjJgCMIWU0X6YwZIkoz+cS80
	aKJL5gCED4nGZ6jS7WS/Vo7mvJ5BFEpP7mRZoK8/O0NO7BdH2CU8nDw48m1epI/nlInrRnSt3IP
	+yfFQfkb8DZzE3koEtiTPszGIY1JWn6u9gWdeRRHAikTxnCsIHu7gUIirZ14FaWpqMcgmRhBVBm
	UcU9A5ZUFST9iX+Jf83TQd0npIIQ8AqOs1YIYJEXlKVdnupkatc1beq2ddTCfKu79/FnbF0Bbkr
	9VwPd8ZA0R63fTw==
X-Received: by 2002:a05:690c:9a0a:b0:787:c849:6544 with SMTP id 00721157ae682-78a79566613mr35912897b3.5.1763654788417;
        Thu, 20 Nov 2025 08:06:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMBA+auyfG7QamapbDuigvM95CqtgVb4eqcL6yZ8NUcpniu8svAoLr/UG05Quplmo+4doCnw==
X-Received: by 2002:a05:690c:9a0a:b0:787:c849:6544 with SMTP id 00721157ae682-78a79566613mr35912387b3.5.1763654787838;
        Thu, 20 Nov 2025 08:06:27 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b141:ac00:ca1:dc8c:d6d0:7e87])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295ef333sm176303085a.49.2025.11.20.08.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 08:06:27 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 20 Nov 2025 11:06:09 -0500
Subject: [PATCH] samples: rust: fix module name for Rust PCI driver sample
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20251120-rust-driver-pci-fix-module-name-v1-1-430cee310dc0@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqAIBAAvxJ7bkHNCPtKdAjdaqEs1oog+nvSc
 WCYeSCRMCVoiweELk68xQy6LMDPQ5wIOWQGo0yttVEoZzowCF8kuHvGkW9ct3AuhHFYCa1zdeV
 146yykCu7UFb+Q9e/7wcOHdG5cQAAAA==
X-Change-ID: 20251120-rust-driver-pci-fix-module-name-49953c179404
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peter Colberg <pcolberg@redhat.com>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: awqcv1I4q_EahxA7d1UNzLkDRHWF8JAQbvUbINTrvQA_1763654788
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Replace driver_pci -> rust_driver_pci in config SAMPLE_RUST_DRIVER_PCI.

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 samples/rust/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index b66bed5d3f36d20302bf586dfdb002d39ed9796e..cde1dc9451d3aa191c82f2f2bb3e936f136d80c4 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -114,7 +114,7 @@ config SAMPLE_RUST_DRIVER_PCI
 	  This option builds the Rust PCI driver sample.
 
 	  To compile this as a module, choose M here:
-	  the module will be called driver_pci.
+	  the module will be called rust_driver_pci.
 
 	  If unsure, say N.
 

---
base-commit: e4addc7cc2dfcc19f1c8c8e47f3834b22cb21559
change-id: 20251120-rust-driver-pci-fix-module-name-49953c179404

Best regards,
-- 
Peter Colberg <pcolberg@redhat.com>

