Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8809C215178
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 06:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872714; cv=none; b=rfPlkcM6wpaEkpb9X+M4K10j+Alk8UifL+1b1Ee1IpZtFER/mtfq96pgO3jXHL6Ks3f/HtLEyOD7oGVd6zKVeDKzSLSNIIYjdaF/oPJpxpD+eMt3rfL6Cn3eqeEJo2fel8owYSEFOWwAviEzzI4msdq/ZOegXu6vKX9XIZqIduA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872714; c=relaxed/simple;
	bh=Pf4Ipk91d7H1AfijgJfbT2PavHXksGVHQh4TrEedAYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dTguE7yMNkoGyq6MZfEe4LIpCtTCuRfK83AQR0wsaGaQLf7B3wwYPXnrZXoIpqdAcPxG3UDmQ5IuQh2aAnou/NS1H3Em/pE75J1KyY2DtqsZAN+OBwUe+GbV0dzMKJobfMfx9gMrUnTSlZ1Mz0HdZ7pb6BTPK2QbBkdULDyGmXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=AEuWlUmf; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="AEuWlUmf"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7043db8491dso4070777b3.0
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 23:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744872711; x=1745477511; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFyIxYl8CM7pfniK7v4uSLsOvO7ZcL+Q50oIJUmy4Zg=;
        b=AEuWlUmfOq6G2prBgyytwtMml93/blvtqlqp3gMyi6jrlKLQQ44pZsfBjH8FOerPMN
         J5g03FeynJiTI7vq1ZmSchrkSGkyM9OKPI7Prbs44pBFeFsWi2sFpiLGGcB9AXlllqS9
         OKEW86gvFnTWQ9bavxowoNPAxTabfBeKByKHZQoX3mPflFQ0H902g/0YsG7cF/MnjLmx
         5qYTzBf/A60aSV4FQJDLIsPlbnJNn5g/M+/PSAHyojgHE62ft7q2b8i2BWSPZ4900SeI
         2DkZ/FOdvuhZsElycvYa42oLC4VmXkINQyXQVqQi240lhaYxbErCd9F/J98E4nE3lkNo
         Sp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744872711; x=1745477511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFyIxYl8CM7pfniK7v4uSLsOvO7ZcL+Q50oIJUmy4Zg=;
        b=V1ZmDO6ISDTmwnZAyypgwsVmBM6suDv16efr0UsZh9sQbq7/wpf1M3z4XWYAFB8kRC
         eEslrXBhOUOjSrpfexmqCSwmNfuvyZg4uKQwTRtVwsT5sYPL8OPO+P/PMq1XWGn+xlrI
         JBCTf57SJmh/DQAJZUU/G939+W7aUu4Yfso28FtUXnRMMMe5u9UD+nRA64EFQWGnviIK
         1ng32M4jiYskbkOO1Wfr3UxrZzykAHe3zUsKmDn1qj+ZxHg7aJS7LeiHBW1/zqtIaHQu
         SdehxE7AObMUzs5UWIhZ3FM2M3uUGNDN+ENccb0Ho/n5FGa5bzIHPDKvQOX56MckpIyH
         satA==
X-Forwarded-Encrypted: i=1; AJvYcCUJYHOuMnSTugBYEnPljmPL2wBQyGoPsQys2CK52GIwJmOThJOlTAm67AXtTWHzLeRulXAO6CuWKEEDHwXT7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw07pr+04mExZHEpdPdHNhzHpqkWX30AZi4zvjVTDsoya65xiFd
	LtCbLx6wmvEe0JvlGUM24FYruUD17jOrMOiupBwNCVZVboRPgXRDTw3AZPOy6cc07LLsyXGeUik
	7f+wV+5Q7b4auuy0yqMC7g23n4V2vc5pVqxj/0w==
X-Gm-Gg: ASbGnctSPAtYhTuFs4P5V0qq4imGKUPnAHz0CjZkmI0v12anBL1KY1I2t3xQkyix+CR
	Gl9QPR00rHi2gRyCTyMOqpXRYytcKbzXg2GkYLImVX1ib0t4N/lMGrungybBHFz9A+eLTI42rna
	vtF4Kq7Pd3NgaJB9E32PR3l7DNxcIN9GC+
X-Google-Smtp-Source: AGHT+IEXcYcn3MZe5ob/F8f8GnPNfJ6UNuPjHwNzwJKDDOiGQCsvgdgGNqoqugzFPNQP+DjNeO4rcBRTLYtY2Pf+0/Q=
X-Received: by 2002:a05:6902:2387:b0:e72:6ada:d0bb with SMTP id
 3f1490d57ef6-e727574caadmr5702510276.4.1744872711599; Wed, 16 Apr 2025
 23:51:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-3-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-3-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 01:51:40 -0500
X-Gm-Features: ATxdqUHAuJi-CdQp0i6jq1Sq1031o_Pg7xduY8yp9CfsQlRjMYhWFR6hWQP69yI
Message-ID: <CALNs47uXFvGL-k872oqwP3_rv8se3qNPeaZBOjOSMmXFFcYAoA@mail.gmail.com>
Subject: Re: [PATCH v5 03/13] scripts: generate_rust_analyzer.py: add trailing comma
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 3:06=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Add missing trailing comma on multi-line function call as suggested by
> PEP-8:
>
> > The pattern is to put each value (etc.) on a line by itself, always
> > adding a trailing comma, and add the close parenthesis/bracket/brace
> > on the next line.
>
> This change was made by a code formatting tool.
>
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
