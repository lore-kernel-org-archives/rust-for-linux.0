Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD9E33A719
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769435416; cv=pass; b=nokgntG8mR2bApoIKT93kfU8ZO/ZFI0kDUxRRyjGekB4ZN6V6Cj6t2X4DyjdG3b8uJXCvSIUleoc1qMr8iG6DRWllI9t5yntwL1VklfNR3G2iPxcxUuFBu3nB+9yGgPhIcwtnwE/4HSHok0jY/vsB5IHNOY1mwRP0skoYjUnzuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769435416; c=relaxed/simple;
	bh=V6q1vDkOBVN2iJV/j6CT8hDEsU5J8m9HxtOkDhbi47A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ArhB9/WnBraCxzS/RkS3E+UZ200hOAnwOuzn2jTfbD2rS/K8nA/z8qcQzOrOLs6mh4Dp6Hwm0c64IYYyKQK88o+EYXH3RU/oDX2tITYRXHeXnqr4hNB2dR5poFsmnxOdC6EKqrLfgaIBCu0LaLPYCLrA/xRoZmgLjDQYN08tYKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aor+PohI; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aor+PohI"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-93f523bba52so2714432241.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 05:50:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769435414; cv=none;
        d=google.com; s=arc-20240605;
        b=CelR9It0dHR6oVihH8qhkSO5DhzZcplP0skhvLwyVn0A+oz33yMD3P6d91dsg8z5wf
         Ov4Bta+k6r5OOBcZXwPEI7neUmSbN5yc44wTm7VUbx96Hz/QrQ7ObTyL7vhAShlEaDg+
         WfMot2Tz54ugbnQa/q5f2BV3uvLmOFvENpaz73Cf5Wrh9H5N1Ai9I1xfODFMfL7dBDWE
         2UMtl2EFx9gHN6ND3C1coj0iefuWLTch6DmBmVXsN7iGVusUBYx8HmxUxY4sIefWHDGK
         spsTBsc9fA1BpIXdsLqsba3bRiuSImInqiufDwMB/92xKq9+hZX63GQ5T/950XBm3VAL
         fMPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r49LwN1hbHMJO9OD3dzM26iUUFaSPUqTq6lKzQ4cq3o=;
        fh=18mtALn0DBnZRi2kczE95Trivda/SDpzZDeHKWVNMdY=;
        b=iemvF8bHHj6w0yy3PSym1KVqUbrvh+DYqYX+j8AXN58BV18DNN+g1CZDQ11z048w7p
         ZPCnoB+80kINa84vmwJCNKW2QZ6XqMW8cApyoWnnCPrfx6biC1OqjxAiYSc1wu0HzWqe
         b9mHKNOtD2bX1xA6DUa9nVsfNNka5cxy9M6uf8dnUkiyJjdL3vAMondp3TTX3DbB0JNq
         4rCAiFrhOd1sZd5YeLuIhTEAvDLOEWSxA4b0XUSC2Ay+LicMWMDWpembeN7rtJ5yV6kG
         /3SQ0ufAH/dVfhPS547/Betn/gR1b1FN07nfRRUM65g7O/S4XXaMVVVLvcWx3Is03bgk
         BaKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769435414; x=1770040214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r49LwN1hbHMJO9OD3dzM26iUUFaSPUqTq6lKzQ4cq3o=;
        b=Aor+PohIDwxEAubhAtleWdiqqwOclCHODC9gzH0Z0XkRheVJE4yGioU6Leqby6mPuU
         XMu0290V59lCuNf6jWPgr9ylfFmTn6WVk2RTJfQTsqXLG1OvMnad59sIk0M2f9vkfrVi
         LyQSc23vwy9mVOvs9aNwTK3GwQO58bIQgN+2HLp6lqFEmFZJRaz+lwCqFzRkabDQJEAO
         262+HfkrkgI6nxS0NTpcM+0ZYubfvoYA2qMG7QSHcIfCTU2f+Z+OoVDZAIi6C318jic5
         CiVPdkRcWSUrzfjzCmVw3y/pPG0Am6iOg+hrE342M7Zbeu8kI1pYSgTDIfVrcz6WW2Ke
         Lkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769435414; x=1770040214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r49LwN1hbHMJO9OD3dzM26iUUFaSPUqTq6lKzQ4cq3o=;
        b=wqp72EhukrsUoXkqcU1Qx4fBihWBxiGwgsJXfUMTevTyNUn9BiiJlCrabi0KAh8CNm
         IFCS/3HOWfLLJnTi1lX8AMoM9RzXzN1BcN9XcAT+KXOTxEtc+y2ML+lTV7ryUX62TF9X
         7fd7MxSGd3tJBvbnT3HYQvCsTUnJEv62STsAIPdJgsNAGHNwJl4/84+2vGysYygSD6jZ
         WBuWk8i4gywflIC5gV1WbmNxZ8MPMWvcYJ65gIdxQDZbqjoNJPBjrDZ6H7489DofNPpA
         7MAaAonpNg1A8dHcNdpkMtqhJbQ7nCeKbWzW2KnZEsSHE8NE2uvAsf0qYEUSzk7iTbJH
         JgSg==
