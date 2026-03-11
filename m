Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBE43D6CAF
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 16:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245105; cv=pass; b=ppXAuW+/ETz8KRqdDsHoMMHRMpsldPEDayywITMrbeP+7oy8aPLy4OWDJXPyFJyTpldhTuxriLm90PQFyDAIfnZgkuEQ1vMBFdTXpeEsDE4dDPkecsK6xFZSYlVAGo86AyphxwrzVs10Pz2nLFYQL4411gVTvITJk9BiLLHaoag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245105; c=relaxed/simple;
	bh=U3fsvXaDbFRBM3Sa+C2LCFylj/LiFFcDtRhLdgWtNOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ATIn3Hl7d9xJFfc12TQWfg6PCT88BeAGATWkM2uFP4TqObqEKGHwjcuXqyZUCFdG853v6DAKzVzaYvq3Gn4A5AzO3iqb9vWIGUQ2si11UUfWq9r2nM0vOh86MHwQ+SKgDKeTeiGMv4hwlJYtFdPcBhbXnHRV85yrkGFRbB+GfNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wrZfgftP; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wrZfgftP"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b2965d4bso25500f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 09:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773245103; cv=none;
        d=google.com; s=arc-20240605;
        b=cE02j2H9GvVqrU/Q5MdR3ZasYc5SvUY4QWJiXiSgDPbvFgv2r3L/JEk0H89pl3GgFB
         HJoBMYQ7cut0yxMq9fMOEUaIKjhYRtgYiPANjhZGtKf2ZURNE1h92goqvtu7Qh+yD7+i
         bb4IfnqRa7QTJ2IsQiJe3oQR/ziw5ZnVzdPptdZhGpzmDnVUAUQfuA0I2ePKZ5dWggWC
         CJbfeDXPFyBV/kR90KsYqxe14mrmu3DDzPUXjDmZgHqdDew334/gGI5whSJNOOd7a1Hn
         2PJ1/azT9xWdsGESzmcO7a6+4HJvYxmQpDNtym0cgmOS43oJTcQSWjaqu4aSByTkaYBo
         w1Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U3fsvXaDbFRBM3Sa+C2LCFylj/LiFFcDtRhLdgWtNOA=;
        fh=H+/qxP0hlFMJX8j04I8xvennv/r+mBCoVF5q65lS9N8=;
        b=PURh7Yxbc9wCHIdbpdOU4+DJzihxPlxZkHKWTRdaMXvn3CE/2OE9XhQI6mA6rZxVrq
         XCz/c4C/mFTqUqayZTbFVDIIjYuVVPJwaHobXbLyWH206Re5aFJWvc1qlI81/8vG0rJu
         H2WGqi90hhRYYaoIi2i9Uc/xatViZbKEjsmi6TxqBAm1ki0nL9rKDuApIFGxJjYeXQ1l
         m5dNiN5mKpn8OfR3PTmVxadkIWCRbqMGXo3obsxOovn/x7gDkliWIuo29KM+CWdg+JKw
         HzvBrs9eBKbGakh3NzwP5W25pZBDRWXWogwew7MetBt48j8/m1ch3VELbgWlApVZtz8P
         NwyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773245103; x=1773849903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3fsvXaDbFRBM3Sa+C2LCFylj/LiFFcDtRhLdgWtNOA=;
        b=wrZfgftP987fL+umJmvHY4jK8p2XEFBaOQ4P0dx68Uo2PPtMSrU1mfsB/rLELkipfX
         5OF0LQLt75OMvrZ90qjHp+R+GhTM1uWGeHfAi9g6vhvBQSI5IcZ9Af8BzA4CRQiDEtlw
         ubTzkCyFFPPUCputgJ9GEDfF2p/DmAbKXTTAE2fN4haPPRuGaJrLFeW+sT4Mb33r5kFl
         SrhySAc9an6XBHR/hyb05oflUwxX7coVmvwvMoBx4eso6a3RabT9mS5OusguktGEPsU+
         uymcsQLvBFhuHFwyKqPvOMVU0UpT4hZfsI77voYodFHo6Vj0mwTMeBCEpO5he5ZcRoWk
         l2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245103; x=1773849903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U3fsvXaDbFRBM3Sa+C2LCFylj/LiFFcDtRhLdgWtNOA=;
        b=RtaYuYuiP9KB2Yaix/xbyLfYEb/KQRayUVFPyxYwhzLZBWWpkHogCycWyhpeahpoKb
         rvMSjhEJnmEB90gdWsilG69v/Zx/UuFDt6QVSr38Jr2tAGFpnqipVxZ6llE0OpYFZjC0
         Ka33dbhyIqB/q8mZ79Dw7OC2/AAUlxwz6NPYySM1TPR23ke1OW+0DydEa3jFceWEkfxV
         tGZ7I3C57/ATA3MwNFmSK7qWDByDp+wKXt5KvZ5ecd7NyFqrtJ5B5BaQVcJUvQrbriRn
         DstjjoEzlnNVIaqF0KOMZaDNMusD5sZespQ4/485EtY98dSWmO66dkem2dYKf6lm6IDR
         aSrg==
