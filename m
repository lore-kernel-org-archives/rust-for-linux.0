Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070D03659E8
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165846; cv=pass; b=PAbT1f217z75S5zeSAaASrg6Cpgj56BsRN+xrvntwjAICK7/WTerNqMcDflG3i1kgdvFwyqRF5C2k32Jutye/sD2qqambpSAyR0bBhA4GCpZMzX8NhYYwtnukENKPnOn2NoB+DBuIjafP9oCy3zYcDp4NaEdI7M9gVDEeS8CMP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165846; c=relaxed/simple;
	bh=Cvv6T+PSDsw3FsAVYfk+LB2CVlJHZuJy35oM2Ume5jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qMmETuE9KlgeLjjfFF1pE5lE9QwB13fkML5bTTG6YHLbATHF+DOyUpvthh0SzzkHcqKl5sd7XBPlWI1HloSiX0lqm3xPh99TSkvldMWw36RwnE2etugNpxM1Rd49kOp+bPAG88TFwdLAQHGMEsp9sMwlXp3dDEUHNAwuvznVtWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pqEW4Wbv; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqEW4Wbv"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-304da3b4508so806350eec.2
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 01:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781165844; cv=none;
        d=google.com; s=arc-20240605;
        b=fWpmO3pEpv0OdbToHkhwDHKCSyuhTOvlv9otSMlFfhXQBWfWpJdY5m/W3q0B9wS5RJ
         FLqAzmoWpCz7Wg/rU2A01AO5iiyfqbtFRhO5RzGYz6lALWdlj1zAFnEEZcvTm3EVzbf0
         SXv5MHK1LqWUs1hl06yctaS548UEO0BwYhAL9PacI9Y3cJgtjBIOl9JbgIxEiAcLVYeD
         tNeRpMekZ6Au3/E+Slj8RYXF4vxNnMRKF713Ff5olgaFYCmMKt1BzTPp/mLieYTEKcAC
         36XIoScwm2bAYBGNJUmDvhhEg/9X4nExap02cMr44Dvru1W7nU3fbUFQ8f5OtMxkcugh
         wynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cvv6T+PSDsw3FsAVYfk+LB2CVlJHZuJy35oM2Ume5jg=;
        fh=e0IOeyRhbnFw7dFh84bw0mBi5E93cIJSJjejeXOoNUs=;
        b=aghtKZdSGtIpMFsnTYeUjV4SAoVHgY7NKX0lQnGIj299EhsPDi4/+K698Fxqu4SfwE
         1i3O8775Wfb+iFL9KdDKZ0s0jVxqhtRLQVRTJyKWE2/y64W26cyKAcHzV70rwcngmxb0
         LWE7C2PuBG+LXTqcb1eulFcYGXYTU3I2zRsGqEHhIyovdHQuKyegGgnNf1MkoZd85Oj+
         PL9V86uXgtGly1GNLJUG58aRYyIuJi0PtVbbDJjQ41rRkyOCh+sFEhdw5rZ2w0wBytDd
         6liNPXIu1kzJfnYSrlRKiOst1/9H6pnDDBHt6q5na2xe6Kd6AB8cphckaKM5A82uyZFd
         qWnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781165844; x=1781770644; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cvv6T+PSDsw3FsAVYfk+LB2CVlJHZuJy35oM2Ume5jg=;
        b=pqEW4WbvfSQTHQHEORK1RkVOAWlEHppgH2Eyol6RaJctXRz71HTIidBbdtPTtHzsk5
         U6og4cG8xJoygm2aQ0dwN6W2D1T74aaT2kgP76uNJWX3ST+g8Bub8uQfzOL26ipRx5I2
         /BkIXCtPkbfCKzI8oGLh1U7MeKyTSMZnWm9x5Ke4NRjL0oVTaKr9UaZHFWGImETeVBB6
         t7Zv2IpVshB5O7HGs2nAVAr2oysVjkihQpxnlsd3p6OMbMjL+/0jsb1+x85rPq+vlK8e
         87UpUaL4jaqdhO0lWgK1qODBmwlGZGfY9IWYRcxDnlyjaTi30m0gBOFB1mQ9J6eZZb1f
         nRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165844; x=1781770644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cvv6T+PSDsw3FsAVYfk+LB2CVlJHZuJy35oM2Ume5jg=;
        b=SMq5pm/k6fER4bpDFZJfQ5qHaAXW1PemIF5gNbZg25xklwj50S21xqBoxc6wfXBxhX
         WV7vmoT8/taEgVfQBroNFT3hsYZ40dUMkwIcCViSDLT4vBVM2gNk8D0tw+VWoIVhiUSA
         74Y3D276MTxH2eVMC/f+7z3QpTvvNwqoZEnhqjwGSuNUNi7lfC5E3CiBBWzsIte39u3Y
         ErKe3ivQ24vS2p1/XR1mIUdRjGy3joFqEO718nw+PO+7NeBja5EYdWtLuD7li7JT9cZy
         03ZM9KUQirkj+W2vqRoH5ClcSTSrrafXG8wJUZ6/BfADl7P/pc6RCHsZRAjoooY3PUmt
         WbPA==
