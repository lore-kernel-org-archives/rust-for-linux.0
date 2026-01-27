Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCD635773A
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 13:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769521478; cv=pass; b=mdG/ex7Fn8v26Ci4fdVAMh1la3F/YdtzWbu8H/N4S/orkFlR51ltXuLC9X2YmRO9NpDrHGJVk8nMdo8plju96VlWM4QP8tsVae5kPDzlar+A7tgdWPfCh7g9kth2ubHNdKrs4dCncafY42MYHDF+Nn/7HBcTCBL48tnUfzUgNYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769521478; c=relaxed/simple;
	bh=UbXxxY3I1rqOVDw9QJGsTMtIGNRenMre57E7S3v28R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8VL1/H5NtecDvvIJGboaqsF0cOt+5QIImKerAnOCiYFkn4boamwHlYuoxK+nzsNfiugAZSka1Nuh4j+qos/h5pK9FQLsxjdjZ1v3v/lrA6yI+ie8dqpQw/wMt1ajNgy1YWMiDc890UKXWtnQaRFAWDJ0G7lc3Fw/Og35Ize5Z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEVzo972; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEVzo972"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b79658162dso18095eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 05:44:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769521476; cv=none;
        d=google.com; s=arc-20240605;
        b=JyLXJ1SlYNO8/6GC1xFxQ0IrWMCEBurBBh+07lnWx3Va8D60u7I1Vy2mxlPDqW9fNu
         jT/hqQVMSh17Yw4c3f0X8E9wRLCJiJNG1ruh+mAvWSnCNN7t2BxBBlqUZ7632zU/tFut
         JHve3LdXwef8ZNLzEzdPIKeOjcn1beRgNGl+IzHBF43v2C4nncywCfwg7eqqgFvoVxWm
         EzKETZODGbveGFGFIt2GMHsxPSpkI3SYb142CSAOeiochPqSp5EMLlC4HalPc78WExY8
         kHTfO6w2kOTmYe4wm3pjUr1GJWTBkUTcXekdnYejBERSjyw3CHvLsKCZTrSW6HFOJ6K5
         ekxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UbXxxY3I1rqOVDw9QJGsTMtIGNRenMre57E7S3v28R0=;
        fh=FCVv2cPLEAuBsm57spDJontO9Enpf0Ij3CNDGaJhcGI=;
        b=BOCM3RM0Y3xRroAxsIRWBzmqo/h5Kv+MBzzBSPv2GKu1UeSgZ9O/4tAYRP9y8L+iFn
         xoqTYW05dwSexZ4UOGWYukPtapXbbKvD8U8VPaxHd1zyrr2ZiO/3dhDuHFi1A9/rY/H4
         NururUv7G7RD/h/eODSWET6BaVDY+38bFtkTdK4x4I7hwpFN9swf5SwdhZapspXZYOYG
         ED4d1q4idX1Az+PIuMTiEfjXImYxXcEl5fBQJ1iMk8PyNpARgf+dZv/EvOlAOwGNTAby
         pAM+Y3vFJifGN/83csLbHaqwbaIhP+U6bztQBrHO9RYvoKYA/j7yFAiv6FuvJlDmL2PY
         M2+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769521476; x=1770126276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbXxxY3I1rqOVDw9QJGsTMtIGNRenMre57E7S3v28R0=;
        b=bEVzo972Sw4Px5kNOsbEKh/PAUsGdSpTDYEp5rIaLrzCrh3N5FFQQkqj+fEVjLWzJc
         1JrFZcJIadeIiD46w9Vb/qjdsQmubyyM2G5uuY6/FNuAu5F8nlj1v0ZGfQEeLDHHgjVR
         cRxAxeivffzvGETtX0EzPsLvLa+8EfpbsVToSUg+0Tk4rl4nDLINRYnXV9h+zK9sIC0+
         0m6gVXgzHj+/08/y+dnOtMaGQzJiORWeyEwpHszA52GXLeCZAF/8bf0O0fdS3o5lttAd
         ZdmpEaMKT2zr+/ImBl5/+45FsZwwdaACAroRhYzgadnbK2YwC9QMwAkL89RG61tmYyVk
         zGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769521476; x=1770126276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UbXxxY3I1rqOVDw9QJGsTMtIGNRenMre57E7S3v28R0=;
        b=lLqIcFjPS0ATpd8p6Fb2/ePJrhrBSRT1Mff0C47mGgHRvWRkqi+Knvw6WC560p/HYc
         kFpuLFZFouMWQXeSyy5T89KaIp3W2+U7L3yNElYpMfuEAcj/QmkNi+DI8EegfIGI/9re
         fsqCH53J0LPbQZeiSRrNe/kMB1y6Suj63YcDbcCWIGxLAqBpeLo1aeQBzQo0V2fBMrkI
         A1yumunHjWV2/7NH1nWuGDSCeGOk17g34xc4/LUzUR0Wp1dN8VTNdLE18EASTZs+InGv
         0bmLqPs+d8aYCfCJJ5KdeSkvG9MTfHFoF7v9y/p7nB/0uDiWVHuUiza0QjmzUNfV/5qH
         56Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUVDzzPPa/79EPljKJsP+U+JQuNDLQxeDQzzL3GtikIj3cBYpFJmBJ0Qb73hpIDvzEMVFRbJEsmqAEYF52SxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFDk/H4Ne2FUp3R34els0ZbY78LoA31kOkIe//1t/94CzFfrQ6
	tGFvbnrGbGGChTz4OKocENloQtXNiJ0XykHfI8ox5AIK7UVdGCCNLsF8gi0D3hm0xISPLMUn3HU
	mLkLZgjU+l89PbSj0UkQfptgoBoLT+Fx1W1vo
