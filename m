Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792507040;
	b=5W8E54DeEhtZbHVmJnpxwR9BgOYe3HAIil8TjkcGE3iaBgCUJpZ+ZVpDa0i0lgyPz5/z
	 y6QTQ57XaSyP2c39bl54C/ZTya41DGM3cikh/+1rtP0HSJdtvpu3TPQa04RV5IjngIfvi
	 5TUNRvTVk9rB6bXth9wI2L6l68umkFGoseDhwksFHWIuBAjArqKh1LKmCDax4w/0nzg5/
	 jdUshjTsHDfA+TFs5I/rzQ1Reofnd68qTfjy3jWo6goh7ORMZA5c4yr6/4kKZNLhHj5eC
	 4yljsTjDH1R4XbusO11/HXWL+pCsOSC+TwglDYM2DiUDOOyGbnqLepAySc12gmiMRug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Th2n2oDQlswuf1BVeMTn3nKsEA75XKAvSzInb/NsZ8c=;
	b=s91/IwiKMZ+ArcawREPX+XiooEGipy910moFuTTDWroMcJZfTki5c2LteVLsKwsqBJPE
	 gylqFwpsDQoQSGiEzACsgORj5YbrlmCJKwye0p8qaXmZmSM/6jPHzZBgZNTrZzXnkVXYx
	 /sCApq9hTt/cG2XRTAXTS5dwauGgEqDKwY2cIBgJOrQB5mtclC6oBfehnCDcdxKEcd8Bt
	 GpUPFJk5FEmMonSuAmiwZqlrqVai/5/+DpFibhiYjOz6nmiJ6P43twpaqVXMuw0P924Z6
	 wNso6wV5kUUkt5qKSX+rwIIQ42sHW+tCw3orDgr8dCS2SA6Iohu2yWPU8SjWUlRiTfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=darkrefraction.com;
	spf=none smtp.mailfrom=darkrefraction.com;
	dkim=pass header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=BVV+jDr3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D730606A327
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 14:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D730606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=BVV+jDr3
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so4731770a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 07:37:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792507038; cv=none;
        d=google.com; s=arc-20260327;
        b=gFuxbfy/wyJqjvAvUnooF+xo7Vid5fkNvbClRniKAfFjC+Rda/CDPlUIEkEx7up620
         O3uOw5KiqQBoMfLh19sVXajk3SSitF60fBUwdNr4XyG9gvRzDhu7nFxgH/nDHdqNcHh6
         hYV39ld+hzxUp8MfLVs1cAVYgQceOLUTIinxVu2Pcgr/oNTjShMA6si7YNP+zgLxex1S
         ZT3rCKj4h5aK9gMf+v47nGN4XEA/0lX6aS3yUx352EYH4qRT8m5653q6B+yFNMP8vzaz
         P5WMAaYnfhM4UM3UIHxza1PvfyEUC1+sfXxEuMLvb0lZdgJRIggR4sbl7QbQ/WRVAbbe
         XC3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Th2n2oDQlswuf1BVeMTn3nKsEA75XKAvSzInb/NsZ8c=;
        fh=eV3J6vvzaCqd5kIcCCHdhRQw9GurY5eYjAhB/7p1oxo=;
        b=SsPlQKir4olLK8iLuWOMadfIrbcyj8BkaYouZ6ofvm7i3zRAIIDhc89wOV2ro0ECwP
         Shve+YvVLeGNL/D819WjZo2fPXrxznmUCO77o+7ZgTiigmlGmtoaYop6tnVB36G1EJtv
         VVJ98wp3y2gqguRDX7jVUJ4mWYa+0xhuT1Yy+REJ1K2VQQljNykSyEsgCzkSxujhR/eB
         r53pvCOqiNum0Khvg+T3S9fv1qxWFmUtcKgEOvckK9495PbVhxy5mWMvhjK7SxNO4txt
         adaerb9UBu2gAehYngEBw0UJaOzeG+AVW29NFaCOON8iUms6OIhZBUmAp7nUB0VB7nY0
         NKcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20251104.gappssmtp.com; s=20251104; t=1792507038; x=1793111838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Th2n2oDQlswuf1BVeMTn3nKsEA75XKAvSzInb/NsZ8c=;
        b=BVV+jDr39kq9xQAt4zW9F4V4MqWNkPYTmB8dBYlAz9dfsgsrgWyEXmHbyt6ce7UQ6Y
         uRRcJdnQn/gj3BaS37nMG4XQ0bjxP5ab5Qod9r5Tw9OR1BZEiBt01MOdEacnKLrZkuG2
         dCNgRuN1J0rxMYC227whOuYb9CAzSmB/Pzf1iyBpAr+9OMxz3JIZEfN5L9yaUqtXAFBG
         Fb8pM8vXtGoKrFI5fCSYIOIKyXAheJ38Y3x6K/Q1Cjl9pn0d0o2hjgqnX3Qu1WF106Et
         sZRt8Ss8H+gYdp4J0T0XyJAFc6td/4MRg3XCULQbphN7311/dh/+cZ5h9NxBiI6G7/5u
         l+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507038; x=1793111838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Th2n2oDQlswuf1BVeMTn3nKsEA75XKAvSzInb/NsZ8c=;
        b=ij2DUBn0yI8Xo391JlcWEVI8goC+0D8LKwodYvDbmAhBD2I94/UuMVgNFdZn3l1eUY
         hVhCpKycGoxxEyj1Chk3eLLQmQ107d1O7QLuYtPduIZkpuDMImTulTSWfs8KrS9OlLdL
         tbEcRUn4eXTeLXIZlxQBO2wbeDq/4UPQtZtCMIaiMPddAo1EcnxpVNM20AbAxnFlweqH
         a8qXvzzHY3DijF1XAOLDCHXQ7G1PACGlmfnzSGAE9Lmn9OCrTCutNBOHopg+SCuN/+Ml
         grqCM2TV1E9Ga3mNxMlTzkJer5Z6HjFKlAPdELzMpP59orl4yIp8Wzth00Wn+vsIBy8j
         bFuw==
