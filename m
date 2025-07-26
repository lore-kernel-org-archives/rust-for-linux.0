Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C90F1B4248
	for <rust-for-linux@vger.kernel.org>; Sat, 26 Jul 2025 18:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753554967; cv=none; b=aVuFAOPkGrRHK7f7UURjG6pu2iViELxLbn4l+WjeYYRq3rtZXmpOMz2imx6dQ+KVIZAMGfPTGw0HGqcjaDXmcVaVvko4bKeRRdvd80ta6P33Lhaca6DOsqYjn/lrM2Mckdw9UbjtHF1dZkYBbTT5d09qZcG+c2qgy0lO+H3Bk+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753554967; c=relaxed/simple;
	bh=1c6GV9bjG3BWxqcKocpW6fz62cs0Ni+OBYMNP4pw59w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Z8KkE1H5WOc1OM4VKFqo5Ieu/B+VWNmCrXt41k4TwGlEYl7VWGNyKbcKD1bByt1eLbB8Z7H83ZpFSRmVKFXuq8QTqo6t8hUT8BKRJH7RUHtaeu8UbrFJyUg3N2u2n2nWWbPemBVbYm0socgBLsh6Ox9JxB6lSt7hm4tpjKPZQgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fyulv0uY; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fyulv0uY"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-748fe69a7baso2840163b3a.3
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Jul 2025 11:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753554965; x=1754159765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gazh6tcQ9w90L/jQB1ckIBFFEKclZCFtRbHi0RY4a+k=;
        b=Fyulv0uYT27MDok4T7kdzHZdI0C+EbNxjmDpEDlmIY/CxlVnMvZmT1B5eX4lfEoyEK
         vtMhyDfF4BI2PGJKUEHj0TXWZOVsOdhZrFjHsgn+O9vmPA7MKA7c5WIV60xIdQgklLyx
         ZhaflLwjaKthX3NwPQzSOhuEE4LmpPRTeGuVTm0AiR1TLn/zQDKwqVLOyb9GfNWsge99
         K0U8ZA2IIokTG4enc6UgHYK9pOg3TCnu+eC6k9S6z1ZWqOA6iXFbB+JltZWXDEUBYCWl
         KpPKBQs4Js/kKJIAEbL2t+gNDjTrhRr5keD2WQlwrqxO9Vw5IQmnh3up0kVdXmEi2y+x
         IKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753554965; x=1754159765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gazh6tcQ9w90L/jQB1ckIBFFEKclZCFtRbHi0RY4a+k=;
        b=wo45uBqShE4n4U2ShQhGpCsrMvnfGtQHDKVuCoMHq7F4Hsheez50zw7/1KA7O8jB8B
         rwvoqg7t5VcMqDtNnnpjpWTuYrXAqGs+CUmYK0rsJDTKEP9QnLryPp9AmRsWusTfTOiS
         0jfixnFP1CzmMlQV9i9gxRFPEGo/0yZ7lYJ47o3wdDwyHQj/0LhYgmUUGcTR+5HiITde
         QFFqWhq/+PxyimTmNo2KZuti3ib+0l30qB3fN1VLDgeyhIfK/+2AnOYeiJc7S11N/3IP
         ltBIFTEcp23hEvwFEyUIrqdSRPVu5TJcyoq3omNbCaJYjmfrjrMBBUnw9sfiSwX62i1a
         gArw==
X-Forwarded-Encrypted: i=1; AJvYcCUL80VdCW+oDvEWBKv0b2TzmvbUNrUOPU8OuedqYcIYYZMXtF6aJmDn1vbBGJ/4sr7njbXOUtP7QvDSkluALw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxH+sjTsPZunKowVtkEz1Z0XnSti2uu2vwQnSA7XWUOLYeeKrPf
	xA5k9ZzDn2wq7Z30lkvF2JrUjJCRbLQI9slVdIjsH9DIErmFqPrOoQaB
X-Gm-Gg: ASbGncupuV+JZVq17qYW0CW0f/5kjkv1xOF49fOKi5LFhYtzi1hePyRg5r+RfYib8zY
	3RLvXiKg7pF8CkQLj+dH+iSzoaccRrDppVxEk5nYs14781Q1mouW9Ic6j095FMv25XIEhU5cHc0
	AqtkQwhpTAr/mgz6PL8j/JFlWT2BzTspyOU0Ojd3uqZgy71c5C+Jbf5Nf+3qdA/afBZFfj2MkO9
	MadF6lJFUo5Pifqrvuplyv8smZTjmUw8ES49d5ljrTJ7KlQOlH3fX5mLYS+VI9D3RjVd7dRcvSm
	OXOPUSnJg/ZeQG6pzUp23fjPEOLd7wc/p+co0+JW2RhbM00OUTRHy3Ybx7dzuErP9HlytV4FlFr
	Z6+u8jfaH
X-Google-Smtp-Source: AGHT+IG55CtyoAN9IFP4Oh/GdSiUwpHaPhrmoJ/1jaN/QB2uy6jUnnNNscYit5Sn3+ZKhvXbkbEFQg==
X-Received: by 2002:a05:6a00:92a3:b0:758:72b9:e5da with SMTP id d2e1a72fcca58-763349b9fa3mr7523184b3a.17.1753554965548;
        Sat, 26 Jul 2025 11:36:05 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640881ee75sm2169295b3a.2.2025.07.26.11.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 11:36:04 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v8 0/3] rust: revocable: Documentation, refactoring and safety refinements
Date: Sat, 26 Jul 2025 15:35:00 -0300
Message-ID: <20250726183552.23098-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series brings documentation and safety refinements to the
`Revocable` type, addressing recent feedback and improving clarity of
`unsafe` operations.

