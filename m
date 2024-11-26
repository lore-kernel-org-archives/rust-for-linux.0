Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B431ABED8
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 22:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732658881; cv=none; b=uA4i7PZZNKtysG8CWuw4nCIOQy/iBjAh7+EPCpJ3uAZBcztKSGny7hTQPKhm/q3DEKmnx4tT24/qXyd7LLfJn2nY4aITiH+A5LdZoy66CVWC54SntvXrs30Nqrpq66VflWQ7Gi1NTSi6vazo2fvKHZJe3ImJvjNfe8aZzooimx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732658881; c=relaxed/simple;
	bh=IEVN4T2SR215oF5cys4HUFv38ni0R/Gk0dy1IEM6Qvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZXZdPrkdXon9Rgk0tX9zv1u6qKs+lbMfa+GjxkYQDPEPZHOYDRYPrkqgfowQ3635nuanuJDbhcIgOlvB4etZeeyWiZlzWJIVJkmXZ2dNwkCDEwwjItn7I5nvWJr7OD9Nv0LcEBFBmJgsgC0m6gLX6DsR3AHYvzOiXv7E26Lqhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WN8qdyQI; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WN8qdyQI"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5cf6f367f97so7430821a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 14:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1732658877; x=1733263677; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=51WI1mXkoBmY6OBXkSDIn4mCvqR2Qj99m2Fc3Lfn00c=;
        b=WN8qdyQIkZWlHjt8OkiXt/nze82y7ArdlBBWUhLlFujEwPHzJdWWrzUkXDSUzlgVWg
         B3GPO4tOylXuFKT9NRPL2jqczcRmkNXHEwZWbZok0KGtX03PXjT2U/2u3cMeyB5HIRjS
         Te8oKfaKg59ZJpf9FC+9nEFH+X/Q5SgLEZKAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732658877; x=1733263677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51WI1mXkoBmY6OBXkSDIn4mCvqR2Qj99m2Fc3Lfn00c=;
        b=i8sYR/n+QNw8CVo/KomRUpMGdhRhLWK4i7qo7NKmQ0jOcS5rW18Fwg/ZIUTh+cyKjF
         nksFDVvJMnOZE50efOdUz5xrguc/fQiRlyRDMAIvtXokYo1k3y/3qAj9FGHntL5w8vp+
         Qn/ZaxgEWrc4hVGcIeyKBTdvjVp2yiwe5i5yrVxFrcpDV8gTecpZZre/86whmpSzI47H
         kP/aVKxHPWqaKPQD5pa0qrbdp1Ah8niVv7GXgxjQBmcUhw6VcdJTyEQ7kkAoThrWcMhm
         pCvurWSqFBXwHr6Pulcdz8O3FSdgKJMH4ITqhy8xmPKcvht62IYaiQ9WDImpRz8hOfgL
         rOUg==
X-Forwarded-Encrypted: i=1; AJvYcCW76+Zwqi/J3Tsp0XdBtdWQuzuDcFrU5++aT0ceW++IkSUuNesvOCoV2uFwjXvQYHb/+j+as3xmW5twunMUrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTcYoDT782nsjxzwadUk2eXQHoCAR96pY4izluUDxjQuCcn4u8
	BBR9FvzinVnA4gqzqJ1OhsnsheingeWF4oJZCecpo+yI/kq65kz8LkSNLKBn+C/dIKFRisqfif5
	IRnunqg==
X-Gm-Gg: ASbGncuR+iNJepFwd2XBlqImLRZR0T2Ql/J8Skshok0hvQf8VIf0r5QLl9kFocTGfFl
	nTyAh0vfewFJU1xmAjjXruF33ZSdmY7T92/sxc+puVX8vS4zEdLvPLMBHz59FdCY0efryCJkE+5
	BRibDv/7ozLCXhcxCmTdr6RKrhjcP1H3I7kG0iWCBUza3RrExNNB8/f+H5dCSUhh4n43hjP8Srx
	rl8rzc9nwjnVeYhR9KA/f87ip+YMlKfdY77LmXyavAsCCZlzR+ag3uzcOPL9XVYZcpwxjaUQbBn
	gXfoKOznt53VX3GXKqKxwm+B
X-Google-Smtp-Source: AGHT+IHHbufhbu2uSNKSQWKlRyXVGig6FsMuRFVb12fSunOJEMj2MctmW3dHALEzTnxXXvulWrsaJg==
X-Received: by 2002:a05:6402:43c9:b0:5cf:e3eb:5153 with SMTP id 4fb4d7f45d1cf-5d080bcbf86mr614390a12.16.1732658877370;
        Tue, 26 Nov 2024 14:07:57 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d41aea8sm5422015a12.85.2024.11.26.14.07.54
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 14:07:56 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9ec267b879so887253566b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 14:07:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+874qDMxM245B8kJ8g+nOpjaPItP65IW6TM3QfAOo6PEjVRsdWSPgLrEolKfdab7qSzANM7l2S6Kk1jnpzw==@vger.kernel.org
X-Received: by 2002:a17:906:2181:b0:aa5:c20:654 with SMTP id
 a640c23a62f3a-aa581033187mr33996766b.42.1732658874466; Tue, 26 Nov 2024
 14:07:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126022500.718070-1-ojeda@kernel.org>
In-Reply-To: <20241126022500.718070-1-ojeda@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 26 Nov 2024 14:07:38 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgRSWz=5e39P3Xb8FmsD6Qa-_LFBTs1q2m53yrw-yCSzA@mail.gmail.com>
Message-ID: <CAHk-=wgRSWz=5e39P3Xb8FmsD6Qa-_LFBTs1q2m53yrw-yCSzA@mail.gmail.com>
Subject: Re: [GIT PULL] Rust for 6.13
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Nov 2024 at 18:25, Miguel Ojeda <ojeda@kernel.org> wrote:
>
> Conflicts expected with both the vfs ones, trace-rust and char-misc.
> The conflicts aren't too bad -- the resolutions in -next are fine.

Well, please humor me. My conflict resolution isn't identical to
linux-next, and my rust is still very much "monkey see, monkey do", so
you should most definitely check it out.

           Linus
