Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com [74.125.229.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5814450B8CB
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 13:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859778; cv=pass; b=akjleLVbK24mk+8B/Z5fdezEWUBzwlrXi34bjGD/qn0XrqX7DEht05fLsxFaAv0S/cBCbmobRcRPg1NR9hMwwZGXNnQFxHtqx4ZWGW/4jrt7eWqp0WZcIjzAi3jyGniUwyDYRdWhvGOyf4eAjeFNuZhvXTYp/rMJFwys77TeJVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859778; c=relaxed/simple;
	bh=+tixK3qzfWgvnUC60slzVW+amwwduAv7za6OU4Pq5lI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SiOgEiJHzs+uZYAj0kQcJzornfEMr8vDHz6e+n3cYw0yCyRhS6pnGiS1w1ymGkvDro7HaRZ8Evxs1urJmD13kGny575PGaTmIyy0M5B4yB+8mMPueofqHLiRJn4ZtKK4hS5dPEax7eGG2cKRB/3irxwgQaR4kgsSVlW358uF97g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgNvUpgR; arc=pass smtp.client-ip=74.125.229.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgNvUpgR"
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-14c96a4b7c7so367640c88.2
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Oct 2026 06:02:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790859776; cv=none;
        d=google.com; s=arc-20260327;
        b=Ry7NgTFqvYQtTYaVIuUMqM4DqzEf1KGeN56eucPcic4PY+Y3Bbwu8G07EaqdbS8+Pk
         fGXHr64Nhilh5ftNlMcxX4Zi7En9lLvaxsN2CA02mqGaZv+poN8q7O/WxB7VBLXA8F1B
         kMna2Za7xsXrPtvoPRCqD1C2YpJnmeDpEpQryqGIY1ceTGhf2G1gsW4auDgjaaVgoNLD
         bJ23E4cjUkzAlMujxWAFmmIWwJuM2qf3wpLfXQgj7MdzpGUF9ILNUFR/cpJtc8Z8SGzF
         vjkkp9QGRzGiCPyErWfukZZY7zlljungNIG1uiayC5OR4VvbCcGTzCY1wsdDi6s6tNL1
         jNAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+tixK3qzfWgvnUC60slzVW+amwwduAv7za6OU4Pq5lI=;
        fh=VGJiCDTuky1Ojkd+fsubDErjUR/qEKEPp4alvTR+ihA=;
        b=AVJ0rzkcGX0r1EcrQFQyCqEsCQYtWK4KRQup+YB+/589zPLm6BnPeskX7iTsuMnwWS
         r4tSnJrU7T+KyjspUrJPxfGC9dgYWpOYRk8NwTjsMzXGOCWBt4v7w6gTGIcmAT4NuJNX
         0I+BOtmBcSLpquceJxHjut70pLvlaRIkUStwXBFT4kJfDQJbSRdfdE0XuMlpJetu/W8H
         SMVEnaCivEKP0FrTEp84AU/62p3YTEQukSRmgw3xASkE3wbiy8O5sUsyeVKXu8qWjEuh
         Q4ts2mRb2mfK2D9vclw6WgHC7jA7eeQSLdwXHHVwMdM5T9E8tL95d2EVlWsJNBbz4iBC
         YEOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790859776; x=1791464576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+tixK3qzfWgvnUC60slzVW+amwwduAv7za6OU4Pq5lI=;
        b=CgNvUpgRSayV6oCpuhMMnEBeTlh8YssbXW4cevmZVX1SQYM3s1OKbuyS4fcazEPbRa
         8kXYJNFnFM8Zxcsmb8r0im1f5g3XoEH5sqZREhGNI4fk5qulxRKrl6aFwFTL3hOEuZiB
         NioaaFJqmjkfzUSsvhZkKfE65yCQL67YhNXFtsEcJRLzGIyx49pXnocK5O+GL8Tp6ceo
         DuAwKTnyhFcpUama5IgM7xxotm47S6tzxvSWsMBZmHv/kETYnpMOsgCxSoBuEezB8fYb
         LAje6fnJB/XzlrlGn6FTSsD2dti5eNENMJ3ZBOabVWMTocobvV7xG8EOJK3Hr6XwW4Wl
         wIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859776; x=1791464576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+tixK3qzfWgvnUC60slzVW+amwwduAv7za6OU4Pq5lI=;
        b=1VUAzA9yXOprTi87f2eJtmr1h3gKpllcT4sO8fhvCAMgiYbXhKgiiyUiQbxayxRTwz
         BeGMMvCQ5DsTVYwb0DvsWWAOMY+c5EAcSSdHxwPGbG6NobAxD9HvUFBPioeSZ7jxmn2N
         gcbQmZXD2GfwIEhfk9R27zUXfOF7uleODMmyI8nX3Mc+3QvlsbZ/PnT5ZE+C+eHJgWu7
         9VttV4wx3TX479RKiYZBCzoRv3g0mrjBAokixhDe3biiWlX0g4qk8akd3ll3gx0RvGU7
         YfvLSKqcV3e5Vk1qeW0Mw4X2mdbay7uCTh8TnprKgvLVAE6hI/Nawo+0kr0oJEdB5W9x
         n+lg==
X-Forwarded-Encrypted: i=1; AKwUvBwrZemyvixu/fRi+sxVJ3xprAWHCqRUuizYxU6jG3AFEPr5wNflLEObd5opi2jW5j2siI7nlNxsX3RY5vySpQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJYDXBLDtELUzhLBZZna0iwyQolSx0N3LSjty0vEQUZl7sXrxgz
	RFOlXHQkgs/5pXIqfcdOEIoLqVaSSKWLii0j9+hiQUit49KlwYh5J3NHr7/RQSRsBf3lrQCqLgK
	zuj7C52EQUUHUiJu4izPa6zYK8Tbc7zHHbGsjzKI=
X-Gm-Gg: AYBFou3L47F44K5VsXHd9GpStUd1xjQDPDXDFe4n5sFDvjKxmGPjkzFYcH7NZ/ln/0T
	y+fMMRmikXHpYiP3DkplJRQZvDnTFweSoLCVXDWluB/3EQPa7qAyILcOLZBcSUQ+iPXw6T9GhiR
	mEjRRuKC44Jfb2fLAB76KaSgwAOyJNQ4dbFTJkBCEhITNhf/Bdf4tgqZjUuiMIp50yBIII1UiGv
	oZiuS6ycRRMw8L32iZGviXWcJheyv8Zgpj8HengG+9V4hOdGENzYFsCT0xgtl63IMXCj0co18wR
	jPtn+otYNdyJmCsei8k/ap1HEcBPOE3m9nElQJpIlFxJsF1k+MivCgFLCI9IoYv9cW383sVhp4+
	iKVUvAZA/2mb7zYKJLdpThbR29jiSPWsWRSu6DisxDPKkcbKvO6vipzmu/hqxtJ5WZ/3ht0XuJw
	sCkYlGtNdu4173hNxA9VhkyMm8GlY+4cEF+BOIvj5yFx5wSI2vSlY=
X-Received: by 2002:a05:7301:6192:10b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34cde6749bbmr8550113eec.1.1790859775900; Thu, 01 Oct 2026
 06:02:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909120210.2488674-1-tomo@flapping.org> <20260930.185028.532667902450882259.tomo@flapping.org>
 <ar4-kOdIs7z6zG6k@google.com> <20261001.210403.2208685315788982617.tomo@flapping.org>
In-Reply-To: <20261001.210403.2208685315788982617.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 Oct 2026 15:02:40 +0200
X-Gm-Features: AclHuK8TvMu4f1BwqJZ754q4kD8PFo0d3Wz5r_zshbC1-ZfB-xefTekYCfYh8D8
Message-ID: <CANiq72kZyRQR-cxYKGKLHu7CkyOGAy6KrV2PegFSnM7eHizbhA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: add mark_used macro
To: FUJITA Tomonori <tomo@flapping.org>
Cc: aliceryhl@google.com, ojeda@kernel.org, rostedt@goodmis.org, 
	gary@garyguo.net, a.hindborg@kernel.org, acourbot@nvidia.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, lossin@kernel.org, 
	mathieu.desnoyers@efficios.com, mhiramat@kernel.org, tamird@kernel.org, 
	tmgross@umich.edu, work@onurozkan.dev, linux-trace-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 2:04=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> Miguel, what do you think?

I suggested it due to seeing the multi-line combination of `if false`
and `_ =3D ...`, and the fact that we will probably want to reuse the
combination in other macros. It makes the concept more explicit,
easier to grep, and follows other cases we have created for similar
things like this (e.g. `static_assert!`).

Having said that, I do prefer using plain language instead of macros
where possible/reasonable, i.e. I don't like introducing macros and
more concepts in general just for the sake of it. On the other hand,
sometimes language features aren't the best spellings to be honest
(like the `const _` "abuse") and some people prefer abbreviations
(like the discussion on `SZ_*` constants).

Either way is fine, obviously.

Cheers,
Miguel
