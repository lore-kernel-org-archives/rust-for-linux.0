Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7A43168EC
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 10:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767609605; cv=none; b=dnm9CMNbHQ8DnxdHnLPNBUEWeKjten4XDDtEvC+B3QIthvf8pc+Aw7nqzFemQfPO6kFTGxsO89QmXnTWVftHaItCLOzQUsrqOH7Wem4pF3OD4/0I63sUYappC8ZDGJtahW4BWz4t4pmWDdRbGKCH0Y3vkmv9yd3VCRuWmd3bfu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767609605; c=relaxed/simple;
	bh=ilQVyanHgKsLWkZPGkjqH6wvmpNb1DelmMugaEdB5jM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPOPfccDctvIybNlM1nO0XCQZfcwh1uKBVHn5YIwvTe0OhznYJ7bj9/UHJ9vz2n4qaP6wX/kc6KLAvSYysWuxlLpy48lO3ZwLOEDrcXbYeTqT1s4UzFpNW4kY9/C73ObPTnhXGRJ+l3PgG0zAl5oeC6SXVG8w0J3EsRw3A84ekI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPBahxkD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPBahxkD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0abca9769so24423095ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 02:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767609602; x=1768214402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilQVyanHgKsLWkZPGkjqH6wvmpNb1DelmMugaEdB5jM=;
        b=TPBahxkDEzxpIldCY4B48Wn0U0NjzwIRbzpxV8VdgtEolAf7SDrhIa1TmNAYW6ytEL
         MdFu0LTgkLyGgbi9UQIBVVUlnV/QfSD3GICWA6Hkpa8AjmWhr71O2TwGAQv2eDhDebYd
         p4iITY36D8esuBSU02dRVLHpvlWikGcDejkfpANOUxejXnfB/V2oDJfYG2gUOP28/0ZU
         9YhmIRHHsi0oW64Q958RraaJxBx8v1ufnPCHwaMWExcDEnZ+6KDCNggCFzma5s4abq5y
         2+mRBT1JLftMEa6C/V1oLDRgIwMOVNlIh+2J7DcMKlW7AdJbnC5KghBWwo6fBJ4a9mkh
         a+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767609602; x=1768214402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ilQVyanHgKsLWkZPGkjqH6wvmpNb1DelmMugaEdB5jM=;
        b=Ka+LoMp1bkxklmn52RRNB30OdAJqV8R3pGf4VcCqo5jDuMO5gV4stH+9ZyF6MPiQIO
         7PrcjbszM295hPB/pOU7bDYU0Sst7nn2FCUhn2tCvzPD8Yk2bAQZIx3ybzK4mLD67ae4
         wJprlqfjMb2Nz83snl6DaiUj1Q+dMkkiSdtC1o/uQwycFp8YQnKX8g/rUFrIleZi+5k0
         FCTNPqMeAqbVU84vf6eYjiv9/T+10UOhFlHH3IRE3rRQlri6Xeh9s7MdN8Rt1yOI4XUa
         s24/xsWIUPjTH0S6f+nqprdrJyfWxvf/7YfNcGDhNh2nwFlxUmFfz2ShrJHqat4HLm28
         dVRw==
X-Forwarded-Encrypted: i=1; AJvYcCVI+amALZzogWWjigo5g5Sly3s/xfp5pY2MbDhaWNM7EjV2wMDZ4ml13wZ2VjljNfLZlE6DQ8iWj+OQByuQOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSLR7lgUTztdwmGpzF3JWW7mMwXk02iIssmm33B3CU+rCrwne0
	ElIi+XTe7iSemyTQBfe/ERevrGH68Yzh+1UPdqFnrIlTABezFPuWGWeK9aTV7MYY8s3jDbOudnN
	WRK8jhwiFyDv+KEzdloD/yw1sq6VmAoQ=
X-Gm-Gg: AY/fxX6uRQFxvcnQVyGlJhZj/H332n7mDosGZTCv0bwipaJKhHXtFfgw9jwvBgKKodE
	N4PgwpqjCKhWSKOxFpNypqOBiQdvN270xXAmUagovSqp+5HEBnf37AfRYV32IlgQKoEEfo/rRsS
	TJh146G64xamtBfOqjojOMaEIB6PfdoEiLboDx8+c1/H+ra+1jzWQAcpfxLPk0PQmAVs0DkEix1
	AxAfvS7s51ZDiT+28P5xwYvyCGavQ8Iee/E4AM2x5dHQ8zCuLT7v+5HmCsLIU9ykO2IqrquMTGx
	ZKFWEEdtcfpDCqarDS2UTOBfMhjqdMxwRdMMiwG/8Vm64rIZ0/VdjhUKYbBn6/s7nv2SlXazd0g
	Y0dD42aQgVo4l
X-Google-Smtp-Source: AGHT+IFW2rQaG24jjJapMA2YCS5ndIcCTUrcLoVwM07bEOEYf1H++r47YjXTIrY1jYLwOX3qoKgMykSxPiszDmOKty4=
X-Received: by 2002:a05:7300:80cc:b0:2ae:5dd5:c178 with SMTP id
 5a478bee46e88-2b05eb787b8mr24225253eec.2.1767609602464; Mon, 05 Jan 2026
 02:40:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260103143119.96095-1-mt@markoturk.info> <20260103143119.96095-2-mt@markoturk.info>
 <DFF23OTZRIDS.2PZIV7D8AHWFA@kernel.org> <84cc5699-f9ab-42b3-a1ea-15bf9bd80d19@gmail.com>
 <aVmHGBop5OPlVVBa@vps.markoturk.info> <CANiq72=t-U8JTH2JZxkQaW7sbYXjWLpkYkuMd_CuzLoJLbEvgQ@mail.gmail.com>
 <DFFV41VPS2MU.3LHXU4UKITD0U@kernel.org> <CANiq72=fFZpWJ9BvHEBqi4chZO3rFo8+-F9=myW1f_JzJ0PNrg@mail.gmail.com>
 <2026010520-quickness-humble-70db@gregkh>
In-Reply-To: <2026010520-quickness-humble-70db@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 5 Jan 2026 11:39:50 +0100
X-Gm-Features: AQt7F2oJSnCa_SxWh-jZOT4jqarKH-djdmAAEP18_oI9iQTalSPqljHbD4ecNRg
Message-ID: <CANiq72nrPiTmuFStm5fmOZZM8e_4TGHFyC_77+cSqPp8yC8nUQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: pci: fix typo in Bar struct's comment
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, sashal@kernel.org, Marko Turk <mt@markoturk.info>, 
	Dirk Behme <dirk.behme@gmail.com>, dirk.behme@de.bosch.com, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 7:25=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> It all depends, sometimes we can handle file moves easily, sometimes we
> can not.
>
> But really, why is a comment typo being needed in stable kernels?

It isn't (well, it is not just a comment since it does end up in the
rendered docs, so it is a bit more "visible" than in a comment, and I
imagine some projects reasonably treat them as a fix, but still, it is
just a typo).

We discussed this years ago when I noticed a typo being picked up by
stable since I wondered why. On my side, I am happy either way -- what
I currently do is explicitly tag the ones that appear in docs. That
way you can decide on your side.

For the others (the ones in comments), I think it is not really worth
it to even figure out a Fixes: tag etc.

Of course, this is for trivial typos -- for something that e.g.
completely changes the requirements of a `# Safety` precondition the
story is different.

Cheers,
Miguel
