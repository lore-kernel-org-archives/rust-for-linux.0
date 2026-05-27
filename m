Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0302741B5
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779870472; cv=pass; b=q1Dh0INykM1udGZm5ZHwm9EB6EAdLMab+J10U8IpGrk9A5NN9QXVECU38AxOTB8JfyOXCf7EFTNgMoRQBSOalEbnFUXQUYwnfDdaVXmeiqWK3K0f5JwPRZZ9JcQj5Ekl865YBr/UBSJB61r7oUkXXwpHXnLbMr6caYq2zhwpIsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779870472; c=relaxed/simple;
	bh=7xt44RJJnzqn5R1ogr2LUx2SaP/KU4n4N6j/0zqdtgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJcUEzisH+4DPLCwwvaJzFwTe0X0kVFT/5Uuqjo4ZTG0TEbmRh0i/P+/zjjWhTkfVwYCEkAsecyFFECr4CKX6wx48HLfem3dMMfaRJYOh5jSQpgwcIVUOtssI1XfWFOXt0spwamnVJxxyWKtRdNs76jWXLMv3B7EHov3B0UBuWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJH1J3vM; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJH1J3vM"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3042a99f0ceso579836eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 01:27:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779870470; cv=none;
        d=google.com; s=arc-20240605;
        b=UKv1MVtCamVpOTFe+juwlb1RGlm7Qla29im/sVEyrV3tJLiHJJ01hj3N0VabSMpIsZ
         CQ0BjrD2C7bhmIJ58yrXP28SS9wybftzXd4MW0/e7TitrBGd7+vh6WN9MP+MdBv4xRAh
         spOTsIYrWUB3lDLUAaKrsuDaBzymjzKt86JAPweeDts1aQ5JaRxRgUEf7TzoF4lUr0RU
         SABkUDUlGjfWFjwSTHomIiPOwnNibZiSsvcx+PJF/fxVrpYeBAbWDCad21kMOE7h0v9J
         w9NOdZU1MBa0oC2LEiPDBt2l3GtiRABCmu4G5i65kDXw91tcfYKed7181OwIaPD8PhpE
         wknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7xt44RJJnzqn5R1ogr2LUx2SaP/KU4n4N6j/0zqdtgg=;
        fh=LVvyO+UI0eSHkDVZNkVJXLGKY9qzFe3jY0A1buD1+EQ=;
        b=egiNc2BWEXiNWxvHREOvlniS6mUbkFqIvfz34FyPJ22FT5Sa4WUa5owAa5+3z+7mPz
         O7jnlQzt0T/qgX+aS/u2EUEczKHTSNdQ565PsUecUM2bodtkAMeIluWD1Mwpmg9zphkO
         A/M387au0FztQ5ZJakHbzZQX7A0W1ptHnOr0FFQL+uPfKNS8+S3s24f1Gd1hsVlRGfi1
         rn9BfUdqtDpcgN7Jg8appM/81961UV0F0v5DxGyREmYUwFJF2U0sYEYwWwUdBa/YWBU2
         cGJpeN1GlNm2Vw73quuFh3pgzrQvGquIb1JOXoKxHj2DKubeN6GrtaIkpHrpHy5+Sbph
         DZaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779870470; x=1780475270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xt44RJJnzqn5R1ogr2LUx2SaP/KU4n4N6j/0zqdtgg=;
        b=WJH1J3vM0iYFIcHYEEi4N9nPFqJajK8a0Yfv/emXy7n/lAnDP7nSCxZXoZbvow+J9n
         1pGgzrVjlSw4BqW4DuSzgiXDkWAJOn4BUKCBtHTq1npltrWq7OQapzVMSGvhhT3M5hvW
         yvemxQNcAFEsD7WZLlI2Ljjeffpy3WuV4hPiGU2w06hyw/4dwNUorkbDWVNCaTkHaRVe
         UgVaI5/PDHznnsr4p06vYNVpu9no1vYyEnOjydKPauZX7RFCipjIxcOgzHuNZq9upjpq
         qb+3CGpHzShcuRW7z55z1e8ksTm/G2QQ8Jm/sqFHuYe0f3LlO0Ce1Dy3EJOvhxKHs7QU
         GjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779870470; x=1780475270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7xt44RJJnzqn5R1ogr2LUx2SaP/KU4n4N6j/0zqdtgg=;
        b=BOlaeHmuEarV/Gmuxgz7zGDxcXxNQVlpjhAXbnVsZgrgkb1s/WKE1ac58CFMcylbXq
         RFULuRaGPibUASVsKdPzjl4TRLulnAtBxpfjCny/rOapSysdpksEFDMpFH1MQvyY5ekV
         jWvindR/GqIFyD+Qi4CHcpoRMPyB/1K8BKdQLW7Am8tPMjpqPwG58vT9SWuS6wDk0llT
         N9WFZNiXFkA96n3a15jpIn+2/Rl/xvUyQ/Js6FeLLZ5MZcSsOwXUtkQOsPU/fofgUe1o
         H+5YIgeiA/fmnH0wv6EBy8KYqfSmvbUdTAJkGsXZxdM+wyWH5+uetULNtbHvo6MIcDPu
         J/hw==
