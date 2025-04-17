Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9153021516D
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 06:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872682; cv=none; b=qw7/FJC8WKpxlI7tVDsNR/aJ5LBzeo3KZXohsrMxTh9+diThPw+hV/TYtXQVjG9QHQq5xnldmo+GoSsglfa9xcMw6DBcCocTYVADTHHYcCdO+aef5UCmK1gdYRCbIXWWfHizOyUQ9GWw/JP3VwAhmx+FOWRsr9Al0fpaCgYGlQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872682; c=relaxed/simple;
	bh=i/t021y5rnafhiKzThWKY9qu+LyN04jZTBkU1mkLjqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUOvu1ELM4kWOGety7c2lkmHlhrD/SqCsLrAAgfvnhz48RSorKI4lUQ7FeKN+mBzrtGnPKwyw5CL8bigCCwXAwD2Si4z56jn0z6khuukTG9hn8w0+ntwWe6+27VQFa6v9emTBvXvKcf3tagprKCfNNzqqrFERqOvmbYzL8h7+8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=OZHeMBDH; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="OZHeMBDH"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e717c3dab43so393686276.2
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 23:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744872679; x=1745477479; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0dQX2mPar2RyrgErhNkBZUjjc8nTe6WFVqdkQhDyfk=;
        b=OZHeMBDHbTckrURrzDb/aI8B1Ch0T5znLe4Q8mHpISuAo3kYuN/csylyq6wOE23NhW
         5lc311337eX/yqbUuG1WmFRFCZ+9bFUMmCePYvhEmPKJTc97TFtPGUEhR0eK3Sod9Ra+
         03got1XLBX9kmiM2HS6kg+W4emkcwGKfYXgd5V+gxG8+9jyEcQBvoTGq3bL2bYD3ja38
         2HXKke7FOFg6yjV6k019dm1BPP402DIdw+sYUeyQ2PVlpbz9SOM2AS9XRUHRKJmPJze4
         IDIEDEIVghJHCeVdkoXBmlHUVG5G6hnaPZfIPiFU4azX81FJ3TwEzQ3lG3gDBXb3Sy3d
         aXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744872679; x=1745477479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0dQX2mPar2RyrgErhNkBZUjjc8nTe6WFVqdkQhDyfk=;
        b=dbirPm8IB63SrMpQDbBpaEgGDT8v8o5hlUh2+xt47Mq2nS342mCBC3VO73vFkGO3oE
         9oM/WnjpgqxVv6Ac8TzJtjqsT4Eq1ppLJ6/6z2HepAHfeZbBbKyRyDuLkoHgXGwCBG6G
         o4kwAhGDbkd82TUk1IG1OxzuPzYfqF5/uLiO/NQuInGNze/DzAzdKRM1/71lDpFcwJW7
         SU9xeo9Dc7tyF6aLKbLuZaqDFGUtgqMjzhD61bIQK7kstTORJDZ890s2EPq5UvZfjkrb
         r1crwZyGQSK4nMv7ntEIfyz3V8BPz5CpnMUtBcAou3P4Lm6N9teNuMiSGdk1SwC2C3dO
         lyhg==
X-Forwarded-Encrypted: i=1; AJvYcCVxzKcc9aiknsbvCVVKXLEkiwvkVFQ3Gy+MYwyNzsGnZVnBIRvGHtp7HFWbdw8hLIZu+02WRW+LIO9RvpVPMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+P9EsuaCRSAp/vWux0UywrbwrEeLzLu7DF0zf+VDuFnMu6wLh
	n3MPhY68fA0vzSQjBf6H9aWJ/YNIhg7HJwB2Ml67mtMVtmfpsQU82F1OBIU/rbcc20pksmHXS+G
	TNu80QodVCvuWvnIHfuzu9eukO8xXKkYXNoS4Qg==
X-Gm-Gg: ASbGncsCMapStb/Pgb99v8Ryuqqe51WrgP+r1BaIYbEpuE9pwdg1BPb2ZpTVZhvozaX
	2OzSwruVvZi8gcfLa+u5Dp3UPPad0X8Cf7i7bOGYEhnWhYkvYzcOr5HcMNHo7tTaXeocNCCyiB4
	ffr/uupN4NYAmqLAbLaePWxWNbj5qhOfkd
X-Google-Smtp-Source: AGHT+IF+aP2t8dB20YzvJrlhjH9T3tfezTcwCslLtc9JqLcly3TwpgJoR/i+BwaPOl1rir/bf/4qgdz5/H8nmPoyPdc=
X-Received: by 2002:a05:6902:2b0b:b0:e60:9f50:5d0 with SMTP id
 3f1490d57ef6-e72759a758bmr6352438276.29.1744872679616; Wed, 16 Apr 2025
 23:51:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-2-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-2-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 01:51:06 -0500
X-Gm-Features: ATxdqUHRk0yMnnGqWhQx2nF9Qnhveopzva01QwJpmDY5q-CY8v1AeF6E-hbxr-I
Message-ID: <CALNs47sG5m3VJS5FfQaxXku5o_LbtFcVResL4=inP7ndARnnbg@mail.gmail.com>
Subject: Re: [PATCH v5 02/13] scripts: generate_rust_analyzer.py: use double quotes
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
> Replace inconsistent use of single quotes with double quotes.
>
> This change was made by a code formatting tool.
>
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