X-Forwarded-Encrypted: i=1; AKwUvBzrS+X393+LxrudF59b+qAq0+dNd9JsNPy0oG+uyc1kdp5GsJ1tlmF1tCkrRI72aj51AH1RWPum8JaBFuuycA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLqMxq/xNP0jR0BcLZSFHpKBA6Sx7zpbaokRVczvM1f1Zv7vS0N
	2Gc5oOrB/XDxkq5jrhktQenr4xVuZGJ02TMDxx6s+aoSKjKeRxjOiLzWU87q2//FMjnA5vmP8U/
	4/iasrom4CD5pmBg+5vmMYzVDJ5XyId/9e1bkKPicdw==
X-Gm-Gg: AYBFou1u1Ur9/c2JrU+T7+ngGGU+WRgt3teNRA7OuWzDiIIH1Hl42+FblPwE2E2/1Fe
	UPTp5QWAOkCP0HAEnWmGJgWhzN/qxzIm+BITtVWuDcVAqdIqfChGKOzCwUwoY9+uwpB20XTDVx2
	QVx0bjSYVVgV2aaTtzSq9dWodckFQDnxlWZHP1syiEZR4o/6UnL/UrNbS3GYZGVQXixeUZ2L4z7
	onsAd1R4qSmTUC5xIYbb/RpQMdbKJil1sN6GDb7ycjPSztG3Dk6O8USYGi9BITfW3zfmEbjvsH1
	8OCqdvminShmK+XxhYhjkA/HvS63k0cldWGKco0+5aQdW5ShzlEyRu/ANe1q1Nwe5rV18dxuCuY
	7cWyi00niGfXI
X-Received: by 2002:a05:6402:46c3:b0:6ac:a1e1:3f88 with SMTP id
 4fb4d7f45d1cf-6b3e479af2cmr1805659a12.14.1792507038070; Tue, 20 Oct 2026
 07:37:18 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019212535.88390-1-dakr@kernel.org> <20261019212535.88390-2-dakr@kernel.org>
In-Reply-To: <20261019212535.88390-2-dakr@kernel.org>
From: M Henning <mhenning@darkrefraction.com>
Date: Tue, 20 Oct 2026 10:36:52 -0400
X-Gm-Features: AclHuK-6VS79fqbsrkK5l4dmV47FN6lL1AdlVauDg0y-CgJGi7jnOJDni7bx-HA
Message-ID: <CAAgWFh30UryzqyU0As6qi8AaHzQbO=pp-Y+gWMs0ap7i1D4qKw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/nova: mark the uAPI header as unstable
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com, airlied@gmail.com, simona@ffwll.ch, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, jhubbard@nvidia.com, apopple@nvidia.com, 
	ecourtney@nvidia.com, lyude@redhat.com, kherbst@redhat.com, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:25=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> The header already documents that its uAPI is unstable and intended for
> development. It may change incompatibly as it is developed upstream.
> Rename it to nova_drm_unstable.h and move it out of include/uapi/ to
> make this more explicit.
>
> As individual interfaces become stable, move them to
> include/uapi/drm/nova_drm.h.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Mel Henning <mhenning@darkrefraction.com>
