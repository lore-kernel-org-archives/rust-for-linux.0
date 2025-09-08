Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA852FB0A9
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757333058; cv=none; b=B4Yd5c3Yttllnls6blCb3Ng4F7+FsTE8POdjxS0tOxYzzLIRBW6Smbo30j/XJz+BF2sdB/GonMwJKntMnIwljlksm+KLODx9AXLxdRxKCVEboIpW9YI2BNzW30e+ihDJ+h8iD4CRJKF5swAIok300KNgBph9qAiKPdvQUB+eJNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757333058; c=relaxed/simple;
	bh=OwBgF/j40C0xPnOYd8Eu6YAxRruzK7Ha7mzN1mL42EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HaaleACO/fG5nLxMJBvlMUqOnuDP+Xdr+iQmwRyD0tkFQbtakTKJ+yQvb7s0ZiUuCpC4XgrhHlgzm1k+ywWk/3VDfPMIdEUb5DQb+ovRPVb5uLzjNzNmsGrhhRWgWMtIG35aCXdu27Otyt8Au3SoMI0EGdboHIpw7lToQONIbjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUiwlhYj; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUiwlhYj"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24b132bd90dso9577375ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Sep 2025 05:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757333055; x=1757937855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00/SuUsFlssDbktBMjaRBLUCLyFV8Ftuwdto1ZXc6uA=;
        b=UUiwlhYjdnMJ2zbm2v0y/H4g5OAl982N3ImcC86eVMuN8xHLWebYlV16B22aXMluXb
         5PD44BWuqdQ8/QJwnM3+GWP8zLHd2sy5u2YFHIhQGqPoEebDX8M+B5FoWU56C0RwtR28
         mnp9QzeVpbmexeNY5fAc/Zn4nOb31xtl28wSM6DUJ5rUt8c9gr/eSxV6Crl1yzMFV5VS
         YTIdN8Orscey65GWqV5R37d+K1ptSUgE6D/b1ilRbRDlfLUGrY58AVmsKynJe7M05c53
         5/OSeH9tL90DFU9BmtRSQnyQQ3zWsYogLA4llrh+RP/VFByy8YlnGoLGkZTXGPXP7evs
         nC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757333055; x=1757937855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00/SuUsFlssDbktBMjaRBLUCLyFV8Ftuwdto1ZXc6uA=;
        b=SnB6kwiUlmrSfT6LQDysZT6F98sahuokw4vFmOuM/erTLoKqqbU5lQlWwRMvtXpPoy
         FBkHe2QSgkzcVW3dMbhxeTfAeGPbI6rq0ApKJrhS67VIFQ7y1u96lNP+W9rXDKC6YOnd
         PxnAvuDWVhdYXKelbqRCvEzf8wnhpMlw2FKmyDI0V9hheT/sHqbjVXo1U3L/ts3daltZ
         dcMiHEA8t9bPGzxKIoUllT59i/RNxKQNpJRdOxSGrDmzjapAVqFCHm5/5o/7SrSRyp9O
         kUAuYpAc48AFLkSbt4yjGcWytUzsDpV8FUI04VBNgDFacOFk2d2S3BSS77G9NXrW8Ebv
         AxNw==
X-Forwarded-Encrypted: i=1; AJvYcCUDsIEmcCHlVSCSz6nLt7qK8u32Y9jAkD9Iqd3NNRbqIwIiJBjqMBEGrFw+2OxjqKPZeBH3DVJ+9VrpjuL73g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRzUB8zr2lz/0oYaOWlpAJ1pir83rdt2vBKGNpU+7Zx2Yv10F3
	7BRKQwTIaLvq1JaThDVCCbmy29t5YIn07ha8Twvlsd+f63z84if8mluYfzbMkts16fUMeibZz89
	EkWjz3hyAJcWFoR/JtNSsGIoAG9ZHRkk=
X-Gm-Gg: ASbGncv/NW3YBxu6CXPuRjJKo807IEL5UQEZwhWzTFqEV7DPlwiEo1hjYkH1GyuiJjB
	Hjrfx1QvoNLieO6zWGsvo0hARjN1mLGGEPrr9b/nYK1TEkVwnXBI44wV1OKBdLqpjnj1kwavc41
	471HhwN0Yhic2b6rQxlCKqOKlKS3VzJLKY4YMKHE80s5DccynMF0ODYk3bl6+ktYyM9Z194HLK0
	4BwGKmKOWmN+ocN1riKoakCd8xcFB9KuBb3w9zUKyZVO2+KSuW8VMw7OAitNUOtm25/xFFiedgr
	DGkYLHRZf+e0gmYFtSPVu49RGA==
X-Google-Smtp-Source: AGHT+IGefHLbhZ4NfZfJikqHNosw979M05LeT8jgcUt/5t8D2/QS3giQRkMB6kskrnacXWsxlOfYakNtI6q5VKjL/MM=
X-Received: by 2002:a17:902:f684:b0:24c:e9f0:1e59 with SMTP id
 d9443c01a7336-251685b49dbmr59244435ad.0.1757333055402; Mon, 08 Sep 2025
 05:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814093046.2071971-1-lossin@kernel.org>
In-Reply-To: <20250814093046.2071971-1-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Sep 2025 14:04:02 +0200
X-Gm-Features: AS18NWAaqWCnmCoCKi6s6qZak9u6kZ4i_jVwyUgWZ9MQSoNHpuw-Xej3lb7ctKc
Message-ID: <CANiq72=KpjeQLULvLuVTP7AazMh27soaQNH2UBQyrhCazn=z+g@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] `Zeroable` improvements & bindings integration
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 11:31=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
>   rust: add `pin-init` as a dependency to `bindings` and `uapi`
>   rust: derive `Zeroable` for all structs & unions generated by bindgen
>     where possible
>   rust: cpufreq: replace `MaybeUninit::zeroed().assume_init()` with
>     `pin_init::zeroed()`

Applied these #1, #2 and #11 to `rust-next` -- thanks everyone!

    [ Formatted comment. - Miguel ]

The others should be able to go in independently -- I would recommend
submitting them separately.

Cheers,
Miguel
