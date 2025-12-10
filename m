Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05732F99AD
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765365942; cv=none; b=TIR1SIlo6YRuGk7w4ENK2UXj69C51YTvnlbM33+tSmA8r7QZR+OpXYjOy9LwlJ6CedGXyg0ohOB9r04pcDemnYZlYSmTlusnFAzS1cmC228RL+kj0q0Wp/hQAGYT30DG3F1Uy0DG7QAqQbzOql0Dg1ZHcXXeyQOg4/RDSVkl0zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765365942; c=relaxed/simple;
	bh=SiflQ8BqReS4IAkXvC+ybFavpL26sJ+t3AeNXPU0WLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vo2XtRV6nOve2EcFcunwlmPprtPZovzFJLQXDP/AjR8AlS+NcEu6cUAuuKuFgprLFd7X6wsRD5oLLds/8ywDTHFfUqtoQJ85a92d694Qm2pW336KN9Nn7MShvW7XwiBBA+DTmegjlvq5zm0THG/eOQ+0UPnL8HklBBEAq4bGwO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=markoturk.info; spf=pass smtp.mailfrom=markoturk.info; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=markoturk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=markoturk.info
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b79d6a70fc8so324454066b.0
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 03:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765365938; x=1765970738;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/KEgc0VuJbMbVFu5ef1xgSG23C2eQz5SCc2+vandgc=;
        b=mkIvzrvQvIDN+B5JsPLXY7pl927DLEQouqEQL3WR/iA2Wu7SNkuv4nYyeLHXz/IOkq
         AOAR4bAAi8R3s2DsrHo9zggjht/KwjwmytMB8TwLaAu0YI0U7ZBr5mHbW02+RO5yfsyW
         AFR9lC9mBZFOylKKYDTtxdNWnalxrp0FEER+BrbLUlY1orPPv8qACTPjGK2VFRrhEULa
         373sUMKOqB2zs7aK+obtdJXYYuNen008hGqlZIcfONI8KD+aYoEUQOnOGuqjEre9RxYu
         dBCydvT/bQ+ruP4btHHORL/TITnVsj3qmFoVNKXX69TMhMKuUDzMC3ZAidQq+S8Q9pu1
         YFvw==
X-Forwarded-Encrypted: i=1; AJvYcCUMBeg8NXpbWvl0PNkpCQnfo6N6EwghZLhWVIfxOaow/sBn6ua+k5UlbcpwOuj9r2A0xgfZpNPHYFZbS4fCWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFQdcnJqmrbJ0Z6zq7pxoB3F9GUJK3ajHWHA55AU0k8qtFxKgr
	LUa3vrs50M22i1XqngBqTOqAznxVeRNe9ClDxBiVucSK0WENH6z4+MipkU6botkfquM=
X-Gm-Gg: ASbGnctRA9II2eacLr5AffLD3bCWE9BGJElDFvc0HJzCj01ENUy4FGf5etEl0n2DNWh
	As/3RbjvE/W7PJFfw2wpeJmmBBqhP/KlybYUcF6EWWZcfGM5ILUvrk8ka1Ivxui2+YXjH+ykmwN
	9B0QGVo3f3OB0+XQ6dG5tLj7CLEUJOXEFqbkMWXU6uBIK81Pznmxi3SJiHgMV0tqwdl5ebmEmXJ
	3VehJrZLMnGB7Hv35PGBhAs0N9GSoopnrXMgTE4/CADbwYnS4ulL4P0f1C4ISOaqXFhgyQHaMHF
	B0Y4Ds2f8xasL6SFYZvP6pIr6AKA66GSfo3bm0lj7tQ+6VtV4ovPzvayDX3ADsxfPRoKECbZyAd
	aYGLpjN7Eg7eB9P0LKYB22FuOSxLILeTpbP2nhc79BL8uCJj33Ov3Iqd48a4MJZRnWLswmVmPV7
	H8/6fSvRDASRe9WkDSxgawwr6A2S/UCiN5TsUogoFFox3siPnPHsc=
X-Google-Smtp-Source: AGHT+IHIpXxJMkLL/+eyW21uSytCKFrqeqKdh2xUnVgpDC8S3A+wyRIllZtL1Su7fh+/R4PQxbxQ9w==
X-Received: by 2002:a17:907:3fa7:b0:b73:5f5e:574d with SMTP id a640c23a62f3a-b7ce8498f08mr225280666b.59.1765365937868;
        Wed, 10 Dec 2025 03:25:37 -0800 (PST)
Received: from vps.markoturk.info (cpe-109-60-37-145.st4.cable.xnet.hr. [109.60.37.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cf2a9717fsm53958266b.24.2025.12.10.03.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 03:25:37 -0800 (PST)
Date: Wed, 10 Dec 2025 12:25:35 +0100
From: Marko Turk <mt@markoturk.info>
To: dakr@kernel.org, bhelgaas@google.com, kwilczynski@kernel.org,
	miguel.ojeda.sandonis@gmail.com, dirk.behme@de.bosch.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, mt@markoturk.info
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, Marko Turk <mt@markoturk.info>
Subject: [PATCH 1/2] rust: pci: document Bar's endianness conversion
Message-ID: <20251210112503.62925-1-mt@markoturk.info>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.0

Document that the Bar's MMIO backend always assumes little-endian
devices and that its operations automatically convert to CPU endianness.

Signed-off-by: Marko Turk <mt@markoturk.info>
Link: https://lore.kernel.org/lkml/DE7F6RR1NAKW.3DJYO44O73941@kernel.org/
---
 rust/kernel/pci/io.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/pci/io.rs b/rust/kernel/pci/io.rs
index 0d55c3139b6f..bfa9df9e9bb9 100644
--- a/rust/kernel/pci/io.rs
+++ b/rust/kernel/pci/io.rs
@@ -18,9 +18,12 @@
 
 /// A PCI BAR to perform I/O-Operations on.
 ///
+/// I/O backend assumes that the device is little-endian and will automatically
+/// convert from little-endian to CPU endianness.
+///
 /// # Invariants
 ///
-/// `Bar` always holds an `IoRaw` inststance that holds a valid pointer to the start of the I/O
+/// `Bar` always holds an `IoRaw` instance that holds a valid pointer to the start of the I/O
 /// memory mapped PCI BAR and its size.
 pub struct Bar<const SIZE: usize = 0> {
     pdev: ARef<Device>,
-- 
2.51.0

