Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8D42EA477
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752245750; cv=none; b=uDym32fGBHFwOxiwPmjw368+GvKk49H4rNqTo8hicUtZm2F9Pkd73V4CtqLRVtpHGLYgdQYyc09GEE+TpzFgGJ+PC8+BKV0zWnjV92MZ9WwdBww6OYnjphtYFydTbUVK8hPuNqmBbGZw7covzeBAliqN7ZfiYM63jgeYIpnTszI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752245750; c=relaxed/simple;
	bh=eCSi2L4WyoAMySerHlQc+ejrRguS3bcg7KrqF+uk5jQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFq1FNQpFjEI+XtbJaxif8m+c/7ZyRCoYNF8bjIiXUtr3YdV3ipRmzm+ibHoCGC4N62TFEkuJqvidhVVlxXQaOpTFKuG+1/wfl7qGzvk79JSjCqcVF1auQBbsdSjuvy6owKYxI1GK+r9iWg3YIoe9gWW6nL9A2wXOsOOcHdRkhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTqU9eYz; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTqU9eYz"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-313862d48e7so337541a91.1
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 07:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752245748; x=1752850548; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYqPy8m3YKOoS4o1WapYoZS9oHfgx+nbzVu+hMO6FXA=;
        b=YTqU9eYz+fprW/KVWEsu8yHC6vvg0ripSCIM1wb3C8tKit6e74sosIGP/miEM2OdJI
         aCQJGQA5Bsk8sqjFJGCT/aOr2aXgZ4NZUYMAv5AXgocxL4rgnOd7BKjhDsueoX9GRKBj
         rw5ytH691FIQs3II4EIuF2VFrSxJxRzovWQGXejiuN5gne6BlQbANDgiUVFCzHtvsdzC
         fw3pktuAAym1G5bP8w38OP4dsn/amHp3mVuc68BLFWh9Swgi/2Ap+75RUGkWGJrCTAQ2
         qFVQcpKVWO4kmDp/hqmbXZ92P8kqjB7+oMhR1nmqaPG02Tdt6XBPNggs1zr7VzG32lX9
         QOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752245748; x=1752850548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYqPy8m3YKOoS4o1WapYoZS9oHfgx+nbzVu+hMO6FXA=;
        b=C30nl8iTZ+CgPig5TqbPRbJLS5n3MMlgxeyljpCKRgQQm8RRWgVWfjoBcGet47+0to
         4z5q34/PHJRZB+L12h32DSEeSWFC/2YOKxRptpZm6TKnybxGXeqHYvCm9B4HCC2mPakC
         lg7T4TX2Yn4rBrY61z5uR5MsCj5T14RhHGBLJwIlIhoxewFvXewq3LZIb/j3YLAwQwE1
         vh/cHK+5LX2XlD5kxfV0lbUyE13M7B3RGOtg88VE81sBL8L/slE232qLB42is2ye1ik+
         +k9Cx0xW4wBmGsiqFHZMVLfiv9JRZfFHmV427N2egp6bH4XvG1uTdcyxN4royojQ4f9i
         3xYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa+lKdV4olLDttzlKBH7Po4wkjFvnbuQWIc40iNtwyiSujl17A2O0PlVP1kIFmkMe5hqBeuK4deQxo4KqFEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv9yMCJkklt2SBVkAikfuRWW6FoszVeVJssKKMZAsNmgDh5bOI
	oNAcWHFaSLY+wGCZbgoWPiQFkY8xNIe1+BYUTu2iR6Nvr5UfOpeW3C100LAiX+rplvxgcEgUlwm
	vt0gIYpQUfGa5gQh5OoJuMFc2R+nCPaw=
X-Gm-Gg: ASbGnctSEEareHMnaVqYbV9zikxJ9/hBNpDZuL67zMg+0flWxOKv2FjdQhoqc3TcbdA
	kh+qD+RnIRtfkP6G3lp0tIs55BPp8g8e+i8RxNtIRROESyEajvik5ZjVH+OKekgw/X8oLxlEkEv
	B95EQ8a9oIWLRMIiKSePsvH1ODIT4MhjTIL0uTvjwr9hl+c5C3rjdLvCKcxDhRnHFhDqx/OPp5/
	KGPCjf+
X-Google-Smtp-Source: AGHT+IH4AjwQKtxzZ8Mf5uM45/Hg9sfli3i+wlPcdS7HqGnsEbUMHjb94ykt6Lfs+j8xg/6Aa6DNW4VnuzYy9vXp8CI=
X-Received: by 2002:a17:90b:180e:b0:313:2bfc:94c with SMTP id
 98e67ed59e1d1-31c4cd5dbd7mr2015974a91.8.1752245747921; Fri, 11 Jul 2025
 07:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711113327.39201-1-krakow20@gmail.com> <DB97N2MN47L3.1F7450280ONEB@nvidia.com>
 <DB97YVI7QEEC.4YC9S6BZ1PGG@nvidia.com> <CAH7AjUz7YBkBJWiriNVN2q4ZxkDV1bo2dF1yVYCKq6u3Sk50dA@mail.gmail.com>
In-Reply-To: <CAH7AjUz7YBkBJWiriNVN2q4ZxkDV1bo2dF1yVYCKq6u3Sk50dA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 11 Jul 2025 16:55:35 +0200
X-Gm-Features: Ac12FXxzmHXkaN7CZt3IPVG1_A5pjhg_ezXL9GukovX8ONVwfyt3Wpnmtw4Eq9g
Message-ID: <CANiq72n6vWfgaT-fkm8Ue+0d92C=S5kavQg9LC+5a+k+SULj6w@mail.gmail.com>
Subject: Re: [PATCH] gpu: nova-core: fix bounds check In PmuLookupTableEntry::new,
 data is sliced from 2..6, but the bounds check data.len() < 5 does not
 satisfy those bounds.
To: Rhys Lloyd <krakow20@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 4:34=E2=80=AFPM Rhys Lloyd <krakow20@gmail.com> wro=
te:
>
> Hi, this is my first contribution so thanks for pointing out my
> mistakes.  It looks like there was only one newline between the commit
> message and description, so the description spilled into the message.

You're welcome!

> If `git send-email` was supposed to add a From: line, I couldn't tell
> you why it didn't, but I'll change the commit author to my full name
> instead of my handle.

Yeah, if you have the correct Git author in the commit, then it should
all work smoothly.

> I don't know if I can submit v2 in a reply, so I'll attempt another
> `send-email` shortly.

Personally I suggest to avoid nesting threads, especially when there
is a long discussion or they are a long series, and instead sending
versions as independent email threads -- it reads better in some
clients (including in lore.kernel.org, in my opinion).

As for `send-email`, yeah, I would suggest always using the same way
to submit your patches -- doing things differently is prone to
mistakes. You may also want to check `b4` for that, by the way.

I hope that helps.

Cheers,
Miguel
