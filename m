Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5328136B98B
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Oct 2025 17:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761846107; cv=none; b=WI5XvG2eAmZvcWlzaLLu68k5KyWSBC80cLOUt5csj5CwyzTilKlAyhLZoR2LWlu1hulecbRtXWbHpwPhJXakJyIzJvUvHivJ5QYC6lTqKd4lu0pUS2an/qxWFNxtOnftNTKO4TzTZsQuPpC/BugeLLyYYCNnDYvl2+Kdn4DIpgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761846107; c=relaxed/simple;
	bh=oo4IkdW7sLnrYxIJRobVdkvu7rD5V1EssVx2JDkDEEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecB1JGafjIbOhdaWRorIBa7YtmqEutsBQF0V+agne5cyljvgLjE3yjy3Ytfa9MZ40s/AUDSw6StpcYSnEQEaws4b0yFTuB3SgUpjWmKkgYBzUPgCaTzG9xMfBTbPKHtvsK0Eb/6/Qn13C+ydFlD1Ic4uBDG6Bdnp2LVJNhaboIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlUUoCja; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlUUoCja"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-592f40b1a40so162385e87.1
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Oct 2025 10:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761846103; x=1762450903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WaanMAXhNGpoOdRMiFzSWcxFY46ssv0pr1eWhXJPXZU=;
        b=hlUUoCjaC6/ZOat/ou5ynH/uFaiukPxEXbt/e3GuajnxAIkVdcI1kd0oM/rNNMNlo0
         2zjXe2QO02UgWqju6ZNTFEdSdOrKRxGhZBVZXFmVd3QHU56MhT87CSGxvEosAUtokJSl
         vQAIrCZf7CiRoKLxRE+Oc8ZnL7Cr/6DXixaJStbTsGkoUHqaPAPCQEL/g1U73EBZaXP1
         8eAGeazXaPo5BQpXZ7H3/FmEnez3zM9fsw2h/Ypf66vXPncnjpajqiPyAExHV1RIm+2I
         029pFv15yjlFSn/ZRLfPFbFxnp8fNN6dDgfZF1LSluaREJ8xzCz9NXfxyGhs5cdqGlM2
         iOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761846103; x=1762450903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WaanMAXhNGpoOdRMiFzSWcxFY46ssv0pr1eWhXJPXZU=;
        b=fAodL2WeVCnE2isaFeNFPP93oHe/bqlBsetriP5ktuA/QniKdNWKOkBVTyEE6rFR2H
         onfOU4T7+rOUjm9oo4pMR9sikP5TPwFBKyQsxEiv2oTDUHm5CJzBMPGEoHKo2IPiPzB8
         TWburxrek8kSoVrh625fHzxifRuQnnXEt3bXr3zUxPDIYgHquk4AHva7Bb5bH5BtWBUc
         zJFU4yYqvNSblSygbHtUDM2IbgymAMlWVJFlJFtt3cJVFkiLdiNW+w42QepbqshlltfH
         nFjkUoLj7+hF8kr4Lqv5DXuNLjRhqojqMmgKYRvK+pr+DJ7gFd7ZSNnQOQmUNtQ6yZcs
         8VuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa4uNuwNBV1+f6sofbAvKEZd7ynVHXJtx59pWF2o5tPHn7KcHc4L8Gk7heeqpe60sVxnakxidLCtJq3O0dBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp5jbzQFhq21D7drpYJjf60hga/k3uIuODiFfPBH4nLwTrlS0c
	rqboWe7MzpeKhzrt9gsvZpK+gAmIKTkSTXvy31dgIZZKktbmDYd+XUqkLV3ImUU7iBIszhH+X6f
	111GQdLdZAbVfFyWI39wBqEe45JI3ODM=
X-Gm-Gg: ASbGncsAvzhjBsEo1brGyWwAElbWawQJVGa5iEiqtjN/SstfS1pUGG0HpjANlsVOM0h
	9IXGtn3/ExFVlsF9XogbtCYBZwkkRew0RybOLA1bM/gGH50GyorfqwLOJQcBjtLMNw/QcFsm/vz
	0+mV5xBSyV+cmIdl3+Jkp87dp0DAJV54LD83+iiJXK+SS0P+ph9imJlsYdCXrVWv7i6rgjuFITs
	RIUBt+wfjnm9MkZdcvRxUDM6KoBeUDhlUCnHX4QUWgqiasqZjrUcey4PT1RGbjfN5/FfpzOZn6Q
	cvqRJAiSF/cpvQgJyB34byRSXfmhugxF91fzZn+PzW7NMqftK05XLjJylr87/qtb+tsqh0KCD0r
	o+q4=
X-Google-Smtp-Source: AGHT+IG7bvo7ccWBD1MNUKXWUtpG4DmMsqI3BeTQWcJW82J1oN69RUHhnzVjzLexuETgdTaPCXgEfAvcK8gw70Ld9NM=
X-Received: by 2002:a05:6512:3c92:b0:57f:5f3e:84bd with SMTP id
 2adb3069b0e04-5941d543c09mr124070e87.8.1761846103123; Thu, 30 Oct 2025
 10:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9500284ff72ad4e4dc4799fa5392a7bbfdd34f3b.1761814593.git.chenmiao@openatom.club>
In-Reply-To: <9500284ff72ad4e4dc4799fa5392a7bbfdd34f3b.1761814593.git.chenmiao@openatom.club>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 30 Oct 2025 18:41:26 +0100
X-Gm-Features: AWmQ_blmvl6wAJZ-Wsp9J5gdoKOtpBYl-Hhfx8cKJvUKCFPDb5C1gcb1nwusukA
Message-ID: <CANiq72n3uB+sgkak=2JrPD4iY4pFidDe=TbvF8h2idGKCwedFQ@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Remove the product of pin_init cleanly in mrporper
To: chenmiao <chenmiao@openatom.club>, Tamir Duberstein <tamird@gmail.com>, 
	Daniel Gomez <da.gomez@samsung.com>
Cc: lossin@kernel.org, nathan@kernel.org, 
	hust-os-kernel-patches@googlegroups.com, Dongliang Mu <dzm91@hust.edu.cn>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:RUST:Keyword:b(?i:rust)b" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 10:08=E2=80=AFAM chenmiao <chenmiao@openatom.club> =
wrote:
>
> -                 rust/libmacros.so rust/libmacros.dylib
> +                 rust/libmacros.so rust/libmacros.dylib rust/libpin_init=
_internal.so

I think we will need the `.dylib` too, given the other one is there
(for the macOS builds some people do -- Cc'ing Daniel and Tamir). Or
did you avoid it for some reason?

Thanks!

Cheers,
Miguel
