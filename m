Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793813462;
	b=hv5wOk3h2x94ZA0JQh1kJ+bCI3M9BY/M7kCr/vbxGoZIBD0v7TRS7iGnKIiK+UshVpYE
	 OMfkQf4ueGTY6nlTFj2s2j3pqzqAk2DFFBGmPo2staHMr/ajGXVkIIaSqiwALUk5qfYem
	 pXA+63wY+eHGLrxqvgfA1Zxp/dRI54tGeKNQNDEjSIe85Zgi/jYSl5qw42pU1LdMkei+O
	 mNqNwp27IO7d+128dUNCTkmdZ/y9G+2OqwwA8B6g9FZm+w4cTE+be8O14vOgI/Y/6B7u2
	 FSKL4PlWRU7UFIeAx7fjK1IwVKPBjdxKR+zX0SfTFVB1cDb3V1GNkwMMivF6v51RSaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=d0JWFx/AOlKmAc7WmBRut5k7GGfduDlpwNaPIVIYohw=;
	b=XMmZqFQJAsKa5aB+IFUeVq0/iB9nW5dTMuaMuy3npxuhZJVvUJgVWmCtLnHXhRg7BKod
	 JLQ94dS1rWSUD7+OdiS2i3zshdmsKNkU5rPKj/ikaTfFRK5bEMgBo9ptt4/wLwdWKeuM+
	 WqE6OOG6cqIQbiS6cnNkSYzpD0Uzxu3UrTVMeRIScINGsbYKoMzI94tdFDLZvHiKVxUCy
	 Nlfq3HDGxS71bPhV3VgU2GLqPtjB6/WuEdMujrQt0SWe5s+Tc3vWeiTgx3nN0CCc1ccJG
	 h9xW1USnKgaaEvqp1rb5e+QAtYuiBtRnab32riK1drYnZqOUDtNZZ62fPLzBxyGQgmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nGrvBJUg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CD6606ECEC
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 17:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32CD6606ECEC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nGrvBJUg
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac6008c914so123165a91.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Nov 2026 09:31:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793813462; cv=none;
        d=google.com; s=arc-20260327;
        b=T1WR+8viXWrWdhM21rKdhWFkqSZqmm7hM54CLaOi2+AQtJnUWpe7BASWjTDOcez2Wf
         GfsUEsnnZTdRMfHBbrCK84cljdSEv4AVqxxECcD6yKlQaKVUMEhvsOlTYQy/wclQ3gNB
         I/xfQTouziRD+v3G0JAYE7qzpj1wtEU13jaPQ8ttralG75V5+3Uc5UI9y5U7Vw8eecFH
         mZ7UHcYfOJnmSIzMHt9PY51hVAiuNluLtSRifrTX2hwT1tkM7/+PSvn31vH8yaSK0l8C
         b8LRZ4HvP8rQi7KeUuoU16Tw30dSTWf/bjDpdMC0mHlr2Nbc/boJN1cXSBhYxnRqFALt
         us7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d0JWFx/AOlKmAc7WmBRut5k7GGfduDlpwNaPIVIYohw=;
        fh=aMyAXKwftkkkXTip9c8Ar+Da+3m5BY0Orzi5/rs2JmU=;
        b=ZdmIE3PAFS3EEyR0O0sal5resk5UA6dZIfMuU+AvG8yMXIGHcag70AnGNA48jkFNRz
         n5/fsmsIbMWycorpuz9NyKf+++6bG88x2idk0/K1WUQbhJ5wt3Fmh77NqtJpVXMT5SaI
         RqcVVXf98pEOgKsoc04AI6fjNSQZqV8mEAgBZ10L+7lFb0Z0II/3dcmB7S7lfzrY4itD
         DGWZ4j2/sGUzh0ClDpHlHdbmGcLzmzHpQi+dvLiVstXKrM/I6DOTIAlyKkqNItl+j5ww
         vETlC3wvv0ilYks6aopquXcIyPr6EJ5ZwLUwzffAlNi7M7yfrfYUKnsWxvTduHbM/pyS
         Ftcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793813462; x=1794418262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d0JWFx/AOlKmAc7WmBRut5k7GGfduDlpwNaPIVIYohw=;
        b=nGrvBJUgq4ctzEJjfgjp2y7hQxCC7F4VRZXURKrRhITluXLFxylPhr30FeFLtCt2Nt
         RoKtwoveAeXodiBp7KcHosS/DihS9X9jHOl3bNSDGEHvK674FYS0bHDUaTFlXrb/dMmo
         V8LA+3pzGduY8YYF5BxKwOwxU4qlrQE1yPsmL+veaZBJqnsi2AW/yxot4aAtpa84fBls
         JG/dNauZabJZLzmq6Yw8RDu+bg80tGDjpGoJ3Uxt/R46C37ShSUuZaWIw0sgGvkuS0h+
         mBx8Bodj0CKHcyvb0aCmrhNp+E8peSRwlULtNYYdNaxm9nEIA5fhgrMCnpiRX9rC4GrT
         FWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793813462; x=1794418262;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0JWFx/AOlKmAc7WmBRut5k7GGfduDlpwNaPIVIYohw=;
        b=2oc07+Vc4hUU//dnhzGbJFd6Fk5qVoScsFNHMJU0AgBmbyB9yZlxyZ/KLqO7GAxQPH
         Djq3UpKjjMmW5WOE5W05fxxqGDuMM+f49KBGv4IVBugARlCVkW8bxcF02Ad9uAsga8cQ
         AILCQcwwz1DFTmoSBc07l4G5+f9CMuo0+ZvB8pOkF+mjPchZyJ+7s4gO11rU4e+u0MN5
         sL0KJbK1K89Qs8pWNbWv7N0Q0weV5v4Va3gwUP+EbxtgqZ1GL6xS5o9PqoDHR/VCZdKv
         +f+tBVzBuQ78yvhT9pePNe3xYkpvOjVjbtsPTMm4dfhyOX1Fhr2MdViqY23natEa+edn
         02uw==
