Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D57D3A63FF
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 13:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768914517; cv=pass; b=COV/zRG8q4p56qxcpxhhsvJwzDgo9gIVL8WM9WUjfB0vo8AFD79Q4/ILjgmU5rqp8jA7UhG8lYrOPECXfqi9ot7S+RWvptuqd7DbRt5NM+OF8AjD5B118N9TpFVzpmes6YkoQIpqxzl6Za5YwuQv1iaRIROph1q0K2wTxQ0KFeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768914517; c=relaxed/simple;
	bh=WaDbRbLULWefLaXSBh0kbjT05f5GigiaHNUnYN011Hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCnYQYADjA1oLz5MtCSq4q0Njz67/jeoHC7LyVx/HniTVTQo6iwmhID04IR0PYxgT5eHIA96Z6gIPdj7dWHYjUVAb577h8z4JRUviYiXFioDjRwIchCEfwrtFjJfPRiZRy5IM6GrOVUCzv4ACyjY445MxR+f7lG7XTu9/8wNVgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVo1x0Qu; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVo1x0Qu"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b6c1ec0dd6so346838eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 05:08:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768914515; cv=none;
        d=google.com; s=arc-20240605;
        b=NYHLyysK6P/wNJhnQMuWdmqrF1RscSOyKslx/lWnVdOwFV++oTG+jhUTh54ooePEpf
         78UYW+oQzdb9cZloPoLgjeoffVmi7L3Z2vHLHHKYFa9F4vRdk+5vwAB4yrBp7DhfTlD4
         FCvLtzuR1G5xLX3JLlwt3hlCWlE3Ln3hU/dX839xtn0GEobSQMfEog9DVhMQ1bWzszF9
         CXux6p4De0pEAVrWsSHeTXt+c7Nm19wX15yKjCVqJqR3NkREHvnilt3mhAGS5aI95JcN
         KbWjCZCWmGhB2vLS34hkSIuiEV9y+Bx7DSioTFBQnfYlZcbVB+UaE068DHPbMLryiyM6
         xyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WaDbRbLULWefLaXSBh0kbjT05f5GigiaHNUnYN011Hw=;
        fh=8HoLjiyqiBWYoTgSIdD1+3d7NclU7PRRcPZpWDu7ooA=;
        b=OS28Ki2yNCNF3LzAXRr0/T7VY+w88wpqnp/rx2ewfVi8d8CfvbEcS5TEet/6Wrg1MB
         4isVHPTRoS9Fqwlmw5ln4Reze5HBR25UMCB0cf7/u4DhAjIhhP6VfGWk25fvWcdcYR0N
         RhVSwJTd4mkcKkaF6w0fzefEt2GNAfBWPCCYgljH2jwJ6w8kkA7/MudKAEAX0dBcSHgQ
         Ebn0hFsA7ns+MfUb0NSbTTcDq2Uu3APbRDm80te8GRx6Tm619Bfp/lBEmBDnzMXU8/Dj
         ARt1Co3tIemIKTEpvTn3a621tmoOYELJFiko5kmKK/0zV8LjuqWw8/We8NzAxlsW4/Ss
         3AZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768914515; x=1769519315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WaDbRbLULWefLaXSBh0kbjT05f5GigiaHNUnYN011Hw=;
        b=VVo1x0QuXK0EZhMI9m4j+hFiDvk3onXrlVJyE9mohv1UPuLsFxPoJUPAY5jcFcIy8l
         LcWIi9fw67IIS1vDn+mqhltb2AiZkIGhsBeNNG/3C+d/e/N6cPyFOUAUoI/p1PnFqWS1
         Olmag7UktQjO3CcQ8LmjVOYFJvywFVEr13PpHNp703d2M6sX8QWQ4sJM8mmr1P4LfFcX
         k3Lm7yuoJuIPuOaN0n12aaoneuxM8ctoQ6Sa7mYbOdrRBW9xrj3rjLMcDopMLf+KDWG6
         QzcfxWZGXcB3z8MscU7IBhyTz1Pino4LAzPDaEXJ8BHw5wXkj0gO8UvdPbYHiJG4Q7no
         bdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768914515; x=1769519315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WaDbRbLULWefLaXSBh0kbjT05f5GigiaHNUnYN011Hw=;
        b=nax+nu2V4eNOzg59o3rD/xiGBtvHouZgEw4xZluKmpqS1IVAqpEKuyTpHLfg6tKJO8
         cuLkj//CNRa4aD/tD7kuEqm/Q+yKBA2OJpF5iVeqlsyOwsYYC+ugfveitiWiBPIoyJcS
         yQJ+OGbeG5Dv8dTtUu9N+9LhSEwdkeFIM0ynRpFwehmwNHD8zOeOWzam20I2RexoqW+E
         CKPr9YekwMdDbqj0tD8O47g/305310rHojBIrBYOOHtVExL8KkU/D3po/Q3ELk3VqHpX
         etSTJyDQ4M0TDNSa93n7hX/GOY9YM7VhHcJtgVmPhbpy8liFZKB8e7aQLa69nnMq6PcE
         TsGg==
