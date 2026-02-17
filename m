Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E837417993
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 20:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771359901; cv=pass; b=EVDKHWuAF6aizYyZjS+GLUYQEDX/VXavVyfuC9V5vXvlf55s8pptY29wuYqwSUJBVy0xaGTEhZPC0LUGE5yw/EAK3CghyVZy3vYxpTdNLEoAyrsruaetVkHCwTS7/mQF/XF1AvX63+BMGjIsDEe4gLR7/CLVqBOfN5KaC6MlqPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771359901; c=relaxed/simple;
	bh=XzVO3FQdpM901ZMnPvp0xbdGNkh5aSYTE4RlbKGdzEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y7F/R8EydiTDmiNCvF3vzJImVMazGPP7H3n4Vg9zN4DibctCwEiPNDuhfqT1h8vYwz2QsaMrpGFyi5JW/nBHtbFmTRhbMuSphWXVqLt/eRp2q7vAmsFDNXTqxZk/reTJluCOks6C70gXwOTVb+Kh3HrTi7/77X2RnUIQNB0U0JE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bg/frqMk; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bg/frqMk"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1273c690e5bso258935c88.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 12:24:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771359899; cv=none;
        d=google.com; s=arc-20240605;
        b=YhlAZoxxHFSi8R+aIoVoBjaL9lBUFDBErl/o6QQxyzNJcoe0JpFTXJ2Zk+fbB5qDEQ
         Utfd+YNknvzMlqhDLj2SuZmZEf5pFAL2zMCJWLqQMQkX32uDhXYU26WcrPm0t8MiIn5I
         z+gtyVZrdoSE2zHpeuC8Mcr6R0zT8ta44omkPZT/s3vEbhiWA7420ncL4XSm0MeBtIon
         4ZyDSxfhr/1e4jl/vDncskQePcK/w9c7EXtTdOt52XIIQeJfePSdealmsJlP0xE22uHg
         8bCHIwy1ebig7Tij4iMTcVKHIpztkEwbDQl6d9J0TytlaRojlmvY/74OdY8ietnPz7c4
         ij0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rDDEWsw4CKwwqmAURAFC3flEZcqum1GMx4CN2UKN8vA=;
        fh=o3gnnLpYl1cscmXmFFU9ZOFTJBKi6qNl/exryjHmniA=;
        b=gCKURGYntjXsgLSkm/+P53mBW/xXIsKNSTNtI+6WHRpAubx/2OoQLM/kzoH3OQU+tz
         VZP+MNINMZ2wE1UQYaC4TeOaFxuYl2cBVTb8Tw/03TLWsVnuteaarb576vu2QvgB9Wnc
         ctjnb2UDFNVETmpHME94sJ+evo+EwuHpAhdEu4TMb7Da35IcOO9FUjQUQjjM0NoyWfdv
         yf8dDtjlzYgBhHBpc8yE8tjCZneK8eXApgRkMKT9yW/Nl8Vs6riJFCynLgJidltgQPuq
         cccrkl1JHQAq6HQ+7qrQguRy/6gSNig/x3KVyUx+wmgySduMzbwdOZrYgHOBM+qPouGz
         eJuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771359899; x=1771964699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDDEWsw4CKwwqmAURAFC3flEZcqum1GMx4CN2UKN8vA=;
        b=Bg/frqMkr1bRjcjBtqJ/dTM3rtyNccQjLVrxXoQ5gOyep+nO76/gAbYWSGkNGxM5zQ
         e8W2F4TvAXcvZ8zrwt9S+A+Nqf2ENFv0VM9EDs/1AsCFEo187YPNwATcOgz5UJf2gtDG
         y6fcO/BXYgceIsyXRRQnebMp4H+wsQUdsnrY/nD6YWtOQW7P/mCe8l5S0fhojlDPtoKV
         tFxo48SIW8HafosAYz3HitAe1ZKugWUi3OJnmlMcJN61QBwL/LlxRh+dUG8dpJiPtbwq
         XTySR5e2Xnvj3XBVsLTNGyjwF2wEztbQOwK+X6q3Vnlv0Cq54SUzI6c5IX6L0+/qivRG
         WojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771359899; x=1771964699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rDDEWsw4CKwwqmAURAFC3flEZcqum1GMx4CN2UKN8vA=;
        b=suebG50qj3aa581pzv/WZLDMq8tbmdBj/RZjewuozpLtbeiPPun+pmLKG+Ls05ztU5
         ZgA1NB5fV5Xd109q8a039zZ8KosXQ5knvF7UFPR6SRV6NBgVG4Og2SMmvuvXq84cO2Vt
         7ZJqm+bdDWeG8IIAdM9PF15iJ+TOJKpIlaNmUdH0eaKRY6cUSMJmq+Kvxyg4Chv3hr+3
         cAg+vcQ8yXm53ddibrbHjjIP+JCIp2U8IqrSsAUb1QUt6dKNiwlBQHTL1+G6GqPkcsrF
         DmngEfJIuLApH/filzvdDKyxEJf1QaiCphB1iZXAtE+eG7a+u8WVOfTMTVo6p6MkpO1l
         cMVA==
