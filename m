Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD424EEBB
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 13:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777209027; cv=pass; b=BP1XoX7vffoV77SNJPwa6qMv3VvEe0wzvdoLGDvLBXZ3z3N0gXUgTU15+E6tAfZsQqzknaPbDZUOP6wMlWs+omxAAZ0rXgRBRHzNMBN4eP9Mz6SuYjzEA98I+yjkunGbDrhBlG79JRyCbVQ5WJqAs/EVlhNyBj/12EciGxE4LCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777209027; c=relaxed/simple;
	bh=KAugyypktJgdiuY2G957bbL6kHq2VyMwqkGxVpwYPS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=etbVHJpCxcjlGR4pH0IVLg1Suz0Sdja6J8AmaZi1xKVR4NPrqD1I0m2s9EGWdGZ2fdrCOpSctspqVt9eqF6xsurZuEBTIr+wN82B75bhncCWdjH2xTHf+kJ+VQ1j+zOkq7g/pu1ghODuUa341Z+B/aFS8PJXcBesRCgr7uNDktc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lppd9AZ4; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lppd9AZ4"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2d958ce9921so666966eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 06:10:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777209026; cv=none;
        d=google.com; s=arc-20240605;
        b=YpegyWsEVV2cwd9xCDAWX9n5vcul8q+NSStzZMYdI6KLtNikltyvrdEp6INmzqHI8C
         bQSZz7hAkRkQSmsZbvE3Xq3/yp1DvoB4Y+iKXx8SKJrend9i3C2qATDeCiEVw7Dotpb+
         7Pxjttx1i50+fmezrratSCUyU/Q15LFPfytopAKyX97lQMO0u3JAZGhgp8oloZkukePp
         dFObsgdk1a/iTANf/jKAQ0axqzD3mpWepjF1S8P5cTmRX66BGT8E4QoB9SM/7ue6i+SQ
         a9J7Epv1OAVxLUs6IbCDCWJQqubzGTCauXqy5ViRp5QXowWcLj6Kfp5TMYdw3dmcH+eM
         r1iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KAugyypktJgdiuY2G957bbL6kHq2VyMwqkGxVpwYPS4=;
        fh=eh3aoXOT2zH6sAeVhlAMCr1Q2QDKox5iles0XoWpeXM=;
        b=SMPzk9XzFNEgziJ3Xa9qPPhqc4oXJpPIzX5tq2IC7fMqAUn5BWqbGSPWRcvjxILfXx
         MW6nUnASpCNTZU97Q8MZku3/wthnfoegTlxq7So8ZfJBUdsV5cWyZX1Yx6veCP9AoUvQ
         looLhzBxJeFAfLZd28s3PEdK3Vu/m+lO0R78j37e0xg09PD5oxOlGoV4ytwzY6cPWzAH
         iZ3m/HG3pVX73g2gIxsKJ46dK5uGF4bt6UEBkj9+ux6HlG5/HMS1WPQEyWvyvMtonLMg
         6jLJREfSy/AwTypl/L7EuhaVEHJpNqqcjdd7WV2pVGtsUwJA8nJLB23mtPsfLsBVswTC
         8T0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777209026; x=1777813826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAugyypktJgdiuY2G957bbL6kHq2VyMwqkGxVpwYPS4=;
        b=lppd9AZ4Ba4+p/tygMfozR+JqYlkKMug+Q+L50cJN7msRfDoDmtTN1SrwzOVVal22I
         hz8JISPa/ZbQkrrNHl+KD0TWEXnTmBvN2DUqzMw5MTzeKouyfZj3tBDwXdC55w9/ftdD
         qs6T/IAbsRgK1k8+GyDdRZJILwogs+CT5pH9SOWfgpVObBWqOyjp/UOXCP++1MVvMB6O
         x5d1V6sV8JgBH34/caHGoolNZw8hGYnHyk2pvKm600fJA4rXywVxapLbIjgzrCxu7CKx
         xiByXJwENpzJW1ymTDZDWJdeYaq17h9O+b6VqeewmOGFRLrnIp+iFUY6lTwIaQP60zGg
         LbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777209026; x=1777813826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KAugyypktJgdiuY2G957bbL6kHq2VyMwqkGxVpwYPS4=;
        b=EXKTMh2jIMqtWa1CUswPEI/0xg7rInUUnE0dtUlWkE9Wjf5XWKz5UjLg2yDPgznMT5
         HyfHASuH64t+P3+ztxlzfYQNEEFRKY187/nOfc61VH5iDuwkNN8Q7SWzGvoMgdNkocly
         2p1wj+Twyt4G72BfvDgNzKepzHOdBTJSsfKQKy6K/FsqZ9k8oT5qPmKftyh5lia4aLJr
         yeMNy+5YVegeztraXXi8GHvR6p/nXVCSxcHV8SweUXDOlxkZgb7F/neVAdJbjK09nAm2
         UHcbRH6aFOvJxYXjjojEXNkWbCqv5uXvEEb+96A6J0R5Ysy1tBos30azsA0fEcEu+Qvx
         RqSw==
