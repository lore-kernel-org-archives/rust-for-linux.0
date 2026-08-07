Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D58388371
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 06:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085698; cv=pass; b=ebMJGgJavoZE8uglsWDryr0ja9ehFrDUjOMl/NCwEh/9uGn9hdXU23kOQ26sZYQJRZ4O3l3cw2cog6uKr6+LldwUDjoMCnqW0wyKLh+7kmZflYSJQw3Vp8LpcQHvpeVVP2RQTy6S/IG59544d3pClwNrEP0ySOulK0fpgJdngKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085698; c=relaxed/simple;
	bh=eXecMis04p/qxD8Q75ODIPsKx6640DQP+yHLlpoDkyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eovgaTRBxbh25Qo9UGAVhjBNCU+71KS6B/5cShKw0L12JWuN5t9+DW/DxyEj8TbfYPBnWCx0yK7a0VhyKurA4blcv2UfifYp4DlqZLJmS/tYcc3T5muv7pHh26DRvV7WPzTJvNIGtFcRyRhCZfeNhN9JZCHlaz89shINbgKqTBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSo/n73R; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSo/n73R"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf110997efso6374875ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Aug 2026 23:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786085697; cv=none;
        d=google.com; s=arc-20260327;
        b=mtAS5Oeu6k5KKRN/kNMMsVRfrwfgxknwjXlAoQxJP0xyM2AqLpYNvupuuRTyCWVWf4
         MHYlqyJgKxdOazYNLA+m25TR79pYsIuIC28oOIeoI9VQdPbJoI9FS4HI6VJAYUQ8pP1E
         03TETbSoFLNqzLd2Ib4EjAVlexrtwlJa7HaV2/VJbeO/pFMkTRVWS+My1WgCNAsIx2qi
         FA6g1i1Vbd7BRfrfqC+FFWilAq2IN1iS6njOmejXQ8zqLAABK3Jo1leLeKiAN2AGjiGm
         vIy5OzG0NAnElHp5maN8K9MhJeYgXHvATUbADMcVwmKHR9/bVExhe/G5TCWpOnofgOd2
         hi5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eXecMis04p/qxD8Q75ODIPsKx6640DQP+yHLlpoDkyE=;
        fh=LZJ9bfWtiaNW3iOiJuNyCOpeMurNrYyNk+WXtlYrwF4=;
        b=E7402cGbK6BN1Lmm9sw2PLjSpVUDIyIPxaERbzsPE5UBS/OnhOdPyXX6npGdPymHZo
         flAUimiYQfyosvw2LvhobEmy1pT2Th/g6iDDFHRUeZS/SiJByLg5yWZDy7x0DQ0IHPF0
         QD2JAvWL7EBrgwi86jcgFmE2NaV0lZwne7n9g0ahRd8STAI0qVDhvPUbIK+aY7aE3UlS
         3z6Sg/BqyIsJYdi1jzoBrkkbgg1yAl4QMJnYXeNY0rgTBpdyzkWnBCeyCKYvxWcYPFcC
         WfJfPC/XGnfoWUt1nbpyxWmHcby870H1Shb8vgYYtjpRHm9RM9UsOQs7p0ZcUn03or63
         EOag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786085697; x=1786690497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eXecMis04p/qxD8Q75ODIPsKx6640DQP+yHLlpoDkyE=;
        b=JSo/n73R2IaPGqhUVAfsTbMHPV2V09rune+Zpgz212C/8IwZRbvuoJot27VksDWGWo
         ZaxlYhW3vNV0COe+NlmCxoeqJcWyjBl8qxEzEoZrNUFxpYfAcN7AS041F0MctGA9SqwH
         ndyONZaJad7Zj8t29247p2iK3GuvfY9QuTj6EGraYonoyu/uNM1g63e1Y0EcYLYOSdke
         ZWFVZ16fkKTAbCLi7N0CvV2MmmhXyWc2XsODGGCFIhkMtFvv7zplBXmLyY0qNXw333lr
         pBiXvuSvNTWBv+SzyxjvlTOvGVX8yjvCinJlq9fPL3ePKYCaU0GMhVPiG64pZ5+xcnoi
         AbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085697; x=1786690497;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eXecMis04p/qxD8Q75ODIPsKx6640DQP+yHLlpoDkyE=;
        b=LFlZ5GFdGY0zvncRmSOrHaOoOc2320eEgiMgMmDhZSuCfv53VjUB/dZfc9r6J5WiuN
         mecgkJRWZdBut2hF3j2JM2Novlz0aIjlXWEvoztfWFiZrVU3Q5hsPGWSeZ2Tnmri5mUc
         ls9hVnvCBvuZisQppoULYiaUUXpYqqsjq+pO0sfTSiCqod8W7q6OKmW7OD8hstkiF22I
         SqO5uF2E9x8Z0NyVgtLjbF/W5yIPTjsULd22A53SzzWQW/7P5ET194/HWKIdqWtqoXeo
         Hx5qUtdyAZx6X781069hkDG9yz7rhGxCbhTinh8V+fZtvMOI+3AtJCnzaW2tYG1LvqrU
         wSYQ==
