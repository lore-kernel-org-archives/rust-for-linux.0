Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECAE2DC789
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 05:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781775; cv=pass; b=g8Pz3Xe/rsaeNnpMkEyaRxaegCtuPnth91S9h4D7wi1tTXe59XI/WjSYKP6OZnczdNbUiYPSeggxRgz4t6tGefBTQ69Hxq/9s1Xw7oxdEQUjU+zT8+r4lqvJ9LEPferfjoginLaBIBIo4hsec2Evlks1koy3EthdA97G+4q1eT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781775; c=relaxed/simple;
	bh=7S/sjZ0z+yBZGs5Ta6UfTAs/YBp6b6ofkZEfI2Oj4jM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QHEPUkyyHN2qo++Rwiy06pnj3Xb953TQ0UJLf+cllb9WwXSRQCF3d3OMJE+8DeMRMkhT95wsUszkGsAxELgOnOfOJgH532tVYHdwgGPM+bUj7ZPmzEffov5/wQ+pdL+j54ItDpI5gieSSgana6W4kAliCNbhA1nGPyhd5D32mzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJ5mNG+G; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJ5mNG+G"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33e623bd651so168825eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 22:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791781772; cv=none;
        d=google.com; s=arc-20260327;
        b=CnX/qFIEIkQkDuTHULh/rl1F/Cf5/kn2I+D7LCXoJm5kuugNIkA3vX6BRCgj13oZfx
         Nt4MU4cOlESe6ITfBoVkgKChauM7ttfLSn0UbOEHVCecMJKRoDgGMHqGu4cxBb3yUw3Y
         oGdcgZpQqbF8COvsDyVlw5DKPLb15Y1o/UUQ7B+CSN+/GL7Dr5rBI9k03IMSBMAcvXiC
         LfjM7kUcBGUeKhjR0gccdZN+2qA2WocZkzMkbviHGSRKelptS6SnoJ4Du1GVH06oE58j
         wG/tvZrIhNF1kFW1UICNJdls4B/e9YuDHi4ZH6nmL5dCWvykBdxKEnZP475xJQflnBCh
         y85w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/lLLLclL22w++ZhVf6oeIW0i9eibJmDwV660dbwM+rA=;
        fh=Hpm5K9wMjnrR8hL1WghK4DVxhYlWXe5topYHoaciRBY=;
        b=Wk1CgL9260UEApxH7A92zolPwStVXw2LQIR8Aqrsf2jTYHCo7UejqCV7fwqZC9UA6b
         3GnnHAGr9xMC2OJWIyAL56q0NJ8TtzVnIj2QK0qb1o5O9pwYeUQ0vQO2vnNeXAD7p6ET
         ADkX6cFtTA7PEQL2/mpPdP8v2IwjHkfNFAr1GCaGb+fNNnkiLvzBM51t+Sl/3B49MLia
         P5G1NQFMO8Jl6gVznpour9RWUnVP5BhihHa5Sk9jlcZZbR5WAwAeXs0Q12NbgUzugDe2
         ijUkMiSmWW8O8b+TOOnlFdDjIK8bszvDlXTStTfju6fxvuh1RM99qxA2PUvDsRFpR+16
         7LJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791781772; x=1792386572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/lLLLclL22w++ZhVf6oeIW0i9eibJmDwV660dbwM+rA=;
        b=bJ5mNG+GOenZk+PaIqC95W3SKglsI4LX62Ow5JQt3xPGvMseB0nteJa8jSg+mrt3O5
         Dc9jrQxn4ycoyok5CdLXrczrXzGQEt9u2DoeguGFuZpqxFqza3EjL9gN7QDBHhcqnlpS
         pWmP41WgnW1OO0lNrrZVuzsUukt4nvasbIx+MtLbgeA6LNVDx3N7JIMmbLYYCJ9V08Zh
         5rqK9KAtNpmd/nFeesLHr5jHkD8ORwkpYKZzRXBmG+4pshkedfONraI5A6IVrK2QGmd2
         e3EyQlqBMaZBCWLk8cD7IX7GLGkma+DzsPIwXI9KOFzfaPK/k9EhgkEcVE/dbOLFLToE
         pUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781772; x=1792386572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lLLLclL22w++ZhVf6oeIW0i9eibJmDwV660dbwM+rA=;
        b=pI0RpBVWQDEPIYuZ4bEnBCh/nEQnNutmBYKOhjHliFhPl5rhcMcYcpj1t2KSyv42m6
         0RWI9qQa+cM4vy2xl+MS/KAHWLe+G2b6v6HoNzkbtwco/Nq8lhY+pjp2HGp42qkm2uwr
         r7H7cLWPJfDh2gRMNf4hu87im0+FBcisfNCdOV9KMQ/XzCyE4JREP5Fov2iiSNtnbESe
         DlLis3v9Q/zzx6Q4vzPRkosrP5RnrVyfZut9byVbbdYKRuNF3eCVisxm8kC6/YCJHy+s
         vjcMv2ffLz21RiEFIHlXR7rrtltohPzdePgg8IXM0WHlcAQRm6yN/IXurc03s9DiMNqv
         98pQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZyyjzert2+s8K/7VerU/bri2De2GW9Mzg/BeaHeeCaeKYF+v+wGUimY1+eyWgbhzEtI77++9wKVm/qI3iGw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKDBK3nTc8AASMXf9zT6umGpZFgQBiIXhTI1KeU8elfQiOkfCpy
	RFKr16lDJi0AlYd+Be6e/BGew+EoYtSi1A2SnfM6HRfVkiUHtETFraAcfdBKuAO3Oh9j35cB5aQ
	5WlmO1xd4erCYrDPbO3asb15L5Pey6Ao=