X-Gm-Message-State: AOJu0YxdF0Le2JyvyBuJzJSN0cA+SJVutoemfSm+1RiSe1szwzOXBpVi
	DMdMFlGgJeP84zJj2vEtf/g2OR2Af8OcB/ZCzmElBCZrEHErV6frZifb8C5NKHZ3v5zBWfEavek
	W4vHHRBQuRsq+8kIK5kaTLZ79/P/eJBk=
X-Gm-Gg: AeBDietBjkkSwNCXQ9BteqTsIWKv86fBsmWcckqZ2isvVaY2AsFoVQ0TE6p3WzK+lcM
	e8nkr0Bvls6c8qy08OpkGvzU90pfSt9lcU0S3sCtYlF+jB7ThEl8AHKJLE9/4AVoHez/vn8VHxQ
	Ivz6x9njAG105kDRP6vnMauKuzOmR3kNd68aghKnk9K8aXPI2MKcBUrN3oLAsXoblwUYWmfhY4T
	1dvvrw8tSgnrRDmPeX+aTa31I7f8jYUVaBTBaSf2Su8ntXIgG6FnBxVrSpryAzFxOez1xRcqoYe
	uVH+kpk7xKcDysE6VXh5QGXpmi5TbH1ld/k2yFa3Wsgg36AK+Wp66t+O/K8e11aphFlcqV4jq3q
	xGLeT4sJ6z7N/idknla43CQodR5T/BAkL1w==
X-Received: by 2002:a05:7301:9f03:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2e478a2e850mr8223913eec.3.1777209025830; Sun, 26 Apr 2026
 06:10:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425060823.76175-1-yu.whisper.personal@gmail.com>
 <cover.1777111268.git.yu.whisper.personal@gmail.com> <18fc8eee2f057a6bfbcadae156d1d0b7c40d0077.1777111268.git.yu.whisper.personal@gmail.com>
In-Reply-To: <18fc8eee2f057a6bfbcadae156d1d0b7c40d0077.1777111268.git.yu.whisper.personal@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 26 Apr 2026 15:10:12 +0200
X-Gm-Features: AVHnY4J6yr9-hPTaVme2nAx5AmyiPBV3mRarRytOu_12DCCa6gTY1wvufg48bKA
Message-ID: <CANiq72nkXWhjK9iFRrhGtkMZGsvNE_zVsu4JnxaFRfxWL7RRdg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: alloc: fix `Vec::extend_with` SAFETY comment
To: Hsiu Che Yu <yu.whisper.personal@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 25, 2026 at 12:18=E2=80=AFPM Hsiu Che Yu
<yu.whisper.personal@gmail.com> wrote:
>
> Fix an incorrect operator in the SAFETY comment, changing `<` to `<=3D`,
> since `Vec::reserve` guarantees capacity for exactly n additional element=
s,
> so the equal case should be included.
>
> Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>

Thanks!

For this case it doesn't matter too much, but in general, when
something is a fix, we add a Fixes: tag (and in most cases Cc: stable@
to accompany it). That helps backporting (when needed), adds context
e.g. for reviewing (at times), etc.

By the way, now that I was looking at `reserve()`, the assert in the
example there should probably use `>=3D 11` since there is already an
element, instead of `>=3D 10`. That could be another similar patch.

Cheers,
Miguel
