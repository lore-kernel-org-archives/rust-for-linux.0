Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E222E6122
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 23:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760657166; cv=none; b=MakmZDZAGwhQtSWFag5WCL2AFQDwWpYRZrkz75WTyAgZOGcTMCgwi1e/9M9x8LD/rC9d9cEqgIVv/3Z6i7kiqC+h4oOkcylQMnPnrmlcMJ1clidYFUEG5RbcUJpOIkbxX+WGz96dTaK9jL75tmMjpMKB87gX+w341b3e+rjeqc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760657166; c=relaxed/simple;
	bh=E+JggmdmCtBj6KDkuLqnnfKIt7/ceu80PeaihGVC/S0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L9ommKBr1d6xRJYZcsOEjkEIv2+WfOtzVQsTUtFDAaLVbDHyC2AkYuF2nExjDw/B4mzv1LcEp01PwHVsuyEs/ueZhs8Xgq+vuLX31rYNOtKjMElhAzdwaFuURhvimxtu5zaSyL8tVVHOhPQQw5Dp26knzMd+8tZh/6jLwfFsIKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OB6K8bD5; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OB6K8bD5"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3307e8979f2so235660a91.2
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 16:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760657164; x=1761261964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+JggmdmCtBj6KDkuLqnnfKIt7/ceu80PeaihGVC/S0=;
        b=OB6K8bD56ASaMYFx2Q6bEGd+8H+Yq5PnTNog417MqTaOwJWYDeRDhcDG0edCGMX+nL
         JYWxvu0rI9pmnE9zeWwd/hX3KEbtVbxEN2CRa8FU2W78Z2EIm8cm20SGWjYUG9bNCfEo
         A+sP4vS6AX9S26Nqsxq1oPDDPty2JCbvBukNTM4IjEqzRKEhYroqYHAuQtWdv5/WFV9w
         lnTQ0hibQOyMxdEsE4f4igDR8VvS1SwaskChKQqzAKO8xZTJi3KH9bRNeZGyajlVryGe
         1BLDvnmPoObYptEBGUIZ2H3GHedLlIV/M9jGWwWYUCzfbFs/DiIt1vqFx7eDtVec3/Z9
         ew1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760657164; x=1761261964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+JggmdmCtBj6KDkuLqnnfKIt7/ceu80PeaihGVC/S0=;
        b=V3bNEkUuMeWftLzQV3jJ/4mXhxMInio5edirpugWUm1fudoMcxbLTcc0Zpgjohiew9
         7TjHQ//29IL0juOuOcM7AkUu3OdVBhvoxlrCmEn/ohi2krDFjuOWl33JMyjymO0pXnMt
         7+eDTOBAiTcFNuFXPmDpsfRGUK/iJxTtZ1CAKkRnZBaVLrlzPZPg/vqowf2yWuNGh2iV
         ON7mm9ZxbsW3EYi0hLiiy8Wqnh7ArDZ0FC+VUj5gmLjKawOfTG1lEzly95moR/WMh29i
         rzNHsZBC0qJqhSwzONF/FvB2YrI698IwUDVmjiMOZy58fuXIT9KCzojTkJjlJK6oMOJd
         Zqzw==
X-Forwarded-Encrypted: i=1; AJvYcCWhCyKmpStLdevyiAPq2PsS6PDXAPynHCRROxEu2pQT3sDaqJd+YNbwcuV0avc+hyKSlYb+ywMInoYLQMFbhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+IN3YlNO/enyVvg777Y2Q5+NFpcgXEY564LQyVE/k99TqBysQ
	agClhN1PazOyrjnXKs5nD/KkW1mIjWW4IFaVZ9LQuBrb5t34/scmqwS5nOXETAlbH8RS2WYU45Z
	G3FlLvWhF8GrI1iQ5168TZ8mhWgB39xc=
X-Gm-Gg: ASbGnctWJ1wILOga3PYg2SlFpbT63Gb/7Smj62FvNMrAqwZoEMpuaA4ED3U8HHdGFOU
	3/SBWW3C6HQuVGvOpp/UbLonbqOXaaVVgBGDbls+58SQzHAxLegACiFt7/ckUfeZs+o5E2Xba1i
	UkzxOcM6WeWByDP7c2yzHpms+Vdu3sZrjhIYNnKIRwBuW7qTqXPIioBuScvIMIJMCOXjSVXeL5m
	JBbSh1sx0nNm7URaCaoB7EqlkgoWOXN8bxXrHaI0BF9RJkMRqC0xD8uWFOXyaqH8R5tr98jLBLS
	7DBBHBwUfWgJCib+ZeudPFs4pk8+/rln229gZFHz31JDohnC9JjBPzkCOkQV5D06kYGLrY/CwZT
	V/KS0ceJqnHwcbg==
X-Google-Smtp-Source: AGHT+IHnRUogCTLR4j2SRK3tnx9yJeIhgejmiTK6A9npVoSOmDy3a5IB+8s4WFVWl7NclfK6Oapzgp8ltJtmKXRKyH0=
X-Received: by 2002:a17:902:d484:b0:269:80e2:c5a8 with SMTP id
 d9443c01a7336-290cba419fdmr9896625ad.7.1760657163954; Thu, 16 Oct 2025
 16:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013062041.1639529-1-apopple@nvidia.com> <20251013062041.1639529-4-apopple@nvidia.com>
 <DDJJ4ECCSE2I.1EUAJRU9JBGNI@nvidia.com> <zwaefk62to77b5nyakeiboyj53fge3lysc3z7arp54tyyherdo@nsqhuig7bmbc>
 <DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org>
In-Reply-To: <DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 Oct 2025 01:25:51 +0200
X-Gm-Features: AS18NWAntWCgqHJ-0gybXjQxgpqfISwElGAlnBfAxtiow_eCYUtIQUGW5snmefQ
Message-ID: <CANiq72=bXR4oodrPS8_Dk59cNQa54EOzAPxp3r6e7BAKoZy2Wg@mail.gmail.com>
Subject: Re: [PATCH v5 03/14] gpu: nova-core: gsp: Create wpr metadata
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 1:11=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Since nova-core depends on CONFIG_64BIT, I think we want a helper functio=
n that
> converts usize to u64 infallibly.
>
> This helper function can simply generate a compile time error, when
> !CONFIG_64BIT, etc.
>
> We can do this locally in nova-core, but it could also find it's place in=
 the
> generic infrastructure. nova-core clearly won't be the last driver runnin=
g into
> this inconvinience.

Indeed.

Cheers,
Miguel
