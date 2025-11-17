Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1711F09A5
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 07:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763365677; cv=none; b=OJRrNHxUnQ5b8ChpwXKEw/0Th5hTLG7qhWZAbFvHbF96Iy87FJqiNnahYNDaLrT1RphqUarjYGxOKqz/QGYrkPT/mtN5AT7aeid29nm3LJrdvKhkVWlk/eWNAschgRDVw4CXO1bJe8X+G46jr07Z/q01Wkk7/KDpGfrZYpG2+M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763365677; c=relaxed/simple;
	bh=6h03JxPLBCObWAwhJP4a2KbRLMtLdHN8HAsaICDJ4Jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K2OREZVzJtdrR/dkl9LKSrzZmfrOtScdKYOUZlrVTO0qCApcujoE4cyyTAgEJdGOPspsTkV66uYlpw75qGnKHKm+Z5BTYWDYLJOhvfPKzn1jWu1wecs409ebXv3XB83cTZvhmFP6G8zY7k3iUHLo3Ycc2nLOeZqd81w6mDUWVn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PC3DM1Qu; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PC3DM1Qu"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29800ac4ef3so10784945ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 23:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763365675; x=1763970475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6h03JxPLBCObWAwhJP4a2KbRLMtLdHN8HAsaICDJ4Jw=;
        b=PC3DM1Qu5m7QQkAmSaJkvvE6zO3AH5DCs/zHnDwK/xZVcLXsLHX1duk666DO5OQKaE
         TrJxXyEraRCA5kJjfdX2KmEg+L8PFpwGjJpe2J23SewOp6Yq8hv1O5I92H747V0OfXxm
         ek8LQh+cuUPwtfeK60L0LiWNtqVt2xc7RiNTRxoQAwV5JN1JQfk1XXEpULCsJ24DQQi9
         iQKXQ9hJhhxi9cVE/KumB+O9YBVYLli0amV9T5UWYcp7OVc3nzMDIRMrCyNqQjQqmhag
         z9zILmlcP09jzzHyblq7Zuv8EjnsUIcqv5wiMegrDbtZpYZJ++BobJT1c5MmiWlmj36Q
         FbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763365675; x=1763970475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6h03JxPLBCObWAwhJP4a2KbRLMtLdHN8HAsaICDJ4Jw=;
        b=fZdrL0skuKi428hFqVXhJg6DUSie9UO2Qi+1nVbgjahn1ETdCJSvqi93p3Puxp6RMa
         kA0vzoA1VDgfaEn4jXekbbUSlefD9r4XwhRLCzcCF+L5mtIKf6M+o3azWa6LFFPvBs8+
         83ZoTB6v42PkdhHHqgkBk/b9X76VDVy1c605Eiyp5m7EJ03SvLAFro+scFsI36zvvNSR
         DmrQUu+zxAx3wbmJHTsqlmCEXXYSa5EOIthTyX2lsor5Lvehvwq8MRuJmX1lz9VIQQGh
         EFHrnu9REfVoKTJT1B6RgzXDawEA1dC3HToycA2pMzTWtZrRl81JH50zdEApAxTgxoI0
         SgvA==
X-Forwarded-Encrypted: i=1; AJvYcCUnqhu6rhrZdT3iHalOTT5avFWm/8CNgswLqcz4pgL/AEk468p2rh5EfpQXKrmhRVLqZ2VDi/OpZW+vk9UPXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRBXyEdQ54gxGADiynH+z1axOtkfZxKAEQltVDpvkeeElRnbt3
	1q6AiyOIFTn24SYvIUhTGcNNJBplhvToz6uOM/eYlTReCZFIPog6gS/O71G23F46k2sfaL+55MO
	oItk9xvi9I5jSnNruOD+XoIYJbwKT2/A=
X-Gm-Gg: ASbGnctHVOlBggqiRZC72GLrhLjDg9mSj/1Vx6ZtaGH5sEoAD6FJZDeGJ3OFCZcKznx
	lb9gacBddU+qAuDcQorKqRZ25H+hwOs0OrpDiNdwwdaZgHruuUyv7vZZEPGZY4LTLuWGZB/PwlH
	tnUh3A0lI+kDIWWCiNRr0z6UewYpuJFpTe0CHuBjx1k3+svYKj5DF7vdY89NSkWAeSmFUja2KN3
	D4ELgRpzWqh9+XA2aPZQcvsgBWtv5yfGCDC1rDRQFOwh842P8igFmH0ovJMiY/CNUmswtLCJg9e
	waAbYc0oJfn3oYvZEEB2oRpp5OF6MtUajmk/HpGY4Q62wUOJNMOWMyeNA2XkW6Mh4QgBLnA+vZ7
	k4V4=
X-Google-Smtp-Source: AGHT+IFFDBs3uvggDFXgm4+aW5NTqsoiQZXkDqUFQSMJ0CthFqmTdAaDC8RRnD9kMAtxX7gN4X6R4AMduf8hjUblQ4Y=
X-Received: by 2002:a05:7301:1627:b0:2a4:3593:2c07 with SMTP id
 5a478bee46e88-2a4ada4d389mr3165047eec.0.1763365675064; Sun, 16 Nov 2025
 23:47:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110113528.1658238-1-ojeda@kernel.org> <aRHSLChi5HYXW4-9@google.com>
 <20251110133843.37ff0749@eugeo>
In-Reply-To: <20251110133843.37ff0749@eugeo>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 08:47:42 +0100
X-Gm-Features: AWmQ_bmSKtV3tIFKwvS6r_Sme3lOlGmgdURMZ2zwl8YB1szsDQkVnRqRV3WGudE
Message-ID: <CANiq72mO_g4uXV5GBGKECx4BMO3XHPNgYzmyjX7Q=Lfoyu=How@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: allow `unreachable_pub` for doctests
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 2:38=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> We shouldn't
> try to enable all clippy lints on doc tests, especially that clippy
> doesn't run today on rustdocs at all.

You mean on Cargo / userspace projects, right?

Yeah, I think they want to change that -- it is a part of the kernel
build that works better than the usual Rust project, in the sense that
Clippy is quite important to have in order to enforce things like `//
SAFETY: ...` comments.

Cheers,
Miguel
