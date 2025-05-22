Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9752D255F21
	for <rust-for-linux@vger.kernel.org>; Thu, 22 May 2025 22:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952140; cv=none; b=KDdyymRXWiosDXcjQGLUxapUFCK2nfkokjdN4bbMDjUI8BfrNGWCpncZNlhkMmSeCss6hVGNzq5UuOWKGjLENDPyRgRlpHDeOI9hdUOmftt2uNV7pRtI9p2IcTBQ4OsJcpPlx2F9kgff+BOrlFWa5npp7nwxDucItmgRmNQy5cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952140; c=relaxed/simple;
	bh=d5vQOmxmJqTx3GtELcvY269Hu/c/7EFCKOwcyNs6q/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XJJK9ErHyItndUOOHTSWxYfGMBqKlULYKoGNzsIgzMf7cmFc4pKM5Y9Jdogmjo4xC1DraoQmZ0YjSjrDyCOvOC/a+VQsFpM+TBDSOiNEF5nnlBEICjDpm/WAhax4B/k5uKpQDFQsAiDWq9Rf3oj1UzHOr+u+54shTQjjsOAzhro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5Qn5uOd; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5Qn5uOd"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-231ecbe2a5dso6459745ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 22 May 2025 15:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747952138; x=1748556938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tj0nvN/RtVnB4RCVY6ue7HlzLgy8undZ4+k/Ufq+gn0=;
        b=R5Qn5uOd9rTp+3xyfSdqKBZCW/eSibNrG4FFIqeHYOdyTnO2MWyEIPrBaFJka7E5Z6
         nfNmAm44JQuKVvdI3GG0GdPtad6bR6KhFmDQ2boIdM0MBwJVyc5hSN7QNZNNgbgQHg0X
         cpqJHUIjWQxZHSqtM+vHdklyzAQ3dGg+rByApW/dOW2kwFV0Ek7OeU04YQ3DQML0lUdt
         YSEvR8zew+jdsUhDFh+GUTPp1uBe3wXlm+fTD78oKxD2UwfZkrtKZIZRfK51Bubb85PP
         vUda19VYvHOBooCRURoRDAG421qhTpmhaVLatWOM9Ec3EY7hZGVqWiYUccr4C6FvndE3
         pVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747952138; x=1748556938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tj0nvN/RtVnB4RCVY6ue7HlzLgy8undZ4+k/Ufq+gn0=;
        b=NlnAF0KRfbuztOSIpf6A8WONRqx49RSN9rmtojzQoDHEoqjGyKaLwaS/yxIje3tQG1
         jwfgxTi8XE+wZfrAmL0JMxfC4736Y7I/NBFFt8T8jwsa1Uqs+VfxvxoYxud1osdJmCBi
         8wHk6hwvpwoE2QlbFA/qdk5X5iNayvOPTMyDJT6fl5pUWhEBXd0o9+TRvHSuYZK+0cm6
         PubMeRs3zu8FV5k3SDI27YGXbzP2skFM1KnQ82ciEVz4iyp6rR1MUPkv97INBkDnfGUZ
         z48tGC81dejtgB0w0JKHaJkFe7LHDDdNRdF3F5S2muyhmRSXn7N97V8gPQpI0y6yUV9r
         tlSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrkFbkfEsNy/C8aouidNcK/bwR1u11bbCDAGQow7FU9EctOYpBJ1Os2fU1+NFiFV0/bCpjHiIux47A5oERiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQcsAgQFvFm5s0jkURRJ8N+VcajnJMI6ZqYRQSIgA5l3bc0NLC
	kLKZb/KgnrSNyMAEZX8IKa+Dirt1hHiz7usJ6oTQ1V8t7vf+0rE//11A47S2n4c6PfimTEf7Eh1
	ImYRAXTRCHGNgIBo5E3NfJtfEKjU7aF0=
X-Gm-Gg: ASbGncssRVxahEK44Sx0fkOp4VIIG/e5bFogXMvEjl8ST5MA2Fvl5LhOrowpVQcEp5E
	FcvGphI0zndsDy63Pgf82e0G2STpJFFksOQ5JXRQdyP05RV62gvAFYzzGJmTdMil/dwxZNpcSyQ
	noo3XBSvJCQrpHCGkSJxvFliXhjb3rBeKp
X-Google-Smtp-Source: AGHT+IGRNHL2ZxDyOCvDa434tMG/5nQTITItROLPdkjRmbLoMa+wS+qBlWCtfp2JEiIUdgi7gkGdowxATZiYqUy9g4I=
X-Received: by 2002:a17:902:e949:b0:224:1579:b347 with SMTP id
 d9443c01a7336-233f3687cc7mr1091965ad.7.1747952137746; Thu, 22 May 2025
 15:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402160047.1827500-1-igor.korotin.ref@yahoo.com> <20250402160047.1827500-1-igor.korotin@yahoo.com>
In-Reply-To: <20250402160047.1827500-1-igor.korotin@yahoo.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 May 2025 00:15:24 +0200
X-Gm-Features: AX0GCFsn1VszEAe5TfK8VfcG3kgC9ziCtR7Q-1NufGdhYNlF_aGqFRGKdaDI2Bo
Message-ID: <CANiq72kp_ODOHawCngcf9OACdjPkSAhLuz=20SUXAMX8F9M6vQ@mail.gmail.com>
Subject: Re: [PATCH v3] docs: rust: quick-start: update Ubuntu instructions
To: Igor Korotin <igor.korotin@yahoo.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 6:01=E2=80=AFPM Igor Korotin <igor.korotin@yahoo.com=
> wrote:
>
> Split installation instructions for Ubuntu into 2 different sections:
> - For Ubuntu 25.04 and 24.10: these releases provide easy-to-install
>   Rust packages.
> - For Ubuntu 24.10 and below: these releases provide rust-1.80 and
>   bindgen-0.65, which do not set their tools as defaults. The instruction=
s
>   for these versions have been updated to configure Rust tools properly.
>
> Signed-off-by: Igor Korotin <igor.korotin@yahoo.com>

This looks much better, thank you! I fixed a few things and re-checked
the instructions. Please double-check if you are OK with the changes.

I dropped the 24.10 content, because there is still a bug with it
(https://bugs.launchpad.net/ubuntu/+source/rust-bindgen-cli/+bug/2086639,
https://github.com/rust-lang/rust-bindgen/pull/2824), which is
different from the 0.66.1 one that you mention, and anyway 24.10 just
has one month left of life anyway, which will be over by the time the
next kernel gets released.

I considered dropping 20.04 LTS (i.e. mentioning just 24.04 LTS and
22.04 LTS explicitly), since it is out of standard support and does
not even appear in the package listings anymore... Anyway, we can do
that another time.

Applied to `rust-next` -- thanks!

    [ Dropped 24.10 -- it is soon out of support and their `bindgen` issue
      (reported as issue #2086639) was never patched anyway. Removed traili=
ng
      spaces. Split into subheaders. Added `rustfmt` link. Removed spurious
      backquotes. Reworded contents slightly. - Miguel ]

Cheers,
Miguel
