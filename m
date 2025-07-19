Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF4279CD
	for <rust-for-linux@vger.kernel.org>; Sat, 19 Jul 2025 14:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752935650; cv=none; b=XgQamOK2Cp/KiQ+1BXKfBJTc1m3z+eJjxnzUpqRv0eU3hMWkuSb+VFdBtpSnmqve+YolhO7L3fzpXHRVyjD0EdYO33Rwe1MoUYcxwKzJqfnLpCMUm4DA5fyWbTyEBK0Po6ovIxmpC91BMxOn6JaAO9H+qvnJNoZR0esEQIEou7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752935650; c=relaxed/simple;
	bh=cIlsCjU60tcTX9pCHNYoUdcY4K8aiFQvCiC3AoK61jA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EIbPbpwjcrGc/ppj4zncmmWE3a/ubYmfELjy8GVIKrj7uWTlOvxcaeJAX8CIHZiXWfafFr5RAPnOJNj1g5Fktnf3/w9iansKtEflM21sDRJGw5VSWNe9v4wvwR2w5WWGAuAwduHO2PRTxfqefptGFIbFWfA0b81+Feo2jms5vx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=k1GEk6Qs; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="k1GEk6Qs"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-236470b2dceso24443935ad.0
        for <rust-for-linux@vger.kernel.org>; Sat, 19 Jul 2025 07:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1752935648; x=1753540448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgLQWEfUsgUd4bc4XTm4Fj5yFjdCjIN4tWY9zvoyEr0=;
        b=k1GEk6QsJy7Gr8V2GkgXwYyY6fMmoLO+SL4J7RMq41hSdzOp9o7tyyzHeBiKm6ic6F
         ByVh2CPivEttJ2usjF56ufvZlU9JjpGinv6GUPvnjB8xcKYf8isEJ9ICp5tVoLek3arL
         pxAsLWu2HYjm2eyXB4rKpOIJHBq4/V0anUMtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752935648; x=1753540448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgLQWEfUsgUd4bc4XTm4Fj5yFjdCjIN4tWY9zvoyEr0=;
        b=ddnnoR/bdvs6G6+bZEceua3nnvcpCsD6rg9UfvzoLN5iEqEfkhY5Px0dYaytof8dP6
         b/7y91oCoG0kqzS1/vZS5Sarvo7xEVDftKPuPWm83KfPyHDEpZ1ELEkPItpvvs0N/bHP
         iYnBE9gH0Tp9ORC1PIZBdEhX5Tpe+Cb9dlHhQWj1DZudc1KYpWUGGHTkwNOrx5KhaHjr
         2pofqNrkvMAk2xO8ihdmcb0Rr72Qss3LNY3hMddOKIKmVAU/AbIA7IKr9YDnhf8xODZ4
         euLH2TyPJvOq9UfDbneKg9HOdaLyPWd23vYplwJsbZielMrVR55vCTaUuV/s/o1t8t5G
         4epw==
X-Gm-Message-State: AOJu0YzXXfcf7HyItxFi+W/+ShA+6uDvYnLOSSc2RzDVBITxn2zeMSTE
	ndF7RjBdKsukT9SgBd5toIZtKLxBW7Bno2h6kUXV0ovq48GqYAMUGSiM3X4b/jDyZbc=
X-Gm-Gg: ASbGncubiMLOXUmbCtFT75yKz/7tJWgjgt/qcQeR6wCPAs4K6PcB79s3DBotPV118k3
	wJYtTkMcj/VetmsqMAUm4VW8oMYoDzcGJXcFvLsSv4FfXmYvow3Jpxmr+r70J2I3WZoXIrpOgU3
	0M75lSqvU8Ft3JyzIoB1CkEnOk25O/rXI+8ILByfl6GDzy4GCv96XtWO6EtUgoFhVzbugqeEj46
	8j+/8LvtNHG9tVoiKke/FHLwYWLB/PLcD2KSIC4/1E9G/Zt0Yn7lk1Nxs4hPhpKm1MAPSM1X85R
	KIU1UA9T3CATLOyxEp8VlzB8mZEFswqk7O9+U0FO/+4A0fpiNraQtXFmBCLWfjawKG2SaKOjSVL
	hVXcZozPeMM8SYqMbT0c7RjLuKxz/EFdojtN3rbpdJ+J7pm3WbsM2pummZV8=
X-Google-Smtp-Source: AGHT+IHmqgL62d37O3Ajjc0SWP3lfmOKTeqf3aN029Y1WM6pxkfJu+Z5abVV+qUXutkwbgMwULqrSQ==
X-Received: by 2002:a17:902:ce85:b0:23c:8f15:3d46 with SMTP id d9443c01a7336-23e25750d9emr181722575ad.37.1752935648180;
        Sat, 19 Jul 2025 07:34:08 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e3d4esm30017525ad.23.2025.07.19.07.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 07:34:07 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jens Axboe <axboe@kernel.dk>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [RFC PATCH 0/4] rust: miscdevice: abstraction for uring-cmd
Date: Sat, 19 Jul 2025 14:33:54 +0000
Message-ID: <20250719143358.22363-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series implemens an abstraction for io-uring sqe and cmd and
adds uring_cmd callback for miscdevice. Also there is an example that use
uring_cmd in rust-miscdevice sample.

Sidong Yang (4):
  rust: bindings: add io_uring headers in bindings_helper.h
  rust: io_uring: introduce rust abstraction for io-uring cmd
  rust: miscdevice: add uring_cmd() for MiscDevice trait
  samples: rust: rust_misc_device: add uring_cmd example

 rust/bindings/bindings_helper.h  |   2 +
 rust/kernel/io_uring.rs          | 114 +++++++++++++++++++++++++++++++
 rust/kernel/lib.rs               |   1 +
 rust/kernel/miscdevice.rs        |  34 +++++++++
 samples/rust/rust_misc_device.rs |  30 ++++++++
 5 files changed, 181 insertions(+)
 create mode 100644 rust/kernel/io_uring.rs

-- 
2.43.0