X-Forwarded-Encrypted: i=1; AJvYcCWvXh2d/I5JwqDVg24z4R8x0oQeuq6z0wvRgMScqxWN8Ylv0506bqqsaL4QvBJKDoEhULyK3pveJnxLbHiQLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuAUwYcdY/rcUHwgIhGqhTNTw4VwwavK/+Il8d1WG/vzD5ZAtG
	H6vgcmwpwYjlYKo5zx1WNGEwnOMMQejgXzPQz2rBAUVcqlcwNYvReZa674UcZRqn1b7KqDu9Dx2
	xGqYhHr/sYCODOIYnrvmOoC3qfVGUi7E=
X-Gm-Gg: AZuq6aKZ8Hmc05FmSgLmVPnrXWkT16HggJxO2bTc9mgauVETBs+27CFKmnkYaBFD6Re
	DbkzCqt36MWchHOM41gX0mGJiINIR8j/F/9z8CaBVcG6iaYJsb5LgKjoqPqR0KxCeexeYdtoRoP
	I0cA5y/nAmX/p3vEL3TaZ5EfUlRqn5kGH4amdI1ncuk6E08rqt8uEncXVABtor9gzsxCYaKJuMe
	ubCYW/f2def+B/PBXjGb4WF2g5ao9N3THcpsI9Oz4bmPmflcofIFXeqNlzRV9Spib9OgMjWXxQe
	TZB9t3QfVdhwjcSdcgUgHcy3YwN/36QVlFmOX6gzZT0rTyEJGYCywNHgG3+XfThw9uq2AaH6KPz
	L8Jb3Jqr82gZ2
X-Received: by 2002:a05:7301:3f19:b0:2a4:3592:cf89 with SMTP id
 5a478bee46e88-2b6b380ec55mr5846709eec.0.1768914513762; Tue, 20 Jan 2026
 05:08:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <20260120-register-v1-3-723a1743b557@nvidia.com> <f12b84b7-4972-47ee-a79e-61e8d1ad49b2@de.bosch.com>
 <CANiq72kEVrYWbs9zOtP-h83TTmrOBBqkKEETUqSLZJ47=L6sFA@mail.gmail.com> <c17c1506-6ac5-49d4-b5ef-34d90dcaa41b@de.bosch.com>
In-Reply-To: <c17c1506-6ac5-49d4-b5ef-34d90dcaa41b@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 14:08:21 +0100
X-Gm-Features: AZwV_Qim3nmFJUhI8jpj09L-u3RVCumfHbJ2ACT1BTm_k9psItYn2XERaAe-3CQ
Message-ID: <CANiq72kNbBgiHHMpGA5FO5v3NvtLzJKHKiKDPf8XTPDwF1TQzg@mail.gmail.com>
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 1:47=E2=80=AFPM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> And I think we need the same for the doctests where it fails as well then=
:

Yeah, since it is a macro meant for other crates, if we want to use
the feature, then we should have it in the set of Rust allowed
features for all kernel code.

But I see Alexandre has already replied and IIUC he plans to provide
it explicitly instead?

I wonder if we could just use it instead. Hmm... I see there was a PR
1.86 that significantly reworked the implementation, and Debian has
1.85 only, so perhaps it is a good idea to conservatively avoid the
feature, even if we may not hit any differences in practice.

Cheers,
Miguel
