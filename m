Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7887521C163
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Nov 2025 16:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762620929; cv=none; b=MXiqIl9ckwEOoYBBFrbFVoJUSC8GEdUWq5Mcjuzk3keLVzqD72/MXLs/rvrQp8CBeyqfvvids+RK9/oMfAc8NQJAtF87mZzpSei57tDb/nJmTxoEau07thkuwHAjjYZ0OzVYVBPcp6PjN85UzDKztt0hGtP+NbF6tdWp1RhI5Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762620929; c=relaxed/simple;
	bh=jwOLrkoRqkPeOPBDl31nNUDJya3IFjX8AQzLP7gIsVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gpc6a6SHObn1dhjxEupuiisnPf1BSsqguzVFNGm0bzHMJaXSY2eC/rjjJkm2UnQCN6BKlfuEgDGjE/8jwQ5ibTRFtAyUNAxxIcl3m06dKhIjlvufj3HaD270QNHyrMpmineDOWCxmo8MiaGtYEyCk4sGI6h2XM2DAc8kHrAApi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9c3GHIv; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9c3GHIv"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso1427634b3a.0
        for <rust-for-linux@vger.kernel.org>; Sat, 08 Nov 2025 08:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762620928; x=1763225728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OKOkwqrhiH/tVcZkXWMht9KXzTRKBq9BT+UhE+2IcfE=;
        b=E9c3GHIvk8SZ+HjnOjFeg8NruJWIti36H1LyeMXHBunyu5D1zqGF0HauV7NkMg/7P2
         QIRkfc6uQZfRzHWWPhbLN9JIkPrjCwmuRZ9aVKssC51mb9jCDOm3Zz8gWWBG8LvkgJmz
         iuyPHGBmX84wx1MXBDUXwGks+J4MYgx5SbekjrpsRZjjqzWwVIeJZVjx+cUEkJClbZNF
         E7YnHazC8RU2kdJsQkqaZWB0LTwHubwPuX94O1cgghZH17o7bI15dBv2ZfRLRtGjVous
         2g2NtO4KtdfnPPbx5QZg2uoRj8jOAOvS+PqyoHnquYuQQImRbRNY/QrCSle4k8rZUTQH
         XXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762620928; x=1763225728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKOkwqrhiH/tVcZkXWMht9KXzTRKBq9BT+UhE+2IcfE=;
        b=W0R4KUmVrpSYzRi5VFO7MdCc5WP3xUZadcTnCciAIVycJ9LYIO9K/TuJ9VioGUFGTV
         slUyz6BFsRbSm1I0EWY3A2bZEVFPvdkW1fF1g394ExJ80ZdkUHLnvN8Ad/SK9nvwZXn0
         yjQFNYMiyfgpDufgVTrqhurtnUE9OxODHdXUMAyUGaZEXZPUBoepd47pX8WIh+WrVexV
         TLUmkay1TnpeQ+hDzCzLM5VQ9qH/NZSjiCQMWAN5QGguqj8obaXJOeRjrpsu5vOoHFgz
         v6gN4CH0tnUfr0dq/UqMXE04IUWWObMFY+eRIqPD1qhL0Wem0ugN3+0H09kjYsNBza1W
         VE/A==
X-Forwarded-Encrypted: i=1; AJvYcCWWvVA/sz19tU7FHR3R9vbYXg2fOUaMko5C1NFUFAJpI5mEyIEk7TKT17pNFlFnSkd0uRqvjIRs2JY9o3pVQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVs591/XY5PzAPtFG+yN9hyXwBTHMRy8V/rdYZE1i5h53rS/dy
	T07A0pJt51LUYKtsA35u6ZVOCHvrOAHkU7GoTOyIvgsyxAH/lmdG6cOX
X-Gm-Gg: ASbGncv0ZSAE7nyeqe9ZyL24CqPoe/aacNV+wMv++Y7/porWXHOdSzpXgU+aw33Pk4d
	iyQJIhGMPElckfY1eob2hFgdLNPljU2TlMU0o0OWyb/HAqJrwUga+DPiNko6VkK4YcLmfoQ4+Se
	KeW2W+zrHhYk/lCmBoDv+8SMLtrRyXpxF9xSf/LbEDwBdBDv1NstWKmHKbceaa3tpTZ6i1v1zQt
	GV6vcO9YLxmpK87tk/YGOGZ9ANFbt8C1EGnuj5bfcFP7aET9jfW9eg8pCCuopgz3QWYjLEuT3Bn
	LIjjBuBxsqt+ZRfRmepSRjNwkTShGzyV0zmmBqFKTuQ5ZcAxc3KpZGEkvmq3s6IxZwDMsSq1giv
	7mP30Ztg8ZmNDQvlGVjGUFA7XbPl7fA2OjVkxbOOxnCbQKSZMNtNRmez/P9DVziis+ruuKb7B5N
	lzOO0zWkcBRs9hjpi6po2hIz8ZW/cLqTp+6ypAis8=
X-Google-Smtp-Source: AGHT+IGBRSYfYejPzPUa6G3F+P0qHnfJt8Gfvd2VQxOhkvmZSJiF5/f7Vm00ZiSW3lNcWNhmhQeP/g==
X-Received: by 2002:a05:6a21:99a0:b0:349:c80b:d5e9 with SMTP id adf61e73a8af0-353a21e1f48mr4740818637.23.1762620927662;
        Sat, 08 Nov 2025 08:55:27 -0800 (PST)
Received: from localhost.localdomain ([119.127.199.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba901c3817csm8181254a12.30.2025.11.08.08.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 08:55:27 -0800 (PST)
From: Guangbo Cui <jckeep.cuiguangbo@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Guangbo Cui <jckeep.cuiguangbo@gmail.com>
Subject: [RFC PATCH v1 0/2] rust: pci: Introduce PCIe error handler support and sample usage
Date: Sat,  8 Nov 2025 16:55:09 +0000
Message-ID: <20251108165511.98546-1-jckeep.cuiguangbo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

This RFC patchset introduces basic PCIe Advanced Error Reporting (AER)
support for Rust PCI drivers and provides a simple example to demonstrate
it's usage.

The first patch adds the necessary infrastructure in the Rust PCI layer to
support device-specific PCI error handlers, mirroring the existing C
`struct pci_error_handlers` callbacks.

The second patch updates the Rust PCI sample driver to implement a set of
dummy error handlers. These callbacks simply print messages and return
predefined results, serving as a guide for future Rust PCI driver authors
who want to handle PCIe AER events safely.

This series is an RFC for discussion and not intended for merging yet.

Signed-off-by: Guangbo Cui <jckeep.cuiguangbo@gmail.com>
---

Guangbo Cui (2):
  rust: pci: add PCIe bus error handler support
  sample: rust: pci: implement dummy error handlers to demonstrate usage

 rust/kernel/pci.rs                    |  11 ++
 rust/kernel/pci/err.rs                | 273 ++++++++++++++++++++++++++
 samples/rust/rust_dma.rs              |   1 +
 samples/rust/rust_driver_auxiliary.rs |   2 +
 samples/rust/rust_driver_pci.rs       |  47 ++++-
 5 files changed, 333 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/pci/err.rs

-- 
2.43.0

