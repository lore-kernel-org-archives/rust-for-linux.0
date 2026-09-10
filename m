Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFA94BFE90
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 14:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050049; cv=pass; b=BEmyy9/yDIImUjJJcs480QcpMibZCKA6up5ctgLmmgf2PR7eYgXsDd0K2idxY/OXwTdFmx/czqRYEW8rS5wIlEJ9cYxBggGozRVgz7AtNbEwHRUi3J3KWUm2wvjOIVHghwIcWa1dpw/scF4XGFmE+h7corsTks6+bVnCvnH5n+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050049; c=relaxed/simple;
	bh=kHC7Ae2Tl3n/mBGFrKAMMqnaWcYKFzJ/lmrhtoGI6qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K4eBcHZno9TNTxYoHVLFCLIq9sB7dwwf4AKGnaSQexxj+rU0BuR3Nkb5JCQvAW/1un4er5t6KtUGxXysCccc6D3aWzYmPTKpeNetNN8YYWH9xwDt4aKxyCzyY9IoSIZzKNdVrWtA92AB5MEqaOEc0TwQHT4qtjwYX2CjrA+t7Zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=OKWZu9ym; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="OKWZu9ym"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbee846deecso1083606a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 07:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789050047; cv=none;
        d=google.com; s=arc-20260327;
        b=UmWBesG1+NA7/+vC0gVgUyLikuCZpdYFsuR8fnCpW1bAXVe6BTGL/eBPoQkNDerKCh
         IC0BgV83q8yT2djtAWDh5xEJBQMYMsTDdr9FQzoWWheFXFB3ST9p+w3RttyctY4Le5Fc
         HQDWCP+D67XPPq2NjP39EyAe0oKWEIeiMfheI4DEGZojoBNu5PbvaC0ZrFPWrdFlPyJ2
         l7mqqdPAZSrP7ii9EaqIgVfrd3BvOPL7PJyvdvD2VYxaYTOnO3mGlpzhfe0sC9N04DaO
         ei88XKBJ1R81Gy53Tz0k5F/RN15qyAJFEY2WlcGywwkgSYJ2EOxhixymMBDUNCYXn/2i
         MaCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kHC7Ae2Tl3n/mBGFrKAMMqnaWcYKFzJ/lmrhtoGI6qk=;
        fh=fZLOGkzAwwlxNAMhTlll1y4eNuYJshW896/zNfuX5o8=;
        b=PSYY9pEYM4fHzquJRGyP/TYClVHP7zUwAhRwcKBYVB3K8ToQ7A8acQr99iI+B5cMXh
         i/InuSlA/NvcQPrrMFBIxIxZlnXTSZ481VYJPIj7YXDLZwtoIE1VU8c0diAkZhTwJgbx
         AlJ/t4ggUI13Dt/sxbC/smPKqhT51sknHhVeHCCbJYhCP5fEE0K/d7IXJpwM9D7TMcZF
         /vRmnAaAbJJhTZI8act1U3U1VUPSYEAgyZqqHfqNhczthCTM+AChFTPfgFrxINMiXQmC
         7JhS8gsSmkBge3em1La7pes6ZoIPylhN0AAeJh5UMoXygeA7XHw9Y0r7n6ejuYayphx0
         ZJKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789050047; x=1789654847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kHC7Ae2Tl3n/mBGFrKAMMqnaWcYKFzJ/lmrhtoGI6qk=;
        b=OKWZu9ymn5Qz7S+ShDmSTTthKUZeP3gaCnqLBGMgefhkXxhD86vbg55xU5i7guRuxH
         tuDOseuQNTmzNudvxG3q5VkH1w2N0jYOGYgb3C7m2bcAmX96MarVNxVJQyjgJ/n5Wg6X
         0ZXRHJSjkOVBvbAtSamErddfmjFNwTAqakZtpabCWTOmZQGPLn95ElLpQWmAZhYadGEV
         4dpNNSQcP//3YP+SWt6AdzRg/HEM87YA/YcPSnAu9lmq/6n97OlSNFdaigmILrfcPKZe
         2spGQGnYs7umBRplsH2Q0tXWQi9R6ACdBiqN3aERgdw4OnWeR2mm3hh62At83dx/WOhl
         KbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050047; x=1789654847;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kHC7Ae2Tl3n/mBGFrKAMMqnaWcYKFzJ/lmrhtoGI6qk=;
        b=gR+9DxEhDzleUrUMpAc4okzRialtTFEmR6E+c7UgMQdudt3nyGlTOnJC91QKF/qKcw
         B1zrXCywCDcxZoq3qKUuzqo5dEHgUGVYax6HXQ72rixJ3kRh36EjV0l43Efb9N1jVUr3
         eT6I1MRHW0ZyW1/bqGIQTP4p80rKHVOfjV9f7r97nUOFx+Xv+voovwQdFsUwCramdRb/
         J94KURGg3ROqkwpmg3yZ+fI1QlJ14O9mFJ8bpHqOBiTMOhjQPyNSU2U6erGiPdaWgNb6
         bwjsrkdlEv1tk+priX0bgDifLRb9h6DwRXzYfhD3mgX6GTYW/cYVJZdw5ByNwKV2a04Z
         E6YQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQ4MboE4u6YA9n5LRNOj2nejkZd009elnmu/uGzmlfO0XtAWc+Oo3eJ+h3/850xfTJYz/63AqzXJK4ngP8Sg==@vger.kernel.org