X-Forwarded-Encrypted: i=1; AFNElJ828urjVgUk3JI5mjeXmVy+omy87VFptxujhdJQPWDFCiiKjttMrxVGhxIgun/TJ+tPTNhOVFa2w8AUZ6GttA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKQPyxxzZ7eDZ99XLKPAxnoX31/UOwI9j8p6w+Z0iTaNN1qtIN
	GkrxneNvmUma7RX3DUqOssQ7rTg1x1n8XXso3cLiaeM7Yybg95dQZZ+PWPiaVXyP8BY51nPxuW1
	l+nKQH41aXbPOU2Inw5RaA3oTFlx2i/0=
X-Gm-Gg: Acq92OGrlhDoC1oE5vrhL6h0QrT7itkJ+7klIju5+AzQvaIgEWnCenxv3U/4Suz7GNt
	6Ece1d/S/haajobAsKKc/YCL9lHGDIJh25PA9NactGBoiArtV5SwRo0vZa9JdwhUZ2HE82PqdFr
	svdDWr7hz9eTiGfF1vomkava9ZYTSwBmt4rYP8ZEGvwkK0zIQBt8OA0DEfaxU5ypDRw+MWOZnrb
	3Socto9Xfcuq9lMjnM2CPAo61zeYcjIrrojg9JGpYktkqbxMsSm84oMz9/L63X2hLE0gbjBpdnG
	cphZuN9FqvSjxDoF4oIrA05cCVhf53TuW+ruCySLBKCWn/cQzbp2hBFm+sWx7XZ4f6miNAKqOrE
	nQgSbFUtHtlG6vYCp4fI9m7I=
X-Received: by 2002:a05:7300:fd10:b0:304:1fb6:8903 with SMTP id
 5a478bee46e88-3044911cc33mr4821140eec.7.1779870470501; Wed, 27 May 2026
 01:27:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521165622.279953-1-japo@linux.ibm.com> <20260521165622.279953-5-japo@linux.ibm.com>
 <ahaIT7BV-gMqcVh1@google.com> <20260527065302.9471Af6-hca@linux.ibm.com>
In-Reply-To: <20260527065302.9471Af6-hca@linux.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 May 2026 10:27:36 +0200
X-Gm-Features: AVHnY4IUg5QIMtvbexVfCzc49dur0UfniCtjW4qe7jZeoBlWqjjSUR3a6M3J8hc
Message-ID: <CANiq72kd3f4jhuko+2xemrjO_Vcpt6ifmBvKtb7qP9=eELZDxQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] s390: Enable Rust support
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Jan Polensky <japo@linux.ibm.com>, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, ojeda@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, rostedt@goodmis.org, ardb@kernel.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 8:53=E2=80=AFAM Heiko Carstens <hca@linux.ibm.com> =
wrote:
>
> On Wed, May 27, 2026 at 05:59:43AM +0000, Alice Ryhl wrote:
> >
> > For other version constraints we have listed them in the Kconfig file t=
o
> > guard the select HAVE_RUST or similar annotations instead of here. Is
> > this the best place to add this constraint?
>
> This is supposed to be the default location for such constraints.
>
> See also the current limitiations for gcc and llvm in the same file, or t=
he
> previous limitations of llvm for x86 and s390, which have been removed wi=
th
> commit 20c098928356 ("kbuild: Bump minimum version of LLVM for building t=
he
> kernel to 15.0.0").

Yeah, if it can be done in that file (i.e. if it doesn't require the
kernel configuration otherwise), then it is best to keep it there.

Cheers,
Miguel
