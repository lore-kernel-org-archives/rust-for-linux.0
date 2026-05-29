Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F86A3624AA
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 16:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073123; cv=pass; b=YbqbwAmTnPB5JW3SslZzte8s+JeOJ2nu7+gYny8P8n++4Yy1gZVOPL+oaEyHGSZW3bZ/Kh2MR1QSC/VMShuGCL1CxMU61Ss4WXEtdzufEJP1vbCpMGMX8CrD7IR2JA5TgQ+fubV5D7AjJZYoyC0VcEYOhVMGHXyEYUhQVHOE3ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073123; c=relaxed/simple;
	bh=QCZOkqcwEr9LZyCCKBh8a9RlChOA57zOW/UhtnSAJoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCh/f3bQnTogQODjLGtqbQFXPZMD81JuBKLXEUwE3LyO6o7sE9hDhoc816sKUYDR/jrUtNpm0bP+jWKWttSBFFiktb+x+xKAIiZn5ZVXAWO5yPXxDOIL1d5koJkaXCKJTCtNnNUu24LDs4gstYdo1Bs1Rzy/NaoGQKZD2lDODjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlauHNj0; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlauHNj0"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304f9bc869aso37925eec.2
        for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 09:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780073122; cv=none;
        d=google.com; s=arc-20240605;
        b=icIUs0xoZ94XLGVYTnMj4v+o1mobKRXj2RQWW9D1/xlrxDA5R2nPNWGiNAnXK4eCdr
         lGa6khSjE4ce76MWove98hkp4ypYAPX8TFpcqlcfjxqPMkevopzT5nLdOAIMOEkkItGp
         tsh7/nAl0JNnRyDSWgjsswYlwmIxuJrjYfWbU5il60EHPYOYA+hOf5J1iQx1Fq1JtKL9
         uppOvJMwCbUb9tKDKRJ+Ga6046EmUJ0kFFIw19Abg+671seULBjFSWo1lpY/NKVlWe5+
         mj48B1PHlvKHpNeeNFj68zyTAjkraQSQFvGLKhLwhcQSDJSk0O0szMexuj4pbr6wW6bz
         WGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jUlJ3VcCq6+l4y78pcrfJDXSNKNSZtDLFvQc/c/d0Nc=;
        fh=olUhRVVO6rROOkY811wmZyj8LURehzhChYDwPqNVhzg=;
        b=NNWYmDWRcqR0J7WXLaJXsdabuYI9oZ95IGQjH95xc6hqwOOmCZsLJWBZ0iqKO2A9uh
         jC18qVivf5CcFEVy2Hf2tiilXMhY6HRswVrqqTkyP88gj4tV+yY7eh22MPUpsrkNhkix
         oRMmRVw1YuETpZdhczkG2v3vr0XE5rVU0ptwhc/i3F/sqwjGdqwerGFS1Jg1V2co9mOA
         yXezegpgVpAxnreY5MKCccpgvqQFOd7hExSrtChzowD4Rjygk+MIDSweCD+dBaXFGJXw
         d6KW38Mqkxmw+eOd/Uv3/y2zZ29223wtKiJPVfeskzu/YX32XG1fX5nldNoPF/gYgvmy
         KvNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780073122; x=1780677922; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUlJ3VcCq6+l4y78pcrfJDXSNKNSZtDLFvQc/c/d0Nc=;
        b=BlauHNj0mLco/XPgbXh1BZaM10PBthipV570T1bjZpFxqLYPERH3kV+b3bMlbAyyi1
         bDkmdW1krwfPGC3qdkQTlO9vqjTi7KoeVxwBriVV6PtD77CqqEpPp6Z36S9BCyOYHv9O
         k2JGY/OPHSvtcm8AAJIZjd4oeJ1+5Y1bSkEztiPeMcRSOTrpIBdqtiM6UEWbeMb46vTY
         q66ju7kjMFH0OdyS6f1yYYkIs2x0R+qp0z6n+u2/eBsxH+sJ506+z6VGda6ipndJoR3v
         6nh3HyajHyGlfyUeLnV1w5SHFBhF7ovbGDMWZO2SsAd3rmCLqahU97jQJCkSJ9WNgqvt
         GLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780073122; x=1780677922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jUlJ3VcCq6+l4y78pcrfJDXSNKNSZtDLFvQc/c/d0Nc=;
        b=dy1wwjaA5AwoTez21z8XnRhYCQLb8sBimR5glzv7JRTnUkzkdWACxA2+F0iGhKtudZ
         YBm0z9jLKJvwead/WeLv+Ee5w6Sxj8hO+RvWreGqUS89209Oxb9x5sdChzAmB4W4lJMH
         3GXVEwetYbFRQz2IcDcnNDoSf00YkzlWZpbaOa4Ggy6POSEW9W67Zhf3+OhhiXpp3NAn
         37zvKZbyOFptbwzxlT046KA8h/02CdSwQ8DSd92IldqeWJym+o/lMzdfUyoVDwgIkZAz
         pC8UTweKRyJtcDAVSJyuDuV+ySjw4GbWsXqRLihMnaNQcACFp45i6HfSZx8fFRux2N+Z
         kOXA==
