Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAD3383C79
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985738; cv=pass; b=LkBfbxDzxgvUV5BLhe/yNbAf+iAL+WFzZACa37voj6bSu7hY/GBQgX9pnewzMxVRejyAhGG9WEk3OASdiTuT4ZndB/PQqHvtev54yAsxsLV9K5BEFUaHDqpydX3ct3OrwwcFqMJKXVhAC7ykbRq0VVi/ZfU62gjpSMgXCQ9Y3QU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985738; c=relaxed/simple;
	bh=njWOAo2MUau34atjctwQrrJp3z/hofB3g1xwcBmA4uU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mcn5ZK/Cr5/0ftBec9aHklvizb+h3JtCBnt8VuBbI437XOCOFa67HBX9yAY7bWFJU8S5EiY/zcJhXAQw36KoQpJrcENTVrm4vtQ6+VHlYJ67BojlwLqO4h/Q5TjgCR1hQb1CZaU/9S53ppoMlpnp6pCziI4XXXGNPV+9xazL3Lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifQgCaJn; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifQgCaJn"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c3d815778eso168618eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 12:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774985736; cv=none;
        d=google.com; s=arc-20240605;
        b=bD1itRHJcmdj/y1t0tgLOGdLMV3ppQeNxOHiY0Y14KytY00oKD3W66ewFbMJCCpkHZ
         fn9W/A1TqaRh61Crvyd5ZgDxNlTJDuWvFTiaTgnK2t0pTkwYXEVDtcEhCvgcX2pXlRug
         K3rMRVHuuQHBavfEb8Cmxu9hdGZvOilOEOlgMlqJHX3dRH2ZLg5AKMomkYI8CQT0yTlO
         rzhYzKQ3UQICUePq5LTdET0h4MwcD86XiQnBIiAaPqS0znfJUbIad8VbjZHnZtjUwCaJ
         +8oj2cM0gSlsb7jnIj7vGOSZ9Mix97/SVHpgIEf00jdPaBcfOhCMEesZLcGPVutUkovw
         Aibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=njWOAo2MUau34atjctwQrrJp3z/hofB3g1xwcBmA4uU=;
        fh=bjfK5kEjEFFJc/bCwkl5jw7pmrnmVlO13ZK6e/HZmxY=;
        b=CHQNtE/GCMGKuIp9S86wriWQyFkccjeYT6TfZyKDpVpHdoEM0fFKv/nxsrABsC79zF
         qYFBfhAatXXPZdvmwetue6poEmb53ts70aCSxQY2r/U9YPbVN7zXmcr+WVdf/wb5yB7X
         nknv1cMgjDBQ+lnUQuAvTrZUhBZDObb7aVjmRawRQMeb7hRLTw5so6kBnfo5e+yPI6WN
         zS+2kVShAE2dHU8A68XUSOR8oyglYh++Xp/cWh4Ao5jlKgh0r5elL7runqmlQqFYqcm2
         +DH9bbfylXlVCuTO/deSxdRkq5KLE8Ro/FAaKyMPqZ3TSD5G3F9xIfSxZZzezcyrWgx+
         bWHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985736; x=1775590536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njWOAo2MUau34atjctwQrrJp3z/hofB3g1xwcBmA4uU=;
        b=ifQgCaJnoIAnrzj6R9LlZtZue2TeKfuSrgHAho5ryLkGQ4mh7hsMOHXzbQwpoi6cvz
         VJ+02KWpqys9m8MqzEpr2kxSPS2DurD+EaZOLYN0IQnU7HskHQprnlTCCu+7wcZQX4ZF
         bSJITPT/JR9bK1hnxHEI+Rj0lcpI4OqUNRLVmzHi1dibic6cby6/1IC4TmyKT1DcokBS
         uodWJoQPCgcqK2lfCGRQBuMUZaURY379Mk08Irlt6zFBWx1k6k1pQvMJDrqk+TPMb1+p
         UVvaGF1wwSNFDhTnlXwg8C19ZBniCRVSPhbV3XyIKu/XM47X4f/eeJWC2pelH8e9jRlz
         da0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985736; x=1775590536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=njWOAo2MUau34atjctwQrrJp3z/hofB3g1xwcBmA4uU=;
        b=A2IMqQJ7Ouk6x+53zdOqTQ11pJn+8XHbT2wW3+E0aChnDP09EKl7E3fRDcATjPcaWU
         iUCZswJk+etEr3jMg65qv3zNswBVkm6EANSY8cebGdXKkswNqvrMdgYp6ATcM4MAFc94
         OvwcWjk5O0HYXxszjmZk0PyPYv3pOf99QjNmprRIGsbo8R3tfMH32XgyYouAmWM+ZIgR
         S0scMVX1TrXOb/bIqrJxeeKhuzaLFdAu9osevqgR8yiAqySH6i2fLS6UrLIKC8PpISsM
         4GVqVTKzuw9gghqbZJh7VqOXcO8nalfGxbCMLSDNPPi4EFaii4hGu6dyUgOCKRvWB2q+
         cuKw==