X-Forwarded-Encrypted: i=1; AKwUvBxvfvf7Fgaesy7K042UzWfqZpsF/vomKSzx2VbDwZo3B/SQf601+WwOGeJ9nZe+RcfIGAQOo9Td4lF/J0DTYQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8vq3tD/rNL+qk9e7y7sekhqsmwsmIewCaR7dZldLUU5Qu9SSub
	sGXHHmzS3tnNal7+Ukgcb2YEpSYG+mXHAUbkXjtWrQ0LCSOUBWP49eZyQau+BqW5gKAoz4DSjY1
	X1i4OSMEkJnHwFfy1VkkumR8RL7XO/14=
X-Gm-Gg: AYBFou0m7IvAwom2cJikyJEXqDonqeRhlYq9sbU4KudR73q0Y5+jwrOx1Nidgypt2R8
	FBAh0Ofy8X+jIohfQv6slyJ2aaN/Tjyo0F+7HqOnmtKc6fnsNJ21mABiH8DzidJsEDrwCHV4113
	AnrEsCDx0kd7H3iLUCvaYlmr96X8XytoOV/FUCt+O9cqUTOMoLfO6E51Kc7p0ksPQ+rgIEDpqCn
	rR+fhJvsyjZhoezt5YZEOSic2RbH+8xEheER+ELdEZbvRd+5vosyo9bI9fDm4HY6nDGBPifVDZs
	ZgDF6I/Qa8/SwRc69YNjeCvazhYWcSkmWghMLOdYcnpFQawe5RbbkCAeRiKErheA1jOa0e1x0R0
	QAG7LbDHTzKBrKnw/QhIECIe1e9nzEHP6qhHtELxRitdCZVrdkp2Qmy+vI+gUPqrOlnn3uS5URN
	NM91tS9mIpgXByaIVkUONnvOArn2MfS79sYXhvdpjQMS5wid7uJ4q6IQsz+VitDqehrl/u6y1Lb
	BevyJoRXGSSYm6h7HTA2GGEI5H2Wm/sJjA6
X-Received: by 2002:a17:90b:2f4f:b0:3a0:c162:51af with SMTP id
 98e67ed59e1d1-3ae89291df0mr23588219a91.0.1793813461550; Wed, 04 Nov 2026
 09:31:01 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009224626.1331914-1-tomo@flapping.org> <CANiq72nxjrWpBjwzgdWncKECKwzj6zfjS3XC=da62xr8wiSxEQ@mail.gmail.com>
 <DMM6OMQRS6UY.17O4X89AIPCS7@garyguo.net>
In-Reply-To: <DMM6OMQRS6UY.17O4X89AIPCS7@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Nov 2026 18:30:47 +0100
X-Gm-Features: AclHuK-e_NAcxmqGWxjhKKJ5IXJuAhCiIkn6UTy3XlIBHYVhontjPaKdgTduDxg
Message-ID: <CANiq72=pScnN38ZanswzJsMgPgNf7u+K9RMdh1vZLvq9mWFwsA@mail.gmail.com>
Subject: Re: [PATCH v4] rust: compiler_builtins: Fix silent trap in prohibited intrinsics
To: Gary Guo <gary@garyguo.net>
Cc: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org, a.hindborg@kernel.org, 
	acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com, 
	lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 6:40=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> It took me a while to understand what "it" means here, I assume you mean
>
>     $(obj)/compiler_builtins.o: private rustc_objcopy =3D -w -W '__*'
>
> I don't think that's needed anymore. I probably just didn't think of remo=
ving
> that line when making the change.

Yeah, I was referring to that one -- sorry, I could have been clearer.

Cheers,
Miguel
