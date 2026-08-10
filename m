Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1491838AC83
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 06:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343524; cv=pass; b=FEzqc7HWRiRMlSJqE9vtn8BKTxTqYyoxIX9h2jnI/+dyBh9Ln45MZYAxir6c6gZW3vWlCUTQL0k6CqaMmWSdUIWJqrC7A2dkRxfFgfJKTOh3wb++Rpad6froLrcdS/7bYPz7+ef6cz4OvBUEe8gHMkoK0r/kfrkuwaJDpnh17bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343524; c=relaxed/simple;
	bh=C7JxPzndRHHkT0y0iCLUrwUfo9GUTxcUbmYQTdXqXvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyyS89ZVR3kA8utX17BpxbNQDu4Zj9xYbYmrDSJmo8WIdMXnppjejDrpAEebdXB3QbJFtkZrmr6CMcL5hjaqEuHsCK6HkCHWVhZ3MR3HazIXTMkXk6oxncg2BDno9D0GlcaMta42GJbmMal26SWRCE4DAYEXzai4/dHvpEXBbAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8/0dCNh; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8/0dCNh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ceeee8c46bso4598525ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Aug 2026 23:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786343522; cv=none;
        d=google.com; s=arc-20260327;
        b=iQPtQO4vylXn/ny9hqGpp9Uwhep2fhY41A3oQntNbyc1ZLeVk88UDj2CMOep6plNyg
         gL09VbLhsr5hgFcf6e4fqakqdixA1aeLag0EQgcqHzLoiQxgVW5ngbChYvUc09zVX8OR
         5grOt2YClFCG8hwXL0zKdM8A/B6rk8TUyZei9jdxwFpcUd/+mejGm0U5ZVzyh97xSXlf
         UTWhImUB2gKQmWnuGBjZdCxeaXz/YxbnHV9uZYgMzamuEyOTPzMmiIopQ4LIizV1TY5G
         L8rSIoeeKBZURsshh0UIQMZEmvXDi08HkX5wpRG3yCTe2A62xwEdsjmUBqKBnFukVjFk
         1n3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C7JxPzndRHHkT0y0iCLUrwUfo9GUTxcUbmYQTdXqXvI=;
        fh=NLZ+n1mc/EH07Z9SEZPOt8FA4ZvdYTxcnm7c+nIBCII=;
        b=U/q1VXourt55xiRwZnHYOo3MeAhmH1LNBRC0Tv3MaePun9mlp3HYNzWESxvodJGN4V
         OcIEvSJ6dPuBmIIXPP88ZoSrzM2Mk1iFPxAs1zMg+WjezcIZoLnwfzvXQRESM58Es6mJ
         ClQzEeIQblXIGJHUFgsQv/UEXBlV574D/sfch456cP/01aoZWoIoBczfU/XK5OQfJPxM
         76DIsUJ/YtxXnGo5n2bFlJAvhaWf0XcvPncZfqXJnmUwpYT7WXBG0ZpYVsXzQBa8loBd
         8ywi4Yx2vqU3bbj6/fGTrRu9y74irBgoxKidcGozMoKistDiXTd5QRwWduhti3dXQ1lh
         joiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786343522; x=1786948322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C7JxPzndRHHkT0y0iCLUrwUfo9GUTxcUbmYQTdXqXvI=;
        b=H8/0dCNhsbJocdrwP6HqDPXUHzVQMV2k47T0Iw4u4/GasR296vz8QBSjRLp5EdAnrN
         pqDZ91YGnCeZo0xZJdnfH1gUMTsAGYAekmGWdrU36kSPf5qLQ2u3lxoVsLPkiHjHdb7u
         3EmvPFQqD6N6PRFv0/PBKrKhw9+OjIThxLTQBH9FaWS4vucAcjVGgA+HtVpG+oMi+H2J
         bFUZHwj9dCOftyyc5WYvg/xxVqti4drMsdmrXerKP1M/XFnFiRZUlLYnGJDNSuBYYRCQ
         DM8jmvGymRHC9KyNjdpU6x+ZG4FxbM/U6FF/QL7tlMFoePJB8sUOpTIyfKHJ1uecDdvh
         R7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343522; x=1786948322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C7JxPzndRHHkT0y0iCLUrwUfo9GUTxcUbmYQTdXqXvI=;
        b=LnAry01G2dFRwCZsIWoHCIKkzxvHBp5tR/R6Qr5t7pzFR0byE3Z9zqJ+4ti2tp3Gao
         gf2caYID7C+fyOMp1lXeEXiFTAI3ZPoT1tWsdJztaphRfTNp6/3NBoSqft4CpudGfyzJ
         cm2qVIXSVXwqW4L+0/3D14/nZ/YOTgHX6sNWN0ejVme/52a1QpxKlIKCfgcVB4bMDrk6
         iM24VJA09379DfpvAmHF3jES0aHrRzSheRCcujJCHviyyVt+xXVa1sRb7tAep7qkoL3i
         z2IjHi5gAd+StXXXnU92JjoP9LO3c+mumZgjXjM4AfIqw6aQZyzTnWSRW0ldut9ePI0K
         6AcA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0JYCWhWYNLtplogKjEjM5wZiup9nt8LuDJdtxLN69k6jtItSxIdkMPTKUvWfXBg6l5pQCG5Yxh/bJ0CycRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQAEoiZfJdamLATX8lpIAcrCsL61jP1tBRlgQ91wPVmExrAlkk
	UeU8Vw4rgNSQOcM+7Q490u345SIiEaguShk1n1hKhKKVASA6PyJxwtErDtsmxG1LcRRfhkb/OjL
	lQocZj0yiSRIkk2ve6bYs8b6i0oRx90M=
