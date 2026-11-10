Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794315215;
	b=SrWnf39sWEMiY0rHAZvPXHf4sb3XbpXl4CKpwUAfVYl3ESlddTQ/YTgY+3R5vG35wnc1
	 AvB6GfvizZQsHLAm886mHybA/FZYesUa4h6PZ6OD0EIHNyilBo3dnG+SWtO4DOE4RPqBl
	 39Px1xFsuOBgADs2x956bDvWYPyJEH0WSICT/oe+afvuUM1i+WW91FRFrRgSOJzWL26xL
	 I9hMc6i9YHNXpVoWVwiDtKvqYOU42ZZjGUgzJQGcC7WaWDWlf7HrQUTVz3ay0E4pzZDTy
	 2/+bPmch6G0PkbjChOZqo3a3Q+XCw3goVxIbNLGqgk6JVW+4yjlCsUuReT2mCbuWnow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=28GoECiSpx4IVB0HDzc0QHmygncCgnFuLh5fsE2WXLg=;
	b=c5UAXqFkXq4RSTOhnpPkkQLYUx5izZ3InjNYbJlAaIoKkZ+bvgbvdcVpccngk1iqcjC3
	 XmcUGRmYfMyRsIfpG0v7jFDHhiefrQW+25M/XJmpo+yfwwK/nlezSfpC/892vXVTDAUt3
	 35pz6vuPq0NxsTzLhayb3ZKUP2HqFyK2uU85yz0uBqugxqiG1TIahmKP1iWhEjq3kBl5Q
	 fJLDHFV+pSjum/4Ykkm+Qs0WH8+MorhVP3C67yWSKLP2qbqq5itWDAXWLAQGPDIjpo8+a
	 xugmFIwsE8PFFc1fOTm0Psi4c1U1nWXvTGQclziB6IpUnbSvCTPd2FqvX5Nj+PAzH+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWrRRuhh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A493C60A261A
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 12:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A493C60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWrRRuhh
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35159e0092aso194420eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 04:53:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794315214; cv=none;
        d=google.com; s=arc-20260327;
        b=XX7BM3SEnIxd2x/LklVTtbD1ZqVzbdHLqhzceikmO1XRofdmIgmf4DNrpVwGBT/wTx
         Tm29qy2qRTYOOzBGbWOmhL9m5JW0yd6HkGvittI8j9338IO+q0iJpqorWGNB1e45PrEm
         3FiN3m+vUkWALeDoEKIVFF/xLW2ebgTs2bEplr2hVU3FuFCtTvKYtE49W1yM7/IPqbx2
         VscEtBdKTffNIduZTT7WGQG5mjGW4w0+wL0sUPbUNUEjuKUnedE6sEp/E6QIMdhJO1ce
         rS3vp+EOFwxiUtxuaOzxhFmipfz3SRvtu2oEkXNRTB3J7KF3t+zx99QNdFtahPtQfuYC
         CQoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=28GoECiSpx4IVB0HDzc0QHmygncCgnFuLh5fsE2WXLg=;
        fh=FkzNuqlWwZ+vJLzPYxVg7Po+kpYR4h7cWIoVkrrunhw=;
        b=dW5khElS/a2vmInjCDAvbnhR9nbWmeUYXNM9PTPOaAZVyGSMmcAwgMzj/zzINJFst7
         +5sKGJLcSr8N3GHi+rQDigCU3STt2d82kc8b1qq6rp+lKK+en5SYWzPQOmUQ9eKH93e2
         D/bpwlWnNZVGCNZuR+nzy6PaZ3QRc53Gae5UiRemdcBfgwgGtA5A+fqCkaWDXa7E8voO
         k1tnpeIk3rBw3idzbvJbWuDVLYMGJz9uGqcWWWm86YrOEh/O9nhvovbcMolCLjERFqgY
         NveT+USbG4Ksa4JX/2+2bOR9XDnnb3lzoc1QLThixuAMvqQhKsM0fB851P6FvLDoRlhY
         SlzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794315214; x=1794920014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=28GoECiSpx4IVB0HDzc0QHmygncCgnFuLh5fsE2WXLg=;
        b=lWrRRuhhh6EtAXYSdTrI71Ke2uMKfLFTWSIPQHitBs1U8yk/QUoHYz7VQTSMtm/6Fj
         UscIoVERTrjxLoOY/DMvY0yX4WmfFZ4VOS6OVTUjFiBH7nE/aPXTuMVYuo79b7fk247F
         GugOBzQbmqsm7gRRjuMwbiykhDuAgcjLZqjbsqmsufiW4BBl6VNbQ5pGh3MDz8kKuuJy
         RPWuueEaVQXGCjchwlKqEhEj6lJwWeoHgpIxBbz3kRfFtiW7ykvvutDdOzkLYQwemwKp
         lI0i/cTR2t+/uNKFKeiyw30lG0/gyvcajUF/645yaSm2Q+eAm/ZnrX3zLBy7Rv344Zxp
         VY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315214; x=1794920014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=28GoECiSpx4IVB0HDzc0QHmygncCgnFuLh5fsE2WXLg=;
        b=LuA9Wbf35RImK3MlpFpFlTR4MGDp3ajRgb5OcWTg3cVv457tmJzZByYwQ4hmrK0eX9
         Vwyl31dwlWnZubf7OTC/O/iTee3h7c7FwpbVZBfbVZFIx8wpBsYBAuHVd8I1NTRXuRoN
         MBxi4H3kzfD51e2796Z2+Ta6QX/3xFaE+F3b+dphMO+JKzJhtrBgvFh/2xBw/LJkz8oO
         cLyczucTpT/TvhRI8OBrNiIDog/k9i3DkLJ5iZO3yfikRd06xWFnzP6lT2kzA7JQnF1w
         h15wbCa+FVo4pH8ET6+9wJxlM0uDrXf+Jyk5VuPtxvF8WavCaz1P0rjyb8Ug6qfMD41T
         tLlA==
