Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0ABA1E25F2
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 22:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755554891; cv=none; b=q0hFmQADop+36l8k175XEzyfAaOnDwhZWSNu6I3YDA6O6b0B0r8coPVQstM9acI5FvVzMHVZJh0xT01bZWg+4vUzXeAkpSdzVvf1CCMY9AsChkuHl7PipZ7bvxpfPS/I05SMrVKIWLRsDSgUMHXd8fop0OdZrSqFIviXhQ0jxv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755554891; c=relaxed/simple;
	bh=D9yV9M9xlGkmZzsTMMErOfLEGeJjgavTMQUQ14g+LU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=SwH8UvOWVJ8DOloCsQRvLUhxa6Bp0gz9hZoYstIL7ky4fa5s84kCDFwufKxWmXmdQhOXM2E2M0ZcdlJt8juUSYaXlPeaUNKWFXq0ppeVaDMsPOy4wqPAr7anj8XKr9JFg5hpaoO9knOWwZtH7/M/GN8g/f8yE6L88XxidTcYWwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5bQ1Ffv; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5bQ1Ffv"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-61c030a96f7so389538eaf.1
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 15:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755554889; x=1756159689; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivr2mj2LUTHOr0ikugFUKtF1bRoWYt8seugOhfcu05M=;
        b=b5bQ1Ffvr0t/fDOujWxqLLWYOWc9dJnDVtnmfDDAFGwL8JoLw91mWs1ULZao0eDpkd
         J/FEtjiW8xHuRFnw8EwoQvf8ND/6TtydEtxbg7r2J3TVYOJ3k3xxHhX+B/WjVdmbkCRM
         itXZ6sbHUJCYL5WtAIfbuTyI+PhaWpI5sqkfglPXcI6u+VClFSqHy3HpF328NEc+drih
         9Z8fL81dcoNKZrAWbja8+6zHgQDvuwoLfrUbI+QP5lASZHLPc5PFxNwPCWYOblwc5SNO
         4SYtYJN0GOo/OukFtdChaPrE1BupXFKtvp9bOeA+gejyoTE3ZpJ7izgwN46poJx8QURg
         +tVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755554889; x=1756159689;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivr2mj2LUTHOr0ikugFUKtF1bRoWYt8seugOhfcu05M=;
        b=pYBLtYGP4acaujRRt/f//AnztkLosSmoSD9McQnyP15NVu2BaVWzE2+kCeL0bM7kKg
         KmUsj+uEM4y1pNsUr6+Aa+x7/Tevznr8gosJWJ+qfK+OhYk2V0ZMM5e1trUqLeKOKdsk
         SQOsyoZi58h7M+Az1nfIbnmzLLUBx0iWezIhd3eEOqnLMZSv0fqRb8sKffjlQLj++INp
         da1zAaJvuc0m7c//42+Ns0MET6VLx/hWN0f1EHIAjZDb76VtovVh1MbteMhCCBb7yHzY
         i07eAjcDEOu3G6pm6rE9I3+6skDzgoo5BmnHtJM1JCfrno6wZmGHvGZAFyxZsYB5ZAxQ
         QjVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMmhDynDiU5zjb2SJZvoVNHnEQnmJzn2rkxKiz8FNH4AHpJ3us/w+EjtLOcOtji9w6sjVHO7Aii7W/8wbuxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8fa2yMc/IEIg7QNJBJd2UXuiabiqTOZq1+nDIHn8bmefHqDXm
	DZPsV/yl/q7GjoLuBlFWNcT+Hprq6CsR16GU5cjj6LPDQL7+JjqmgeQLeiORD5cwsQsgSGw9SmH
	aATFLoVvyKoUNxZR2pLgNXhY+TTIVkSE=
X-Gm-Gg: ASbGncshnI42GiBr/WKwa6isMCasb/OakQLJbbE7kbj8q2kGVCM4Pneyhzp4TSYmr5a
	n0VB+kXbqH4scNCtGCnpjsmLfAhA8UB5M/Znjlo3llNLcQV7454w28N8mVVzg14kYhpiziYThT+
	ytNY8YXIjo8GcfAlBAgNF3u5u8eqG7Np0jp0+MySUFfARmV1v9QHMIUoEzLJiYzOmWUsxkCdwM4
	MPWhqqzuUcWMTEuFSiPK8VkGWiZmg==