X-Gm-Message-State: AOJu0YwlMQidWa1U7SXTB5sZmir2xP34OTstDruINsmg55so3suWfSgg
	QQlOJLeXju8j2WO41M4zlhV5B1qJBiQOiinb2EsXqBOWpFJ76uspPezmR8NUD5JRro+CA9AZWIb
	XIkyK4glK/Q/pJ0gEediSLozaYvEupHK+UzqMOws=
X-Gm-Gg: ATEYQzx5Wyh4e/FaTRsxJ8SyF0hTTg+1v3/le2rHgTDjHcqcI7pkat/8vBltjtQZfYv
	iiHLnckTWjXCenW/9tfl8qDU2M1KSvyAfAWxcupoaC+6T0AjafXLW8KT1Ad6WscuH2Lw1oCefh/
	CW8bG2Ya/VYhTncBtTE9osEkBwVaXdDlC8/SeNo+8KcPGXFVPX1JQHqgld8ssStdGgmr2Ohzzqc
	HXyHLxv5qIBbGRBhn6oZpA13UyVIhkN7pDBWF+uhVAKix+RlxlmYe9nq0EiVMcz+NFYYXjah6zM
	ysPu+GQsozuuZGUm04gtWcA9xT7UHCu+HUgHZA38/1wxZ1xWTaIvoIQ5y105vyYMwhvqMhAxJhB
	00tRh+ad5eUlUNM3TadfKyBo=
X-Received: by 2002:a05:7301:7c12:b0:2c4:acef:291a with SMTP id
 5a478bee46e88-2c9325af281mr139384eec.4.1774985736351; Tue, 31 Mar 2026
 12:35:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331190308.141622-1-david@readahead.eu> <20260331190308.141622-9-david@readahead.eu>
In-Reply-To: <20260331190308.141622-9-david@readahead.eu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 21:35:24 +0200
X-Gm-Features: AQROBzDqIz-X85hqtMLLMo1aiBkhaznrtWNFnBARTgTxpmO2jl5dqmOI-4zCcP0
Message-ID: <CANiq72=SkdcggDkUhA+46pxurgfSveA3KJjpvT08RKN6MkUeyQ@mail.gmail.com>
Subject: Re: [RFC 08/16] bus1/util: add basic utilities
To: David Rheinsberg <david@readahead.eu>
Cc: rust-for-linux@vger.kernel.org, teg@jklm.no, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 9:05=E2=80=AFPM David Rheinsberg <david@readahead.e=
u> wrote:
>
> Some helpers will become obsolete, once the MSRV is bumped. This is
> noted in the documentation.

Yes, I am bumping it to Rust 1.85.0, so that should be fine.

However, `feature(exposed_provenance)` is there since 1.76, so you
could use that already.

Cheers,
Miguel
