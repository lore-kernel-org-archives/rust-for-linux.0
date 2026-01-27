Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEAB35CB76
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530596; cv=pass; b=g8TkPn94Odpn7A32wP8GcSPUdCsQXsWSpYkLHbDtEsIkcL4KVBsN+SDwr/+NYiepmRJ5/Ld//JmH/PbFtHCMEMcbO22Dx5PzNFQbona7Xq1jkL0rcg2/6+liwK3mIunckSa2e25iXTkuiELEgr0WCmxkZymwev0X2cHc5kCgN1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530596; c=relaxed/simple;
	bh=aLECeGHvb/kzZnkA2H6Ej9ucGaNpds/MHozGNmB8154=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XjnJrGdhzUJdDLeIJnEGX9G3KiNkq5bs1lcmWiEpKAWnXmFecl+aulsz0ZVBCKJ+k8SIWJQnAqNrRki/5IngQY5rrXwghlRDqZ2JVV/GnMvz5cNyrN9jCoyIPAlOah0uJCLcLhxxZO68wEofTSloEH1WqqAPyi5WFZAAwkL6Ls8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2v7QqXA; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2v7QqXA"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-385b9be0759so50539981fa.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 08:16:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769530593; cv=none;
        d=google.com; s=arc-20240605;
        b=RT1eH89uPpRGSWf9B6JtT0KGbNlloW6cY6Kh65f70XDNNr2erDCk5hhLNqbQoKfsRg
         6cF7j3AibGEl4rVVBt5CiJkfK4YenYd8/ciP4gAxVbhSbp3Pvjvrh35ayDjecYU+uZvd
         0fut0adAyXMqWbBbbvPjDtlr3NNH1mzJDsE/+MQdu9tH4irrJUBEVy64H/vIVWRlX7+W
         garLgJrCStTLP4WFP5v+nqfFLYdPy4p+RSGMG3y8kyvtszxScEzUHYsZ0IFYEjB0BDQ0
         u/alpUaQFySmQyCwYyS84NEUlZMrVrno9jm8pqmeJMMKt/7UXlG5d1OCnKtnmMNrfwqd
         WCoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aLECeGHvb/kzZnkA2H6Ej9ucGaNpds/MHozGNmB8154=;
        fh=o5zdNrfey/HFd5uNcF7VuQzKzKgmWTWxKsxEE+t33Bw=;
        b=fdGizkRrq2QVx7WPa136Avi8dbQraLJIwwWQW/o4n91r9PikBvhYvIuCAqQ3UPgWZs
         H3X/wc80Rk3VWJeZjflYR+kHLvbnK2ECV6ZEx7t3J6flPhCpP0zhSO0ALcOfFbfurtj4
         JewS49rCqQIw74oxJuuO1YQOBCqZalAGKLSUEVzSOYHk1Lem9jEmSMVrbJ/JtUOh1Lct
         D42ZAjgGev3/vYLOX3qw9i8KxILAGx4/06aaaCWwWUrRzjKvKGIcVUw5fDMmEwnWIlRO
         ZyS57CsUSS+deTbUHt1WY/a+zTLkUu3AKLQH7FDxauuFRSujCSdenWWh9xbWyKQYM5nI
         rbpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769530593; x=1770135393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLECeGHvb/kzZnkA2H6Ej9ucGaNpds/MHozGNmB8154=;
        b=K2v7QqXAB+oZsRnfDsJP0eI4E5ny6xbdW4SPQNM5dLYILJllHXVqFNHTf4ibWUZiLk
         AQzCtXXo4p43ktK32IGk6Nl48oh73ltu1JqdeR0cE07qiGxhf/RU2DuceiBydKZtMvhf
         Yy0YDkvTOYGW8TM+58DtZk71f/VKAJCOBgz2MRrDn7cKMs8TUCpU4DTieZX5GwZxlZS9
         GYjdW8u27igT2Cmr6mRyOeLW9sEgS/OtG4Lo2IBX46XIQMpcR8QhyJht+n1RbAMX8blz
         xw8wOQtfz1jMFD96LRFcAInrkivK6B4HxFWxvMBVAZjAHpdWLCsu5D8dKDV0YLMlF2Mw
         GcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769530593; x=1770135393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aLECeGHvb/kzZnkA2H6Ej9ucGaNpds/MHozGNmB8154=;
        b=Dc8ZiHVVkAMENFmJNwrsh0o96OioO8mwQKpX1G9W1zehWIwlUpj4j9BWdPceRSxgby
         i/8hDTzFTylEK0upKAlwrR2Nm344vpeOO5GQhv2zYcT2JAivyK2lyc/ooS4Xs7JwPA4+
         D4gNhJtZV1g5xWGf9bVbLk/ZcF/I1a4dozIdOU0uCfGk1hXqLGo+RZdUF8CqifG9SLVW
         Fwn6cwnZrOkbDKQJhcWGkL3VyazP/kW4ikcZlFmsNMC838MtXRLpDB3c4a2b8gc02Pwl
         HMC9ARoAb8dGBNPRktcEIsWF2ksLlFfeC7M4KfRwIYaYTacGZ3spXpRLcoTc9sJwkbwl
         D+eA==
