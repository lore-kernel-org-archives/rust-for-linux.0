Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C471F941E;
	Wed,  8 Jan 2025 12:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736339315; cv=none; b=nl+A+BV9HBiYWiCthelNOAGDT2uAKGmi434rzSipNn7HRPjynsmE6BJM1jnSrkMUQGTjoLHuXJHmvId/+kfChKdCvxdTK3U8Fx57X9ExTZk8AtcTBx9ScrhCPkPuBfbYJX1NAOtcrPw5qZDMgQkxJ96sETcOrYMZl8ylHuU1+p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736339315; c=relaxed/simple;
	bh=cZ14/wWRUVUf238we36wItWnxfXg1HTVv9+deH4eTq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aC1xUUWWNvjD9HFZX7IZ+qTIi9YJLgz3WJyPxPgkuoMa5IcRhBOEvMQKjhu6+Rfj+Cj320cAWiGJ3Ci1IrWs3Z6uiDovbBv1a2ieh+mCbA5nVsmOQJs8t4SbWQD1xZ6s10kMqBff51/cebIA5ZFVnjTOi1IJKiqCH1EkgU22KS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMSbaFM4; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMSbaFM4"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30229d5b21cso95897441fa.1;
        Wed, 08 Jan 2025 04:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736339312; x=1736944112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wM27qo6u3r7uKPpTU2oaqiKaRCP/5KyL1NbcAHjQhow=;
        b=EMSbaFM4PPQnUoEharHnETbuhBQDHFJu46yoDEwv70/rJ0LJpuC9RokDSIYsDG94jj
         KnkZrbFsAESJf7o7Yl4Tldftigprxn2Dj8Qdx4KA9yc8n7xdyrxJM4b5n83WjDzGHxEC
         iSVSQZygHk+q2kjYNzyyXrcTtoiXhsphJVm3ZFr+RvU41ZySRWsq3xJ7rmVD7AAQH/1d
         qKu6ERawGKPC8U8ONFcISMYOGpaujhZbRJgMdXs0BMg/NCV3N37eD8mrrMjvA/D2dFaH
         UV+LtdlidwqUuVoCojWyF4a/Cb2EahgbYxotkwS4cx8FvyBMel1P75ORJZzAf3ZQz0Oz
         USsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736339312; x=1736944112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wM27qo6u3r7uKPpTU2oaqiKaRCP/5KyL1NbcAHjQhow=;
        b=cd1pAvzutBNo1J1JqGFi05EcNNpgKk+txipbwocdTkdDaoRNK+9r1eO6So1YMdPEjs
         g9V3dcLfQ2gcGMI6i1+7rbWDzTgfU6KIx+bwhOSL4vvWsa0ZJjijhkBABbIgwnhaCSKe
         rLcCIDtA7JKjjisgwH526mPSerxDaWU3gZ6MKwxxVIN9ZJauuG+L3ql9nLXqGXKV3cC6
         Hlgt7pX+qmLrzd5Ctnkx/HkdRmTjC9HSb2+FVIIDhuhNKKhUm4hZz0OSfkrUOAFd7TTe
         4Kv5bNZGTa69BRE4xIXdjDWQnIvJLl4V5m/vCH4W008qLF4sgZkl1loBhQB8u2/pvTur
         uOtA==
X-Forwarded-Encrypted: i=1; AJvYcCUEN7imVffR3Z1yNdmTiwNkK1mGIQe/buiUi9/J2RoT7EltadhAdM7lDDk7P3CziskKEGLiJKMv7g4KgIM=@vger.kernel.org, AJvYcCX2fxkW5irAdekRDlyIFWf+wk+ldQSa2Kico7htY/z7tMsnet1xkHZ7p1/jns43VgsOF8CCZERLtkICXgU0iz8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm1j7Q7/M/5Z1LrPTYNiVEuXBOkUUHnbyNQjd3IF0jX8pNqPB0
	KgDo+bcKLKzPUup3TFF26yJ0yxKrwtJy4R7Ivq0d1dyxVXm66tJI
X-Gm-Gg: ASbGncssT4K3GJOunQrNb3y2KW2B3s4n2/dtlC4Wmx8TG+BZ5p+eJqcD+V1r6DFMeGz
	DAsy/Med3ftDlqhWC60ZJuT/gxQLnUVh9IfIt1TDnPydKIJBEq16pyPoKLZibhZvBkb1UF1/tez
	7Qw/hn5ebnf8gJSBoSgFMiclvYiuozXB0QBcp6nv3TDPb7kTR8+8/Y1E/2GZ0GPc8WEnbt24t9E
	EcWjQy8KBL0S6LhMWyK4s0/WeKHnSZpk25VWcNvFslUQZbnFu+3EwEJSl1qqZA6qDTSo/7+I9Kg
	FFmBTt8k3mI2OZPt1nriCWoGbdw=
X-Google-Smtp-Source: AGHT+IGjY9ryTUxiQ/CgtRArSzwWWhtj65FdhI0DJ8xzTaj2rddmNknMPMcxykYc0Iaa+d/MKLOMlA==
X-Received: by 2002:a2e:a589:0:b0:304:d31f:2fbc with SMTP id 38308e7fff4ca-305f45f2869mr7019841fa.36.1736339312178;
        Wed, 08 Jan 2025 04:28:32 -0800 (PST)
Received: from abj-NUC9VXQNX.. (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b082db8sm61183911fa.99.2025.01.08.04.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:28:31 -0800 (PST)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	robin.murphy@arm.com,
	rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kernel@vger.kernel.org (open list),
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	airlied@redhat.com,
	iommu@lists.linux.dev (open list:DMA MAPPING HELPERS),
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [PATCH v8 1/2] rust: error: Add EOVERFLOW
Date: Wed,  8 Jan 2025 14:27:23 +0200
Message-ID: <20250108122825.136021-2-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250108122825.136021-1-abdiel.janulgue@gmail.com>
References: <20250108122825.136021-1-abdiel.janulgue@gmail.com>
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
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 914e8dec1abd..eb06be2ca9c5 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -63,6 +63,7 @@ macro_rules! declare_err {
     declare_err!(EPIPE, "Broken pipe.");
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
+    declare_err!(EOVERFLOW, "Value too large for defined data type.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
     declare_err!(ERESTARTNOHAND, "Restart if no handler.");
-- 
2.43.0

