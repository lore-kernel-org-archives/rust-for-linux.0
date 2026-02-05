Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF104328B55
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 21:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325261; cv=pass; b=aluIc+zA8vBZgrsbSDUpDNzZfXuaFtaGcIghRUcHwmLJAPDmAYtq219EaIgC17ABGGm15kDObfelPkBcY0/FnTqOYolL/CiA//ersjNZ7Hkn8kiYJ9KfdcMB7lqVAGzqnwW+GFoF6DWRMKQWUn2gzSWyuqt00kTYSDt0qbTL7Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325261; c=relaxed/simple;
	bh=c9UY20GGm+skos7cmWC/LlM5NZnvYPqwPleg1uCvakc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MI4ufr10n2Ch3px05Eud+auw0BKBQ7UVhonYF/pyGsYP+Qvdl5oRH8ENeVc2UOo77sS7CK2LWvTROGEvSXLn+UJHzJXVW+hWffEdRmSzUuWYw7ynJWitbLnGRievTbbvQbB2TszHv2sWGcZYxciRCNxSMDmRGGz3x6iYxQyMV7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDJ1lJ57; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDJ1lJ57"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-124abf957dcso42736c88.3
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 13:01:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770325260; cv=none;
        d=google.com; s=arc-20240605;
        b=ZoqEEQV44YXnM/dmanQP0UILwmfVntge5hqO6jOaJeuYFpiJxy1ZBsaMJyv6rKtrYs
         Z2wzK6GS+tMekFY3GmO71c1S9QHWQx9u3rBXSQvrNwdR3WD0AOPp27q4HCiWmc2qWEGl
         9V5aHcLm0zj7SyX+BrSv5Q0uTk14PZKeOjSGK1N4/sFMnDqjWUQ+3gFPD1O8Az1Syn86
         Z8Ev5j5imdSA6CPN1g6AnqD7tDdSJiQ50rkLiUUvWotjzPB+yMMhkw1bOrpoMqUhTzhG
         Qq4RqV+mYpZsWk7Lm+H3Qe7QsoEojjBAWpV/R9ou4ExvvEq2eDB9/bY3RAqheG+ecqLl
         p7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c9UY20GGm+skos7cmWC/LlM5NZnvYPqwPleg1uCvakc=;
        fh=gHMbmCZdo3YE11nF5qSHK93aEeNla4F4KS9Li/nA/Zc=;
        b=NFB7xmTlsihVZYcmyrpGDjpWjN45gmm2DLccPG0TtIROx0/Px4dDB9yTwfjIcFX0md
         99la86wnO/tPng3rhX37Q6efM75euMfDVfQi1MhT0bfzCjnR6zwZJr2JVX8l699He4kg
         0DlFWb8T21mOCklYiujaoD5hW4QOBYYghq5lXk9jl+ftIlx7i4HzraqH6g5dRiDq9dZ4
         IDyjGXrLnbDi3/7csXvijXbVVv9rdXsiTH/PzTa5JwFQlXspYYWKRvx0o63HoSddZCrj
         OaRRe/eZ5JlaPRqOEVgjoUesNg5aRvV9yWxDXuFzluxPtaK9DPJFCugGQaXaEHE/IlO7
         C8lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770325260; x=1770930060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9UY20GGm+skos7cmWC/LlM5NZnvYPqwPleg1uCvakc=;
        b=MDJ1lJ57wO0Kf+AG8lF3YkOo2KKQTnbiJKTUT9hvvS+1iNcAs/7gdSM+C21vKleIcV
         EeH1XrERsVsJ8PM3mwEJSe0ErJFGheeHlAotZN4BGe2TrHrJ/eAM6eFCxeeSatPUxx9g
         jb4uTEKjExO6uhr4Tng3jC+yMKhHb7I45aF/5iTWjHGOz8v7dyO9zjvxjGkWWQSCOXcq
         bI6DR/eN4Rq+fXzWnlSSf3Wn2olOtnLWeMuCt8GipdI2aPARVK7NGUdQXuoQRJNV91MQ
         BpfdpxzCqb/lybariLdeBdJiv5ZnMuWRZXTm2OTI49WPPKC8/gjKcD/g3kSaywqf7q0D
         4XnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325260; x=1770930060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c9UY20GGm+skos7cmWC/LlM5NZnvYPqwPleg1uCvakc=;
        b=jyqKfOv2us2H83yivumsDo7Vif46yKXQrtIHTs8CB52lW/CUxQ8ibJ92colVWhxvvI
         Ea3ZYARPfT4ygNbOaEkdeTd00Hefk7lqWbsuA7y/f/+3xBFHkBVHvXilF1UMNId7a+2l
         Lsk/wy8Cv89w970FqlEENOB2BlKIMvGVDhfX/UgIRjwih55RDpgjxjgsPphRLJ2BMoSU
         yGK4wAunq/RRmgjN9289aZDq7Jc2qTHTBC/U49ke0m1VFxYR3OhpbMkwwcqpIZnbJkvk
         T+tY2p4RQAD+J4j5HxASITQV/iTggwea3vuUHj8dk/Yn+8XyDzXcIMcy4aADufbVb56w
         Bbvw==
