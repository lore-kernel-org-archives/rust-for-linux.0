Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C112C2C2374
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 20:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764014435; cv=none; b=r10oCUr8ObTMJ/pWa4qOR8WYersGCH74ZZjFox+Br+Mr9JYrWk2CFxcwYVxd1CuDIVKuq2J8QHa35Npre3hxPaQlY/Kqb1mnNwg5qws9SWPzH/Q7gb/gkKQ6N+donfUf7x+AF8TMVf1y7vE7JfN2U+gmDgWuvR0dVgszVCMsmvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764014435; c=relaxed/simple;
	bh=Lqzo6KuYQIpSG74Y1hMug1+AjSFkQw8fGrQ/Uz8sHF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkU5hid4lmJM5CKV2IAn7zvvIAuaP2tMT0T37UvWdqHeGu0UL0fYuE9GOAnVSlpaNyfsUMiAiHwi12XyKyDAWFwj79/QckuYgP/aBHARolvFrp+SjLx4P371h9yP57XpmdB5qVo80Pw/5rXmYrfX0rt4tbKAKz6ptZW2rauZp1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hm8b1of4; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hm8b1of4"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b983fbc731bso541297a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 12:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764014433; x=1764619233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lqzo6KuYQIpSG74Y1hMug1+AjSFkQw8fGrQ/Uz8sHF0=;
        b=Hm8b1of4wAr/ckcNnC4QPpCfdgdNqitEg6VCQqtvgOF0O5VqYGViHKze96agOOosZN
         KymlxSdd7fjjtrtY7Ep2yTE4xqr5bAiNgft4X3a6VZBkcaD8NLKK2GOkVRLugM61hV8P
         8hQebNi111AHAYQ16zq8gREaRic9e6tNoRf/5/qOBSB1HUTXBExqud/rldkvJFFEYF2I
         EVH5b6Q+wvupRjpsAAUXdKrRTMmcO5UiLYTZnz/iugfhmgpS//9QDe3Vl1wMPMmmPCQN
         U44pUaNTWodEH+rWDbSV8IiY3JUb0duoe/wfU1UqOol84Pyd7AMhCJNVhEeEDFGDIO40
         lGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764014433; x=1764619233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lqzo6KuYQIpSG74Y1hMug1+AjSFkQw8fGrQ/Uz8sHF0=;
        b=YIw9FTuYQd479KshuGndFVkh61mWk5RfotMMlXC2cEjKaGyT3clKJCg3rHHMaVjKex
         1LNJbE0aPaZAN+OTMV4AY/DyzY5sKIdRmxi6L/5t0tkprVjLxf/Uebm5s2/j2XmFTkAM
         Bvl0+YYVkYJoRyBnIafEF3c4Bcj+j8aEoEMe7yx5hCD+7EnTZ2LVwr+3tqzBQx8krx19
         1vr9OXQyqATnqb2b9MvBSrhgeUzdS5Km2Q2aI7FfKVTV6FVyhElp0BHCq/dpquwR4Sj7
         BdrPZProNo1tWZZAZKuB6mlBRhxMGlPyQCqxkZ2f5xXgiG6+lCY25JwgC3wetFOyO6Uk
         eU0g==
X-Forwarded-Encrypted: i=1; AJvYcCWBBX8SyduLs/BW+B3OhTtIiycOR+lgQkkCu3WDEghBStGXzwAJypywIV5ZmcftuR1xCH6AJQ99FKvKGQ1JEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+TYjpEhhVo08AS6WMjqdflql0MFyVD3Bj7mu/GfYccptN2lHr
	541PJdXyAcnE4Rl0tfPyhfqHxQV73PgSKi4SXZYOwvhBNAK3Oo4yF50EYKSpWi/VAwxNnT8+aJR
	pkP5enlSX7wD0Biangfx+PP9CnW061C4=
X-Gm-Gg: ASbGncuZjiPHSLqZBMVz2xTKtFTuzb7fmjauyffvUFr/cVLTk+J1p+bvBTcGRnVxzDv
	4VLpsoWEAiP9tIm7nPAGt764nG+StWYixUv/fMcltihTzX6z+Bt7Sg+pUoagV169gXDzhTluPzo
	p94hd8bgM3tOKkAIjJe859EKfHorR/Y2/gDPtujS3qGbBilcmsO6IM9mclwr15inyaH2bxtrlxP
	wFhmV75hrqKmHSHeE4b8P8P65jT2Kh5YFg+FUCymu5AcrTDboUNk4nBXlJxfE95GAlIfs/xg3+s
	1VGv6QjYJ+fUmuznnkNK4F8xTcIeaor0UFLUqOJ7H8035pzrsorfrAFHQjxhdUrFfaVvSe9jgl+
	1WpNCeNwx6m2k7w==
X-Google-Smtp-Source: AGHT+IG4tizPpCrTS+t+qkNKBZLnkOofnp+IcXAXiJUxVZzoCXq66aOaGTcbmuC/WZL2HHhfomtNvIkgZR1CwBs8/oc=
X-Received: by 2002:a05:7301:1906:b0:2a4:3593:5fc9 with SMTP id
 5a478bee46e88-2a7192a30bfmr7648989eec.3.1764014432680; Mon, 24 Nov 2025
 12:00:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-10-ojeda@kernel.org>
 <98e549da-b7d5-45bc-8a9c-d05eb06a75e6@nvidia.com> <CANiq72mcQJnW-F+nb=Vseoa_amcwwhkC26N9BOs12MVfMVOdVA@mail.gmail.com>
 <27735776-7538-495c-b4b7-2ae8893d28d6@nvidia.com>
In-Reply-To: <27735776-7538-495c-b4b7-2ae8893d28d6@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 21:00:18 +0100
X-Gm-Features: AWmQ_bm6tYrxXRTZPykfJMBebDHDGbX43F_-36XRzN696OPkPdmldh6vK4MLJ8A
Message-ID: <CANiq72nAJeGZKZUND8Cwmd=V5_rWAmA=KYUD-TZ6auV9qmCtvQ@mail.gmail.com>
Subject: Re: [PATCH 09/18] rust: proc-macro2: enable support in kbuild
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 8:37=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> A minor thing, but, it looks like maybe this was forgotten or
> overlooked in v2?

No, it is there.

Cheers,
Miguel
