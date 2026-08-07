Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FCF22579E
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 17:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786124065; cv=pass; b=oVIhw5NotKSt9Cv60XAoJf1bKUYESX7VOZc/tNFY7RNIXEf0EG2l4KOmT4tfE29TI+5EGMNqVa/YP/BAu57iBF3sri2ZtrMVl0AepO4nRFDvT+TkRB4gVeOt5mCPDc0duUCfaVFNE7jojPzoL0UL05Ec3XljOX7YtqErMgqwwrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786124065; c=relaxed/simple;
	bh=Xj42kzvtY7hVZXpL84O/HcqpcwKY6/OAxbNIO5KfMOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K7v3SM6YgQjqsG8yo5hJjyl75UCqE+eH9MSrQ1WwpgmXkW2sAeTxADy1C51b16Hom4GBF1gm3rmtiP3sw1j7/DwVt1C/+5X+t/rBeCrXUrZXANE+IgJp6H4ILSlmc2hmM/fxZaXMvZYqsOvuYbgBGtOGPQIYab4katRpSgINpJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Try16zb0; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Try16zb0"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cecc8a3dbfso3239215ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Aug 2026 10:34:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786124063; cv=none;
        d=google.com; s=arc-20260327;
        b=T4f+ZxYD4C1B+fC9e//nrPLgfzLstKBgwjEiZsfmZS7Vdn5/sBe7w6yMbe+wvzo5ZT
         /wxFojWZHfJepx7oFwQBXWCtasvRTujnjpbOJ6ZwcHP6J8QLrKfi0Hu0AbFY2kT95NHD
         WfdglUFC2PDxdnMigLTcEFCscMwHITb6Ya0l57ljnva/IQXa5scaqftnwWdaIW/moUUR
         bJEkNNhgnaQGelLyw2E1X8EYidBVAi9DL6Gn9VKQn7nbIU0x1khR6TTZYd7Z5ZJQRSUn
         rxps+ubyZ/GrDyZ2PDx635AZH6Aq2ygtmS10rUJgIzSV6NF52vme79iAEHH36oJ3Rt14
         kzJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6kvT16JAmy75WGpIzBN7wM7HnztOWxyNPMwrylGyhI0=;
        fh=IM1S9bqkOmbkApkqVNtgIv20ni8Ur75JuMPUpbsslXQ=;
        b=Y0dvq1HFwa0v9lMlHHV1iNapAvrgtQ8bG+891WfJ8NvLQGhrYldDxUC7AOkAng4/Xl
         pwQpNY2Ei5KbPzRL+2PAZT0/CwJhsm2J0JUjH3unT+dd3ZZ7gmqGhDyhiLovsMsJrJLt
         GqwL0AIJPN9kvTQWI6QqfwnV6JL8JmUF3gvqsz9vecuE/kKHvNq9diCASelo3xmUc96w
         QMxssNUdQ9UNtbolZAALt7EZFgTm4xbOUOKZJpH/lMBEITU+/A2l7xLNddkRpyJLAvdq
         XxAK99cKshc7UXTH6iwlrk028S2YQhUBAVvdrqzFsF0U6dtmJQRsAXP25geqx5Dyf/96
         r8Yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786124063; x=1786728863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6kvT16JAmy75WGpIzBN7wM7HnztOWxyNPMwrylGyhI0=;
        b=Try16zb0Y+SEXPUVlMMTVAFb3+FjmEJlwOdQKXRsjpsRu4/0vx0PwfQYg3WVJbqVi2
         Bj1ycxJV0mTuL121CGOQ1E3VJybp8UVqFnfTqQYvNmhsnJNenZFMfd0jkBL2KDDBLsJD
         01qUFoyI5p2Pc5zd2DwKCXTsyNe0YymhJKuBoqb+H9ZRBfx47ARGd+Ru2mtRx9bH2avX
         bbSh9s56rDVCT62yGURt2enRg1g5Df0pcFgcIJaLkSVvblaO4yshlh86PfIAROt2MsQw
         r4HryHQkqc9utLSgfHZVn10OrZEFIMqx6AUaOxqweRL9dlfkosTgyxInIxWImbHvB+fo
         OQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786124063; x=1786728863;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6kvT16JAmy75WGpIzBN7wM7HnztOWxyNPMwrylGyhI0=;
        b=VQiMdlFKM+GbHwDdNpTuQAqrzvjYLqYL6Nb/C6qsym89s7z325KGJ7VWx0f4ykWGFY
         dYCRhJAmpZSJxMGy6eAgidi50adwvZunXhtiIu4d7p4oRmd8tT9TDqHlbwTaL0fBf7w1
         Vx5WV4oHF2CdLTQ58mbKcysPxwXPk7zUe9eMrJdp6MYah2+KS81QP08RtBFV9bkxgzbx
         kPSAQnt13NfRhCbOA7RiplQ8LX3lAvLw8rAAM43vbI5lqYiV3r0gHBQr4fzOjrKaCJTS
         ec4XIa07h1zv3t53kvT6dAANGTwPjaXfvr8m8e4wk7vXUfObpmxuKsQmiBfwwEwFYpaG
         IQ2w==