Changes include:
- Clarifying the write invariant and updating associated safety comments for `Revocable<T>`.
- Splitting the internal `revoke_internal` function into two distinct functions:
  `revoke()` (safe, synchronizing with RCU) and `revoke_nosync()` (unsafe, without RCU synchronization),
  now returning bool to indicate revocation status.
- Documenting `RevocableGuard`'s pointer validity invariants, making its constructor `unsafe`,
  and refining its `Deref` and `try_access` safety comments.

---
Changelog:

Changes since v7:
- Patch 3 (`rust: revocable: Documents RevocableGuard invariants/safety and refine Deref safety`) was refined:
  - The SAFETY comment in `Revocable::try_access` was updated, now clearly stating how `Self`'s type invariants
    and the RCU read-side lock together ensure `self.data`'s validity for reads.
  - The redundant line about the RCU read-side lock in `RevocableGuard::new`'s `# Safety` doc comment was removed.

Link to v7: https://lore.kernel.org/rust-for-linux/20250721010258.70567-1-marcelomoreira1905@gmail.com/T/#t

Changes since v6:
- Patch 3 (`rust: revocable: Document RevocableGuard invariants/safety and refine Deref safety`) was refined:
  - `RevocableGuard`'s invariants were updated to state that `data_ref` is valid as long as the RCU read-side lock is held,
    and the redundant RCU invariant was removed.
  - The `RevocableGuard::new` constructor was made `unsafe`, and a `# Safety` comment was added specifying caller responsibilities.
  - The comment in `Revocable::try_access` was changed to a `SAFETY` block, justifying the `unsafe` call to `RevocableGuard::new`
    by `Self`'s type invariants (`is_available` being true) and the active RCU read-side lock.
  - The `Deref` implementation's `SAFETY` comment was refined.

Link to v6: https://lore.kernel.org/rust-for-linux/20250708003428.76783-1-marcelomoreira1905@gmail.com/T/#t

Changes since v5:
- Reordered the patch series to apply documentation fixes before the
  refactoring, as suggested by Benno. The new order is:
  1. `rust: revocable: Clarify write invariant and update safety comments`
  2. `rust: revocable: Refactor revocation mechanism to remove generic revoke_internal`
  3. `rust: revocable: Document RevocableGuard invariants and refine Deref safety`
- Added a new patch, "rust: revocable: Document RevocableGuard invariants
  and refine Deref safety", which explicitly documents the validity
  invariant for `RevocableGuard`'s `data_ref` member and refines the
  associated `Deref` `SAFETY` comment, addressing specific maintainer feedback.
- Updated the `SAFETY` comment in `Deref` implementation of `RevocableGuard`
  to match common kernel patterns.

Link to v5: https://lore.kernel.org/rust-for-linux/DB3XFMG7M4SO.J6A2LVOAOJDX@kernel.org/T/#t

Changes since v4:
- Rebased the series onto the latest `rfl/rust-next` to integrate recent
  changes, specifically the `bool` return for `revoke()` and
  `revoke_nosync()`.
- Dropped the "rust: revocable: simplify RevocableGuard for internal
  safety" patch, as the approach of using a direct reference (`&'a T`)
  for `RevocableGuard` was found to be unsound due to Rust's aliasing
  rules and LLVM's `dereferencable` attribute guarantees, which require
  references to remain valid for the entire function call duration, even
  if the internal RCU guard is dropped earlier.
- Refined the `PinnedDrop::drop` `SAFETY` comment based on Benno's and
  Miguel's feedback, adopting a more concise and standard Kernel-style
  bullet point format.

Link to v4: https://lore.kernel.org/rust-for-linux/DAOMIWBZXFO9.U353H8NWTLC5@kernel.org/T/#u

Changes since v3:
- Refined the wording of the `Revocable<T>` invariants to be more
  precise about read and write validity conditions, specifically including
  RCU read-side lock acquisition timing for reads and RCU grace period
  for writes.
- Simplified the `try_access_with_guard` safety comment for better conciseness.
- Refactored `RevocableGuard` to use `&'a T` instead of `*const T`, removing its internal invariants and `unsafe` blocks.
- Simplified `Revocable::try_access` to leverage `try_access_with_guard` and `map`.
- Split `revoke_internal` into `revoke()` and `revoke_nosync()` functions, making synchronization behavior explicit.

Link to v3: https://lore.kernel.org/rust-for-linux/CAPZ3m_hTr7BN=zy10m8kWchYiJ04MXKuJAp9wt67Krqw6wH-JQ@mail.gmail.com/

Changes in v2:
- Refined the wording of the `Revocable<T>` invariants to be
  more direct and address feedback regarding the phrase 'must occur'.
- Added '// INVARIANT:' comments in `try_access` and `try_access_with_guard` as suggested by reviewers.
- Added the missing invariant for `RevocableGuard<'_, T>` regarding the validity of `data_ref`.
- Updated the safety comment in the `Deref` implementation of `RevocableGuard` to refer to the new invariant.

Link to v2: https://lore.kernel.org/rust-for-linux/CAPZ3m_jw0LxK1MmseaamNYhj9VY8AXtJ0AOcYd9qcn=5wPE4eA@mail.gmail.com/T/#t

Marcelo Moreira (3):
  rust: revocable: Clarify write invariant and update safety comments
  rust: revocable: Refactor revocation mechanism to remove generic
    revoke_internal
  rust: revocable: Document RevocableGuard invariants/safety and refine Deref
    safety

rust/kernel/revocable.rs | 88 +++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------
 1 file changed, 49 insertions(+), 39 deletions(-)
