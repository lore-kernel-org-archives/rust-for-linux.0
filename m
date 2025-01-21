Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717DF1B85C2;
	Tue, 21 Jan 2025 08:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737449319; cv=none; b=LSL6sqvb4KYQM8PuA93POiCtwTkBclRbphpx5aAHCxO1L6Bhr3Um5+9QIxa1e7N42PRqlHnd0AFCSLBWUlazzJRtVt1BsPqo45t1QRm+gwonJxFEcmsNb/ew7ukR2kSID9dUSc48zkmt1/hn69JAwYhK9qB8ZUoVBXuzwOuW3o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737449319; c=relaxed/simple;
	bh=9yw+tJyscIFBRqqCRDiUeLgp6QlDzsEW2TiCp6TkP8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q0AAqZM4bHqD/TY23xsyJ4ugY08nHEuwviKKaplhmmZMHhTrtrZF0srNBTTM+r/nqhNMrq9GdWw/5olzw65iStUvnJcq1RpMnWiP60aQko/B0IyacDS+yAEMEy+5VTZnnZ0t/aEmnRK96x9l/OJ1A6LJlM17OKL39ZmNqkIWhzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGD2z/DK; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGD2z/DK"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30227ccf803so44460891fa.2;
        Tue, 21 Jan 2025 00:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737449315; x=1738054115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V1IBBAaVfa6hiQTK+rLof3oKcml8F9zzRUwtu2WH63s=;
        b=lGD2z/DK6qOL62edmd4PWhk0l8aW44RDlcnrWUKvnLBM+QznAyRBqgC/PRwU2R8Zz/
         gUxdcSPcR7fdC+mJwm4X1OD6vAlkZXOFxBEQbBY1mEgogpvPQkauPD3Yn+pI17auVTyy
         Lfm19TXNycknitrCtMOhO8cxVAumj40SDXcWlsbtCtlHJRuYRpY83kOU9x4Isbzst7RW
         MSc5P5WM2jcMR3ON+MMjKrBbXuQsSy+5HFGOKezs5PnbPa48aXKqSTISRCBI1wfNreGk
         j1riGkoX4hySkLJUW6BKCCorLIuK3U8Iqqe/c5849YK3XcgeMMG3r9MKcRtsBo9StjR+
         6iSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737449315; x=1738054115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1IBBAaVfa6hiQTK+rLof3oKcml8F9zzRUwtu2WH63s=;
        b=VhevJtOYgMmxravLVsFTyrYUI68AM1ygD3ir2g6Ip+72KmdLfPPNcpjCVb6v2DvB7H
         APhleXUD6Admja8d/TUrPZ81KpPPwfe9WCWOEY7C3RWaNlOh8X/viTs8oQuF9MAz9Ymp
         QMKmqRhjIUu20jNc6UDhNkCWH3GkWHo3bdTdHd5XZWUvUR+nlFsQCaaCPiF5vR3INyQW
         /avNtNsMmbZIOa5mYEUH+IZZfANtWm25YwfOovwluy7a1FXiWI2aPxbL0K7Dy9A2f++R
         DlJX2M1rNhvck4laxwDQkY9htW6T6BSXL4/RBt8QnT0qyeN4XcBXwIzSKaVPcuBcIBTG
         D+rA==
X-Forwarded-Encrypted: i=1; AJvYcCUoci6JIACqMnXNS17/6uu5C9nONFNvL9iPB3LGGUN45POoEhB2C6y3Wuo4hxKqDm39XMtv88Z4b7BtY50=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMj7iYzAG0T44GpGuepWm8Q384BqiSZl+VF2TPmUnE1SZVPk/s
	VejGFyCWJ+cU6sTyXnrwzfZI2JB07d5YO3XVoiZJs+mB502Qnlf7ktbL5A==
