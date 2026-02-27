Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E81F253F07
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772198844; cv=pass; b=MTSAYwXltk/qTHFZspMm/DBgPoIfiTPcKsCiE9zi3yKpEZfb7Zqasqsx/sOgjhtAEfmftb5tXhG66RQVRdgOdlLYuyA/3+HFhmWFDMq07+bzGHCuOcKJ2PWpqZFvpWrLrC/8mGNVI56n3KrNFmknjkr3yoLOo5nwd8ySVcKsbB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772198844; c=relaxed/simple;
	bh=pWjdq+lAYEe3vqxjUwBdSKqg8dA0GAM49F+0Wgf62DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZ2HTNJBaTf/lHzOEjs8b4U5uZC24ADghCYanw6LtfkjbOpKAee9lo/EwHgyk4iFDHDMLDZyzHvfbhFQrDOsl7Plrx+rT1bE2LZBi0dPrggcaAgVlITj5K03L9JoNC7SRuU315yA5Dbn5Of8rOjz6O3nayp+VurvZoJJrG5ftJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNVfGrpL; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNVfGrpL"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-506a1627a09so11366141cf.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 05:27:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772198842; cv=none;
        d=google.com; s=arc-20240605;
        b=VpyEXJQZvaJuR0x4zh33WE7Y5EYFLwMNlrEGeq3JlDO3Ph5dq+ZmMSLtBrv8in9lLR
         +fja800eZE4eNlgE+7//rYIT4iLMzuoT0KZuinnyJjTO6kd3q4Ojf80aBK7Ajg4U5q7U
         Iff2nXLoABqapDipVCGclTuvRjdF5Vb2pUDULmdeRIEVMOK5qCiRnIr7IiE+2cKvgkzv
         oxquHlMaimxdAZrvOk3BIirevI7okBrkhHEDpVmyevUM5/SytF0ZuFHhrKhO2zgyY0i2
         jEcK6qSJFgfSEFnOx3NHZHZ9kk2UbMMtnmE8nWVTQA90ubzeG/w2qmdQIYq/iKRa+TFX
         Ju7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pWjdq+lAYEe3vqxjUwBdSKqg8dA0GAM49F+0Wgf62DY=;
        fh=GQZmhW+VFA1oIaywbchYHyiX5moOT5C7xjn6pOubaGk=;
        b=jMAX87OWJxQrOH3g2ZSUu4zccuMD8jlPrbfYAjNz2im0COtBpTij5D3LiPDWL9YQOZ
         VrcFbTukuOTVU6Z8sDqMXXpa4HbUR1dmumS9W4EmAeuJ0quKtPv1IBj20oIQbsA5ckcQ
         GD6aAPF9rB0zdRtRWVYYSvaUSJmZc+QjrzPk/O4BVp6vApAcaVxCoD1vsFmSK3IM5pPC
         jqx2XUk/fOpGH/brVz9ZvtPrLmwzhKdjqsuHIQA9NBaLt3axA03GtBNaDUdSmukSNh98
         vrXbucPclmpxU7XeTa40FDz9m3CPIAfJxJXZCMGrGcVScZNqRusQqPxI+zg4DVxTXiZT
         Bouw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772198842; x=1772803642; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pWjdq+lAYEe3vqxjUwBdSKqg8dA0GAM49F+0Wgf62DY=;
        b=MNVfGrpLIvovvpUPJaypTs5FvOC/XBaNEj27dORLfhAW8NEEy6C3+KHEkNdlUXAAF9
         FB/7EVDWtQKuDwRNnZafNIGwDnaLcKoG0e7FoUeJEtCYonZ7i3I7y6vCDkcZuw31VjMR
         cyoUYGGJJ1qOyFNOJoZr+bM/xLJBleh9H5iHjK0SOYbETQ8v3vWUm9EyQT/Y7j5cPHLU
         TzRRyah/dYoXxfzFNuLshmQNuUPGBg2N3yT51rvR6eF8quvKi+aNxCd4QU7NJofkc3ei
         IunnEpX+38XuN6Wwzb4n02LqIsGFXsxdPB018ctC/EdwU4VNk8qme4meGyUXlzsLiB+/
         WMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772198842; x=1772803642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWjdq+lAYEe3vqxjUwBdSKqg8dA0GAM49F+0Wgf62DY=;
        b=L/sFJKCogBWlhOgW0GLwtkY6EZNngw5w25o0bX8abxeNqii4IfNUYJdHYyPVaVW8qa
         4eKEairh2jS7r1g6OH1wmPfENvY4JlVMlPARDRxr+rTVnrLsVfnQ27indUrm39dYYuc7
         jnEk09x77Q3+bIhRarWV79pR8bW6bgBIwPNmpgs88dPB0GVSYRaujhA0Iz/UNeBsx9SR
         CEQKD8nMAG9I9TGuIcet2z66Ib0QQqen+g7tmEvNQIqumSGh5VWhs+i+ws0T5YM63sER
         XC2jjNA+18hlPi6ov+7CDbtp/79sx7t29YZ9MjZxgKpInfZVPx2pS/7w1nGcuLoLDEra
         xaqA==
