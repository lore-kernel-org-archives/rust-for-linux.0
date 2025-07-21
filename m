Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B74163
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 01:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753059793; cv=none; b=EscOZXuS/dpv/ez3ru0YrWP89BvMZtg80eoMrY+WlK1c5aGT8OkcAKIPYhsW9Ing3KVrcHwnARQ6+If/gvHKxsnJjpHTPemQgGF0gOavp6x6ZdYz12/dyb7sirBkS+iALxLBT3AEzApZH2QCMbjAxzzh8akRWjis0apIJFRRSrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753059793; c=relaxed/simple;
	bh=RfFmtPtHUGNIb/ukSiLLorfqqYkuQjtsj9Tm69NKtR8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=TV9oujs3Ar3vQ1eDeRRqVGOIyxSUQWlKISqfT9rzUVStHv87CQF9PNTzpy3WqI45JrBM9zu699sPquNrR9VKI49EIO02s/gGmPNKLRvfvnPRzypbZfFtte4+dMIed05iYH1WeWRx2NiRWr3IfZu6v+yf1nTOIAgpNUIbl3PWnTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrlNtI4e; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrlNtI4e"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-40aef72f252so750858b6e.0
        for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 18:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753059791; x=1753664591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rea/To6fXDQVYU/8MJe/96jxwLUdCJPSV8UceNn4yQ=;
        b=IrlNtI4eq0kAHD8725GGv0C3L/UhFC94w5C1hG9YNKIwwG/PY1O3VTHH+BWdTTxw0Z
         ho7Pj1aCKdM867cXK/gJi7ZVDnWy3Ah6GVRWCF+XvoovjL0pCtTn4DHOx2s6kTWEB2R6
         0PBbs2eAFtHq+SFeaPa2bx1JeO3wPVTT/bzaAQQz3Ld/EhLhK2sj3BB46ygeezCV7TD+
         BGMYtV1Tu1D0bwxmD9fIxcJfMvQ6UpT+/E0t+r0n1Km0Nca1xgoZPkqMPDImFkUaEM4Q
         Y04Y0xrj0/LCyt4M2TjuOsWl4y5fy022Oiv+VSHm+635mM9J+mwlBx1zD57tnRzufAZu
         CJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753059791; x=1753664591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1rea/To6fXDQVYU/8MJe/96jxwLUdCJPSV8UceNn4yQ=;
        b=pKOhIF/u9SBbKifNXeqIk39ycYVFVC5pgDoWXYKUfD6W2rPw14dm5tI/1MNAerEPsj
         ZIrEtn1Ic9F/vtWXIHlsnbpFsV0S8r2QuQ3+t+K0A+UsWPC+2ZqiwXst8kk/pudC+tyz
         fwihv2qhwL5pnQpvF61jrNnsBWdhFhYT85IOAsp9ffvH4KCo3j5OJ9naIgi6FhDPlCjU
         JrGvgZMofD5CsnAHJzuq+MlHc0Gd7IH06CNWP+UJGpPpqNByAVrUDkYmNbadovhZg+IQ
         abFVOWVh57XXSKC2F5zDzdFKhE2upygF1PmDmihyi/V91Ug25vdSYpAwEEbizjmM4N9K
         4Xqw==
X-Forwarded-Encrypted: i=1; AJvYcCXjuJ59IUdFMXG0O1CO7vlD/Vk7iBphlB/yKHv3lsQp9hXFjHZPsaaW6Tj3O5xdCPWreYLc9Y2282zdTV5tcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd7Vj+dzFKjjHTY+y0+TzEPqNIHgl5A2fo2UJ9DGyiQIc66GOL
	wqzOvCV5ngFOtkHxVoT3YQaQY+aB1K/yYRpekeTWMvvSggqj8kBtDQWN
X-Gm-Gg: ASbGnct/TUyloRNkJqoTsqOyG2gON0Ro+VkjkR5CbDQ4eb08lsSjM/S/0CbBhz+wPyt
	BboL5io9oQ+YHU5gADp+fuXiGhBtd/nDQHXp6M4c7mE7Ul+GnOHNKxjche3aJVjTm+KVhCNfdJf
	qpBW6JBNZazteaV6tRfPN98emmkdph+R2H+3WA7nP6iGqnNSg/bLuK+M/7PrfRv2vzRNd4NCIsz
	cQw4U5gVZIf+110jjBnEmTEwLj9yFaagF2anYwVp7vLcXqYaZ3xJPl2Wecih7aH5T4tJoBvWMCA
	luHgZcevcJyOveNeGAugBfRmJ/WUS15dTcm1jhJsSv+vnbjjMKBEIqCQK3jvSquffY5F3NeeHKq
	n3Ae2yCCQ
X-Google-Smtp-Source: AGHT+IHpSZNNCup2Vf6Hfpq6TLEOnKfKE4SHREM0lZxmTPFr17sNnUMv51ZnN+/b16fW+a31c9XYCQ==
X-Received: by 2002:a05:6808:1807:b0:40b:9948:f2a9 with SMTP id 5614622812f47-41cee084e3cmr10196894b6e.11.1753059791249;
        Sun, 20 Jul 2025 18:03:11 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-615bcc8c2dbsm1436959eaf.20.2025.07.20.18.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 18:03:10 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v7 0/3] rust: revocable: Documentation and safety refinements
Date: Sun, 20 Jul 2025 22:01:52 -0300
Message-ID: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
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
- Splitting the internal `revoke_internal` function into two distinct,
  explicit functions: `revoke()` (safe, synchronizing with RCU) and
  `revoke_nosync()` (unsafe, without RCU synchronization), now returning
  `bool` to indicate revocation status.
- Documenting `RevocableGuard`'s pointer validity invariants, making its
  constructor `unsafe`, and refining its `Deref` and `try_access` safety comments.

---
Changelog:

Changes since v6:
- Patch 3 (`rust: revocable: Document RevocableGuard invariants/safety and refine Deref safety`) was significantly refined:
  - `RevocableGuard`'s invariants were updated to precisely state that `data_ref` is valid as long as the RCU read-side lock is held,
    and the redundant RCU invariant was removed.
  - The `RevocableGuard::new` constructor was made `unsafe`, and a detailed `# Safety` comment was added specifying caller responsibilities.
  - The comment in `Revocable::try_access` was changed to a `SAFETY` block, justifying the `unsafe` call to `RevocableGuard::new`
    by detailing `Self`'s type invariants (`is_available` being true) and the active RCU read-side lock.
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

rust/kernel/revocable.rs | 93 ++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------
1 file changed, 54 insertions(+), 39 deletions(-)
