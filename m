Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B8E238C1B
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Sep 2025 19:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757790542; cv=none; b=WHRuE4zEzKJIOLjkddpKddenuyMuiMA6Un/qhlc5jNFqSieTTM9pXOBqu6Wt66631v+dbhQfOaNDqaQFqlXg76FbSeWLziKk/jDIztWoeuzJlzcfZ4Bi807ATY8oldgoqxW5oxbmoLIWBXHLL7reuJj6r1tvyp8LBAPaaZFj5ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757790542; c=relaxed/simple;
	bh=cL1JgpnQ2TbFdqYtI/Uy9a+kmtKzliPYgIZ8Marbq3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uz2s+5/cbZI1pnVkoiITQm1uJWfnQG6wn5mIuAq8GztVkeX5ZVacWrGBeog3otoXGuFZV6KUzCfo+aQ34hhMjE/LUxZxQ8Z3NA09mNIb5jO1W51ucoOR2ONwwbw5bHUce/JFgjwlmvO1RVncAXIksxkWQQDLUJgPwutRrGpzMxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqAUa59v; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqAUa59v"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-24498e93b8fso4057875ad.3
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Sep 2025 12:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757790539; x=1758395339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cL1JgpnQ2TbFdqYtI/Uy9a+kmtKzliPYgIZ8Marbq3Y=;
        b=cqAUa59vcn7ZaRX57PSbvw5YHR7/DQGKTrZEsm99bX2TTc36V9G6ihFf6oSbT03Q0l
         j7HEDruT53JCD0LL0Xp/LcNabhQJlVL/0FIjIsBj1UsyjGcoNwgEGvkIngXqmpJBJKuc
         VkxKbSMHrduX4GMsn8+pIeyoW5h0BD0J1su1y3E03p/P6ppATqYpVaAGBZm+Ju68qtWc
         lUMlGSSoairF32zJWBH1uyL22DeU6xEQxzTImsFuXRjB2ul+OAmEatYWTThdBF//VoO1
         NuFHuWGZ152t51UvqtjzxteZRoIE6l7q+2LkRqLv/b71TawrCov8K+afvFjZEHF8CRKM
         2h7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757790539; x=1758395339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cL1JgpnQ2TbFdqYtI/Uy9a+kmtKzliPYgIZ8Marbq3Y=;
        b=plow5hOIEVP9vd+r1b9T1CxtOkJEuW981WKARhVEM5TjR0MOvVCTgQ46Jd+0+GgwrZ
         GzLY4gh0buDSStyAxcGiHsaUIHEDxES1Yof1f6Hti+ryh4FLR30DOTXPQyjbRaGqwITN
         Fn40GuDOaXD2rOhYst0D53C7H4UoqUNQXCQ4CBexQYekbUEj/bXSYhlr96a6ROn7IfP3
         CjVoxoCdz5FifyEIlwVQ5coUrUg7dUh5lLmtVvxvyPXuK4RO5U6ukCSO0diozjbllffg
         UrdrcEXJuHJD7XQsnTJg4MqGAIX6BxYREVj0/Jf+9lZKxpMyE1x5ZHjpdXHJ5p4B6cT0
         SQSA==
X-Gm-Message-State: AOJu0YxGRJOWht27eXj1GCD9ik0gnHbwnDMBUvmA5M70YUPJ2f6j5t1d
	EALLye7ZJiYXcDIh/lAb473s4ugLGiRWwkriZ5XlfftO9K96++QEkRNzr6yxyQsQVMi0Z1kSXP6
	YK5jN5ozgr5NqSWeRQB+WghLbEw981vU=
X-Gm-Gg: ASbGncvGo90/Joy1zQDwJEjP4xzSPnCCxD6UBSrHgkNoqAvCHUfOcxED6lQ4qRZ0iFF
	u9wXxkJ/q/Yu8Sw5p8xcUrSvhR8gZjsMAHUNrfpkiGQlEPgbEqTXsE1WcAIigTqItSLDOAP1CqL
	1d/AZoaTmHRr+Bl9dW99veiXRRjW6IUGV6m3zA9zIpPOa6hMxHcn4TvF4gPil5H6Jf4uch9tnZ2
	+xA00AfBMJbzcbtijLWWs/opjvcVjGf9jwW4cIXhAaIKhLhvjuNFdkuCgcL/B7CSHsjLpESHHCY
	oIQgWD9tbFZqOsItS+pNB06YL/MrjSFfujlp
X-Google-Smtp-Source: AGHT+IGbxMdqDo+9laVibenhSquXWzw5Wmdd+X9nwkQAivhEhBlvXq6Zhy7cVyZVuC3X779qYyESCP95mzaeXYhDLVg=
X-Received: by 2002:a17:903:3406:b0:24b:677:6d4e with SMTP id
 d9443c01a7336-25d28204b25mr30920795ad.8.1757790538846; Sat, 13 Sep 2025
 12:08:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913172557.19074-1-sergeantsagara@protonmail.com>
In-Reply-To: <20250913172557.19074-1-sergeantsagara@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Sep 2025 21:08:46 +0200
X-Gm-Features: AS18NWCYSG-Quyu9_kICkk4Cm_0p8qizjLEvqNGQ_yosM2D0Bf8tLBC_L1FwPE8
Message-ID: <CANiq72msM5PT2mYKrX_RPXYtA4vapMRO=iSex1gQZqiXdpvvDA@mail.gmail.com>
Subject: Re: [PATCH] rust: pci: fix incorrect platform references in doc comments
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 13, 2025 at 7:26=E2=80=AFPM Rahul Rameshbabu
<sergeantsagara@protonmail.com> wrote:
>
> Fixes: 1bd8b6b2c5d3 ("rust: pci: add basic PCI device / driver abstractio=
ns")
> Fixes: 18ebb25dfa18 ("rust: pci: implement Driver::unbind()")

These do not point to the same set of stable releases -- one cannot be
backported to 6.16. In these cases, it is best to split the fix into
two.

And in the one that can be, you probably want to add Cc: stable so
that Greg's bot doesn't detect it :)

Thanks!

Cheers,
Miguel
