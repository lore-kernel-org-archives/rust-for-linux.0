Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3811337B8F
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Jan 2026 23:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768000131; cv=none; b=mcPwZ3JFqBm8xD0e6geL/AY1rSju7R2pPMErdUCNtYhUInMgUSntteOzNjE33xm45joHVeFsD0gDiDxT9yVXiLofolgxlHma1sosaxUvI2dBY8DzJvDMIRxDJtmFAxgjuFbKOY5JBKxzPuYbLlzkJqqJN0RnGCzhdopdjZ54gHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768000131; c=relaxed/simple;
	bh=RTvnZsTUbjjipFs382Tpouczdyul6evSX3BkmNgfue8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kDDcXd2nrVDfgnSv1oFVXxFo51U+q+WwiM0scHRCc6/isxjcAMKZxNEVJ2bqYGmAuHfBTohp4tExZc5tNW3H/g01wRzp+SJUOCWWwBvJ77o7sT8IiKyGBs+Vqut3JgBvS+Tfo9Qdqvipy4Vh5pkq3gb0yccIguQQYJX6QFMOqWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPejKOME; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPejKOME"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-382fb535b73so33817491fa.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jan 2026 15:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768000128; x=1768604928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTvnZsTUbjjipFs382Tpouczdyul6evSX3BkmNgfue8=;
        b=gPejKOME36H2AAzHj5Po7rgtrzCRTwVcxXqNyYVvyQZ0yE2Ae8Cf8z0pP/vWx28lNn
         +2ecCsxA+is9Z87iD9/urB2NiTqZNN6FV1x6n/vDDBBML7RPN+J9ORKTX9BKJPS19+IZ
         CXy+dK1nfO9eLr6Ce+crySIod6ESaWyj4ZcCNUf/py1JHZEusorEs2tFMXRePJCM8I1w
         FKOPCW6C/HE1/6+kLK6vBJpKxjRZJfjnS3e8Y/6uyCgVfSiMG5+TGbfg+mGmx4i63xYQ
         6ZmZ8PBnzImbUVM4dZFJDgUWubHGpsvkINwdbDA9XzClEE4P/AiT0Uq1F9zoh66nu27u
         RzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768000128; x=1768604928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RTvnZsTUbjjipFs382Tpouczdyul6evSX3BkmNgfue8=;
        b=X2bDFY4an3+bkQ72lF0r/fvrBKbO3c9muW640vd1n/vwmGdunIrgelwfQMOJJY835M
         uEhLoRTVrtWeh1kaiaqrKSfbnVCn6TXxL4NzBAFkeW9eqdC4vT+k0d6b8RxXiE8rjDTc
         fNQLIooa+L4gcBlWFKp5wcn2NvfZMKyYYK+BPNHII78LASX/3/5Y7QEAs7zKG7DSBXFl
         HMDUhpduoDoI8N3WcUWoDm4Y6QIV17CQPvXt0kpSISZlf+3fLjJyjt8gZNgW87YuAIcY
         YXbl+/ft8UShlv1HXeZPFwVVNfs3CBhZA63O0u4L1W2wDFCcStuI+1m4QlsE9wshumNR
         7/fA==
X-Forwarded-Encrypted: i=1; AJvYcCWKnIBJhWXF7B4Dt7tY45QfN7HQ1gWhu/rt91iprCyL2i06zwO5x+AeuvsVw2gP9cqvdjmRPycyUQeRrT+KSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwncAbZoimLIRHVkDx5b9IuapzRQl8Gp1Y/YGqfUkK+WqRZBsSU
	WRE0Vo+l+yPlTbcScHmDtfkI49Bk5aim5JrQJFwp5NgPDZto1XxGYgwrj+5gb/wOZa2S7M8x0L2
	Zy1JXRNELHCLOhmjBmcMEtrGulwZO5x0=
X-Gm-Gg: AY/fxX4GRktZxlQ1Jp9poPSZ8yMS1mQsC19/fxVzP6RTIy7Xf5kY8hmU36kB/ywQ9kM
	GK+W/qPZUbTDRIX52cwuCXuZ7gKGIC03rsj7jm54XFrGIBba13waOWo4OWMgZQNP9obm6nVw4HW
	Airep7EAq4RnTLPQK/rZHqEg7+72Q9SaNmnMjMR1EfYnIDmxGz4DdsXhMbw3U+eEaxQQvgOGErj
	3FDIkIOK/ZPnnLxdOyIwHCxZKy/2tOjnhsLHBdpinVLHMx/Xzu+7tKDAjsGG/y9RASuWzXHiN81
	B9StC5XcMJZFdHzruTfi48uMHDILOek+7WlB0YqdwuVVctSwZ2tBG9nDIM8ACgUlUTe1b30TbO7
	Vr0ENgPwhfhjII6TsMBhNIya46yERVwNpdnyV72SsiQ==
X-Google-Smtp-Source: AGHT+IGqysCzPmVPVi+m6lIn/JxjagjGzZ5HpUYc9y2UUVZ59wFVsyoQPenL+j0UO3lEyj8/5Vhdd73f0HZgqa7XWzs=
X-Received: by 2002:a2e:b88d:0:b0:382:fff1:e4e1 with SMTP id
 38308e7fff4ca-382fff1ec80mr29628681fa.10.1768000127517; Fri, 09 Jan 2026
 15:08:47 -0800 (PST)
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
 <CANiq72kezzBVKUyqGwSuJ5ct86a1ZoGJdh7xt3=3TG4+B+Vq4Q@mail.gmail.com>
 <CA+tqQ4KNPeyAkUbrhzbd1bGSCFSRjOYGNiAjHi+6F1OzBgQRUA@mail.gmail.com>
 <CA+tqQ4+kGwvT80j4TvFq+Dy9ztm+yu5nTT9TLAznG0OQ9F28ug@mail.gmail.com>
 <CAJ-ks9nJhRxto-cAgz_JL=__fOrsMqC_W2Z7Ob_EA6sY_xPpCQ@mail.gmail.com> <CA+tqQ4JwDvfThvHHFwStPoP-QeRyjx-XxCo=EtvzNfUb4d576g@mail.gmail.com>
In-Reply-To: <CA+tqQ4JwDvfThvHHFwStPoP-QeRyjx-XxCo=EtvzNfUb4d576g@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 9 Jan 2026 18:08:11 -0500
X-Gm-Features: AZwV_Qi4lXUIJHL3CHpa8Mu8B8VC6JcBwLp9pVqP2vpXdULWL080fbE6II8uRrY
Message-ID: <CAJ-ks9k+BreadiG5Nc29XM74Bi+Y95gvtLKjfhs0V-Y-PQcXSw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: quote: make rust-analyzer treat `core` and
 `std` as dependencies
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 5:33=E2=80=AFPM Jesung Yang <y.j3ms.n@gmail.com> wro=
te:
>
> On Sat, Jan 10, 2026 at 7:18=E2=80=AFAM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > We have to keep the std dep -- see
> > https://github.com/dtolnay/quote/commit/009af09c8252bf687e7f49e281fc47b=
c7d3c0749.
>
> Ah, I see. Thanks for the link.
>
> So IIUC, this series is good to go as-is? If so, I'd appreciate your
> tags for the `quote` patch as well if you're happy with it.
>
> Best regards,
> Jesung

Sure.

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
