Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C312FC52
	for <rust-for-linux@vger.kernel.org>; Sun,  3 Nov 2024 16:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730652130; cv=none; b=Cs747nM4Y/ygn7bfPKY+vQEzL2fBP46uCQoHoRPN9yigNM08550nKWCqqSsTGRK4ELWYw299I8TyPMT05y3rSDEn79/lP6h5E0V/0YtnwXpRgXupdbMlHb09Q61vciHgyz9zSg23gfzkW+3Eti060+zHqyQr0IVpm+bkQC3URbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730652130; c=relaxed/simple;
	bh=o9jX2+TGMaqyIKyTlLGJ5osm8kCyVXEJ5zxJuHdQ9Vk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p0YDlDzo+KmRjNVdc8Zdn88QofmeI9CQW+Xw4aYIXm87pKk8SvgB2GzkXnbimqLtj5uOu3JbGwOc99ZHTyMsO6vGi7vWVQ67+lbHFfJtYomj/Y71KHfqf036aHj5t1w0Eq1Mz8DiN6KqDFRSmMZhWP/rxiW1UlNoIRpf5yVtEcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUBz+V7v; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUBz+V7v"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7ee36621734so648337a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 03 Nov 2024 08:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730652128; x=1731256928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9jX2+TGMaqyIKyTlLGJ5osm8kCyVXEJ5zxJuHdQ9Vk=;
        b=WUBz+V7vHDMdFrfH8y6GiDrnbbrERL05GbSRowCaTmrmD8AKhI3+5ukskjCuy5sEK6
         AqNc+bs8//sRsxEVukPX3C407LskIFxdP4z+NmqO6ZnSCwNtJy0cDtM5Ax25pEhls+HQ
         WAPgmcrT14+IJoBxM7vcfMyrlxh0ICJ16PbfdPKMKsdL4gFLv51jV3l2jdu7mdoeZcub
         nxlz0fmr1hkxl2rt5SEiyY4fm5/YtSN/XPEjd3qCo3DDVC9mHoJiFIquvZNyZgoBZapd
         X+tR2iQXIAKcSmT1s5FA7lLU//XcVLBfRK7fMjaNBJjP3BPii+0N7wnF7sC6pXDh7GEh
         x4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730652128; x=1731256928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9jX2+TGMaqyIKyTlLGJ5osm8kCyVXEJ5zxJuHdQ9Vk=;
        b=jMjyV7oQe2PZRNb4SgFILD5tHLCte3HZjrVykb7TCZKj3SnyYbbjXkqQuaBwc3Qthd
         ToI/IMOfWTKi0Rx19OyW8r/v4Rda3oFBxtoYqprO0WUL4EM/6rZOw1WuE/tcPf24i2wm
         +PVnEU5mMSM67QkaHNZWj+DuVwSVzktK1dpM+BcHYH0SfUIaVs9kPESDNTuqr1YmDQtc
         J9IJsIXgvmhFS3XKAP5C1SUtpryWc37513qTDAxMIe9a5Taj/m7C9RKN7JNYWKtNGSoG
         eHfhR52Cy+oCEaWxIL++/WdrQdLXf2Htlh+QVvfd+dsfPiKIEzokhqs7GvjRopcyT7PQ
         brQQ==
X-Gm-Message-State: AOJu0YyNYdrxiACqZghSpqmpePX1qEuOsYslrJbNrhMp48C2KPbW5Sj4
	E3CU/VmmT0WOtWVOF5jcklYC8k0qKGJXNa9J56CZ0Yo/uFqRL2i7dhiI/sJLlFM4G871l0oYxwR
	6gNoIlxNeSTgplu1aro5vBLpLo9o=
X-Google-Smtp-Source: AGHT+IH+LFTX35zDBxgh64nSgdV4JXBP6yvNcfaK2kkFS51bMYOnf+/MtisxZmu2iR6HVGPshSgk3aqAXIubJYHHtYY=
X-Received: by 2002:a17:902:cec9:b0:20c:a63e:b678 with SMTP id
 d9443c01a7336-210c6cffc9bmr186076945ad.14.1730652127905; Sun, 03 Nov 2024
 08:42:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241103030530.76756-1-fujita.tomonori@gmail.com>
In-Reply-To: <20241103030530.76756-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 3 Nov 2024 17:41:54 +0100
Message-ID: <CANiq72n3bdNoYsSo47BGK2AJX_yhREoOxfKwkMBwz4v3bR-UHQ@mail.gmail.com>
Subject: Re: [PATCH v1] rust: Add pr_*_once macros
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, jens.korinth@tuta.io
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 3, 2024 at 4:05=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add Rust version of pr_[emerg|alert|crit|err|warn|notic|info]_once
> functions, which print a message only once.

Hmm... Isn't this derived from what Jens was working on in Zulip? (Cc'd)

Thanks!

Cheers,
Miguel
