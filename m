Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F394E433F
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415123; cv=pass; b=rIhk9UbrJGUskv+CcJfJXxXJlTdZaBVawLqVuguiwo/4LJn86M+FflgA0DLcViWfO76sUBqxbZm3Q04Moa6qxkHWGeI635c+CUJ9Z7sqVHNS6kdzIeLrb0dqaiUePzZ7P4RnuPvOZK667tgsvbXN9RqPvtQSkSsq7KZCF4E3uII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415123; c=relaxed/simple;
	bh=mysYr6A8Sr788QG2Uz+xMwHs9QNcHlODUZov9aP5+dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDAz4lUjmsk+EniCOTDVhSK12+Bs75IhmLKG5JBwRcnlTwl9yn3TYRC86qOoiMT1szpIlZlov9knTUov99NYOGYE7Rytw9kWMSqARdE1noF3fIqFc/QWeI/TVzSROAvrrfkWfbC2/EQB+YYZsdorfyMxVwgj9d60MJ7h0DRnzfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h06ZJxSy; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h06ZJxSy"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1169221f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 06:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792415120; cv=none;
        d=google.com; s=arc-20260327;
        b=a7V0/IwoNsenqfS+98xcj37biJTu3RMBT2eH1OcNY6UqORXocrMCJDd0/wpGOK0jeN
         RBEnT+xNvYHZgvAhglbbsQ6ZlJnFDW8YVkrzEO9DKLokYjqknorpw7gipdXJhrVcUW5Q
         eBLdpAU/jeXdrvbv3vlrtwquBOF5a1Qb4WLINqBCxq03Wk3AxiAKjITtqQKqg6wW7aQt
         gOyosnqqdiozVzdXQwejaJgplsIJQ+7APpqqh3QaOLOSgHvxDZxb8SHAORe+vjD2VxFW
         U36R85wjnvmcQNhtjSoH1pcspvp+6bnYzEp2QzzzLzvQcC3Vb+q0TXwZGtceiYfH1Ey/
         3WqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LP568MdjFLUoc9cCkTY7fbjg57xRLci7XApvAwiXZXw=;
        fh=RuPwNsJ82pd6YpwqXdj/7YkyYRyjiDjFMU0qdxNCY00=;
        b=JTyHi3x/jhdOohTe+rqV+7OXy5mnTjYLBM4phGfQ8ur2HavMXHuBRtE9kLL09rVUvC
         6IlMy4bF8teqBPUUl+8kmPtgwoJI/HQV4j81r9UBeojnlXKzv4HQh21QsX2VnvgTmBx+
         tIBv5EA3CFQWkGk7RTS9sBgUHquVsXiq6y1h97ps0KpGH/y06tlDgvZYwuhXnJRzQH9x
         uYm33STx/zkgkuE3B5d3SMbenT7I2tBpRTY9EGEex+CfVddpUJA3SsE86nm2AEFIi34m
         14uXIxgN2umL8PqVStJtvtC9RYMFQ/KT4Rb4Tm05GAsfZTgbp/xgiPnvd2Ni7gVsqyjf
         8Udw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792415120; x=1793019920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LP568MdjFLUoc9cCkTY7fbjg57xRLci7XApvAwiXZXw=;
        b=h06ZJxSyJzHBkIkdcJrxbNDVG+79WZnYHCG7CZghSHyk3JuncPcIX0DSVEo2rZirWI
         RntnJqrfhocZDDvG3ouVtrToUHIOwWxe5uPTlGvA8bpmrthXIDs3h6cPB13yJoRQzi9f
         fW+ugKZE7rVU2oTunNnRhJ6rijSpb+J4erCw4AWiva4/Dz/PTsFyDoRQxGtEVHDy5iA5
         7Qia34acg7wD10Usz1LMGHCuDDSYWXVaX+UjtEgBxgHeSwaRfQJawzdio8Q2lZbvnl5O
         JVsZY9jRlggtPesKO6coon5Gs/JQlscflXNzt40MXIJySv+GYrU9WC8beZ+X3b1cQ4lC
         2a4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415120; x=1793019920;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LP568MdjFLUoc9cCkTY7fbjg57xRLci7XApvAwiXZXw=;
        b=b71Dk52t3oGXnJqSn0xldwBJwNO0XsBcbjpg5rM5M1Cv1yYVpaZvZVyVwqppjmA41e
         kqyDdZILI99RBhTiBQ6zlRcHXkDY8KidzPAzH2IoozrLTSfw3wrmsZT+2aP4s5taM+fW
         rWGXJ6E1WtEJQSTsgR9fi2alEHMynCzYOKP5NmBmSoR+quex6MHTstb8yBvG9uX6gPxJ
         Y8+iNJrcHkc5ex8TX2Tw5Zgdu4XjwJ6iPc4uljMRqPq75ApPebgrqHDA39Sp7NafTqxE
         Glc+Mdpgy3ESOpXadP3q4mdf4tMyEnYgYHbsD9WkqJOn7oQM+Dp3/C21kxgB6l8WGh9A
         0jeg==
