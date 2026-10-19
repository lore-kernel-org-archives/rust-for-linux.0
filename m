Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB76D6513ED
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 14:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418840; cv=none; b=Y+T02cEkoPS+PFvcWj/toZ44nWXqt0WR8Nbi2Q2RNKFHwXGHk49VNN8VtTxxjm/KbMp54iRPxbEMBVtmvynYs/FZoSpbIPsSmhgBTZ4v0cHiDBLYizWgjwlxQZ9BVwJvlZQ8Dxwo9pwClKWvkKM2HkTI7tgrssq1uc4WooHceaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418840; c=relaxed/simple;
	bh=TCT4Yq30WAJeEOMR6S3DAdC6oiFVO3WCmLbbkASuAhI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Hm35tq0s2r0b3urB3QB8oOikKY+mq4Zm835XjhlaG8aPBjjubD56nBwHg1+pnLsRaa95aVePe7smav+e7aGoa0bqUoSzzEI+aXO+YmPRdCtO/aM2JI6XZeqmrPDYMqxxSgRbMOn6qP7mbDCxQb5M2AIT3xKJ2s845suL6YeC5qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qC6zEoJE; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qC6zEoJE"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1e3efca9aso15032955e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792418836; x=1793023636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TCT4Yq30WAJeEOMR6S3DAdC6oiFVO3WCmLbbkASuAhI=;
        b=qC6zEoJEKUZn86jSiPz6PvfVYSHEXKaueFhcEB+GANODZhNkkhZtLZb8KtfRG9wSi+
         a6qsPrI41b8GH0o2p1v0krD2o3Nr7faQ6hJ9voXqCRszw+RP8yty8o+zV/+qnw+17U8i
         3/HP5a6TsjVc+q7YA2p/1+6pej/5Vf0+0aEPaPb2Cr1D9Ay7sZA/v/qTFniaOL8KSh/3
         L84zclu4YnT5wfJmxdjF71BTvhC/+bTsWAQjHPJgDaeNe21llwrSyZO11mEwsxCVRamC
         92fuyt2Pi0gtomDIBmdlghopMBi6vlGrcN13rkleyMIkT1Z0whmt8kimxOp7c6e1Qj3N
         CHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792418836; x=1793023636;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCT4Yq30WAJeEOMR6S3DAdC6oiFVO3WCmLbbkASuAhI=;
        b=Z1tpfvpacD7ddaxsJJ990tjLC2gJi7kGOtyWBIUSsIc37pl49YFaB102mz4LU9BdEu
         yEudbeaIp0sBu/8lhuj1B6BnOAqzTkQGa0sYLx70UovB+GEurGPRV6WDnGWmq633vvSW
         7jYTh0ssfGlM/H+qJDvhbO+itEhhBcPo3Cd+Zt/MV7QXF9w0liRWEkX3b5DB7FaPC9XZ
         D5y2YwWg7ef8VLzEvAhe8DLjwgiGr7/YkBNLSZcOo8D6i5XRFcDhi4DpzJ21achdiZj6
         rF7uGwpfxClzgl7HPNOSNYiDU0vszm//ogNVmRGVZZtnLGgiaEkbF396h3brFwNM+702
         S5eg==
X-Forwarded-Encrypted: i=1; AKwUvBwdeCbhuYWclKTYyOTr+fmqMyo3AfRn1wuOjr8kGqteznla5i2vYgANY59AkLK/iqx3XD1paJENmkfOAyMcXw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0ZvH1H71Y7nTsUFebV907L7hz4IqkxwlKoGnxpaA++D8zpZHM
	qshfxAtbrNDSkgYdE3OVrG/wM83OKbMyguQeLBOERHjDJ59CXxG+6Lr+pV/Alfz9H9zohs4mh+J
	Xx9DEY378MRExjKLUkg==
X-Received: from wmkz7.prod.google.com ([2002:a7b:c7c7:0:b0:4a1:9e7b:11b2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:82c5:b0:4a1:e575:33dd with SMTP id 5b1f17b1804b1-4a1e57533efmr85001955e9.18.1792418835770;
 Mon, 19 Oct 2026 07:07:15 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:07:14 +0000
In-Reply-To: <20261019105744.2943249-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261019105744.2943249-1-linkmauve@linkmauve.fr>
Message-ID: <atYkEo0iTU3vnKCi@google.com>
Subject: Re: [PATCH] rust: num: Add inline annotation to Bounded methods
From: Alice Ryhl <aliceryhl@google.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 12:57:38PM +0200, Link Mauve wrote:
> It was previously generating a ton of very short functions, such as
> <<kernel::num::bounded::Bounded<u32, 32>>::shr::<17, 15>> or
> <<kernel::num::bounded::Bounded<u16, 16>>::new::<16384>> on use.
>=20
> These are obviously better inlined, although I wasn=E2=80=99t completely =
sure
> between #[inline] and #[inline(always)], but the former worked fine in
> my setup so I went for it, we can always adjust it later.
>=20
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>

I agree with using #[inline] here. You only want #[inline(always)] when
you are using build_assert!() in a way that depends on function
arguments.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
