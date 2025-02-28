Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83894276D3B
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 09:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740733989; cv=none; b=CugHv0xWAPZtK8TpUMn6+dh4gX3Pfi4Pef6zhPNkDKohWLBzbgkiXXVGB0g4b8H/c0TNehEwz2pAsiPMsgArPOxRZ6FK1HSV0jjw1ivUdM0VKAbtha1slvC1RD/MzoWGhHIoJeOUZUGVXS78bhxxVpemRNILLU0Mw370u3r1ZOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740733989; c=relaxed/simple;
	bh=pva24aYRpNiWC9FsBo0qUGxWRT3IvW1BGETO5F3BGfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DUxpTH/DQDZUGuJj2oYT0w3fC4U2cD6+LgCiTuNGHoa4gumzKfuxQ9QgkcvxTd5nMoEWZU6DUOJM1wWksN0qmaSlwxpiZf94m6zkQioPSGzDjyQ0UdpBJ1KGTNLeAru6HRseQEJ9jhR9EEhLwjlDCkvJVPdf42kTNC36BILVR+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bsp+D76t; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bsp+D76t"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f3ee8a119so935839f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 01:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740733986; x=1741338786; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UE/YvJUupiSsgGzonLP82Lza8kORn2Q/kCp8mnpZHQ=;
        b=bsp+D76tC2OYyU+/e73gGeMvLbuJPvjRrLx45vR+z2ramIqcKTmzpD5dXyfBXG9IFG
         I976dRPP454LPE50N1Ow7LI0jIAZSXH06dli85uXTRKawH+Hb8+vTKbylj3eb7DBOHCr
         U9N3caNtx5oXZqiJmkIoGEI5UWaUX16FyPyp2/XJoj6uBVvWBYr2mVj8Irqsh/a42LX6
         2ef+TBOHsD/7furnRw8VjVa1Kj2UEpXpfv0vhLLjryWCIQXvj7lATUdyN33MevelbPOm
         jf9n+ASdmfp0jmYG2MIsUDY9SLEqsLb/Rijr/33X7pVAEVKE9qQ0nJ190BX/TdsGX5hL
         vEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740733986; x=1741338786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UE/YvJUupiSsgGzonLP82Lza8kORn2Q/kCp8mnpZHQ=;
        b=HU38k+PZcN3MIF/o6Pj3sQnwnpPej7lyvZCkSFE7t2400UEXFtb3RTVA1TjXUdzsMa
         sUItfZHYUzZyhCtc4Zo18cInVQgdOOxOXDoltAmdw6AEn2wYarbPTizEE6WqOaOmC53E
         gQW/VWGfsll5okelcWBJGsp33dMR+SBycdsHHlSP60Erf1fjDET7vfVP7Yc8iItOiST5
         0E9JqMTR/gH4nnEffkGCiP+81iWjPNybzX7ah0iTtpGGHUDALAk/70tIETEm6Sd3/HEz
         crbftpB6dRKap8gXMtdOeoUTYA2V07lM3/iIHwbwqHZ7+30NqyJwCh6g3UF3NdnA2oAq
         MScA==
X-Forwarded-Encrypted: i=1; AJvYcCVwetNQnyIfwhP09lKBmVUQLQwmYkDN2z7UPgOmHKXkLyAV8TfJN3wCvQZZxWtMO8jF28JEkjbgrPmg46/2Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAwDY4YNZlexsdb6TLtNyUITZxKc6LOBqolBJ2d9H8aeC4lxlS
	m+PNSjcn37TysgfbCNHrwFo6Wmy1mkoXC4hYu7GrZm9u8EW3TTsw2+Qnrv9CroU1aj47HssMofT
	h4m4rWvvG3yGTOj0xoSMXVLNFm98MkeizrJbB
X-Gm-Gg: ASbGncuRvZ2rzXWJqL1wcRxuoFrc6JYs3XpCNP3WqGMeUP6SjPBSGGXkmns9QthUhpg
	tvWcSo2VXTtqTtbmnD+4mfEeDVkzYdVjqZwuhvlE5653gr8VHTfYYbASKOg2F4lv0GxEJReUrWV
	8+SKQvm11lpZBvyVPsFhskSdG7us172wKhisa9
X-Google-Smtp-Source: AGHT+IH7F2qgKkeGg7xN40q/xIl5BTHBoei2fR3UaAC9id06WaZp2+BesjSXAFeh/HXA6v5AlrrIvufjLCKcg3xjbbQ=
X-Received: by 2002:a5d:5c84:0:b0:38f:31b5:b33e with SMTP id
 ffacd0b85a97d-390eca07632mr1728466f8f.35.1740733985837; Fri, 28 Feb 2025
 01:13:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227101720.1811578-1-bqe@google.com> <20250227105130.wkklh2wpybz3kggl@vireshk-i7>
In-Reply-To: <20250227105130.wkklh2wpybz3kggl@vireshk-i7>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Feb 2025 10:12:53 +0100
X-Gm-Features: AQ5f1JqKV_1F7FuHCvDQQhhosn3DkKsdWc424rq9Od7JyKejVlawEpvwzVg8T8A
Message-ID: <CAH5fLgiP1=Kxi0L0WSOsdR3hXnNgoWs7368pM-STDcJbfrr8WA@mail.gmail.com>
Subject: Re: [PATCH] rust: add bindings and API for bitmap.h and bitops.h.
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Burak Emir <bqe@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 11:51=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
>
> On 27-02-25, 10:08, Burak Emir wrote:
> > Question for Yury: What would you like us to do for the MAINTAINERS
> > file? For now I just added the new files as F: entries.
>
> > diff --git a/MAINTAINERS b/MAINTAINERS
> >  BITMAP API [RUST]
>
> I would suggest adding this too.
>
> +  M:   Burak Emir <bqe@google.com> (bitmap)

If a new maintainer is needed, it should probably be me. Burak is
helping me out with some Binder changes, but I will be the owner of
the Binder code.

Alice
