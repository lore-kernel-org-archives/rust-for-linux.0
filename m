Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F2839CD0D
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 06:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740251; cv=pass; b=f1qf9Bjb7JJXW+MtMoFxXLa0q4P+ncJK1BccYCpnt2mQT9tq525SIVM+NcuGrgk3phUZS+hFR6DZqnMkFtx1teJPvy/08v2dJFlv77OvGViJ8nFQE3xSRlk/Mdmofi/teZpr3UTrANmn840aC6LuHHQNOjiXEYfHpW9I2OLtjFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740251; c=relaxed/simple;
	bh=nGd4T4+PFRO0J55OGz8poGGzV3wY69nQNLqbb9jJgbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KliAk/1we9673w4GEsYCtRg7KyuirgLZ8i5jOvv11OtYCzf6KX+YXFVDysvUIc4aLnl3GbDXKZtvhlAcyn6U4hE5yhbtGFxKYD9nkpmLG1HburrL9m5d+JueAGn/Oecgu7rxURV87AEC655b2F6fXOBLra5poi+06MADTDG5gIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YK7mFILC; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YK7mFILC"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d03fcd26a6so1837445ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 02 Aug 2026 23:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785740249; cv=none;
        d=google.com; s=arc-20260327;
        b=kJpLzhJd3TLXi+h2T4og7FUTNGJ15+qv6mk3R4SFn5FIORh6CUmxmLERA92nBrxz/O
         yuDrr2Qs7YIkc3TdaYnu+WPuivmtw4XD3gsIxSrWbqqoLEQXyEJZcwOw15TrWEb+SEXP
         Cl6gBmw6v3hj0DXpDRIUe4EdjWwoDc1/Or3ZFvRgrvXtwhCzeZ2HDVisvD4qXoSeHmUg
         AOVC47aJc8Ih9H3ESIt42Fhmq4eNOrgwoGgHeP+tCcuz4k0PuNCCcIGIjelQQlEbLwsP
         +j+LbZdHpwaD37GU47fe0bpgB3XO7neGAJQqkugReP9EEkKGzOrdvREugqB4T+Xoat6t
         FmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nGd4T4+PFRO0J55OGz8poGGzV3wY69nQNLqbb9jJgbQ=;
        fh=MT62WV4z+VQkhxV/OU1az3jG1CL5eV804c6dMsP1AEQ=;
        b=fQHCPkvR21RHW0hckzfegNwAeGAYsdRvXuPTXqfSoWHtwGPKwTkIwrvAUNQ8RY9Zxj
         Fwlv0DgQG1GMwIK+yDKl0q3cg4bD9HLQwSBQ/IHCiDADVUzz8Kyw9Cucx/jP2M/LLLOs
         8ulpaBgEn3KoC3sAIpGGR/rLtcgsf39w3zX2aRqJCJDAGbTxtBaoIiIliMvKTP+F1Vbs
         /qVIed4g2YQb45zvyXQ0hjsbLA0iM6iRnlRBJlvaBouK+Fu5HeG8ftlkJk2Npijbc/l2
         VcIYsAViKNr3DAju03rCnsoUpi71Y19VACCpjwx0MFQiaNgQY+qLIiZgL+AyuO7rEyko
         Bm9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785740249; x=1786345049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nGd4T4+PFRO0J55OGz8poGGzV3wY69nQNLqbb9jJgbQ=;
        b=YK7mFILCFwY74skWsuR3SrCmGLbxtVWvCD6sq8dgN96lj68ZAz8RHFeGdj7LW+uPjm
         3aywJ/lbJ+3u/fWx/LSwD/j5Ed9fh8ZzKdosMa9rUls9fi0MCxJthnPX3IZ5kUevZjSx
         sMvJ9EipYmBZ1N3kfbrpiWgEVtu6b8alhxsOIjsMatYCIFkL8myIRvAUmZ1l/OkXfyfx
         sScWifdJZudJrQQnrX90PpgSJ+lq8f8Ix+oiKamL8XpQqI9Ymr4g4LJJpVr+/wfUDjep
         9RswxsNAX6ZoXTVIGIhl3ypsRPcnKOProlTq7WPvwHj5aFv+Yju161RQLDKB0ymOPKqc
         UjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785740249; x=1786345049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nGd4T4+PFRO0J55OGz8poGGzV3wY69nQNLqbb9jJgbQ=;
        b=r0d8yVZUV63BIVUyEskdPEvHj/FlVOSIgmvkMCfx8h2qwu28KdMFd8Mh7bWO0mZG3j
         30iYlbAis+f5/0+BtgKUfLOnw/PbZmHKkNvwOtzjJU8d0nnR/2TvFh+d+ZKBHYwSbxie
         LTpdcvkyZ3f0et5NKmhliLjuq7AqPT/5rt4cKa0mde8vY4Qa0Gy4HoXAXPwjUVd+ttH2
         ICZ4tKVfIIJDOsEtGcP/2yfDt5+kBzEd3lRn9m8u4qZeKpUWXEJBxS4bjTXj9ZiCm4In
         TQHQjSPG0eja12BLsSygsaeabOz7q084GrFT++nt/SRlH7zcigqzv++hQwcRmO5+jqwj
         IkgA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5LIwWJ6S8rKfvbUcLcC6FoNPRM3SrXcrHHJibmfea56Ub960cfPnaD+H/QTLcYPq9q972GiDaBoLWZkPVCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ+w6m0pAr6n7VNoENcafkfcILsP51t6JcR9gLtofmMoa9qEoT
	jzXdlHKr9fCHtP2VV+f8MUyxasNXA9yyV1CIPTyV2G5EkCEP3vKx3oAYIwVEQcfmL3utpuoLJgQ
	fvxQqtDeAflP9oIQxS6GmuncftVkIirU=
