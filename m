Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684E3319870
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 14:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767017519; cv=none; b=VXnJeA1Z+KiTdu/pnH0FRBKHgdYuGM4ZSuxiD788XuPo+2y1BBvRXlZ1AGwr9G1ndW7MP2wbNnFLV/j2Im3OAI+PnjFMydyxKjvGoV0qBZTzVksNH36sJgsMC3ZZxg3r3U03w8Errasn9ApqnG6Knk5Yn51jEkXCcNypMtA/Vqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767017519; c=relaxed/simple;
	bh=QtKYhPglruFwpVOAQob4BDrgP83PQnYaA7DEA29vnUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VmWkooOXL8QORSjBNGkKaNaxTc3PCVxeBL8p7eEZKoOrRcrUW9/F6ju4hkmTDcxtVIm1SIwBXoMKkPeCUKAwBhBd0M9K8kiXPhy40e0BoEPJO3YnYy2hotYtp4TDn3EwmNlJCmxoZqqGe3bWQG9W5AsXGHvXeM1gY33Yi6ZUIt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jBfX/lNY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jBfX/lNY"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43246af170aso3877782f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 06:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767017516; x=1767622316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtKYhPglruFwpVOAQob4BDrgP83PQnYaA7DEA29vnUk=;
        b=jBfX/lNYIgAwYj7g/OxPN1NSCXutI8iphlW61s3d6aNPIYrcWz/wgTTiYp0ApeuQsH
         cXeiO3dzS+I/AsNVURbJnPhwYOFqMeviY+0E6nJLg/Zd5U0lnLBQl6DLQbeHsS8/mDuq
         WH6aImOd+tqN11r1xmijDKLMdo+G2C60i/yYD3QK+AqXePrthB9zIWGOH2FVOpA2ngaF
         aLrnxIhh/iL9xz0LsfwAaaK3TtkZEsMhVlx/Dkq+E0v3rgHXxYTlEEy1Un951/SNpD7B
         1YPKQ5/H0I1YJE2TNQgpmyERARAUUm2tb+Cjp2WPQ1cgWUS1+VrYAPDTsJ+liEqmbXcf
         wWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767017516; x=1767622316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QtKYhPglruFwpVOAQob4BDrgP83PQnYaA7DEA29vnUk=;
        b=qFIVWPnFExGaCyc6EfQpJLw+wwni1zfmi8K6H3sRNiz8LaBssQSic9euRfSBMkgzL8
         WUFuk23fsCd46BzB1FvO6yvNWLDJzc21nhexYv9zS2uFqbUHgqak6b7xmMWGC/9vIAw+
         qife25bHsctSho0zjO5LOcT831eiqIXskk4CKMKBUjsCNALQuG5so3X91HiVfSHJPTA3
         Z3gB9eaIc0G9sQBTaFDvLlRS9llKcpDaYgUgXP3sihk/W8ShdZswQGGwtzq5DYSiAFg2
         8tKTynXP8YjJJYZE5X2l+FfQYgYEYTSgjj6rqpA9xnRa44WqpKtiUYWa/ZNKQ4nwe6og
         U1Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUZf7+faxG03zcqIcby/I0I4TxAfvGwzgMLywThahOpOY6SwxIN/Ctpd/LI3gltpuS2gXtxuOoJmha/DeZwtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw50hQJFvbcVe1oW4aKvV8spG87oGM8lwDb7/3XDlwUDu4CNnxR
	ZMJBIf5pIfIUH+0LFOYRLCWFH5YDiXpolEhA+9xgN13xdXmsf1udiqD/HKHJoQb3PIoxfW/SC4e
	V5lZ/nG0/9QYwZHnGrJ/VOHqQcr2s+ZRYtLh0KnF9
X-Gm-Gg: AY/fxX6XtQKAmX9FmRQnYYTE/F+/NFbDbN6urBzglHTzHIQMrF//zHL2jsMw0XEvtqj
	v8+45r46Pq9mBi4pc9mhc2z90nVgkZ3Sbbw44BiQKgsZ0Ty6OYVIbBX0x0UVde7BpWDiOA2i4JS
	OgpRe/XEfAKBGuP49hCrIsyQrpQIP3LH78sUvScrpRaeqQbe/QqINQLKvRfhOsa/nBw4szBq6s7
	qdxi4sFLUu1gBNWuNWPWsuw/wh6dCik8OC+x7te9HIaPWqe8Fq4nRsWrz5821+athAj3CXgemmj
	RaLLpt/6Tf3hzC+Nk6TATo1wea/Q/whAukP3
X-Google-Smtp-Source: AGHT+IG0owVfuNAuvAb+/ycj4Qy7UTpdIZp++m5YOGeQ/uPMYuo/PE4//xAnhokqft9u4OVQdLY0lxEk/D1GEJIMX9E=
X-Received: by 2002:a05:6000:607:b0:429:b8c7:1848 with SMTP id
 ffacd0b85a97d-4324e4173c5mr37384772f8f.19.1767017515537; Mon, 29 Dec 2025
 06:11:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223055647.9761-1-bshephar@bne-home.net> <DF5VE17B8HTA.1XSONUJ4XOFCY@kernel.org>
In-Reply-To: <DF5VE17B8HTA.1XSONUJ4XOFCY@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 29 Dec 2025 15:11:43 +0100
X-Gm-Features: AQt7F2p3rOPPdli0l2rECynwKB3phap3VRQzq5EkLhjyhTKhJ3U-JnMnopY53fs
Message-ID: <CAH5fLgihcaERfFUBLqMQm_tK3N06D5cREF=UsY73VnD5QpNY6A@mail.gmail.com>
Subject: Re: [PATCH v8] rust: Return Option from page_align and ensure no
 usize overflow
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, Brendan Shephard <bshephar@bne-home.net>, 
	miguel.ojeda.sandonis@gmail.com, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 9:14=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue Dec 23, 2025 at 6:56 AM CET, Brendan Shephard wrote:
> > Change `page_align()` to return `Option<usize>` to allow validation
> > of the provided `addr` value. This ensures that any value that is
> > within one `PAGE_SIZE` of `usize::MAX` will not panic, and instead
> > returns `None` to indicate overflow.
> >
> > Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> > Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>
> Alice, unless you have any concerns I'd take this through the drm-rust tr=
ee, so
> I can pick up the corresponding nova-drm patch as well.

Sounds good to me.
