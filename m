Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7483BAD9D
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 12:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750238; cv=pass; b=TasFdnSgIYX+Jm6oOCdFQ+6/VeJr1Es2e42vYvUKp7j/mJkZm1giI/gNdngEr19hw+KldWjEPhqZ/uZlxQAKKFKj2iSBM4zlDRrXRYp+7wZzZegzq4tt8VetR9/G6yE0LW2LnhevpipcQnqF97tBYvGe8kZTOk6EgH7i9dKEuUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750238; c=relaxed/simple;
	bh=wpsst4m1zzaOpYqfPDRjiI8hxTGxzVJWGDbPZ/LovsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oaIseDug+hm30JdPJr67vG5CdKPttao52Fs+cHracA238BiPqw6Neq/ZpGEI/P+5AV5kmT1BmgsZEcQs/K9zQTn7OWGxq5kLTlkBreMtcZJyLaAWcmgO79wMWHX1bgM0uiTUqFJsmcC4AaczFjQAC4Lrm9c7bswSbrDJPvYQ5Sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vZBYhEwI; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vZBYhEwI"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48540355459so54714775e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 05:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773750235; cv=none;
        d=google.com; s=arc-20240605;
        b=DRUQC/8Ec2RHOqFoC7KJASfCkXEa/hbv9Slcs6JV7M/HW1PApQbIMYwtZe9AR2RcFZ
         g0vxACch2W//Y6e/ZxPMYbLF5pdNmApXQnvs01TYyk/m6ZEt7ss9McSjgFeTHEzoRXEZ
         iwqecc0ThIaQwOjygx6uyj/oNntDhezITD4dzvlGeBMu7aKHKbZbMyUlWln86oI0mYLP
         l1eJsEJJ3Bm0aG9nUsbRfzQI+Fu16+RKPtE3dkbQWZdDsKbaAknE17tnOfGx95WRyupL
         UcQJtNosoBBAtmR2O2KELG7hsYSTnUyfKis8TQfHNsW33Czz62cB7cD9A5swGm/gW9aI
         sDHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L/ogsghcVaZxzTVXK3vdnk+oIHW6TEj9ORzn0JQB/zg=;
        fh=4OSR9zJk80lortKr2tAKy0oiW6h5yhDXVLqlq40Dpmg=;
        b=Rb6Fv4LeevaErKN5XxR7GxGlpCmsRZ8FBjwVckgTYpk3mt92KUr1ObErWNorBSGrCX
         OJOM/zVDABeC0uLNB4QB5KAbSKX/UF9v+tzDb5870SPXkAqKcO5fl0GMt4hmzDZslRMA
         X7x/u8jXy1VB7ZwAJCRN1gAWWK9lysDk+6BbtrvqFk0Qaco/FSAUpWWCDnu0CHyGExvO
         We0AjRaAgnWt1dpze+6NfvV4lBSHmHD1QS7vuF1N8tj+V/9miK4P9AwVUxDDes7VT7Qr
         4ZuttYNQlzyUT4iYoRTwsblGH5xrd0NJRKrPXwPg/4ficYQdXzLDnm6tlIG4WudFwpA7
         lnew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773750235; x=1774355035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/ogsghcVaZxzTVXK3vdnk+oIHW6TEj9ORzn0JQB/zg=;
        b=vZBYhEwIuk3CR/lYHK/4pVF+GSLRgbsaa7d4AvMX/qrReZUn16s2byhVft/F20hwkE
         hVZ1Akp8t0aHZna96tYyvG+ruiFdT6OPdFZ074CrbzE0+j0i4EG/EbtvXHIHlyQM3bsT
         2otTGZh+gRrJlBMENnyjhxxjebaQMdJS0QgvDbNeOge2Mb2+GMrQdIUWUNxg+sLzwa/C
         hvyOtkT6zoYScpaGtcR6bFoIKxxSKAGEclQP8cQtMvGM2Eg3TkPOLikbW28l+BWu9nfx
         JrlQaOAITnQWvgxLvBqUKHBVfkvtDSmR9fzkbt+uGakGZodVXtZIth9BEattC+LVSmAG
         gVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750235; x=1774355035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L/ogsghcVaZxzTVXK3vdnk+oIHW6TEj9ORzn0JQB/zg=;
        b=ev+/iuMFK29clLA7vdb4I5M9js0U2toZoZsX2hDjzeP8tCSMUjBxSsE5FE+jtQX55U
         ByvpySLSjL6PpeWTOmxwoWafl4Mkxncnog2eKkVEhJepJ0sr2Bn/4vvLjrHEONbI/nDN
         VkIX1SgIIabET73cPnl+XZ2rk0I0aBK7u5KShelOy2PhFhI1Wm3cXAbjryuqXdDPGBcw
         yQS6Yh2weVmicJ6kg+yHVIF2XDXYAS5T4CoCaGkS5YdmN+GfagOEaAgIWCkejFPlkwk+
         Ro59IrXV1MvdnXuggy8kmuUIPMRkk9bQlYoZ1d6jk4/CGcpTa/M/NM3Oyo2IRe5DnOtZ
         b3oA==
