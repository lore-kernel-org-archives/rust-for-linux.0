Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BA7327C00
	for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 21:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780002538; cv=pass; b=l8+JQGXzOCH0uJZCXKeN34Av0NkfWuTk71kZ3WivbrZx7GDiQTz9bypn2COL5JC58mNOJC5bQZ16bpZDIa0Xs7CN44hro/9mMVMB4rJWfqF/WtL1ZWwtzrGK0RtDxChxmXCIjX1R7Xi/lnaHXZqGTxNYJ9WZYu/VLBxF6G2Lgkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780002538; c=relaxed/simple;
	bh=s4OOmTRsrwxqAl0aCapSYDllXxyR4c6KCVbQKsao8MA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=utGK36cpAdnbQuEBJ3Eqhrt9+z2UcY659CUJDOWX5aXmH5hfQBig59zPSDa4de5lqJWeagFR5VRd15vicmkUC8dcSQIGYTVgViujutx7FuE5ANSMYrccS+hI2Xc5B9s3d46+TGvZ9pya2SNQMWoLxIq0l3ZXNF10jkCQR4U4MGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geXEryc7; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geXEryc7"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f5ae07e2b5so1111850eec.2
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 14:08:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780002536; cv=none;
        d=google.com; s=arc-20240605;
        b=WIKazcn18XuFdImkvoFDwm9Omqr3cZlGOqY/6wkLt0DonzAky7TfRLD+hmEezN3YYS
         eIpq/MNlIJvFAu+iwgvhTlsZLeXPzwLoTuN+bSZBo4PipDX2Ua50hU5+o/+SIXCSZXel
         UDObAUX52r3wMvtvCPD8P59orMY+U2VFz1ODErLUm8Yq6dhGMVPmT957Z/QCblWz2csn
         G9UKcuu36Eky2aCqZBzt1EThgdeaMrjkh7DhNnzwpzG+hJATztmXn5j0DSQnrKdIHyAJ
         7YQBHpDY6KfbqCZs3B+1VYFC+0jknOdEr2Dy40GaX98fgc49Mjy2JWGXJlk9Hq+3Rt+v
         yfNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XmU7reNrNZ31ByQcehztkuwg8mMdLsojOExD3T3jR6w=;
        fh=4HG5loPCsL11FPTkCDyc66UTKckaklqHrVaoLNDMhYs=;
        b=Cv8s2WCkd5rEhA2L9Wna3Y7BwI8Ad159QO0XTCBPJXBSRzgztfLjJs8UcBT2vUtZ19
         NGrW9ZNAihr0HZQ04wHv2X6POhqkuhv+6r8WBUtcJMcB5Q4QQc/dI0eBOhNm+qiC3Fr0
         KIBMo6V96OVZyqufX4batXden6yeORwObwfjyWbNM3yPwRdsCeCs/vdd1wpnLJr73993
         5sgwJMP+W7upVEiYdzSO+xcfOv/J6ZjpHHC20IdUDqMOX117hj4mBCMhYCk248qBnVdF
         dIta8NLA5XFCDsF9ZtMRAQ98zxaNff72YnyPAkHFeSeMjXQChstm/3ZDBbkeO5fKEjdg
         YGWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780002536; x=1780607336; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmU7reNrNZ31ByQcehztkuwg8mMdLsojOExD3T3jR6w=;
        b=geXEryc7sCt5GfQW0cBpuS/2rTcwGhaBHQrgqBAAC/2Mg4lfariOnl8HMBGrcF8fEF
         waYktq9rn5uy7izNY5ZFxDmBlgct0BP7iGNjNitWdPPYN9bkaljfZQgwLRnnUVxFyUSw
         BkIHn9smz/8YityEdhrKc/3m6CU8mzIAqxmkQuuOilGiysFvwPAK0aTfGSHNQGEzZiFW
         muI0UAwbNOxkLkHI6MLXj1G8eSazPdpr33s6OZx5iFK+6pDQHyuzIz3Lxpr2EbQNHPWi
         d+jCaV/1xSk8TGlGMH/0AenqP6AMQzqXhaOUkn7pQfKW6rNuO1rR/Wyz6TBtza/JMDY8
         P2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780002536; x=1780607336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XmU7reNrNZ31ByQcehztkuwg8mMdLsojOExD3T3jR6w=;
        b=ModfPGgya8m8yuy2mXtAmfihHraTCi9+DSDP1dXKUyToY3rvIaXddNUTzgSYXzb7Cq
         5kP/t9mr8lCLZixg7+j66Aec4DYMEhgFLjBIVjZfA4P3YWNimm/wuuT+vcpJ0u8HW7hD
         FEMfTsrdzGahEOFnYj9DalI9U1S2aUfQIsp/805CajkBtkW0D8WAUN5IO6wtnHrgScKz
         +ImFgKD2lCJrunHVVHEstmJcZGIby4OCFR73p2VhX30AMYXxYiTm/WIQTWksiOie3969
         sYIUbBMLmz4/zrW3Ka1Kbn7M2z5kW7ouXQJrgsWxsySFh2hi7+u5+VwVCs3wLWxcGRrs
         f0bg==