X-Forwarded-Encrypted: i=1; AL+hErFzCV1qK5vk++WEgUtnSwTD7D+9QeUqf1l2HbavV0ikJgtSE8I0kwvTt9yeR3eBVo0DdY0H+qfwxQxowAssDQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+os8HuuiFTn32gKZy36clxtIVSo2cxh1FVMUn+AdYB1amLcBiQ
	RtnE2xqI2z+3wctqSuno60zhdGUkQuCBepDsx7YMgGAIU3Ju5ZCYF0QnpXw2/1+pgHHel+phizD
	PA9oogvulf9EzR+kWSvpYZ9C/rfAhFNs=
X-Gm-Gg: AYBFou30G7XpVrIE6BxNehiRGu3u9mZROrt5BOfcx1FfFmYtfEM/muLr1B4gbdBCVkJ
	66xMWHVdY/8Cfu1en7uJk9B2gl9RMPjrliRp3UvzSq80J6/F7/s5bO5+EcC16ghfI3LnvjWozXa
	VdsC9B6xM5gat9RpWTkCe0arN7pEF57o4HOxdo6eqylpI5Rfav/hGqNJ5nXsLxJZ3GxOcUD+t2L
	R9oOohsiTxbs3p5ARYVrTxasV4qCRl+5dTmbGifaqbprq9pDJMH+Msd37R71NtBfa0bcg8CIPO3
	+VK1uEFFhjQtdJJCHgttVlkauun77WI676aY3olfE2SMJBDqx/wiavagxeVuMd4uaQJ+ux8GmYm
	4UsF1Ls/utpXuEcNj4hAnpzlPjGAGffUOm9/J6AM1K8poWNHVubPYf32KVM2DNQZibovk/lPXjf
	T3XATuM3il9J5boOTFNZclCBjKSPoMSqCSABE7viADEjqaoehhkq7JHmRi7iXvvP/pBVqYgAKLO
	fJHlJIENnwy97+4+Ec4vo2CUnvDN3Be+M4=
X-Received: by 2002:a05:693c:821c:b0:36c:a1bc:6114 with SMTP id
 5a478bee46e88-37519aba700mr4904579eec.0.1794315213601; Tue, 10 Nov 2026
 04:53:33 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105005951.756157-1-dakr@kernel.org> <20261105005951.756157-2-dakr@kernel.org>
In-Reply-To: <20261105005951.756157-2-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Nov 2026 13:53:20 +0100
X-Gm-Features: AclHuK-pVseIc6DHnBPBDBXyJhILLTldFlfGpbyMvwQl7Ef2kEFTlDEPMhY_FZ0
Message-ID: <CANiq72=xRMO_Q0EeeProKRnjHd_9oGufXUVb153FRrBn9xBk1A@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] rust: task: add safe schedule_timeout() wrapper
To: Danilo Krummrich <dakr@kernel.org>
Cc: boqun@kernel.org, gary@garyguo.net, aliceryhl@google.com, lyude@redhat.com, 
	daniel.almeida@collabora.com, work@onurozkan.dev, ojeda@kernel.org, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, acourbot@nvidia.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:00=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> +/// Timeouts at or above [`MAX_SCHEDULE_TIMEOUT`] mean an indefinite wai=
t. In that case, the return
> +/// value is `MAX_SCHEDULE_TIMEOUT` as [`Jiffies`].

[`MAX_SCHEDULE_TIMEOUT`]

By the way, should we even allow higher values? Clamping is OK, but I
wonder if we should take the chance to make those EB by adding a
`debug_assert!`, before we have callers relying on that.

With that considered:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
