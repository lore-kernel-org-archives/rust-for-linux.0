Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDD122F175
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 10:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744887199; cv=none; b=Mw/73xuSwRzWiFZ7LoqnyqocpDKhkEy+cyYPpjCdoLqxbsoQhpMWaP99TjBJI/8pbyLs/XgN0WbJxjub+HMUljUkfUOvMM68s+s5FCONmIoD/Vydsn1jwLiKBWhAfo/VjO03FPzAph5wcabzm12r1G996n0Ey0mGRvfQM7RTr2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744887199; c=relaxed/simple;
	bh=TN9KJtRsZGBWIsdR/WCrzAwefL9in39EEzBtWzHT0lY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mz6X/NU7aGuyb1k3NCypJued2mZ749txkzu6bEPgLPXWd40JHav3FrWfW9N6Uyck6gC2VhJLuusHUZNWlxpO7uLdmUUW4djZEhgb6PmxBn3VDqwjmsScxi4dNArt5pY487XaNV4jiKerErxTf1yxOGQMvbHoAKdTZYf5IkIUWd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwYhOb0H; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwYhOb0H"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-301a6347494so113392a91.3
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 03:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744887198; x=1745491998; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TN9KJtRsZGBWIsdR/WCrzAwefL9in39EEzBtWzHT0lY=;
        b=kwYhOb0H1GlHOGTiFqyuHyH5jTIqLCJYCeAMJIYmmzAgYyigTExDDnVB/oWsZzIoey
         T0TFciyvBwI0pGduoG6oMVJmyYonq50Hi5qCtlmminA4RBYz+fxHT+tRkQ1iLfAgvEaK
         CeFzrTr8fGzQV0JzrtuaEr3CB/U3f5Y8udB5NOBeoa9neKNJKxM4SpBn5KAnaa4cNOcu
         c/MtsAHQBS12Ndfeciy22DwthHW4e5pUoP50EieCBAOvQAp9gvseaMWh5vfHLtwSGTg3
         2eZwEwmQlI+STZXZTLmHAjkWKVPvGy40bavto8DNcZVUGqEITNOnWZ/7QjfnXKWBGlah
         KuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744887198; x=1745491998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TN9KJtRsZGBWIsdR/WCrzAwefL9in39EEzBtWzHT0lY=;
        b=dd6Fp1ErYulQ7hRkgcXk5v5ivVgVJMRXwTTGwf/SsopOYz5FH1SAHUoNqPKdO0uBrL
         CsQjTD7EFKeAwaApxmF94YGsKGjp6JU5/5az/bjjygB4J1yb0C6e6G3trsMbJ7D7g8HJ
         BAnqfbwgI6+h0yjzAzHjssBuIdZxYpwYcqM4Jj5deNF5uY2ENiklwuATAhwFuo9A7AiV
         aFc0koNHKCNEh+yUj+PPLtPvFZpfLF6g1EpVnN3PVkjoEeVheDkAyP0DqONMe4nIsMHS
         38+Axvw1alXs9OqeSodiuRGfb7WLUQyTEvwaP5WV4bBJH6JF1mRHtDkrt0AwHFFF5Ju5
         FkRw==
X-Forwarded-Encrypted: i=1; AJvYcCUyaqQwuG1flCvlMBblZOa4hlxoEaSZsohnUe3lK5ac3rX38GMDZNG9Yo6GCzvoMiANcSH8PWBKqlZPgqLvog==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyzAFP/crLVI1u6dMKZJFBwaUYZXQT3UDK8kjfZrZayMDMh3lm
	32o5+EbH5fakTkWQslSF1cGeE4dBc7bVpQlxPwLPpLCjOwj0s9khg1DfV0aNGZfJvIFz4noP7gf
	YyJeJX/QVej6/Ba8GfyHafgWosuo=
X-Gm-Gg: ASbGnctUEfUuYW5qgBnk5suRGOfuaySwcnuPKoCOImaVIQOmHN3R8+7/MNRURHvKyEf
	kGeI7MLo5unHb7MVBYOzVtMdjglipTgOULMEgnPb4QUzvZupznBSQFSNeXEaDvskbyAxheKDj38
	IKGNJbv/zXvGU2U92kR+8qyA==
X-Google-Smtp-Source: AGHT+IGPWDaik+AC0cOf1gDMvC6UfcQ7fbGiSwACpVa1Fjmu7bmwZizYirBY4Ca8JxaHXyME+iYOu51EeqspY7MYt/E=
X-Received: by 2002:a17:90b:3906:b0:2ff:5759:549a with SMTP id
 98e67ed59e1d1-3086d3dd440mr1705721a91.1.1744887197635; Thu, 17 Apr 2025
 03:53:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326202520.1176162-2-altan@ozlu.eu> <CALNs47tpNTESodQ+4083oWMAS9hT2z8dmRy8nGDW1o74051dAw@mail.gmail.com>
In-Reply-To: <CALNs47tpNTESodQ+4083oWMAS9hT2z8dmRy8nGDW1o74051dAw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 17 Apr 2025 12:53:05 +0200
X-Gm-Features: ATxdqUEn2UtjvX2r2V9Mc5DdZCXjpr-BUjldJkz5QRYEYOB3iP1w7pMb5Npxa2M
Message-ID: <CANiq72=sGwumD8RGzDqONERqkyX2c8SgkzzoM6H=fKn-3UW1Ow@mail.gmail.com>
Subject: Re: [PATCH v4] rust: static_assert: add optional message
To: Trevor Gross <tmgross@umich.edu>
Cc: Altan Ozlu <altan@ozlu.eu>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 9:42=E2=80=AFAM Trevor Gross <tmgross@umich.edu> wr=
ote:
>
> I think this could be "Closes:"

The documentation isn't very clear about it -- my reading is that
Closes is meant for bugs, so I have always used Link for feature
suggestions, but it would be reasonable to use it for that too like in
other trackers.

Thanks for reviewing!

Cheers,
Miguel
