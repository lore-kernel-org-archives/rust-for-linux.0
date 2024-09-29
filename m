Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100D7433A4
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 05:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727586667; cv=none; b=OeMXTVfEPdFlLWCRX5RCSEpnXNRv+aCXRNPhQ0pCFDit2jrBXo8eVR50jlbLaftHGZBfgExwKJwqCEUIBE8eaQ1SLhYJT0XUL1BWfRLeQOq4QfLXf5Q9arPCgfhVoO6Dz8LeqcqJApHvWpJF3bpVVaiJ0J/nTve2pjoeaJ7zlhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727586667; c=relaxed/simple;
	bh=RuRZYVvei28eDcQ036NK5OQHIXSS5Y8RpN9am0sKM4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HpJGx2rPvah+MLCG3u3OutNR3UJ+qTK0eGWPd0zpW8klx2puFNUCgksdTr4kZLatm7sutNO6CZoQmIHH31NaM0w1KTZu/TzVn8MWcmO40MOD6JbURmMgC6Wind1CCfX+BdZKTy+Og1F/9KAYg58pWkmna/DIDXFKAcL10bveevk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=GHsHKypO; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="GHsHKypO"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ddfdeed0c9so26736387b3.2
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Sep 2024 22:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727586665; x=1728191465; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuRZYVvei28eDcQ036NK5OQHIXSS5Y8RpN9am0sKM4c=;
        b=GHsHKypOzHZ4bYmcxf3vuQbYwLqT19xD/oYNIZDOcf+BzFZF2/zMNczUgXiFzAVkZr
         xUO+cXYbyBdN9zTQuuPy777zjGb2cTgzw6qkN2hATZBorRQtkw2Gm2681rymWU+23HOL
         NQtllUjCR6LAybPlFJYGkcUjdDQmKKhtYgjZJajL7hgVzfqZLl5p0kaWsqqV1f2+fvJ5
         Bmvd8RIEKg4cZsMpU5adABfDsFh9DAV2uOucmgfdY9X8/wKloG0fOsQI3UllhHBTTrBP
         VO5oTf3C/ZHmGqAUbWVmfHpMIXtCErI3YbMD7t3Ad5LQlrPnDkr2/L3ujzzW3VbhijiI
         YoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727586665; x=1728191465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuRZYVvei28eDcQ036NK5OQHIXSS5Y8RpN9am0sKM4c=;
        b=Pa7sqzS+/SjRs6v11Mzme+IIDEZAPwf45SOE7pMJc4RcjBXa/ekNJNE0xOkXx8XGQz
         OPgL9bevZ+55Sc8L7SqxX2MayaVwRXbidKjT6gQbuuJJ/NabZTPi4fNtHkJw6bhet1CQ
         viE/lH9cN1uSSFTlrp/DcWvt30n0rB7Wp048MgIOOpY6d5e8j3ImH+CsEy2cCCw+hPFt
         jZGyQOuqv3JuJcSsBw1PBAx/pJKSvZ4Nn7S4oF+6w2hCl8vVI4jx02Z04YE176FS8BVl
         WBj5xzBVD7A01+zysLv8LNqN67mzkMXk97Q+D8pGixqtDaFX3xSuTkWee5QPugeMPPkr
         NVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSDG1rylpciyWsgBFxEcnJNb3TF516W0tMv47L5G9YSAaV0P6+/BIuFN5RvHFAxHiYgchKozwAdfD744pxPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq9hR/WzGBU3Eleh2SsZtx9L3RbYjiG3NMorXavd8O275evbLQ
	oyJhq7miEhFbxMSL2+VpUnINUjw8RQOyXFlLnG6muyQ2yGp9oNwo/pByKTkJHhqsmAoTKGTF549
	j6wZDtejf0rCEmjkA/L07R8/OyBh0Ws61mT1Isw==
X-Google-Smtp-Source: AGHT+IEbuPLIS0r0UAYXOL55sJ7MsrTfAySS4mECInBKGc5OhJ5B2QgDR/M498wdGIiCmNjzbtv73pF/ogEFQj1XJkw=
X-Received: by 2002:a05:690c:26c5:b0:6b4:e3ca:3a76 with SMTP id
 00721157ae682-6e247571063mr46680857b3.19.1727586665054; Sat, 28 Sep 2024
 22:11:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-19-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-19-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 01:10:54 -0400
Message-ID: <CALNs47vPzH7CSjRh=jW0xNTh9=oajUs4SAkTE2OHLd5M2e065A@mail.gmail.com>
Subject: Re: [PATCH 18/19] Documentation: rust: discuss `#[expect(...)]` in
 the guidelines
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
> Discuss `#[expect(...)]` in the Lints sections of the coding guidelines
> document, which is an upcoming feature in Rust 1.81.0, and explain that
> it is generally to be preferred over `allow` unless there is a reason
> not to use it (e.g. conditional compilation being involved).
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Would it be good to mention that a reason can be specified with
`reason =3D "..."`? I don't think we use this anywhere yet.