X-Forwarded-Encrypted: i=1; AJvYcCVHESxoclBCKl0WLuBiYa9pPX6Bo9sEqMQq8Zh0aAxK1zhnPuqgmzwayoacgWIQ996v4nNTUK3O+OT0+TW+OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbmbNMhDlYhvJ1utlmIomqbQK3e/rWKadaWjDJncwr/684efHv
	sZmqwCbLq0oWIPLrRwt75VypUHAm+F4gm+FOTeW2l4VafFgaVo6pJGozGeRgsQjAcqQmeoegcqx
	OSWY/ltG4bLwDGkDsx5AP7eYdADvjyGk=
X-Gm-Gg: ATEYQzysID9bd8aZuwNdz8PagIdKWLXPSxRxVDyVy4PnyJTL8fmo/n+mzOqjOjBA2Un
	eTI62LKjeZZ30ngzIf4KLLXeoGCO/mVtrvCE3bHjCuvYac4Prihd+WD74OVqr4HrjzBdAQqn3Kn
	rgGmrMyDO5981jkMn0Iz4+ZJ/6inxaDAXGHFizCWvD/1MEcuWNHX5HbbHE30Y9+FhIEM7LfhV5G
	rZUmud/lPnNirH++0F3OnXdEs5OP0eKHCZOFOdfG5tGh5h7nF4+s7AYCCBxLld8WH9jWPVJSK92
	O2u+/w==
X-Received: by 2002:ac8:7fc1:0:b0:506:a624:1939 with SMTP id
 d75a77b69052e-507529973d5mr32608111cf.51.1772198842194; Fri, 27 Feb 2026
 05:27:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226234736.428341-1-thepacketgeek@gmail.com>
In-Reply-To: <20260226234736.428341-1-thepacketgeek@gmail.com>
From: Matthew Wood <thepacketgeek@gmail.com>
Date: Fri, 27 Feb 2026 05:27:11 -0800
X-Gm-Features: AaiRm53B3VOimmyWUVWpQZLooju4LSLNXyFFMiVuZvlgdlqoHfpbBRKIZCUlq1c
Message-ID: <CADvopvYtN=WMj_2SKcQ5z5OedU-2wRf9+h8FPbrqamQSyNNKAA@mail.gmail.com>
Subject: Re: [PATCH 0/8] rust: module parameter extensions
To: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: Aaron Tomlin <atomlin@atomlin.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, David Gow <davidgow@google.com>, 
	=?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Breno Leitao <leitao@debian.org>
Content-Type: text/plain; charset="UTF-8"

> This series extends the Rust module! macro with three capabilities that
> are available to C modules but currently missing from the Rust
> abstractions: string parameters, early boot command-line parameters, and
> configurable initcall levels.
>
> The existing Rust module parameter infrastructure supports integer types
> (i8..u64, isize, usize) but has no way to accept string values.
> Additionally, built-in Rust modules cannot register parameters for early
> boot command-line parsing (__setup / early_param), and all Rust modules
> are hard-coded to initcall level 6 (device_initcall) with no way to
> control initialization ordering.
>
I forgot to mention that these changes are a dependency for a
netconsole rust implementation
I'm working on and I need these three features to match the current behavior.

Regards,
Matthew