X-Gm-Gg: AR+sD12Hi49cTpY3JYPSfcjr3V3HfCtCP5aqxLruSvbfV7T2SWj+I2swHeKmPSeQboX
	vvN8iqnK+wx6N0I3PR4/K1bjdFYpoKpg8rwfe94I/2a11Tfyh/u6V7hR4Vn59wRHtQDR0KXmXLC
	bBv/PqPrbTh7dMP8WWEpXiNiEse9xqouZdmZogYyaCQtwhwh2izeOsh6NyeO7jdMlSmK9VdtQw6
	HDdKzxg81qfTN6Kytxi/Ayuo4Q9puPT+o7nWq8dt/Op+XRtAPiTuxCs8DC0Q1cFRu3CcfJWtA3i
	S06I+hoLq9AYFK1Ztu10CcyrkYuoJn5YFgdefJ4sG2HQwisDRe0z7HbxyyB0kp5rQnuFck/iCWL
	Qm8LFD4J2Xh/jWFub0XNkEHMC0dSiol945o9eqkPcG9j6VWr3eMi0cr+ghqak
X-Received: by 2002:a17:903:1b43:b0:2c9:d298:6c0a with SMTP id
 d9443c01a7336-2d0ca9ab066mr334904815ad.2.1786343522444; Sun, 09 Aug 2026
 23:32:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807-hashedptr-v14-0-817009769ffb@kylinos.cn>
 <20260807-hashedptr-v14-2-817009769ffb@kylinos.cn> <CANiq72=urinBJ52pS+pS3zOdhCXC9hgCAU8NJjVqyw87ZQ4gQg@mail.gmail.com>
 <f17f2192-f691-4144-9c12-882d3e528753@kylinos.cn>
In-Reply-To: <f17f2192-f691-4144-9c12-882d3e528753@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 08:31:49 +0200
X-Gm-Features: AUfX_myeXSLq-BG2Pl9KlG3Aq7I_mN_HAbj3fhU963gZTU-hHRUGrhhqaLJlQAQ
Message-ID: <CANiq72kksntNgis8swLLMbaHE6MuX0M4Mdbq=fvaom=5C3vfKA@mail.gmail.com>
Subject: Re: [PATCH v14 2/2] rust: fmt: route {:p} through HashedPtr to
 prevent address leaks
To: Ke Sun <sunke@kylinos.cn>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 8:20=E2=80=AFAM Ke Sun <sunke@kylinos.cn> wrote:
>
> Sure, done =E2=80=94 width clamped and a few tests added. Will send once
> testing is done.

Thanks!

Cheers,
Miguel
