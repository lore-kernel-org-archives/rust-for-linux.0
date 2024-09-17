Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFCB182
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Sep 2024 00:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726531866; cv=none; b=M0t/alQkU9nF3Fte5MqMRWzBHgephX2Lqo3hnfV551+wZ7xpvup919Wz2+iv3fbEH0V9AlgIVbt4n9uOqjGSbmkO5/7qSLOi0rFQhvHX9eyP6c/7TOiYbEpEqYFIjpWJHpqDhheLa6Z/GwHM0/mvCt+e5VHEhCLYDsOrEJARMig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726531866; c=relaxed/simple;
	bh=hU5iLxSH47Q+dO7j9wFD3aK57rS6msnzhfZQwB1PLck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=emxoz/0GfbO+Pz7QMh+Hk5oLHbNczU9B1DP0o9AWh031JZMBk5NElJ649hj00wdhrnVSfhFnQ+awQcpWkLnIwMaiVoFMaUwf3fmzArTh5s9PhHr0JT3f74GiIhPLvmsA/UCRPB6N2SSjRFqdihlUQQNcxOh/nZRzdimnWXIMSwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RXLIsGlW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RXLIsGlW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726531863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Tmm8QBHX9hBz4OCA1JEiQcNTP6WIrwV8Na168B9eMdQ=;
	b=RXLIsGlWCDYWG75S2f36Er9HdYrdUo/SlK6oBepvDrSyPvueeTKDSBl4Mj5qO//U1/b+NI
	azzHW+KC0B9hS5pUuoFxaFEbtOA4a8iB7v1PnCymyrBWZLDfgzvhxBDM27zZRRrA5ZC512
	0BKSYVPIITfQnpddgftViYmGInVuLUE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-ldzjf0JiMfS-MVwNAmSogw-1; Mon, 16 Sep 2024 20:11:02 -0400
X-MC-Unique: ldzjf0JiMfS-MVwNAmSogw-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-45856a29545so98554181cf.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 17:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726531862; x=1727136662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tmm8QBHX9hBz4OCA1JEiQcNTP6WIrwV8Na168B9eMdQ=;
        b=jA1qyfysjdLl04TThDnKVdvUsdk3Zh7+yPOCt2vK5sq/y0qqO8I2La/jUu96Bbmgz8
         xGBoE5gqQ9bbgp9DOnHEiohfbG6vW/M5U6h4Eif+2z/GjRrjok0OUM2aJ5JB9lctrY4J
         Bgh2MfPwq23fDAzf32JcAFn4myHAlwnBQtNPjO0XwpiJuzj/bwVoINJdS88rG9RnaFXw
         Wutmk5p5e4QTabdvb8sAp8+LT2K7wnv6oLfGu/uA2yT3CQ3LUHieQeGdprPPIw34VCbW
         ddg9CcnT8dTe3jagdrauXQr7OJTzFsuzRw3RMr7yX7jYEmzjXNg75EBqpKyWlIe8P/7Y
         XBXA==
X-Gm-Message-State: AOJu0YxZ7mo7f7hrShlVG2zQ1LbFoRT8ss+4jT5zEA3FmgA8OYBp5EiU
	2RlZLTACZ1nA7z9K/k1Q/fK3AB4TTPMmwVkbzvwFWQK5VaJ+TRNx7ZPcS6aTaoZRWSnnBj+vXVh
	GyF2Js/tjUOAOwzd4U6J83O3anvTmK8Ca0ibaz/suUr+wC0Eb++fc1P2DOiQqnp9H
X-Received: by 2002:a05:622a:53cf:b0:458:42aa:9853 with SMTP id d75a77b69052e-4599d2393f1mr205215141cf.23.1726531862059;
        Mon, 16 Sep 2024 17:11:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPpDTLWSZw+zeRZnpq/bYJ/50ETGEyIM5xiGEn5/ULUALhOfBRgLa1LxUZ/Zwgxif9zNnwBA==
X-Received: by 2002:a05:622a:53cf:b0:458:42aa:9853 with SMTP id d75a77b69052e-4599d2393f1mr205214611cf.23.1726531861627;
        Mon, 16 Sep 2024 17:11:01 -0700 (PDT)
Received: from towerofpower.montleon.net (syn-066-026-073-226.res.spectrum.com. [66.26.73.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c58c62633bsm29221956d6.25.2024.09.16.17.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 17:11:01 -0700 (PDT)
From: Jason Montleon <jmontleo@redhat.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	Jason Montleon <jmontleo@redhat.com>
Subject: [PATCH 0/1] RISC-V: Fix building rust when using GCC toolchain
Date: Mon, 16 Sep 2024 20:08:47 -0400
Message-ID: <20240917000848.720765-1-jmontleo@redhat.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The following patch resolves errors encountered while building on RISC-V
using the gcc toolchain with RUST_CONFIG=y

Jason Montleon (1):
  RISC-V: Fix building rust when using GCC toolchain

 rust/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)


base-commit: ad060dbbcfcfcba624ef1a75e1d71365a98b86d8
-- 
2.46.0

