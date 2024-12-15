Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAD2A41
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Dec 2024 22:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734301542; cv=none; b=UM6M3ATbZMTCsRzkHzcIErbaYY6MFdyyjYD1VJfhGD7KA58c109QeGXzpuBaelpqMH269xVOsXBSIyH3yLBAloc3sIwQ5FlQRuq3c0qszGvLvRmiBf1kviplZ2m1VpgfthkcvPx4HCtRYuAUAWwVSl249XWSFV/FC/rUT3b2plQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734301542; c=relaxed/simple;
	bh=XTECBl/9kFsCKApT3a1q5a+13cQQNAq2KI6nlRuvAGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DUi6qrcJbXDSRJ0zU5euKRxzz1ay5HuMrIdAjiVTAMAfwGBXFmyRDB7UpEM06JIAwzbdmn3nIzy0SBMqcAq+IvHBFi+Tlho7UIWJ28R5rbFmOpJ7VW3SpjhrlMPPEiqaiPpXM0D3GEXLetbU3/tfdhVCZfgAzZglsX4snTpdLU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fezgPrrU; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fezgPrrU"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ef05d0ef18so625215a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Dec 2024 14:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734301540; x=1734906340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTECBl/9kFsCKApT3a1q5a+13cQQNAq2KI6nlRuvAGE=;
        b=fezgPrrUmQeuElobWMZVGIL231Cq3Mj9wPC09J+dBHb2qtd/BC/i8w3Nj/yq1snyJ3
         ZlM8Ng6geeRRXbfQwVFUlfFHbUfoMhY9uwtXj7+lR6vUa/PRSmm0wwYbBdiRhZm1jXNW
         GxLeIUmOFHgqA0QfoyQadI/HVzRpoZFZ0IBySDnJZcSsQioBwI6kTYk4aGLNZoYr9dOZ
         9B1poaiUUlqc/6H/fcpY0uu5CuCDThrB0grmJXUuVPhYrwwjVK52R4ocoG97GB9FQw2U
         Gsibu9/+ObrewcLRkEpECwV/9umessq2Qw4f9NWWWSzgseiuaEfsLF9dfNsY2yQO2YMf
         6PdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734301540; x=1734906340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTECBl/9kFsCKApT3a1q5a+13cQQNAq2KI6nlRuvAGE=;
        b=M4R2Dlar61m8K2IuAOyUCnuolmb3Nq+aZYChyS5dfn474AE3Va4bDoiaWAIhNdO2j7
         mSGqjvWXtzx+BKmOcBvsWHkv7m5QqwNZ+U9suHH4Z8oFw3ynbWRYvvoaG8ksa4wHL8Kf
         ELZkFeL056bwqZBJocfflpMul7Rm0fXZngD0dWgNqpCWwzReR0rdzLbyGmeRToA7bb48
         ++SXRISX0spFIVkqOYDvYtX+KcDz/OWzynMm0ONg9lI0Z/MpsCFthk2NrQdXv2/OjeWq
         86MKi6w/X+Cz/XLuW03OG+PLVtzzJXPQ6CBktwMteXvN5Gq7DTq+gXb16p5j0qvhTGx5
         YRng==
X-Forwarded-Encrypted: i=1; AJvYcCXopUT9F3oRxgBotIVo6nAmvvGrgrtfX90Q6A/6TSlp9AihE4GzvMtDrVDK5g0wDlor8rAy5gOf9J26l+fvpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeNkC9HJbhiQYM9qtmY4nfjWQ0kt+uTiugUpTvPentay8rH/7R
	OZb5AboYo704Xw1yWQa4s+PP0Lg23n6m7kembtKZPpiQoAY+xf5drMCIYmO/swfrMqKww726dHA
	gms9US3me0dLIar86/9xe/HGW6zk=
X-Gm-Gg: ASbGncs/+Eu0X10lc99g2tLUm0xCbHXNzsb95K4FKN4zRaMF47FSnAQi52vJawlA1op
	o63C/C2/gL6b2ibhq2vanNsJ64jYap1UT/U2uTA==
X-Google-Smtp-Source: AGHT+IFREr4OYogf5n/etlwMOGF9NMDa++D7W9nia10LYed8HSk6bjfo2hhMvB0Dfqmi1qHdR/8pg8xyMJq61PnNShM=
X-Received: by 2002:a17:90b:5107:b0:2ee:948b:72d3 with SMTP id
 98e67ed59e1d1-2f28fa55570mr5727666a91.1.1734301540508; Sun, 15 Dec 2024
 14:25:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913213041.395655-1-gary@garyguo.net> <CANiq72=1djBKMQS27smB+fMcY1ktWZDRLeUQPJy3hOuJ+Ju5gQ@mail.gmail.com>
In-Reply-To: <CANiq72=1djBKMQS27smB+fMcY1ktWZDRLeUQPJy3hOuJ+Ju5gQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Dec 2024 23:25:28 +0100
Message-ID: <CANiq72m_rg42SvZK=bF2f0yEoBLVA33UBhiAsv8THhVu=G2dPA@mail.gmail.com>
Subject: Re: [PATCH 0/5] use custom FFI integer types
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 1:14=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Applied to `rust-next` -- thanks everyone!

Applied to `rust-next` (the rest) -- thanks everyone!

To clarify: last cycle we ended up applying only the first part, i.e.
the addition of the `ffi` crate and the move of all (now, most) of the
`core::ffi` uses, without the actual remapping.

This time around I am applying the rest (with an initial commit to
migrate the few remaining/new `core::ffi` uses like Gary's third patch
here).

Gary: please double-check if you have time!

Cheers,
Miguel
