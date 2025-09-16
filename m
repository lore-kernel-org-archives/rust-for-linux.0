Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2195331E8BB
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 16:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758040858; cv=none; b=XisksTeY8ttsljtV1gOgpSCXDu8qQtGhYylEZD5p+kmSLnULOESd+6u78oeoFuavCjjs2fFIja/XDPKMiAXgJ6CqIYGXO7P+j59Q5zQ1utXk23qlc3o/b9g4/lMlbh8h5OaOfxPCjoujliXyelNwSSLmjCRMkXwZBgQPNEfKg+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758040858; c=relaxed/simple;
	bh=g60Tzjs4O5LCL0qg3eeCW1cmWOXfWP3kS/U69raDg1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r/LWRvbuBwp7hkRxQsad1HmQ2UWutGwCc3BUaJJ95NboYUT/wHWYU59IYQChbYiAsA8EaURbjyNdhUbPTM5oMohjz/5Bms/xyPH0rZEPdgEXUpX1TjHSWQZj/1VaZGflQkCTr/ZZpVClukM0mAmWX6mCNXDjjQFTPA94zskIkaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3FTTHf3; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3FTTHf3"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-32eb8144fecso114706a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 09:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758040856; x=1758645656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qT6xFwbttKqsz3xIF+BEqzCBG7ZO/EJyLZpLfjCbqc4=;
        b=k3FTTHf3+2kufxWFVJXESsrJlP6XrpnqvnYTzeAuBmXvYLYauHUGo6evLvIsXUiJO4
         yYdVfwdRDd3yIwdakMGgMAaoX5Hian3I14RxuiOQjowMa7yyXB3V2pMGmuI45v3pOdZ7
         lDGcCgIVIaRk8dtBXdYO5Sje8P59zFV70nacSYKGBa53L1NrCZLGx6+RoIJ8pWvmPZov
         PtoFFkvE1F8nlZuhib3Nkdr13HNfnNYGpSDUhwFA7WULRMAIw92RxNFqVdzyHz9hCLgL
         45cXiIDFBa7+vgfC8lL3AJK7aeTywEPxNzKM+gv3tKFlmH4BdS52BwuxgxMC+8GJl2CK
         uO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758040856; x=1758645656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qT6xFwbttKqsz3xIF+BEqzCBG7ZO/EJyLZpLfjCbqc4=;
        b=TNA1iM1ZtcULetSItoI4pXqcfMOmRlX8nmICGAWkEjjV67LBdVOKQKl/yzJFJiVWr9
         Etb0/SWKr+uNV0vYZOeKULU0MvdOTt89OocGyG8RV1JdXbL71lJTI2aKSa0FKZygJZaJ
         Bw+Sli1tfE/SJQaxC5joYAE3wXvxLRdBvFGi+SMGLEglxhIKmLHif0jISSxhur8yhXf1
         qvSxqpgpJEv2FZHbBXKcYb0PMa474Ixg0V3qRVi4WJEeiD/qvcW3KRI8s/z4FfBBZWOV
         InCODtBoOC4xeJ76BIQc70M33a1X8rFc7c3Wlq+VvAvg+yXrDMM/uofjZE59335RXa+h
         kxwg==
X-Gm-Message-State: AOJu0YxIX5JPEEEWbDAsJ3jWitYY7IDayMfy3cVjcUtM3ABwjn9hbEJy
	9YwXZJFc+07/YXC7Jnn3x9wQzgFVE4KroIwmbfr1ux8gqVIQfj7YuBKXxoDmvUxVqb3OI8UzcOE
	Vm2Dnm0XgjC5IkgIsSiyY3lfsh2Ep4hE=
X-Gm-Gg: ASbGncvvAok6bqxNVxdu5krkgJVgOBFSIcJH+2b5LZWY+JqoEbR14zm84/fDxJouP+B
	i00gYVnkOdSKTLsc4J05TKNj6t5XXq0Di+2PYev+cVmZcq3pwyF2vWtGiv3fJ8TxQFpdHNHrjxZ
	k+4aySNqxOWrJV9Ba7ux2GYlA/dNwhZZh3XA96qrytXcqM6BUrBt7QaJqBHDKCdJZd0WplDehpr
	jDNyKfKlcbdKAGoJ89v2hUo+kWPGbUTEjSatt88B8Fjg4rT6N1GypP+2P8gSZJnW70mh6YiSkeP
	ItAKORSxtoX7ofP237DsSTnGEg==
X-Google-Smtp-Source: AGHT+IGBabsxkqsMdP6Mj42hWfXp0yd/NwdNGOjJPOcIz1HAPNEo2Rfj6PVd+Epk4FzX4D+qrBYZPf2vtsY7bgWpScc=
X-Received: by 2002:a17:90b:3902:b0:32e:731c:4136 with SMTP id
 98e67ed59e1d1-32e731c435amr4683218a91.8.1758040856362; Tue, 16 Sep 2025
 09:40:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYtT7HNBM2XBbePeZ-Fw+ig7SJ+JE_NpQ1VuHR_TvAjX2w@mail.gmail.com>
 <CA+G9fYs4JB0ngq+aryXHVQSq-f05cb4agCfyM9zN0SgprQf0_A@mail.gmail.com>
In-Reply-To: <CA+G9fYs4JB0ngq+aryXHVQSq-f05cb4agCfyM9zN0SgprQf0_A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Sep 2025 18:40:42 +0200
X-Gm-Features: AS18NWDpgJqn2it9JPJgJZvek4xILevkaOGq8NT3omdX_EFldQlgE0iGcw_8yjk
Message-ID: <CANiq72==_ch0_7ZD8EEc2AOW7Yz1-b8i2ae0X6xDSkLJy=Dm6w@mail.gmail.com>
Subject: Re: next-20250915: error[E0425]: cannot find function
 `atomic_read_acquire` in crate `bindings`
To: Naresh Kamboju <naresh.kamboju@linaro.org>, Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <lossin@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 6:26=E2=80=AFPM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Anders bisected this build regressions and found,
>
> # first bad commit:
>  [eb57133305f61b612252382d0c1478bba7f57b67]
>  rust: sync: Add basic atomic operation mapping framework

That is very useful, thanks.

We (Boqun and others) are in the middle of Kangrejos now, so we may
take a bit to reply, sorry.

Cheers,
Miguel
