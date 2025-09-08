Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB41A2E4252
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757316322; cv=none; b=Kh9MO76iWjlAgzFyKVaghLIjZAdHntk2xuT3f2YFGEUQqLUEq9PZV7zu9i+Ag+FIWQkv8SFKLOcx4R27d6jOUZs/OsrErqVlz0lXGYodyuspKSNEAnid+bZaiVigELOz9IBFkN8F4/SMRZsDG0vXj27PW/8TPqAsz8pj4FApAvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757316322; c=relaxed/simple;
	bh=1IVGATHi8ejldjgYw5qdJGCDNzuEtKraxGHEpMm/5Fo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=crXXF+cPHd9TokC3dpD7Esyw01emcbsj9mG+iNKHDCEALQ09tI8Ol9icASW8Il/9DJV87ULUj9GkRRjnzwQWD0VtsivmFqCnk3vyywz/iCbkVvAHoUMBGfoTgyRn8LkPhQ1gwOOAfzGR2e/tO0LDrpO9yQp62oDKps7DmTzvrxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r9xwjT7z; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r9xwjT7z"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-30cce50dfb4so3879744fac.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Sep 2025 00:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757316320; x=1757921120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IVGATHi8ejldjgYw5qdJGCDNzuEtKraxGHEpMm/5Fo=;
        b=r9xwjT7zPmPsA1epiQSMnfKT5B77cTOz7WICEqu5H2NhQPtYG5q/aqLr761oeoKnPx
         JaYpEHTNgKMdCb/0rPGRGZCVh7glhuifYIadW1ipQ5ypccDhIxveeyFpGvZSc/tevg8I
         8/pmo/5EZQlNGve36ITQuJB8TwZiLm5MSsb1JejubeCT95x9tf6JeLVErrmAdVeFcKE+
         2WfcrCnAzbKFP5QKxwDigMuKLa7WJXeDI9SKfWV2kCRUcPAGLh2fE2f+6WjBPOED4ELu
         cVOpzOuykVRZy38MRbUuKiAsOuEa2KDCDbqMM2HAKq5RMrY53CTa69YAENuImaJOE8EY
         zg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757316320; x=1757921120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IVGATHi8ejldjgYw5qdJGCDNzuEtKraxGHEpMm/5Fo=;
        b=QYJoQFlAak5WVXfYF9HgH8fZsNUzn/wVxnFTPlMpqm8aCeqYdE+3PvtSIa3yIUj4p/
         WiW1MrGmWV71sq90x/nmHP7Xred00Mr3CQXeXzxrMco4+c3tPVNzbiFVDp33qXkvNjS0
         aXWCHoEbuw4qHLsCDB6YKtbdJ/1xzLfkKSF3/KuIXB7neVtxyox79N3tK7K8YqSTEp8I
         zh+Kw0KedUnRd3s4D+cW7Ff7/fwkb5Sz7SGA+TbJur5MIuhA1e4O9Fw3mYCejRsl87cO
         f7vQHHMWXw5mSu+zXvRs44DzM9/XcV2FRUJf5eNqx2D5UdLbSu/gDTxDhgm6jkrGc6Lm
         AISA==
X-Forwarded-Encrypted: i=1; AJvYcCWUIuTX97I3Y9wI8CoLCuSHs8+66cMom1WH4g7dGphAlpnFt/1jv2hA2njhOL0uaWlzPoqhGTzeXYa5UIqJww==@vger.kernel.org
X-Gm-Message-State: AOJu0YybAcY+vGy3eDAgthNUNljB1mdCYBabSQSrN1Tp/ASc0c/huYJx
	TAmD3z4QXu0zi2Et1l9re2asfkE6DIjaIOLUyGU26vPqdUhT6ynGQUBn/NyCvLaT21WJFDDyMmS
	8DRc8PDOXfXoffoPzs0B7wR3As8E9LeFcaPGWfaGt
X-Gm-Gg: ASbGncsHHlU1U6lRyWeUFSRjkWnf+ItFXdUGS+ygpqnJK8BS+OXE9WXARaAF5EeURNL
	pvt5u76dVdz8ysbjIXRu7aiahNefN+5SdbwV9b8gqOEfY/V6WF1Oox0B76luFQewL04DW7pICbT
	BhAYPEgz3iUoZ9BKmNGrcLwOFeeAGnv1GHCgU5M/8ZJ6bnXOwTTpJqZ5UcSi6505Yf4x+pAI8hS
	nYQ7BegwZrciTyNyd2H9+iQBhHKWqE9qO1yiphyENP2
X-Google-Smtp-Source: AGHT+IHQpBdJMEJ+JmOHbkWS+aib+qC1cfVixn71usVQJ5vQxFwQ+dWroGQHGkw6oU4SVtASUcAttDOK91o157dvalI=
X-Received: by 2002:a05:6870:f612:b0:31d:8ceb:20f2 with SMTP id
 586e51a60fabf-32265a151bdmr3669162fac.41.1757316319669; Mon, 08 Sep 2025
 00:25:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904165015.3791895-1-bqe@google.com> <aLnURXW_ZiX2iJd_@yury>
 <CANiq72==48=69hYiDo1321pCzgn_n1_jg=ez5UYXX91c+g5JVQ@mail.gmail.com>
 <aLv8buzrro0E5CCQ@stanley.mountain> <aLxE0AvP63nXxciG@yury>
In-Reply-To: <aLxE0AvP63nXxciG@yury>
From: Burak Emir <bqe@google.com>
Date: Mon, 8 Sep 2025 09:25:07 +0200
X-Gm-Features: Ac12FXzvzKoHSUS7LGxzAY_Gw-DtFhqrCtBPbDteMCWDf9T5ULK3dmuoUrk6gOQ
Message-ID: <CACQBu=WUYo-mYLRJDg1zQgihK06kAQAbaEoWXyd87UQy37awog@mail.gmail.com>
Subject: Re: [PATCH v15 0/5] rust: adds Bitmap API, ID pool and bindings
To: Yury Norov <yury.norov@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Carlos LLama <cmllamas@google.com>, 
	Pekka Ristola <pekkarr@protonmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 6, 2025 at 4:27=E2=80=AFPM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> Alright, the testing is definitely failed. I'll drop the series and
> let Burak to send v16 with all fixes merged.

Sorry about this. Please find v16 here:
https://lore.kernel.org/rust-for-linux/20250908072158.1041611-1-bqe@google.=
com/T/#t

- Burak
