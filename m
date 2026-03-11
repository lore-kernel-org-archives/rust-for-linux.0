Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D2D175A73
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 21:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773263785; cv=pass; b=UrTZsaleqcpyOgF44/5iU2x0EHfeT0pzp5FrEt2lw7lNPu4GH/I0bob2Ag6FcJuXrjnhd8ZZwLlqlGy4vhPSeCEo0BibCGqK93FdLnJ/4Rc7FSD1KbKGhD2HRaeLTXyEGyeBnTWEMDb6jmIj/G5+DFSCQEYZZAmn5+bCrsGu7YI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773263785; c=relaxed/simple;
	bh=y12TOxC/DHbDZOOJ8qaNO6Cgbald7GkbfWW6KgFcfhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8Dwg8zAz/6Lm+VV8Sn/oj0R7gLRU1LJBmjdi5TT5qkW8PQ5QPbmrbSJXQWs2sChr/UT+QaxHZW92wr2yjXhIolzAAqBj9uce+DhT5sxeAYR0EHsSUwm6s5pAkxxozmkeWmYtsfl2Dye5nxounH7PrdwA4U6kMaeYqZw6E4Q8gU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=CN98guDg; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="CN98guDg"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3598cab697eso256010a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 14:16:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773263783; cv=none;
        d=google.com; s=arc-20240605;
        b=KyeoL742Ic0fh4uRE86om2LNOGaj+3NjM63UgECyCf+e1J49mejsDUllTt9HSzocEV
         o7IXxusEDthLl9YQIknAUGr1UGqwrjLnfbUuPVb6yFbThbSc3Ch9wPnoYsU9ZQAm286F
         0Rr78en70WmtVRofC9XQPvUjcT38o2gRg0qlWb+B23FnT419+XPefnd8DJCAQDiMd2zW
         LoDhleSlxyjcJ2vIu7nRx/YBeHV19jCGKyFivNo3Q6+lRiK4eTSHOSCcLdgwGZbnMkhT
         PhqdA0hpVAHE8EuSzKaOwgQpyQs6O88/6cvH9nZYg5dMO+VELOzQ4uRHrJiHswPF8uWq
         KTWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pf5daXBZojaIQjI4nids0CduVFOk5/mSFDjIjbXY2QU=;
        fh=lbtqgg0yLC5J+Bb+LYMWGJjm/2/rbt3JpLOFoCDt/Hg=;
        b=kMV8/3axe2/IkN7BtNUxo1QcTvSWJ9qXyLi3F4HhPvICoHY3yJnhDSOX2ROj+kZSo0
         6O3udVaJE995kJWI4/li1pQVWgKAaKjiy4yAGbCIPPURwSO0s8yNSI3CNcmZAe3/LGX8
         Rqgm6/k7LTHbwImlbMWcmdmY//6OD+kWzFkV7W3KYPYk11eHPdpEYtkZ0fuyXV4GRGe/
         wjA+XnIxP8HRrfgoDZ/TRJTDLGndvttiI2xaBL1LtDfTteFvbmIwx5pmHy4eYWGb7JqE
         Esp8U7wwSlWkhKcDkdADG2XEGT/MPrJOFRPWb9AQIQtyTFudZKwc2KryVLWrHpXMUGzp
         JNHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1773263783; x=1773868583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pf5daXBZojaIQjI4nids0CduVFOk5/mSFDjIjbXY2QU=;
        b=CN98guDglEvUJVhUwGc/DtQWfmEwJ6hvHnsIJeNEUiape86TNl1kBug/JTvBIFXKYx
         Fn3V9Ev3cSJM5piKWhIr11wHOa03tSIC4ZbtX8KllJyWAisUhxn9u0I9Zpc02vfXsYkD
         FD+oSzAt5yCLfY053yUJG7XI/XRY+RmJBlGiNxNhN/qbjx5h9GXjbSRSzPJE52qhA/fa
         tDfF+qHPnXh5XiP6RSBnequR6ZBLwH0uyxXE8x0/suNxH+dKBY3EWOw/LL+R8OzRW9dg
         TC6Oiqk4zVfzCBeOwu6W2t315z5qbu4jF7zd0jpLE9V7t+NQqxeJyfCRMwBGS2EblCQ3
         lcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773263783; x=1773868583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pf5daXBZojaIQjI4nids0CduVFOk5/mSFDjIjbXY2QU=;
        b=V7tlSfiyqe5LlezNlF772+hU8ZMovgAp3XoFcRj8Ejzhq9plOo8ype65nGQLZ069L5
         HFlaV8q9kEVnYPFR5KXpgXnTMmelmGpoMasq+d8seoWObzxqnSDnLqBgofAlB4dFk1Pu
         0VZpJUvBfyM5dGJqNWPp7OrtzeTym3QIUMeOWJUKRjn5uNZhWS5gRyKOUy4V3Mt+9SyF
         JedTO47JG9UO7aNBshueaypAQHZ4xMZhQZbGLuWjZDhun5ZkkFJpZU4C2sCkwPJn/Mua
         uvTGSp44c5GCVDfG84hxaZ70dYFpSKD9XXNFTuP4ELT2ASVV/fJiRV8uQY5IaNN6JAKI
         6MHQ==
