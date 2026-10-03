Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C4841B8CA
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Oct 2026 12:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791030453; cv=pass; b=gdmrDXCssROfNYdRXrzAusuXirYZ9Aszf8O4ROOuqR2m4PUAJ9F2XGG/88T9rHufXy6YcHmftgWDcyciyiHmtbG48wadeWjk45OzK8roauzvcPIQ7p5r0pyib3ohAEfxN4FKVg2HxvK/DJ4SMSWBaciV1JzaA4mjsJ35SmCmh98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791030453; c=relaxed/simple;
	bh=WRC2ZsAZuRhunv+s3RLF4cY+obMu9wORkIop+4QLO34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Djvdo9rSyo0GoC9DVRIzq3AAenSW5zEyDHUsaNtUIXR/l6cAk9tBQrgozIhnC91k/wL03+dIfMoRIOQs/uGmMmKvpgLnFoJ7benlZqPzwKrk1Nl3RmUiIaIAAOZk+zHg/9t/6+qIUWHOcaaJ3qraDTelAHNAAtHtK+rs54P4JAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjSNRv0y; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjSNRv0y"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b010e8c94so34408eec.3
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Oct 2026 05:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791030451; cv=none;
        d=google.com; s=arc-20260327;
        b=Av0TBYjb5GC3nXDaTq8wHi45ucmxT+c4xm1L7PHd/xNc7wbsu8VeLosD+9bB0z2lAm
         TDs4fiJ/J+FK0JB4pYuZdKULDS5jlVJDrMSzMjVuo95WDJZ7DamDggmcD35xm/5Hd0bq
         W4bdIStCGEGFaZXUohGYR4vxj6DqT7eDTx1tx9fkvQ5PNJwVZmMlcxmo/pC6Cy4EK3kb
         1psxYRc1G84tK4w9Hpp5rDMytZ+nku7ZMM+lQ6/+x96oLTAnMCrF+e19ZRtdlpC9lQhq
         4anw4lVXSDyGjnj8UkUOwIVK60D/JQuxgCl6stoqHndUMjEtix2rKZml/iWxAfXoFfre
         GOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nciWRX1CeabRFxS/ww+D7OfrWzkB7f8+tgS0WiLuSww=;
        fh=cnRjn315kcD1DCOF3vqb3qp0V5VTBnKFu3w+eX+T/xo=;
        b=FyjsTtt8VmG6uN60RHDLjNwvILnb2Mda/GMtgTgJ8jdcaSAlZRYHphf8n9f5BdnPVs
         DTFnDge8pvool5JABoHIyQ8nBKPUmjjnsK49/y+ru49T5WB2+kWWeby7SANgQbGrM8Ko
         J1icj6iYO5BhKtbtCdBreQy16Km7lMdqT/knc1hQUQJcVBdEkKiAK3JVbqzG0bRGxfNR
         AMS0STxPgJcfHMsWli+YnpFGgH5DQ/4ZemDqoG7kTj943GPVDrrwujOU+Bjfx5pMvdTc
         jxlg6zdXBoEs4gTNhtorgB0z4VX/rhia00HUgdmknwFsQb4VLTJihddXHGWPzSNv4+M8
         vnDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791030451; x=1791635251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nciWRX1CeabRFxS/ww+D7OfrWzkB7f8+tgS0WiLuSww=;
        b=kjSNRv0ybOUgtC77f6aGwITRN702J3l+Hqyl2QHaEz4kol/+imfE1dT0Yc8jftJV1e
         RDwJpue6M/tIRgEJR3eu9jW/jHTRlgwnLXbkkGKRbCjXJJJJ81JWp8uhCJdUxYBWvu7a
         eool3WFVRL8pmu2IbNUS/c2S2PZYyUzx5Z2kfyqr0BAvYN/f/zLhvtbja38+F11Z7mCr
         9aWVbi9Yq0I3lUqf+qG5gKQDqnfc15VEqmj6vvRh2BwB68hcu5xtCYrTUC/20eOQNAjm
         +58wN7o3GTdIXAN63+xW/1Xxz8kiNuGExFhPa1+QNyde5HqSHfdNCIsVpCCn8Fwf4hoo
         p/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791030451; x=1791635251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nciWRX1CeabRFxS/ww+D7OfrWzkB7f8+tgS0WiLuSww=;
        b=voebhx5wfVO1ZLKacKiVT8n2JsE787SLowV0A0ekpdNs+Qy1E0YZeaGNXEclRDMzVP
         d+gNObPtINzrXmpp7ee20TMaehEcQzQPw6fECKfqiKq/7eUxpilWBFhKe4crkDc2LuQQ
         G2chg/qF620+pNAJWu5/i9qG7JSDIk5D8RQPE/Q9BVG7+oRb9xzK+1ZZh2bVrUk1UzGL
         LwKp2ZNyvJjag2z8Ez7fPaNUMIWMkRd0SnNdC3++jVxMf9ffRbGq4tkE2GKJkGLROwrK
         vFUws/Dt37a0Il9Vc/VI1eMCmJbMG1mQ/fkqjMg6qEMASsWXY8xSHaUyP7u7Bbu6km7x
         MJ9w==
