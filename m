Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6547B2773D8
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Sep 2025 23:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757878; cv=none; b=YASCE/DSrROEWV8xZ6cnWGoJiwuUjYqEoxt95NcQ3HbLkVlkqFO7lzMx9EV2uMhDBX5hSq8ukOI9BljqBoviI6kzoxIOEZAfaM6trN8AoyH+ju1dxnOOv/f0f9Cp6Qm+2l8Wl3eGOhf5Kv1bNTY7xIMr3UDvLvIWzRKNMJDu2+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757878; c=relaxed/simple;
	bh=bywdX0nhtg4X6nDuC8jT0AaJN0Y+9epl5eMqmA1AZnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZpMsFSMlkjx2gamq6sRNNecIimwookDnI79HCYUdkYcIOxRLxRx/oO89LoW62CYrH/1ZkkD9FZiDtitNfeyQYKne0Je73fjcIREGU/A4G9VdsSRQVDo70UGvwfeVwUTZn8TR+EU0Dy15F0INvXxjjoE4vK2ZhYzXe6KvUB4oI5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YD4zubMq; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YD4zubMq"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-267fa729a63so612905ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Sep 2025 16:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758757877; x=1759362677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BcrUofB0dKCSsQ7o/jnuwGUrQDlTZKMr766pxf4U7ew=;
        b=YD4zubMqj4y/2E16KpijgN6eCpK8QBLzKiSZYb1fSsk6qzhncDbT/rbQdAJv+HOm85
         0/EEG/xP51Q03P/pirH8g/rLFPU8KsF+CFD2CsSA59vkDNk5wIu+lwgs66KUqVGPtIr7
         OsJ+ptI45sdzVdEIP8ZpuZO+AdsHMwhmVOkbIw4EvAR/9ts7YZ0mRepPO+QeZbLz/jVN
         eXec79exBuyuAAdCFIB0SjUPNK4yS294WiF0AsQvacrIJOttlPT2+xJM+UYK7NO1tgAe
         dpOY9O7hehsil3PU2C+mZb80OXn2smkB8Z+9nqiZFLOag+5kiSEuoN9juzL8xPDrRXL9
         OH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757877; x=1759362677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BcrUofB0dKCSsQ7o/jnuwGUrQDlTZKMr766pxf4U7ew=;
        b=KV3xL6bG1ji4rHJDqmJC7GUEjWK42SEZQ3BbS+qwjJcr3TmQRsdu9MKMM6+1rq0LLn
         IKED2UpeSLoYqGqV+Neys5DG6xYCFxcEwCoVlfa6is+hMwFdJGc5xZ/CYwl4O6meeryW
         Rryf61qUSdJIkqnkkrNrp07ij+W3yWN/hzgC3NrTUmpDiD2pbPhlBOM+XWulxiqYSrKH
         QiA5EG13jrNeoshMOMw4gTIwLQaT/C3my1qQAwZ0ZOvfqNIUTACeZiFGdCRFxBJCayBM
         So3zigWrLsRPEl3gqbR9xzdfNk3Q3xD29S1qJ1I4aOCfPePfkrrtnFnHrHvcmPdfpYve
         5QJw==
X-Forwarded-Encrypted: i=1; AJvYcCV5a4zxqJ6pC/JQeVyH8WqDjWV0uM2HBuRzvVt5dynhEpa2W9V3txm5iMc568EoEMs333F3oVXNynqi9gZCyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSDXu2HZ56wVNg4iiZPoZvJeZNci9oBmL7Qr03J3UHYVZ88M/a
	8LEIt0TtDl48i7ACjqaO8WMaIcuiI7h45sd9dH9R+FHzXXv5dipYoUzx
X-Gm-Gg: ASbGncszQmgymuaBFAbnTRTnsg7WQucFuZz/2fJs5GLLudhiQNjerQ7yAe7s1CAl99U
	44sHzVRl7g78VFQJAq876t07veFSL8PAWOQQnnYVcf+bL5Ycwd6h+EAjiTeoT2aHhnxicMpMw7+
	zfryTt/dPQ2bzfNkuNVQGMU978kL6zuM4iY5O9eiJaPsHaVQ7PRd2u7hsktFl71EHqMh/czzXQn
	KYp2s0tN4zXjBGtQzdqDNxRINGc3vEW0h/zMwS1puJa+UEoK+mv3xnmN2L/1ZUUvBd4c35p3QC/
	jdQF8sgjwGWTfr4e/z8MziV99eLNrKEW3tL032v/r8SvfJ/TiuUdV9ELagk1vOZ6d2+wMrwgaTD
	hCvPDlgoAhZ2eOTZBWSY=
