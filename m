Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387AB33F37C
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Jan 2026 21:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767995239; cv=none; b=q1K9pugt1DMBRnxxx+UTbFTlt/r1OeAgrzpY4mZOfBQQ7+Zg4KdzuUZqlnoiMQLc/WzWFOdxrd0YhJ8yxc80g0zm+QQWqx4do5Dzyxf2xhlZQ7f3/TB9j6a6NlhGud4JWE8mSDt3731HI/QkrnFbjomt3NweM3r3OT46NpUS2IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767995239; c=relaxed/simple;
	bh=sOAedsLin6I0ltitpl5PXhoEk+Jjvdj1eYfMGenDk6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2ccanRzztOO892AgEsPav/WAyVDc90tidA7ZAMlkPjoYFbUQFLohZVfnm1iJjH5dZJpzxXUDpve0/YNO2kpvSZMEt9kQ05ORrG+zovI9TWXStS6pag8ngh/Aflljnxl4W4N1nLY0qWEtB1vn18UKWPw1oA1XOLQOTcHJPFWS/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7h3jH9m; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7h3jH9m"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-450c65f3510so3085918b6e.2
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jan 2026 13:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767995237; x=1768600037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOAedsLin6I0ltitpl5PXhoEk+Jjvdj1eYfMGenDk6g=;
        b=l7h3jH9muGxKkiF0kxmiPmWTA5LBAQiVdOSBqe04fTMZnRK+tnxU+5PKu6/T8Yp4Py
         Bw5qXUGWV1AEeuaOjR5C5gNyp+8xhQ47dWBAMWY4G0Ws3tCCwIgxbIhyrFqMh62MZyNv
         l1PFwe0fTODbJ2VLHLAELJmEv4Su/heVjCBBKqapIo2qml9nuEkIiahsyRm92mLnU81F
         /k18lEBYN5MAzwI9hX2alHPyzvcQjtDji/aVk5K4BkS/3C/+aLGqwRX9FF4GKAOPcbWn
         rrNiYGRYCu9Z26f6Gl9HIB5FmkYR3TXFsIp5ZSTwvuXKdvWa/gZ8mVnGBgZ1OgNck+CQ
         Msww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767995237; x=1768600037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sOAedsLin6I0ltitpl5PXhoEk+Jjvdj1eYfMGenDk6g=;
        b=uTVa/1q3tzn+1oJh4v3Nm5U89Y2Fy6BKxwrDwil4hRaI1UcLR5615n0l2eDcDJRVus
         j9cT8OqHRUeI8O+/XmYlBl52A+5+u8Pv2u2P9jC3iVboHROmHxi2WUB60Tts0+fofJ88
         vVaRGAzfxttoNAUmmdW7ZAfqOnaSxRMpSD2IjSpW/j5scCq+N8/oyE9Bvs8Tdm+X+FR1
         1NGNWFv3AWOYwHwliczr050PxQ74wZlMECJpS8PfhOUIBhQS/+ECtEepZK30ZN5ad2x9
         oaraPp+18oYl6NSevV+A05U7dHWqQn7TnyC2JyThlyZxkSCujJjqZWlTljhovtnTsAzD
         wVQg==
X-Forwarded-Encrypted: i=1; AJvYcCXitN0AQIECFBS7y+LB3IKFAmSnkQf1aNbOqM2WaqVncr9F3JC1PWGfuafiGoo6oL1mlNjByH1CdJRg0N7JDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhyNGJcWB5L0FB6SU33UrTA6uF/uceEdfIzQU4Rq3G2fgoufKs
	jqLfjIlBfxJUO8B6EyI95A8wfCkzBL/bsMZ7ozVHTo2Va8zPkHUxtKy7n9Du9uGs22UnEWRxWlS
	qSWAEna0XdFWIezI/Fdklo/CZnJuM7+I=
X-Gm-Gg: AY/fxX6Jrz0RTQFsYHHBuSwuDiGY46NsLWRmZOaLWnYn2cz6kD0M0VqwhH/7G+MniU4
	z0W/nv4rPx+N572NQousYRwH6qcSAM3Gj8CgSpcEQSFUUP964uyP+TGLV5pj0JmOWBjW00vG0MU
	8tflAB7KHIMfecdYahuwdneeRpbiMhPmLeWzxPpeY3SkNHEkzHUIdCRRLFMwW996SujrHDF1jEO
	Gea09o6qn3eLlYAio8gnYFy1QXc5cN2CFqa0281ojB2SGSApYANcbwIyDg71FrKimIEbbw=
X-Google-Smtp-Source: AGHT+IFUPbxdBsLHl6tpcRAJAFJPTllkOO2/oKq8XQj35vxctGvCqDmWbJ/lLAjo0xIs2YlljF9RmBCMdQbYV0arkc8=
X-Received: by 2002:a05:6820:622:b0:65f:6794:9e84 with SMTP id
 006d021491bc7-65f6794a7c5mr2466212eaf.58.1767995237128; Fri, 09 Jan 2026
 13:47:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6dbdf6e1c1639ae381ca9ab7041f84728ffa2267.1764062688.git.y.j3ms.n@gmail.com>
 <cef76fc1105481d219953c8552eb5eb07dac707a.1764062688.git.y.j3ms.n@gmail.com>
 <CAJ-ks9nWbu53Fhmz0Wcb4jHxwr3D-sc=BqW=gHLjw34dAxRKYQ@mail.gmail.com>
 <CA+tqQ4L1j=oy87e0DC-m9YA9wJ6fR+PKtVBcnWH9iitNsVqG0A@mail.gmail.com>
 <CANiq72kezzBVKUyqGwSuJ5ct86a1ZoGJdh7xt3=3TG4+B+Vq4Q@mail.gmail.com> <CA+tqQ4KNPeyAkUbrhzbd1bGSCFSRjOYGNiAjHi+6F1OzBgQRUA@mail.gmail.com>
In-Reply-To: <CA+tqQ4KNPeyAkUbrhzbd1bGSCFSRjOYGNiAjHi+6F1OzBgQRUA@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Sat, 10 Jan 2026 06:47:06 +0900
X-Gm-Features: AZwV_QgOeHimUBaUC5JYPpNUHkDPSu2mHTUG69EE3lMrXMTVaYEUKPkRItZocP4
Message-ID: <CA+tqQ4+kGwvT80j4TvFq+Dy9ztm+yu5nTT9TLAznG0OQ9F28ug@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: quote: make rust-analyzer treat `core` and
 `std` as dependencies
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 12:30=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> wr=
ote:
>
> I think applying this series as-is and revisiting the `std` removal
> when we eventually upgrade `syn` (so that the PR effectively lands in
> our vendored `syn`) is also an option. If there's no upcoming upgrade
> planned for the near future, I would personally prefer this approach.

Ok, [1] has been merged to the upstream...

I don't have a strong opinion, but I still think it is more natural to
drop the `std` dependency when we actually bump our vendored `syn` to a
version that includes the merged changes.

Miguel, Tamir, what do you think?

[1] https://github.com/dtolnay/quote/pull/318

Best regards,
Jesung
