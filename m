Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D713C197C
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 08:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029467; cv=pass; b=gCMN42p+iUfvWLzvVUMuAYSZbYMN0r6zb2hzZCO7fTCB8h0UWBONZBFXKF0MAB9xnKn41wzZEkuADOWtV7cuhk7SQ9Bt4aiAkYi/ZReEgaSeQxHTrnxlqRzgxj4UP7Tterx5WU0bspJz+mVMSm8FKdN/uCwUdWLOWsHPgU72QRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029467; c=relaxed/simple;
	bh=sc9Cfq2daynLd+xZRF9G1RrBj/E/QZge6eVGxMNfuTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtpXbqry0exQlXznEbCfb+QbKcErPTS7aOnhIPtBGFeRMKJHJ3U8pnWpEgbrtX53/dbUwxX0B0ZzvX9e6//VtS3MTkbZ2H+M3zFbzH8uqXYuJuFNpnYUk2P8nFGBxCdzkkERYXPX4PQfsjwkAxjLqcwnrRt0UeqqDbbQcOXDjLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G6wfuOD0; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G6wfuOD0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-485850cbac3so4304705f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 01:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789029464; cv=none;
        d=google.com; s=arc-20260327;
        b=HfpQYoViubd+YaNdZRe7gAYhQQ3pvYP2JYaPwqL0T2kc3ZIMoHTkBXVvVCKIFRmPaH
         FzFjBlqsCZ91te/sS19FNj+7qzhcD1l+Vf6Vm8U1OZkCm8RTd77d5VMj6J2JlM5Qseba
         5QOEkuOZqJ95a+TvHq8ftkn/ePcYMua3H2eLqrszVW5u4/0w51boqUuqRg3fPxC1h4Qc
         K2Ru9B+b+qp2wBw1PoVoHdxtNhZJa9vw8wwTQ7vlUpsWYJ35SIhVkMlM5uZ8y4mhOEcM
         GGrv0G80m4pJBATfPuBkQXwYaNvw23cWSoKwOYpgK9qGM1gsWOM9MgSSsLpyhfdN8HXB
         VXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sc9Cfq2daynLd+xZRF9G1RrBj/E/QZge6eVGxMNfuTE=;
        fh=Tg5yh4I2H+KEwgwS7SxAWcgZJFekkV+N/F6+F0ULGls=;
        b=FYlAPR5CYJqPfKfIyXIHhKBJMJ9hh5houQSGgC2a6sDHsKAKopLxl0SmoiTj0fN9LB
         IwzLDaBIb1ozhE525sq3Hc7HhHEAc0Do6q4zulo96SqpO6rjg2aytlwSGWfNLR7xkfo0
         /pVP1tX84G2g9Jjf4kkl12OTsnGQvxPxrgoJYfrtEJcb1axChpiIN7S6jqQzbtsRgNZ8
         xg+dRU7BNWKy3y6RyOLWYeD0tu9gOctIzwkfxDqf0rLHABfLPqpu9DUFD0EbEI4J1BA2
         pBZlIIFWiaVknaJ6b5ndkeUf634QQxFmBrkdOupgT0eOFw/sCbYHTjY1DuwEB4rh6bL/
         wjRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789029464; x=1789634264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sc9Cfq2daynLd+xZRF9G1RrBj/E/QZge6eVGxMNfuTE=;
        b=G6wfuOD0GgeSMycPWzGkHC6pJtjh6k5UX+pJJaUn7LNZCxmKnblfjv6WmAsa3lnO1G
         NUCu27CyARa2+vMNtiHi6Jqw8CghBJmYYQSG6//H7GoFIoZGOXVMKubWcCOjQFLaIbrO
         gBCgKrDIE4Oafj64U9IhhNsbnYT8omxsKaMFb9a3mRPevZV34O7OHKjaiSqottHQ+Drb
         XKQ3fII+JTYuM1DvCSLzAxUhdbQPWmNkPPvEW/zyuvtXoRZmVcGu6SYXuQTLnkEPhAb6
         ioC9FP0WspoMVvQ8rTZbhHqStKmVJTRe0Nrq5OkLkixS85uDCUGZZZ8y7w1a9QQ71rFb
         hB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029464; x=1789634264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sc9Cfq2daynLd+xZRF9G1RrBj/E/QZge6eVGxMNfuTE=;
        b=pwMOuATAb5OgQNwWqNB/9ko6HRF8p9sdnqb2hEF93mUZ8WqFgC8vOOSGZmBYdt7Mi3
         7gZJgQup0qQEVQ6zNfE995O85O8KYBG1cRF5ixCWZr5lANBweitwFjNd3q2IqwIEAdc3
         19vVoywJ9bEfBQM9qj2KHTJAwV7ba0tdhGTBIey49hgFXr2vJTftAXn1g/U2J4OVs9JY
         c3YfCbQeEbAs7eKdnUxtLYXfqdwNqkgtYrTSpVVManFA0EwAcChtjUPnhkeior4MYYaK
         xsxzvJLwRAv+MBJ/w/LZu1HXkEJ0aU9TJrJ+FrCLU7oRpBkrua/Sq68l9g8aZoVlWrh0
         n/Nw==
