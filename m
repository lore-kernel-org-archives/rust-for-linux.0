Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8E5126C17
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 05:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785733625; cv=pass; b=cX/BvzdzpyvFeNBXf0kn1YqT5hiJ8MPwaTAY+VYTZDkFVSU0PIoJfD42AzqHsYzFglIr0QdGKODNYBertMW3jetcRu7/+8wuMqLxiQKyxB/zqid057R1Io6o78gNsqZxXntON3otcy84TCCnaQ1I53uZxVxIMitnS2ERhHGH1DM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785733625; c=relaxed/simple;
	bh=pgkpYQCD21Cst2KXA8Xl8t06mbhbSG7JGnkSEHRKv40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ll9FHv+3gW5gfMIxnQS3lZ9bnrCvhPZqMWfrMDtnuHde88IZyIaOgFdVG8qwbrWNQ61bKrAB5KircIpeVpKrdMHbjcYgX03wKBBdS6VMMBWdmZnu0msljR8+BiAaN2vav8fcyGBE+uuqVS3mC/f1ki8/GdTbM0tWHvZZytrsJQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BX36gYjS; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BX36gYjS"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ccae46de39so2025055ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 02 Aug 2026 22:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785733624; cv=none;
        d=google.com; s=arc-20260327;
        b=Apw8s36ChmlTmNa/Udhfiwla+RCv8SB9yBMnK1WRRH1Ry7DoD7WYFGwVE1rCqcM3HP
         wzowCA+i2LNYr+U0xLv5svnmldUE+NH4EhdjdxToVD4ZtouXA8oSox10qmIahKWXxNr0
         dGP0mb/Qo/JzKFbKfih5iTkHMdEmB4Y3B0/5oPimrxHudbDVdVpYpvl41Hl8gXtLxl/N
         kqzvqdEYgrRb7bSjXquV1fbOJr0jAtwtk087IU4YqGVYuVTm14hglJHauD+QnZf2Pktv
         SzefsZYkS83SZoocqBOtMvKhfNnFstCS39kVaidMLPmfWcvRI1YZvjsRSAfGlvhxfjvl
         BkKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uqP8LmSJ5FrhaTFbC0hCXkpIS7MFIDXWO+Zvnme/vJk=;
        fh=AA1cjmLOkkd8ZWyTI0oL/OcNtjD0DL0zS74kaRllwz4=;
        b=RKzIwHMjRfkzxe2o1Hmdd9b0gGEHSM9Abf5A2wDUhw+gomKIXGUkeqeFG1PZayBWnt
         KK5Gqy6ErQmNVUL8X34s3OwN7c+J4v53wX91ufK1VIdY57TEB0fPINtwAZkfya6Gyena
         /GCvqNG1jkxE8Olzjyx1t/qGzfggRLQqGJgfH0ND1uQxyUU5TKuaM7BMYJhZOiCxsu8F
         lUqSvZn0jRrizmfBEu3dveMGlP2WSQ23t7j0tjhCnGv38Pj6xc1iKmKwvbHbjvaU5y0h
         UUx6S2b9lmIYWPh8QcyHxZ6bLjVTFXjo2xDlb9ePlHL7qmhH/FiPwQI2fQ9UGu1xx+/V
         wfhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785733624; x=1786338424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uqP8LmSJ5FrhaTFbC0hCXkpIS7MFIDXWO+Zvnme/vJk=;
        b=BX36gYjSUfAa532U7gjlNub4PSmk0Bp8EgggJwRBE6yNIg4tp9jO0Na+3AeZPuaNEM
         xSsaovZ7QLd1ES1MDd6Y0xLjuIIP4o0OPKu+w/maJGE7USP9rXFF0itfyL8+Kq51T6ux
         EtY6iHlpJYPDmlLA7qnVKZp6vSkFg6XK1fTBuJDrbZb28aM/eNpa8aJhUvokg/z9C1Uv
         faAwUHMIuvp0fMpF6IUBr9Tf4gcgwOvDL7HpsMpBAbEIF8TPcGThW30lEKscHfOCOSXT
         kXqjWxIDCvdBHRtiIkE/il393A3wLdBEqI2ZXaemPOdkisjXw8C+hkVP1jOSTU3OSqMM
         +Acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785733624; x=1786338424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqP8LmSJ5FrhaTFbC0hCXkpIS7MFIDXWO+Zvnme/vJk=;
        b=XyAE2Dqxicrm/Y71QYRhjUISfIZjlHq6Keqa3n5Dc/cUhXoaZLCfUh+wnumJIxtWEm
         D1UVkB74ZcsggX5CA8bGhRrdpuZMVok+eNGXY/vphL1ouBaYDyI+N/JjPk/b7tIdH0gm
         LfhxTj39DYJBjso1VMrbCe96jXSan9kz5Rbk9HjiZua/xCthtGc0A0SF44onRM/kyPLN
         aQ+mZobHDn9wl2amuaVL3RGIJgTZRGl6pVrV3lHyWNCJxYysJObXfhHphPOxhCq/odcD
         xh4s2knxm/gtGH8J30nHJ6K8sMV9KfnM1PQH2IL4+VDx9OazqpSk0DflQ+F4zj6/2cYe
         sxXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp52jpsfH8NLijPt0TM4zmFDfBQMPeVec/TFSQ8iKQbg6MzboSHCY7qn4NxYwWTuiPUuIx/dBTMrVAkb9E9LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGF3LCJUfGEqaRd6wS8oQKKynDbZtXMnlwoR5UZNQJnw8juPJa
	J2EJf+PH9//SaPqyM5MNH9hDTJLeUX0mdxBhgc93spWwYnyyosbeJ0Jw2P/NgHKcFD5OaMuSqoo
	GjE1xEtPVwooTedZDtCvwcZjm9uBUFXI=
