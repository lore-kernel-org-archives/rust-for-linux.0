Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792672951;
	b=u2m9rJq89ZrUjK0OYn6eWFDO/yZB4yCpYfo6cCHTHpIs+Z7lgK7gCwYJMeMvmSdqxmmM
	 8NRhqJBwKIwteUBXcu/EFp7ZO8KskV/39S2TSY2MFqSAuy+qC7nhK8O/Oh5DQrwKBVIjr
	 dDmUjIhVGvP1U98bkB6wqQSwvL0PdDfsLR8qiAjO1cO3YMgS5qx7aM/AGYY+JW5c+JWVu
	 MTmaIKzBNnkToMgEcarlvErExZqqpidn/WQEBSjbWBVGz0SaD43mYavcrlvl4Jia2cOdL
	 HTEJHJjxUpFXU7fIEvR1sh5G3qZztqJimeAXlUl7APAgvp8N9lVPR19CNZERWaXn7tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yahNT0bNvxOBrbmk+CPvWSF27fEnpvOdoj99aF3G+Zc=;
	b=3HSK0F5fm96GuBUwmY5LG5tjevGvfvlG36K9iUVLEzLg0Aa6Vow5vFGjuT7Fl7rNHSZa
	 Fuv45t6IbSMjerlRqS0Il0GLH7eqP0kop5FoyhGXCFRzCv9mOxG8ptd8QjIGu/S31/VM5
	 fVvWy3QRcjQX1VGqJZ9Z0/zITI0jg31bQErVeVzTNlYcR4SL9zjwmcSOxf406xZL1BcE/
	 hzwbeyf7H4btkm5cvYTsN0x+DwvO/bpP3C17ruV8fEESgH7f3ZvA5tYDXYFHBP4znguTr
	 RxQuMoQfpMk7SqtmwGLXX2WpwGxZL2BADYvo7a7AQUTrL2fDq9M+0iHhtqfOlrPRSIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Kar541c8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D825606A31B
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 12:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D825606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Kar541c8
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bb5afa736so244459eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 05:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792672950; cv=none;
        d=google.com; s=arc-20260327;
        b=pQ0cW3qhdfTWcjGLBRmPQ/ss6MHKxQRYByU3HpTO9wSbbGJtaxUpgVbjQBdrUckiNz
         FdiAOAh6KywX18YsAd1J6isBR6vCzuFRAt6mgq8Doj4SbhhQD4ybd5U33h3S4Y8LjXVF
         dtqE5pv7LegMFabMaS44xV1Hj+3VxzWuUcV8QaXK94wc2drhC2SZfDfm9t4VJ7ilA6EM
         pPcXGML3CfpPzBhVSTQUGrjSTTA+8huos8khTFKT8yrL3qL73voutaoMeVmH+BsZkAsp
         xk5CI3xf5ZWt5T2VcnrFJuusj54dwLIgMN0zJSOszDxmW5npnU1q0mgGxK5/DjY3ZHqn
         BjnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yahNT0bNvxOBrbmk+CPvWSF27fEnpvOdoj99aF3G+Zc=;
        fh=ttnYLZ2j3Pld1Zz6veBNtVvfDZcTI4Res7XWwD0UE+E=;
        b=NCe9EBeNCcFOB3nGaIW+5h60GYBDo1I1iCQz1ivJR5U5dKM2Y0Q4LNa+2ZzLZcE5vn
         8u9k1Un5oLkJFNUToHGMzY4brMSfddgS4wHLs2LLbeGC11MNAcTTZnIRr4HfQ2WRM5cS
         Lrsz+ZhZR7/3F0bkrT+z0tW0DfnyMMrRUV7PA0NLt1lXNYtLmvQE0x/ag0nKWCs0GaAJ
         QvyehCg9WH23qQomNxhVHjfwGl5bOgZgNd7jMSPqlmUNSe7Y8RlQSwWab+2GKJhNhdBn
         r+qj+oNWgbm4kRQKuEwY4tMWjxq6Nazj7a2fgZvpJfdxvVF7ijOsNNvKK+49BuAYuPXv
         p/TA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792672950; x=1793277750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yahNT0bNvxOBrbmk+CPvWSF27fEnpvOdoj99aF3G+Zc=;
        b=Kar541c8ClARwAoaapGMtGG3WzxlDV7TcahPyXsp6XpREWBZjLmOW0slbwmmW7fdKo
         HC/IaieL1B5xzjjryH7O+iAAUqFxTPw2LPOObNPTZ1HN5ketBkqWd0ifBmzxrfHfvvI/
         qPF99sbE3qNqBrLYTzGa/lBN9dRlMLGqJz2rN15qqZqCwPBUm3pcLiVgRZbUFVVbY2H+
         y9g21m+P/Tli0+nqmzVHzbzkxiYQQD74jFOl9nIlCpc4EpN0swIRfpiRq7HtLLdT1VgZ
         QhsuXlD7nAJBI8+z8gWWyrpAmjZsoIvdtzJb5Leb1Xq/oxbNkCEnmoHwY6yyTx8iOBbo
         i3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792672950; x=1793277750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yahNT0bNvxOBrbmk+CPvWSF27fEnpvOdoj99aF3G+Zc=;
        b=euxWKsg8poeoQ2OyXerXxPCol1STgwnIoOmfviUUKdRWin56Pl0jYYixgIWJqKfmA4
         2H2HMBvSOfusFeJm4U7CNawbwiRo4GAuGZeTH0R4LVOPuB1wBt2TOXlQoV+SY0y2nUTB
         wShZCWkktXd3g24YtQHA2TyQqG54yIEGxbJI8apC4EJnb8A40jhH4KBgvxoFOuHWXLyp
         r40oZr4oK97EdqdEKKidwGVZ5Wi7SFTVkU8dqWX1ajW9I6/ygJO7Js3d59RM68u6Agia
         Dzu50S6IpxvHI8AgZR5Nw7g9EKAXwRhgv5/OIysqL7qxCbDsZ6r26wh7ZOg4hLuNl4Mt
         e5ig==
