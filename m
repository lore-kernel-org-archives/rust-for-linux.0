Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792520558;
	b=VVRNc7FpMBN/7YBQpBuW5P+wjY8q2k2wPXqQZ9RlDIas0rLWhD+JixugrBRGUddzlrff
	 HuGeJwL/638e9sYrmLdZrxdBJ+FmrFJ1PrQyMRiulqRbXEwUA6oHwnXZZaPXOO9T3jmB3
	 uNviaKYyCjpRfSQgvtdbYRSzaMjXGqVqGxaCqbCMhB6PqU3dscnm3gsNFinvouYE/ZBMh
	 Il9cnU1AW97OIlCg+cx9VN5MgFJHwpJLIJceOVNbWkFSaqqPcoQ1fXX84rXJhQY0e7Tdh
	 8eh0ckonTaPG2Y5/peLVT5sNYKgfQk2GM8zCIy5TtKelG8INjDny9hBVnJSeiNDikrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
	b=e4bho/dntFwTKOAKdCYfMeDt4cS6fgaSujk7DWhULODH+miKscnpWZ8zwiBcbaLb5iE7
	 h3zS9187bbQSPDGkqXCItvT9nd9TqPebAYhiat4qTTPCLnVOF2+AoCp5KB/r1oxgEnxJp
	 RVgwFdIdqpBD6KjyyhO5plTik/EH0GegHQvnh9OkOK/CLNEjyLyiwQUGc9jDcfR3fdafh
	 V+SjuCILmEAi8iwcZ7XPskdfRLk1PS9uRrCtzUBtGag6SulcE7Izw9bhXO2B4lj/QPyfq
	 FDRT8rxkqdnCTsgHBryvWhKvD5nfdmlWa8ElpoODArV6FUHcmlWVnfDIYL6+RzTaL9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jCpPoMO5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43A4606A31E
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 18:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E43A4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jCpPoMO5
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-679e86015e2so1006118d50.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 11:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792520557; cv=none;
        d=google.com; s=arc-20260327;
        b=MkWH+NrOnW64IAMO4e9fPfNFBwrT9cP33QtBMCe/mzPE5YG8sODzu8Tk+FGsLte28q
         etPuwC83A7yYGDJhpeIo1SHcoDuZh1ww46KtIZU4RaUEbTbCdgBn14oG1WZ2GHBKrVUP
         Lg7Rc6U7XEr0vks58xMDxlMF6VAus0JT2YyTavOaKlDiTDvweqccnTzUGXz1VDO3wxu8
         23RN81JG992h+r59YM2il6hr3MT+JzoCRvgwXwKM56ZTCmUKi/UcUVkwyAWFVJK0aWfG
         /+HkL6XOXFfz9UKYDgHQCH2+FZd1a2KtYuaTzHYfCrTRVZifX++BdfQNx85k0hLaxi1n
         +cmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
        fh=AvjDlF8944W0XVUDVeU8aIVrgd7WNHZIjV7gqs192i0=;
        b=JsyeKUt2CNxGnf0qCHgaH0LF3USeKSkb0mynAJ+OafCfaXBURoffGd0g5b5D+yWXm8
         F0Tb5HVd48MqzXP50Oo+bjBDkg79jxeKDEW68+3dzQf3Teyx8YtpbfsXuDZDqbMsLDCT
         6oRWCx/hBL9k0SuLJMfb4wPQwzxTODz4gt4yF3a0UoME1L5IIpDIIpYOPdbMjEMpGbxe
         c+qBC11y/9CZHMvY2EPeXkcWE7G4s4Lo51ED4hD9XQljF/JIqf3O0KZD5l/UtsRBvkPH
         ryWX9d/5oxksLM9npdHxHt/ViQnRZzqL4gpvUL6p6g69WCRRrUSAeNcUtzlVkFl/OXes
         Caew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792520557; x=1793125357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
        b=jCpPoMO58y6sJRNyUMWUWt3Xaw377KaYeVqrCJswRAQ7oKQE3kKZ95epr4PHsw8jDo
         +Vymhp4pDTcYix/GYcYigVbhJ1c35neN7bD/cng2pd+6S7s+QzkwOXRmFWhmrZrBgKtS
         uF9e/+MT5cJsEuOOvqCc7whuK+e6LEQbbFr6JTp6HpsdMQassQUMqaIylxCgHB7Nna4X
         DLnrnpOCODqRFSx8BjU8GCmq/xzr12NndAQ9cVvg0WQ8c0FEhJ/i5779DSYCzc6Mmt29
         TZInkgPURMOVAxBDShoWsPQiMMC6ZVT87Cq5hblK6YvF0yoLo69dvfI3KNOWArT7GB0M
         CZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520557; x=1793125357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
        b=EX4cxbLiTQsn08vkVoDi1oQNwHFAOkJBpFDjoaBERxPykLvsL7hHEBo4eDJIiS1tNw
         bTQxQMWyZNiOvoJbYHCP5iBSJMkhmHvT+TcfzG1nOQG+OyRqGYR2st4SXXqChqFtaKoH
         4WYrwp9fevyFNfdsRc4Uci3CUjocQpK7/vVUDlY+O1doyWp1OflCwQdZULLcYtvMZ3ye
         P/30elhNq4xL2hWr7Ss4N4Zu4ixSwU9JMeyU4wM2fUYZzjieIan8z29YJocHu64PyOu9
         uZgJ9gZ+Xjl2xJiBUqRnKe49DQ7nYnhy5JihfBPuri9KdB/7lOTlFwl8H7KtU4DYmBk8
         g8vQ==