X-Forwarded-Encrypted: i=1; AKwUvBweFRz+NegmocHgINMtKGmhMQHYF+XPglLHE6br+ED4XbY1vB/HGGOeluuo6OwBh9L5BgLWG9NNSD6BMFwboA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJDHAdG8X87v9DSFdhDzhKJ66bZ3+PMN/Zcpj7HfWb3jsSo1wyC
	nMxdU4gAtbNAitS06mmtWhdBSn72vhKIraQunSmLkjoUQvVLFkyJFlYFUUQVCJnJjJdv6K/N6zH
	cJqshgGkYhyA7qIu32jaNswZG4Wn/Rm7ZZyePDbGi
X-Gm-Gg: AYBFou2l/FRg740AX3CQbLzf2epzvce0xPkBAGs6akzFdNsl3A7S9aERkdk7U+zU4Cj
	ZqbJhvTEwrLCs37xFBfT0A8VfWOQ8vx6EJTqG5iIdbQ4gooj3jlqZz6Jd9qgmGqjT10LcPuDavP
	DQzs91oUpxI/8a2lPnG+AShTkGMOAgsSwnX/ZyOeH6Te5+MubY4Y0DoeOfO9NWDe8yw8oTrKszx
	vVcgikGyu0uguC77g8JFHKVVVkRRFtha0lFclTfX05sUwANWsR/rv2krlBDZpw/xhSwQqGcJwes
	LRqRMBAQfU4GCrwSOYNoaJuRdbwqUllO01h8w4WQ9vZDIRRDWQ4K84pIokN95z1SEVl5pu39VL5
	vt4B4kpvXewA+sTTdQLQftnor4juaQzaOG4xU30m28WH+s4agGyqI
X-Received: by 2002:a05:6000:4025:b0:485:8c17:9764 with SMTP id
 ffacd0b85a97d-48e07fad8c4mr14437246f8f.38.1792415118156; Mon, 19 Oct 2026
 06:05:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005133857.1572243-1-beata.michalska@arm.com>
 <20261005133857.1572243-3-beata.michalska@arm.com> <20261016121230.3724323-2-aliceryhl@google.com>
 <atYKvHQm9qJ9wY-e@arm.com>
In-Reply-To: <atYKvHQm9qJ9wY-e@arm.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 19 Oct 2026 15:04:43 +0200
X-Gm-Features: AclHuK_TBh9nrF6wdCskikKjrKbXbBPQNYzprNDJUvoT1849kJ0giuue1RmdKZk
Message-ID: <CAH5fLgjcqHJs-mVsmUVwatyap7BOKU+k6LiAPFkqOcqC3soB3A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] rust: platform: wire runtime PM callbacks
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, dakr@kernel.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, daniel.almeida@collabora.com, 
	boris.brezillon@collabora.com, work@onurozkan.dev, samitolvanen@google.com, 
	acourbot@nvidia.com, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:19=E2=80=AFPM Beata Michalska <beata.michalska@ar=
m.com> wrote:
>
> On Fri, Oct 16, 2026 at 12:12:30PM +0000, Alice Ryhl wrote:
> > On Mon, Oct 05, 2026 at 03:37:40PM +0200, Beata Michalska wrote:
> > > @@ -223,6 +225,14 @@ pub trait Driver {
> > >      /// The table of ACPI device ids supported by the driver.
> > >      const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> =3D Non=
e;
> > >
> > > +    /// Provides driver's PM callbacks, if any.
> > > +    fn dev_pm_ops() -> Option<crate::pm::DevPMOpsRef<'static, Adapte=
r<Self>>>
> > > +    where
> > > +        Self: Sized,
> > > +    {
> > > +        None
> > > +    }
> >
> > Since `DevPMOps::pm_ops()` is a `const fn`, can this be an associated c=
onstant
> > `const DEV_PM_OPS: Option<crate::pm::DevPMOpsRef<'static, Adapter<Self>=
>> =3D None;`
> > to match `OF_ID_TABLE` and `ACPI_ID_TABLE` right above it?
> >
> It can, as long as no one would mind making the Driver trait sized.

That seems fine to me

Alice
