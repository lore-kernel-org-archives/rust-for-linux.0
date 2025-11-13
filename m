Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1F828000F
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 09:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763025694; cv=none; b=PWFcp+pRM+sbIUn53pKROe958AhELMEXyPJs2YD71QarNBNJVxSh8q8EMAoKujIg2GUt900MEbi/qxLZAeRLQL3TtnZfWAbU6ChyPb0NKsOnwoOrB1bwk1KU9i5kH0UUvUn3A9/BZO5rdO19ZDHp0ED4dFS/kBBc19kpwpa+u0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763025694; c=relaxed/simple;
	bh=HqJJwnuhSPmFDMkoRfA3CX+LjNXittqjXdLVN3Yi0iU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3vIcFefOgCwxGY5r4US0q1IgmLAfMXF6/sj+qlMP7mDTbEuFc5Zy9APeiws+e0VaPhFoLJmX4xo8Q/xs5g/EtLSvWkkK2b0God8jMmkFG84VyXzK1B40vOUqwrJiYtKpo+sxhFaKfvuTWsP//HmsyAsfNbLkL4dQyvzbNc4JiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRBPlZhB; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRBPlZhB"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-297d6c0fe27so364295ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 01:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763025692; x=1763630492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqJJwnuhSPmFDMkoRfA3CX+LjNXittqjXdLVN3Yi0iU=;
        b=gRBPlZhBgMtlKS4FUHhr7Wklc6ovQ/66+HAQzRlnu07yM01KYncLSMz8fp5sUgWP9r
         jkSQfsqp+tMzpbxQimgnmH2ZyRDL/+MLi1A64haOlnCD5tCH5lbzj75x8k4w23OmCSBd
         02+45/YFpNnRLIcNqU8smccbsavRMik46agr51zP6Ylec/jg+GYGYCutjZ3Lzhv+iW+u
         2fG36VxT1TrFxpT3w33c/fPwHUm4bnz46y5ir5nN5eIKBXBKwETxxbTeZMZUXnrkoF5Y
         dc21LXpt1lrnM4WyeJKqbI/ItytSc3HtAk6PLFoBz683nnsuJ4509BORzSA4W2RieJt8
         tD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763025692; x=1763630492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HqJJwnuhSPmFDMkoRfA3CX+LjNXittqjXdLVN3Yi0iU=;
        b=UO71ha+dEtvZcyhclvC2eZhnAHQPnUknUYmmL8C5+nclT8IJY+uRb4yGsALRqucvj6
         E+W1c22/THgmaDVEDM+YQgKH6c7IPkxJbZe6KeT1GMfoL2spZjp5sgNDUunT/GYaP0Se
         eINiTTwO1xjbeiC2s31/cxqb7wM8uKmvoCbGbTNbEYckkNO13daF+7afdJK9xWh+mcfN
         8ZtzRKaRzsYy45ulrrMcop6KjlDn7fwQvK9ZEQCCQ9VbrbPy9Y+K9EU7VSwSHX8TXVKo
         ojUyf0f8whk3jORKvcLcfhLlTxW0AWAJeDGsTkpY0HXq83JCB41WXhfbA9JTpqOVl2af
         9HpA==
X-Forwarded-Encrypted: i=1; AJvYcCXn45u06ojGJeczFJtcYFVQOZrFTZRYVJn2L4FGUN5GuZ4nwQrJAOBN/STo3KdP95suCEc9rlpQkiR7pyA0Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9JyAjaCkWSw/CmTfopGIk9bTXuWxraVzGqm7Lw6j0KHUtEmQk
	PjMT/TD6f2gf+OBGpKq78xG0Zz/uaMQo/V5zYMrlSmpk7uWTMdWoV20r22OGngZ2JSzz5x85MBO
	p4rlza2jstlVULR+CZdfCLtYftEKplD4=
X-Gm-Gg: ASbGncukY4tABvlHQa0EAzC+TfAxLuWEeMYkAwM3CTlUKt1LNIiuI8w0xwK/anGhHat
	glgKV7bb652u80H6rbkswrKDr5JlxYqp/R6PFoJtMyz3rUUXABVxIKlLClAvzqTr1RV+BZtMhst
	DtfxjmaKM8KTpJKbYQf4aqKqipsLkWI/NRARixXIu9kEcSBOChv9glYzhGfxCjdYJJ9kmz9+gRY
	1Cgg2ZdwXxJffmabIyAbpq506V75+Y1HLHVmtAeI/jme1VDxkA4FZBzbknHV+cfUPcD6h7w0TnX
	ccfPcqepGFFj3QyPVlWocQxi7jn6hCEcmrzZU783kBpft+kqrRRl1kp30vQR/BcpamXlwd59U7N
	SFbc=
X-Google-Smtp-Source: AGHT+IEmA0uOG86gaMLms71+k9nerriBq7yV/bNgdSSQ0uGPxv5p0m52ue78t1UkmbjQMf39XAyH4hdMig4vnGuN45c=
X-Received: by 2002:a17:903:1109:b0:298:535e:ef34 with SMTP id
 d9443c01a7336-2985b973375mr15566045ad.5.1763025692169; Thu, 13 Nov 2025
 01:21:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-binder-bitmap-v5-0-8b9d7c7eca82@google.com>
 <20251112-binder-bitmap-v5-6-8b9d7c7eca82@google.com> <aRTbX6RPsFf0NW48@yury>
 <aRUZq0Fo6T1f3lOD@google.com> <CANiq72najqKYQGWpc9UuOnDzPELiFB3hmFYmX-7pk8Eh7zA+Rw@mail.gmail.com>
 <aRWhakNj7_DGZDYC@google.com>
In-Reply-To: <aRWhakNj7_DGZDYC@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Nov 2025 10:21:18 +0100
X-Gm-Features: AWmQ_bmxEFrPCwsCsz_DeFclRfIg4KeejcDD4up8UdhIWBiaOtxSVGB1gV6kGt8
Message-ID: <CANiq72nPgvzmOJKQHu81k1cvEA34+1XjWGiKmDe2fjyOmSJ-Hg@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] rust_binder: use bitmap for allocation of handles
To: Alice Ryhl <aliceryhl@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 10:14=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> I was thinking of warn_on!. There is already a pr_err call.

I see -- if you end up not adding the `warn_on!`, then please add the
`debug_assert!` instead.

That should help and it also makes it even more clear that it is
something that should never ever happen.

Cheers,
Miguel
