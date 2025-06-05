Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F8E3C2F
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Jun 2025 03:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749093673; cv=none; b=YNubwtiC+oc+spks0o3yoBQgt3hu8lT3Z6Hr7T0CMAAcJtERc/eKBfNKKGEPf/STODDaweyEz+QQ5R390oHQu0aV0y+qeHQDm/o26OLZY5d0cf0xJVeCtqkyhp6Fu1dmBcdHhkKlHL7M9/JZeWUqeiInLZGSdf9txiE0veaPdHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749093673; c=relaxed/simple;
	bh=9cqkUh/94/jAztrHd3kGTvkbnLs3KCXf0d9g805QAng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxoOw+bK6Q/5aDbbZ6bgHcSw+G07GyCfyOQEAD7i7e823jaSceUUoz95LSe+3Z+Xl6u5pVJdiMbcYI/HzyNVDOkylUeVp2eZm+G2NSdH4b7GjgQI03Qd4+8omirsuDFvw45wMFK0vhRLG6i3+J99ULJHPLQ27qRUU/j+pr56rG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwI9tWEZ; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwI9tWEZ"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b26e6c551f8so59590a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Jun 2025 20:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749093671; x=1749698471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKeHDkRHvvG3Nwc+BDg5xLcqtmjNd5Yum870K1Oag7c=;
        b=WwI9tWEZ6HEyhpvhvfBhr67ZPM1By4xQk9qSOBMNVMR+jy3AZotUy3YI7u9+Y7kS3V
         SQ8vX3yR0zLoMDqLcGMdSVIl3kH+r/ncYP3h3GI2HVO17ZDj56/B2xD+TpltHP7RvIz6
         Wb3ABleg84ndxceVgTDZW3hDuj3ROVqMuomFy0SJ8vyGbWgHEqrjEN3OYnMDtt7MDBaz
         QwD9f/FA6mz4Iaz05eQUQpK09/tG7R6N3CpgX2PHahPiF+vjb+HeUksHJ3ewPallTCkC
         Bzhpkz0dKHuj/j4w4sEgArS4N4rEBhTQTi+UG5RhX37r+y+n8E536vOs1yHKfyBbW21W
         doIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749093671; x=1749698471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKeHDkRHvvG3Nwc+BDg5xLcqtmjNd5Yum870K1Oag7c=;
        b=HrwQbOWDVEoSnEg4kF3BrwoN4Z1lcP1/ugTXXPpHvMH7LxMYHzENc8lV77AruoNs+h
         jCuvnrOcCm8/VayT9byKw7wd9hnfzYl7GLqFKz78kcfAMS6KIrTHK5o1tUyap3za2ZDV
         Vi22T6R+8gduzqU67wSAoTyQi30SA8duHXECpCqnJkKX0px4YYnJauz7wwG2kMWUUbNn
         4q7OpgzV5PqUKZDLjLzeVXkiupAz+/ojfGcVMAvwTkCReh6/AaNAbYNCYuveLuafczw9
         TEhW8cfm6TcSdCFKXcQ3PvdUSlsQ6/yQz6fI4k72k7jgbdfomNtcGE00n/EUd3WplLnu
         Xskg==
X-Forwarded-Encrypted: i=1; AJvYcCVPh+/cCto06sypxf5kWnQyWrT1zi8Hm4bLzbB3xomNMhSibAgVaEn7Mfh/V48RyavhxNzJEfEJMOT29B5OEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzQzAXl0yeCSuKmEE7rwBN7qa+0s1kCDqMWrs+a7XcRMaV7mmQ
	ZWMoyreFhDSZv+O5abEkjP7qdVnVe0PgKywDd7hqs4ufuAgDIqSg5PAM13BBpOw1HTEn+j3jinj
	vNTf7rIhBO4HZ4siwnBOmz5AhKwhs85E=
X-Gm-Gg: ASbGncufxNQ4P9cMG13+uDrxFC4KRUxln5ZhFsp2036PsSiLSAd3+sLRofJVXr62kwJ
	cfzAHiZQZf42gwyAMNqtL1SvNl/ij6bWxHkTB843j3mB4rSCEg+u25mACYlIpBYSb+YVgIQGm6y
	o4ChqhJc1356IPF7IJ6vNQp++ZTT2FCQu+1PMjh2sIYfU=
X-Google-Smtp-Source: AGHT+IELwU1JkAvl3I2x+7A8CI8gF3DwTj2T8vfXGOYkk1hRCFqDPeTfd43tyHU6IdG1uwepRGbuGe5+eOIIIwjXYKI=
X-Received: by 2002:a17:90b:52c8:b0:312:639:a06d with SMTP id
 98e67ed59e1d1-3130cd679d5mr2937579a91.5.1749093670944; Wed, 04 Jun 2025
 20:21:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529184547.1447995-1-ttabi@nvidia.com> <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
 <DAD8GTNP7E50.3CEF051DAP051@kernel.org> <5cbe30e8f1219dd67fd4de9a1156adc054db4779.camel@nvidia.com>
 <CANiq72kEA-hzqkrXxSUk4bp63NFG=TxmQU+9+yiJsoyuQr86Qg@mail.gmail.com> <8d78b126676f71a112a538f79b80ce6a6f513ce7.camel@nvidia.com>
In-Reply-To: <8d78b126676f71a112a538f79b80ce6a6f513ce7.camel@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Jun 2025 05:20:58 +0200
X-Gm-Features: AX0GCFsEKdI9sGcXqJTOVC13wrnYqiRKVj9SzY85rVE4UBWPA-cr-I6_FiKInoA
Message-ID: <CANiq72keqFkNQvd7qu2gszeAu+Ms3f9ucPeeFfyTi48qpPoUJw@mail.gmail.com>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
To: Timur Tabi <ttabi@nvidia.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>, 
	"lossin@kernel.org" <lossin@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 1:12=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote:
>
> I've never actually seen a compiler do this, to be honest, but it makes a=
 lot of sense.  If you

I am not sure what you meant here, but this sort of thing is common
and expected -- e.g. you can see it here for C on both GCC and Clang:

    https://godbolt.org/z/3dqYznsbz

If you mark it `pub` (e.g. non-`static` in C), then the compiler needs
to "export" it. It may still be inlined, or not.

However, in Rust, even if you mark something `pub`, that does not
necessarily mean it will actually create a symbol. For instance, in
your Rust example, if you mark your public `rfind_const` as
`#[inline]`, then you will see it does not get generated anymore and
your CE outputs match again.

Moreover, if the function is small enough (and your compiler is recent
enough), Rust will do it for you.

I hope that helps.

Cheers,
Miguel