X-Gm-Gg: AR+sD12rhw41MhW1EIFnjLB8kEAMVJNsOby0aRaEdaF5C66yOOe3M+krt0Sx0pw/mbZ
	aXb8Ymhr4qCj4j1ElnIPLuZSiBG/2U8ui1ngHftRlrdxYPm2mc3BWtsSvgq7NXng+EKmlpnNFkI
	2VWZ1orHKHLdFr5Ux3jhQ6Xrjcrd2zgq5/vcvRgonn/C7sRUms5xHlGl7nRP+IhxvxwAoVGmySL
	AjktXPwNhTCLC1b0/92prd2m77gcYrlrCD9fXOe3wVQyc4h7Sp/u8Z1pZ2tbWQE22kFwHc7FTyG
	2B6gsSTSXeePXiU5tRCtWaL8qoVYO1ch3W75NIERGGY3vpxD5dB3nsr7dSMVGUeGASiitRb/GaV
	dnwtPk3HXvXRmgK6rTqeH9koZJvuovnP2JqGQgdUD0+gCDDl5ihwMjdTGU9wb
X-Received: by 2002:a17:903:2443:b0:2cf:9e90:8be with SMTP id
 d9443c01a7336-2d0524799d8mr116261405ad.4.1785733623981; Sun, 02 Aug 2026
 22:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABwQupNfMAJOGqRM9ke6tj4f53dCCsBDKU7Vp+zf8mwk7bqt8Q@mail.gmail.com>
 <CANiq72krLhYi_vQJjKcEhiQP9CHwc-+d=iMZocW19+MqfW3qwA@mail.gmail.com>
 <CANiq72mj+A4PujCsMCWErASkQbG-ieiXqUpQfozBwhaVgWmV8g@mail.gmail.com> <CABwQupNjJCX3DqTjyG3o6wK0NktgrgwSPCWe3YLBx4BsZ+FwLA@mail.gmail.com>
In-Reply-To: <CABwQupNjJCX3DqTjyG3o6wK0NktgrgwSPCWe3YLBx4BsZ+FwLA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Aug 2026 07:06:50 +0200
X-Gm-Features: AUfX_my-QncAEZH3OPJSoDLaFA1g7nf5rynEALZ-TPH-xo4T8nbzSiw24FhK3l4
Message-ID: <CANiq72np0GvNBMmvzFSfYAfPWVgpVUoD945hHwrat5bQcEJ2vQ@mail.gmail.com>
Subject: Re: LLVM 22 needs bindgen 0.72.1
To: Burak Emir <burak.emir@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <alice@ryhl.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 11:34=E2=80=AFAM Burak Emir <burak.emir@gmail.com> =
wrote:
>
> On Sun, Jul 19, 2026 at 2:18=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> >   https://lore.kernel.org/rust-for-linux/20260719120514.159914-1-ojeda@=
kernel.org/
> >
>
> Thanks for taking care of this!

You're welcome! Did you have a chance to test the warning patch above
to confirm you see it as expected?

No worries if you don't have the setup anymore, I will apply it, but
it would be nice to know :)

Thanks!

Cheers,
Miguel
