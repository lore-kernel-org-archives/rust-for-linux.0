Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4011C6F76
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Oct 2024 12:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728565031; cv=none; b=OSpjgyMS0Gib+cpojXu7Dyrvq4jwz8tIS0ufp0JupNpWiN2DnrhFIDi0KiumCRU5fcPH8sulsgGjgY5BOLmSSiHHhw6UwSwSO/650gmVyarwYI2IBaqCrimYDqb/P9skpEEPH0UwWPe9QRWYUANWRFhos3NcHUyMFOfVnyJ5v7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728565031; c=relaxed/simple;
	bh=OblR90xVpQ3uxMqRXP8BWxnDSHKdVQMnE4obNvo1stQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VdQYtzS/lY1Yhehcs+lZCCkowx3h/kdwcn4Gb6In6GZjWP23doPQXgACyr7nPjBmTgWFCbQdXPlgrS4k/0LrhLQchv9CaDg/H7bnnCdV5Tg9jqA4lYWnQWXz/P8v4HYGAh/GsG2yb6b5CrHzm3bObfpWfNb/Qi9WpI4mDhltlBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KqhiexEM; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KqhiexEM"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e2b049b64aso13717007b3.3
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Oct 2024 05:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728565029; x=1729169829; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DOhG2lII0b1XV2Pvd8Pm4xtK1qOLGqdV7w9S0Zd2Ryk=;
        b=KqhiexEMuln/ajTVAghK2rJeTfuTklhSbDRCh2YbtMCcExf4x6nPk4B67s46rnAPG0
         dcT0B3i/NanAIo6mICAhkb8Dc6tw2CUP9S5XzuGKSY6TLClKCH363DpxisP4sD9UXz3m
         XzxlfpPhm7XXLYs0jSTCJjkbRo290+ZrKbMfvTGS4Qm2omkGBOuEzf4xn4reD0u4azY8
         EztYSj5vFib9J7M1u5IKxIF91T6Is8dwZjahI5n7Cpw+eQsNjYdsRRPN5OO/twcZc7DQ
         nC4h6PNPoPSjjsuuLh4SAv8wZ5izfRglGOnzAIMrTNsv4xr/xevzWMShnvmFYmJ859u8
         VnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728565029; x=1729169829;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DOhG2lII0b1XV2Pvd8Pm4xtK1qOLGqdV7w9S0Zd2Ryk=;
        b=DxO6uKIvorojDQKgEZoL6cAWyBy630IEvz69ve2zeGmE2tTSUYr50JkdDowCFytaco
         5fOOve+8ap60K3iJuMsDcQ4txHmoIXed3sz7RHMmijceUD+C9fbQxgnUDd2y7GkSTCo7
         BX4+TMX1dz72Tot1bpsRkOpXL/KYm0LlH5YeIA8dLuyfAHJnopG5fiIYfLJhXs40dDzI
         JoyuBr772t0YayCkoErI4D1a6yAnioZRJdZwXtZTghMADbT7J56TwHznh5jaxgDlEEVb
         Z/mlZPrj4x6qgkXxn3j2QQT8JvRBRLPQQ3DZPBOkhn3ywdJjkNRlReriMic4OCAvjEu7
         oHRA==
X-Forwarded-Encrypted: i=1; AJvYcCX458gIRCX2BJdj/mnvyjnGyWeSPmqHMcpBrWwwqGYktzIYbLNSPAeDiPsIKCu37SOaKDs1v4mb6H82frm4Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCxPK+9I0MMmLzhANmBDQfdry8R+xrux70s6vNot/NCeNx0Evy
	I9RwjbRjkdOjqhlAlB1K61nfMblJu6if1U/lMmSiIq7qfYYSFNAsDZaZk94B2jK5TswIg6xIaYw
	dyJoB6LcPQOgexA==
X-Google-Smtp-Source: AGHT+IFnN4NiKROer/bhYUK3vmbJ0WzRy9Z6ly5mrAMMM7hZC0uCRREmQ6LL+Xht/BsVZC1c7cKNRgHPb8oUo5I=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a25:103:0:b0:e0b:af9b:fb79 with SMTP id
 3f1490d57ef6-e28fe346f12mr108404276.3.1728565029274; Thu, 10 Oct 2024
 05:57:09 -0700 (PDT)
