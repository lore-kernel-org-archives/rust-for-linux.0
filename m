Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A18520E007;
	Thu, 23 Jan 2025 10:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737629039; cv=none; b=vE/g5xAjR/88nETWbC6G0lEEFH0xzZrKeYb2XxUug1A/vELtGkNCRkspWrf7ML41DZSZFvg6HS+Pxnrpf9NJSKobkAtGTl2vcVLkqYjmPXINpJUzMcxKMgYeu6Hws+sjrSsIv4Ak1/Q1XARXl4C4nQhuXh6w2F7jCYMCQGbpVCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737629039; c=relaxed/simple;
	bh=FNwkKYtNgY128tT+Ow8mqes42EjX7w9jGfWwlvxYpFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DWpDFw4j3Ad02D1LhKrQnYd9NtqYKPTv6VIG2VXyqCx9ejMva2l3nSZ04TJTsEDpy5OEgPgoV/qzILWSGRw2QMeVAG2FAhnXPcI75uhn0/S/+mbOMLzHbfQTR1QzPiwTU2/qbutEQYQw+86tClKjqFHHiH3meN2414ia7rZluM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNpHfz1O; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNpHfz1O"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5439a6179a7so837428e87.1;
        Thu, 23 Jan 2025 02:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737629036; x=1738233836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4s3hoprJz1ioDJMXWp67H1qXVNKWcKbvshZNe+AKy0=;
        b=GNpHfz1OIA0yduVUxn41ONMoYhaX6JGKfX5AbfZWm0d75P+O3bKK8l7+JaHt3bS6CB
         Jrns0+paHLk+zEqnvkqAtY7EzW4LNMdtoOwd+DJvwW3+h1cS6U6j7FA0bFblh1HoY+Ne
         eLbEOI4kHmr5MoOOcHDKEFGKdZg3Xs3VcRRfeZbvUEbHkSmM5Kv6l1PdRe7dQsfkJJEx
         5TKZ25lJixqmeh6rrLd6YcApYsBu3EgK2JcNoFFsfgL8uTgQHcMB1Gwq/zycqSSIeUuA
         kRKsA+Y5AW7/gse5AumCVqvgaWbNopdj2+zcz96m129nl1RXILcg8uMnSltN+oLbiZpF
         Emug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737629036; x=1738233836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4s3hoprJz1ioDJMXWp67H1qXVNKWcKbvshZNe+AKy0=;
        b=UiT9dYlKEybatn2u04BA/HyfloRKnF1o20uypYVzhkrjx1yxfUl30D36BuWBBv4pif
         /dXbDxN2Jvxp5M3gG1fSJjgpNhqG7tG8IvPzWdHeYGzrTOuaQ5eRHMA+N8WSJSm+AGjb
         9KBRj/4Ff2hUlCxwngoGs4fKasBqTF5/5NOA5wMDonbJxkSzS6QcW7n2UzXc8eLDu80T
         +zNTlbTubMLXunr+4IX5z4R+YCD3hl8oZ9DszhFkPNMoHOhQQlqFKduhWd7CAlGMDtdG
         BZelMc8I4S9qbmQ37ynG5m06YokSmBZqYQ45yFkBkA8lw3uUyYWdH/3RmF4TW/nwC/RH
         whZA==
X-Forwarded-Encrypted: i=1; AJvYcCVfPi40qeCGFZllQz3vAGrPUlAc9/eSteXrTR/gg52RJOkUfqGJXV700bAneBi+4s6mwdzQiQ2XZ8jWGoU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAaSCwVn41AO4CWuDJIZLmlFmpI66ndT6568Nj89tKOfojhKFK
	Kmqz/u5wmzgRejfo6Rt6wvGQICyczKhwzp0fet07Mt8dKIF0y0YVrsjLmQ==
X-Gm-Gg: ASbGncvrgQuD+o5WvPfeoN5MMQarad7zWIBLB2N+e5GCb16pWtG+gVRp+itbGtoyF1o
	7quITkIo/T1LQo6q6l5iSlKqcymudqqH2awH0WpFN65jLdPqrh2tam4QwWLmPfMlrS1T/OJqSPP
	G9SFZYOeo6fZ8ScztIKZQhkGPPLWn3MbwlaSRY22cQ3H9rcz9yJd2Tjo4DdYH8pYXG1JFT+bXey
	SeXbSwPAHGQGr4fYiZ9nloQ1a00HJ8Qpdc1OEN98ZVrzwfL9vh15Hje1wgMV3jASSVt3PtIm5lF
	47ZrZzxMn6ckUL74Dw4IQjNFwOX01h4e+VpHomxA7wpruh0TMaM=
X-Google-Smtp-Source: AGHT+IHcT7/RQNeQOAcU8PvDPDdbWBolwS3y95KvFPLTulFvDVapY73EUjtaarvuodv6G+7bXgxMBw==
X-Received: by 2002:a05:6512:1044:b0:53f:67be:507 with SMTP id 2adb3069b0e04-543c2278880mr846834e87.16.1737629035933;
        Thu, 23 Jan 2025 02:43:55 -0800 (PST)
Received: from abj-NUC9VXQNX.. (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0ea8esm2579873e87.80.2025.01.23.02.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 02:43:54 -0800 (PST)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: rust-for-linux@vger.kernel.org,
	daniel.almeida@collabora.com,
	dakr@kernel.org,
	robin.murphy@arm.com,
	aliceryhl@google.com
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kernel@vger.kernel.org (open list),
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	airlied@redhat.com,
	iommu@lists.linux.dev (open list:DMA MAPPING HELPERS),
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [PATCH v11 3/3] MAINTAINERS: add entry for Rust dma mapping helpers device driver API
Date: Thu, 23 Jan 2025 12:42:59 +0200
Message-ID: <20250123104333.1340512-4-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250123104333.1340512-1-abdiel.janulgue@gmail.com>
References: <20250123104333.1340512-1-abdiel.janulgue@gmail.com>
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

