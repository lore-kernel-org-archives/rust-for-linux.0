Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2373A321445
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 13:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758030498; cv=none; b=d8XQ+5qgavBeszrzeqNKAJfWT3/T12tnPQOWVDqpLTZMj+mSdglyJUevY3lLj9bhOxIYcvKgJy9EzP+97fVD8wVL+5bpQ83r7EAe0G5bwK1GioYWHfiiO7Uu6WFXmX/aT7jPHAo2KeTMG9mkK+p12WCfS4LFVFrsxM97hf8UwI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758030498; c=relaxed/simple;
	bh=8YBiX6qZT94GAoJ58JfjtvK+Xo1zg+9TGgfZuFP0Hzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUZ2SHMLCm+IFwO0q7eBRPusDqUUVur3niuJxj2glhdR/WbCYRrdCGiupjuaY78PED2b+KdLLdZCouTOB5wFu4nvFSgPA74OB4usg/UnRfZ70U6y09Fj58fMJa4q8kqhBCqo8ReCni9Ya+CJgfOc/trmsPTgULb7VUspGlnvjKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTFohbEX; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTFohbEX"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-25e19a86382so8087555ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 06:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758030495; x=1758635295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YBiX6qZT94GAoJ58JfjtvK+Xo1zg+9TGgfZuFP0Hzk=;
        b=RTFohbEXeFwCbmPc1PJCA2iq+Yt+pYPI4APwV/zOmcVbqEFnE64ybx0RdT3BJ3ZfaL
         ShbdgwT2G7gKEGf/NJO7HUnqYFeUilo6X6Bn55ZgRrH99guiJvSb5FnbydMA+MSwa771
         WJJBGD1pQ6GrALsmBwIOV9Kq1dCu1sWRBWqkHE0H1t9lY8WPTOSfpr3tUQ+pXbAAVcQg
         F4sH6tAK/a7wMZtbN97+1uo7G2YZnl3xYt+OXPj9QSiAU52dvPUvLEnJ1MNU7f3GPjZy
         Xwa/e/zIRkeQQV/IdlnbQz8nreM+lzk+D6bbl20jJKjLjN+t7BHRYvLRmFxLlfNe/Odc
         mTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758030495; x=1758635295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8YBiX6qZT94GAoJ58JfjtvK+Xo1zg+9TGgfZuFP0Hzk=;
        b=w9bjccT6C4t4brez9myZLIU5VgwqEmNPh/ZkAwcPeGMniRwlOkEITYIEb/B5ZSqYPf
         b5V7yEZBy/iBcHA1tkwbmbgH7YPTVv/F/xYdcf2FKFeS5KPBHoHaQQ9e/be8mozTNreN
         ZlyY6zrC5mAgt1dFgKK7/s/z4p+hTwX8SvUXHNC/4V90KYfZx5tPUAjHyTIw6DV293rB
         shnZVrFigPDqTC+8AqsUoaUdM/8dWRRbW8qjegJOORXeK4qG0IaxZJN1zkABZq0nqSnm
         P3egyG6wRp9WfpkFaOe1nnC4hivn66qX/WS2ZJwvUTpqoAoVOV5n1bbwfPjgr4aDkqbE
         UoIw==
X-Forwarded-Encrypted: i=1; AJvYcCVXxwvPx0pTar0HBBAMtulQSFN+4f3x145xHe0rucfnQKsLL9c2sUTSbOMrDVaUE/2JX4VOp2DT23gAsT5vQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx172rqxnNv1bag04eYQMFoZyCc7+2xzPxcfzlBKotH0owu9IO3
	OZE4nxZQeHFIBkutvPImbbIN9LRGwOMhH8XfahLgkFFsq9AN59Z+bcQbQ1TJ8bdep8FTDkIsBvY
	0nqVDH9viqYftRxwZkTENBVW2vg+DdO4=
X-Gm-Gg: ASbGncsiW7X4cf2FJzBf6hiaWItfbTR1XNmKwaF30NxL2lnOH0EsZz6dErrHTqQofM5
	vbkD1Yqym3nS5ArpVPKUtASf4YIXAOJRpGTibI+4XOtk76QORlYvK2rS5o4NasyWxBRJxYaEROQ
	xL8Olbp2JmPIayRMdlpGRBKGHHcNZayq4LFMuQX555x71r8uY8iHntrrTUYGS5d059ZQ+zQyWs9
	9OFlTMAs1sVqthcZR60bD3pElIpfJlDMcNUjs/GLqhZxvX3A/J833jHwPfn+LpQ+QxKpR+WnEnt
	B+Yf491F5IWfQlUOQRmy3QC9Cg==
X-Google-Smtp-Source: AGHT+IGO9s5xz1ht5uvXvIdjFVKc5trVhN4ayDX0mM2ztNeH5kLvtidm6RfnB74mU+zVg28z139biv4ayC8ZNwQ1x1s=
X-Received: by 2002:a17:903:708:b0:267:8b4f:df1f with SMTP id
 d9443c01a7336-2678b4fe1d2mr26976905ad.1.1758030495299; Tue, 16 Sep 2025
 06:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916130103.22946-1-jaimefine6@gmail.com> <2025091621-atrocious-unaired-0b9a@gregkh>
 <CAL-mriJVF_rWw1QW-KkS0R8-hLEXFwDd7xXm083wT+VoNhF8Zg@mail.gmail.com>
In-Reply-To: <CAL-mriJVF_rWw1QW-KkS0R8-hLEXFwDd7xXm083wT+VoNhF8Zg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Sep 2025 15:48:00 +0200
X-Gm-Features: AS18NWBe7LtBtkJoCnNMfZmQJuBJbXiRfm9ZvZHAowjsGtImVWTTsqwroqRcHE0
Message-ID: <CANiq72krCuQS6V6sTacRnxGonRaixbWt6MZxFCkhAnumCtHR1w@mail.gmail.com>
Subject: Re: [PATCH v2] rust: auxiliary: fix "initialialized" typo
To: Jaime Fine <jaimefine6@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, onur-ozkan <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 3:26=E2=80=AFPM Jaime Fine <jaimefine6@gmail.com> w=
rote:
>
> Got it =E2=80=94 I realize now that my earlier attempts (including the on=
es that failed due to formatting) probably all showed up in your inbox, so =
it looked like many more versions than I intended.

Yeah, every message goes into a lot of people -- we have almost 600
people in the rust-for-linux mailing list :)

Cheers,
Miguel
