Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795773329;
	b=O2PAFoNhFpVhFb/1WWTAt+MRIIX0g0ACL4BHPcjATZoNJm4l28n9HXJeAnIv8jyf8ZZA
	 4PHmpnNXdlfY2NhMoXrkLd0KMG9lJ/vyl/NMw4TeXFRSTugbRrIpigGegjBYZedcloW59
	 rIze9I2j9sUGQ3D+89vwemo59COSxgp/zq0xcIA7VwRS5a+EtFFqOFiX6bV8diA7qy+DL
	 h5IoVI9cIYZfgjKqOxTTK70wh43UFbACKZCusO9Y6BVAMKN+dg2obkTOdujeqQkqz8BpK
	 SczqgIfoqEPMPrSCHhXUi6Tik5snQd1Xugva3TXoQJGDf2EXQROKWEnhOzf0PUpJDXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vpy+L8ilFk/xVj47uBuvADr4xljwNe7U/d1k7VvtaJ8=;
	b=H3sawAdzP76ajNPfmXWh+Om0FdA6GAQQTXKiOCwkRcOeI5dD6jtoEQxTmOIT6UoEdODM
	 zgIiC0AeSyDVmguTQqX6PAqYt+/9/T5Ohjy/meHURGMJLkQcJV1bE7ShSUXzsv43RSZhg
	 I4RfsH53CHNYOQF9P/1ss/K6VbFdLHuzYly9Rc6rv/aeiF3MHhqzTlWhYNI4CdNgDMCZ/
	 GTIoLJXz4cTuC6W0RRTrTt+gOuwmjhpuVQc90sYI/C5BcnzambtxgAfYf5YKL7dQf9X38
	 b8w8gnXAjE9FIJ6tUCPBWi8UmZFF7ZW7/NIuZZ2ABLRnwXojvL7UMqsz1WLEiSF7wWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o3OSRhaw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B9E606A681
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Nov 2026 09:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B9E606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o3OSRhaw
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a9be758734so4980595f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Nov 2026 01:55:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795773327; cv=none;
        d=google.com; s=arc-20260327;
        b=YoAOWA3xNjr3QjCyDzsNtCzY7U5PKSyxoNEI+wb7HVXAhb5WPtp3Rp2+0z5QUB05qj
         iah9WECXNugimLo1F3FdU6pWxCNgKQXPVOMgrboEUg8YolDo3vkJ/WZrXkJnbKzrucJm
         Mju8IpgVqHx1cANmiRaVGWc1nrxXO53GS/qSjySqBxrIjKiNO4Mtk2DcZyNtFJGYOfYh
         yTlsw2OAvchptik3XnKU/RkwBuKhrs9B8mqOCddfIZ5YIWU69o7KJji/amb4p1AErAlr
         6sv6j2FARTFukIrUT1IcDTU6yfi4QEr4meEHJ/BZ0zOQS2Nkp3k5qW460WfIr/SZmgWh
         E/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vpy+L8ilFk/xVj47uBuvADr4xljwNe7U/d1k7VvtaJ8=;
        fh=hJXA+mf/D/alW/cWklxTir4QRU6vVUiaAwABHShGVQs=;
        b=O5KoQZ8A0uOrbNXrFVJBxR1EdmnlP65tk9YAEvJ5ma70r0y68WMVxbdOzna8ptSKgP
         gEIATH1zQne1K95gOQxE2cF0N72wipYr+Si0bvrtKkAKa72zyFuYAtPb2SpodRZR8Vio
         zjuFqySgaeNi58lB77SDuo5bKXxSJkLyQho8C9BtTpP+mJIPKJ02Bg2MbHbarW5tHYNa
         7vx0uwzbntmQipASvOV1xA/xqo5RmMe0oRxeWsjyYknY7OnIoB8nhEcMxWq27yKtlrc4
         fzY5w5YRhplbnYaPlZByfbfkPR6dFj0OuWioWqWHlhsagqibyXBvM6tFfunuujlaK3B6
         ptTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795773327; x=1796378127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vpy+L8ilFk/xVj47uBuvADr4xljwNe7U/d1k7VvtaJ8=;
        b=o3OSRhaw2QYcXwmaZ3dSGH1e18rCjmoO4Up/97k1PFGYjLm4Xa0qKyEVQesQPMEaAN
         DIUz1VvKO1keEcutO8WSM8HhHMKVxKc+E3vOtmXZMWf+65Xnd2flpMmgdVNmYBt0HzXz
         RoOeiEXgzTPHfsd4d3V9Xk24iQs+ovcjlDS7aP105p6QC+18Ki01aiQHNXDjSBsTiA8I
         qkAhtY6jPuD6++aUisGf5ItXnPYUM1L6PZwNePjh2NGKd2iDWtec1XxoQtEoV1A8nmaO
         xjvCzcw5f2Zk6DEzSE2Z5dGdNbYrSBC3trhGzD0rDrRYy7sCwLeH5gMDXuR35+Vg1/bf
         +TsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773327; x=1796378127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vpy+L8ilFk/xVj47uBuvADr4xljwNe7U/d1k7VvtaJ8=;
        b=KPKGIbW2zOxHX5RrpFpkhSVEObjKG1+mdt8D1N6u7wQVsXJiwlYZWivYQg4wEIl0Zd
         x9PPAbUR+7twuZIDeLbGJl6fIPlhqG78Brvjp8gIbYLwQvUBgNNHH5NHorFv1fiyxWMx
         2bqlJc3fGwg6YrKPNXRxT5E1OVWxHB+rUcQq91ZilLXaE+zgbl0SchCNicT/dmnrIO2o
         CJQkMWxY6t94BsmK4BrXQRo5dsZHQqa4R/r4m6CqLzbT8BoFoY/aJrdwmB/lXcR1hA/C
         nNAaGtBGR6has62DD02jj7k+mx3/xwuefKqskdU6YIpb5s77jqnDP5D3XQ2WsNAVB99H
         ddAA==
