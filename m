Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A7C378D72
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Jul 2026 12:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783254158; cv=pass; b=SuBN5Hl8aTrPfelWa4RBdb9+dwZmsB5U5ky5T9n8VyfvdzUb1ATu1zHuaxChSj+rEa0YXXEqUjctOVEjZNqEcXuk3PHfVoGrbTaImmmoKkKUh4M8w3ej9zCpWjYE4IKeFmOlL9jKhVMVL9fEPsj4KBBmwRismh10ko56hApNcQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783254158; c=relaxed/simple;
	bh=cVZuwq26LJUbjnXW20W3nbICqbmkh5x02bCyytPFsmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=KknYbSY51wZQdYBoz0ypVhYTvphBiecfNn6xLWXeNrk2iauU3Z0kKAKDi4Etjua7lzzWk4kPrc6JM1awmxWpTj85E1nspo/1EoStJe72M/0yJ5pP+9UVF2nqrZ14+Y4QB+grKw7YQE7g13mpUkEccx5TCrlTF4/UmGvvwLzHGhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhyjfxyA; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhyjfxyA"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-384422b05b5so192160a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Jul 2026 05:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783254156; cv=none;
        d=google.com; s=arc-20260327;
        b=sQe2OKsRLlalT8X/eUVX0IXPwFh8nZClExdrr7fcFMV/M/V6swnXXtgswDIQ5+ficg
         WRsVdLYRWYk8guOppPyqDq5BCb79AEJxMh8xMvR+ufeh2uzhOgg/mT1Dn7yVAAQ64IQz
         qanzBFm5nn65D9wG8O9jO02Yx6U0yn6jY5pHO6DxQ8fJSbTWGzJqqxDCEZP4NR7eP40d
         h/wxCu1cayjp/0qxUTd8o6UElB5g1kxdV4lf0L4kKGXqaOmkkK4PUPoweN5oxKoIBxoK
         zuaG5/DkEJKTHeQ9T+HaViFGUP7SoROZ1Z7vbDV51bMUM/T8BSnwcHAqvz7ZaP5zxoG1
         Ms0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cVZuwq26LJUbjnXW20W3nbICqbmkh5x02bCyytPFsmg=;
        fh=nI01TQmrNJFJXFqLFDrPapkocKyd9xhf0cisONDKYnA=;
        b=iL0wat/hZBU08gihI3/FmrP1DK9oEYr67ts6JT57JQeiil4cXDp6BfMprZ4TXUg9uZ
         m19nJZ2rcL9sxpc0pz311pz5J52WPawhBt5W6oaK7cRmEDHxuaI3NcWmLzr+hkMT4628
         i/bJYuhsdU5rEMCnh1dhNdr8HCOplXmo0S+ZHA8k9cPhxIPUyLCqos7jT1MRhXPB2Gvk
         cGTFYwOXeVgmQEDUdUhweii+h8iSh0cTljjYiAeicUwaCe37NJGxD9GefTwL4YIVVW27
         dsHpZOojGfHbpxxGPPPBCn8Ol0wgqG/Pc8fyi1U+EEefjQyrdhQoZaOr1xOcwkUTr4Rv
         dQJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783254156; x=1783858956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVZuwq26LJUbjnXW20W3nbICqbmkh5x02bCyytPFsmg=;
        b=QhyjfxyATsOCVoQS1jHI7Mibm0pDUoc6hvz2g2DThUIjMUZJYAjaB/pjXj01gPkIvn
         PfUDF6VcZ+4vAS7mRO+8Tu3Lek9RvxtWQm6vEWu+ZDOW5AK4Z2AeTmPW7czcovGoyDq+
         ZVfrkt65J2lj7P8VTHHGIiyLDSOzsCql4fpQd+xA3DHo+FO0qg5BnVIv89TaShPzevFS
         Feej2fjYBtwo/K6so4aFuH7GfGlzqB/U/o8s3WKhvQfbIC106TCgOzeeVrhGV6CfgDRS
         fMD5LzSJzRbtv+Zn8VTyus83i47Pak+MLGzJSR5JcGngV0B0yK2vCcDoH0cgBqVjL5KU
         +I3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783254156; x=1783858956;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVZuwq26LJUbjnXW20W3nbICqbmkh5x02bCyytPFsmg=;
        b=g9PQJS2VYP2lTlrMJV0Bua1ah1CK0/rbQqr6izrM52FwPQlkk0JmwNktXQdy69/5U/
         ANunJQe5WowNeLIKGT2R9yE3pCota+pYb5BIbEhEJjAUGsXf4CSKprfnQGY7j69nB4IY
         at6YbbaRT8TlfqONI10itY+QchtChHaDpRIkEaGO14GwOkxE30p03NSaJQ+nP2HoZ4hy
         HWtWlPSQHsNu+wE/ZuRk1MH5bWu2A5QLi+R655GzbT0fHBni0olsRcJUtWNLJj6IYM7X
         t3+4kcD2YVs3626QEW/PZ8irnjRxRjO/Do+H6IGDsREbvvaUivtxmvlsA2Nl90wV3cDk
         6lEw==
