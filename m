Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606731;
	b=QiAxHPc8rfMmf5zsSDoxxtKhOfhhfCBG+dp52CoD6GcUKsdN+FMEvAVCuXblrcct+xKW
	 l58yYrCJrelLPZBLkRlCmpxW+5SEVr5UHFCyN8cRl1tuqjn9/nbgCn8d3msNclMr9eoS2
	 6jNzk08rXcgt5h1fA7M0pHUQGiamsCVbkSm0QjRMy3e1i1SL6ojW8Qsbgo+QVbV+IPyMm
	 f6iFosCiyYdzu/rLV7u7/lempTEsIKWXaZ/PdM10ucXyuUFq3V4k3/Fu3YetDvXuoOAld
	 42ZhIz72HAxBk4LYlJySaHRkPNwE+vJETwvnWrNwsoxVRwuhzaMeeyaJ8Ex54g5qXVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606731;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iAD+Ad7NT5/4uS4i5Ra5VqZcMWRddUP0s1yBjvo3Qp0=;
	b=a+vHAsiKqq44KgQP6rYvtXa7TOADfAznm+qjIl83/uXhEY8t/fJRSG13zpT891ipW9fi
	 V4/jALRe3CoLSrh31fNXotFOz7uajodwsE/6liGkgju2Gcz7NMSG3jjRiK8joVPJYbetb
	 0nefNlkdZ+nKVUA6y9cRUthVUQAbmSFOwdQERwrx3eS4xf+UiPVYiSJ680F0AJNgvHc2V
	 bAMzumuIJozlcrqS87T56DW6Si8ggXtr8IB+zcu6qiPDQtATm6CmNWL9ey37zKhxPMQM6
	 zk8w/UK5gn+CjNdwuko61EtAC2YnnFe4VzuRZXe3c4dnW5Yc1k9yqTlwP0+I80OA90w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=mFodScwZ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=R+UPbx9w;
	arc=none smtp.remote-ip=103.168.172.145
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42A9606A31E
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 11:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C42A9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=mFodScwZ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=R+UPbx9w
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id D3D5CEC0C7E
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 06:38:49 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 25 Nov 2026 06:38:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1795606729; x=1795693129; bh=iAD+Ad7NT5
	/4uS4i5Ra5VqZcMWRddUP0s1yBjvo3Qp0=; b=mFodScwZNfmtYTSwLaQ6w1ZaE1
	g/nJpbXdJq6ibWzfLs4pqaeFubKwyUM8rvlVE+8HunCNxISFis7OySN/XWvjd/X8
	he242huEmUDqZlF06zv9F63dcEmVk5TVvksQmzRBmrLP5LL4daEu9SmW7VMbGnPo
	ULQa4XZhIifW0TzOY+5p88v+wvNXK85YrZc29S7Zc2Aqku78b94A8UZRuYA1eehb
	k2Bufl0TreNi/R4+DZh+5wCJWcrv35I9Om3qCBNqpegr92rg75qJRpR/ZU8T32Ff
	EGtEviMjXASYGiZG6D6CToBcIewt20Tt2lL/7j6KNBXGbXzUTDrivODoTkuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795606729; x=1795693129; bh=iAD+Ad7NT5/4uS4i5Ra5VqZcMWRddUP0s1y
	Bjvo3Qp0=; b=R+UPbx9wJa0kfhpYxIZryz0kFZ/vtcHeB16R6Om1V3N575RePKP
	2y+TUBXI8VBwnIQ1s0A45nA78cYKmLKXjROrfTvNiY42PX07zhub1GEScys65+Y7
	KfBh5Ei+5jHa8GEPVW/E2SQQhwG3nwLmcCU1EzU45NksBJ+IBcFt6odp7XRXKCk5
	eAlyPUT1edV3StPgClcC2csQbNzz3H7LhWCTKJRFYEG2bgRd6LAHLqaXtLxGV1so
	hpdq5q60q/gM4uN3IX5B1Zxq5oi+6BFhdqJwOv+vAlW8vhqCHDAcSRLRIT9kZCaL
	jZwgiGA/mbUJqpAnKMWDtFA81AjCJUvoewA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795606729; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:4jqxM37MjkrqRJQqH92ByKMXlauszi70OoANFhYvDyUooVS
	IFGYsswZ3GNfy1zirXJVCWyKF8TFpGOvKWHn1uJ/7tMflaE2hCdGiu3/mlZIzphI
	H0HZzVTCFXgIBr4m0dmhasTQdgEcgb/YUsv0gMaCqMaSIIxf5K4g7mz+s1OgdVDD
	jK+T3lst1clINdwhXhGfnxYJICr8KZ6Vzbq34u7CVMRtKRROhcXpSRvIuDKztwXy
	PhLNG3zSCHPph79IWdT+hE5oofJPKyPyTUJmohjKzDXk6HWY1ZDBJJejE1rhbNsk
	CHlY0uaW7EyAPvrrQBhrGCPlwn5PSeMU+RDaVQw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:TQcZS0GE3XFOemI5U0d/fmAcYiMbdJkw43VVp64SP9w=:kvKhtlvYmOwozjxXOiNVGWZFpFm94DrmU31h+MpA/88=;
