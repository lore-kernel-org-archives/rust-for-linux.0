Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CFA800
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 00:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763338273; cv=none; b=N2fUkU9KQrVczNYG2DLJdQqjx0vNiF/3PHsq0U0+3LZcwPYapTGmcpGondy9cUj6wgXJOzd8R8S54fmO+WrGS5cDeXag6F/vjbWAPoVWeZvtwr3pbK1H6n7P3br7GhYq5IspMjh5PD2tQ0G51MtzLaFky5Ajp5HEJRU1GAO3G6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763338273; c=relaxed/simple;
	bh=9KlhQB9Bg3dp+SIXbNNtPC93gWs2JQOB2CqC8oey8qk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mvg2Nw3SKFROFDb8YM43clfzCmoiiZGoDya5h3LHsnmjIpVWPd0CCWao+nRGCp0ppa/XVq6UxHINz6JSW7QyCp9u1ynCBHORCiEd6/LOW0WsGCL7JmcxCC3AvVmUz1iYUdfJYxAdgc4AQlVRERLkiOnA3O/HFelK+jvp7kI01UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8BdsUB9; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8BdsUB9"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-298039e00c2so47786695ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 16:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763338264; x=1763943064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XkZXQw9IuOfK9PGIM68foi7eIoRiv2WRJg1NynZs8Sw=;
        b=S8BdsUB9tfKztHcsi5iln5xqJ66lhaHGkPIkunjehQvodh8EDEIbm1/KXR++3L/gM3
         Agwe86txWIgM4Kk5x1lu9mI0+Gs9vrGgSXAJmvKQScWVZs8XGG2oCeSiQSHONEBf7mqc
         tVTDe9jgu26kfgv616XsUwYBneXUvu84tskBtRLul32ETYGxK/ulRAsXHZhf1XfnzlQb
         2nSplIjxwX5MbvhOJW/2nZmJCZ3ZQrqPdqQm3On89X+ZEIT3bTDK8TgiDqI3HCYUhEOt
         RaulGLEsZssdBOsRwZjdj4qL2ICj4JPa2EM0BPQsVUT8+d2g9dw1S9SXmTNwhehQvoPz
         DP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763338264; x=1763943064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkZXQw9IuOfK9PGIM68foi7eIoRiv2WRJg1NynZs8Sw=;
        b=DP9orPJ5CFYiuu3bJfT5YSTGzZBPAA91YMlPUYEo+uyfVaRiuUCkKf6yLUYckSFuYE
         jHf0nD7/cZggy9Tp18se6/VPDgF6vPd/8624CHo/bDrHKGivE/tQCjQU/OBPfVLqK3am
         SiYoUxyX5qCZypcAxuUxJeqjp1aCIm/+aAeEuzUpkAf1/JGR1+DmbpSPVcpeSKwMqzF/
         ueUKrJv0QiDXRua65z3rX847b6R49ztbqHP6TaEJ1vXpJcydrz82mDAU6urrAd9P2utx
         dYAG62sv/PdewDnqXsuYYXBJ9NEuGSeHwdVut7Vz62+RsD8veqU0sifbLKsDLDdpjdFd
         Vs+w==
X-Forwarded-Encrypted: i=1; AJvYcCX+nJ+FA/7rc9FcOvykOdkkhDMELxWtD3eyVm5o9hIIma8R+9eM6fEzt2QbfTTODt6qABpWBJsEZ4qXwoqvHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIZz37YHb9HVwZGx6clRzX2M858IdFCyVZSohbV3AAGmUsmBYY
	TT/E8FKSXEb3kQxOsjJjeKERkqN+p4euktndO4w5PkZgO/Ul6u+KO398
X-Gm-Gg: ASbGncugLDS5Oihe8CI9b9ucn7w8KJomkDP8srVqmx5FTSBXBqOrHNv9o/eX4RNUCXC
	z08ymWFEKDqIBmWGlffUYJRYUXquLf7XFql+jiVimfVa7e1b0mvPY7ZOeqJu5O9J7xlA8mdgv8M
	AFaAy+o2By5hW4pQA1AI6ephPmVw9JzJ4vzro2wM+wh9rmMAS9/1Xqxo/qiCFBjHk4mzP4nq2gt
	nKw1OFtp9rl8RLmUfbVwh9mdA6x11TRT4AmjaedENMk3+7ZttVfrUdiQUAH7J8AuyEZ2Y5KnuPV
	LAZYW7SRatJ/wH67J7R6uvSKFeGIPnnZwefYPSslHJYgbJSo/KBWtHlCtidLHG0aYWNfDh1yRUS
	FV8RwCYPqpXeKTfKW9V7Mr6xDKeRb09VuspghgF2ymlCIIha9rHaENW33gIvH7V5ZjW16AONXiz
	09/fjLe8UmwGEjTEnfpYiq22xE1ad06b+Kj8hEMYUG0E9nY4SdTcnUQdBIehU=
X-Google-Smtp-Source: AGHT+IExmV1PxoBQ996unP3RQr5/Hhyes1pVaWfXcJgHkAkeHyZDfpcnhrD1nurafVWtsAB6+5yPTQ==
X-Received: by 2002:a17:902:fc8e:b0:290:ac36:2ed6 with SMTP id d9443c01a7336-2986a6d6612mr118046715ad.14.1763338264497;
        Sun, 16 Nov 2025 16:11:04 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf0f8sm118374365ad.89.2025.11.16.16.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 16:11:03 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v2 0/4] rust: Add i8 and i16 atomic support
Date: Mon, 17 Nov 2025 09:10:31 +0900
Message-ID: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds Atomic<i8> and Atomic<i16> support; including
load/store(Relaxed) and load(Acquire)/store(Release) operations.

Relaxed operations are implemented in C's READ_ONCE() and
WRITE_ONCE() macros.

load(Acquire)/store(Release) use C's smp_load_acquire() and
smp_store_release() macros. They internally use the appropriate
architecture-specific instructions.

v2:
- Implement relaxed operations by using C's READ_ONCE/WRITE_ONCE
- Rename smp_load_acquire() and smp_store_release() helpers
- Simplify the macro to generate atomic methods
v1: https://lore.kernel.org/rust-for-linux/20251115050305.3872412-1-fujita.tomonori@gmail.com/

FUJITA Tomonori (4):
  rust: sync: Add i8/i16 atomic_load_acquire/atomic_store_release
    helpers
  rust: helpers: Add i8/i16 relaxed atomic helpers
  rust: sync: atomic: Add i8/i16 load and store support
  rust: sync: atomic: Add store_release/load_acquire tests

 rust/helpers/atomic_ext.c            | 44 +++++++++++++++++++++++++
 rust/helpers/helpers.c               |  1 +
 rust/kernel/sync/atomic/internal.rs  | 48 ++++++++++++++++++++++++++++
 rust/kernel/sync/atomic/predefine.rs | 24 +++++++++++++-
 4 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/atomic_ext.c


base-commit: 7a0892d2836e12cc61b6823f888629a3eb64e268
-- 
2.43.0

