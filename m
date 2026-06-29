Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EA73783CC
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 09:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726235; cv=pass; b=nv3yvz1jsx7QVuI6Z+21mPrrqlbvYFXvJ11ZU1Czz2nDqCm5GjCiUIHuXB1doswq6HohklRpd2IofHtbt/T4Khkb71J0iW4bEmaLdt4FdTOgnPpomE73XMRTX+FJ53rgh6oi8G5bXPxFSzjP4rjC8mqKfb13S2Q+Wpy+agvVASg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726235; c=relaxed/simple;
	bh=JfkKFegQY1WhQWdK5D9ZTbBKn2OYqD8jwYnp6jmR+xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3yjimEpJiDQ/iUjlsqy7qHnr1K0pbmkALinyt7HZ6pH9aPg9CNGktf9wWoEu1x5zAAJJ/du1MjRhE4a95Vi1V7oWTOeGePhPXE3q8FcR+EwAAE+A1K/DqgYL0c3uIiz/ijHL54HQUbU7hh2ZNj6buKcv8IN66v2jYPR7B2dag0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCj8O26y; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCj8O26y"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30bb87c90deso362080eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 02:43:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782726234; cv=none;
        d=google.com; s=arc-20260327;
        b=BI5AhvAcyq5z2Cr199qE10EHBQKj+h4X+Px7dKE/agg5MdmvY+lozVDlZWUM/fgGlI
         6eu2IpQr0JNbHCvgdqKULljXOLg1B6y2Ty+6waN7I7cilcj14GmUFdNWOTRKRrEnZpyF
         8fTh+cPWUG/xPtyNbka696RzVST0WAoUKzG9dxSUv+VY5G3NZ3okIYZwW8HapEeYXxN/
         haSrlMh0Coz1TVG4xBTXuLVDFfGFgjewYimEP2s89XMZyRoKkeFBFVc/Acj0xAdLXr2e
         IUVWEMZH3XD7O5JlICXHID0CcyC5YkuC4wGInAYpyY4RdK2bSXvDvmj1bn8k8Sl2LoWl
         4GOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0VUrCflsEpPc8IznCfEN9hlFAeMr5Dc+AV1DM4Uw7YA=;
        fh=fk6dfkCB4JLKVgxINnDOG01A05Glbv5GWg94c1L1sjg=;
        b=A3I6DMt+taV5f0QMhnQnrCj6ZILeAIRwerDXOMUVmShkcODIhtEswYQwkq+rNNrAiG
         mynE9E9Mw6Hzze4KcvNBdsdyJ5o7CaF86ij4o8H8RqRSn14+SyYpAhBo9gOmuKl/Krnh
         NrMzLlzA6/OZnbucPz105o+E2zYKgN26i8EHBewcyTQmV/cB4Qbz9z3DTBEvauU5ckTn
         REX4Fh1l4GgbpSm1hykSFkCXA8tVtX5E00IEmUGYileX7pSkKRoTHKqCmDIjwb+tkxSz
         GjA3XgG2F9tGRG1hptkhswThBrEYzr2oMJ9sbzkjUNvx6l8mmy1nvEu6glC1fVYaAWsJ
         bJLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782726234; x=1783331034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0VUrCflsEpPc8IznCfEN9hlFAeMr5Dc+AV1DM4Uw7YA=;
        b=MCj8O26yWjEu59btNiqnbSihshsamziT41w0Ia2THHgQHn/vJ5OGdLNmQxnD7osd/B
         LyoUfaUJiIyUiWqBg8iydygpO7CeWuWocj3RczbApBC45nE3x6oxucKu3tts/uacv+ef
         61ffeuy0Ww0qz2GLsL86ztPeiNUsp+ZU1i5RVSrN7CuOmtvE6WGoQly1xhrt+ynpHqGt
         J608LcAtVWbcZ9lbGdQonii2TAF4VRVL5rcc+y4rn50EoEy5bMg06g7/4gyioHJknHhh
         wutGzs+zvSR+NIEPLulqii4o9M1fz0HHtZBehlePICHb27rJI/qhJpFdVLEjaOEian4j
         /nbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726234; x=1783331034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VUrCflsEpPc8IznCfEN9hlFAeMr5Dc+AV1DM4Uw7YA=;
        b=C0JWLYwn2IMPl+eC1vVowbDS4hfSEAwZPWgQJWHYaXb1u3jYIylcbfWlmH5hdRrd/1
         7IBlALrhpI+AmiY+5xAGf+O77gEhlvee5IBs94AN3IMdWF0FWbntv29EfPxuFnxxcwob
         /Hb3gFX1ucbaKo6c6Cpa9VtHBMahWLpfMyVuUC/4G7BlzsqXIaVfqtCENyb/rUIaMhXP
         I+shBuKjllub5pSd210SDH8xfOqrczfxL9J8A2anR2OqiZD3+GMOjos1QmMdzjFT12Fs
         ciQ1ht2prjl+nyx0nF9ZSfDHLZ4/dwA1q2jselOTnt25aHTHrxiPgEulMqNkOl1sIBkX
         YYnw==