X-Forwarded-Encrypted: i=1; AFNElJ9NmktbTaCjbPt4FpZVcmnw3xlC1MhttWr1y7jiAJ2ZygV/6bpyczZzGvzfH9wNcxsUgw7cTXcpTYThtHgsjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTv52vCrS50DrMIeCxZrR/s12uYn0myJHcBA1EtOevXC+Jqw7T
	SO+6tmBMsUBjYxQuFB3MKLh/toMRaVUb14A9UC7gLDTw5KwONBPfa6Sa+Xgh/3UFyIwvni6/p4M
	Voiw53H6HgRKpVpiDOe1Dn3gy8UDVH28=
X-Gm-Gg: Acq92OEq5bn2Z8ldGXHAe17GozrIQXMetMihOXl0oZrE4QasxazLlRD1Jh+zLWLpPnL
	8Lm1QcIdIBUUeWq+bN7c0KX+or+B00+E/nzyJO1VIYVgwk1C60T676fFXUuoZfypcJBnU8mw4Ac
	WvGpM9lZnclAlSKvlhLx9XBark3fpLmUEi7qTRP+yz4kZ6ufAcY9XobRaPezvbXMVjQzAqZ/MhT
	+Ved5qQ5pw1MtgRIldLbjxjSmGuwQnelR5sdRjYsdRBk0X5g42b3kgxvXeC8rPzBMqPc8YLAGdt
	kyBlp8qilkggqH6DDNWD6tL0Vx120kCVzfq8tAxn2uXyt67CvX1EmlZxkIBJUJOTkIqcMTNqP4v
	MWAvqKm0wnUW0S/+Qjcc9MbhacdsY2QVzaw==
X-Received: by 2002:a05:7300:ef83:b0:2f3:3835:2005 with SMTP id
 5a478bee46e88-304fa67adabmr129194eec.6.1780073121435; Fri, 29 May 2026
 09:45:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529153821.126823-1-laniel_francis@privacyrequired.com>
In-Reply-To: <20260529153821.126823-1-laniel_francis@privacyrequired.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 May 2026 18:45:06 +0200
X-Gm-Features: AVHnY4K39U7uwop-a1na9ijJOB-HC56J7AlF1na1rF9vrlLNm1Vm_81IYCkq-Zw
Message-ID: <CANiq72=DK_qr96K7V=akgHqm0z4msymJ+VRxY0f1uqmyDmbZkw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: pwm: use pin_init::zeroed() to initialize pwm_ops
To: Francis Laniel <laniel_francis@privacyrequired.com>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 5:48=E2=80=AFPM Francis Laniel
<laniel_francis@privacyrequired.com> wrote:
>
> Replace unsafe block containing core::mem::zeroed by calling
> pin_init::zeroed().
> This is safer, as this function is guarded by trait contrary to
> core::mem:zeroed().

It is definitely safer, but it is actually fully safe, i.e. it is a
safe `const fn` after all, which is great. I would say removing
`unsafe` code is the justification, even if of course the function is
able to be safe thanks to implementing the trait only for certain
types. (Also missing `:`).

I would suggest reusing Benno's commit message from the series he
links in the issue instead, e.g.

  https://lore.kernel.org/all/20250814093046.2071971-8-lossin@kernel.org/

> Link: https://github.com/Rust-for-Linux/linux/issues/1189

Please use Suggested-by like the issue mentions :)

Suggested-by: Benno Lossin <lossin@kernel.org>

Thanks!

Cheers,
Miguel
