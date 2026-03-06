Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AC8C2FF
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Mar 2026 12:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800610; cv=pass; b=IHiDx5V19+b9Lpug9hK+SjIOJw4dplbHnOTTPDpd4r+ic3U2Unrue+GhvOcIuT/kLKiX1Q6Iru4Cie0a7ie0zAgjqXGvRa2i+91OIjxWRt0rqiYJ0Il6tOsEStWeeMORgPy7KNPHZTlZz1+qDGXpBPGGdfXBTmQ08J7drLvCBdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800610; c=relaxed/simple;
	bh=HQEassPVGYM1jCdRfpSudNR1v3HtLxgtQuAEtQArpTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+r3S+OkAaLfbrDpMFws5pSeIeKLqjcz34M2ux9ulhAmaOFCtlsmqwPUoGa+2UtCaI7QJa1AVYHFa6+ab2ttD0ccB4f/4AEhroTMvlfMOjExQ1spllQswePmi9wj38f+TkaJtEQx2Vaa69Hz98XOX7rcB3+ZY46fWiN0cOxgS08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4tAOYqz; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4tAOYqz"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2bd801b4078so785111eec.2
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Mar 2026 04:36:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772800609; cv=none;
        d=google.com; s=arc-20240605;
        b=ECMqkfrb3pSYr61eCH85j3JAkoa/apoP6qV6lyMB8hXpwRWt4WinaczxdpoHq5bWFT
         Qqvlazfm+4gdgwCrSZVNM+YJmvlImSGEKmo2lGKAR7KDaat6C2EXUQiYJNivICKrLueT
         xEdI2xqoI8Bb4BD0le5P2yhyWcxN7xF4Ii5YVUq6ikyMB5CAqkOA9u1SEf/GX1Pkfpz8
         iUvUYiVMqZO+apAEd8tSQI/eyBOFw/DxtbUM0PIFFnnT3zpBfuMnaJLHe29bil8dDahM
         9L/4ELxL0EZkmEsSOGFW7W7UOsiR+e1cxOM8ZXHE2f3Jol9d2OHe2xVbX5E+T3Zxa+0C
         3GjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=knqD/zlQpWPkzS9PyTnnmuqyEYSvWpR1vlkN+XG+Guk=;
        fh=KfkJ/JdON+3VloTW+FZSq95Fk4dNCNQhASsSCq9ackA=;
        b=cf9zWr0vaPFaqrGa12zWYdnCJkQSiDbIAIa1yvTv8JDM18io3PSW/aMFy9VnwF2Rl1
         NAqTsDwDiq4uMx0w/1Sh8SfLXRxbnNNDjEFHwqk8TsaAMd7DbujYkdF6jdeQnJD4dKGX
         U421815IlhUdDG3N3674smX8e3PVPVBAzoocyFHzZ/Dur3PtDcpx03az8TKxnJ/mrDCq
         yY3B5WbA8WBbVb7Z1/70QP1i9iMXionT7sZKUu7tjjc5cfqQMt7wCQHCitESHMv7WGj2
         tQ6ai5+E28/oLts7+bG7WFCR4B+26aqm6iO6e2dvuDxcfmfBfhKWTmqIhBt4pRWUvG7K
         VNpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772800609; x=1773405409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knqD/zlQpWPkzS9PyTnnmuqyEYSvWpR1vlkN+XG+Guk=;
        b=G4tAOYqzk9YUVw/CNcm5RnyA+RxL249pNcgMEcfMb/KCL1m9DqyQw0jZpaiJHZl/wB
         258u8SW4s8ZFOdhTmi3v+9W4qSnpFsRWjFvJPPYmNwvS0mWkF6veKm5cahWolh2hYAc2
         qyPUBHTUtfBxXMit2RZOk85GVDaCVkIVv2S6KIgPjlCUDOaKhrLyYXtVE9qlCDefrp5Y
         meWm21cr0Vm2OMgyMnb/G0a1eC4j8Fizosw/H8GgcALkp13cVFiLmzUmICupB6iACe6D
         tOosPmJgVWufTypW/PPHzzLTZeMSZN41yXcO8aSGDJdYFpD68WgHfwTPi1ZQplM+RqK4
         TWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772800609; x=1773405409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=knqD/zlQpWPkzS9PyTnnmuqyEYSvWpR1vlkN+XG+Guk=;
        b=r9M8gxhct8qxDuwMsTxZYK34XYYIe9PLdw87Hj76RxL46iKUSZV68dzBjatltUZxAS
         iVCauzDqfn3HyWNg+PLdqUmqLrFtCdUq2bSDckRx4jaXW7AcMiGjWzcmeiQf55q961A9
         i4lNZy1vzf92mrrIBNMwjYiAINK1yznl0Lh5kSwkYxJpUW9kJ9JTooSUnG6AO0tEysaV
         6ttLUlEJXwr+GoEd2sxmDA72Q+TgLmBHtEUk0diJlprfZMtIXdd8C0fPBIHC2CL2FmI5
         qTTt16t9Gq0yy8OfUDmUf4bJlw7F1sPFbkjQnv4aGVE3XTbh7Eq8HvH/v8GR9dUjd5wX
         DKZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsIq+PvlujjVqX/m3VwGI/aaY2zQPq83noDWfQ1CTxseoIhV3ab812axpvat2zYyebd9R4Zx3xn4C6DKEOgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZQyabmrSZ7TMteQlPwkq+5MawpFBEOjwQwn4yv3QAH5AZzhV+
	UNf7RLvmxk7hE5pkRcYbDpj/RQao3k9zT2YRVwUjBrT+7tWO64lH7yqe3ZRAIW86b+W0/Xy+GUg
	Fi/K8c3bC4ddSqwgeGs3qeE86Y09EOco=
