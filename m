Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C29B72631
	for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 22:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769295189; cv=pass; b=ZMRLno1vnvx70cic06pqlkMezEuPyrx97xG4Zoktsa/sZtJYPjBXZJzlEh3GHurlbtFABTVIVXoYGm9yxRMWzTnQPXKTsBGcrn1KD0dJQTonP0Q4aiQdE7S7wXd2ahFjcwRZA6PNm9JTdSLyzPn27SOje4KeiBBRLzLOpr8aQ3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769295189; c=relaxed/simple;
	bh=WtZeA9Un4H6oAqMkypPzlOlC8tL1PBEaHDWHQD1Au2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBLX7vB9iY3mhQTTcOStbVghzSbj7gaRB03gfO8hD7NN9X6xyn8bnOpTmlmW7pzGhdrax5kdeE09t6+VCN3kx+a+Zp8LXPkdLafUz6wq25y/vCKl7Nj9N8mX8cj05Po1psASk1048HFJDV7ffcoJlSrpQ5JIjhrq8CwiurA5jXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThofDDc/; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThofDDc/"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b71310e8ddso94511eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 14:53:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769295187; cv=none;
        d=google.com; s=arc-20240605;
        b=ZVjCCLjjDsGhQ1kOU9fK/HxFp/jxceNcAecSHDmFiJ7Ey3lvHOmDvvIt/PhVDrryvy
         I1opTx6wbdCC5Pght4/1tptLp48DN4hvcr6w2v7gJH7CWjfDK2gaGh0LUvsMEZqpOg3S
         /bWjRBRko43W3zttBxKVbCPTrT0uSxpct0P9xFYft4Jh9ebBCZOkakOIo6eYYXOVVoNs
         ivKKi8+vtBILAJpwbVSZRwj9ilbqGfbT76qwtrJm0VqKZeiIU9D3UIerE4/BMv/vfDjf
         x9fkjrpAupmr64kNZBh8/MaUpAzTYW2iaOFAUUQD5WRpgpV3BLHM6DNFpWvCu2J3C7qa
         o2/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WtZeA9Un4H6oAqMkypPzlOlC8tL1PBEaHDWHQD1Au2o=;
        fh=Nq2M1YhQAwKpBl5kDs//c9t1a0tp0wqid0H29FEbSoo=;
        b=kuHGo/milOhh97N45pSFe4wKdXJ6L/sK1epd/7dI/6xYxGRkNWI8Qvk13dZ1aiAeDK
         F0m7FPNjBfOmzQtzYKLP6GHkYVijWOOIc3JmLThzO7lsB7GwEAeKzgUEUY9NbFNlVdsH
         9YL1Y7AXt6KPFFuQ2LkzhJlFf2cjhxWyG24vdKqetlmEeLhTYUS7rb5gCY1eRjlU41py
         jbk3SyEJB8N6JNkLgo9IuYB5s4PSskCUp0JaSl3d1E8ILG/q5woLqH425TTK6nFJ37FJ
         HtkV+TGdjNawI+NZmnGM7w7t3978x0b4uckfCFlMpJ7RxmG+kEUScr+6iu7aO21DTkS0
         lsIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769295187; x=1769899987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtZeA9Un4H6oAqMkypPzlOlC8tL1PBEaHDWHQD1Au2o=;
        b=ThofDDc/hNSLRyADG4VDlsg/FnL8sLVb96nTpYeY1lDrteeGRU+DnvKvPPnqC1NFW/
         vI5qo6429ApKkD0VZir+hIIwby+LKYTnyjOlDg2OqKMYJq+CBt1kRzYyQogbboau7V0s
         SpTgpDyD7wyQirvZ+pYdRcYRSYllVjxg4BPCXlYYCkPpdPxK08GwVW777tJCiOmUZjno
         /3bwkhswTELVgPgHMuwHEGYNfbIVbXufuWtdD0YcroQJ2/jJG+79UrWnmVpyPovWKU8Y
         7aTsA2y1oQgnpg6sA3EgVeDOlFJiZmngaoyrom9Q8+2vhAwWCzyCl4axX6bwzDKWmSmi
         bNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769295187; x=1769899987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WtZeA9Un4H6oAqMkypPzlOlC8tL1PBEaHDWHQD1Au2o=;
        b=S6ADtZJEkb7GmVB2T8lvNHUWyb9SI6IQbyLoyZhkRvPlU+zTGvB27wv/HpxorGpfrt
         8mdGnVef9KM8kdgwqGRTqUSCE8fzCQlvzLlINAkbxOK18Qjxig3vT2+E6t1yjcmZGEqo
         ood0KBNLVP16CdKYNocY530BNNSzeBjeOA4X7NC6Uulh/z3L0tUg2a1x5QvBreCccMSG
         c2KmOOEGV3T9MO7buHhgzc1oNQCTH1N0XIUqngGWqzmtGIFN4qBOVydLSdIKSKepJidG
         l4yzrRUrmWu2OEI8g7mrs+Ls2INCoZ+V//wl3WU5S08ug1vE5TeL2pwHPIPUlgNJ4k1j
         Hg8w==