X-Forwarded-Encrypted: i=1; AJvYcCUiCt3nsEcl/vPseHr2QnljJTJDtW8uMfp5CHanur+lj2ylmGTJTCqaQcC765BEs7cYxxKJsTYDfR7VbvlW5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK4Aa9Eggxq6TNgOoO+/avIC+kcWbpL1DL5hsxIueNSUzBQZYy
	4FuUmO13vlkGVuE7CE4ty7iwnEeRanKZCc1e79tXyfEuUNMp+1dDLoNSn5g4VteorKatoSD46lk
	uSNCoMSV9/R+KV+ctJHlx6XIczmmgWuY=
X-Gm-Gg: AZuq6aLKDniaGdTYO6xjhBDST7uN8XWIrk44p6uGJfPktOekEprm0O5COYM2eOcRZf5
	xtG+sCZEArhYkER/Bu6fxPx0oyQxWYhPG0PyWjxCSUE2agAgi1wjB3WSC5XqN4YNPOHxLzPf844
	NoqsyJEtzF0MzK3kjTQq96eBe6Umomh6FBjS4PpWmGxuRYfpjkwgqnF+CGiT+emCiu+xd1P5etz
	aREUcPSbX+7/ivOeutX4T/67gVKVNeO5aWOVX02fzpKnP2NXGydHoN2Vvsxv65hG7OAfD4Nkm6P
	LXzpyPqXZ9UZmsMSrmo2qi3p3b9j14MyFxEISlx++nZLA6cIFYypb/aZeuzAP11Q08WF7tK2z2B
	wsRSla7dsqgbAhn9kIMHBCeE7
X-Received: by 2002:a05:7300:fd18:b0:2b8:207d:6a7b with SMTP id
 5a478bee46e88-2baba0117b6mr2978273eec.2.1771359899022; Tue, 17 Feb 2026
 12:24:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217-binder-vma-check-v1-0-1a2b37f7b762@google.com>
 <20260217-binder-vma-check-v1-1-1a2b37f7b762@google.com> <DGHC1OLDIXC7.Q4IAOOSMHIY@kernel.org>
 <CAH5fLgj2+XUzsuAnvwL=dc=5yOZvXCapBWRbFGwJAX2v5Wk4dw@mail.gmail.com>
In-Reply-To: <CAH5fLgj2+XUzsuAnvwL=dc=5yOZvXCapBWRbFGwJAX2v5Wk4dw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Feb 2026 21:24:46 +0100
X-Gm-Features: AaiRm53pWPPTZa9dK4uHNNQw0RmQntvFMMvdgsDwpfgj0y84MDt3F3iy0Ue6yrI
Message-ID: <CANiq72mw7PSEcRLPXWz3UdsE7pY9EdYZNYSEewertFx-WzKusQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust_binder: check ownership before using vma
To: Alice Ryhl <aliceryhl@google.com>, Tamir Duberstein <tamird@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Carlos Llamas <cmllamas@google.com>, Jann Horn <jannh@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 9:13=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> How do you propose to reword "I will follow up this patch with"?

What I would have written is perhaps something like:

  "The plan is to introduce more vma abstractions to ..., but for now
let's start with ..."

> Honestly I think this one is easier to read as-is.

Cc'ing Tamir for that -- he may be interested.

Cheers,
Miguel
