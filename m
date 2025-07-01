Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25527272E53
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Jul 2025 11:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369252; cv=none; b=Guc4VgwZDebI8/raVVRFtlcULpIhwTLFOBxDldlX2z6+dIPf9AC4dvGejb17LTQ4hxvAdGdno4anLxk8OzHhixtzlnQMfme/BmRiZylaQSrYl+gxUv1sxZnEdolEWgCLojcJDbH+OctMLqhDR9imkyVh0fe2OWP7LQ+0+hlRYPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369252; c=relaxed/simple;
	bh=wu+y9HC23Oq5erl9wHBy05FaR0sOsDonLjOD+CU56j8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OD/0lHk9ux/GOwCmhcxxdRDqa7tE0d9nnY+Wt3peYIfd/tDAlgj12rQZvKN5ZGIBHTwf2gwI3YpVqlqW2kdUXvtAF47erGrCoLeQ/6Rm+Ok3vhCH6yA2DiIs7vggMmXgJz2VkFeRmogUCVcXH//Wx7CbE9bLAwgVglFJAOV0KAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fKegY00l; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fKegY00l"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a575a988f9so3608448f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Jul 2025 04:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751369249; x=1751974049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFGdzEcgnBAN7UgiVSiQMptJ/+tcJNlwx5ELLDUDPxQ=;
        b=fKegY00l618cOuegPcw4TuXcjQ9ZFmkN7uXGsvKvVoxYx+/L2kLxp6a8QvNdsc1P1b
         1D2yGdTt09nodsYWKz+sI6s7Auq+rBT1hpdXaxUIi00gjhSLTEYPCGEafyLkyByF7gH/
         ToG2tMMTJYDeaedhdY7Ac7+Adz8p7nCziOQzqRxfZ2B/o+gJ3LG4Rjx6PbQCk/zfcFQe
         Ihc6ghgnyPS4u8ZZCrEFzuoKAdasfGGkfj9cDGCo3C6D2LLU/PWnwBT7cT1MEqFqvmUD
         /BCksHlfVJ4dSmE36hohQVtYEYdOE6swieQjHJ80M1ve/5tZ5urQVFDC/XfVFjti+Ru/
         oAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751369249; x=1751974049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFGdzEcgnBAN7UgiVSiQMptJ/+tcJNlwx5ELLDUDPxQ=;
        b=FEpf7l3AfQ8Bei0l/9iurWid7BjekoLFZktu55KPDG97tg6yfKwoimromC3h2AocT/
         3UKJTVXhtdzREfpojBIFiVwESaDvFqtqDJH31T3aGbXn/Li9iTkRiCsysnS5EWhK3C6Q
         pqRMiVeT9d57U+ahB7GNhiWPzrmATd17usvCNj+qHTlT6PbYsLnVCb3Rz/HQTqHnPTU0
         NYYzo1fblGdfYZ7+MZ9GyY1JjoW/wXVde/nV4honNhGuRf7N7ISFBKXkytJwZrwYf6qz
         FoR2Dgv8Xlzfcpl2UHY3va8yrnk8znlLoEFikOHxZLYmJUJyj4osu95wygHarukkgBUS
         9O5w==
X-Gm-Message-State: AOJu0YxnyhxdNaD7Q4CkD8nTJlMAq3TMhAQoXqYtFPGxfhvmj0b3eG2U
	bmbtyFCkhZQg8FxT4e6gaVWJcF0hFzsxFIvYfyTUyqhjt3wTTJLaP5iY5eiZkZ7jeI1IdgN9hmL
	T8H4UFB9pT+TN2kI6EPELtFsEtWlPS/lBnKAdtXTO
X-Gm-Gg: ASbGncuHJSi5OWFYtF88CE4Ehku5QFM3MkUIfEAU7oq6YprXrp2t3Gxx61/Cn1SiN3k
	uEft9dincKcIxtkc7WrX08AY1Uuc9coZZRnkstNvyX1wZMw2xGW/7yUZAH57326UfqvSvyMbRHm
	R8T8qx1tSQfMgp2YuTlttB5T+eOCtA3BIvW4QinZtouNwl
X-Google-Smtp-Source: AGHT+IGY9ENogPbhR++5el8tc93qpB0P4cd4ToGuQXmPQg+51bkpHu1khytiuDSIfh/j1REFHWqcZg8MkszIy6JF1co=
X-Received: by 2002:a05:6000:2a88:b0:3a4:e5ea:1ac0 with SMTP id
 ffacd0b85a97d-3a8fdb2aec3mr13842998f8f.5.1751369249359; Tue, 01 Jul 2025
 04:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626165927.66498-1-marcelomoreira1905@gmail.com>
In-Reply-To: <20250626165927.66498-1-marcelomoreira1905@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 1 Jul 2025 13:27:17 +0200
X-Gm-Features: Ac12FXy9fSEb8YmCVSxOV6H3NmjeEov779-xfZBPocnuU9wnTBoDi6kNs7ISpKc
Message-ID: <CAH5fLgiTTXVMs3tzrHAU1rwQDCs_VPuPgEVcEkjbu+rNT=35vA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] rust: revocable: documentation and refactorings
To: Marcelo Moreira <marcelomoreira1905@gmail.com>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lossin@kernel.org, ojeda@kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 6:59=E2=80=AFPM Marcelo Moreira
<marcelomoreira1905@gmail.com> wrote:
>
> This patch series brings documentation and refactorings to the `Revocable=
` type.
>
> Changes include:
> - Clarifying the write invariant and updating associated safety comments =
for `Revocable<T>`.
> - Splitting the internal `revoke_internal` function into two distinct, ex=
plicit functions: `revoke()` (safe, synchronizing with RCU) and `revoke_nos=
ync()` (unsafe, without RCU synchronization), now returning `bool` to indic=
ate revocation status.
>
> Marcelo Moreira (2):
>   rust: revocable: Refactor revocation mechanism to remove generic
>     revoke_internal
>   rust: revocable: Clarify write invariant and update safety comments

Danilo, did you have Revocable / Devres changes that conflict with this?

Alice