X-Forwarded-Encrypted: i=1; AHgh+Ro7Qzx6TfbKrRlVGxo0Axhw+KNNOK8SYcKg+qOf0nYW7xKWk/0E3eg/sDN/lygyH41c2+Z3BA6ff7K8uhVZhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+qh159+Uk+/N/N/yD4ETbWTtSnBfdf9DC0NRBnWBLgFiqLAiR
	nDyTvWsHWDzADVzeVFcKwi6GU8+kuxdw9PlnYT9nJMvFvggoMC6QY0ksbdaLsA8CfN8r5NtwNbY
	Lhjer1EaauVJ9lVAnEiaKQknQeEZ+5X4=
X-Gm-Gg: AR+sD11kulB79cUzModjVMM4hVL9DkQIuAZjJKjOA58aY+7jJkGRB9c8vLW3f6YRM7T
	MYZt3cmYcTKVtNpe3IQELA/asO5OZpcMLjzpiWKACmB34GTh2wx+J8tyMOIB4+0UzBrKaoag6yb
	MZ7nPu09DG+GI/SjkMc5vgxfGnCgpiea/QZRUKq45Yq2KeuunuNH/nRPztM4gff9HKM9YtdltfJ
	Q0bb0hAtsaKiUTElfWBP24pd26GG2UPa7LWCeidFBDVmFHS8dlBZOPRleKBZ9jD9TN2bMcvJTtw
	1YCbFg7A4JtdsCfTuwYdHp2b+ETnej1qCl503ka6sI5uw6MT6l63PFzWC17HfX52tIQRlxTUqNe
	uWNNvpbkvJ+2R07AMZoxbRNKCPo0N9q1Y/RkqULtWvhHBY+WaqqcgYbaIM+XI
X-Received: by 2002:a17:903:2c0c:b0:2cc:d6de:d58e with SMTP id
 d9443c01a7336-2d0cab4cf8bmr196602745ad.4.1786124063116; Fri, 07 Aug 2026
 10:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731193102.110693-1-acme@kernel.org> <18b557a8-e1ca-46cf-b03f-5e68490c9229@oracle.com>
 <anXTAComw6XAvnXU@x1>
In-Reply-To: <anXTAComw6XAvnXU@x1>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Aug 2026 19:34:10 +0200
X-Gm-Features: AUfX_mzzvBqFiv6OKNhMJZDHG6Wjkrtx0DJ0DXR2V4K4yDYcAFM1opjoNTiHmlY
Message-ID: <CANiq72nHWY638h4mxJCfh_HFtzhwFEPyo6a-7k_3CxZsRV+Jiw@mail.gmail.com>
Subject: Re: [PATCHES 00/12] pahole: Support more rust tags and references to
 dwz alternate debug files
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Alan Maguire <alan.maguire@oracle.com>, Jiri Olsa <jolsa@kernel.org>, 
	Clark Williams <williams@redhat.com>, dwarves@vger.kernel.org, bpf@vger.kernel.org, 
	Andrii Nakryiko <andrii@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Mark Wieelard <mjw@redhat.com>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 2:43=E2=80=AFPM Arnaldo Carvalho de Melo <acme@kerne=
l.org> wrote:
>
> Adding Miguel to the CC list, Miguel we're trying to improve BTF support
> for Rust, this series handles multiple enabling fixes/improvements that
> gets us to the next level, i.e. we can load everything from DWARF, now

Thanks for the Cc! Cc'ing rust-for-linux and Gary.

> its time to try to map it to existing BTF kinds and propose BTF
> extensions when we can't use existing encodings.

Sounds cool :)

> Inferring from "does any member have a niche layout" means
> reverse-engineering rustc's layout algorithm, which is explicitly
> unstable and unspecified. It'd break silently on a compiler bump, with
> no way to tell from the DWARF that you got it wrong.

Yeah, the LLM is correct here: the Rust compiler gives very few
guarantees for the default `repr`, i.e. in common cases it has the
freedom to use whatever layout it wants (i.e. even for essentially
equivalent types in the same compilation unit) -- the official docs
are at:

  https://doc.rust-lang.org/reference/type-layout.html

>     u8                  __discriminant;      /*  0  1 */

For the niche cases like `Option<NonZero<u32>>`, what would be printed?

Cheers,
Miguel