X-ME-Sender: <xms:ycgGa9SFdQl1jQ4jMEo4K33bty-fwVkyXMjAE3nbb9j2F0d_WvUUkg>
    <xme:ycgGay0ktdFn8uwp0901WY5xHlbzReDsMBl5HOw7JxKAWoFhLs92EAZEhKB0QrpRx
    1ppgIf6Eq5YBsalwq5oaNko8PiKJzRqql-OLYmer66gZLiN4YRTf9w>
X-ME-Received: <xmr:ycgGa-LKi8H0ZQ2xNZAMaeOYLl9DjlPkn2MeV5mIYQSlJ6fU28KC6xD1Zrx_KqvQBstRKioop_sSxKHtDcTW4FR-cnl66AQ7q2g>
X-ME-Proxy-Cause: dmFkZTEbReCOWvmoFnuw+QSaZ5Gsjwx+kckQkxqBv+HHd3snXsECRlQfnwZpk90zFsExLW
    aOe3walW+e+AJA8K89u3mwa0DtoP1NOon/UrnuIhMgCYGen63cQbsifY1HoQNgozbgZnRC
    I6hZylZlOl4/iMBbJuJXOTvWar4dYI99WblysqeihImVHE5J6H2NOxEDcqP7+68EFSYF3t
    2flf5Fq5QfNHfbYFMyqM+0e+0/b4px0j1He6PUzHNZZqu/s/+0wFg/4UpRUzGdPguePBR5
    lRUTUUOcJrAZtXQwndfoaYb2LbS7L7cdx85al77wXWPjxIWByF4PiMtngYUKn8WKWpCYko
    ApBBPKIp2rv/WjBxikjN05YpYBPbuY8m1qB/fWo5VzXUDJeQvgwzhMMgwQT+mjLaY6dcTX
    24ZKrzekUUwa+RPclb0OR1tFi3Yyl660g+pnx2KIxSTcx2UdZXia3XYOnycTQNvqSv9xFx
    6PXafimTY3wjkX2tEUAYW4VJVb3/6p6JNTjdp+Mly1KAegrgGfr8YBI7ttAQrNX7iV7mLE
    1HQafjFoMn3nF4+gppa+DVvAYw7hvN79cbCgAIxgfiCgGwrQSDNy4AaycHPTbl+xEHshl9
    sPFlJI2qOyiHc47Er4QnDzVpL4yR8b0/Pa/egV5EZzPwcDfWRihp/avTjF0g
X-ME-Proxy: <xmx:ycgGaz_LkAnW346zBRkPrkmzmrYtIXAmhy6l3F15NR_DCuwylDEBLA>
    <xmx:ycgGa_miN0qCr2OHOlx4b31gKmwpn4ha83CoPlUgMskzThYdZgsBuA>
    <xmx:ycgGa-UggBgCpdncAGhg2qtsEu2521-M2h3H83DiPQCHnrAJRqkBTg>
    <xmx:ycgGa7p26FxlB1JS4YBKmGoCfufx2HTDbTUcp6JUS2-C9quo62GWlQ>
    <xmx:ycgGa4fgz3mLSTN1-f7K6stb1uiD-XaR0N5X5piWrEojxsM2gxPpIkOF>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 06:38:48 -0500 (EST)
Date: Wed, 25 Nov 2026 12:38:46 +0100
From: Janne Grunau <j@jannau.net>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sami Tolvanen <samitolvanen@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev,
	stable+noautosel@kernel.org
Subject: Re: [PATCH v2 3/5] rust: drm: gem: shmem: Implement
 prime_import_sg_table callback
Message-ID: <20261125113846.GB372978@robin.jannau.net>
References: <20261124-rust-drm-gem-shmem-imported-sgt-v2-0-000f7a9ccb8d@jannau.net>
 <20261124-rust-drm-gem-shmem-imported-sgt-v2-3-000f7a9ccb8d@jannau.net>
 <awXA70GWssuU991c@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <awXA70GWssuU991c@google.com>

On Tue, Nov 24, 2026 at 04:53:03PM +0000, Alice Ryhl wrote:
> On Tue, Nov 24, 2026 at 12:37:45PM +0100, Janne Grunau wrote:
> > +        // SAFETY: The DRM shmem helper only invokes this callback for a registered DRM device of
> > +        // type `T::Driver`, which is `Self`'s driver per the `AllocImpl` impl below.
> > +        let dev: &Device<T::Driver> = unsafe { Device::from_raw(raw_dev) };
> 
> `drm::Driver` in `rust/kernel/drm/driver.rs` currently declares:
> 
>     type Object: AllocImpl;
> 
> without any constraint that `T::Object::Driver = T`. I think we should
> introduce one similar to how Driver::File constrains this?

so changing it to `type Object: AllocImpl<Driver = Self>;`?

I think it's hard to get that accidentally wrong but since the change
relies on that constraint and we can express it sure.

I added it locally for v3 but feel free to make that change before
pushing this series to drm-rust-next if there is nothing else that
warrants a v3.

Janne
