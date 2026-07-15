Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901A43271EA
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125339; cv=pass; b=KgeGdBpe7TeGeYPEtIoEd6877JXKo0EoXzszxRNN6cU5Z1rObKUbeaFQAyGwkcAncPijkL3cgZ5UxxzFqPQ1biFSZVDju0XeTEU5oC/vbvP1I2o391m0duYU+MgqRtyRmMW5L9+LttFRc2nKVy7bcH2Yf9YuUITqUPcr4ujOb9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125339; c=relaxed/simple;
	bh=BX+rSx/ebWQTJxtWffqE5TY9/TFNiZTpBvjgkrwyrCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L9pJyU7v1LXCo2B0Ip7Sqa3k14s9w5yCevbvwy4zMX7urFkVBexY9pzNlUXGE9pCKr41p+Yq47tSCdUfBNe3iywRvAECrMCcWQUJuO0MTFWLBS4W2T5O+89zVnJrRdB1lesLALww6Z3f7BEcmcryQepiIlhqT8fX2VtLZFQahMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6XCe11V; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6XCe11V"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3860f32307bso869552a91.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 07:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784125338; cv=none;
        d=google.com; s=arc-20260327;
        b=foX35Jk78qmxQyR39Mc1qmkgOvD8PJcIA+bqQPU9LWWbmqAjb6gU0cFmGc7G2z84v/
         muzPJ5K7gxIfK7xpj1qjNuLZnigpbs3CrtcgFnvZmyRyNW1RvUdjN2jomOLYsvZfY9+A
         w00efqV8DtqBBLosZGS1gXafIwGxNpdCEOpccbqnp2DwIqVmZrtHPX3WV2mw+b8O3+XZ
         8f7w2QXkmFXwk8ojvKVGPN7TTqGXkuOo5xtxG8PmKx0hiT+NCiY0F8+ECU99sKWA7ia1
         m6kKj09MEYNlMU0JJBDeGCs9+d/vAIr2gqM53/yD84uZ6IEV5UkMKDDQu+asGtvg8Kpc
         559w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BX+rSx/ebWQTJxtWffqE5TY9/TFNiZTpBvjgkrwyrCc=;
        fh=eye2OPlMSRUmRlE5ByDYzSkGWRGHu2776sYmiRa1gMw=;
        b=XHKLFLkIKCnJsDrwr5Gh33GEO+STAhj3V353X4s4LwkSm1lW91lNUk4lDVboxP8YI3
         FyFXs0PKedJdYafGodaYOJ4QaXq4TPAjapYmYGwgeYgsvV5toE5fRY6CAaOhc4p6vjb8
         pAMEV89sNXMh0JQ8JWg4Wb4zWxoFTHBrxikPOODFHBQTTfHNMjHIEvigRCGtBjVU6vlN
         IuJNtAGrOz9FMlQGJwGpZ1v+bcpmEl5auZdWVogFV12t+DSO3CgtD57JTGnrID68zvTP
         ueYW05ix2SOS5ZxZt+ClJWvS+b8e52qbKsUAefEKBgvL6vCMDBewd36sANvArEy/rWkj
         JSkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784125338; x=1784730138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BX+rSx/ebWQTJxtWffqE5TY9/TFNiZTpBvjgkrwyrCc=;
        b=h6XCe11VjV1LRHmsDXKESTXyc5gITx9SwwGXAmM9pVUDDuW0BZyD4gmx9MgSI/gRgi
         kDBYZF1H5gYT1VuTXydapJg2uI0NDY0DoPZ8sYqXUvGv8wBqh1zK2P6A1hrBGIxZhv4F
         hwlGdGD/4dzLhKCBkzVm8UbnsVq8hZL90YJvUSDDca+PLJVFUFR/thUTCZhbZxcSy+SJ
         gy66qEPXSdtlA1dxOc3+SMUM5CIHN7tZe5Bno3xzio02lIyNoMNjnSLj42Fi0tGX2QMZ
         ZTO1ujxR+4s5+zBT8AFghN8QgGe/MK+lgByRnlWF/GupHLfgbeKtiNz3ZS8MhRVRy8XW
         hROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784125338; x=1784730138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BX+rSx/ebWQTJxtWffqE5TY9/TFNiZTpBvjgkrwyrCc=;
        b=Thj4fODY0IwEVhadWEUCLWwU/OLG2c3CdZvYVdUy1RLXSiH7G/NZIrQUrwc/77kjcN
         WsH6QnD0w/1pPb3lnnC2WpuuM4DClDvKEntu+KAw/nTCHJrMThSVi68qlVSKu4/iTloc
         9fpK+YXt3W/c2rfYjX3Qh+uQcsapMRo9C81MQr2aZNQRMwgwUsYiCXUMlh6GZPua99Ju
         D/dEOWNY4kG5iyV41HzGufE9xG22n0A6g+6fS6clxWmCnx0mJ2oBbN3HgZbS1cRrzsmo
         XkcONMRJTK3wFqWKJVFa+SoBrOhaBXyTlurevZvyqFbP69lxSjRMr0jfBmJR/rcP34uC
         FxdA==