X-Forwarded-Encrypted: i=1; AL+hErEVjpzccqQRCnrTkq7vDGuT3RMQjYCu3AmQ0GkGWQLHbIfOU0wnWK6WtfDzk8AQbnGB4zbrO3F2gUjtKwLxXg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9azMepF9HYsODq7xKC2n8C9O4GsL0eWERdP+NQQbJaO3AbnIap
	P6aImpL0xU7CmU1HddCZuGdobBPF+Czo+78Tc5tQFkmXnTQ2TWo+1UHW+IxgzPZmtv7ACcuAML7
	8F2igQtEvLANb5mvdNojaF+bBQjokZwoWwXLJtEyb
X-Gm-Gg: AZFdTZcJS0VAcpYdP5/aU/wtlrr+PaLS9diJyC+QOHLo/UPjDi0TX/u2faHHWJxIM4s
	y630ET0dGAO1iP/2k467wLsCinoCVNYOTkDHxMb1oQSQGPi3lXyh1+EiOJ6H6GKA8RiZDslu9zj
	gs1Xe3Ak8kqyrpxhz/wm+fP8R94z2zU+K4OdNM4fiIPummGrGeSANhBAN6tseZYaeoopDF7928i
	WDPq7fyaBbqbUwPrgjtjgEx8JXO28vHylsHcbF+QBjuOmADSBxgTCHtQ3udTSDsHJ2ONWWx0XY3
	w+gxwmmepxxaAfB4KaDU4I53KbAJuGY8fDP6pBYwLb5xSW/y2oOo1kLO1tVn57qobQ7GNv/APgC
	+OK3Dj+1M0TFmiyVx8ySiJiVQ7p+UBcw3ag+pPn490Cy+Rtced9VySiHRqhvvJUBZJDKK4wXTFw
	mJVqd2jFre4GlvnYpmJ0G6lco6EXfizxoqu4IGSgp/5U+w
X-Received: by 2002:a5d:588b:0:b0:48e:66d0:664c with SMTP id
 ffacd0b85a97d-4abaf64be12mr50144469f8f.15.1795773326393; Fri, 27 Nov 2026
 01:55:26 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-rust-drm-gem-shmem-imported-sgt-v2-0-000f7a9ccb8d@jannau.net>
 <20261124-rust-drm-gem-shmem-imported-sgt-v2-3-000f7a9ccb8d@jannau.net>
 <awXA70GWssuU991c@google.com> <20261125113846.GB372978@robin.jannau.net>
In-Reply-To: <20261125113846.GB372978@robin.jannau.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 27 Nov 2026 09:55:14 +0000
X-Gm-Features: Aa3M54oiZNSDgmAEoH9NzLLBRhpgjBRE2cJGZY4MeBf6M2cJPAdsD-3P1zcRduo
Message-ID: <CAH5fLggRtEUopYT0ZacNvczLRTNk4sKDrE7q-isgW=MDn4mqMQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] rust: drm: gem: shmem: Implement
 prime_import_sg_table callback
To: Janne Grunau <j@jannau.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sami Tolvanen <samitolvanen@google.com>, Lyude Paul <lyude@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nova-gpu@lists.linux.dev, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 11:38=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> On Tue, Nov 24, 2026 at 04:53:03PM +0000, Alice Ryhl wrote:
> > On Tue, Nov 24, 2026 at 12:37:45PM +0100, Janne Grunau wrote:
> > > +        // SAFETY: The DRM shmem helper only invokes this callback f=
or a registered DRM device of
> > > +        // type `T::Driver`, which is `Self`'s driver per the `Alloc=
Impl` impl below.
> > > +        let dev: &Device<T::Driver> =3D unsafe { Device::from_raw(ra=
w_dev) };
> >
> > `drm::Driver` in `rust/kernel/drm/driver.rs` currently declares:
> >
> >     type Object: AllocImpl;
> >
> > without any constraint that `T::Object::Driver =3D T`. I think we shoul=
d
> > introduce one similar to how Driver::File constrains this?
>
> so changing it to `type Object: AllocImpl<Driver =3D Self>;`?

Yeah that's what I meant.

> I think it's hard to get that accidentally wrong but since the change
> relies on that constraint and we can express it sure.
>
> I added it locally for v3 but feel free to make that change before
> pushing this series to drm-rust-next if there is nothing else that
> warrants a v3.

I'm ok with adding it on apply if there's nothing else.

Alice