X-Gm-Gg: ASbGncsKEm7TeM2lDo5oPa+ZaYgLmw6wyDE4TKN3R3L31+3Wqv0nXaopiiN4zFRdYon
	FfvepQNP7O+/zr5jk+onC7XmnyqdaOjn8Ubiu2/3/E0mJaOqS8tGivlgPn2sYwITqERFu7YBnZ4
	CHBC1524Ve2jrdvuIO7GPZsQRk7aPh7xlNUlSszB3NUTrEgEz+gtHOStW4s0wn/O5HeIVQUISDN
	q7DYffpJuaNAp+ifDr8/NCwG91VSvC73Pi7KAvHJp7Gm/fm1BGUXLYl4kzaLXBlVGPaX2QERhzx
	+3nqrrffQG8IS+WBpGNpjRmhblIek8BCUk3EzO2X
X-Google-Smtp-Source: AGHT+IFcDKuxLrpt/fzqSVNvr0kOtGLvjPWFjlocZAiJGOx4W6HVF21TJTzIPJJ/g6sQdX5jmV8FOw==
X-Received: by 2002:a2e:be06:0:b0:307:2bc6:5ec6 with SMTP id 38308e7fff4ca-3072cb3cf90mr56185001fa.36.1737449315144;
        Tue, 21 Jan 2025 00:48:35 -0800 (PST)
Received: from abj-NUC9VXQNX.. (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a4ed5c7sm21178651fa.82.2025.01.21.00.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 00:48:33 -0800 (PST)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: rust-for-linux@vger.kernel.org,
	daniel.almeida@collabora.com,
	dakr@kernel.org,
	robin.murphy@arm.com,
	daniel@sedlak.dev
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kernel@vger.kernel.org (open list),
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	airlied@redhat.com,
	iommu@lists.linux.dev (open list:DMA MAPPING HELPERS),
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [PATCH v9 0/3] Add dma coherent allocator abstraction
Date: Tue, 21 Jan 2025 10:47:44 +0200
Message-ID: <20250121084756.1051758-1-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v8:
- Add MAINTAINERS entry
- Fix build issues due to switch from core::ffi to crate:ffi in bindgen.
- Ensure the wrapped attribute is non-pub in struct Attrs, declare it 
  #[repr(transparent)] as well (Daniel Sedlak)
- Link to v8: https://lore.kernel.org/all/20250108122825.136021-1-abdiel.janulgue@gmail.com/

Changes since v7:
- Remove cpu_buf() and cpu_buf_mut() as exporting a r/w interface via
  a slice is undefined behaviour due to slice's requirement that the
  underlying pointer should not be modified (Alice Ryhl, Robin Murphy).
- Reintroduce r/w helpers instead which includes proper safety
  invariants (Daniel Almeida).

Changes since v6:
- Include the dma_attrs in the constructor, use alloc::Flags as inpiration

Changes since v5:
- Remove unnecessary lifetime annotation when returning the CPU buffer.

Changes since v4:
- Documentation and example fixes, use Markdown formatting (Miguel Ojeda).
- Discard read()/write() helpers to remove bound on Copy and fix overhead
  (Daniel Almeida).
- Improve error-handling in the constructor block (Andreas Hindborg).

Changes since v3:
- Reject ZST types by checking the type size in the constructor in
  addition to requiring FromBytes/AsBytes traits for the type (Alice Ryhl).

Changes since v2:
- Fixed missing header for generating the bindings.

Changes since v1:
- Fix missing info in commit log where EOVERFLOW is used.
- Restrict the dma coherent allocator to numeric types for now for valid
  behaviour (Daniel Almeida).
- Build slice dynamically.

Abdiel Janulgue (3):
  rust: error: Add EOVERFLOW
  rust: add dma coherent allocator abstraction.
  MAINTAINERS: add entry for Rust dma mapping helpers device driver API

 MAINTAINERS                     |  10 ++
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/dma.rs              | 272 ++++++++++++++++++++++++++++++++
 rust/kernel/error.rs            |   1 +
 rust/kernel/lib.rs              |   1 +
 5 files changed, 285 insertions(+)
 create mode 100644 rust/kernel/dma.rs


base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
-- 
2.43.0

