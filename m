Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2788B336ECE
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 13:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769435739; cv=pass; b=jMC4Foqc9EZdRXVSst53Yif3TqHdtz8xpHjifUfhMKJsUhs+eR8Rl+JqNZ7R3jRZBQuqgKOw988ZB3yG/RVjbocakJeehRJioPj9dJPRrniia/ykGp0nMpkmprgGgqgaHVP8gDXoKdN8bmHJo37Ni2MzhkP1d7kg5P0rj1vnmzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769435739; c=relaxed/simple;
	bh=b6DokXlQUXaoLAECOJp0FMTClH1DCUB88vz/30Yv4ZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gCeVZ2m7ssvURNzhCnNy583Nl6NatYijPvATPSOwNCUCZmPvPjvd+cLBZVoV6yS5Q6fNa88Ir2qJ9Fz3J01xYzrUib0E2YDQ7DdJ2kENeddr+T4DgRm2sNl9D9N2lFj99Y8tuvlAL6Op1oDDpzFSq6IjWLds8YsUxlA5Zkm+4S0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrUrjQqd; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrUrjQqd"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ae5283dae8so282977eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 05:55:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769435737; cv=none;
        d=google.com; s=arc-20240605;
        b=c0vGTvhlAd6s+WgBnjoD/hyjymFypTP0wqeMLLoy+cTe6fxQI4wA8XxxYEHfZEkIuB
         3yWJDn38aXCF5Ut+1fNCkJmYAh60quPuCo0AitE2NUx9NpmhLxhY5iRrdEiytro/aUQc
         PAoKisSvdaMHy+Ucb+f9jjRM8d/j6tSQF3rf3FsC3yXPNfEzYsdzvVg/uAWLzj5Ab1+6
         G3e10nE7Hrrn+43F3fyJawPN13s16wbTqFAnt2XRatLUqwKrGbIX2JRM+6+pBBN66W7M
         N86BXZlE0Pgh3qrL6T0f/90AMpHEC2cBHQmMpMkdV/RSxPgDTAe1yWHt7beqln7gwj29
         pw/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FntvZ4T5gjszcam39JliYGrNnoDklXiiXlDwJI631uI=;
        fh=SNF81/fPObzpUNQ0kdDPFwhoOwoAnHTPA1GQmiPZa1U=;
        b=Ls6OrFJ0DM3PXj2CMjo4MboSS/m+abvfl8/GJgvLmH5QnShrKNC5ghe3iXSM9iD+4z
         YQ1xxwkofhvtfnaAWbJ3Hikmqbwmsa7QXjL4fNRPeTc3OH0AbIiSi0jrK2EzHvzfOk8d
         FLPlWVgMKDCkGNwpBMZsIHtm++yK02hBzItXFWFfbbEMcrjeoDkFxLCzl6r7ANLxOAV0
         HYOJsbOLRsrUMGzm8Jj4gx+/XN46K/DtEzMz5ZjlF+MosRgVrb6UBAKm7lQp239lE8cX
         AvfeHWmTvWiEOb3qQA20C1IvioSQlZ1zgbMxgp8xh2ULZ3xs/4XC4iXtm+Efab//4QKk
         rwgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769435737; x=1770040537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FntvZ4T5gjszcam39JliYGrNnoDklXiiXlDwJI631uI=;
        b=WrUrjQqd8MYmiH2TEqkdH1WCmNaSDMyndr9VfDYZIY1efvIlSC3/Tt5jB9WnwCIBYr
         mJcUN1221MuXUuL1TokYb18hVdrJ8pYyQCjbnSz9N/UxW3z3Jfa6/l+sjy/nT3RxWh1P
         YVb/lF28D8tPV76qX4rzcfJ/czE5gmktiw2F54P61xFDNcm60ibWOZQapDFIVI9yxMZA
         P5k2mySovq74+ss0cbeE9SOlzCLKZkvGJrRl4rB8aIRzPbnduak8L3q4UjWw+Y5QYYFo
         nHuA8u3VlnQCubaopLsrBnkK/ZnrIKVTSOQCnf+wJ9gxhf5ggFGIb1/ewOAcJcDhILc1
         PS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769435737; x=1770040537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FntvZ4T5gjszcam39JliYGrNnoDklXiiXlDwJI631uI=;
        b=vjaT6qvqmzhxy9gkgn9VUK2vh5xHyNFlY1AqZ9tKbfdXe491CEjclkTKG8tOBcwOyt
         lg2S4GqaqKSQsMy5iIlRs1yl1djQ5If5gE4Tm/icGV1sbKVFjOtvjHstWJ4bVeSxnoQB
         K5MHLo6noJm+EHzm4Y80iHEXMpUfHXGnmMcFpe0xuIn2Uv271DPURaYVORsEoxhd2A+w
         yBgPTDNPw2cMIXH8oegwXNiTXrSdM6GL8WcobtvRFGk+x35Lwdmas4+wFKHdOYzHlrYm
         mKBAPmUPzwNaFieUtV96I5ArMyYdBcC8D2b2RfC2zYuOjGvqeeQN1yiSInMSr3EKwpfX
         6RqA==