X-Forwarded-Encrypted: i=1; AJvYcCXrtldzjQgTMxXnP/qLS5Btcf3f339SK2O+vfO9gd0d17JZb+DCdD9dkNVPQqvNQOU8dsF+GYlgciijf06EuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxX1B+r6J9yV23ks9mI41X4sYe8hQ3KRpQr8lI2TY0pJOEOK6vD
	MXGd8uHTuUGwXlUmrZsyM45BgtbpCL7BUh0PpnFDoNh5S0/vqctOTXrrgz0zDUlMtOWJSaHoDyH
	lpizPw/LzMo2RRrbaid7u/XaygQrdW8U=
X-Gm-Gg: AZuq6aIKh7eWv1VdU0ROKO9tWcjMtQBAepyTDeW4o+zGI7ZDbP5v5oAn6+FyVU/EvDO
	qpmagTe8Wh6tGIL9xAl8YkhAO1iEwoYq2vwz+3/hIJxqfanbn86g4k7ecAliu7z4W2NGneVYOkW
	zbnmsVb+UfqniA5vCInMQLB3rRf0vjS67bSdE4h1xwKEU9moV6ZiUXSMY7S7uut2Uj0HDmAnToX
	uYxXU8fnM2aX75fYt01HodiREOCpdDb+nq9azv7tPDcNlfdziaJZhNGxQpudairmIREVCZyt6c4
	mL3nhmUq/MVtxrIDkeqkgjHL8m+/uq2GiBNB44q48zzRgEgLNQQ03QdhSyvaosQ4dHaKRujHA5j
	8Oe5+nw==
X-Received: by 2002:a2e:be9d:0:b0:37b:a664:acde with SMTP id
 38308e7fff4ca-3861c9e6cf2mr12292251fa.32.1769530592979; Tue, 27 Jan 2026
 08:16:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
 <CAJ-ks9mjBY7x1s_4wqMC8xqWsX2+aCM6NHn0j7yh_+daKiyS1Q@mail.gmail.com>
 <CAJ-ks9kn=0Sm2_1WV4xyzunzcGG1VZDKy8L=_SCCWyV2OkJTDA@mail.gmail.com>
 <CANiq72krt9De1+WgMh0y8XX5K9RrU-_1FuSp+sKO1Ya8EaVoUg@mail.gmail.com>
 <CAJ-ks9m-0C=hOdYC_z9mNH54fXjnaWpYgZSPaWoJC8rnQ4Kgkw@mail.gmail.com> <CANiq72m0TCPTEn=HkMg19Et7JFeRc-fqP+MxP1gaDosSF42iww@mail.gmail.com>
In-Reply-To: <CANiq72m0TCPTEn=HkMg19Et7JFeRc-fqP+MxP1gaDosSF42iww@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 27 Jan 2026 11:15:56 -0500
X-Gm-Features: AZwV_QjkJfUNNVNZl-mxPXC6CrfK9BzaT2kQwlk_AQVc_ZUxCIBEA3TeQf56sIk
Message-ID: <CAJ-ks9nimp4WEOOQcMEK1JULgqrM1hugO5s=PxsP54n-nShCWQ@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: replace `kernel::c_str!` with C-Strings
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 9:27=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jan 27, 2026 at 3:14=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > Another ping here, folks! Miguel, what can we do if we do not hear
> > from the clk maintainers?
>
> Stephen already Acked-by this one, right?
>
> So I assume they were OK with me taking it -- I will do that unless
> someone shouts.

Great, thanks!
