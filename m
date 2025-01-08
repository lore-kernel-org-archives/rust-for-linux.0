Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8EA1F76CD;
	Wed,  8 Jan 2025 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736339315; cv=none; b=CpSHdvE8GPzSQR4KVbK1M+7DmVLTGRAbwWpAVfz1HiK/ObHzMRvHrNvk12CeIujgiIoZ6Ojx9m435b8s6FikcLfdVy0M6WE0PpWck16uWOL5oPKzm1RcPtq+WG66hrDUqbbkMhLR9w+h6fkBboGQSclTiU4JAsFjduFolEHbFmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736339315; c=relaxed/simple;
	bh=UDKti+aJ77n6pROea8SeqbYgxfEhmJrwitmmnfWuZNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r8pke/yaxfy1sD+3oF8KvyOGcW7wxjef3vsJfmkvKDnVMEOTuUuEhoMJ+mYS2J8qe7SfPLhTaT8SLLT3xdynAeRXdFH83h9gQWBT6mfyBcxkZgyLPnC9Y5VisMWUNEQRrHKTK1jkGQZ/FmrlVnHtww2OWoLHwPRNBZpLP3y82N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrDGMvec; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrDGMvec"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3002c324e7eso186367011fa.3;
        Wed, 08 Jan 2025 04:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736339311; x=1736944111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SEOnBQPSx3LETN+z4pi6jcbb5PWSNzvQx1cogr085Nw=;
        b=ZrDGMvec/rIuzYLMWeXLAt8RGU5+qrj2X53OeYspv1yKf7/Cn5wAo87DrpkhKOi01Z
         /O4Jl26LeJKs0p2QSvF8Dc7VLbkYb2rdW+ohJSygAqTO/swRsu/2MC6y8Py6I6piGT5b
         ANAAAkTT3rB8Uhw1AAAhhasEwRDLbt/llhXtrnoPaJU4/0VMtCbmeBkuGmcbwHz7Ah6o
         hxoGe2wkObQnJ5rw5VSoA5wkMEnya0mpWJ2zFZXr9dntJeGQ/0IrcKMjmnyFRkZ2N9C9
         DRudtR2qDQIOlcHYnlQznTMhHaKdXTdA/GsTvHxblCg/mLNWw4tqW/4snE26IsNPkz2z
         6BFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736339311; x=1736944111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEOnBQPSx3LETN+z4pi6jcbb5PWSNzvQx1cogr085Nw=;
        b=TzeQZiD4M2LqFB64cK42i8yiD3aYJfZIZ0+f9PWeo00g+q65A5IJMkZ4uWYRBmvnhl
         x2iceQRIjH6ASJSf5YsqmjC7MpwwiLTW8TzxUW7TWOQSkSIWLEdvw7SctGT/M7K9pZNO
         38Oe1YFL4zI/66VFufXHmqDb40aptoHXeLzNv1pxKbBvJunsiT6m1PJ04AK30hEjZNsA
         Id42qbLW6S8XR2Pe7OcZqA3YX4WyA2wysqfPSedS9sJBkfEAR/SdXIWtLtZDKEWP4IXT
         YhFMMLIlUz9ZRk1Ks0WtObxIsSE+KxRVkIXOR7KHaiviCxCH5RNM5PHZ+zMbQPmlw93w
         sHzg==
X-Forwarded-Encrypted: i=1; AJvYcCUAlpsowfRWITKWmbvRUG+KkYSuQuYMW6oZPa0R2/zuinP9EMT9UqG53yIyBrsR17lXXTaVSPnnfi4Wgz4=@vger.kernel.org, AJvYcCVtXXhE3xZNfv5BnX4WrKsgmp5WhXX7S1d7VCVLZMRov+6i2HjrwaYc3mPEGfQuE/dIZFGsvF2zlHDEbDd9c2g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Lcf87GIik+s9ms5J+Wt366Of2vo3GneXO+L48/gFDLCShJ+G
	ssfDNK4erDg2mctCJHcsRvbZ2JKg3D4fg6rCINtQiLhjOWcIMK4D
X-Gm-Gg: ASbGncvl8id9Svu4/fzk2Q/S3pq/HZqUQcSxLeuoJFmIgZf21odeQQspxzG6B6MEh/d
	pPzKhLYvVOWfREbQeYaiIDB8Z1XIBA9UUcG/GXIKRq7+380Km1HIDImqwsxenE+wvNWb45Pdkky
	qmQDMPLpfI4lqZeipvoUhOtpdTkUXbpIZlQGAux++bzh6/td3OIab1UEOqo/5XlaNzFljqPg7sy
	xW4VE8K/jkfR0z++JHe666W3M4zBVTi/F4lV+d1Yznzc9vaoSZ5ZmKEXvHelz2qylykQ2Q9eDeX
	dU/Q2SFGM+js7s43lIv6iiWJfUY=
X-Google-Smtp-Source: AGHT+IETg2TD1LvGCWsVjL1D6PNdVra3sYgydESLEO7ovogJqf6P6dXzxr8sp8sYxcrpAzWw7Xmw9g==
X-Received: by 2002:a05:651c:2113:b0:302:4130:e0c8 with SMTP id 38308e7fff4ca-305f453e565mr6651561fa.9.1736339311205;
        Wed, 08 Jan 2025 04:28:31 -0800 (PST)
Received: from abj-NUC9VXQNX.. (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b082db8sm61183911fa.99.2025.01.08.04.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:28:29 -0800 (PST)
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
Subject: [PATCH v8 0/2] Add dma coherent allocator abstraction
Date: Wed,  8 Jan 2025 14:27:22 +0200
Message-ID: <20250108122825.136021-1-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v7:
- Remove cpu_buf() and cpu_buf_mut() as exporting a r/w interface via
  a slice is undefined behaviour due to slice's requirement that the
  underlying pointer should not be modified (Alice Ryhl, Robin Murphy).
- Reintroduce r/w helpers instead which includes proper safety
  invariants (Daniel Almeida).
- Link to v7: https://lore.kernel.org/lkml/20241210221603.3174929-1-abdiel.janulgue@gmail.com/

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

Abdiel Janulgue (2):
  rust: error: Add EOVERFLOW
  rust: add dma coherent allocator abstraction.

 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/dma.rs              | 271 ++++++++++++++++++++++++++++++++
 rust/kernel/error.rs            |   1 +
 rust/kernel/lib.rs              |   1 +
 4 files changed, 274 insertions(+)
 create mode 100644 rust/kernel/dma.rs


base-commit: 0c5928deada15a8d075516e6e0d9ee19011bb000
-- 
2.43.0