X-Gm-Gg: AYBFou0mSnp1I9LCIAM6pxajKn4ABhJJWUAmbnn/AGBi7iulJjIVB4P4uNyvpSB/9zx
	jS0llgTF6Ni7SnzJbXih7Svgxv6dtfZS3/BY7Ku2G2NnQIQNTWR0DxjhruECoMZxpJQUx0EzyxJ
	ijewhtV7t1CBJaid6bCCiuY7zq3GL5+Lxupjua+wFEZIFr+4yK33Vl7PuKKcsR80DL03SUKJ1D/
	qdUj19fT/1UAtm6KBl+ZOkKlThElc44YYMXC0y/MP7EB9vkT/6PkdxA0Nom+FijUxhJaDySXs2m
	wh25O2NGd4RxliiUhSVYEs5nagsT4FndQomjrNbifAB9eg4O8FVZiEdDvKiYw4A1+6EkTpA+0Q5
	FThxv5GN2GGjni9ZrBiXTdFv0h09qhjwUIb1NPEtpIMC3DRepy1lH7h0nLO6wm0gojuIEQHvpFo
	ECw1xES88cDda9Crnl9glT3lyFhHKpdj2pa+2zrP1EGtA3Ul+CCQk=
X-Received: by 2002:a05:7300:ea0e:b0:351:6d7f:e2bc with SMTP id
 5a478bee46e88-3537e04ce24mr18178021eec.2.1791781772328; Sun, 11 Oct 2026
 22:09:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DM1774SH56A5.136OP30FCYTK4@kernel.org>
In-Reply-To: <DM1774SH56A5.136OP30FCYTK4@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 07:09:19 +0200
X-Gm-Features: AclHuK8FyNO76XBT-aFJhzI666atCoeFIAiNv_EYP3smCOzwM8fZIHSmXpX9zm0
Message-ID: <CANiq72=e=L1KYCGG+hu_p8YdU17kTKFqanKy9H7SDGKC1zUapw@mail.gmail.com>
Subject: Re: [GIT PULL] Alloc changes for 7.4-rc1
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 3:38=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b9=
35:
>
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/Rust-for-Linux/linux.git tags/alloc-7.4-rc1
>
> for you to fetch changes up to 6e8339118040f24ebcc21db22c9c1b7398b7e39e:
>
>   rust: alloc: add `NumaNode::id()` accessor (2026-09-29 21:05:08 +0200)

Merged into `rust-next` -- thanks!

Cheers,
Miguel