X-Forwarded-Encrypted: i=1; AJvYcCUPyeffl6FUQlBZFbZE0poCelekPBW508NADbJbQTu5Hk4haS32VI13cpzFwGF73TUf0RpqvQLq5CSboxH3Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgUFhiKtAEO6FkmrKdcgIwS8277x80No6WKEOrhuRTfOstaTKl
	nb4NznpgjV3Lxx4SmYEUPveJPnkL3bAY90zcPgMhbQFxSnkJAPq3sbl/a3W3UVbGx+lplnomIp2
	NCX7PXdahLrx+DPPw5Py61keBEKQgO1POwusN2q0V
X-Gm-Gg: ATEYQzwJFFUgOSe95EHy3jAQQvZnb8KMqe5bNydF/ne506IWcDAryC0jaggPpGlpgnx
	GEYwYF6z7B5uQVAE01o2A2nFiZUc4q+Mdv8/DY96T6tPhKFVNRKvhtQKH8Bb/D3pT81jyYjtnzM
	lR6+6nNQqO6Q/+agqGSxt39HftQsJS5wQM7tUWpPJ9xi9eV7W7we+PQydCp5/mSjWy/ddTMFMBi
	graVRFs425IqCbNke3Q9qVUxLPygkyxpChRuxCsbJ+zecH7e8TJGjkdf0MgOaDJ8lpYNZ28G680
	EkZAw/5rOE7QTf5EKf3FPWSjMtapkjKLB9KLPE8XH2kC5DQGt3hCUPTRPTKA9ogVg+FN8Q==
X-Received: by 2002:a05:6000:3113:b0:439:c5cf:fc68 with SMTP id
 ffacd0b85a97d-439f81bd343mr6053569f8f.1.1773245102244; Wed, 11 Mar 2026
 09:05:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311105056.1425041-1-lossin@kernel.org> <DGZZ0XF0YYGN.1W5UIBXK16HL3@kernel.org>
In-Reply-To: <DGZZ0XF0YYGN.1W5UIBXK16HL3@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Mar 2026 17:04:50 +0100
X-Gm-Features: AaiRm51Rxg9U6-q_qux-w3-AwPBA5mUWrvAyhEf6VBVZZzasHDrWZRbvvZv_09o
Message-ID: <CAH5fLgjdiXMf=xybyf+d+_MWYv6r0SSw+dCNKOLoMmxDdMh9Ag@mail.gmail.com>
Subject: Re: [PATCH] rust: pin-init: replace shadowed return token by
 `unsafe`-to-create token
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Fiona Behrens <me@kloenk.dev>, 
	Tim Chirananthavat <theemathas@gmail.com>, stable@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 2:01=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed Mar 11, 2026 at 11:50 AM CET, Benno Lossin wrote:
> > In the face of Type Alias Impl Trait (TAIT) and the next trait solver,
> > this solution no longer works [1]. The shadowed struct can be named
> > through type inference. In addition, there is an RFC proposing to add
> > the feature of path inference to Rust, which would similarly allow [2]
>
> NIT: I'm not sure if the sentence is supposed to end here, at least it mi=
sses a
> period.
>
> Besides that, is my understanding correct that the changes mentioned abov=
e are
> targeting a subsequent Rust edition?

I don't think it's currently clear when/if the changes mentioned will
land. But on the topic of editions, it's worth keeping in mind that
macros don't know the edition they are expanding code into, so the
macro can't have different logic per edition.

Alice
