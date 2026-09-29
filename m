Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0403C3437
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 16:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697778; cv=none; b=H73yF2LgdjDwp9t6vN0qFjncf/ygIJ3nGc8v//Cms6hnD5t0OTI8GMO56bQxqw1XeZTv9CwtAK47XNM8JChUerRHPlvFc94QG6sV/pdtZoBF0cfSM6WGYdRt6eXGIVVfQEvQZqnAK5vAFlIftC8/3KXCSvUkpSEcTPwMfJullMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697778; c=relaxed/simple;
	bh=6PNZA3OWGUBccfJboMFkKmGGHfbWFVnO81DrwaEZa0c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=roC2M7yHWFp9MKcDpIHHwdwVPDQ2d3wAOTs43Vv/oRtH5p6pAd0FpulfQGPFihnAFEcjr/KOt96ex5s3y2QPmsbz5iqcC6s74iOSPm873AensPwDGXbxXpibd12rLFH0U5fnnImq+1Hvf7mIUM1pxJpxeudzd7eGl/B07Rg90B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEAVNqg9; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEAVNqg9"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3413069aa25so2901770eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 09:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790697776; x=1791302576; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6PNZA3OWGUBccfJboMFkKmGGHfbWFVnO81DrwaEZa0c=;
        b=EEAVNqg97pC02IwB/gvjnLXJbtETLvCbUyBMQ7NhAiLjZuLs/udG2z01+QLawrSaEA
         MV4q6Ywn6PCoT3nFhxO458GeD+3tsKkw6ppyjUsGOJBPZyAs47v1XGf3isnCzBGGgiV+
         9tUXj3MTu6SsV5pNUCIDoalMpVBgmKQSGxU8M9IWKoEF5AkRyNtBHQZGxEhd6RSYgCGC
         oH2Y+qHONb0V4miMMGiW4E2B+uxd5HzaMV8+IxrJi1Qwb8z8NXEZwHr+m3TGH1FDlwf7
         URFA0xCJ1Dc6wsrDyvYsrj85NvrGzM2hQgE4xmMoOKvbZcSlegyFKuQ2deIlQIbHirv+
         dgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697776; x=1791302576;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PNZA3OWGUBccfJboMFkKmGGHfbWFVnO81DrwaEZa0c=;
        b=Ht9+61kXKNVZMFWklsmQhPDKfJ7tsmT6/AmdqM6DxBP/X+BOSEx1svm4r8DkPOOGmz
         5aTv2QmsqQUaljZQRD3s3WqJgZSh6kG2pZXFfvG6PoWABi+uzlf6uAArcXcKQDm3YORI
         +DsfrzKoTlwFhcvHouwKjwRZtlgIQgDeZGimhvavB0i9AOpv2BCiHq4LFN4nNPyItDzq
         KgF/Un2TUbVeQ1+mWo8A7o2rorprk8FpSc96khvb2hGFaH2W90RCfqrvfm1elLqFs7Pf
         ElfRb+5nouxxucyjbh5AYhKnKGSEuTrDltFGstyLgz3IXV6XGrH2cKFT9SGoi14x5vuj
         +KDw==
X-Forwarded-Encrypted: i=1; AKwUvBwCXpBh93nWlLp9NKYB3vRgVy1tl2Y5k424J9E9pgDIEdaUBj9z2rxcFdJgkLvmc7M3lRlDT+OG0Ntm8QcVNA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLZazOAYGCAnbJ6CGpZ1H20RGkaTWUQqwgIFyU6bIjzov3lNHNB
	XUQyQP+F1492S8ZDiTT0KJWNeO5/ar4YBuqXL6Qxl38xLDG7K8D9hgo=
X-Gm-Gg: AYBFou17fx7pwfNGC8T+nsEs1b1X7gckUN46y0qwM2MmI382maVgld3/2UqQ7qzBYVm
	hpaotvfcG5iv9vzcqjaGkMomdyPX3t64PvBEScFFMGzZQDn7INT/6Q+EaZgFzr/H+M2OInPAh8x
	D2hMfT6bDUxekStprM/gGgpbhZ3tbC3givZhy/GQcZHrAx9v1ms6t727Gu0NaD5ede/KWq3VIeW
	2WloOHo87uF8lVe1pmThyAxarBjqY0E3EIUMHGebx8vi0Lq2pAkyHLvr565ZaWy5NMHp23WooJc
	lBf8fPnl61iP+1KHbQMCxh1o8vKCHhBJouajg9t+ODbeyqqIZwrTS4iQHQQgTFXp1syauZ1STwh
	w+xd8A0PwvksffAh5xQjXisRla9AsQGtKswoWtXW9/wvyMDRSAfGE1RZUXWY9EF3yXFvWrj2rx7
	Ds/0huckNduSqYIzY/2x2hyVLAZryMGyRGQoO8FdqxGKB2hVb4Dx9mZiQRRffc0mkEPo9NlUQQ6
	SHrbXbbGDaGvBH80p0Wdv2UBhdABbr+OQ==
X-Received: by 2002:a05:693c:6215:b0:33b:afc9:caa9 with SMTP id 5a478bee46e88-34274332a13mr17037361eec.38.1790697743023;
        Tue, 29 Sep 2026 09:02:23 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c350c0d0fsm329394eec.4.2026.09.29.09.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 13:02:16 -0300
Message-Id: <DLRXDBH5LB8G.24QDEEJWMGJG7@gmail.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Brigham Campbell" <me@brighamcampbell.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Jori Koolstra"
 <jkoolstra@xs4all.nl>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Rae Moar" <raemoar63@gmail.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Tamir Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Yury Norov" <yury.norov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Alice
 Ryhl" <aliceryhl@google.com>, "Burak Emir" <burak.emir@gmail.com>, "Brendan
 Higgins" <brendan.higgins@linux.dev>, "David Gow" <david@davidgow.net>,
 "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.20.0
References: <cover.1790599486.git.nico.antinori.7@gmail.com>
In-Reply-To: <cover.1790599486.git.nico.antinori.7@gmail.com>

On Tue Sep 29, 2026 at 11:07 AM -03, Nicol=C3=A1s Antinori wrote:
> This patch series intends to implement two features for KUnit tests
> written in Rust. The work is based on a TODO comment made in the
> `bitmap.rs` module [1].
>
> Changelog:
> - RFC patch: [3]
>
> 1. Supporting `#[should_panic]` [2]:

For some reason, GMail is not letting me send the first patch of the
series as it marks it as spam. I'll check what happens and send a PATCH
RESEND of the series or reply this series with thah patch (I already
tried that and failed).

Apologies for the inconvenience.

Regards,
Nicol=C3=A1s=20