X-Forwarded-Encrypted: i=1; AJvYcCXCQ2leb4SRCtl+ygf3VdMgopCGby5Yv3dDfk2O6ZwgTcDJv92CDKY5lyyFh86oyYE1gWS/VZI4verto/Xc7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4KL2piaKRdQXBINLFU+/6wmUMs64wPa9tqUFOtO0fnPWTYvrq
	hWRHPmYfuLwN9dETR/yQdmK9krWSgcaeeciz4GA4tNEJBUs8/zeZCmAAXS2+PTe9M+DPQwyNyE4
	STPrhw9xOwebwFehKaBZm4uT2VQyjNIw=
X-Gm-Gg: AZuq6aI6UjuolemDFR8c6xB+IvrlOG+MLgT/vivqrs+imgFjuBzvHGKhzapu+00YAAU
	GRNjoyIyoeqXQiVKKecgX1+5CEJ6T7xGOVpTAfeSH74OqAcwxVD8mZoOUn7MYVMA+oX7nTC7kTr
	2L4irZd6dCCgCMm8PeOCUbZc+ILG058CpW8HmhO3X6vpG8m80yCngIDZFIWHZrWZP/0RwgrkSlA
	L1TS8fVUKP31kXPwBl0Lzvi/ZMMbo8JFmlpesj9fjnWvfMEt/HPNFHW6G+KNcn6DqZdxqDPh8Vh
	SwVy7Gd2Fx5dFgsalkY5Yb4BxWj7dBI/er04DFvd3rWgoC7HmEQGqPvGtgXUGMRm+8wK8+s9gCd
	eXg23LKBkX7ot
X-Received: by 2002:a05:7022:6ba3:b0:11b:98e8:624e with SMTP id
 a92af1059eb24-12703fb0931mr141282c88.4.1770325259631; Thu, 05 Feb 2026
 13:00:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <288d4aeb-af0d-4d50-bb0d-7a046abaaf10@de.bosch.com>
 <20260203152542.45017-1-jason.kei.hall@gmail.com> <20260203184933.23c92f8f@nimda>
 <DG5GBHGZV86X.2XKAU6WLWCL7Z@garyguo.net> <20260203193240.68bb136e@nimda>
 <DG5HFQ1JHRA1.QTLZFE4GDZT8@garyguo.net> <c150ba95-a60b-404d-823a-316710035dfd@gmail.com>
 <CANiq72=J5LBxfawu3MtQpcukaXcw+pRyMWd9ueDE=od4X99R3w@mail.gmail.com> <1ef96145-9d58-4b61-a3bb-045dee6e4fd5@de.bosch.com>
In-Reply-To: <1ef96145-9d58-4b61-a3bb-045dee6e4fd5@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Feb 2026 22:00:44 +0100
X-Gm-Features: AZwV_QjiKyQOVWh5xrAIujyXprv5UPUEUO2dHCdmH2kmKq5DiT5bcMTdC9OSpac
Message-ID: <CANiq72mcJWPLrOtDPQpZcOO5Uwaw8+5z+StX-LMTVSDPvaVwjg@mail.gmail.com>
Subject: Re: [PATCH v4] scripts: checkpatch: warn on Rust panicking methods
To: Dirk Behme <dirk.behme@de.bosch.com>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Dirk Behme <dirk.behme@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jkhall81 <jason.kei.hall@gmail.com>, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 2:24=E2=80=AFPM Dirk Behme <dirk.behme@de.bosch.com>=
 wrote:
>
> And how would a developer know that a `checkpatch.pl` warning on
> `unwrap()` is a false positive or not (i.e. is to be fixed)?

It depends on the context, like some other `checkpatch.pl`
errors/warnings, i.e. there is always some degree of developer
discretion. Or, at least, that is the way I think about
`checkpatch.pl` warnings, but maybe the maintainers think otherwise
(Cc'ing).

To give concrete advice, we could perhaps link to
https://rust.docs.kernel.org/kernel/error/type.Result.html#error-codes-in-c=
-and-rust,
for instance. (Please see my other reply on v5 about it).

Cheers,
Miguel