X-Forwarded-Encrypted: i=1; AKwUvBwgzomkPn/tlCsBiQr9aKy1sI4+h6IzTze9+ogwuMnMtlx/gzy57qTZnfV6K28VgD5mw6WHXYO/2J/WI/nFqg==@vger.kernel.org
X-Gm-Message-State: AFuF++mJ1HLyyAe8faAOLjRA0BffeEgNND3rna/hSs/PUipwWeeHHdCy
	gVo0GZF9ReEidOsCRRtgnfVmUDBz+acSQANLRsA4dA7YOdT26R2UQXwpfi/tezDODQIVRvz0cmi
	LuhlUQpJ6sW90eDO01aRxrvcT07ExBqbAB+DCuiNf
X-Gm-Gg: AYBFou3n/daRrv/Gum1puOxil5lxqixEFrpg+reUGzaFiQul5hsBct5dE1xNAs3g6Ra
	BrnG4T0fmsmlJyirbY/u9zlf/Vai8OlnuH00v/tb6CjTpWEUbYzZWOkl4v7Egcfs/ntgNTqfW9m
	2nojfRIn5VO9pNIZnUSZGjoOfM/5Yg/8Z/9A6Jgy9JPs4pdHrZRWlQ3K3fiuWls9fFQNLKXj9fv
	6n3fhkMatdE/HaGpvgYCGXf2YaOpRe9E7dHrS8UCP7BQyUjLVyyJGTHts+rRay7o5ezehuz063k
	uRYvOvxaaibBhpApQc1dJPMztv552qq2WB4Vqd62jwx5ikONnHpsLczUhUeQWzSF/rvhdIG8Byq
	GZLLMlTIrkgR/DuodFmhj
X-Received: by 2002:a05:6000:4a16:b0:485:8c16:a361 with SMTP id
 ffacd0b85a97d-4858c16a757mr37879090f8f.57.1789029463048; Thu, 10 Sep 2026
 01:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826131213.1820408-1-beata.michalska@arm.com>
 <20260826131213.1820408-2-beata.michalska@arm.com> <aqEox8rYYBcfxtrN@google.com>
 <aqJqICNMitP3JTJw@arm.com>
In-Reply-To: <aqJqICNMitP3JTJw@arm.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Sep 2026 10:37:30 +0200
X-Gm-Features: AcwNN1XzpH-G7K26BQl6iCpALzC0tIsAPD3Utlt434iR5Pwrv8_DVtOsPo8QrAM
Message-ID: <CAH5fLgjWcO5fTn3fRwdt8Zh8U+AubtHfVuNOUCnm0U8HjJe61g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: add runtime PM support
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

On Thu, Sep 10, 2026 at 10:28=E2=80=AFAM Beata Michalska
<beata.michalska@arm.com> wrote:
>
> On Wed, Sep 09, 2026 at 09:37:11AM +0000, Alice Ryhl wrote:
> > On Wed, Aug 26, 2026 at 03:10:55PM +0200, Beata Michalska wrote:
> > > +/// Result type returned by runtime PM callbacks.
> > > +pub type PMCallbackResult<T> =3D Result<Option<T>, (Option<T>, Error=
)>;
> >
> > So I think my number one feedback is that it would be really nice to ge=
t
> > rid of this Option.
> Guess this can be done. And I'm assuming that's for both Options here (?)

Yeah. I'm thinking that one approach could be to use the AtomicFlag to
track whether a value is stored in the container, and possible change
the Option to ManuallyDrop. Then in drop of that type, you check the
AtomicFlag and only if it's false you drop the value. That way, you
can take the value in/out of the ManuallyDrop so that you can transfer
ownership to/from the storage.

Alice