Date: Thu, 10 Oct 2024 12:56:34 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAALPB2cC/2XOQW7DIBCF4atErEsFA9jQVe9RdTGGwUFqQmRXq
 FXku3ccL+rIyzfi+8VdzDQVmsXb6S4mamUu9cqjezmJeMbrSLIk3gIUWNWDke2CMnuldcghD8Y
 JfnmbKJefR+Xjk/e5zN91+n1Em16vz75pqaUBTA455Inex1rHL3qN9SLWQIM96jcEjHAw5AL0K
 Ro8IPOP+IMbMozS0EUdFeaE4YDsHsGGLCMVNPpeOY/WHJDbo25DbkVWaZ+VSwTDE1qW5Q+0caX QawEAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2391; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=OblR90xVpQ3uxMqRXP8BWxnDSHKdVQMnE4obNvo1stQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnB88XawLv1JPH9Yp7lgHZ3+4WXZQrNW3dTUC7J
 CsNSWB2nwOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZwfPFwAKCRAEWL7uWMY5
 RhFOD/9Wi46kNqF/PhA72INQt/WYgFCKYjm6ixQ4fxU4f/KfewJOEhjWEUPiWMxICagP/QfIdVP
 foJFdIjRtk6x+oidLD3IsU96jidqNV5kPw3jYU7vbwSyKNxFeZtdyu3HUXvI1dl/54i4Ku6N2q1
 PuoaHJ9ovsv/tO39bdAhhesIddykQ7dZRrJ6n7xuF+IGHc+7/2sUy7ssRB95TOKpJJeahbOz5xM
 sIi5Lg6NmU9OnpbkmM07C5ZxWQyk4aod8Wccmc7uz9Ue7fCM9yTpf/w79bmUIeNL7AtTsjwhNYb
 C4xJAbGKp0cY2Q3PRtQsJMZKozAk8HuSk17nT2RF5xNsIbQjpOC00jLxoQz66nZp84WY7Sk+vYq
 KvAjSU5lOavfic0QbdUeYvPinGMzoCWhJcnHBVibOBeiSJFv5dfyRBnmvs2BQ2kt9KLiuFaomK1
 Dol0yFuBmMN6LvCDD9WdCSMRkgjk4c3Sy2bbGGFQ7Yd/+tvQmboaz5WhmkppDb0MEKTaVnCv4KY
 VyY2DjbFM4DoDbTiI2g/AVKHrfI/5sDuw26chHxy8M6d+9veC0ofEMbMOD6veoFxrg4AL4Lkdgn
 fEKXjb8nEm3+CWHven01aTubTguh/3L4vdqONQhH3KiKCqE42Hd0tfaOcxZZvPFWPCuuNsThyg3 flADVaXqU1yl2aA==
X-Mailer: b4 0.13.0
Message-ID: <20241010-vma-v6-0-d89039b6f573@google.com>
Subject: [PATCH v6 0/2] Rust support for mm_struct, vm_area_struct, and mmap
 for miscdevice
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>
Content-Type: text/plain; charset="utf-8"

The first patch introduces mm_struct and vm_area_struct abstractions,
and the second patch uses them for miscdevice.

This updates the vm_area_struct support to use the approach we discussed
at LPC where there are three different types depending on the kind of
access you have to the vma. You either have read access, write access,
or you are initializing it. Each case allows a larger set of operations
on the vma.

This is based on top of char-misc-next for the base miscdevice
abstractions. That said, the first patch in the series also applies on
v6.12-rc2.

---
Changes in v6:
- Introduce VmArea{Ref,Mut,New} distinction.
- Add a second patchset for miscdevice.
- Rebase on char-misc-next (currently on v6.12-rc2).
- Link to v5: https://lore.kernel.org/r/20240806-vma-v5-1-04018f05de2b@google.com

Changes in v5:
- Rename VmArea::from_raw_vma to from_raw.
- Use Pin for mutable VmArea references.
- Go through `ARef::from` in `mmgrab_current`.
- Link to v4: https://lore.kernel.org/r/20240802-vma-v4-1-091a87058a43@google.com

Changes in v4:
- Pull out ARef::into_raw into a separate patch.
- Update invariants and struct documentation.
- Rename from_raw_mm to from_raw.
- Link to v3: https://lore.kernel.org/r/20240801-vma-v3-1-db6c1c0afda9@google.com

Changes in v3:
- Reorder entries in mm.rs.
- Use ARef for mmput_async helper.
- Clarify that VmArea requires you to hold the mmap read or write lock.
- Link to v2: https://lore.kernel.org/r/20240727-vma-v2-1-ab3e5927dc3a@google.com

Changes in v2:
- mm.rs is redesigned from scratch making use of AsRef
- Add notes about whether destructors may sleep
- Rename Area to VmArea
- Link to v1: https://lore.kernel.org/r/20240723-vma-v1-1-32ad5a0118ee@google.com

---
Alice Ryhl (2):
      rust: mm: add abstractions for mm_struct and vm_area_struct
      rust: miscdevice: add mmap support

 rust/helpers/helpers.c    |   1 +
 rust/helpers/mm.c         |  55 ++++++++
 rust/kernel/lib.rs        |   1 +
 rust/kernel/miscdevice.rs |  24 ++++
 rust/kernel/mm.rs         | 344 ++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/mm/virt.rs    | 264 +++++++++++++++++++++++++++++++++++
 6 files changed, 689 insertions(+)
---
base-commit: f893691e742688ae21ad597c5bba13bef54706cd
change-id: 20240723-vma-f80119f9fb35

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

