Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE47323182D
	for <rust-for-linux@vger.kernel.org>; Tue,  5 May 2026 09:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777972649; cv=pass; b=l5N4zS8b4Ta73uEbAa+fakEds48qjs1/9MLJymrc2Nn/YNDpMrzZlgHk1+ENEXlrrCUFTnWPEtZEdF/5PppPnVv79pBAh7ZqNHUEepOur5WOzWZbmFwotteDF4qZWQJPXwrXD9UYQ/1+2P4yevdJ4ubOyg+BLFJfVumMKolo2bU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777972649; c=relaxed/simple;
	bh=vNJRuDFnIVp3WKzg6hVYmi2fIVlkfs4tTstlI4DYH3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eBe+DCgm4uuyWiX29IHDCHsCg3MXwgD8c1DyJ1tgFGs2bn4EoOobLsDjAhJHeF+4a4hW/SCYga2wRfDmQhmGFxI+RsWvNB1O93M4jxt4CAJrFqngkRRdyTz7+iTAVMCYy02NhyhZ3JusUmJ3/nfer2MmDJiS2D8eb5jEJ6pYLLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fh5cgRr3; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fh5cgRr3"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso7971667a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 05 May 2026 02:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777972646; cv=none;
        d=google.com; s=arc-20240605;
        b=kathPWBc9uNJDNA+Eqef0nN0ysPKJ1X8Y39/YZK7GpBohHIgRC/tjOra2MS0APZA5s
         RW2L0R1gpIeV6ZWt2jqdraU9GpB3j/2S/oNTHrvJuIepemOCZKaVnzxbIfenJjS1Jg1K
         TNtdUeXCmKdU7RBTAA+MNun8RQAmQ5SB35kT/wP/EsNP4zLy750hwWqLZJ/hcKIbFLdD
         5qjVcN6Ra7SaNxwTdH/HeCflf41eNIRMymNFb29hVNWYU/ixFtAG/AwSY6WtpQJwTQ74
         oqLe5Yaczj+xbfwZiLh6AjFdwg6Kr/osDJzZKZJhktZS7vHHoNJJx5H5XP7TBRjWupRN
         Z09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vNJRuDFnIVp3WKzg6hVYmi2fIVlkfs4tTstlI4DYH3U=;
        fh=3UqhAQdghCyAhwZDL42bxBTUdEfYA1cA+qQK5N1DWHU=;
        b=fWvvkcePuTlh4btJZ6PJh1s5+L3uanNnIA5p5CqZt5TazEqKHlhd+TO7734jggFsNR
         slPhaXx2hMyJf92TxNtp4PRlNkI3jq404tGRpAICAg5MOakPhWTgaj2SfBBgcbqdcnWl
         JU1WwsodD7YC3Zn1Jke7QkyQqu2L9Ey8rDZrfJidA7DekKEDTAOFuD2RItLMM4QpI+Rx
         kF4UvKg533p2SzmzDR0MT2sj7X/pbOE0ga8K6u4YJFmj9FDQvNX7Wqm3UUC5q950wSVl
         d8D3dCZc4035b7l+wyJ/FTwuIRCklHytUgLIB5wyBHf/AGM1eSR2hktMBKKd2F8/W6Bi
         NPaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777972646; x=1778577446; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vNJRuDFnIVp3WKzg6hVYmi2fIVlkfs4tTstlI4DYH3U=;
        b=fh5cgRr3ek8RH7LpbaRwFVZLca2g6vmGCEbVs7cwcE61XJZ9MbQUJIePQpC+Lw5AMl
         wRUmIfY9VF3MnocMsKnWHA5loLVB/IPKuJMroBG8YKrXuSseynaVgrn1Fr6tTyUFlSY0
         XOcbY8pt7YaK6TM0e93rJGETB0dWpDhe3FmB4ZEJ1M6oM1fvWQeShGOa6AZ57sLL9TCq
         AX1XHewibYKpfqDzRG4guzFKOEDX0IOtjsi5JNJdYSp7/UxMnPwAaIXUIZwGUBe2Uwyt
         gRJX/rCmG5YjVwWhfhn96JJGrwe0lU1MLsZPPMpWmxC2IycfFj6u6LbCuNazW3jrFlUN
         t81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777972646; x=1778577446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNJRuDFnIVp3WKzg6hVYmi2fIVlkfs4tTstlI4DYH3U=;
        b=NaSg7FtnwwSGxzWCWQNGFG5Xo/sryOEjJZP12Rt/1bKDMB9wt7HXv/Acv8C8MfCQO8
         7cgxgaSwKWQdLB6JtT/cTxGB/IRCRlNcz0WLBFR6w/r/w+1AlCbDNR+p5s/AJlwEpKbB
         cLHrJoZe0PfbjZO2ws17T8qrdv+XuaLfadSlW3yPkQxobpCdwVK/qXlmFaNpHKDAyW+R
         7xZwguzjvk4nXWRLW7g5ARfiiYVBLQ7YP+8QQy5VurO2Up9zc/K5+KA8ca2QuG6DHfsE
         LgEPH2nI0k2e/C9efCK8dWBIbaSwQ8doqjHArBpOumQGhZYoYijbXOo4O5Ra6NbX+FrL
         gdqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3wBSANhDxhFvWEMwYn70EkboE+n76XyEwe92pT5UKbWSASTUe4c+qxbm7nSokD/RICIVEfBMSHEy1biSXtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxInG32UE8YUdwjIJiDRYLNL6t3oA/BbHpW18czCskoTTmTJbpY
	zPNyX0akIIsh+J78RPcCC2Deaban+sLrGTw13lrB8fFCDpC2brkqJVkhl0/vSOer84giN+shBMJ
	QUWpO53HrhbzRBGMyOWyPB0Va2Ub9XoA=