X-Forwarded-Encrypted: i=1; AFNElJ+kzZXk/5dpOwiem5YMDkVMMOhuANlbtwohHNn0bQag+GHvp9JtvFJ/sj68U8jtz8T2+M0rkTvPfIGv+pdsBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYSCKTXjFsxuaZCJOaTyzhCxM1ozMpwspqDS4kBUeW3NvnRFct
	yOzSlWNFqEOEyqZdR+lu1LSle/Z122hPRs7WbPYImAsC91kCIex2ZmdJ64uThGrq7QIfS2sftme
	W3JgoE8X6pEyHliC/5YLOpGJ5KVBg79I=
X-Gm-Gg: Acq92OGa+j/gCn/2DdjqVaeMFX9aDot6eNWtPioE94Qwek67JcaQVbn65K4yNReZsvv
	J1046Uzn5UYll9nFPlTgqEYl1mWmUg31/Ghpq0B6aOFAtruCAgUWWjTwfK+FSm5JbKcAHZdAPhh
	Gx5888wS50Yxl4elBHEymqJjzLuQFYjHjrm3Fzv9OwAtMzDYrcqUsGIELL0mKKS9Kq5eRky/aBS
	3ycPGuqW3QzQnHsblfseRqM6853m0fxeZCa6pg70PcoBrFjnXxXVF2DtaP6k/HxbW/0TjbziHy9
	KSKhEBJ9i1OJbkbsxbpMBLC7DXYkiocbyf7BEy7UgOty5KKnEGQYX9mYRiPHg2y6z+DctF51UK9
	hmHnIhCx1qFZUWrNE60iCSYb/hwiowKMBEw==
X-Received: by 2002:a05:7301:6007:b0:2d4:62f0:b2e1 with SMTP id
 5a478bee46e88-308041354b8mr709668eec.0.1781165843909; Thu, 11 Jun 2026
 01:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610143025.368801-1-ojeda@kernel.org>
In-Reply-To: <20260610143025.368801-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 11 Jun 2026 10:17:09 +0200
X-Gm-Features: AVVi8CckU7oKsjkrQUwzhrbYa5b-hlcYlSkc2w89eUYI7Wr-Vc594KP0gJP1avQ
Message-ID: <CANiq72kTt5jrbpWUiUFu5oUJ9dzmOOCZUy4Eo0Jg0y=7toi-Gw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: clean `zerocopy-derive` in `mrproper`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 4:30=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Just like for the other two Rust proc macros, remove the artifacts in
> `mrproper`.
>
> This should have been part of commit 506054980429 ("rust: zerocopy-derive=
:
> enable support in kbuild").
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied early to `rust-next` -- thanks!

Cheers,
Miguel
