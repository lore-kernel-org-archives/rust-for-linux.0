Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7815385D7E
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 04:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337663; cv=pass; b=G4j7eK97OXwNsOgGxlLBPn/ffAy1uCOBLhilyFkB2zsxnEGHb6tMNo9AjkAjQsF0MZ4+iTDWCJOVWbCy0hKAKZY1ksY5VenPs6JTSwgWReKJyNBQTOG9lpdHo+enTKNb15+ulPqHoeD9a/UsTyw1qitzgtTmZSZpjalDVhpbN1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337663; c=relaxed/simple;
	bh=/Ee6Tuzb5QHv7hTz292Ha+PdVC0vg25zqQi/gkh97t8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vBfb4JX+GSaFU72ljR9TpMxjWbW85KvfwH35yRJDLkHATP9FJXit5uAvm6qeSXbVEDxCI1kLs9Q7DUwdPOpt/XVa5nPV/oIE6QX6CqyicVV+W/TSRo6gBHIcIdbeQ1lYKWKRTuWikVuKkAzrjSnR/ekht/RHZjYnDy3RX+MpTYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYATcILH; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYATcILH"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ccdce28edeso2096645ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Aug 2026 21:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786337661; cv=none;
        d=google.com; s=arc-20260327;
        b=DIsAl6crhJemKxuzKxkNGyAupvwuwTbf5T46unwyJhiwqqBdsen09PzgseguOx/9Ox
         rRM9YGIe3hA/gUngSI0eNbFGI7OvzLPYOnBzvupgXCwu8AXuFPMyAHmyyxKd6uDB4DgO
         QCXWS/JcXEmlZTZvbc5haMAIzASWKqOcYPPZ0e97WhptO2xRLw5BDpSo48FQ1GNwJIWp
         Nu9JTBJSo86Wq6GtyXJ4bV16LlQ4Vmu7os2O4ACUpLADbbsWhBc1gW3r54lc4khezPRY
         TRpDUjaZCp5aMCjJowzhsoduiuG8/3RcA4Vy58doNxCL6cD5uLoyYmINg6xdVfVZzayr
         LGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Ee6Tuzb5QHv7hTz292Ha+PdVC0vg25zqQi/gkh97t8=;
        fh=jfJ1W9yYbi7q6Jkrm5+MfmVkys5/5+OTKjpg+k8T73Y=;
        b=qjD4RUyqN77vooiV39wrfLfvuxcZJqEj/Z+SheIeNiNsUsMV6aaGYEUFe2qysuTwyO
         B9vl7NW/U2icokPU03dfTMHCitgKmWw1xsOd1pPg3+AB7TWvmGTWimz1mM4Ywg7kXXcX
         6HeyK4v3JFdHWPeNgMENS3t7ZJ642c/OyL3pdJhkyt13GAU5VApjaKz34LoIo+DVDkU3
         Cu1bakDHdIjpF5EI9CuHdCHoaBVH71TnCNa3Bi/YIimA/gkgLYkqbPJsLFAH0yXMTRVA
         y/ipo1p5IYzqnT5c131dWA/LiWVPP8NJbsVDZcPG0tlMafdqsyQxTGmrMtwrWI2E3fS+
         4mYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786337661; x=1786942461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Ee6Tuzb5QHv7hTz292Ha+PdVC0vg25zqQi/gkh97t8=;
        b=gYATcILHGacETMCKoY5ipipJFaoGVb+HVucOCUj4hyA/kP9r5ghsYuj2qs0o5pNsCj
         EIFHcUQAJlAXsPlnIvnrD5UkpmSQ7CA6iUZbgXfyt3J6EQij87HP80E0gaWN/qFmgiWi
         l65In4esWy17dA65UeQuEebzHErd7/PSu8Hz4mRYCWn4RTuy+gU4IcyrFKdAfnLt+2pl
         41Zkb/94FlLhX3xePmcP6RXBPKasHypVVxkxkNNmZACAwAKXW2fHo+HnyaYa6d8zn8du
         JuHzC8BqsxN4Y4cvwqc/mesWRm99OBOIvV7uPR7hgcqPSWwum0CBZ4LPtXp5P3FHvaFC
         0wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786337661; x=1786942461;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Ee6Tuzb5QHv7hTz292Ha+PdVC0vg25zqQi/gkh97t8=;
        b=YWhlUVJj4Z0n9YbbzmoUrJLYFN7LhgLypfHRTjBi6/oCY5iyZNGo+TO08uAUv3acQJ
         SKDkgm1mSp1SNSXsHC0s7tzK1FaoVcn1sUgEMlzJJDMxmmfK4zE8cp3bbOfLKFbY1vFC
         Q5+A9IMQloTQ8MxDsGsqs1Hw1PutaCQoZX5Dq2e8H3oDH85SmysTsbMf4Bi3N02gsz+8
         MkfmtdY0oZjI//OpSleqG25oPjBUOL18/QOZig9RTuYCJCwL+gAMrHY6kGB1rQ9/l8tr
         jv7V25XqTehKgB7dR/cxOlVdti4s/UB5xNqXCfYdeDekK8jUD+XfkW5E07HOVklCcVGJ
         k1Ag==
