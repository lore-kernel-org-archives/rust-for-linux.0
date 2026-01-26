Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92F7338587
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 13:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769433906; cv=pass; b=BDqXt5QbqZfwajb5Bs+2Sldrwo05s4dtarSyOMFKx6aAVvNIk/UVMZQwwb+nSJuyXtH8Iz4ONjBKlx+GqnNNzlkkNQJOiWAe1CDnKnfAa15R60WKYrNPzacMwDzKKwG7QECYfXVPINjw5Rcm0Rj3masiCdWiG5bIWSdt5B+qqwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769433906; c=relaxed/simple;
	bh=MRLbjaTwkobHp6B6d4aXaObtyjz3JkcZYzcojgvHt7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YT/QgPE+4xfQh+cAVu4OduTBuNMvOxXw2PQcI06aLDaQq80P8MO3r/BydhANUCOqgJiR4kNWDfoVZwRIJJ19HXxVpaaaTuRu/7qdrw5+MUXX1GvKxOFymK6iaC3tiqYLHfJVZ5FU+pX8GBXU39JteBFPdkUIrTFjjA6mRnv8TCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avy2Ie2+; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avy2Ie2+"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b71e7dab12so366559eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 05:25:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769433905; cv=none;
        d=google.com; s=arc-20240605;
        b=SqGaE5mWdjKG6lrrbTEXFoKkJCZQTgLN+THweqy/BHxeupaHGC/5W6fb7P9vaVarTf
         a+qkI1oRCYixHw9eb08L3lPIiMZQSHcOAz96X8ctYKhHUvNU6odOydAAapnODg4Oi7iA
         YvGpHCtYiJ5wK2bvnEI+c91Vy74EFXfYTOAXy5LO5uDIDSZaRsSxUm7i0vu4ase4GWzj
         IM9DqSzmI9NuVvkiuETPTvSaU5cH9bRx5zMEK4ayub3n1KXzojy/xbiv2Jjk874zUUWh
         MHHYRrQNL3fNktgrW/65RoS6RU3ljdKgG2DCiJs8zipK3zO51TOY5izz0XFPN8VbC0+5
         EPUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hc8VSEG5pqd4JhBySvVBkk3iH0tbhytE5dn1ctrL1nM=;
        fh=iSvH9b0CWzZvhb9unaQgJHuDIn1ERsDs/kSp9QKw2hk=;
        b=gEiGpq7nYCGuIT9H3S3F9UQCIOtmpMOR3IwD5HiALOykj040JVas7KRUcxF17JTvC2
         H6p/lwzaDhTHlf1+nW1nT4XKbZHZkI5G3SLDOawOGhm5I372ksWAC/2lx3XDD7MCwnf8
         ZdEuzQvBwzhgW9njaKrRoVdd/zbRz4OzUjd1doZagU26BPWz4Ifl9vUk2PCU5UspylKO
         ZRWu6IMQHcK29o2xqAV6fbiHshdNVxyBOKo1aWIxUd8U+15//oalGhvqinNLI4WleIms
         R/MLfGFyFZmB2EGYXJncDe757UIwnJ2yU1i2TTpEOVYo5wAqYKRCKAFvna3THuVjjY+D
         E3lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769433905; x=1770038705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hc8VSEG5pqd4JhBySvVBkk3iH0tbhytE5dn1ctrL1nM=;
        b=avy2Ie2+uGTS3tH56oHf1yOgMw1PhwbMiLq0xQyfwdNTFM49QFrnsyKqsIDJUPd3ZR
         sy4MbZAtFnVEV+btbfFsKC2AV/mgQRjcTaivj//HdzGmZqASxK2+9qmHuRobewn31ufM
         ooQoMHfitap/zmdW0SCCR2XJciklpOvx38EYbJIsNGA6tFMXp9d3iFHqEMJEMOg0Gw7o
         Yn8NZM/eF5JIHblDYoUG79zJEH8f1Q9vtHamUhdsO4wd01D5gKCFpyv4FUqD6uxUjOpj
         pHaHzZ9nYrwD7C6SAk8O5fXeKBN0Jx6kOD70isFmUQoJd5Vgvh1FbW4IAEtrnvx0D0Qg
         7buQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769433905; x=1770038705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hc8VSEG5pqd4JhBySvVBkk3iH0tbhytE5dn1ctrL1nM=;
        b=USz+i6Gc2HQBFCZdQyIxAVzvsc97jBcan0iCwhCi3RmgU1akdnjKAgmdlCPPsSZdhp
         Pr2yCeHNyzUNchx77iMjuWJF+5j7C+eTdPB9YdiVBTDJpztS63Bs6zhZkO1+llioa8t+
         8WRbbxp+mp+uXoClU8SZEnkIyrJaIrBrO8ySoPIuvJ8tNRyeuDByRdVmmVJ9JRZXFI2P
         D0CYmvKNOUAazP75DzqoVgQO7wy6Fzt70Ly1dAQYdNnZSgEvjL48awtYGkTfbVWEANxp
         VDLSAx869tlsyahuRMiVHAUv5X0yrVtK7KiDoxR34sx7oCb9O6c6syfcFCINE6FGbOAH
         R+fg==
