Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEC7334C0B
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764606627; cv=none; b=AgpEJ0qSdfFn8kSkHuRRQGdX8GCsPt66l+4ImhGXTNABZUHeFjwoSv+fTg1RyqzT501sLU3Tv0xqSbShpEportNlRJL0Mw02xyvgDMkLicvu9zJ3oRtdVo6bt8A++TzpUd3eGTcR9nkKsC21W2V9fx5vwBwOKLI438ymf01wQY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764606627; c=relaxed/simple;
	bh=zpKbkUkQrhP8Z8G+eZrB42QlKP9ymO5xUUiC1g9Bi/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+m4oFT9oYPax9vfGkp4HZysgVM3fm1tZ8sa6kFevEzzYC4s3L7rLeK5eXZMbRV4L139L6o8dnz1Y3v8lD7VbKI+GJXkwmA1atLBv32rUReg+UE9pOAOxpvYUHN8NTrW7hDKgubS0iLYljI0xebYtTsDdHqHcMN0aBEZYYYjsQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZjDmW6a; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZjDmW6a"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b9a5f4435adso255412a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 08:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764606625; x=1765211425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpKbkUkQrhP8Z8G+eZrB42QlKP9ymO5xUUiC1g9Bi/g=;
        b=BZjDmW6aSk8coDJLlfCMz7XX/PpeP4g7GsVX6FDsePUr1MhUF0I3ZtGQ4vKl5+8rNA
         dQEQ19BYWduDEZKIUAAN/0YsD0aeAvJ0jHO8ljS5KtJem/OnsY9hpnXbbI85xvTf5UG9
         zwJcyd8XS2JgE2ZLV+3lToGef7yjVmxuNpo74QkFTJ008HjZ/VU29neMgS3MSYh7zr8V
         QCgEG0ottiVg8gjGWBsc1svovyQcu+WmzwPz01U+y5HSj/8n/ajY7ZiXTqFvkyrRubi4
         bR+jOpfc0VzHKS3K6d/fBok0PW67e0s96tiYgkqKYvinmScYhj4iU4ENNiCDWmkTiEF+
         VWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764606625; x=1765211425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zpKbkUkQrhP8Z8G+eZrB42QlKP9ymO5xUUiC1g9Bi/g=;
        b=BSjzvhUFNX6R+fVLgCRkvf4JwHWqa/pAitP1BafClj0IRCo2KYs1Ipj09VQCH4hs+q
         yAnJxmfAi4p9AB148Yu0s3a/rmg78BpZeL2ZqMo9iEAGwpfYDbXSCYhcOjmR5zcV+bzJ
         zArvVPGqU6D+fIOiXT7D4zyXFeWZDoxyts47NnAiFNrfACWK3bO+tK0yLa/bErfbb1Cc
         P/18A8UHfxzuLmuZkIGozFaGUEukySfZliIjhibLZckkRvVyu13SMCjXqNurl2UJ3ASj
         Ts0KkQDs8kHhXjMNv4YemKTZhkGbJVapoG11g5aHgGghVsIR+vL+GN7wPXP6IthjGEfw
         Aexg==
X-Forwarded-Encrypted: i=1; AJvYcCUHkg2AYLRHFoXRQEHjV+9lMeMS8/nhHQzv2N4KJRB/GmB+8zXCvcEHsgS341se8scexygXtHyAC3SngitQYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNyBa+y9WM6RMAB5Gq6tndUej0WERP81H4OgrLScMrMD/WJ4oY
	EnB7q+C3azZUH6ArL4nKusz9sDJmUFURMICEkoN4dSkUhPePi4W7hXE2ARl4uil+hRR4fCsHviZ
	uu34LmIUCoZ7N3qi5iQDhYdqZ8E/E1iI=
X-Gm-Gg: ASbGncuNFk63OqakBDmvPaoB13dqFNGsIf0k3Gg8yaM3zFlje5dfhIC4mz78SLnIK2a
	D7pUvnZvhAFud1uKRwEDkOOMU1lj1wooHfM7Cp5pVAdJCwklWwjFD3YMVoWxucQflOLiWrNhurY
	pTaBpD12HU/uVCkqE1hVlRkAwpM74Kr3s12PyUhPCp//c66CAQ89KlOLAYVfnjTfxsVGC9iEHMo
	W78mbJk9ceZAZBfFVMe4r94rcR5v7Q6YfGus7pGqugrLO16F8Ng/a70PFjDA7zIU2sKGcu19lfC
	YNa4c8GpMXlijNIbNTxjsznr43MOZsNxeLtZOkf10VRWEU/Xo57JX+QXYJhf7u5tFx7UAuIVBPr
	COLmpnOPxm8JMSw==
X-Google-Smtp-Source: AGHT+IEf7vOC5mAqU/omo2/IqPWzWyzZXuA9/nGkYTAFHB5XIB3JrboNwDg1L1ZxYoKdJ5V3/dY93SPwNN1ywHBmg28=
X-Received: by 2002:a05:7300:570d:b0:2a4:4862:c97a with SMTP id
 5a478bee46e88-2a718ae7143mr24440001eec.0.1764606624691; Mon, 01 Dec 2025
 08:30:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201021659.1729308-1-ojeda@kernel.org> <470357d7-5958-4470-a718-25b9c7660565@nvidia.com>
In-Reply-To: <470357d7-5958-4470-a718-25b9c7660565@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 17:30:11 +0100
X-Gm-Features: AWmQ_bnMEmfxLG1OVV1esCiKsI9DP3zTI0SclB2p7uTVFkawC9SWtkbSUgpCJPI
Message-ID: <CANiq72ngYj4qRwBUZoaS+aT8uAsjRRvY+i5t+L26GudN_0KVLw@mail.gmail.com>
Subject: Re: `KSYM_NAME_LEN` strikes again
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 5:57=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> But if it's actually an option, it seems like a very nice one:
> a durable and long-lasting fix.

Unless something has changed that I am not aware of, it is still an
option and it would avoid us having to play these games.

So if someone has time to implement it, then that would be great.

Cheers,
Miguel