X-Gm-Gg: ATEYQzzzE2B3lUZXxW2Q/qgkOQTFvRaiJYyUwNr4IDQzuIkmLvM3h/lJSkMGgtarbjA
	0dH+I9hMvS52spRAkhR1QxIf/f1UA9lemHe/8JwjR02KaD8ynX/wgqiy9gcGYnGnlrRjauQFwrc
	F8775dlty9n4fXNRsRy9BrtXb40f9Be1Hs9mH2yw2IPuAdkmSRE11UKXlk3G70+mlipxSOTQdwu
	t1nETYye93yqdnKpRmLWAa9mNpdNpJwTdKv11sp7xgnd2a+8yLj/2xFB+rL5kGPHonzaPSmOZtw
	VItJ9SkZpPn5kUNFNmuiUP5vcRSMw9Ev2LflPrnL/vXvHiuDAdHfTzYewIG3bhW+f+ccpMlw3KE
	DyTbpCIMLY1IoXuiFAuOOw6Wv
X-Received: by 2002:a05:7300:148e:b0:2be:2912:ff65 with SMTP id
 5a478bee46e88-2be4e055899mr438556eec.3.1772800608643; Fri, 06 Mar 2026
 04:36:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304195330.185829-1-jhubbard@nvidia.com> <DGU9O3HEY7CN.3OBR26YV3AHGT@garyguo.net>
 <ea3d6134-22ce-4715-be75-e6d41568c7eb@nvidia.com> <DGUA5GY2DGYN.3PG0FKLG7GFN1@garyguo.net>
 <DGUAE329P4FH.3QPNCVLNA99MC@garyguo.net> <0c4ae9ef-b803-4ead-a2c3-d5dc37592d5e@nvidia.com>
 <DGUUMXMLYH02.2ZIPQEXAJYTEG@garyguo.net>
In-Reply-To: <DGUUMXMLYH02.2ZIPQEXAJYTEG@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Mar 2026 13:36:36 +0100
X-Gm-Features: AaiRm52ifH2FYBZ84a06nnd-7ZSPspJMkRBn-0RHo0yD6BLwqFwbKKjW_sSOGls
Message-ID: <CANiq72mWdFU11GcCZRchzhy0Gi1QZShvZtyRkHV2O+WA2uTdVQ@mail.gmail.com>
Subject: Re: [PATCH] rust: cpufreq: fix clippy::double_parens warning in
 Policy doctest
To: Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 1:32=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I think we should either disable with
>
>     #[allow(clippy::double_parens, reason =3D "false positive before 1.92=
")]
>     fn update_policy(policy: &mut Policy) {
>
> or disable it globally for all Rust code before 1.92.
>
> Miguel, which one do you think is better?

Hmm... Disabling globally for all versions could also be an option --
not having this lint doesn't sound like a big deal, I think.

I guess it depends on how prevalent it is, i.e. how much we expect to
hit it for the 1.5 years or so (since we will eventually bump above it
anyway).

Or do you think the lint is very valuable?

Doing it globally for certain versions (i.e. `rust_common_flags`, not
just `KBUILD_RUSTFLAGS`) requires a bit of reorganization, so for
simplicity here in this series I would suggest a local `allow`, and
then we can see later on how prevalent it is to decide whether to do
it locally (whether per version or not).

I hope that helps.

Cheers,
Miguel