X-Forwarded-Encrypted: i=1; AJvYcCU0dxrNdRc5fQGlH/K8ayJuPQ5F5ZwkIBqTCS7l72CR4lVs1m7LZ2ehIKzpZ2AWlTKlMpto6z7mI/6fcSSfrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpbg8Sc4wDiT8Tu3nq++HOyH7TelfxtVkXaeCLLy1x1jd3lKn1
	G1gkQjo/zl+Bcqymw/ahBYwLQzowlVYz3sCMF/1/dhCE0REG9N1hRQFA9saQwyviiN5vqRlhpvC
	3YndLZUlNkcSd6Ik3tsHpSNNpL2NjZ6I=
X-Gm-Gg: AZuq6aKXt+Nx9mp+D79CzqLTqdfZLgw8PBkfEdr0z8nff5W1I9DN4nK95WLm5v/XE1t
	MyQ5WrKga9kjvzdgxuYMo38ONXT53RCyAreQ1f4Y7N4SH8tglu4NrYplVC2UcduPDbPQ2SDf4b6
	y7mOtCD1bCOToEcXolrwYBLHbIXJiBnCmN1Fxq2Q5w8stPHT3QIDX04Om97k8TfyeGfLCzKCTRY
	+XsgyqGiAZgDiDFW5bZgTWDAVhqDkoWsk0OrnCeufqvP73FpzTXi00GJeWqhkj6KLVq9wnAAq/e
	31B8ftLmQ/zcljhnIeDhD2cnD1x3jJxtFvAhWqPlzoKD2iWZCle3ck+91+PaGX/Ce7UXYlEOdXo
	el/HmkNcuigQ1
X-Received: by 2002:a05:6102:e0d:b0:5f5:3efd:4c5 with SMTP id
 ada2fe7eead31-5f57741d5a6mr1292908137.18.1769435413971; Mon, 26 Jan 2026
 05:50:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-rust-tty-printk-driver-v1-0-28604e7e100e@gmail.com>
 <2026012652-case-subsector-f671@gregkh> <CAGAB667vN1jR4UX4iw_sDHCMWLOfrbVKop-f7FXy7UTH_fpCuA@mail.gmail.com>
 <CANiq72mq4qcuT-h-gBsVfL=D2DJvzXDL8dQwxif5AWiqd4=vig@mail.gmail.com>
In-Reply-To: <CANiq72mq4qcuT-h-gBsVfL=D2DJvzXDL8dQwxif5AWiqd4=vig@mail.gmail.com>
From: =?UTF-8?B?7ZWY7Iq57KKF?= <engineer.jjhama@gmail.com>
Date: Mon, 26 Jan 2026 22:50:02 +0900
X-Gm-Features: AZwV_QiNmjXSf8dLjN4s_3K-wawL1ak1XX24kra6-5S6vW7fOjeew1zB_ik6BSo
Message-ID: <CAGAB667rOUekdKuBWeJqOOQQbRg5d3kj2R=Srbbk03apDZ6WWw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] rust: tty: introduce TTY subsystem abstractions
 and rttyprintk
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Arnd Bergmann <arnd@arndb.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 1=EC=9B=94 26=EC=9D=BC (=EC=9B=94) PM 10:25, Miguel Ojeda <mi=
guel.ojeda.sandonis@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, Jan 26, 2026 at 2:13=E2=80=AFPM =ED=95=98=EC=8A=B9=EC=A2=85 <engi=
neer.jjhama@gmail.com> wrote:
> >
> > To answer your question directly: I do not have a plan to implement a s=
pecific
> > serial port driver at this moment.
> > My motivation for this patch series was simply to fill the missing TTY =
subsystem
> > gap in the Rust for Linux project. I believed that providing these abst=
ractions
> > would be valuable as foundational infrastructure, enabling future devel=
opers to
> > write TTY-related drivers in Rust.
>
> Yeah, as Greg says, the kernel needs a user for new code.
>
> In these two pages I explain a bit the usual rules involved and some
> general guidelines on how to proceed with new abstractions:
>
>   https://rust-for-linux.com/contributing#submitting-new-abstractions-and=
-modules
>   https://rust-for-linux.com/rust-reference-drivers
>
> I hope that helps, and thanks for contributing -- a reference
> implementation is always good to have in the list :)
>
> Cheers,
> Miguel

Thanks for good comments!

I will make sure to read the guidelines carefully to align with the
community standards for
future contributions. I am glad that this series can serve as a
reference for others.

Best regards,

SeungJong Ha
