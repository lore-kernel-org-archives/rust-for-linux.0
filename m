Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315BE19ABD1
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 13:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742130870; cv=none; b=cLDwoF/iCyLF5YygPzGX4SaBo8zZp2CDqMi0VR9pTk/0KO6Wq8ASK2sjPKI/d+mklmG4Y1KehOkhug0qVRo/zeMjBtb9C3BZN2RLq36xEDfE3IliaLavuR2qz1eo06EhKRaaDxBfQoc9ZOqIWshEPE8YEb6oF01CxKy1z8ubjOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742130870; c=relaxed/simple;
	bh=pIzcs+RP5LwO6IUvgyQr/3631SmBxBUyP0TAVfg8DD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAu6yL4BIPDBktvPcSL2vHqEYe/7zFoL/DVteg5w3NtyY3IORHdjcSxR5uLmo5/+YNuRoLbClekudg7gEsdv+PQMnvZ/KcM5Xxqx2ZDL/t31BSrgxGmWHDUsCF29jFDg/XYQVMhReoo1VZjbE2bBDoRVxpEO3JMaMETCD+jnPe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRCLYTl9; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRCLYTl9"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-307c13298eeso40891291fa.0
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 06:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742130867; x=1742735667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIzcs+RP5LwO6IUvgyQr/3631SmBxBUyP0TAVfg8DD4=;
        b=XRCLYTl9mT2Sqq08K5e46gmku5AbJcdtdc6d8legK/v+xlgY1UkvFoFYCGTgjgWnMu
         YkAfEg3Mn6K34Tl4kUaZwDZIjmhTLYMuFQg+9ypAQNvIZ5sI2IP088jTDQJIKjdVV0xf
         53br1uQa0SnXGjWm4/SNOBkz6JctkyVQvietKmhGy4p6XaKrTSAxp0cL87B8CVbBMNUo
         2tRinlIPDUNyNGTDLqTVKJ05L7dnJm5nwZUOJW2XvNjJrt07/EfSil100iKqsOnsES4H
         ZrrNQZDmYN2TaepoR2Bfod2SWYk2tFjRQRGGTFJOtMd4l3xMfgmHrEVbbyCI+dTWQswR
         5GZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742130867; x=1742735667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIzcs+RP5LwO6IUvgyQr/3631SmBxBUyP0TAVfg8DD4=;
        b=EAXXO+aH0lJV0JUY6bcaR8pLLWj+WhneWEmYdYc4mgjIcMEjcWFjbqhO/eQTt76iDw
         FWXS4MSERuI5gt/3Ko8V65X/um3/rjDpk2lhr8OY3Q91pNgcCoJsbeHYOMIqxuMY9rPs
         dWDVUrqEU8PxRXHPgVvB/kpCXxpZaoA5iZVklF2X7V47zhqyebX2AWF/INOLV+Jx0hlQ
         Haw022K2vLyCqSkwwcfyMLflBLPXG6101wJE1niyfxM4jxiyRSbQHbMpjDuAx0CLaAcl
         uyHcDQWYPPs9R+PdS3pVqGGTxB9DSW/V07j5ngrF72I/E6+rITa6D6lhaGgqz8H8CB5e
         zK+w==
X-Forwarded-Encrypted: i=1; AJvYcCXMDY1dLS7IVqW13SJMPIpbfanGSAuIayp3k3e4bwvOAHXG+5Qxa2eu3yss0ZllNDo7iC9cxTjk1wLHzuCtKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuzpaUeE7phUYArQVrSySmtCbQ35l8zeBc/V4BHVNRvKNDrLoI
	y7o3dQjlppDampad8eHrfg8hrV4kNSRcUYrFT4ffvCXGdk9Qsg+GpV/WzgvwPwVnFA9h4CNWH7g
	5plFNECSvK++qE/A14S6pNYoBZEM=
X-Gm-Gg: ASbGncsDL6mFJjHeCXzP9Kvl0IlwEhAXQouXuSA4VO9Qb/7BK6iyVk6A13rMF58cuYS
	pMUg/hfWwjNc4rHZUKfEedM/daAZXI26/PnX+OU7v22nHgPUMzYKrN26bll5tMHiBayyL3T2eUL
	SCxQagmuI0fSarxfjoggTNR1ypGPQexZqRUKLPhwmEbrY+aVHfto1K+b3fDLx1
X-Google-Smtp-Source: AGHT+IE8CRXWbwcpyuSk2SFR6CToJi2K/JfAWNNlKlYZlzWQs34rQ4lKVr37rjE9i/oB2tMvSNfW8Kalggw8FCadV8g=
X-Received: by 2002:a2e:921a:0:b0:30b:9f7b:c186 with SMTP id
 38308e7fff4ca-30c3dd09327mr51241601fa.1.1742130866990; Sun, 16 Mar 2025
 06:14:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315154436.65065-1-dakr@kernel.org> <D8H0YRU90WU9.2FX2QF3W9FKV9@proton.me>
 <Z9XIk3WpzruUfh6O@pollux> <CAJ-ks9=vvuXpdCnxPKzDEF_ibxBxzGXbSb7hVGi-vDgZcDQnxw@mail.gmail.com>
 <D8HL95D099MI.2N779RERY6DAE@proton.me> <Z9bEosVk8-0sgSbw@pollux>
 <CAJ-ks9nxTkZJa9Okq7ztZTrFvaKd4ovw5SLd3c9q4Kye23RfNg@mail.gmail.com> <Z9bLtgJa3PNB0bkf@pollux>
In-Reply-To: <Z9bLtgJa3PNB0bkf@pollux>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 16 Mar 2025 09:13:50 -0400
X-Gm-Features: AQ5f1JpCrsBB043ffDTiZoRhxTphv5lm0DCg9QoNqioU0Bn_uY9JhsmhvIA2FBs
Message-ID: <CAJ-ks9mAS1WHZcRqPzu4qhMOGXP9RNhdHUSbJK79znDvaFRHnA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of Vec::set_len()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2025 at 9:01=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Sun, Mar 16, 2025 at 08:42:43AM -0400, Tamir Duberstein wrote:
> > On Sun, Mar 16, 2025 at 8:31=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> >
> > > Let's go with just "must be taken ownership of" then. Unless there's =
subsequent
> > > feedback, I won't send a new version for this, since you both already=
 gave your
> > > (conditional) RB for this.
> >
> > What does it mean to take ownership, if not to run the destructor?
>
> Taking responsibility over the decision of what should happen to the valu=
e, i.e.
> forget about the value, drop it right away, keep it alive at a different =
memory
> location.
>
> > Given Benno's insight, I think the safety text is correct as it
> > existed before this patch.
>
> Without the addition there's no requirement for the caller to take owners=
hip,
> but that's what we want here. Without the requirement it would be on set_=
len()
> to take a decision on what should happen with the value.

It isn't a safety requirement, right? I think it's fine to document,
but given that neglecting to run a destructor is safe, it doesn't seem
to affect safety.
