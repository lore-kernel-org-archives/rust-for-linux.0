Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA6F28A1E1
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Jun 2025 15:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749225020; cv=none; b=LDJ4ZwSlQy1PF8WmmwiFlGr44KDjGkgf/+hLMmTdurc8yAkU646/8w2Ks2LGL27M+Zxh//qhkF0N+l+9gxdQw9yRWB6xIBxfxkOC2gb9KuLkY70J3F2y6GkWhYfnyjzf+J8aE4rDc/hT0pborxB7JU8MnnF4SfaWhBaGi2joih8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749225020; c=relaxed/simple;
	bh=jx6nXHGHc4yHdSNmU0ev73z39fZHAhg+IXevp32JFmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eDkaJYOzzVw0ZFbhhjfCa6+VjZbSGTWMCAhTHLQLloJQprfE/EQRcmnnb1xr06+kxQk55iwddMHsI0CoMk8/SnYGuD2QYbhyLMMAJIZm2OFEvU4oLM0bkkuAnqf7BwWYUnF7LaxKfYw1qrn2HTFhzBL0T4jT3RXrnqLTjrpwSSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bd0XS/2A; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bd0XS/2A"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-312efc384fcso286280a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Jun 2025 08:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749225019; x=1749829819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klCY5ed5cC9h1ZzzNuMlN4/awVq/FYKZDsMu9PaXee0=;
        b=Bd0XS/2AowoYiGDXehHsZ64W2FzxujopnyPNIbUxDko2jfhMNGZeyyKxka5hmMutBp
         CaaO4LrF38Xqa6VEhxfzd79nXJ6yq8ZPbzsZPX4I6cgnQMMt6LKMT9+ruEO0+8D0wXrG
         +zj6W5f5uHJ3Zwzfv0OcXw8umal+lsOH+fviuqL68OryNctBRE8lYmJISwlgX3rvJ1NK
         N6Zh0uwBv8FUe8axMDRI3gD8qjNfPg+XKWWodJi2zNBWIeUcS1quptdXqBFqGHp1n9em
         7HR6i1WQU5RUo2TnuDbTVzk4w6sSEhqHrnABcfr4GeqJDP5YkpNSpwe55QU/tBh17JJd
         dM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749225019; x=1749829819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=klCY5ed5cC9h1ZzzNuMlN4/awVq/FYKZDsMu9PaXee0=;
        b=mP8MwsIGjmJ8s3ilUHMbi0eKWse8iWwWx4LxWF23dWtx96L2BwolEoQiR8J30yRzol
         YUaALHJ6CTgrFgaTumdYDwnhejjgeaRXsmXa+T9/k198eD9Wenf8L2rfF1si/cblZaUj
         1kPNKbRgvHni7ap8S8To8O6I4vjBYBmhcBNZ5YTZ+AdtKue0o5MJav2gZr9cg9gIbb4Z
         b2xzlO7qQEnGKoExfCA3twtTU5F4Q+6kjdJLEzs7fkE+6Bs96neIU8yeefyEQRsHf0qt
         Yq1rw15Wq4NHkeqV2o7fdmdExMB5dD1LAlLluEsO4m88NdupZ1XgQ8UAkFjkSGQbTlVq
         Yp9w==
X-Forwarded-Encrypted: i=1; AJvYcCVkf/NNstoghEbC8Ed5VPJCwxiH5EPkkhYc7moNSIlRATyeyJpfULgwLkS7P/+uuqLBPs3c0JhKnHv8/7wZ+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTP4WM1EjpQErKHM0txCtme06qcZsLmILvyB7omTzOciqm2/qe
	ot3zgN5ujThJvDxg4u3YlApCYvlelclAFrlPS8kbJ0QbHHd372wveOGnVJDqg4U74B3m4u9qYzj
	OGsOri+PaFRnOr4aJ0GcuZ0RIIZOk/+Q=
X-Gm-Gg: ASbGncuqDWcmZGN2YxuzufW8LZViN0OWu42SwTsHdXJacvayW7r7GKxiU7wq4crFSIJ
	P3yK+/b1G+xhpbIUBmgGNPPFCsw52DZQV4WuTA3NVNkXP1CYXrqGLAz0hEap4AQ1R1OnfToTKKs
	ufur+OwjUD0JSgWvbZ67kJghJVQ1E29z7o
X-Google-Smtp-Source: AGHT+IHkSzBQsQfJEAT+dVFDO4yjOMWTgvl5O616QchVTlR6oc99O4FuIFIpSo6ortV7t4EtYkgAoGO6c8wW46u1TRQ=
X-Received: by 2002:a17:90b:1b51:b0:311:a314:c2c9 with SMTP id
 98e67ed59e1d1-3134708fe96mr2181559a91.1.1749225018789; Fri, 06 Jun 2025
 08:50:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529184547.1447995-1-ttabi@nvidia.com> <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
 <CANiq72ncoP6oDbKEes7Lz_K6FAz-MZY1aZNAdsYK8Sz-pwyUDQ@mail.gmail.com>
 <7f644a70cc0c91bb42badd1ac747518843bb1ef7.camel@nvidia.com>
 <CANiq72mLEFV6iEX43=+d+5P8g9HT+Wip7eTBgPgqXQ--=dQxWQ@mail.gmail.com>
 <874ffd400b0632cff99b618661adffe472abbf8d.camel@nvidia.com>
 <2025060508-spool-twistable-66af@gregkh> <7faac30f75f2ba651995d9667c463706b61ffca5.camel@nvidia.com>
In-Reply-To: <7faac30f75f2ba651995d9667c463706b61ffca5.camel@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Jun 2025 17:50:04 +0200
X-Gm-Features: AX0GCFs0HDo4SXA2VvtlOBn7vLQyn-f9SBrdsFyTswBlVNiXusy_PxN4qHQ9O1c
Message-ID: <CANiq72mVntfr6e8+KWvCBL1KhgG51JQsG3dDe5QfyfFqkY+MXA@mail.gmail.com>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
To: Timur Tabi <ttabi@nvidia.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"dakr@kernel.org" <dakr@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 5:02=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote:
>
> But I am excited about the *possibility* that we can make everyone happy =
with my code.

Another possibility to consider is outputting the last N characters,
possibly without the `.rs` nor the column number, which gives us also
the chance to fix the size for the line number too, e.g.

    [  rust/kernel/lib:1   ]
    [l/sync/lock/mutex:12  ]
    [ova-core/firmware:123 ]
    [gpu/nova-core/gpu:1234]

But this is a compromise solution, and sometimes it is just better to
provide 2 different solutions.

Cheers,
Miguel