X-Google-Smtp-Source: AGHT+IF5/ZHYCLfHMWUKUiXIO0yoi5GrlItBDfQAqCKn6V4VH3FNSKCX4czQoTpWgFwCnc41W0qgng==
X-Received: by 2002:a17:902:e812:b0:266:914a:2e7a with SMTP id d9443c01a7336-27ed4a7e84amr9318595ad.6.1758757876373;
        Wed, 24 Sep 2025 16:51:16 -0700 (PDT)
Received: from localhost ([104.249.174.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69bc273sm4296695ad.124.2025.09.24.16.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:51:15 -0700 (PDT)
From: Ben Guo <benx.guo@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org
Cc: hust-os-kernel-patches@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] docs/zh_CN: Update Rust index translation and add reference label
Date: Wed, 24 Sep 2025 23:51:12 +0000
Message-ID: <20250924235114.209967-1-benx.guo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the translated rust/index.rst with new contents,
and add a reference label in rust/general-information.rst so
that index.rst can link to it properly.

Fixes in rust/index.rst:
- Fixed broken quick-start.rst cross-reference

Update the translation through commit d0b343605f1b
("kernel-docs: Add new section for Rust learning materials")

Signed-off-by: Ben Guo <benx.guo@gmail.com>
---
 .../zh_CN/rust/general-information.rst        |  1 +
 .../translations/zh_CN/rust/index.rst         | 32 ++++++++++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/rust/general-information.rst b/Documentation/translations/zh_CN/rust/general-information.rst
index 251f6ee2bb44..9b5e37e13f38 100644
--- a/Documentation/translations/zh_CN/rust/general-information.rst
+++ b/Documentation/translations/zh_CN/rust/general-information.rst
@@ -13,6 +13,7 @@
 
 本文档包含了在内核中使用Rust支持时需要了解的有用信息。
 
+.. _rust_code_documentation_zh_cn:
 
 代码文档
 --------
diff --git a/Documentation/translations/zh_CN/rust/index.rst b/Documentation/translations/zh_CN/rust/index.rst
index b01f887e7167..10413b0c17c0 100644
--- a/Documentation/translations/zh_CN/rust/index.rst
+++ b/Documentation/translations/zh_CN/rust/index.rst
@@ -10,7 +10,35 @@
 Rust
 ====
 
-与内核中的Rust有关的文档。若要开始在内核中使用Rust，请阅读quick-start.rst指南。
+与内核中的Rust有关的文档。若要开始在内核中使用Rust，请阅读 quick-start.rst 指南。
+
+Rust 实验
+---------
+Rust 支持在 v6.1 版本中合并到主线，以帮助确定 Rust 作为一种语言是否适合内核，
+即是否值得进行权衡。
+
+目前，Rust 支持主要面向对 Rust 支持感兴趣的内核开发人员和维护者，
+以便他们可以开始处理抽象和驱动程序，并帮助开发基础设施和工具。
+
+如果您是终端用户，请注意，目前没有适合或旨在生产使用的内置驱动程序或模块，
+并且 Rust 支持仍处于开发/实验阶段，尤其是对于特定内核配置。
+
+代码文档
+--------
+
+给定一个内核配置，内核可能会生成 Rust 代码文档，即由 ``rustdoc`` 工具呈现的 HTML。
+
+.. only:: rustdoc and html
+
+   该内核文档使用 `Rust 代码文档 <rustdoc/kernel/index.html>`_ 构建。
+
+.. only:: not rustdoc and html
+
+   该内核文档不使用 Rust 代码文档构建。
+
+预生成版本提供在：https://rust.docs.kernel.org。
+
+请参阅 :ref:`代码文档 <rust_code_documentation_zh_cn>` 部分以获取更多详细信息。
 
 .. toctree::
     :maxdepth: 1
@@ -20,6 +48,8 @@ Rust
     coding-guidelines
     arch-support
 
+你还可以在 :doc:`../../../process/kernel-docs` 中找到 Rust 的学习材料。
+
 .. only::  subproject and html
 
    Indices
-- 
2.43.0