X-Google-Smtp-Source: AGHT+IH5+x5M7W2uxE7Q7idPNd809ffvL9rNF2YJAmDEfQ1o+dRZRcsgMqQ/vczgpoujeUOYoj1EK7crDkepYVMGu6g=
X-Received: by 2002:a05:6808:2213:b0:434:689:6c10 with SMTP id
 5614622812f47-436da1d707bmr277065b6e.37.1755554888682; Mon, 18 Aug 2025
 15:08:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250726183552.23098-1-marcelomoreira1905@gmail.com>
In-Reply-To: <20250726183552.23098-1-marcelomoreira1905@gmail.com>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Mon, 18 Aug 2025 19:07:57 -0300
X-Gm-Features: Ac12FXxtcwRImt6IVgPmJZlqLebkugJF6k-Egi-Y3HnH8XQlgk1IesbxkQi7pzo
Message-ID: <CAPZ3m_gGdiF9HWpDoHuErnG5emv_v3f2xiT1PRhYFko3DkL2ig@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] rust: revocable: Documentation, refactoring and
 safety refinements
To: aliceryhl@google.com, lossin@kernel.org, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 26 de jul. de 2025 =C3=A0s 15:36, Marcelo Moreira
<marcelomoreira1905@gmail.com> escreveu:
>
> This patch series brings documentation and safety refinements to the
> `Revocable` type, addressing recent feedback and improving clarity of
> `unsafe` operations.
>
> Changes include:
> - Clarifying the write invariant and updating associated safety comments =
for `Revocable<T>`.
> - Splitting the internal `revoke_internal` function into two distinct fun=
ctions:
>   `revoke()` (safe, synchronizing with RCU) and `revoke_nosync()` (unsafe=
, without RCU synchronization),
>   now returning bool to indicate revocation status.
> - Documenting `RevocableGuard`'s pointer validity invariants, making its =
constructor `unsafe`,
>   and refining its `Deref` and `try_access` safety comments.
>
> ---
> Changelog:
>
> Changes since v7:
> - Patch 3 (`rust: revocable: Documents RevocableGuard invariants/safety a=
nd refine Deref safety`) was refined:
>   - The SAFETY comment in `Revocable::try_access` was updated, now clearl=
y stating how `Self`'s type invariants
>     and the RCU read-side lock together ensure `self.data`'s validity for=
 reads.
