Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6026A2C326B
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Jun 2025 01:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748829198; cv=none; b=r0xJhkwfykv0s2PvyzskZNbIQ7KZGgHS42yWpbCVxDreD/J3cpUcZJCxMTxd36wK2OgOd1vqoDOagWLImpndkBcIr59t4koqkw5GZN6rnjxp94IR95SLqtjeW7fZnHdy5ZfKHF3cTkO7IHnC6M+fsfJYoVEgrKpi+u6vrLJXABM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748829198; c=relaxed/simple;
	bh=Am6j/3HDwLcnMuHrH2qHxtI6BZkkiUUYZNbHH0onLhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=dHeBzJj3v3wvg3KS7PzUQUxdMMejyAToIJXWwTuFZKwRv52D+enT6VfSstJ+mglsX2PdzNg1Cwgh0Xv2NE+UObA1CkSGZ4kwpyYro3p0m5/mJ6Dk6fow83GA7yo/MWFtMVFpfmg/W7zX6Sbi4xiWEa/HTm6NuuM/RHMqpNnrLQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCPREfpw; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCPREfpw"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2c6ed7efb1dso2209621fac.2
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Jun 2025 18:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748829195; x=1749433995; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Am6j/3HDwLcnMuHrH2qHxtI6BZkkiUUYZNbHH0onLhY=;
        b=dCPREfpwsDVu0LHzpY/qVQPBh0PnAujZ4wgTCfvg4qM07X6xPBVM6lLr3GnCEHdmKn
         f/wAuBI98CpUYNglplBT1PTMl8XWCwIZtQ4rg0zDFxEocrI5UiL0kEROzQ1aWs9PiBGW
         KnaYTVSraHQmpPALbx6cYiABcCpDs4uM4503VKSPJCSf6IpPG5X5hUYHYGP4hpYNUdz3
         cmIFfpFjub9dXoF3Zq7vSSUqIC6Fc0dO0nGrKbX3O/KJT6v+V+EtUwoHhPrUpJlLktyP
         kyKuIYSGOHr2v9kVk/1+fr60+MvcTF3vOOQMU+zvPtoSAAboZ1VjQfNiE1RuzOH3j3Q3
         qa2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748829195; x=1749433995;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Am6j/3HDwLcnMuHrH2qHxtI6BZkkiUUYZNbHH0onLhY=;
        b=NG7P1orKPtwHirxDjm5doRV1pTXOrihgsKFJHsYcLyLV7BB5jtkEWE5oTwLcGSyv8t
         3jcOBff880SHrdgEP862tv58/jKREqBxjsuIdv8g1OAhwH1PsMUdAVyp0jR5LEZPguUs
         Fzp24mxBoEf2ue1Au2Jdv5pVmjuPgcZNpJb2E7Mw5UcDx+eZVvC/NBAszCF8i8zL0Sz6
         iMbiLxraKPxGI3VuaHNmN43GxeupH158b9RKE2mWoyHtlIb5DD9egaHey8SsH0kYb2D+
         PID3zczRrNSG5G3uAl2llW4whVzWYbDTlHS4oW0QOfVWqPw1tcnQ6UaGQhXVD5q/Vm//
         gGXA==
X-Forwarded-Encrypted: i=1; AJvYcCUQgSGauQzzNeLJPUJDhom66DX2cwT5dD6HNaf3HfT8xE4omgGjurzujQjcmdytuhcVrppPo9NP8YlyAkojXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCGO7VY7EYhMtUuGWrI91FJNDQfFtyNzyznqMqcuOyZfupWCbV
	4YXU/Qeb+Hoj0nXafdYINQ30RZvblf96yoY8kzTNLzi38gkh3ri10pCvDjcTsE66KEw5Od3WU9y
	S0QLPo45ooEpa7AUOQQJeeFmPC31rAyU=