X-Forwarded-Encrypted: i=1; AJvYcCWLzo7YQu2hcf0vJLCqNXA+Y0+UNREkBEPRjbBjedhxaP/aoB2vBd4or7irRbzjURXJ3QprGKfQO9gHxWMlbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6v+C3d1lJooOT0zg9oBhRYJSj3XESKh9HZC75ffbiJR2uLCvP
	gnR+GKhSLijUGyfVJjy4/IupFREZAu/T1Mwcf/xQNiUvmnCK3/hd/hb3+At3QMFtl1Vznfd6xzr
	vEHzZO968m+Uu3QgkiUa+CQo5whS8hbo=
X-Gm-Gg: AZuq6aL/HNZ0fb3i47tslcFKbGCnDYeSV1h1dfF6pwdBvzgZWIJg22il3IgaGnNNE6V
	xxKaozOozAw6TiBvV11m33qw008nG5yozIosOi1wY8QOkHVNZeI4hqB076A4ey9up95NJlqPVZU
	/RhBB77FLB0iLSRQmsuFtJ2TSJzN8+MAQG3iEB/4uP30yORyuDUgkF0cofjd/9M6VTZph9OuNJF
	kMYXPEp7KGmA4bhUCf2yOQVxvtuZp32j3wxbuWAo6Kquh8YjtZZ17ua53Tfp5A/KYK2icoOMzuD
	cPvb4fb5BrQqEceVnWYAwQVbxXGfrS19uiGdohHyfmoIrUd4vbtBjfOnIJY+Hb/9RTHMX6Y60Pv
	b2vFl9RTgcyRO
X-Received: by 2002:a05:693c:2c0c:b0:2b7:3678:2d1a with SMTP id
 5a478bee46e88-2b7645253a2mr1178341eec.6.1769435737171; Mon, 26 Jan 2026
 05:55:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-register-v3-0-2328a59d7312@nvidia.com> <20260126-register-v3-2-2328a59d7312@nvidia.com>
In-Reply-To: <20260126-register-v3-2-2328a59d7312@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 14:55:24 +0100
X-Gm-Features: AZwV_QibC2chC7TZBBOVHoQUIbzEhLv_4naAqmxjVbpuz-HyTHRrI70hESPliJE
Message-ID: <CANiq72kV4cXh6HfL2C1i0TJxWjFAZ3dqo+agBXt-yw9HWxKybA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] rust: num: add `shr` and `shl` methods to `Bounded`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 2:29=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> +        // SAFETY: we shift the value right by `SHIFT`, reducing the num=
ber of bits needed to

  // SAFETY: We

> +        // SAFETY: we shift the value left by `SHIFT`, augmenting the nu=
mber of bits needed to

  // SAFETY: We

With the nits above:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
