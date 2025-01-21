Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB3819E7D3;
	Tue, 21 Jan 2025 19:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737486887; cv=none; b=izWi7xvV3biLEZfKqCJ+Fayj2TYTfmPzRqkTAp0sKa6Zvio3sTRnkxhSH3zKe0YaLDwk1GcMeNOoDapZhDL0bqfj4zD/+04Zc6m6OrNau+x8RrEL/yC+718lIidb/IAO5kCThmtNA+OaT+DpyPFzkgQLjGjg0UXmL4lzhOADuh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737486887; c=relaxed/simple;
	bh=ivK18ECx3I8NGnpFSJQ6naIpLcVaOg0alogpoLWYwoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=szSVIF5lBXxuwheNhftCqLCwjNep197A0o5Ia3UTHAl7grXA6ZCQCfHTnMeicHIfqmpTqouywR5MabwISqY4hUKWJu8rKWkKzvwmroj6ISxkKfnf0u5nH0sdmA5d2Kg11wV43pnvM0Mq4XoRmmmQgsSkLmebLVkHK8m/0qZElFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmHedrXp; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmHedrXp"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-540201cfedbso5683417e87.3;
        Tue, 21 Jan 2025 11:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737486884; x=1738091684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8bg61QWb1i91VY9CIQBaPYXkWR4SssGW1KgIQsxOXJU=;
        b=BmHedrXpMYr1xAwNU2QJlAmfbmJv3i+m69X92jFA4a8MuisWBOzti9oZO7U4oxN8V+
         1KcYgJWhXw3x4kK3+T5mAL3CiV3Fl2qThJL5P9jkGdna7rfRUhNt0EPofdYGl5exMcHS
         EK0ZRdZlUWqQiz6QvNoJnfQLwdDFEnsO1hAegdtR3dYhM2uRq8gn5+OGZioUmSORAKX+
         X8odVt9ysCg+VehP9ytmOZ9Y+7SkVpH2MSZQ5mbiTpmHYRhE4ahSVYx7kytVc2u98+nv
         jg88DNrEO8AaT5bWcfg/uYWpe33or1cKmm/wNO4wDbvKXLMoEPoKTBnvMOVi6QoFb+Lj
         bi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737486884; x=1738091684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bg61QWb1i91VY9CIQBaPYXkWR4SssGW1KgIQsxOXJU=;
        b=jPq3qXUSNlc7HlQTPFWJ4ZMspO3L1CW1uqtHGyLM/eKoJBkPevdKmdA4tsMamoXJfF
         IOSsmJhv1+aP7JKKXAEU00mcdRaweVr5UnJfvdxqDkWtQBUR6j+yiMQQMOWMi3Khe/WT
         BMadv6SupRM4ato4i/UFvTeafl8bdBguUxJsY8KhWbP/tZKBCUib+2qbELxZ7fbG34BZ
         lygLJnDM50WHNwn2appBoBd+roYbYqEMS3cvbmsz1kPJ71PpmGu2k2RvxJfdU3Z13bf9
         bvTNJAYx2UFoGsNJcTZJRcyWllo1uIMUM3clIpnoVGxUal+cZHbVTtMLX7gL723fBCyS
         V1yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCgP2VqZk156Hm15dQBUP0EELrrsbJ0ook5HM1SdPB4WDbIAA0Sr9JXCrkHvSkPRjGbc/6TH6i1Py8B/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7mzXWSw/uUAKRxHEHV6x84+Oq7X7PwU5WBvZbWLSWC2gh0uCs
	HBD15rk8qS8hdEzuwxq/gIUbyUevyprTDjO4iyH/C0CNy7gYaw6C/bz0gw==
X-Gm-Gg: ASbGncsanIlucVVQexe+ixaGkNhhDLZZDL5jA2o/K5TE0qVgqMLa9N0nLddDdxOrgTs
	D+Iccc5ahA9jQvkHDcsWpuXK+i3hjNI0ky7sWsn2X86SQ2R/w7N0jMq4cvJEenX2L2LpVv1gTaX
	MBKXiROSni2i+gIqUHUICudFV99fIWVe68KzMRssEIXOtxVaBlkFSd80eMBv1voQ7PO5+4dbtED
	XXqwlHrNAUfuqfoZkogDRnmjt0tBgQg6rWCibc6ZOjTcyp686q/ajdmnDeWXVQsHHIpeDmlymBg
	7tQ6sQKo49EDJopi1BsWPv9v6FiOdRQKmYGPEU7M
X-Google-Smtp-Source: AGHT+IFZvLqKPUFbTeA9XOCsPrcEmevG/Vm8PIvqM4oZNloBE0Smt6VyQz29eF6NVmKLgg6EZpVcTA==
X-Received: by 2002:a19:e054:0:b0:543:baca:6f1b with SMTP id 2adb3069b0e04-543baca70d7mr450871e87.44.1737486883632;
        Tue, 21 Jan 2025 11:14:43 -0800 (PST)
Received: from abj-NUC9VXQNX.. (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543bb6bf5b1sm56786e87.118.2025.01.21.11.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 11:14:42 -0800 (PST)
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
Subject: [PATCH v10 0/3] Add dma coherent allocator abstraction
Date: Tue, 21 Jan 2025 21:14:01 +0200
Message-ID: <20250121191432.1178734-1-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v9:
- Use ARef<Device> in the constructor arguments, docs clarification avoid
  manually dropping the refcount for the device in into_parts(), use
  add() instead of wrapping_add() in the pointer arithmetic for performance
  (Alice Ryhl).
- Link to v9: https://lore.kernel.org/all/20250121084756.1051758-1-abdiel.janulgue@gmail.com/

Changes since v8:
- Add MAINTAINERS entry
- Fix build issues due to switch from core::ffi to crate:ffi in bindgen.
- Ensure the wrapped attribute is non-pub in struct Attrs, declare it 
  #[repr(transparent)] as well (Daniel Sedlak)

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
 rust/kernel/dma.rs              | 281 ++++++++++++++++++++++++++++++++
 rust/kernel/error.rs            |   1 +
 rust/kernel/lib.rs              |   1 +
 5 files changed, 294 insertions(+)
 create mode 100644 rust/kernel/dma.rs


base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
-- 
2.43.0