X-Gm-Message-State: AFuF++kfJhICrPJj6sSow5AYrAN02b38KVqxTHU/NToJ4tGk8VO7Xrxu
	6aAn4YieYehFlVI8hVzMZrsWoyf7X2rAHC+e76n7mDVg1udWiuzpGFGoBr6WAG8eRC8w6d8j0Ko
	Vn1EayVfegueQBpPo6wMSPjgACNeMOlB0hh+RgFOY
X-Gm-Gg: AYBFou3CQUaOpodPzAJIOIDzESVmRLbqBGg1/2DrTfOmJidxnH/pT6GNptWIQchMa59
	z0uudShPSlnHgI8TL5v5L4FqGjSJToBip2m6xi+uiT22l5lOslB4BrhiPxFFWtHholFvvk1UxNu
	am82aX1Bv8wc9f5cU+L++1Jqr71xPh7a1OYj9RYMy+AwET8vKAadfiUg2+9KHXx/O1f3le/okr0
	rdboPJC4bV99VMHS9zwoTeNokBEnwzM1pV/YjVCvMuHazbWAb0RpssMkoG0YQX72xmONSBpCzgZ
	Gga94GIUl9FUNLmXZkLX8x88WVS3fUxSauK0UwcDA4/VW4Et9Olg5437wapGfNO1xQDkvwLM6Xv
	hSxV11eJwoi4=
X-Received: by 2002:a17:90a:dfd0:b0:396:61f1:da5c with SMTP id
 98e67ed59e1d1-39b260de667mr62254361a91.4.1789050047048; Thu, 10 Sep 2026
 07:20:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828024335.946-1-nils.lehnen@proton.me> <CANiq72mn2vvCL2VP8yJxmzXM4n+jfV4R7arUcj4UXSi04y5sfQ@mail.gmail.com>
 <CAHC9VhSuuNmdRQ5puaxWh5ez3Dz9LhtAmZU40SUGgEAL8Sn9-w@mail.gmail.com> <CANiq72m0yYRj75RQBRprcHTrqfd7=m_OnZAAQfZdO9T3dfUQdw@mail.gmail.com>
In-Reply-To: <CANiq72m0yYRj75RQBRprcHTrqfd7=m_OnZAAQfZdO9T3dfUQdw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 10 Sep 2026 10:20:34 -0400
X-Gm-Features: AcwNN1XQpJke8Xbxx6RwTk63Zpj7bDWuOMMs7moVd1l9uyfsDlmCNzMgiT1n-QI
Message-ID: <CAHC9VhRjjJpv95AgF6cnOdh4g3gC4zViRoiHVehMLx-Fv9b1vw@mail.gmail.com>
Subject: Re: [PATCH] rust: security: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nils Lehnen <nils.lehnen@proton.me>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur Ozkan <work@onurozkan.dev>, 
	Atharv Dubey <atharvd440@gmail.com>, Ke Sun <sunke@kylinos.cn>, 
	linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 6:43=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Wed, Sep 9, 2026 at 11:51=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> >
> > Looks fine to me, I'm assuming the Rust folks would prefer to take this=
 patch?
>
> Up to you! If usually patches go through your tree, then that is fine;
> otherwise, I am happy to take it of course (ideally with an Acked-by).

I'm not sure we have a "usually" yet with the Rust LSM glue code, but
I'm happy to take this patch :)

Since you've already reviewed it, can I add your Reviewed-by tag?

--=20
paul-moore.com