X-Forwarded-Encrypted: i=1; AHgh+RoXZwfVt9mbaWJjT0eUIZMpqGmFx54h/CZlsBwxFOlGGCyH0I1imn/uNkmqiRedI0YkOY+SEBLfnYrR94AgeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Guw9hfKFAhXP2SdxsyvkmoekOAKU1SoUQzuVarHt1zc9Wbvf
	hIPnKd0gDJmRcfSG1QKgz3OWtcNZ6sp7Rb1l+ApsTdXkEiXOEdzm3WK01pmewA7MIU28hY0WH6J
	iVojGmbC4kmo0wNvi8mSb53W711dAskA=
X-Gm-Gg: AfdE7cmzS71ow37wXjx3pSSJ0tS0iWQd9jtLayI/k0ib4wpGDfuKgcQOgkU7t8H7XNW
	fm29/x7lVLmzlqKq0Qv7LX3Cxt9LhR8DadYg74yIFpzS3VVuKeYMye3CJ1I7tZgCfL+sZTL3M4a
	fuiqLV7QbsxO+INOgt0hbtseJB8aRDsz564+b0BOEQNI46FvwteoJIPDiSWgtoR0yp0juXI3+yO
	nbcfV3lOzWhXoP2u5vw6rQid3OdsI55vB28IzsqL6x9Pjsb5U8A78Tgr8nW8QDv4xeInWmIG4/A
	D3YXCYOwlgqpvVnuw30Th48rqBPOIkjeLTyQNuAhT0aNz6VKtL0XWVgdcM3UbEn47lSW4iTj2Lj
	+KvOoVpTa574P
X-Received: by 2002:a05:7300:2327:b0:30e:cb91:657d with SMTP id
 5a478bee46e88-30ecb9169efmr1264901eec.5.1782726233809; Mon, 29 Jun 2026
 02:43:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-backport-cfg_select-v1-0-388d5d31d9d4@nikableh.moe> <CANiq72kG8k3mk+Xjr6q7aKg212QUNtZk5w4rxV=UGR5UXKE_ng@mail.gmail.com>
In-Reply-To: <CANiq72kG8k3mk+Xjr6q7aKg212QUNtZk5w4rxV=UGR5UXKE_ng@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jun 2026 11:43:40 +0200
X-Gm-Features: AVVi8CfGwENSw9fJYhMjSNirdJAC6-UBxvIKkCSq6p_t1bQ99ZdvDWf23-Hp31g
Message-ID: <CANiq72mDsKVs7rE6XYJ6iQ=h7=HFfparWzn-xMcJD++p_HLq6g@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: kernel: add cfg_select! and use it for
 config-based selection
To: Nika Krasnova <nika@nikableh.moe>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Yury Norov <yury.norov@gmail.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 11:38=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> For instance, instead of waiting for the MSRV bump, could we already
> use the upstream one since Rust 1.91.0? That means that we are already
> sure we are using the upstream one as-is.

By the way, this also applies for the docs -- we will eventually use
upstream's, and thus it is best to try to match the docs too.

It also means we probably want to put this into `std_vendor.rs` if we
are going to copy-paste the docs verbatim, even if it is not code as
such (no implementation upstream since it is a built-in).

E.g. for a similar case, please see:

  https://lore.kernel.org/rust-for-linux/20260406095820.465994-2-ojeda@kern=
el.org/

Cheers,
Miguel