X-Forwarded-Encrypted: i=1; AHgh+Rok6mTqm6qB/qDCzekO+P4zMxw9ptvW4zicqGQ+XIxc0Cz+bXhMeKWbK9kXqY4Napq6BUbiEn5dnjRMnwiGxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL/8/qe9XPsL2M9OHXUzngMrrsvyemMYc+cEKu6dBL7YfgLyIM
	bua7euUDvGsDQD5DPml7duY8fkRP6oWvr+FaaClZJpQ9E8wnc5UQ9jylqblh59wPp7Nc0s/lxEU
	JEMCe+XuBsyBHgikDhSkgAmqylP3zJtc=
X-Gm-Gg: AR+sD10zTeX671xBszscadG6aUMm2YofB2Z/hKOgIc3poHtCvybOIUp6brZ28/n0VfI
	E6Zc6qepeeUNLFsRoW0zQFYjM0YwCJJZHJUWBIaDpJ6/LWdFAxr8GYauiWIvlCRNxFcBl9OzgW/
	scevH1xZCM4nlDyOxF3qXfoXY8d+EoXU9AVPUY4XQ1hkSZnxtibGlb+KeaWXYW3AY50WbHeiZap
	U5gvabi6mEQ68C4Y2u3fikCAJiE4uS4MQLMzYr4zRz6lr4h8AxbT3cXxCrK1EwpflSKIhFveSqt
	Tw5Tz7DApxdu3oXXrE6W1bjd/DxhBDWpSAQuFHnu+rr++mWH2qpK+a1LFfsJvD5JW+sdwVGQCDZ
	hY1wDWaomabXKs7y4IUkDFZn6cgHzqkMoOII6n2o6BKuG0K2vtIHFpiSMWZYThaVv3n5iEGE=
X-Received: by 2002:a17:903:17cd:b0:2cf:ca85:57e2 with SMTP id
 d9443c01a7336-2d0ca7b0285mr308970755ad.1.1786337661173; Sun, 09 Aug 2026
 21:54:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708175119.18051-1-harish.cs.ss24@gmail.com> <20260711144721.39185-1-harish.cs.ss24@gmail.com>
In-Reply-To: <20260711144721.39185-1-harish.cs.ss24@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 06:54:07 +0200
X-Gm-Features: AUfX_mzmnC51R91SBVR1Jvo4Bfj0UZZlIYBRa__9_evIAkuDM6QON7qKUg_K9uk
Message-ID: <CANiq72mFXx=ayCCXxOuucoZBqgB4D0exbrmE_iy_M9d_WQ5mig@mail.gmail.com>
Subject: Re: [PATCH v2] rust: sync: improve `Arc` documentation links
To: Harish C S <harish.cs.ss24@gmail.com>
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, aliceryhl@google.com, 
	lyude@redhat.com, daniel.almeida@collabora.com, work@onurozkan.dev, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, tamird@kernel.org, acourbot@nvidia.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2026 at 4:47=E2=80=AFPM Harish C S <harish.cs.ss24@gmail.co=
m> wrote:
>
> The `Arc` documentation has a few mentions that do not follow the
> surrounding style: a plain `Arc` without an intra-doc link and a
> lower-case "arc".
>
> Use intra-doc links for rustdoc references to `Arc` and spell internal
> comments consistently as `Arc`, matching nearby docs.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1240
> Signed-off-by: Harish C S <harish.cs.ss24@gmail.com>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