X-Gm-Message-State: AOJu0YxP+1oHkDRDB+eUQwwHeW8XItUgrsdPbbimMakV0iSFW9L4xIO7
	gI67JBQMLO+n6ViGEjudD5dLctt4k4V3jy/Kfok2Ajl5rM27lqgHqK9yNedrNg59ofaZ19hR9CN
	q0hsauoe+3K00CCkB+GOQXLF6gNomkFjjJ0h8qdQS
X-Gm-Gg: ATEYQzw6ynFu/KW4wSCcLs7hUIQ3/IfNPKvA0SdfPqOGdv7VMKAi8v2L5r5+0NgSy5m
	dqwueDynxt1lQBNh9BkxHd309OMjq2wkT9xtWSMCfJtOf59F0tl37xujtJl48UPWlxPQhvyO+HA
	QaFWsMZ2clMmJMDoux/O6L2jRhjGvSi168rUNXshwHHmCG8Zpg+d+lyusIIC+4Sw3/KIDZt0Uwy
	tZbsBZkpO9i/jlBzD1sXTs8Af3Mb7PxF7SU839WEW9RPtW4AUDsp6BbUfsb7vbqInlYdxGep2tB
	sRX9w/Ohxm28oNlA+fhejBXNQh4oVhoELGhH1VQAA0M4s1L330hrPmemLw0luWvQBGQsCg==
X-Received: by 2002:a05:600c:1388:b0:485:3dfc:57d with SMTP id
 5b1f17b1804b1-485567148d7mr291316505e9.30.1773750234303; Tue, 17 Mar 2026
 05:23:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119062925.1647-1-nakamura.shuta@gmail.com>
In-Reply-To: <20260119062925.1647-1-nakamura.shuta@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 17 Mar 2026 13:23:41 +0100
X-Gm-Features: AaiRm52a4PbWG9KbAHdHAsLAbeyJnpZcv9flo150LuNyqVlO-6GJOjqzHk7Ycow
Message-ID: <CAH5fLghe8V+7+Wy6mBJ=56ugWKmQoG8s6aMU8roz8ycwcuKoPA@mail.gmail.com>
Subject: Re: [PATCH] rust: str: improve safety comment for CString::try_from_fmt
To: Nakamura Shuta <nakamura.shuta@gmail.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, Kane York <riking@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 7:32=E2=80=AFAM Nakamura Shuta <nakamura.shuta@gmai=
l.com> wrote:
>
> Improve the safety comment for the `inc_len()` call in
> `CString::try_from_fmt()` to clarify why `bytes_written()` is
> guaranteed not to exceed the buffer capacity.
>
> The current comment states that bytes written is bounded by size,
> but does not explain that this invariant is maintained because:
> 1. The `Formatter` is created with `size` as its capacity limit
> 2. The `?` operators on `write_fmt` and `write_str` ensure early
>    return if writing exceeds this limit
>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Reported-by: Kane York <riking@google.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/936
> Signed-off-by: Nakamura Shuta <nakamura.shuta@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