X-Gm-Gg: ASbGncsNOd2RnpgJ38kgOWwO+FlFpBNQdw/w5VDgqSNbjaUFRTX8sRvsV6M9+4G1/a/
	nU3hcCK8iPUkYKCacjushoenMOth3ZhZGRRQPF2PiB1s3zYzPVQ3crBK7AQCPI0pjfUYQU5DCX0
	ahh3wCnGlXgBgQjeaPZ0MC0ncu6nhx2ufCVb66CG4bm4gX
X-Google-Smtp-Source: AGHT+IFjmIXlqwSTum2uCiJjnjMTUb+MTInW7/22NI5to1raKgcZN9OlGu6KkYbM7cVKdy8LusBJZMYjqYGKEXh8jbc=
X-Received: by 2002:a05:6871:c3c1:b0:2d6:6688:a625 with SMTP id
 586e51a60fabf-2e948d67616mr3580951fac.37.1748829195252; Sun, 01 Jun 2025
 18:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602010701.116503-1-marcelomoreira1905@gmail.com>
In-Reply-To: <20250602010701.116503-1-marcelomoreira1905@gmail.com>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Sun, 1 Jun 2025 22:53:03 -0300
X-Gm-Features: AX0GCFvqn30FyYuvrXnm0Xv8jbqgobhz5w_IXR8mdp5TewOb865S_aTB3fUg9qs
Message-ID: <CAPZ3m_isiaSEH91epnMma-rU6a6gDhwVfL9ejLPx1xPMH0fwzA@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: revocable: update write invariant and fix
 safety comments
To: lossin@kernel.org, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"

[PATCH v4 0/3]

rust: revocable: documentation and refactorings

This series of patches brings documentation and refactorings to the
`Revocable` type.

The main changes include:
- Clarifying the write invariant and updating associated safety
comments for `Revocable<T>`.
- Refactoring `RevocableGuard` to be internally safe by holding a
direct reference (`&'a T`), simplifying its usage and reducing unsafe
code.
- Splitting the internal `revoke_internal` function into two distinct,
explicit functions: `revoke()` (safe, synchronizing with RCU) and
`revoke_nosync()` (unsafe, without RCU synchronization).

This is v4 of the patch series.

Changes since v3:
- Refined the wording of the `Revocable<T>` invariants to be more
precise about read and write validity conditions, specifically
including RCU read-side lock acquisition timing for reads and RCU
grace period for writes. - Simplified the `try_access_with_guard`
safety comment for better conciseness.
- Refactored `RevocableGuard` to use `&'a T` instead of `*const T`,
removing its internal invariants and `unsafe` blocks.
- Simplified `Revocable::try_access` to leverage
`try_access_with_guard` and `map`.
- Split `revoke_internal` into `revoke()` and `revoke_nosync()`
functions, making synchronization behavior explicit.
- Link to v3: https://lore.kernel.org/rust-for-linux/DA6XFLKUTP1P.RR6P5AK9PKIZ@kernel.org/T/#t

Changes in v2:
- Refined the wording of the invariants in `Revocable<T>` to be more
direct and address feedback regarding the phrase 'must occur'.
- Added '// INVARIANT:' comments in `try_access` and
`try_access_with_guard` as suggested by reviewers.
- Added the missing invariant for `RevocableGuard<'_, T>` regarding
the validity of `data_ref`.
- Updated the safety comment in the `Deref` implementation of
`RevocableGuard` to refer to the new invariant.
- Link to v2: https://lore.kernel.org/rust-for-linux/CAPZ3m_jw0LxK1MmseaamNYhj9VY8AXtJ0AOcYd9qcn=5wPE4eA@mail.gmail.com/T/#t

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>

---
Marcelo Moreira (3):

rust: revocable: update write invariant and fix safety comments
rust: revocable: simplify RevocableGuard for internal safety
rust: revocable: split revoke_internal into revoke and revoke_nosync

rust/kernel/revocable.rs | 84
++++++++++++++++++++++++++++++++++++------------------------------------------------
1 file changed, 36 insertions(+), 48 deletions(-)

--- base-commit: 7a17bbc1d952057898cb0739e60665908fbb8c72

Cheers,
Marcelo Moreira
