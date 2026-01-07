Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F673A7029
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 17:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767807500; cv=none; b=VLFxj6LFm3dDcoacvskDkSk6sCSpICcDu/8QsLQH00wSgqy7mQndkKWSr1s8PssIjCHDX3SvRrclVpPOFPM1/5DOHHdR91B84L6CJx/QXNB1HmoQmPyeRoIoiVbSbzxNHAWYAuwIWPS4Cepl9KgJhoPcBczwxZT00Y7OQFXVN+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767807500; c=relaxed/simple;
	bh=dai0JxbhtkNUSVHfzCrnopP3eftyTSKVJDkB5Ag+2gU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Og9IR9oMTupqyKEA7e2oZ8KBsPMDXA/usb/Ul0tMqqAfT4JQKJapkOUkwtIvaI24/K0/2ajqpD9D1509I+bLo6O5XfIHo0XBwkbEAPlixYOzinrQwiEXXUKG+b7jUgev88h1sOkO3p2YIOIi58xNLhU44oIeY6kzuGV6OObaYZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOd8qmqW; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOd8qmqW"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12179b87349so159095c88.2
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 09:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767807493; x=1768412293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dai0JxbhtkNUSVHfzCrnopP3eftyTSKVJDkB5Ag+2gU=;
        b=IOd8qmqWGx5Q5yg9L7B/wPzaoP34s68EhQ+45uAbOK/naASmQD283WG0pK8ThQ0KKT
         aw/hPWjvPc5tYEj4Kc4Rw27yOdtMb3d2sOlqQd/vsxr2EbCVlCtXXwNwL/yd9mLjYZGb
         cPmhV3PuiLjOVmLGkoCtsrFMkg9VZVk1HwXk4lKA553bwxneezZ7sdjdTBQ/d34ED9GT
         Io0hFashX2J2ig5M6VYzGW2brk2GDDFokso7huQ0q0X7133QkxcInsglvO45GkWvDtG8
         m2LVfCPeCwa6FRlQd+5ml2KcFux++W9mcG8/Id+o6Z2eXp8Oo8/cZfkvJ9ucG5DT8Gk8
         ZwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767807493; x=1768412293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dai0JxbhtkNUSVHfzCrnopP3eftyTSKVJDkB5Ag+2gU=;
        b=bAKWArtioU0ZvJnuW3apoq262iHI98GWE/duPeXms6gNquPxe+QIhWwuxYMtnW5qAe
         BRa+YNE0U64OPPV6P2Z8NJ1qbJyjYJmu58ITJEtKCXFPYcpYYSZW1bC1LTmUsT719Xgh
         iud5Pdck2q/K8Dutx0ebhti9zwJll1mDb/vmXsSAyEQ7cTeSvNegFrT9zVMa5xbp+t0g
         YkP3uQoN2Hjyl6EA3qN8FzMN1lHNJ5q3tKHHnujqUO//VhNxv6cnDIoFKjIcOFD+E7oD
         tS9I8XLgz4LKazcalfvM3XFaRzCKTgERVWhFcoI4EM14jcLfxpxOCjamGhGJ5TDwnvLY
         wuPA==
X-Forwarded-Encrypted: i=1; AJvYcCX1Z1+RHC5iz0n7v/bKljUqln2XNTnk0kp1kKrpV3vIUeGdgRD50+H+qp1yVXzqfFIlSo4JdgxiA+B3KYhNtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8/TX9w0x8U+DO0+VKxcdNmQWKS3XpSnLAbr0fVQZAGb5t/bZ1
	dnedgjo62P8SVjhTzSp8ffScb3m59oZ/0JprqkjkaGubaLhtEuyr+yCu6Et9UYP1rJOk53Ir57v
	AnSc+vkFWoqi1s4ih8HHT/uc5ffkgExg=
X-Gm-Gg: AY/fxX50HccUMaEChdKKqpYckLZIqy65gschv2LPJJKgJE0oQrqtfkfIntnGY6hQ7g/
	TT7N0HdYrVGdQ+1SV3kmQiZx+qC+xhY/DVykIvMvZQpiuQxCT1lgAuUg/VVUd4AqTGd5ZbjGiSP
	7/aoo4fzj0dYULGXH/yoAOdH+rWHxO0NwjScatOtAT5OdUH6hMGIGyUiFCIrkQmgOFoSv93hkF2
	3Ym/twJI4sEcrtEOiD8BEMcTuO+jaJRcXmkg1+cmunKRdBssx+UgT32CFZ8+8s+ka1xIeY87gNp
	LDTiMUbH1SNVpiTwpnAFRb8zSigoiacxY6lUOIXmOY/4Pp2kk2UimX/Y/1IqQle6SuRsnZANTjz
	WtRG687HwsyNm
X-Google-Smtp-Source: AGHT+IGM3CJ6rtoXkbS1gqw0JneRH0rWCzxshK8igUVhgyP37LCW23SucegWV0VjMr/tA1v0YCguyHEB3GP0478A79I=
X-Received: by 2002:a05:7300:dd0c:b0:2ae:598e:abea with SMTP id
 5a478bee46e88-2b17d30fd2fmr968807eec.5.1767807493047; Wed, 07 Jan 2026
 09:38:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c5c5c0a4-249f-41b0-b5f1-87a58514b120@nvidia.com>
 <8822A0A5-CD4C-403A-A001-F4E7A351D81B@joelfernandes.org> <CANiq72mUCGL3f=GAYSZfMV1=NXpOjz4vsV7B3Pd-=EG8tmWC_A@mail.gmail.com>
 <39e74621-aba6-47eb-9935-0d2321c56d6d@nvidia.com> <20260107123159.7ac61d69@gandalf.local.home>
In-Reply-To: <20260107123159.7ac61d69@gandalf.local.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jan 2026 18:38:00 +0100
X-Gm-Features: AQt7F2rwFEKJSdRzkzLSCri3PhwRCqQPNRRr6ZPmL34vxqGv6L7SqzXqvqSjVP8
Message-ID: <CANiq72k6xengESGrJSELV8OtOwaO2d-DO0_to=WCu8PtfhH3mQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update email address for Joel Fernandes
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>, 
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, nouveau@lists.freedesktop.org, 
	Boqun Feng <boqun.feng@gmail.com>, Paul E McKenney <paulmck@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, rostedt@google.com, Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 6:31=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> This is why I prefer the "(company)" in the email name and not the addres=
s.
> It allows developers to maintain the same email while they move companies=
.
> I did this for Red Hat, VMware and now Google, and all with the same emai=
l
> address.

Yeah, it is simpler for everyone else, indeed.

> Although I may need to switch to my kernel.org address because my
> goodmis.org is being blocked by gmail :-p

I saw your post in LinkedIn about the pain... :)

But yeah, so far kernel.org is smooth (knocking on wood).

Cheers,
Miguel
