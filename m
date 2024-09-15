Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8224286250
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Sep 2024 08:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726387713; cv=none; b=BzGeE1RIxFOU3ggwPqxUqNSiFNeuSXrrc3JkiDEmGm6vZBNzo2kLcmlm47swOO8wgQrAgchRhsUvpGzFM9U5LBrC3Qd6mwEZ95SqlPHJib6KU5jR9LhEcfUjVBio2F8I9CIBoPljlS7vqOvKjaQ+Y9I4v7owwLKIl1DoEZar+cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726387713; c=relaxed/simple;
	bh=OyhAR22WFlMKi/ctn3D8oR3Tt3G5DiOqWcpYQ3h3V8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VFpoPHYf1bMLosTcysvcbsFBKXNa9Nb0daXMLbtdz8A8P8MZZlfQ9jnh0q9xpLl5GV0ktQqF7LruDuaTl8snEi0Ltik/Ealnxhqt0tscwcmKNnq3Bx8PLJdyjsoUlgJAz+9cgviP8A0GnWQJXXFf8FRDgdU/nHycgV44jnmrT0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p0nCy1Bd; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p0nCy1Bd"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-378e5d4a80eso949628f8f.0
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Sep 2024 01:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726387710; x=1726992510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyhAR22WFlMKi/ctn3D8oR3Tt3G5DiOqWcpYQ3h3V8Q=;
        b=p0nCy1BdQbLxdB9zT3ZWJwZczNVHCCP8QCUvUa4kNa+Ua/SJwDh3ATHzrC8BVuSmMj
         tWhH40gt9sV+I6FDELV5AjHthiV3M90igXSD/PMbjRRoC9TNntcQ/bABkoHaruMKHUzV
         rmyzIOG0cBKUhzfZjpPFs4WeUSbWhjKiGBUHvNQYZXnHcEiXPXkhaSUfYx9Uny18sVZj
         lW2hiJ7fNX/m9mbl9yW1cYWh/HtXSELbf+8uW1Z0gwemoT4D55lbNm2VLIuVkT/Vj5E9
         Q9UPaHTxi3/RKMpRrlW3x4vXQu4cYkb1dHg873tUT3ZCwO6rfBCajmLGi9Xo2y5HfYqD
         dp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726387710; x=1726992510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyhAR22WFlMKi/ctn3D8oR3Tt3G5DiOqWcpYQ3h3V8Q=;
        b=Ml+ILHe0a4VPF6b/QkxU+XzFUF1TrtIn0cIopmXnh+w5k+wBrGoWa6RofYaX30wxry
         pJ0wyYTnGa/TPaV9PSykJQ0NGfk2qtpsrjQhgT45/VoWg8Oq2a46P98nHsebDfh6fH8L
         1fbX3EZL+1Y9dDpc7obHj4oLoMX5F7nqSchTMm6fTRCQOR36Kxa6GBcrIT/x69cEKpRA
         x6pn3ns2brMMU0LcHO70Q7R+5z6yZVkEr5wnaOWJtrOELgiVOElPuhfzk3vrOYiubbX5
         Xo+7+5dyaG3jswgEvRevGczXM/4WOf/fuUYxg5TmbNqpTG0gBUAzhRq5E9XFjUpeiIYO
         gMRg==
X-Forwarded-Encrypted: i=1; AJvYcCUaiT2dy+iH8+f/0qgoL1ma2Hlk+dnuS1f0ypIptYTxoctzUAbk3XAtnpacYRLWXz+HsrEol4JYZwohyOLGkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsMn3Gjyb7bLeLDWWqHP72OCA7AnN5gBI9nQ5wqWfkU0otvnb9
	PUpPyA04iokI14irFwv45dhJzgRn2OYeZnOQpFRYARVqMHQgHDM0kYtWKXlJhbj7xP1rNjeHjj+
	nLu19I0z6j+rwbS4kBpEOtEAnyH7Doz4Ej5Sl
X-Google-Smtp-Source: AGHT+IEIdNbjn/4v4s9FKYE7qXFiuvDm8I3v4DgQtf+GL83WKiVhEzZG5lpy5ahP1rw5SXhdgzel+RQGpGDY5+f1t4c=
X-Received: by 2002:a5d:4047:0:b0:371:82ec:206e with SMTP id
 ffacd0b85a97d-378c2cd3dbdmr6731831f8f.5.1726387709441; Sun, 15 Sep 2024
 01:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DM4PR14MB727606461A9C870981F44D9BE9662@DM4PR14MB7276.namprd14.prod.outlook.com>
 <ZuZyIRaGHxGMGUid@boqun-archlinux>
In-Reply-To: <ZuZyIRaGHxGMGUid@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 15 Sep 2024 10:08:16 +0200
Message-ID: <CAH5fLghDr64_ajhGxNHsaijHLQ5j4BqkYxWcvVDSR59iYbLMHg@mail.gmail.com>
Subject: Re: [PATCH] rust: add trylock method support for lock backend
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Filipe Xavier <felipe_life@live.com>, ojeda@kernel.org, gary@garyguo.net, 
	benno.lossin@proton.me, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 7:35=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Hi Filipe,
>
> Thanks for the patch.
>
> On Sat, Sep 14, 2024 at 11:00:33AM -0300, Filipe Xavier wrote:
> >
>
> ^ unnecessary empty line here.
>
> > Add a non-blocking trylock method to lock backend interface, mutex
> > and spinlock implementations. It includes a C helper for spin_trylock.
>
> The commit log needs to explain why the change is needed rather than
> what the change is. Do you have a (potential) usage of these trylock
> APIs? I know that trylock concept has been there for quite a while, but
> still an usage will help us understand why this is needed in Rust code.

Filipe, you can explain in your commit message that Rust Binder will
use this together with the new shrinker abstractions [1] to avoid
deadlocks in the memory shrinker.

Alice

[1]: https://lore.kernel.org/all/20240912-shrinker-v1-1-18b7f1253553@google=
.com/