X-Forwarded-Encrypted: i=1; AHgh+RqmzKs7MRIvZmFzU5zu6NpNTGNqHipny54EoZSK/1LTikBvs0jDNCX5CbBspsmJ7B2Yx3prTxaFTFq1tSlr+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3E9Yv1o/5VonbCzDXtyE1aITX7m+m7Mc3panG68rX5K3wVHlW
	x5sdxQ604hkXQUeJZwcgU1lusJEZAZYN5iNfxVuM+DyxCCYdQ7ieg63/zUMbYOXP+RKmPr7xCNb
	1PqMzH3sEgI5M5NfYdKeGrzpUtyHGkT+yQkCH
X-Gm-Gg: AfdE7cn+qcPir7IAL1BTzO7lu8cF3+cVaomL8m4HR3sp+5MBZVcGHBE+XWBA5Qt+Uxm
	781bNxCUswMkegKwpsxL2Hlxg9UScStjQGq84bVXJd+3TdRthfY5EfNJOoZRfrHzno5Yw58r19T
	eKmFjizWCELaqb0dxZEO+C4YAhgp0OGH1Wk4BwXi/pQsYIgpHDqEAomI7YLslNJjHtHWYz0tSvE
	OcwYrxvslWZx8aSA7eekRre7ZQ1yzMpboDBj6mLEBSc+MHnBq9rQwzMQZv/Jbfvuh+TqQ0z9WSV
	/IdXfc5vm4wnoeFjFM3U0Y6cN92N/zpnUJi1AlFMPRTVrSjKJCOcCy3JZytIetuFntbeR1YQ1X9
	Sdq25y3a2AfU3
X-Received: by 2002:a17:90b:4f81:b0:381:77cd:38ca with SMTP id
 98e67ed59e1d1-38dc7bd893cmr11043179a91.4.1784125337865; Wed, 15 Jul 2026
 07:22:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <qkuR2hizBbyuYmC9pigSGc_wAIN33sdtqV2v9CS9TjAP3UsxypcGi7F5_XXauq7AtTNawHIM2zR6awW7O1LsCw==@protonmail.internalid>
 <20260712235246.3069713-2-tomo@flapping.org> <87ik6ghha8.fsf@kernel.org>
 <20260715.212021.485543459172925773.tomo@flapping.org> <87cxwogywo.fsf@kernel.org>
In-Reply-To: <87cxwogywo.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 15 Jul 2026 16:22:02 +0200
X-Gm-Features: AUfX_mxviplK2v4-CYSmuje5qp_wYbs-_qiQG5vQ0_0LVWEL6oX2E_gGGotT0Pw
Message-ID: <CANiq72n8-=QF7T9d8hon82eQktyRW-_1YsCQwnLZaWmmcx1hUw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] rust: time: add jiffies conversion helpers to Delta
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <tomo@flapping.org>, aliceryhl@google.com, arve@android.com, 
	boqun@kernel.org, brauner@kernel.org, cmllamas@google.com, gary@garyguo.net, 
	gregkh@linuxfoundation.org, ojeda@kernel.org, tkjos@android.com, 
	acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org, 
	jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, 
	tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 3:34=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> I think widening to 128 bits is fine. My question is why `NSEC_PER_SEC
> as u128` instead of `u128::from(NSEC_PER_SEC)`?

Yes, please avoid casts if possible.

Regarding `u128` -- please make sure it works in 32-bit architectures.
It seems like you are doing a 128-bit multiplication there?

Thanks!

Cheers,
Miguel