X-Forwarded-Encrypted: i=1; AHgh+RoMF3sW9uyLLvGs4RksdVhKFMWyDpeoZzK2mP9UBJEemPW5R+rGPZN3dyDhflJhpZf6P4ggGpY79C169/pG6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdNsRwtvpzPpFUodtFZR7x7ZcqBOQ4QEIbkHHNJibF4ZQ0q8Pg
	2feaGJqOF78UGmGIbwQ0JH78DlGfCD/KNDYF4fjvFgZyilLtzoYJ382kd9SYiE+cUbyia33ymyO
	4ck0fYs4SmB8VnEozoL5/tvITVS/BZx8=
X-Gm-Gg: AfdE7cmLfqEELfUg0aNexHiqRoFlsLU5AH//xsygLpt0DmYvGL3G6VL3Gi005XvuQpq
	dZRrV5GXs0rWklIFvKn6nmUaFLBefiFn68mmT97Irz8Z294dQLYIYj7uMF7rcBoQDAQCzyWTOQ2
	vQ7fmqD2KCm1gtiEveA1tgo3i8RQ/ZPAohW2MrfJLlFRwNF4vNX8A6kYXz5TlzoFoTB4Iu8ZUc9
	5/5Umc8CJBHjj7GWI1lch82GUZGzFvCUAfdl8zKXYjTded+8Y7PeXhm+cY8ESHjEo1PDEGEoTWK
	p2zi37oAR/V8BWZXHMxuJa5zE9XNGGqBwFXbvGNhrrSugENCyeNQUkWysvJ/MChO14OAQ6FntDS
	IAZ0V6XhrfINx
X-Received: by 2002:a17:90a:a416:b0:383:5a16:bd67 with SMTP id
 98e67ed59e1d1-3835a16bddcmr2702118a91.4.1783254156186; Sun, 05 Jul 2026
 05:22:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
 <c89a1bc8-6cc1-4e16-ac95-add389e45a2b@lunn.ch> <akmnh0AKFfu9-OYn@gurudas.dev>
In-Reply-To: <akmnh0AKFfu9-OYn@gurudas.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Jul 2026 14:22:20 +0200
X-Gm-Features: AVVi8CdKZk1uQg3RyoO9gWWnGdg1D5rtqZ5BcTTqS2w4TtsLqn1TqMImL9QufHY
Message-ID: <CANiq72k0zokLC_L2wPJRDb_CyvnJznOSKUgTaiHo87GT6Pwyag@mail.gmail.com>
Subject: Re: [PATCH 0/7] rust: Use kernel style vertical imports in various drivers
To: Andrew Lunn <andrew@lunn.ch>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jens Axboe <axboe@kernel.dk>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-block@vger.kernel.org, netdev@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 2:38=E2=80=AFAM Guru Das Srinagesh <linux@gurudas.de=
v> wrote:
>
> Miguel, could you please indicate if you have a preference here?

Gary is right -- it depends.

Generally speaking, it is best to do changes through each tree;
especially so if it is the kind of thing that may be prone to
conflicts.

In certain cases, yes, I may take treewide changes, with Acked-by's
from maintainers (and very exceptionally I have done it without that
if e.g. it is trivial enough and enough time has passed -- trusting
that people trust me to do so).

It is part of why the Rust tree exists, i.e. as a fallback and also
for convenience in certain cases.

I hope that clarifies.

Cheers,
Miguel
