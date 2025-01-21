Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088941C07D5;
	Tue, 21 Jan 2025 08:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737449327; cv=none; b=Kodt7rDNDGZ2orjaOojAGWbHsblZfjSsAaUji8EjG30ZIrNlnERcu30iOh5SNeKJ/TapIl2cSZVAQoC78k04dsEOPos/4g+vTDcUiHuW6SvUbxzClmYHCA0oTyC7IQXIb0P1l+hh6ZGnKTj9LZqXxt4FgTawWiDXiUCLnpgWlrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737449327; c=relaxed/simple;
	bh=FNwkKYtNgY128tT+Ow8mqes42EjX7w9jGfWwlvxYpFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R46RSqTtbB8tkw8Zb7ypPRg68rrv+l0r2ybaAQ6TyRohRRg0JQdrrfQbxGnkKcYnWEs1kPomKvzBgiCVOeA48pw8LKkJwKFKQyGYcw4jeUN02Q9in6slbmsJZvevUipB4sGLMEbIEV8sB0iRLHISX/hD/BYTuwPxSQsQBb70Pjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiFjzSqw; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiFjzSqw"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-304d9a1f198so45252491fa.0;
        Tue, 21 Jan 2025 00:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737449324; x=1738054124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4s3hoprJz1ioDJMXWp67H1qXVNKWcKbvshZNe+AKy0=;
        b=EiFjzSqwPrbc/GOGiVuUGRLF/EDTXPd5SDSSMuYGNuNaUUs34VjucC2P5JBFQcjA5n
         XATKuJFc1ZWzL+4p7jdC8I7f9muXF9IdGDaGaCfjpD7inFYNRYLl65ULWMUldKjusKz9
         Btx2CxPWhtwzMCBrjVmuDjO5kgVhiDnclnOgngWcS+71ZMQAzAY//s0WTXuMBqfjgznn
         NqqmwYgowCHSYPfw3mdGpe9j6fRJNg8NzsJpE5jFEFIY7plUXhlk1Lpj3tZOegsEktAb
         P+3zf5d4f8QBPJUVd4tYP7E0Mh1kmhOM8xnr/Gny+hZqif4tZkTXMDII7NxguZPU+mDJ
         1KyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737449324; x=1738054124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4s3hoprJz1ioDJMXWp67H1qXVNKWcKbvshZNe+AKy0=;
        b=XDue6rok6mxkgUMJGkkAlLb/xLGPeEa3IgUm+FFVlHbepcdRYT21ZVpuYyxtTOO4Cm
         2dsdyCddC58/8M28LKvldlkrhwC628XgDw9PBd8veaExrdAoXTsopjmIEzrDFZuMoMId
         ss8qGKJfUo/Kt7b4MbLL6xK6uDY8FCBlpTRuEvCZQKxbSCuK5A6197ZK2j46q481uug0
         XdzCVfhNyem6a5dvb+fpJrMyTA7jhuLO71w3QNpxL5pxrGqemvAOvAZ9+uqEkryWXcHE
         OIeJPtMfj6QBGkB6XqfnEHOGn6oq60Bn9U5CC0lUP6mz+HzO71rF69uacLYh5OlXpQEd
         lziA==
X-Forwarded-Encrypted: i=1; AJvYcCXZpeczGzVMN2HeH7w9T5ojcTTm/BBxoi9sAmXdARh0swDgfYR2ui83AY/G7+ntoWu9K0sxJyJj+ROVx0E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7wLq8DDROq6Oi0dPRZmNpf4fmTq5fBFypBUOZeVqw9XNWYYN1
	na/p3WFUcL2oPpGnnydb5Q8CjEPZBJMDUZ3juC7uBSc+WgR8q/zukVB0fg==
X-Gm-Gg: ASbGncv6iSfDzVJ2LYIcKCBy+hJ+51980pd4xkLTL32kIMTV4gHZBS7IQ4fuaF9x9tG
	eJ6/q7k6nEUVWcHHdeIMMIab7czhPF/Wn31SaifdwXEQJodE3SVp6UjLSC0eK01zV+VSrghtU8i
	4/n8+bzWf0hXVvf2JLcLW6ZcNie0e8PlPaMDE4sSbqLUy02GxLvlw7DtwqjcBG2VLUOC4d6vqK1
	F7oDZUtG7zwt7ZVvwbSseLIy2354eVyn4Yq6lvw6ZJOBmRKGICVe1d5RjXltyaMd5DSdUsHAbj0
	IYDx2Ge6uWf1qc5QdYOPaxWBAQt3FMqQ9euO6hRe
X-Google-Smtp-Source: AGHT+IEUb+pKUur2MAxOyMFl1SvfLwa+rQvrDMr6H+dQ73p04UtbHXpzu1PqQqoMBlDfg7V3YdMuRg==
X-Received: by 2002:a05:651c:b24:b0:300:32a3:a322 with SMTP id 38308e7fff4ca-3072cb1f715mr67961381fa.32.1737449323788;
        Tue, 21 Jan 2025 00:48:43 -0800 (PST)
Received: from abj-NUC9VXQNX.. (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a4ed5c7sm21178651fa.82.2025.01.21.00.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 00:48:42 -0800 (PST)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: rust-for-linux@vger.kernel.org,
	daniel.almeida@collabora.com,
	dakr@kernel.org,
	robin.murphy@arm.com,
	daniel@sedlak.dev
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kernel@vger.kernel.org (open list),
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	airlied@redhat.com,
	iommu@lists.linux.dev (open list:DMA MAPPING HELPERS),
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [PATCH v9 3/3] MAINTAINERS: add entry for Rust dma mapping helpers device driver API
Date: Tue, 21 Jan 2025 10:47:47 +0200
Message-ID: <20250121084756.1051758-4-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121084756.1051758-1-abdiel.janulgue@gmail.com>
References: <20250121084756.1051758-1-abdiel.janulgue@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry for the Rust dma mapping helpers abstractions.

Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index baf0eeb9a355..4808c9880b3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6822,6 +6822,16 @@ F:	include/linux/dma-mapping.h
 F:	include/linux/swiotlb.h
 F:	kernel/dma/
 
+DMA MAPPING HELPERS DEVICE DRIVER API [RUST]
+M:	Abdiel Janulgue <abdiel.janulgue@gmail.com>
+M:	Danilo Krummrich <dakr@kernel.org>
+R:	Daniel Almeida <daniel.almeida@collabora.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Supported
+W:	https://rust-for-linux.com
+T:	git https://github.com/Rust-for-Linux/linux.git rust-next
+F:	rust/kernel/dma.rs
+
 DMA-BUF HEAPS FRAMEWORK
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 R:	Benjamin Gaignard <benjamin.gaignard@collabora.com>
-- 
2.43.0