X-Gm-Gg: AR+sD11N6kT7vrbY4vqHf4aj4++XWUuGBkqePm0xpqzk4JDtQNZbUNcqvtiHm+OBIIY
	ymlffEXxT8kfOa6Jq2JqQ/8qFUAhoS5DN/oJV6SZW5chB1uE+ThbSic8RsVstR0lQHSJb/UiJCP
	+/e8qwIxI3EXeHRl6OLDr2/KF6MJPoCZpJ5id9bxHOCcDcJo4GTPFMpMT/thJLWs+n6G5xxqzBt
	sqDSWdmDOOsh/r75HK3UspvwvVC0PlaCmUC3+dJ8KaCLSc1sMNG2Nfl2TSiyTfonPXLfEhF4acn
	2CNCGCA7aBAm0qUCsvIY6D3cfsKiW4HF70LEKG0gpsSyYVGem5VceLVChjeZHnuSWlyHaymOiXE
	yYPCKxir7stdVdvEQwVvgEehYCacLwVhQS/G1aouqNQpRFFvpp/1L7K1wFVPzrABLD27N69b/
X-Received: by 2002:a17:903:2443:b0:2cf:9e90:8be with SMTP id
 d9443c01a7336-2d0524799d8mr119581625ad.4.1785740249583; Sun, 02 Aug 2026
 23:57:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-pr-ratelimited-v4-0-435f8d6e9605@google.com>
 <2026073148-cushy-mocha-2ecf@gregkh> <CANiq72ksdfw57QE1+FsMW3uE5p056tTn=xxK1m3fg-ABhHU8cQ@mail.gmail.com>
 <CAH5fLgjZuKGBX7R4O1fat1s__mR2LHhQWD7tWdz6F_FxECFOGw@mail.gmail.com>
 <CANiq72kuB3dHDcsw0WApcVOrJJs3kS_BWt9ELqm8YmcEz6yeSg@mail.gmail.com> <2026080337-careless-viper-7a1f@gregkh>
In-Reply-To: <2026080337-careless-viper-7a1f@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Aug 2026 08:57:14 +0200
X-Gm-Features: AUfX_mwATxFZq1GeO1DtaDPyGtpJrhEGLUBrL-SARijo64R8hgDEmM0fkvkPvvQ
Message-ID: <CANiq72n+3ShPk-agnAepT7uz803fuJ=9206UQsUd_gRMBjFpSQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Rate limited printing for Rust
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 8:25=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> I'd love to just take them all at once if no one objects, as odds are
> there are going to be binder merge conflicts due to the printk() changes
> in that codebase in the char-misc-next tree.

Sounds good:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