X-Forwarded-Encrypted: i=1; AKwUvBzEcTSuzp8LSY+qwj7BD9+lgenyzZG8PGaAoTZnUUxlmuugofMuuHhXeSuhTarp8nb4HSvNQJ+i8Ha9E+3OOw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL7niDUwwxl2ex2aYt1C9wbIu6C1p7fRadgc7tUhBvNMU4rl24O
	//eifkCnsAOwIDkiMbXnzspG0Q2Ry+HwaS0dIWNJJGnYaFyS69BGFpC07NT9OEMShIbnLrrqAH1
	yvXsU8FJQOS9n+4H1Bt+w/0+g1/yS8JM=
X-Gm-Gg: AYBFou2K9p649PV7TantOQMm1ZKcKIBbnJusNK5/pVjKL3jknlY8q8DZEoVF8HCTxg/
	tGJaUDBFiSeKPC5sgXUZqxlu77OJUeJ9lt20TBzuK4AobIEJThNDKyMifIBNg4O0VNgBwKUH3sf
	gT7UoAwNxEglKHJKW+wNoK0fN6buvRRd+SURiYqIkxagx4Y3sYfMaJhnscbpPPcS8uWY7SrkDBB
	5AskSX8Qt8jBJEEVjnGqsOLqRXGtSYCME+4JmBr2wqyoD7CiN3I6O7yrKBnPGQM2pdC41+TscVe
	5oeNN54+eWaKk6JCXOgvjEMRHS9X4ckl2Den0Y1ppQZSdJ0roywOF/8XxMrZDGjop02OuxNofrI
	45xLRoZ1FJiElKJy5AbDmaeHfa9/1uaoZa/rFo7iY737DVsN3gN3hx7jJ5j5qmyKN6/oTzmGQQs
	6YPzG9kYE7obT3HH2ghOhj2wCPBV6hwtdwJr5LjqHXm165q1hbjd8Q5X33rtIBIyPLmgOZ3wW6o
	gy6iVoIAfD3j+t7zA/bego0pX7bOEARE7+p59t/9bejWGoS3qnubSkjiA==
X-Received: by 2002:a05:7022:f519:b0:14b:edb2:c3bc with SMTP id
 a92af1059eb24-1909acc857bmr8644920c88.0.1792672950050; Thu, 22 Oct 2026
 05:42:30 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019151243.1595858-1-gprocida@google.com> <CANiq72nqq4oGBWVtSMBhXS6G4H7fYg07ysD7SjnOWWt7R9_ajw@mail.gmail.com>
 <CAGvU0HnBuoVMf2JwEhRCijxRn9MPnrX=yxxbo3YywT+RqCTheg@mail.gmail.com>
In-Reply-To: <CAGvU0HnBuoVMf2JwEhRCijxRn9MPnrX=yxxbo3YywT+RqCTheg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Oct 2026 14:42:15 +0200
X-Gm-Features: AclHuK_T88Zy9oQREVqC19uHWElftZvOLaKoRRSb6QAdFImUnbbltGYd7908h9M
Message-ID: <CANiq72mN9JYVitqgsZ2GkdmPVWqHZpJ-WNMNviiHV6C7gQMUwA@mail.gmail.com>
Subject: Re: [PATCH] rust: exports: emit ___EXPORT_SYMBOL without C declarations
To: Giuliano Procida <gprocida@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 4:21=E2=80=AFPM Giuliano Procida <gprocida@google.c=
om> wrote:
>
> The description was AI generated, but it is accurate. Both paths use the
> triple-underscore three-argument macro alone.

Yeah, I understand that not having the `extern` and so on is what the
AI wants to emphasize here, instead of the `asm(...` wrapping of the
`#else` side, but it sounds confusing to me, i.e. it introduces the
change as if matching the assembly path was important for some reason
in particular.

> I wondered the same thing, but that would introduce yet another intermedi=
ate
> macro.

We are introducing a macro either way -- in fact we have to introduce
it twice if we don't do it centrally.

I guess you mean avoiding the duplication in the C header, but that
duplication already exists in this version. So if no new intermediate
macro is preferred, then at least the duplication would be more local
and thus more obvious when they both need to be updated.

> No, Android kernels have been built with Clang for years.
>
> We post-process DWARF information with STG for ABI purposes and noticed
> this interesting side effect there.

Ah, nevermind, I checked the DWARF emitted by Clang, but without
gendwarfksyms, my bad (I am aware of Android using Clang, of course;
it is why it sounded strange and wanted to double-check if it was
related to GCC somehow).

Thanks!

Cheers,
Miguel
