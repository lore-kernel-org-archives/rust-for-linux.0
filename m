Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A959A225D7
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 04:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727584562; cv=none; b=Ff2BiIj6UTEj6yCzwIdM1MHPoWT9aop3Fg6mmIC57MsfbPOru1n4M5aPkWD2+b1buYhTOR5TO6FDspTWm5pCww4AIVTXPzRqXXGGAeLVXkoOVYag9fYZLRm/zU+/XUqx505j4m3WEjWtM0/19yHWiKpPNG82z0lrcDHrh6jEFJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727584562; c=relaxed/simple;
	bh=Cw52eLb8pxcuWBn5qW3XHz+bqeyKJurQoZGsckqC9ZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FObqkdwek5cc56iSoEp48pH01Omcvou74RFGaQ5WF8yt3HyzDTs90wUdVwxtX3D7wRtKePtoLNVb1xIeAezeYpLAU974oYV1IP5oiR26ufHoQ9TyskdjSA2JFJq8YaoQ0i/BlpPDWLiP0+H615JbooIiZhbYeJ08TBu8xAw9Qb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=obY9WmMG; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="obY9WmMG"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e25ccdffcc5so2912712276.1
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Sep 2024 21:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727584556; x=1728189356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cw52eLb8pxcuWBn5qW3XHz+bqeyKJurQoZGsckqC9ZM=;
        b=obY9WmMGht7rgj555kYktVXiN1r+Bq2SNjGqL0xZhR2fVwNpQdwBYIiwqAv+ut8D1c
         O9xtMpNgoAOJh5s7UAewoOEzReyjM5JSqoBQBigyb1ZOvHBIY9lt4I9TPYRfgBvGKw2t
         k1PmY7MBbmz6PoqPbSp/sKoGZbumUgeUHCxzefZiOLuYucRrCTFyETAmZ1HacsSZA845
         wi6PDvjzHR6vvvc+PMtpQQi7l6NOn9McIpInq20MBxKYO98EFcTQ6joj/sm8F/Er0ayQ
         Mkhl159Nsl9YIsnC/xwmMic4+xO0hiyMPtl/xKwCYHvPsq8hp8C3AAjGgsgzEjmMG/r+
         KH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727584556; x=1728189356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cw52eLb8pxcuWBn5qW3XHz+bqeyKJurQoZGsckqC9ZM=;
        b=qgBG0ABdImCh1CNperMx1eq6K6Y6DRGnsgyHuUHyD7ZESJ3Cm5jW342tjO2T9ma8ph
         b38LKLBPlH5IMRlccp4JCjhYiuiJK73dydWDPpqh7zWIeeD3Z2UE549Ysbt9Wz2GkET/
         T3VHVtWE0gtUoveWJidVZ+5RExgEMv2KZBhWfK2VoTPO8cw+YiS8Uk0cZZTjLp6M6jqd
         ZF7lVc9pYRQSXozmhNr+ESZo9Bcm6Kfol8MPLSImxmWS8frDlgSXmvLz30PRvK+x7yzL
         DzR8S+haTPgvLAlqjDvExc/vBLJneoaWRQp4fTWinQkzc19WtxCkEyB0C6axwQDbEKKn
         XwgA==
X-Forwarded-Encrypted: i=1; AJvYcCUK2W8KXY6cu+ycDUW5SDfpdJAWSyLCCuMSi4d43saQeQrYKKSWorWbQoJscGZqPR3Sj1g81Y/1MUa0J+8Hwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD4AQYOB5qWxWsOkR1tkmSo9fNJ6DuqgI+h8QKwuk6zGANUbsQ
	nABTRSql0RBMK/FewKz5BsN7Z881zRSGzkrqszANH4emTnluCV+g//W8zDFRI41f4LzYqgvVniF
	fO8wnZuH00mB6iH121PRRL34WMe7SoltvKp3WIw==
X-Google-Smtp-Source: AGHT+IH3BpjQXLR+cTBvGGV0ZUgSzcTqoLWPzJwNjTW4/pMBS8HN6jUU4/gi/Li9YPYG6vdNFq7a8pH2JdBOD1J0HTg=
X-Received: by 2002:a05:690c:490d:b0:6e2:7dd:af61 with SMTP id
 00721157ae682-6e24754df9emr60630647b3.17.1727584556602; Sat, 28 Sep 2024
 21:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-7-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-7-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 00:35:45 -0400
Message-ID: <CALNs47vuWxauvfTwfgGNdmDGFP8=ZUQvmtTw2SmFGi79ZW6CKA@mail.gmail.com>
Subject: Re: [PATCH 06/19] rust: enable `clippy::unnecessary_safety_doc` lint
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 4:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> In Rust 1.67.0, Clippy added the `unnecessary_safety_doc` lint [1],
> which is similar to `unnecessary_safety_comment`, but for `# Safety`
> sections, i.e. safety preconditions in the documentation.
>
> This is something that should not happen with our coding guidelines in
> mind. Thus enable the lint to have it machine-checked.
>
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#/unnecess=
ary_safety_doc [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
