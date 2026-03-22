Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602BB361DA1
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Mar 2026 06:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774160098; cv=none; b=EFbAiZ/xxY6GSGP9HwTaGh8pAyZZHi0ShlpfgXqKSL2MXNKrjzK1ARIGgjU+Nffov4zpXwyZtfzFvYbKJMwxDAoXbmPVuOI4NomSB9IDtqQH/DYG6gfvTRBoZ27rJR0oaWnehzwwN+d7vSFX61JHVbGrGHBPdrWp9y/aBapT5BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774160098; c=relaxed/simple;
	bh=XqAQc2CNEfo2l7r/6LGV0uoJHY//hLpkZlFH0GmzSik=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=FcJvgzUqNbJbpN+ewcCiamHJiBU1H9ajaPazJ6OK7w0TsAQoDe+oTMtUfmaFxCqFe9gAnKARoq/cHnVXBVeRuA8X/TLsEe1bKwNgfKjEM7HFUGi798w0nks08ncDZemxQgni/z7RWPY9IV+x7IVzedtfcDyWjnd17KcCpos6H9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LctDQF15; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LctDQF15"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-359f35dfef6so947661a91.2
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 23:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774160096; x=1774764896; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqAQc2CNEfo2l7r/6LGV0uoJHY//hLpkZlFH0GmzSik=;
        b=LctDQF15QK09Ipy/cmUpiQAAyPMsBOW8x1UILUR6riwKw2tsYsK8sh5VDyVEZh3MrM
         /5yhVxGg8jt56mRqPdy/awHWpw8CEiHEWTROybFNfrO6mvj44z+/5eXFSgXPUSJHKvkp
         JQZ9CwF1pk6pHCPnuW3YvjjtmwcvpxpA1G/tGevztaeevuaA3YlthrWvFRHFpYwD0OzQ
         b3/WNDgFA/43tD0ybTx0Ez4lWLzv6p0H8inj8UJGNDAZllFx8IR/4UkPL9BtYnaN8Qod
         lfw16UuvwJiuKQXSz6711GcgJ2jtoGH9PlO3FQs5Et+e9OYMMExSnoGVdzPmrJV90HrQ
         v6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774160096; x=1774764896;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqAQc2CNEfo2l7r/6LGV0uoJHY//hLpkZlFH0GmzSik=;
        b=ay7hf+nEt1ECEDIYIoH+WFwnULparXyN+EC4bqPnEi9vA3tWrta+a3pxb5PaYrQOlP
         SpzXWyp3W+0+Ks2mhHc1mgNY6AoYgWUe0E2q6lFk6Sbb8x+42M88RdmCskXOBrGUIVaX
         POT3rbTsahmFeBnSwAkA9bsm2PdTGN7o3ydBTcL04lDf4++UpkG+kgU81AFWW49TGVro
         dKeVvdXD7E+dS7F8CO+DKojpk1wEy0yijuHHeBkSH7sm/m9zhSy90IDPRWWnKvge4GWQ
         uUio8wMLw4k6yitnDFqCsnzh3Dp67AXORlyR6kwilf2/ij6Rkce2tyr0PoKANP9dwX+v
         ibng==
X-Forwarded-Encrypted: i=1; AJvYcCUsfBqMbCqsMcUHNhCNmlOwebM4KTjPRmGHWT9p1ZtuPXpTE8epv7bTdcGm7U9latp3yK7SPjV0B6HIhWsQCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrpda51OPHmSitPzyj3AYC+8HfEWvphG/k0hlRppkyFjOfTYY3
	qXNEKA8kgNuVHVhGXbagiO9GAjgB8U1E8Vdywk1HMl3sRDg0fRIYMCJ1
X-Gm-Gg: ATEYQzwgBG3AP/0ACUy+aoGbcugEUbrOAlxLxl4VWYHhBe6cNZ0FDjrAkTPqAyQG2oE
	3GZQyAfKq5fLAoGmY1KYLBNUxvl3iP5WA/6S3iHOCFeoTy/Gbt6Fx+HsXwBas3rSQeLDCXB5NMe
	O3cjb0X9wYBKhrvdsegjrbmnSfYRREi59b/0S75Xn/I3y3DuPauD+3/Dd3wEpy8Zh3pT7Lrdt9t
	+LEpjQ6LMkV9DWn7iOs1lSj9wokyNa2IeIkIEU7LASK+lYBqmlc/aMefOIGtbCv14IOknX8go23
	LA4QP1sTSZS1wUwtM7Yw5W0OblkJuALjHgn/78Sz1JSKSrV25rXbF4LvYzI/vrVGGGZ61b51Of2
	63aHbUWJAEmazPiVOLLjLSI1Tq2cwbmvl6Hz52H1LFd6mE64JvCVB56bCFbPxi1eBYYcbPEQJqY
	j79xDGzvfjFEf4giHtbA==
X-Received: by 2002:a17:90b:380c:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-35bd2be6e27mr6866046a91.12.1774160095747;
        Sat, 21 Mar 2026 23:14:55 -0700 (PDT)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc60ec3aasm8719437a91.10.2026.03.21.23.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 23:14:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Mar 2026 15:14:49 +0900
Message-Id: <DH939HK0611M.22A8T9BJ3NG8@gmail.com>
Subject: Re: [PATCH v5 0/4] rust: add `TryFrom` and `Into` derive macros
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Jesung Yang" <y.j3ms.n@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Jesung Yang via B4 Relay"
 <devnull+y.j3ms.n.gmail.com@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
 <DGQCKLKCHRD1.25W93SR8LJ87H@nvidia.com>
 <DH7IVVURBJ8G.QP1WRFTGS556@gmail.com>
In-Reply-To: <DH7IVVURBJ8G.QP1WRFTGS556@gmail.com>

On Fri Mar 20, 2026 at 7:04 PM KST, Jesung Yang wrote:
[...]
> I'll update the implementation based on your feedback within this week,

JFYI, the updated version can be found at:

https://github.com/J3m3/linux/tree/tryfrom-into-macro.v6

Best regards,
Jesung
