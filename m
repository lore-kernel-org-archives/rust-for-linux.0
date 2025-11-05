Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE943161A1
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 13:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762350579; cv=none; b=KkKvyt3Ph9YbQsyu78j+88vK88UywLBdXZkjhZ7iT0tHvT6GTJKB5O8M57pmjhqXXE+DirOxoUmWgqcVJrWXzMtCszE/AgDOwAIErcY35ZQFgXtIey6Hku6CofjV9MBLiriS1AdBkUZ+I7H4JWKPPW+VWdKx1MFxnyZ4ylmm8GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762350579; c=relaxed/simple;
	bh=oIm02qwQMUr3+CCU5508/rpGiaIngAIROsHPHbOPNLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W89n3L4wK3nF1qzjJuV8mnsHlSz9K2qrdOP/OC4XRLu1Rze72XqdDsEaj2GB2XDgjdHrgp3bbgZQYSmHf8vLf5bOOIOf8z/LTpkn1H/Ul6ntpghUhe8nh2mXTKRiATy2GMOVdKXvTDZsxQvY3tSlbl0lnxG+W4GaKjo2f86zd60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqccyxyL; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqccyxyL"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b62e55af64aso512891a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 05:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762350577; x=1762955377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIm02qwQMUr3+CCU5508/rpGiaIngAIROsHPHbOPNLc=;
        b=jqccyxyLlkPLPbHtw/XfA+Uym8yLqm9tEmy2RbsIJDO9CCzg9TzcFpBPv03EZCxRGd
         WW3kVNg39rnr4JRSOUMqZgXh4+y7ke+2LLCHDLxMV1NGMn0TzbkqVi1NNHgBFvTsIf7p
         qLjLrb9Bgo6BVjb4DCZgBVHS99Fwo16LtgOlbLeBiRYJpZ49vodqaCZ+vNnlzeDVwP+a
         IDyzQ1AmpYLJUPjbhMz1SPDcbSUYlJmkyi1z9jJhUcupkBUtUEq9p9N1KrZUpYoPhzNr
         5CngbwdcKArUandkOh2JV2bNLrtrC90UysoOvJY5vkXArGC7zH+5OfsvS9xPKJYQ62wy
         CFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762350577; x=1762955377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIm02qwQMUr3+CCU5508/rpGiaIngAIROsHPHbOPNLc=;
        b=DXjLmc2OFy4knzvO3dF0iJu2f3OjMv9TzfX/hS4PHWYTQ7gJdJnV5Nnz+6xXeLkYUj
         co/1vtN7Fzzyn9d0Ft+24iCAgJs/yIO3OFjACDX3ozsqsjq+xJZrcdMsJIv3KOAfPvQS
         Xit8pnEXiQYOsFS6pV3J1CsN9iW/ewMIrpnxDeMYu4VtB76chCgVbs6XXhmQ0zMHDtJ/
         y8bpcGHs0RywPJTB3/PWzfEqJ9PPj+ICYm6HAU/dqCktYmOn1wb7kipCnZBFDAzwfzt5
         tIRe2Q/+Y+677AX+N5z7gT+FeqyTIRs9s12c39YfkeAaLfDS9tcER69FKgcsUdZWWL3Y
         4Y5A==
X-Forwarded-Encrypted: i=1; AJvYcCWzWZ2Rn4KsjlNhnKs/aZu/qNj81icRpTMmL7ITeMBK7CJiy+cxRsswAxtPZ97RkvYGqEHGXSbwAH/79RYIpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCC3qgoXynpEvO8YV84T9YuloLUTFWWl8F+Pf2EBiF/5fEQpYe
	Fo8/VNQdP8IzPNvaj9ZEISn39qRQgvT9bqnpQwb16hDbNHP2+MbHOao56hMvxddAT3d79lo8YlA
	MzYwfjlZt61YETADSaTF4tCwLacfSG0Q=
X-Gm-Gg: ASbGncvJwE0MJSnGHG/FBuZnzkjgweIr//zs0EiagRQLi7HcmLiGdWKKwKlxgxm1tHr
	xu0T1Rcl0DeZNXuGYXeHze+ukHt8CfA9kDGJQ+Rm2y3i9IuZuNSiv+PPJ55YdC8p0ou6R2F0nqi
	Ki8Y26x96cc8zumfmOhsTNjk9ymTxOi7NB9NAWefrrAnw90JTK9FvdXlaSXjxmwrAWKhi929AGc
	UV60EolHDsWSrzZcsu5LEq1oMjUFARKch9hKCOkbz1IEXdWNGM5AsGZWMQdukJ7nc4VUB+AJ4uw
	6LgOmdlnEUAdg0pV9pHuGs2h/3VLRqoNMVcOH1WGbw70cmoJ2FqvIlD0UhkNcoLF6f4baj8tNLu
	MEys=
X-Google-Smtp-Source: AGHT+IGWLachPv11EWrLKE7rZGSMROlPAdaCj+6oHxMpOeQbc5pf72anPPI+Nftk3bVxhmwo0c7+rcHLAvKmUO+B4uU=
X-Received: by 2002:a17:902:daca:b0:290:c3a9:42b5 with SMTP id
 d9443c01a7336-2962adee35emr23599305ad.5.1762350577024; Wed, 05 Nov 2025
 05:49:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <df3a68334760b2b254219a69426982bf858dee39.1762221537.git.chenmiao@openatom.club>
 <CANiq72=WZJ5=UACpFLWCVJ7mcXbc93X9MyYAZP8-0F==2b0adw@mail.gmail.com>
 <8d865a46-82c8-428d-a371-407889eefb62@openatom.club> <CANiq72=OE3JNpemanR-r1efbgKqQrZCiQ7hY2-=_bvxLyJZ-HQ@mail.gmail.com>
 <282bd8d5-afde-4a96-b294-bbd7b69ce684@openatom.club>
In-Reply-To: <282bd8d5-afde-4a96-b294-bbd7b69ce684@openatom.club>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Nov 2025 14:49:23 +0100
X-Gm-Features: AWmQ_blkRqxnqjxsVLafgzdnmODrUxOguF_tNfS8UDpxdUVWCEiDo--qmwSmN-w
Message-ID: <CANiq72n=i8DM7uwhZCK8KZztsDJxwB8PEOpN1qrQtOFkG8aqUg@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: Support more jump_label api
To: Chen Miao <chenmiao@openatom.club>
Cc: ojeda@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	"open list:RUST" <rust-for-linux@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 2:46=E2=80=AFPM Chen Miao <chenmiao@openatom.club> w=
rote:
>
> Well, I will follow this rule and change the Signed-off-by to "Chen Miao"
> before the next push.

Yeah, the rules are a bit particular w.r.t. other projects, so it
takes a bit of time to get used to them -- no worries and thanks! :)

Cheers,
Miguel