X-Forwarded-Encrypted: i=1; AFNElJ99Bsa/GSf1yqcgfJQ2Pi8TqjzD4oAuIpjERBfSC35S0+lbshdw1ppRIpQ7yGG91eLYiU1uKFYRGJjFzvymyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcZPWn5W+BUotsr9G3Ooi1TtyvtGiss4hNSkCRMQQwGVMtLtgx
	ogSrtwM2Nttnp0uEbeFSeyUEU1EwKrQNK2tSQgJB8e3gxUUEOYkBIqIrcNj7d5bio4AqaXp6aJl
	H2mb0XUcZbv+xYeisIzCHCbGu6jIUxUU=
X-Gm-Gg: Acq92OG9A4vHVhEO12cGHzFE43mDJKAdnGISstA9bhOyW+1va4/V9UVRmDxCf3GrBoi
	Sw5QFbsRvQou4Qx4XQN7/BV74A+XPJa7zxjqgUHhNuU5UVL29ORdk5A9ntGdRU5FA8i/JqIOGwt
	JMDAReV5VdDozLgMx7LALBQMaQSirrZLGXyZZ0l07UV9gUPiub6jtcoK8A6WMJ53i+aTYizBodU
	RI07d1gZsE4wdG95uYu2gFSLQdN6dLEpCySXnHWalc/dneeKd2HyxnPqlroLJV4bT1aMIYRUCIt
	SRTG24g75d+p0UTqfWWX0dubm23iBRFBn6mWIrBrun2wsvVZGdFvCiBmfiASdvmOqke8RhxvQdO
	2FgmexvMm56TLFQSLAFV9MyBRm09vP9WnQw==
X-Received: by 2002:a05:693c:3112:b0:2f3:3835:2005 with SMTP id
 5a478bee46e88-304eb1336e8mr36148eec.6.1780002536071; Thu, 28 May 2026
 14:08:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-rust-gitignore-long-types-txt-v1-1-5be5e6fa427c@pitsidianak.is>
 <CANiq72=cKXdmxEacuGET8fuz_v5eFGB50vnOnKZZJd6iEeAAFA@mail.gmail.com> <20260528203622.GA3100532@ax162>
In-Reply-To: <20260528203622.GA3100532@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 23:08:41 +0200
X-Gm-Features: AVHnY4ICWiC2kCPKm5nsbjIUemgVJY6nMlhZZQ_wXD2JxRMrC1aT8vgd-7tCGyM
Message-ID: <CANiq72=og=ES5kfO_toU2gbS-YpsrLXH63uC1dRYwCQkdjEWDg@mail.gmail.com>
Subject: Re: [PATCH] .gitignore: ignore rustc long type txt files
To: Nathan Chancellor <nathan@kernel.org>
Cc: Manos Pitsidianakis <manos@pitsidianak.is>, Nicolas Schier <nsc@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 10:36=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> I view these more like build artifacts since the messages in them are
> really only relevant to a specific build instance, so I would probably
> clean them up with 'clean' over 'mrproper' / 'distclean'. But if they are=
 in
> .gitignore, I don't think it matters too much though, but it does feel
> like they should be cleaned up with at least 'distclean'.

Sounds good, thanks Nathan!

Then let's land this one and we can discuss that on top. I have
created a "good first issue" for that:

  https://github.com/Rust-for-Linux/linux/issues/1236

Cheers,
Miguel