X-Forwarded-Encrypted: i=1; AJvYcCUYsKsN4DJH2foARsg5QEYupWZ9sxldXYmlWJw0Efg0l1qBRHkwT5i5PFeP06sTQgl5IjOvjhcWu1899FMR3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsaJNOMiQ/oyzLkOXSWcJf7lHZmUPXC2SX0rH/duZV2jLmgcCh
	Cu8e6BwcMSW7zLePj8MxPeokTpHA0lJKEEqgg9trrGQQO2W0q1G4BEUQ1vAJw8FdSOfI4cs5wvX
	AVR2ckFjl3nrpc06tL+pEiY3Jyd09H6k=
X-Gm-Gg: AZuq6aKJdYzyR5r19LNJ/r4iKfnqtqAu85ShjzMjxRfVyo9J1eoaw+koFBWHj0WXWCb
	OcYZeWqFjLKrnrIQWLV1Q9gdXNle3Q5Xlx/WmNcezIz/tHsmFnRoN6xj6FmRPpCYcEbPqiYnso5
	kZOq+deXDeIPX4N6TlYr1nz/uV9wUbwPFH2J7UoEnq0BB1h7/nC9vNENn3q6ExSqBeT+BSsG9CI
	gxpkmCWtKGKQNQHhTB8IK5TKFapNDoHLGkvwg9RHLUbJDWayaJmt5IKiAqeM7js+jD5JnsvwCo2
	TSHXUr1f9HHJK3Xu+WtTS2uDXCyYQP5jr2YBH/N3KoBdeoqDpGWpdOFdyfC1TUMklyOFegCeBK/
	2BquLhmCoYADk
X-Received: by 2002:a05:7301:3d10:b0:2ae:5b8c:324a with SMTP id
 5a478bee46e88-2b7644f41dbmr1144502eec.4.1769433904637; Mon, 26 Jan 2026
 05:25:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-rust-tty-printk-driver-v1-0-28604e7e100e@gmail.com>
 <2026012652-case-subsector-f671@gregkh> <CAGAB667vN1jR4UX4iw_sDHCMWLOfrbVKop-f7FXy7UTH_fpCuA@mail.gmail.com>
In-Reply-To: <CAGAB667vN1jR4UX4iw_sDHCMWLOfrbVKop-f7FXy7UTH_fpCuA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 14:24:51 +0100
X-Gm-Features: AZwV_QjmKOMeOOSSYNGeASGyl3yk2bQ36__I5aF5LsngYs1v87DtwqyvHq2U0Y0
Message-ID: <CANiq72mq4qcuT-h-gBsVfL=D2DJvzXDL8dQwxif5AWiqd4=vig@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] rust: tty: introduce TTY subsystem abstractions
 and rttyprintk
To: =?UTF-8?B?7ZWY7Iq57KKF?= <engineer.jjhama@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Arnd Bergmann <arnd@arndb.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 2:13=E2=80=AFPM =ED=95=98=EC=8A=B9=EC=A2=85 <engine=
er.jjhama@gmail.com> wrote:
>
> To answer your question directly: I do not have a plan to implement a spe=
cific
> serial port driver at this moment.
> My motivation for this patch series was simply to fill the missing TTY su=
bsystem
> gap in the Rust for Linux project. I believed that providing these abstra=
ctions
> would be valuable as foundational infrastructure, enabling future develop=
ers to
> write TTY-related drivers in Rust.

Yeah, as Greg says, the kernel needs a user for new code.

In these two pages I explain a bit the usual rules involved and some
general guidelines on how to proceed with new abstractions:

  https://rust-for-linux.com/contributing#submitting-new-abstractions-and-m=
odules
  https://rust-for-linux.com/rust-reference-drivers

I hope that helps, and thanks for contributing -- a reference
implementation is always good to have in the list :)

Cheers,
Miguel