X-Forwarded-Encrypted: i=1; AHgh+RppjWJ9gaZ/LhQYrxFiWuNmAwyDwqgedm3KSY3SHvWGtcrrfBfXbblfP3DRPWEGFnGBJDFlVPnz+kexKEcGlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl/FYRvg9z16mbKS43gqGYJPPZNapRlQ4NmFWDBXVMLEsagPoD
	YtMbBcU4JyXZvqqg8FFXESyu6h9tCA0aleWmFo+yAta7XpMn0l39fi3mPpm3gyw9qqx7Cxmk4Iw
	UVfKUTWxe5fwWYACf5MU2ehVhn2DsI6I=
X-Gm-Gg: AR+sD12Ig9R8aZXddhtc7sxxuaet4X4MrWWDYMzIZ56aDV4298xIi5reuJz9CMniJrc
	DGpNA6IXDLF1t0pzYbHM3TvGsltAxBowThPYJFYl43gBfkogdkOpF471ZU5R1GdLFIfCKANlsUB
	NVSgvYnerCT81Lu3oNunanYXiqrKqQ+WvmiYUOeLLkjhFIwrUzNpPPPdrbfhU6OMvj/k89dWKWz
	8zWtEa2sy3SKz6HcWeLeFj/G6xtClTDWxiDCSwz2rSGqw2GAqrqjubEKYGfK4grbWttyr6GnYPZ
	r5/Z0am0eIZ0gyetzhdSr3/UlRPJrG6DDaG91/HIY48Z6oATDou2VRz5tI6eiepBTRrymkhkfhA
	u7BP6QBpGtguv/NmjPoiCu2cE5exNXrNv52iFdM3POn/xKl/TyocGBEvY8P+b
X-Received: by 2002:a05:6a20:9392:b0:3c3:a491:cd10 with SMTP id
 adf61e73a8af0-3cb85dcaf65mr15706800637.1.1786085696821; Thu, 06 Aug 2026
 23:54:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801022501.722493-1-tomo@flapping.org> <CANiq72kzmPnu_UPHryLMSwGMmTruirNUL5H+aD4tMiNUqqRELw@mail.gmail.com>
In-Reply-To: <CANiq72kzmPnu_UPHryLMSwGMmTruirNUL5H+aD4tMiNUqqRELw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Aug 2026 08:54:43 +0200
X-Gm-Features: AUfX_myi2BDsNwM3e_swkA6TipakMQGHd_q39mA07wS2XPVsTvKNrOxsIPS0Pck
Message-ID: <CANiq72mRjEYce052YhAr5MAoiwCqYGbxs8aECjo-=gCqbmJB2w@mail.gmail.com>
Subject: Re: [PATCH v1] rust: bug: fix warn_on macro build error on UML
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, richard@nod.at, anton.ivanov@cambridgegreys.com, 
	johannes@sipsolutions.net, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net, 
	lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, linux-um@lists.infradead.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, David Gow <david@davidgow.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 8:52=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> And Cc'ing David for UML in case he is interested.

Old email address from the contacts, sorry -- re-Cc'ing.

Cheers,
Miguel
