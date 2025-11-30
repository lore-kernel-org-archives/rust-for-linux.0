Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0D11FBC8E
	for <rust-for-linux@vger.kernel.org>; Sun, 30 Nov 2025 23:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764546470; cv=none; b=sgHvhpzbJ+IrG5rKiLJ+2jAHDXSjza62mGu9ZozZuPXvsUHMyBd4TnWqH26rI812KuoJNP+lGg3Y+1KassDyx93xkSt3DEfL88pLmZ3RfQM4GPJhabn7PFIRq/L7wVNWkCkOnTzOX3tSRSJGvoIo1MU2IfM3lsrY6ATylwGwZ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764546470; c=relaxed/simple;
	bh=zggxSuJtN3dP36AaO97Z/HKAeLY+lA/l7wShxQ4SJUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cs1RGbAgq3QUQfxghAo29SC0GA21fcehM/9DV/VBslHCidJpQuqSMa5jwPGBizTcVTZXo2gSf5ir6yu3uuQUyeoR+O9yclH56rcsTzk5TIm971+p6tFlNShaAqSEbMR7CEIDArscc83RzC+DrLB4FvHiocoqVwVCDmtPY2kB1VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWIdQsZ6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWIdQsZ6"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29800ac4ef3so9692825ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 30 Nov 2025 15:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764546468; x=1765151268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXyqUw+iYqd3vAdlYrLyyviWMN/6PU9yzujnUA/l40o=;
        b=bWIdQsZ6JVNJ4RHBq7nj2dWF1HZRU3tPELiOKHTmgrf/bPkphW8jNuOd303+EinLZq
         kAQt0NIaCLQIZAeTAQ3cLtayClBTCozAk9oO9xdrVwxZ6a9OVpWrNbIuRYZOndynmnoo
         K4tBB47xfGGbIW0/0P0FYugPTQmrVI3zLef9zSJA/bzDymoCUq9lb0eChCdpwAYegQ7F
         UWFDAqoSG2FNarSnczSoWwz1hfq4T0c50Ay0X+V4xKVSktAMilEayFYhojmlpM/qx9H1
         9Ve5SQoE8V6GyFpKFeQbhUK/erDxKC38VDBYAwJprSjslB1uYOH7C+WZuA0fvLLHe8sx
         owng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764546468; x=1765151268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vXyqUw+iYqd3vAdlYrLyyviWMN/6PU9yzujnUA/l40o=;
        b=pNpOOW2SJ/3f8ZGDs9/FOsDnPi934OCGiPoSbUH9Y5Tur4aMT5jfm/MJLRlHFPvea4
         UKmN2g2/gwD2+aCZnpNdXFjrdZxVzYVEtTOb4Ni4orwxec+WCD49vx/VkYzGgefn3MH7
         yTIMSAlXCaeJ1ARDpMVc6/OWfJ2tJt+BD/5labvBpCnpyNYqhyWl9wZ1yxDZ0z9cSObh
         KTeJM4Hr6JqLmAiS3Y3vI5S1t3KVqUHZGqf8pZ0fRYGQWB7+5u6oTxgE6EQiL36pLszS
         vvVTesUoI6rbFb1l3NOIdNRx5KIlbo1uUGTxtETzapMHP6s/W0j7Z5edTVjgnT9nviPX
         cqcg==
X-Forwarded-Encrypted: i=1; AJvYcCVH7vjvqRqgBsgla7FgF+e8nlcZwwxCptMSWYEVuSgfH/jh/8TuvKyUZbsu6ptbn3k9GCXc6Wtsk97wabksOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdIKB7GUE+oN756mmYqDiN83REVm4gsYAIPeC2I0qwPB3bJ+A3
	UuqHlkltqplkVsEcnuiHJj3+MQtp+6DXnfUyh2eHqGhsf9oG7eULORtRWXkt2Vad4izaY4fFkt2
	ZhZyK4t0Mjw2pApt9TVIJUlZZdWw7CRw=
X-Gm-Gg: ASbGncvngR1c2Xg8T86t4RZIO3rjAQSkDldzUkPVint7oJa9L4Xu/RbF2ldrKUhjC3k
	XQR+FBmTSO4lSxiFd1Vfu7JiTX/tKcSe37rWsvxsuSK9paeXhMDgrcjkLLPuApDcE3YFAttTw9o
	AXXUcQkc4xABOFxaYRgAXgu84mqdkhDem9EITeEhgL6F73CsbyLA5Yj8LYAxAtXWcTde2klNa0O
	fGtK5ciY5Pt78Qa1gsde8Xug/o8bFx8+woQPWttL4JOQlzBZRQCNoHa056/Rq8AYjVtKJ2quuMt
	SJ1JGYqFn2mUXPjfDPzSSQIEhzHhup/BoD1j3eOnQzGYg7HnZehdEK7vPkAI9OIVKghm39WzYve
	nca816mWzmfjO5g==
X-Google-Smtp-Source: AGHT+IE/Rh6ilqr6KQz5y6EZs55XlqAbcfSnMx/KgC4QspsiEgJCzd948FAfeT6seO4EZ3xbvZkdSib0DWKI/IAFEWk=
X-Received: by 2002:a05:7300:ac82:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2a724c02369mr23945233eec.3.1764546468327; Sun, 30 Nov 2025
 15:47:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251130233553.1621716-1-ojeda@kernel.org>
In-Reply-To: <20251130233553.1621716-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 00:47:36 +0100
X-Gm-Features: AWmQ_bl6Cws3qjw2t2wG1sA-QkQuB-FDsiADn5m2dAXdSOxRkJzBU-ld__bZTOw
Message-ID: <CANiq72mJ2mK7+c6Q0wfN96XpWskzV6JmqLkmHUUGEFLxeCAH_w@mail.gmail.com>
Subject: Re: [GIT PULL] Rust for 6.19
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 12:36=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
>    value that requires only the 'N' less significant bits of the wrapped

Hmm... I opened a "good first issue" for newcomers [1] for this but
somehow forgot to reword here in the PR, sorry:

s/less/least

>    Values can be constructed from simple non-constant expressions or,

s/can/can also

Cheers,
Miguel

[1] https://github.com/Rust-for-Linux/linux/issues/1210