X-Forwarded-Encrypted: i=1; AKwUvByt/6VknNutyryjOoLl55w/gZslWIZ3zVWWx4OB3ekfGM34y5RU0BoX2TRXsNNKVCQ6Rz3ScW97yv8cv+hXTA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIKJgkRbd5AP3IE1eg0EF/hG++SsvQQQbqHDV64mYKfurs/jlDZ
	8EPXHRCj16x7v9M6HHXd3dU3DYvjYc1pMoAAYFTr5a29f8MJgoMpZhTnQnhPC3jkaZCEb34G4yD
	gFEla3TOwTxdoJiLrZTAnE+/oO6RLeydaW5FJrkeW
X-Gm-Gg: AYBFou0g5iXYh4YLGj6kd+gaJqzb2/QHtGLE0OJ1Ew4tG5U+4J0C0Q8bNk672fm8naz
	LOB7mvaAxHX1KWWCz8DW3jj7grnnHTE3PeHtHjwBL275fDS8pEOzrz6T3d1+2/Win3zNIXNs/vh
	gxy+LR+N91JwkrEXs8//l7pYgyR1Pm1YYD++tsoFqzkwQ71UgTDwc5qH4Bbs1ogCNFvOXeHg+ol
	FSOlYPbjFSFaPC2LjpJ1SMtYp6XRm5BVEgCMV97zwk3AKBHx51+pgPblARNehlRMai5ZRX/+Js0
	JxZoIz3aiJ1fAJYyY8BCr/KCxj/DfiBc3TPzLrq6qTma0XGZVOiIPB5mN+lnd6cK5XHJMnbbtgn
	oCOzMP5IFjlE=
X-Received: by 2002:a05:690e:1508:b0:675:61ed:ae79 with SMTP id
 956f58d0204a3-67a0e53f3camr15368d50.40.1792520555651; Tue, 20 Oct 2026
 11:22:35 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
 <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
 <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com> <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com>
In-Reply-To: <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 20 Oct 2026 20:21:56 +0200
X-Gm-Features: AclHuK_xIgQ2EfRpHmzLAMkZfp67LMe6ufygxtV1abJhpWdiWd3lua4TQ51kRJc
Message-ID: <CANpmjNMNo67fgFY9u8zurGJOxOY10C1CKwb1UvUbHo01cU+_Sw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Oct 2026 at 19:09, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Tue, Oct 20, 2026 at 12:34=E2=80=AFPM Marco Elver <elver@google.com> w=
rote:
> >
> > Happy to take it - but in the interest of avoiding conflicts, thought
> > it might be better suited for the Rust (or Kbuild trees).
>
> Same -- happy to take it too next cycle, whatever you prefer.

If you think there's a low risk of conflict, I'll take it.

> > Needs some -next time, too.
> >
> > If I don't hear otherwise, I'll pick it up later this week / next week.
>
> Do you mean for this cycle? Linus may not like that, but up to you of cou=
rse.

No, next cycle. I'd pick it up next week, push it to a branch the test
robots see, and then update my -next branch after the current cycle.

Thanks,
-- Marco