X-Forwarded-Encrypted: i=1; AJvYcCWaFK3HfnaA1e/jKGVrK83DDMYF+n955TrZ460tr/0XGlYHTbGVZ1aTWrlZ2cXqKw1S9/NZHzsfgW1oTAZ2yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxonKChZd1ICxeIarfxHHdWErhWlGff8zE6fuFS47VblFcivPpw
	dGuNx9vra3oNv1u7gf9dux3iR4N4NcxwKfIjmVZX4/XyLVmC4JlmcnRFy8pCTYOCiksOg9NOJIt
	gCCQI8llbwOw0ujZIt+1c09dWMXbd4No=
X-Gm-Gg: AZuq6aI5BAeXMBRONkuHkLyNiS5uL/4ZlT7gIGq5xnUgmP+zAKmZi4MbymjccCQkTto
	ezbTgclRW38GoadmHwWmA/NYytvvbsnuO86IwufjVyy9OX7Dey1n7I9YKAK8FUUzzY6eyl5HPt7
	y2bgJ2pp7WLld1F2MU0I7JYGFJBiLE0n4pGRT8BumFePyuMRDvw11UubCVrBSLnqGQZtMup6kkm
	8LmzOOsHtwbMZmFQevVW7rBXxmKVT2T5BGWNCgqQ26xEfHn+2c4Pdsl/14ovnso9UllbQyidrlV
	xOZKn2cqOc9a6YFalADGvdl8nsVlGDWeVjA8KfifM7XeKru73yQDrBUjTUogPdWFwrRDoN/Nqen
	NylOH6nuMP+4R
X-Received: by 2002:a05:7301:3d1a:b0:2b6:f142:44ce with SMTP id
 5a478bee46e88-2b76433995amr12810eec.2.1769295186994; Sat, 24 Jan 2026
 14:53:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124160948.67508-1-ojeda@kernel.org> <CAH5fLggeH68Z+C2XFf4ONzRBu9HYcvJptz3UM1zUKd90v1g1cg@mail.gmail.com>
In-Reply-To: <CAH5fLggeH68Z+C2XFf4ONzRBu9HYcvJptz3UM1zUKd90v1g1cg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 24 Jan 2026 23:52:54 +0100
X-Gm-Features: AZwV_QhbOY663oaEwGftoI_YIydlVPcnVC_kpewQ58UFuYVtmlpOaxNK2BSzUNM
Message-ID: <CANiq72m3eJSTFzHYe5=H1AWtLQ4SgLOE52tPBy63hsZHPAdM_Q@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: depend on `COMMON_CLK` to fix build error
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 11:36=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Thanks Miguel. Since the drm fixes PR for this week was already sent I
> think we can just include this in drm-rust-next.
>
> Though, if you plan a fixes PR for this cycle, you're also welcome to
> include this patch with my ack.
> Acked-by: Alice Ryhl <aliceryhl@google.com>

You're welcome!

Yeah, I am sending the fixes PR in a few days, so I can pick it up if
it is easier for you. Either way, it is not very urgent.

Cheers,
Miguel
