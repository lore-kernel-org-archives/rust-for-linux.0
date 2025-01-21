Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773EA1F76BB;
	Tue, 21 Jan 2025 19:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737486894; cv=none; b=GahXwRWxbVsTXEs4O2NTzvsfvjRlbVGaN2pPLvf32TPUar3DbanQjSuP/SNCSwTk2cIjojcDjwZwkdj95WcyQPeHQl37KOkHOod1zOMMnmIMBdkoaIynRN985Oz69vF3vH3vtM1RxPpjKduGSOrHNeahholM+XxF7m/m6RxLP7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737486894; c=relaxed/simple;
	bh=FNwkKYtNgY128tT+Ow8mqes42EjX7w9jGfWwlvxYpFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kb3SW6wODvv8qyoC5nY+awSQuHOzxEDypGiQW9V3JDZs+OF+ZCx9XIGwPBtcfXsD4yv5JC9TLcZpQX6tKl+76B8GuAifjR0r74/UQ8+mYQ1dcmnwY0S4H9ubmkls+TEUgjkCNNZLbx5T4iOLJrv8YtI4BSVxXqJIsAKafEQwyQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uvk20P+n; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uvk20P+n"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-540215984f0so6489060e87.1;
        Tue, 21 Jan 2025 11:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737486890; x=1738091690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4s3hoprJz1ioDJMXWp67H1qXVNKWcKbvshZNe+AKy0=;
        b=Uvk20P+n3ZoZoS7fzh6BcAhkUKD05IlS9heZKF9vsy+Ay2VUfn/+XiEwBrwXHDVh9n
         AouVkohZFcPC/1psfkThtun5cBV9iKT3bcfnHckPFMe5Nt0Vu7tOKcerI6HKxi/2TN7I
         7KyQF7E9f7PzSLqm7/wTGuIMjFAGMnAu48VVHBeTDZ8yZb3fC8lSN0PeskCUyVDw7MHn
         gYNqFXY6ER/GmHd97NyspZb0zGDatNFzTQ9wM/xmZEVt3UXK9Wq/u2Y3Gnqnz2t96GzO
         mfpr8P4bODV4egkGWJT5YNpoe5NG4osdMbqa14MaKsS7TIL6nrR4tU/V3Qw6HtXoG0v+
         Q7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737486890; x=1738091690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4s3hoprJz1ioDJMXWp67H1qXVNKWcKbvshZNe+AKy0=;
        b=G0n6vtAbHG27HDA+Zo1NIg9AAktrbU8G8u/5AaXuZoMCZv8WcMXXEB+ITXhweqditF
         AHysC1g5BAP+oChtnxW7UcPlkXpNVCAbqWXc+0IPAO6mWPU737bTgWa+f+950MrXqnme
         RGZI/nkr0R8bl3BxfZ4Vlkz3XjFouHogx0y+WawFMQoCao1yxk4K/H+b3X238oOYvfjQ
         HzUzmKPg2sMTHjyRHoy9VBskNVq2KUORlaIl36zbD059lQV6NbRKqq9Vs+zz1xIw1aWn
         SnpL+u6eOP2b+rlYSoSjExP444eTOrH5WJEdDYq8MBQmtk7Kb2G4SBHVS2QSE34J0Zt7
         3Z9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsEWverzEfnuicaVeLQTwTWAPworOxCnGev5moT+eopY2WUhr4xE5oqzXXDxDU0YdG0UZt34IwVoAMnkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrgwFlaT5FzCc5ITB8c3Ok4+0JgRZKtNbDTOJ/6BgF96cw4z/5
	WtUt/6WZu+cftAv6BeAbmMiyWGrNDOvyHa61LDwPN5vSHEUsVkC0x1C73w==
X-Gm-Gg: ASbGnctjaYFTDq9DD0SYpSL/JTTqzUwAdqxBff5UC6FL8XOxFdFplKJQO3iCok3+zAK
	OnysrRC5G1jmb+jtEQx7AEgjmQo4Zd1q2lf3CyOXqMJcYKHyW52X+5Jz5vcCsqliG5me48N6Q6k
	tsqXrlm06N7t226R7dN6GqUTsRu6Yw6k9VlcmVSQ+E5ouOmZCiLlPJS0b3YdSBMkVK/0G/mLSw7
	Nj4FcALMGQkiRq3vGq5+Bava0vYXXZJhWVQhTUApj+Kup5NIcaYOHTUoyHFVvoIwC2p3kNPsT3o
	XYxT/WSNppk2zptF7Y2mHSNMbkKLipPEPpbsPrfC
X-Google-Smtp-Source: AGHT+IHsYf4uWJtJquxpu6BCK5LzNsmbNdBxjyV8XtAX7uA9o8RcDRBM1QpQ6TA1g7RHIR/3tXuTUA==
X-Received: by 2002:ac2:5611:0:b0:53f:f074:801c with SMTP id 2adb3069b0e04-5439c2830e9mr6089244e87.41.1737486890327;
        Tue, 21 Jan 2025 11:14:50 -0800 (PST)
Received: from abj-NUC9VXQNX.. (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543bb6bf5b1sm56786e87.118.2025.01.21.11.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 11:14:49 -0800 (PST)
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
Subject: [PATCH v10 3/3] MAINTAINERS: add entry for Rust dma mapping helpers device driver API
Date: Tue, 21 Jan 2025 21:14:04 +0200
Message-ID: <20250121191432.1178734-4-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121191432.1178734-1-abdiel.janulgue@gmail.com>
References: <20250121191432.1178734-1-abdiel.janulgue@gmail.com>
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

