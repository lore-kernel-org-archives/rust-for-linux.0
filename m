Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27634AEF6
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 06:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724394314; cv=none; b=obN72dH9mbdHNusPvU0NwBPBnUrq4B83D3sbzvBPxHffViVnN4dcJYvjfY1T7wdTeMj1xH08WquUV0YHxOXFtewdOrMcyEAmR9gdfNzJhAdm1z4q9BU1iQAnMVG2jTYSeVnV2b/PiiFKVUSnWpPms4Vq7uvlYqbaRXslkPa+loU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724394314; c=relaxed/simple;
	bh=uTRDmNTNASIx8tD2y3WpeaSo1SWbX7RC0mme/iylxr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mEuUMen+9gzY1AhB7bpyXlEnnYL6xL22BzX/6r00eDiwlFOwJs7Fzm4YYs6jBqYW8btwl/tbGgyDeFOvYgfofkycMbAWWP53RFF1XrQhcfhD/9B+tcg30WRi2sl2r88QfB6S5V9bSkj93hfQfV7k8QPiIz6aphqRHNaS3F3BxB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=AV4SAoHl; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="AV4SAoHl"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6b4432b541aso14800327b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Aug 2024 23:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1724394311; x=1724999111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTRDmNTNASIx8tD2y3WpeaSo1SWbX7RC0mme/iylxr0=;
        b=AV4SAoHlxZeZCXAtBNCnR0zR+liE9BFULgy+NPlINoWo8OH4Vm10AsaHs08nzhMAOS
         FP+OlDNfuXz+pb37ScO0ZCvG6ojWsQSWTmbe1kB0dgYzuaKR91cw1vS2wKNA79j5B8D4
         AWTnmC2u9Idfyo0FG5A6Rv9HkNC1YdFV7blSuk8U5ng/v6v8knRyMJ6vbUNZvkcOzdH3
         OkxL5GBXwhTJvFMpYqLmT7BsNnmka01WlN9FR8YsXNNC+Xbd3mQBD3slusRIQNyPSmcc
         dfYlXgKEdvWpgz1CV6ZDlfAddozygEAUxaj7L7mt6tHbyyCA4O3Vnhb4Svk3m4pTfWgh
         Dsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724394311; x=1724999111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTRDmNTNASIx8tD2y3WpeaSo1SWbX7RC0mme/iylxr0=;
        b=KFpPlQItrix+pDmw3RM6vEC7FBw/rOb464g85gqoz76TzHc7QJwtrAWKhobLQ6UxLP
         HwsWDZyOlWzd3oMbG3ui5w+7qDhdPKo+o0OJMqjjfSo5IQlqexlv2T531K6r6zA/n0mC
         q4IJuVP2GWGujDPkvEypwkB5tfNH7ePhExNDiVBkvezdUm0gIEkbfB8Loa14ezmEXKcx
         AoquvftPfxg032ckC+eKUE/PBVFmN+iNRj+sFE+XZXQ4e5i7rCSPh0Zp0DySA4xA1Z7J
         Vzpa8Gp2uh7ZCiULAK+0lFh2jhG8rWsOQFkuSgq1LlOSfCGiSKFQ9f03EJK02seupXQQ
         QJKg==
X-Forwarded-Encrypted: i=1; AJvYcCVfQnJni/in/xbzJ1x1nKl72+9Ipxdof1VU2KzhCcpWB+gEe57WguJPe1dhXZdFn6T1rJvHcegJk2n7sDgEoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFGcLgVmCrcKMW3Ke5HpLHNFf+LBINhklnZ+n6wnWJxeOs9/ph
	htAfRm8TX/Yt2CmVrqxaH9mJyCnO/i5lrus1hE8EprqeoNYc2uoRpfMX71LmoSekcav4s8k5Vkf
	BsxXzP1fRTr6cpga1BKCb+rtHFj44mPxMXWFRlw==
X-Google-Smtp-Source: AGHT+IGw86xbHJzC9TvG6tJ3caSMnWuI8bJiJwTdKBb6BQLQLB/kjcESkhVBzJnPXPzk/bBlVYtd0+JtOmfql+B74gI=
X-Received: by 2002:a05:690c:2c82:b0:6ae:528f:be36 with SMTP id
 00721157ae682-6c6251a44a9mr11764317b3.12.1724394310929; Thu, 22 Aug 2024
 23:25:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240823050359.1737893-1-workingjubilee@gmail.com>
 <CALNs47tTwECK_pX=RbC3Rj3AVovO_a3_ap3ctCQj724FJVQ3Wg@mail.gmail.com> <CANiq72=jR0d0jC6Pzz8CS0gmgfcKp-=nBebGWtbAO_rYvWegUg@mail.gmail.com>
In-Reply-To: <CANiq72=jR0d0jC6Pzz8CS0gmgfcKp-=nBebGWtbAO_rYvWegUg@mail.gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Fri, 23 Aug 2024 01:24:59 -0500
Message-ID: <CALNs47vP=D__NHj83kM4o+z7gv4NhKSpr02Qjx2vm-qEmUqEQA@mail.gmail.com>
Subject: Re: [PATCH] rust: Eschew `Box<MaybeUninit<T>>::write`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jubilee Young <workingjubilee@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 1:11=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> What we discussed was to simply give them a different hash/tag/branch
> when this would happen.
>
> I don't think a patching system is needed on their side, since they
> don't have a requirement to keep the source fixed.
>
> So I will just give them a new target which can be put in the PR to
> re-try. There should be no need to disable the CI nor block rustc for
> simple cases like this.

After [1] I was thinking that staying on a tagged version was the
goal. If this isn't the case then sounds reasonable, thanks for the
clarification!

> Thanks for reacting quickly in the PR, Trevor!

Of course :)

- Trevor

[1]: https://github.com/rust-lang/rust/pull/128322
