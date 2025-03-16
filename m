Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8C720328
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 12:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742129003; cv=none; b=mkFtm3pwzeudyBLm8UvD/n8gE/mp9GAx4EK5bDxdEY8yMRscH+K1lG2RrjNXGZpHUiVMgfT0e1+Dp7gNQwKusy9MX90NufH6nuasIaVWoj2JwuEYpAhe4X9i/IfvhDSvpvS4IrWMuLAsYca1IhlL1lLq52rzIDAorBtyiR9bq3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742129003; c=relaxed/simple;
	bh=mj9uTf75B2qtp1jH2UhIdpGzCqVleOHDLCRPOTOuwjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aIR5GNKQq+Hzj82628I3CvckeIanzDPWE50dlIH2krwahYgRNTmzcAwy+jITGc6A9gXlAXBEle6aX+b1v60V1Sc0zi3nHVPydo5NEZj+/ltNSlQxHw2I18sxd/40ifvU1+MOoTuQaLAGBg+RSDkh2QI/2AXIEPbMSzJUNdmrxWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwHpSChR; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwHpSChR"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30613802a04so39795381fa.2
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 05:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742129000; x=1742733800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mj9uTf75B2qtp1jH2UhIdpGzCqVleOHDLCRPOTOuwjs=;
        b=cwHpSChR5iKGHl0ZhOBEtDjBAtxpU7AkLbkTwR/JFspLleuLJApC9hUrSf7xa2KxOY
         5rgVD8JOSLcAih6KuE26FTb3vIoGAKV8SHQX+zGoQhezbPwzkQ3yAOnlPlb70FTnGe2y
         5AjIThChJ3FI6DxEKRIRnX6+nIaIAR0q6Xhja2cC1/wWrBf6Pud2ri1JehWd5Fj2lASx
         fAt4zIqcuux8aZdg8w7k3qmE9gM0ExluJXaZN40u2zuIA1DlqkTp0qN4v/nEM2Mn+hE+
         tC1fG8LSE5GlYdP/VnrQDvXCZQGhYmbczVVZgHqEFc3NHJODVT6mXwSkn6FiN+HavWWQ
         v9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742129000; x=1742733800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mj9uTf75B2qtp1jH2UhIdpGzCqVleOHDLCRPOTOuwjs=;
        b=V0kP2t1tMuojvMYiAFpHAF8nwgC8uW7v30batmgQZuFo3c30zgYKM0gSJZW7RJpaHX
         2AKPFpCpf6UFGvg9VRuzGey8sJS7FfEYejulEgJajI5Oj6LzG+Kc8U+itmqy6e3d0stk
         evD27WgaNw8ndc6QyOEsYullY8LqFXqP4EtgBv33CmKXtIT7GicdJ66mCgnDWmQq+Pze
         Cg1A0WmdP1pk2SxoTcDIxHelFHfmx9H7qgeisWpTkn16kI02mYv6r2I660pmyZy9JVPI
         R0FBD923zseFO0ym+Gl1aIbqna3bN+P2NB011w0MW2Pau0BjI53TmCGhtr9eDxULc5WG
         TDgw==
X-Forwarded-Encrypted: i=1; AJvYcCXpYLyQt4pGGgWXpOUivzdKItywJ0TgX20joLtb3hchOCyfCdfnMhkPP5ofKImaWCYG/Gv339Gu2I50WsvQrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT0/B4N+XwVPnWLn3Fc3Q0E9NhiTUa2Zt1q77eg3pQWSQpxraZ
	opmfR/PwcfJrPgwBmvojCDrbUDUJ5fTTQVoPOczXa4Ez01fd43Ggtrl2VdMCJttYvyZ77eTcdWU
	GsZGDhQcYQ7tIlXuZXI0Srf8kAvg=
X-Gm-Gg: ASbGncsaFbE26ItlLv0HfgnhqmFMcIKNKuLROAuuhgLV1C18Dlewq9f5gH7IAg6G/vO
	kGYxLzfhSSMgdIcZElV40DFS9+avLnUH+1XaXH5RYjo0ENwGNclJA+3C/Og7nrc1xA3nRwhLOMJ
	DOiwrjF3xVmGgR95D4Cxlze0UhksA/WLp7ryDHQIkB2ugiKPwFL2peV1x9I1Xu
X-Google-Smtp-Source: AGHT+IG05qO5Ew4x85G4k9dIhE+010FP9hv6WsFj3ddUvAx/8gPURrcMAok2BC3+8aXfRc3xz4o1s3uaYdejrc6gLyQ=
X-Received: by 2002:a2e:9805:0:b0:30b:d073:9e7d with SMTP id
 38308e7fff4ca-30c4a8fb0d2mr34382931fa.37.1742128999553; Sun, 16 Mar 2025
 05:43:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315154436.65065-1-dakr@kernel.org> <D8H0YRU90WU9.2FX2QF3W9FKV9@proton.me>
 <Z9XIk3WpzruUfh6O@pollux> <CAJ-ks9=vvuXpdCnxPKzDEF_ibxBxzGXbSb7hVGi-vDgZcDQnxw@mail.gmail.com>
 <D8HL95D099MI.2N779RERY6DAE@proton.me> <Z9bEosVk8-0sgSbw@pollux>
In-Reply-To: <Z9bEosVk8-0sgSbw@pollux>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 16 Mar 2025 08:42:43 -0400
X-Gm-Features: AQ5f1Jqe-8026lpZdYy8kPtXGaHmdmhihYUvvpJ3fUmhg_z2XuaQX6BDuqKTeoQ
Message-ID: <CAJ-ks9nxTkZJa9Okq7ztZTrFvaKd4ovw5SLd3c9q4Kye23RfNg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of Vec::set_len()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2025 at 8:31=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Sun, Mar 16, 2025 at 09:38:23AM +0000, Benno Lossin wrote:
> >
> > I don't think this needs to be a safety requirement.
>
> Given that mem::forget() is considered safe, you clearly have a point her=
e.

Yeah, good catch.

> Let's go with just "must be taken ownership of" then. Unless there's subs=
equent
> feedback, I won't send a new version for this, since you both already gav=
e your
> (conditional) RB for this.

What does it mean to take ownership, if not to run the destructor?
Given Benno's insight, I think the safety text is correct as it
existed before this patch.
