Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E7620E00C;
	Thu, 23 Jan 2025 10:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737629034; cv=none; b=oT4Xgp81oZ4yeUtGld9S/irlpIMa9bPU6SWJ/DL5HITi0aMHu9HZbHvKYizYwPb1Skmc3g7kslBNJNHMjhhb4QLs3M7i+R9RYa+X2WvHBsnQez/EIbryJ35Gu2nNSf+9lZZt65vPFpfRyBfmtlSw95QYmCqXXAAx2fDjhCaprow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737629034; c=relaxed/simple;
	bh=7y/5voRRl3iVEWd8dd9FMx/aIm3fFsPYaagWFci7DeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cqbFWkSNnyPKLWAV7e3h68SmDnQngWrVU2w8S2n6FKBeao36M0H7SJRgLXmhOW8ft86ySfVJZ8diNPXS8djptvP1nEZfyiV4av+T9fTpoiUJushMf76lTZ7QbjHtEtPs5oA1STD7mkOVNYkuE4p2NhGFS/0Jsk1w7u95H9KK7w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkMT+K4x; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkMT+K4x"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5439e331cceso945337e87.1;
        Thu, 23 Jan 2025 02:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737629031; x=1738233831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsTWX9yoQTMgLsmI/WJU+pLJbUvjBW8MdXlesjuHNQQ=;
        b=hkMT+K4xrHN9SwK93u1jmyBAs3XKs/ic6oXSSLwj1biyMxpLLTXsSYd6eFQ+u+/ZhV
         AhQXpPZgaDU62GqiJ1RSPi7435vb4GR/FvEIBbSkCZaewoflg2khIrqftUGx7xkYu8bB
         k4cfjhLIYIjuQiaTKTZyYLy9kbAroT18utyQ9NcjpFEiTkIp5r6NMB+9Hu8HLHzBsJXg
         LWOPvSMNOYaHIZswjVVDnRZgWOYMxbPjQR8AEhxJWHFq0hi2Zt3Tkrpfx9c0IdNAVnA4
         A1C7Rq6WubgGiT1EHfOPh3Ul1qybncrc95sMEBy3jgI/LWB/pXYCT1pWIDTATOMyKDeM
         V9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737629031; x=1738233831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsTWX9yoQTMgLsmI/WJU+pLJbUvjBW8MdXlesjuHNQQ=;
        b=RcnmqY6Tj+bLYcE5JkeyTA2/MGGERnCyDdYjGIl3NNU0PwWEGAAPbV8RB8kzwFL8QF
         ItKfFwy8xXsowisrPE2xKje5qv/up8b76uW+EZ8k+vnbM2e0FOfvWFPd8xQQb+Y5mIom
         eTVCc+OhjCbUVABDJkywoBQi9oCegcoyDQispxso6/TP5JXiDbruwhcax07IFB9v804z
         kvEDUgiEPiHULmLuSLCg+loqsRBwTIjQZSYHONdmHuW4mUaSWwjQuT72K4PI70NQ4cWi
         U212MUAg0LZYIgXY5ZFD4ZGuU0g87ZANNJe3M42VTfgMgV5xDkeMUCpAEUDP6DvBqv0I
         6+Pw==
X-Forwarded-Encrypted: i=1; AJvYcCX4E6J+H5Jk0Ap30wugdCdI8Qp9r6luxRVx5412QBoHSCnMCY1RYzCNjSqAGmVKHDOuPjo9Gc+7VSmbfFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvkEJX7rdW0XecHnqSEpQA3kZZTFSdV+3iCt+1dDSCufHYlPHQ
	DyusmJ7CYvnUm4v3p2yNq9BIwgEwHKlBBQow7r6is2trlriRtjgTzYyOxQ==
X-Gm-Gg: ASbGncuIKkKO5aWS1Slu0x04x2kLnRaoejyEezDOIEZomAzTHFugujJcECD/svwTtH8
	zU11PkMJJg9qll5xo37XfGOs8rkqQrNBHODjasnaBNjDZL4JIii2pDnLfKq+D5Eizr0G8iLT21a
	jeShazuRBV1nw7TC0GlDQ+MchfGblRoPzbqXkICE2HjBaWIG3cxrNrWy9k/HN8TheIjhR9O+RF3
	qUqPhciCddr282I5oXYgDX1pXmAkwNqZtJyR1LvYWknxdUBnvGb2qLHls1frn6slPvZafWLr5ZZ
	GR8aFZiNiJO9UEmGkR06a934xnxbnK5PpVN8ejp/DNr4wENOZ9I=
X-Google-Smtp-Source: AGHT+IHnDXq/rQt9rvIEwMH/Qu1x3vMN4D/Sfbrtt3HCkRjO/okvdPh6Tg6yj0BiKhp7C2EH/cOaNw==
X-Received: by 2002:a05:6512:3d2:b0:542:1b63:2e78 with SMTP id 2adb3069b0e04-5439c216b34mr5857889e87.2.1737629031044;
        Thu, 23 Jan 2025 02:43:51 -0800 (PST)
Received: from abj-NUC9VXQNX.. (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0ea8esm2579873e87.80.2025.01.23.02.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 02:43:49 -0800 (PST)
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
Subject: [PATCH v11 1/3] rust: error: Add EOVERFLOW
Date: Thu, 23 Jan 2025 12:42:57 +0200
Message-ID: <20250123104333.1340512-2-abdiel.janulgue@gmail.com>
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

Trivial addition for missing EOVERFLOW error. This is used by a
subsequent patch that might require returning EOVERFLOW as a result
of `checked_mul`.

Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index f6ecf09cb65f..1e510181432c 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -64,6 +64,7 @@ macro_rules! declare_err {
     declare_err!(EPIPE, "Broken pipe.");
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
+    declare_err!(EOVERFLOW, "Value too large for defined data type.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
     declare_err!(ERESTARTNOHAND, "Restart if no handler.");
-- 
2.43.0

