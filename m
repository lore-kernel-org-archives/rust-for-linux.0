Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6D24C97
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Dec 2025 15:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765293403; cv=none; b=tcM63cvlbMSvkdwyNXvF+f6O8hoG8aKanA/ttE6YHDkHjT2v0UqqSxQ148+eGfc81TlRyZ+QjwAVFzN2Uy7FMLBqMaSTpUtt9XfzkcDl5v5/iU3MMiqAYQYEZrQvrCqRN68uNFhw6xyldzUmdCRUA0PQ2D+RxTiR1HBwICzJMQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765293403; c=relaxed/simple;
	bh=rgblbkO7U0NEFrQ/P6yZVtMxHgbgDSj8uUqm/ZcEgJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j5XkcTMJI39hTxIw3xQnDVXF5FHbmrUg2EL1ng2x3TXmFIhb300eAMh9i6cVfJTbJ34ZpsBx77tJ0uzprIbK7uI4qutYIikEJJJ5glB8gsbfGfH7jAtenqBJIwwBA0IvWfCEtM+E6Axk8CodN76tsA/JzuB7es6YoDUzXdZ8hfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so6159445b3a.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Dec 2025 07:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765293401; x=1765898201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtJT7KFDWenu5lWNr0S7Xd8igjHFN5TA0NP45P0ZPX0=;
        b=Gq4L8jp6OYHHOytgEay1zOqUnOler5kMas3/FQ6pqX8QTa8lAA3/RH2bn+VneTZney
         etLevRv49l9frj+vF3oJmnVEumhiwZjBCF/DV43f+SAsRADaeRykoLu5fU2e7SZcXKUL
         Ql8t3S4BqigsANzJ9eNEzzrgPNCGbvlW1uQGUHlNloFkZOwWmz+/GDuFtsXd7W65ILGp
         vjVK+UkdbUOlzBZ2CzIAyrsNG3Xay7VOg8xrsiVJ8kHd5aJsb/2uxvmJFMh9K38ABvy/
         qgH6zu4WU02W6DU32gGb86I5Z9i9w51X6iFy5i2RGUZ0n9pky7SlecSOm/SyLkpCJtjz
         /eQA==
X-Gm-Message-State: AOJu0YxCkw/S0MtZZA6wwwfntKDHRc96cl3YI882SQ/VbcYQgJyUuLjJ
	stWttKHwAiswT1XOsn7tg/SsvHRrIG593fswcdhGY++NL0jmA/lf5oxP
X-Gm-Gg: ASbGncu74BPehxTgvbFlv5EXXF28/4xf0FRD68TB/e+pyljYyfDkhbqBWXruqEgcpgg
	fnhpyV/S4/V916aVr38Can5nxtBCYNXHZhJ0xMdacCEUK+XQB4Ie5qUeNWGBbgbEeaQkCUFybLj
	N3STLbL4n4j/LXSKN6pk3szSDHuguuugPSKS+Rx8xMr6yCNAqg0SrFxeqtWV9x+f4KsJMuk0+7z
	Be9g8k2xvMhUsK6mCD9Ie8Z7uHuZUuSYiUjR9EmO1Z2qzmwb16rD6mZrXuOmdKKOAsrjbxfCLvV
	9ERTLGmN5RTYvlDS22CsrtSt1EOuBOeWpeHR5S0YW12f3MTkBj2zQ3X9BWkC83qX/patEavs7kP
	etd1sLyurOP5T7OcLQz9Wah2om7jNFSgJReJLxqazRJ3fNL40CNISza0vj9Yt/dlluhNaVdlCVn
	azDhSWRRe8L7ruIXTatBvZCgLGLtO+IGA8
X-Google-Smtp-Source: AGHT+IF+R9FKj4Xs1iZJf9bvEg7/YYB2XkTL5vFHVR56z8dGm3EMNinpCSzcXu53Nwt3r7/RVdP4rA==
X-Received: by 2002:a05:6a00:12cb:b0:7e8:4433:8fb9 with SMTP id d2e1a72fcca58-7e8c6fa1c09mr8244813b3a.65.1765293400326;
        Tue, 09 Dec 2025 07:16:40 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2aedb474fsm16538952b3a.52.2025.12.09.07.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:16:39 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: ojeda@kernel.org,
	linux@armlinux.org.uk
Cc: rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH 0/2] rust: add AMBA bus support
Date: Tue,  9 Dec 2025 23:16:14 +0800
Message-ID: <20251209151616.2491085-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds AMBA (Advanced Microcontroller Bus Architecture) bus
support to the Rust for Linux kernel.

The implementation follows the same patterns as existing Rust bus abstractions
(i2c, platform, etc.) and provides:

1. Safe Rust abstractions for AMBA devices and drivers
2. Device ID table support with compile-time type checking
3. Resource management (memory and IRQ) for AMBA devices
4. Integration with the generic driver registration framework
5. A sample driver demonstrating the API usage

The first patch implements the core AMBA bus abstractions, including:
- DeviceId type for AMBA device identification
- Device wrapper providing safe access to AMBA device operations
- Driver trait that AMBA drivers must implement
- Adapter for driver registration
- Macros for device table and module declaration

The second patch adds a sample AMBA driver that demonstrates:
- How to define an AMBA device ID table
- How to implement the amba::Driver trait
- How to access device resources (memory and IRQ)
- How to use the module_amba_driver! macro

This enables developers to write AMBA drivers in Rust with memory safety
guarantees and a clean, idiomatic API.

Ke Sun (2):
  rust: amba: add AMBA bus abstractions
  rust: samples: add AMBA driver sample

 rust/bindings/bindings_helper.h  |   1 +
 rust/kernel/amba.rs              | 445 +++++++++++++++++++++++++++++++
 rust/kernel/lib.rs               |   2 +
 samples/rust/Kconfig             |  11 +
 samples/rust/Makefile            |   1 +
 samples/rust/rust_driver_amba.rs |  86 ++++++
 6 files changed, 546 insertions(+)
 create mode 100644 rust/kernel/amba.rs
 create mode 100644 samples/rust/rust_driver_amba.rs

-- 
2.43.0

