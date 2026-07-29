Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch [83.166.143.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDCB47CC6B
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Jul 2026 12:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327159; cv=none; b=FoJ4Dem8pu6yRQH0BnsvhojP9JBgjfgOdaRYOM1KKNCWveRsYwtbXx3lB01hwHjWUC7Xs0BJmKeB9V5YCnXV0ijEtqYCGDb6sTkiJxEMcimJX8aid526on60+r3Vl3VqdE6EpgsTI9k4ZLN9HB2u1qtT3p+/eZnoo0DOAWuxcX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327159; c=relaxed/simple;
	bh=76in1GjWNLlOlP0uaHCT03/EpP1Uo4LBVjEQfT2jkCo=;
	h=Subject:Message-ID:Date:From:To:Cc:References:In-Reply-To:
	 MIME-Version:Content-Type; b=J/5Ipj4bOPX1GEWs/jwPiuZpEfh7EGxjFpGhlyhk3cTgt66++ezapOJbOIaugMH4CPC7w0tvrQ/yNZTXoLflyjZriHQ0DR7r5zf71mawkVx9faz07+x9YLO/dOp21x6WMc77WWdTXskmAuvfVVfGRL671PAiYoA46CDalOCGy0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me; spf=pass smtp.mailfrom=ik.me; dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b=rcUc2SLJ; arc=none smtp.client-ip=83.166.143.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ik.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b="rcUc2SLJ"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4h9B6L0XGlzVsQ;
	Wed, 29 Jul 2026 14:12:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
	t=1785327145; bh=/Mf6oc8o3rgfoSd5qIUTbDR7145wWJf1XLsdkjAYlNw=;
	h=Subject:Date:From:To:Cc:Reply-To:References:In-Reply-To:From;
	b=rcUc2SLJbe1wzDhxkVtnNpyfZuacNYzGkoWzztqh41/Q9OMgk5a1JTmH9v/vlMYLn
	 6IU7fZUwGKjqot+2Qsy3EA/CfVct3kB0DTt4baZ+z8izxFAfL8cY4mMilelunAAiTR
	 c/HmWP8hggNo+QgRqxxaBCn3XHlN1pU5unx6SNvM=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4h9B6J68gszHKs;
	Wed, 29 Jul 2026 14:12:24 +0200 (CEST)
Subject: Re: [PATCH v2] drm/tyr: add Job IRQ handling
Message-ID: <9cf1107a-3dfd-43a6-9f25-d8e01595c9e3@mail.infomaniak.com>
Date: Wed, 29 Jul 2026 14:12:24 +0200
From: Ewan Chorynski <ewan.chorynski@ik.me>
To: Laura Nao <laura.nao@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Alice Ryhl
 <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, kernel@collabora.com, Deborah Brouwer
 <deborah.brouwer@collabora.com>
Reply-To: Ewan Chorynski <ewan.chorynski@ik.me>
X-WS-Location: eJxzKUpMKykGAAfpAmU-
References: <20260729-tyr-irq-v2-v2-1-c2750fc11d59@collabora.com>
In-Reply-To: <20260729-tyr-irq-v2-v2-1-c2750fc11d59@collabora.com>
X-Mailer: Infomaniak Workspace (1.3.1317)
X-WS-User-Origin: eyJpdiI6InY2WER6UW9XQ0puUVJCN2l1NTVuUnc9PSIsInZhbHVlIjoiZWc1OFV4dktJWFJkWVlIbkdCL3h0dz09IiwibWFjIjoiNzVlMDczZjBkNThiZDVhYTlhOGI1OTgyYjU3ZGE5OWY1ZjFhMTkyODc0MmVmYzU2NzFmNWY1NjE0Y2IwY2U2ZSIsInRhZyI6IiJ9
X-WS-User-Mbox: eyJpdiI6ImpKb3dxUHpkZWZvSWpyaW4zaVo0TlE9PSIsInZhbHVlIjoiWGVwbGprK1RQMkJqUVRsS1owNU12QT09IiwibWFjIjoiOGE0OTAxZWJjNDU0YzdlZmE3ZmYxMTI5MjhiMmQyYzBiMDBjZTA1NGU2YzdmZDE2MGE0YWQ3NjFhNDI1Y2RjYyIsInRhZyI6IiJ9
X-WS-LOCALE: fr_FR
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Feedback-ID: :b8ff05a3410f642:ham:e74197f626dda86
X-Infomaniak-Routing: alpha

On Wed, Jul 29, 2026 at 11:58:29AM +0200, Laura Nao wrote:
> [...]
> +
> +impl<T: TyrIrqTrait> TyrIrq<T> {
> +    pub(crate) fn request<'a>(
> +        pdev: &'a platform::Device<Bound>,
> +        name: &'static CStr,
> +        irq: T,
> +    ) -> Result<impl PinInit<ThreadedRegistration<'a, Self>, Error> + 'a=
>
> +    where
> +        T: 'a,
> +    {
> +        let handler =3D try_pin_init!(Self {
> +            irq,
> +            _pin: PhantomPinned,
> +        });
> +
> +        // SAFETY: The resulting `PinInit` is not leaked, it is consumed=
 by the caller to
> +        // initialize a pinned `ThreadedRegistration`.
> +        Ok(unsafe { pdev.request_threaded_irq_by_name(Flags::SHARED, nam=
e, name, handler) })

I think your `request` function should be unsafe with the same
requirements as `request_threaded_irq_by_name`, otherwise how do you
guarantee that this safety justification holds ?

> +    }
> +}
> [...]