X-Forwarded-Encrypted: i=1; AKwUvByWEqzWUjcPps/jHbHZBwjcTpFCqBsECJLZSjXu+CsYs1R+7Cy/x29RWwtXQ6GAw2XzvwOODvv/EEqEPxiwLQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK+3FSyUhK0DDwT2MnWx3MvYAZtZ1LTxjUFyYMpndxhIYz9VD1n
	aiouauRMfQ+q6xoxE1GDi5qnJPGLzoBfbd8pl7IV2OE2/MKAYCp65u9idvRuanwqPsNEiQr2+eh
	qXxcDyPjVKUeSRnjixcmWPaNBKCty0zk=
X-Gm-Gg: AYBFou2nTiats1XKoZvxYBHFbDYsXxUYgGu4M5XmVuKjhdMJ4O82HsA25DE8YFCbObf
	7TOoaCfhepI5qwbBAMyYFBel+aZC5ZNJaah5UE6RxxPzUSXlWn31hPmzHAEI4fNsMOuX66UGLBf
	dpG95ZuZ6HPolbLZjcoY0EXAgNtJziuGu0vEHs7tAaPLAF5HcnTSR7zTWhcjCvEJ5lqpPIQlQV3
	JejWqG3qg1oAZZDiEz70I5/G24n1fMmascKkejXODp1QG2qXjkc91XJcrwt2ynqScnEWZlS6t6F
	SeEuC7Hc8TwYhdwUUL1gvjB7r7mrhTpW2kQhiKqypSLlz2g4PgAJMQQVu4KDPcn3vW9dv6wMtjz
	JVREF4NwbgWT0GGq0f8lf8w0x9gFCYGcBceYGRQ32+f/16866zuhrhIJBZthwod43dJtwd+tICg
	/souadtYNar2bRCFsR9gW61Fo4FGvt1jcCwIqNHY5G1ZTPLur10FQ=
X-Received: by 2002:a05:693c:8951:20b0:34c:15b5:b4e7 with SMTP id
 5a478bee46e88-34f1503d60cmr10692389eec.2.1791030451112; Sat, 03 Oct 2026
 05:27:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-kunit-v2-0-eda3ed6c00c5@garyguo.net>
In-Reply-To: <20260902-kunit-v2-0-eda3ed6c00c5@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 3 Oct 2026 14:27:17 +0200
X-Gm-Features: AclHuK9DwEiR8riAHJ99e7wWWIvXaYD8TEoP937-DUXdEOHBiBspgOjN68JgAw8
Message-ID: <CANiq72nAhupkFYjRxEvpaDw_CAFZaSSdDCKFjG-3r3PyouEs1Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] rust: doctest: unify with other kunit tests
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 12:00=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> Currently in Rust, kunit tests are handled with `kunit_tests`, while the
> doctests generate a lot `extern "C"` functions and invoke them through a
> generated C wrapper.
>
> This is currently needed because of the special treatment of file name an=
d
> line numbers from doctests. Convert them to override `file!()` and
> `line!()` macro instead, and use them inside `kunit_assert!`.
>
> With this it is possible to just generate `#[kunit_tests]` and `#[test]`
> for doctests.
>
> David mentioned in [1] that this should route via the Rust tree.
>
> Link: https://lore.kernel.org/rust-for-linux/e30d16ec-f5a3-4cd8-9b25-96e0=
dfa8b9d2@davidgow.net/ [1]
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks everyone!

    [ Removed spurious `///`-to-`//` change and adjusted `line!` to match.
      Added a comment to match `file!`'s. Made `NOTE:` more precise. Reword=
ed
      to say it is only one doctest being updated. - Miguel ]

    [ Removed generated file from `rust/.gitignore` and added it to
      `scripts/remove-stale-files`. - Miguel ]

Cheers,
Miguel