X-Gm-Message-State: AOJu0YxqchVYjYr2Vxxf4XJUpg/Ed0ib69ruSrPuSdJMW1G+tJchbLe7
	22ysQK+1k0eQAstSJJynzU5aUQMdX+FekW7V8xqGgpyc77JrnJ9kX+99eQNQHKJYEF1pEyox4II
	/14zq0N3EYpUk9emxiNd9zERTvCUn42QHGLrwVMHS
X-Gm-Gg: ATEYQzxCjifn3sZA597l0/6SZhXBq1G96XJoTFSmpZRmDBe2l/ozv0+MZhiGiroOtrC
	9Gx6+DplrHqHBfivEyCheH7lQqrDSwYbWUnBPQ3PCh1G3UIPjpLOTmT7eH+tYgnGEbBV3qtRaDJ
	mm5mCKPoRW1dUdbAItsFk0yXLiPsNL1cVpY4qg7VQ/ehVWCMdAGM5EjF9xWXoihvVWBw09l2dVl
	aaTOrhbQI4P+Tm/vjKI/6zUFzcfiW24xrVKfx0NZhxMeWR7oyTvaxKvg6+xI4M8q51YFqN1CMrh
	E8DcmD0=
X-Received: by 2002:a17:90b:3cce:b0:35a:117:9521 with SMTP id
 98e67ed59e1d1-35a11a1f587mr696872a91.10.1773263783369; Wed, 11 Mar 2026
 14:16:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0102019cdb4c6011-735b3e40-8c94-4c16-ae3f-80c912784e51-000000@eu-west-1.amazonses.com>
 <CAH5fLgiQm=2YYvmG54o-MEt2m8x5V5xZrtmsqEUtuB9OZ=FPOw@mail.gmail.com>
In-Reply-To: <CAH5fLgiQm=2YYvmG54o-MEt2m8x5V5xZrtmsqEUtuB9OZ=FPOw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 11 Mar 2026 17:16:11 -0400
X-Gm-Features: AaiRm52fjaUJAiq3au7DuQIBA0ujBOBbAQbSxuKE2SXCSBOuAdeoDFE5e8KbPRc
Message-ID: <CAHC9VhRRXLrZ80Gj+Kn+x7o4v1Y5oh0HAdWBLTX-t3SVHRDB0w@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] rust: lsm: introduce safe Rust abstractions for
 the LSM framework
To: Jamie Lindsey <jamie@matrixforgelabs.com>
Cc: rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	linux-security-module@vger.kernel.org, ojeda@kernel.org, jmorris@namei.org, 
	serge@hallyn.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 2:49=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
> On Wed, Mar 11, 2026 at 6:09=E2=80=AFAM Jamie Lindsey <jamie@matrixforgel=
abs.com> wrote:
> >
> > v2: add missing Signed-off-by tags, fix short commit hash in patch 4.
> > No code changes from v1.
> >
> > This series introduces the first safe Rust abstractions for the Linux
> > Security Module (LSM) framework.  It allows a complete, policy-enforcin=
g
> > LSM to be written entirely in Rust with no C boilerplate required from
> > the LSM author.
> >
> > --- Motivation ---
> >
> > The LSM framework is a natural target for Rust: hook registration is
> > unsafe by nature (raw function pointers, C ABI, __randomize_layout on
> > the hook list struct), and the trait system can enforce correct
> > implementation at compile time.
>
> Hi Jamie,
>
> What is the intended end-user of these abstractions?

Building on Alice's question, I wanted to mention that we don't
accept/merge example LSMs into the upstream Linux kernel.  I'm
supportive of using Rust to develop new LSMs, and I recognize that
developing a meaningful LSM in Rust will require significant
shim/plumbing work, but that shim work needs to be done in conjunction
with a real LSM.

In case it may be helpful, I wanted to point out some previous work on
developing a LSM in Rust:

https://lore.kernel.org/linux-security-module/20250416213206.26060-2-kernel=
@o1oo11oo.de

... and if you are serious about developing a proper LSM in Rust, here
is some guidance for developing and submitting new LSMs upstream:

https://github.com/LinuxSecurityModule/kernel/blob/main/README.md#new-lsms

--=20
paul-moore.com
