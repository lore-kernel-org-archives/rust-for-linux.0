Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EE8801
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Jul 2025 00:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751934884; cv=none; b=FjN1HbSboR7qAlD/1ouza1glhUh2VmkyiDqqc+UlrsbpMOIOBzskvwQ4V7gVT2V2udn6qLH2GgMUTgUacuSGnvwVTl5V7iCQNVD4UPZUUPryUOgdg8enmiW0NrwtSokKmnDfWccN+uLUK/PGxQKBABBJwW3SQ9XE7kRoqndV93s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751934884; c=relaxed/simple;
	bh=L4eSulxAuQZpqKg5PCAXb8YA1PW2FQFzzVkwqHXXUFw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=KW67L3hHNo1vEsI/cAeyOTrWj482mXSh22W8UqL5EyzY9ul0KJjSHHLx7nWU4T0NVXJ+xlKD2+WhHMSWz435jhKTOnLYeJ2WtSgxd9uGwJd5BktX07K5U+DHYieVfCfGkLlHu3vuyDVPf2aDuf/brpRAhFZdnw2ui3H90vCjOhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6OdxCFl; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6OdxCFl"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fd1b2a57a0so40825466d6.1
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Jul 2025 17:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751934882; x=1752539682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XrFMatzixlUKW4LkgW03j5SAvkIgN7Eq9iXxugYbbGo=;
        b=H6OdxCFlqSq5DTKhtYpKB39EnUmCi2DC5AYVldbE+51PQHc8Rir215fbcR3/2ujlWS
         +yd2dDZVxx/rJvUCTZJSkTY2LCQTiYb42EMs9eoQ5DrftIzWWo9Rw/1PESala5KTw+Pz
         q2t1y9unyCIbDSl22DXP3zTcbLSX2OA78j4YgD5sptpH+uQRM3i6QiOtRDls82zLI51N
         gVPn628AoQGdW4F1IG8B+yP0fukMcztx9pgGMVXTBAhN2BPRTPQLofvEaOrmoT1BM9tw
         SF02PHu13RS9Uqlyd5EtouLUsix4T4jQGDNm/tWCFH6vFbPTanBrG5JbHbPEpfq1q+NY
         YqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751934882; x=1752539682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XrFMatzixlUKW4LkgW03j5SAvkIgN7Eq9iXxugYbbGo=;
        b=iJoJ4gwL2OLY7QXpG+zGQH4Ppmxe3m4W6/PezsHwJ1mMd9KPhCVUnT+nAH1sV+R/xX
         gg3kIMnt117P39WUVG9j0XHAKNcsfflpT8MMD2bPwK9Jcv1Icr43z3NW1yar+QhcS8xJ
         gIaZoF/fp5/OuZ4UX7gdbLgM8HYCOh8gKlCodDvi0utkXkiJP1WB4qoizpqn8Z6X5hPs
         eKHw/lgwRgTAUUi/pDeZyN+dSkpNsqEy4EODi0pbb/jvaSwrb8Uoa9TP5C8kb/WFfiGc
         o/UdilAGvOPP/gm+NFOBfxWZDmkQZ72EATH9DXHlqhjDLT535WhK12DegxC6vDyK+zCL
         fMAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYiHbShzzuBQcXIbyTLNUD1cNsjCQgseN+qN+PdR5xuqmRl4cmj8cNrnyeujlQ+thMjBTb8oxPwPuxbuuyAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCubEDEKHTjwgbDTn7Wel/2duGxe4UmVDShPC/RIyiwUv5fefA
	un5c4XqYedkDXUTNH7ctUVM4ae87v+5ZUoGDT+8yByW5DY975BrgW7yOeUlnhCL7
X-Gm-Gg: ASbGncu6v4czvyU33FeUhGT4DILHJi9tWQz2LiORTUV1bBYGsIhZdiRbWQA6EJ5V793
	bzXUThcdmNT9e/CFM24Yng0bt03dms+32tngvkB/ZHetW2Yyw7V98U0i520oxxyKkQ3CRU5wRZL
	Mz/MdoRfeS82GRyzfb39ChyaqxQxpn4wRUSU9J6crw/yK6sTIf8bUkJHoJXTUiWxmxpowQye8bh
	fijaXl896autu434av1qes2zL+BFzw9a9cnL26qc721h+AJ/1JrMx88TUbSVmCxJ9neI+YlV+5+
	/h5TGvQKn4Buq277my10NNiywekyLb++KJqdoFTqIaiuf1sj69a7iMNqj9M=
X-Google-Smtp-Source: AGHT+IE80cY9iHrKZv3ojE/kRMfStoQNau+2yzEGjqJNo+JbkzOwL3Sjm6TYeBtpgbjgtpPWzX/R0Q==
X-Received: by 2002:a05:6214:20e9:b0:6fb:3537:fcfe with SMTP id 6a1803df08f44-7047dad0090mr15036516d6.22.1751934881515;
        Mon, 07 Jul 2025 17:34:41 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4cc751esm68746076d6.23.2025.07.07.17.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 17:34:41 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v6 0/3] rust: revocable: Documentation and refactorings for Revocable type
Date: Mon,  7 Jul 2025 21:33:36 -0300
Message-ID: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series brings documentation and refactorings to the `Revocable` type, addressing recent feedback and improving clarity.

Changes include:

- Clarifying the write invariant and updating associated safety comments for `Revocable<T>`.
- Splitting the internal `revoke_internal` function into two distinct,
  explicit functions: `revoke()` (safe, synchronizing with RCU) and
  `revoke_nosync()` (unsafe, without RCU synchronization), now returning
  `bool` to indicate revocation status.
- Documenting `RevocableGuard`'s pointer validity invariant and refining
  its `Deref` safety comment.

---
Changelog:

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
- Refined the wording of the invariants in `Revocable<T>` to be
  more direct and address feedback regarding the phrase 'must occur'.
- Added '// INVARIANT:' comments in `try_access` and `try_access_with_guard` as suggested by reviewers.
- Added the missing invariant for `RevocableGuard<'_, T>` regarding the validity of `data_ref`.
- Updated the safety comment in the `Deref` implementation of `RevocableGuard` to refer to the new invariant.

Link to v2: https://lore.kernel.org/rust-for-linux/CAPZ3m_jw0LxK1MmseaamNYhj9VY8AXtJ0AOcYd9qcn=5wPE4eA@mail.gmail.com/T/#t

Marcelo Moreira (3):
  rust: revocable: Clarify write invariant and update safety comments
  rust: revocable: Refactor revocation mechanism to remove generic
    revoke_internal
  rust: revocable: Document RevocableGuard invariants and refine Deref
    safety

 rust/kernel/revocable.rs | 75 +++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 35 deletions(-)

-- 
2.50.0

