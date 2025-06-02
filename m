Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ADC2C3254
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Jun 2025 23:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748906929; cv=none; b=BIHGj4veqjEEw0fQMTfYuHNxyGaOlWKyZvUYNm7QhlCbc+Gu2HvjMS6LzMt7DrQdsoNjgf02VF2zBwFubmZyJYez0u/s6z1hFBynHkf7MBcH9L27tm2jIbTKlJIqqT78awo6e5iDA0jXrMcuEBfQinidcHtu0ilI/KFk/JlsZ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748906929; c=relaxed/simple;
	bh=90VFPrSConkA3YaAjhllgGvtc7bwvxjDQ4EC5BZJhNk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Uuoy8HWikF6NgNZLSm+ORECD8JkUWTOY4J02C0ue/YCnH794zzGsvmuv06+Cb6FMXbxCoHNihEjxH9DeyZtNwR6BOT4N4xdtbwS5BeVENuU0Lde55OXR0PNM4oQtS8BnG1BdLG1j3EyotsWKKO8fLRxR2qQ4qJ1SRWjpXR9E6l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhZxuIuM; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhZxuIuM"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-87dfe8388f8so993272241.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Jun 2025 16:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748906927; x=1749511727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sAuPBwmXwTSeJ2XYEad17pgAmp9jnBCGFvIFMuyIxz8=;
        b=NhZxuIuMWxqY9XRbNLabYK/965gLw/CPYQ6I3uvgRH9INj+hgz6aVMj+yKydodOrZo
         1OtYfrdOsEJI5I+5GveXZOXWZ/DjsIrcXJjUmdKCkpjtFMA8i0T7kaSsaOoPwC8FLBV2
         wAxDwRK++ozCocBJJgefVLbwenZZBTAHTYPc1ADzootmrfA0yGCMMfvNz6aYb/rno4kV
         A5cQMLYAPDkRSbAZyR5TGrnRK9Dw63se1rEy++v29zfMFVzBBpDHPtLRkYSaZzQfbAWn
         WBlhvlzC8Cka5BVNwTgNe9VK9flgX5nwWrReyVsah0PqkYjHe2tO6LmMfzNb42I6EQCJ
         GnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748906927; x=1749511727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sAuPBwmXwTSeJ2XYEad17pgAmp9jnBCGFvIFMuyIxz8=;
        b=RMSwxKw9aKPUjAsWjzYmBgcFboaW0GiLfKOuewxG/F4g5dd0IFfz/L10t0GsTz1XV4
         l9U1pA3ROj+k2VZ79wQ76YYFG8vQfYAYIT8rxUKSM3CQf6WUBNZGhCDZLZ1l+Ca1qutW
         b9AbAGAeHAxRC2gGryz3QnBEfiZRb/wBozlgCq9YLO26PPTjnCPdygtPGZc5qluNPJCn
         f8SgCBgwZNobsXdGP+m0N4ywQrEVf7sDgXMNPqgTnizAlLtwjPD7TRmrP2MDzZIeJBun
         t7tWWtp3Y4cL5oP1jWXfZAMV9RDnY9by/aHI8OI6fDn+PCijJ2DZvbpE6QfstVGbJtOj
         IwtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOObB16qURD9I+DMeB+zYcACGZFiiJqA/zaLr8++LrNNvAZOFhYx2bAcLMgzGWJVfNQhIJimSH5RZwxPwmgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDIukdvD088eJ1bJ3DSZxF9Nr6psW8UATZhdxwI0Hf/tHoYGqt
	cP/2sCw27ZDjY1aHzQhtGYKcX7txWX5oar0Z2QcEw0/GVAuHOqcWsqPirfeUbw==
X-Gm-Gg: ASbGncvvSFKPtDyrNqdoPkcwKxoAlJdM/e2p+6sKo9HExKC9cXf/YtoTKeklcYXoVc2
	7d5G5pSBhKE4S2c9rEdkIOaX6kUucFYMG7oj39r0cOVh8FIaZa/uX0Ak3eB8mzbC72A9/REMIqC
	dsbcKM/aA0KVbCiHseJNxacYxVd8jvpaQeFnX+k0WKDQYCkj9W3f9dBtMAWzWS4UJjk57877/rF
	cLOQmeTbe/VfFJ64llopIttU8qAi6xvTD5haQq+cwuoOk73rPAIMzMjddMLng9Utqg4RbN4QjoT
	+QEtWFM5dWYOPODA3DfQ1/4a0wlLeOoBWbdDluzw
X-Google-Smtp-Source: AGHT+IFWEuCGc4CrXV6Dzd3fN/VBwAH4LYpU8p17+uExNoyyhxWM36btqA/ivId0GipJfjq9XMxc4g==
X-Received: by 2002:a05:6102:3a11:b0:4e6:d9f2:957c with SMTP id ada2fe7eead31-4e701bd3ed6mr8018231137.23.1748906927024;
        Mon, 02 Jun 2025 16:28:47 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a39014csm6891262241.24.2025.06.02.16.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 16:28:46 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v4 0/3] rust: revocable: documentation and refactorings
Date: Mon,  2 Jun 2025 20:26:21 -0300
Message-ID: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series of patches brings documentation and refactorings to the `Revocable` type.

The main changes include:
- Clarifying the write invariant and updating associated safety comments for `Revocable<T>`.
- Refactoring `RevocableGuard` to be internally safe by holding a direct reference (`&'a T`), simplifying its usage and reducing unsafe code.
- Splitting the internal `revoke_internal` function into two distinct, explicit functions: `revoke()` (safe, synchronizing with RCU) and `revoke_nosync()` (unsafe, without RCU synchronization).

This is v4 of the patch series.

Changes since v3:
- Refined the wording of the `Revocable<T>` invariants to be more precise about read and write validity conditions, specifically including RCU read-side lock acquisition timing for reads and RCU grace period for writes.
- Simplified the `try_access_with_guard` safety comment for better conciseness.
- Refactored `RevocableGuard` to use `&'a T` instead of `*const T`, removing its internal invariants and `unsafe` blocks.
- Simplified `Revocable::try_access` to leverage `try_access_with_guard` and `map`.
- Split `revoke_internal` into `revoke()` and `revoke_nosync()` functions, making synchronization behavior explicit.
- Link to v3: https://lore.kernel.org/rust-for-linux/DA6XFLKUTP1P.RR6P5AK9PKIZ@kernel.org/T/#t

Changes in v2:
- Refined the wording of the invariants in `Revocable<T>` to be more direct and address feedback regarding the phrase 'must occur'.
- Added '// INVARIANT:' comments in `try_access` and `try_access_with_guard` as suggested by reviewers.
- Added the missing invariant for `RevocableGuard<'_, T>` regarding the validity of `data_ref`.
- Updated the safety comment in the `Deref` implementation of `RevocableGuard` to refer to the new invariant.
- Link to v2: https://lore.kernel.org/rust-for-linux/CAPZ3m_jw0LxK1MmseaamNYhj9VY8AXtJ0AOcYd9qcn=5wPE4eA@mail.gmail.com/T/#t

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>

---

Marcelo Moreira (3):
  rust: revocable: update write invariant and fix safety comments
  rust: revocable: simplify RevocableGuard for internal safety
  rust: revocable: split revoke_internal into revoke and revoke_nosync

 rust/kernel/revocable.rs | 84 +++++++++++++++++-----------------------
 1 file changed, 36 insertions(+), 48 deletions(-)

--- base-commit: 7a17bbc1d952057898cb0739e60665908fbb8c72

Cheers,
Marcelo Moreira
-- 
2.49.0