>   - The redundant line about the RCU read-side lock in `RevocableGuard::n=
ew`'s `# Safety` doc comment was removed.
>
> Link to v7: https://lore.kernel.org/rust-for-linux/20250721010258.70567-1=
-marcelomoreira1905@gmail.com/T/#t
>
> Changes since v6:
> - Patch 3 (`rust: revocable: Document RevocableGuard invariants/safety an=
d refine Deref safety`) was refined:
>   - `RevocableGuard`'s invariants were updated to state that `data_ref` i=
s valid as long as the RCU read-side lock is held,
>     and the redundant RCU invariant was removed.
>   - The `RevocableGuard::new` constructor was made `unsafe`, and a `# Saf=
ety` comment was added specifying caller responsibilities.
>   - The comment in `Revocable::try_access` was changed to a `SAFETY` bloc=
k, justifying the `unsafe` call to `RevocableGuard::new`
>     by `Self`'s type invariants (`is_available` being true) and the activ=
e RCU read-side lock.
>   - The `Deref` implementation's `SAFETY` comment was refined.
>
> Link to v6: https://lore.kernel.org/rust-for-linux/20250708003428.76783-1=
-marcelomoreira1905@gmail.com/T/#t
>
> Changes since v5:
> - Reordered the patch series to apply documentation fixes before the
>   refactoring, as suggested by Benno. The new order is:
>   1. `rust: revocable: Clarify write invariant and update safety comments=
`
>   2. `rust: revocable: Refactor revocation mechanism to remove generic re=
voke_internal`
>   3. `rust: revocable: Document RevocableGuard invariants and refine Dere=
f safety`
> - Added a new patch, "rust: revocable: Document RevocableGuard invariants
>   and refine Deref safety", which explicitly documents the validity
>   invariant for `RevocableGuard`'s `data_ref` member and refines the
>   associated `Deref` `SAFETY` comment, addressing specific maintainer fee=
dback.
> - Updated the `SAFETY` comment in `Deref` implementation of `RevocableGua=
rd`
>   to match common kernel patterns.
>
> Link to v5: https://lore.kernel.org/rust-for-linux/DB3XFMG7M4SO.J6A2LVOAO=
JDX@kernel.org/T/#t
>
> Changes since v4:
> - Rebased the series onto the latest `rfl/rust-next` to integrate recent
>   changes, specifically the `bool` return for `revoke()` and
>   `revoke_nosync()`.
> - Dropped the "rust: revocable: simplify RevocableGuard for internal
>   safety" patch, as the approach of using a direct reference (`&'a T`)
>   for `RevocableGuard` was found to be unsound due to Rust's aliasing
>   rules and LLVM's `dereferencable` attribute guarantees, which require
>   references to remain valid for the entire function call duration, even
>   if the internal RCU guard is dropped earlier.
> - Refined the `PinnedDrop::drop` `SAFETY` comment based on Benno's and
>   Miguel's feedback, adopting a more concise and standard Kernel-style
>   bullet point format.
>
> Link to v4: https://lore.kernel.org/rust-for-linux/DAOMIWBZXFO9.U353H8NWT=
LC5@kernel.org/T/#u
>
> Changes since v3:
> - Refined the wording of the `Revocable<T>` invariants to be more
>   precise about read and write validity conditions, specifically includin=
g
>   RCU read-side lock acquisition timing for reads and RCU grace period
>   for writes.
> - Simplified the `try_access_with_guard` safety comment for better concis=
eness.
> - Refactored `RevocableGuard` to use `&'a T` instead of `*const T`, remov=
ing its internal invariants and `unsafe` blocks.
> - Simplified `Revocable::try_access` to leverage `try_access_with_guard` =
and `map`.
> - Split `revoke_internal` into `revoke()` and `revoke_nosync()` functions=
, making synchronization behavior explicit.
>
> Link to v3: https://lore.kernel.org/rust-for-linux/CAPZ3m_hTr7BN=3Dzy10m8=
kWchYiJ04MXKuJAp9wt67Krqw6wH-JQ@mail.gmail.com/
>
> Changes in v2:
> - Refined the wording of the `Revocable<T>` invariants to be
>   more direct and address feedback regarding the phrase 'must occur'.
> - Added '// INVARIANT:' comments in `try_access` and `try_access_with_gua=
rd` as suggested by reviewers.
> - Added the missing invariant for `RevocableGuard<'_, T>` regarding the v=
alidity of `data_ref`.
> - Updated the safety comment in the `Deref` implementation of `RevocableG=
uard` to refer to the new invariant.
>
> Link to v2: https://lore.kernel.org/rust-for-linux/CAPZ3m_jw0LxK1MmseaamN=
Yhj9VY8AXtJ0AOcYd9qcn=3D5wPE4eA@mail.gmail.com/T/#t
>
> Marcelo Moreira (3):
>   rust: revocable: Clarify write invariant and update safety comments
>   rust: revocable: Refactor revocation mechanism to remove generic
>     revoke_internal
>   rust: revocable: Document RevocableGuard invariants/safety and refine D=
eref
>     safety
>
> rust/kernel/revocable.rs | 88 +++++++++++++++++++++++++++++++++++++++++++=
++++++---------------------------------------
>  1 file changed, 49 insertions(+), 39 deletions(-)


Hello team, how's it going?
Are you reviewing the patch?
No one has responded to the 3-patch series yet.

If you need any more changes, let me know :D
Thanks!

--
Cheers,
Marcelo Moreira