X-Gm-Gg: AeBDievUKjjfHvbv3Jlf+BUJWtTs2/yOlXOfhtIBhil+9XNf7mOW1f1wkhFjpJ61xKL
	0O7EwvLLe2knSmSmHMmAOzDtSasVzch6/kq2J53Va5kPCxIy5wim+P5t/P6DUqhjhncUc7O9rnz
	qaJ7HD3SHi/jBY55UOO0tJ7rChYfMnO2Vf+m8iUtEOTwkjFcjpaHfPvP9b26B2XS9tPE/cuvZf1
	RYTbjSVjYJVgmspkaT6IsGIfbO0+fkwy0WECdENbyAGhiFaPvvN9R7zkGiNauZNJM8gTwxMYQJp
	ElZugZS0RIEjjiInuM4m7X/9FjjOhExHq9qBuQvdrJe+jzcgHE1YK10=
X-Received: by 2002:aa7:dacf:0:b0:676:988e:8eb6 with SMTP id
 4fb4d7f45d1cf-67c1acad6d9mr4341691a12.26.1777972646066; Tue, 05 May 2026
 02:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504045714.59248-1-albabhasan276@gmail.com> <DIA8GVDGR2IK.26SX1558D0KRP@kernel.org>
In-Reply-To: <DIA8GVDGR2IK.26SX1558D0KRP@kernel.org>
From: Albab Hasan <albabhasan276@gmail.com>
Date: Tue, 5 May 2026 15:17:13 +0600
X-Gm-Features: AVHnY4I0iOjtV1vLp1LIqh82vOMnyQiq4ASohSMasezY30b55EJQQqFti0Oi1UU
Message-ID: <CAM9eepXWixFhGrgjwUr2j8JHN17mpxMg7-kV-iJV4Dt41WZP=A@mail.gmail.com>
Subject: Re: [PATCH] rust: io: convert `PhysAddr` type alias to newtype
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for pointing it out. I'm extremely sorry. i always seem to miss
previously submitted patches.

I'll take on another issue and take a look at the other patch.

Thanks

On Tue, 5 May 2026 at 04:08, Danilo Krummrich <dakr@kernel.org> wrote:
>
> Hi Albab,
>
> On Mon May 4, 2026 at 6:57 AM CEST, Albab Hasan wrote:
> > Makes `PhysAddr` a newtype wrapper around `bindings::phys_addr_t`.
> > This restricts what operations are possible with physical address
> > values, helping prevent mistakes such as mixing them with other
> > integer quantities.
> >
> > Arithmetic operations are intentionally not provided; none of the
> > current users perform address arithmetic in Rust.
> >
> > Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> > Link: https://github.com/Rust-for-Linux/linux/issues/1204
> > Signed-off-by: Albab Hasan <albabhasan276@gmail.com>
>
> Thanks for the patch; a similar patch [1] has already been submitted slightly
> before this one.
>
> May I suggest picking up another issue and / or help reviewing the other patch
> in [1]?
>
> Thanks,
> Danilo
>
> [1] https://lore.kernel.org/driver-core/20260503103050.200526-1-x@2005.tr/