X-Gm-Gg: AZuq6aIPCUvpNypOI8ChpZW4Syp3ak+e1Pctp7KDVp9aRvQ2Yn818kE8pbVz6Giw9mU
	z7uV9id07UcpS0H8hOY545QLd3JrowCaQZkQM5UaZ/bQFurYjK85IQxfC9Ky9Uuako5lonoU6Hw
	A16fL1L+cn/TrmsdeAQFaph/OtmzEqMLOjZTngOmqve1Td5+94qQ73TLW425WdJtR/E4XF/xxGj
	b60Cm2Doc8tUzykofv9Od1eY45FKNG8sbD+Rskp1nIpm+YUwFX3sDwlQemODnOmQ6F6pep3kAa6
	uRULCDYkPgAI5G0XSOPOye3paXWNqvLXAAbLRZ8xIzUHpjf2dmCKVhUPfCJQZ57wZL2r7i9e/4y
	VVV6HzFl7wTcp
X-Received: by 2002:a05:693c:3102:b0:2b7:2f29:64a7 with SMTP id
 5a478bee46e88-2b78d8c7be1mr721197eec.2.1769521476359; Tue, 27 Jan 2026
 05:44:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-tamird-kernel-org-v1-1-b390d329b0b9@kernel.org>
 <CANiq72mX7fozY3Jpt8uy6Wf1ZmbuV=xHF7gfape5N1VaEdxGCQ@mail.gmail.com> <CAJ-ks9=UC8UCjzGE7ot+y4BG6OXrSza82Zaz8bbHa=uK+_j4Ag@mail.gmail.com>
In-Reply-To: <CAJ-ks9=UC8UCjzGE7ot+y4BG6OXrSza82Zaz8bbHa=uK+_j4Ag@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Jan 2026 14:44:24 +0100
X-Gm-Features: AZwV_QiA5d8yZlw9-hQn-DbhMOHbl_TOxS3-MuOdBT8aH3zcN0ouSY74E0AUJbs
Message-ID: <CANiq72ngXE+mOE2e1eeKoetbgMRNuuHMUOaqz3P+FraFYUXfqA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: mailmap: update Tamir Duberstein's email address
To: Tamir Duberstein <tamird@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 2:40=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Thanks. I followed Benno's example in
> https://lore.kernel.org/all/20250519143952.11412-1-lossin@kernel.org/.

You're welcome!

Yeah, I saw that one when grepping the Git log. I modified that one
for the contents, but not the title -- I guessed I decided the same
back then (or missed it).

Cheers,
Miguel
