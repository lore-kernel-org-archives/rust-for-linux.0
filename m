Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00F02D7DC8
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 20:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777581875; cv=pass; b=lRVdMXB8WEk0XeCTI6V7kaJlPUlZ7O5ek97LYZp6CsUgduK9hYp1PjRSB3wlNQvWNff469/p6lOlgSN5JE8//QkZi6HEpjikn9UnXNvR3J1+YQFJ53shD61N0znsNiighOb/IWsbb2HPX2UXENurhQiewejzCUEUgCtKXDvDbj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777581875; c=relaxed/simple;
	bh=i7ov5Qcl1O2n3UUgJqgnhc5SySm2DscIAima8LHwSqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EgI6AX4RA2M8kgcmZdcezbOo+f1Ylg/sIzE5ZU7gHoTKtcdD9J9R+J9QUv7vtLdpyz/EH4PHjXARJwaszChi7IixTO/pr5O/p+CeHb0Oz9x7V7tBObg/iF8alCSbV75Zj9df9Iq7LpCQOWckGeT0WX7Si4vOO8f+KtyMJOJ08iE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igsnoJ57; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igsnoJ57"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c750eaf4cso125911c88.0
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 13:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777581873; cv=none;
        d=google.com; s=arc-20240605;
        b=Ce1n1DVWDgq+RBeNKqYXdUaRePbpM0+NVqpXSge+4dA2tCA4seUzaUAfj1TFSCz1bA
         gp91ep0pXydoycfVDQki64Ymjuv+I0qnoy5CVxkn3oZkHU5jm4eQwqTzweqvhKEn+cie
         MPk8HbVV4LDwMlpUQQNbb91pvwgTdUt9Fy4p/RUGwYPUdOxPcI5ZdFinxLxliyZ15yy8
         Rd++lolndeT6CbvW+l0CoVkvrdcKsXrLXv/CYiUYj5gPBDVenTqE5C/qZaWyn8k8G9Mm
         P5pegkLnrtn4N75vNclZOIiWz0ZqVCS49PTYlWREuXMHUjbgEvQpYYgO3Gc1GHnz4Fs/
         DjXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4cHFP+eNWcXFLm2JPg/pPVlADeLLzz8lJF7iSdVxtPU=;
        fh=NMpDqTWHPYpg5mqNc2FiczPWk18d7tFLdOYNVG806YQ=;
        b=MTmcc0grNN+9s6XW8dH1zgFDPUpFuxQiOrLkLNxWIu2nlTSSDzIz11A6JsB16Bxu1/
         5UUd5ROXUuxZPpUYGB7imZgasxYJpBozyGs6RH717fTReD+/maavLBAGLM6jpWF2TdxP
         e2hXZZP+WA3DPs7b3JPSPysNOS00D9Jzjk+CCXaU+QPEcp/2NM6ULr9LP0a5Hp2AnLkI
         s4BpxKQoQbHwe8MmrW3c3lwJZm8lOEolanu22DnMpTlTzsQZZpBkWvzVDzEqZ9J3GYvO
         WDPYSQc8oDOT+rHVarRzQ5799BpXh5FeCY4hX7dMtj0tPAXAMN/+B1tdgcQy5AMfgcKK
         Nd1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777581873; x=1778186673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cHFP+eNWcXFLm2JPg/pPVlADeLLzz8lJF7iSdVxtPU=;
        b=igsnoJ57VNTnOKFWNgU9zsqGpi6ZxfG9cPACliIL5nVTFv2bLc5BDcuVP2enN5E5kZ
         EFWwkZhcnHkkF71Qpq4Vp4+HUXCQYeb/xoWmlBYRkY+OGSuNnj5PG+GpJbn7DQZHCLVK
         DwpohS2RjeVkEYJhz51tzJ8C74/oNjVMPraslPVJ7nNJoduFMHmSZqGXC6zUoJG0KTzd
         93mrPCKfhSjqpHLUNK2JnySRRTnA72FBcnhptp+jm04lwhZNYOZXJG1CcajrhdXW9RoC
         W62r4o9NkJuUl4uzqzjzMVknB+8xU+5igk3NcU9QWbvUJ5nt5+4elb7yeCRlPjVRPak4
         151A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777581873; x=1778186673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4cHFP+eNWcXFLm2JPg/pPVlADeLLzz8lJF7iSdVxtPU=;
        b=jmIJTFQCrsALakH9rjHxRFr8cx+DAmoOIDBu5c+4eIXJcg3gkRW2uYcLGXWpeVuelt
         QSM3XFTW4Kl/PD72FhdcxQ/w8mi1wqzOCzgzbnZO5rPVQhZe5SjPtAeBJ+smwi8KW1yU
         JmCPUStx5TfwycyXVYk460ol7fBx7rc12WuBaMWUjDlxT1ApWQ81v9KNOfk/pYNC/Few
         YEuVAy/0ljTaG2heQQCB/CTOl9QiQ2KR3u9PQmEJAvUWOLivW4v0rBqI2lkTUSEpzpI0
         nCUDApZp3qWrxLwDF6px0JXo4bruWy0kUs+oWmputlmH2QYkd1TS3LehukpsMvURFd3+
         L94A==
X-Forwarded-Encrypted: i=1; AFNElJ9MfG3tLxpxaMTnF0eB3zSjRGT41nsgIUyW7Y7l+osyiFJjTHfJhJnwyNl0dnCOGVGEvEo0TvTPgUDTvZweLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUEXcei6Hm0/7/niFd9jYgok8pyvwnXdq8cYNy5D8B2LWPMzmP
	ae0xK84mpYjiJx8HYaiGlC5zf/tih7DwNmOlhB1e9a2mSH0lwaWDBkHzH4veYAt51p1vVov51hJ
	5O44W3ufemSTE91Do7jKImapI94/1zkg=
X-Gm-Gg: AeBDiesWDSlZXfOwgPCq5RMfOTI+jWXdkKkTjVrpVfW2KT4aef4yvjZVd69jd13jsHH
	7fcdvi3S2SDLR7GDLB3vbD5u5JSAkp52tCNCb3YBtNXda15O1Obcsz2Uw6esqMu/ykKE1nspTAG
	8gy1dGo4q7oIJ+7tKyn2xVfw7p5BxfJfglYYXwg42QT0z0oNFI7PvbUlvktmct1chPsDvapox6X
	sk3gRaK30Lf/1ZC2QXZhUYxb9D3xybt6iDCX07ke1zhJCZEUmbyUJKp9/HHoOZWXmt1n8mgw8dm
	Aq3QzrKVcsqyL8duCTDQpHVnYjOf1GlF4wBD85fQK40dArOiDq25z+jLzEil2nmtxaxesCsq2pP
	pRrm+s6AB88e1aS9hGWwcVxCfGNb/rEh/iQ==
X-Received: by 2002:a05:7301:5803:b0:2ea:de28:f389 with SMTP id
 5a478bee46e88-2ed3ef6ebd6mr954333eec.8.1777581872817; Thu, 30 Apr 2026
 13:44:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425034125.53866-1-david@davidgow.net>
In-Reply-To: <20260425034125.53866-1-david@davidgow.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 30 Apr 2026 22:44:20 +0200
X-Gm-Features: AVHnY4LGNlzdRDP_FsWKzkzH4XH-Svm4aorK1yvmu0rhL8bxBKxh7t8QCy8fXW4
Message-ID: <CANiq72m_wJuy6XyPpZ8+BrF_kQTDH8bST2=C1-vcNcKGN4S-2A@mail.gmail.com>
Subject: Re: [PATCH] rust: arch:um: Fix building 32-bit UML with GCC
To: David Gow <david@davidgow.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Johannes Berg <johannes.berg@intel.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	rust-for-linux@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 25, 2026 at 5:42=E2=80=AFAM David Gow <david@davidgow.net> wrot=
e:
>
> 32-bit UML builds can be configured either by setting CONFIG_64BIT=3Dn or
> with SUBARCH=3Di386. Both work with Rust-for-Linux when clang is the
> compiler, but when SUBARCH=3Di386, we don't set a bindgen target correctl=
y if
> gcc is the compiler.
>
> Add the appropriate bindgen target configuration for i386, as is done in
> Makefile.clang.
>
> Fixes: ab0f4cedc355 ("arch: um: rust: Add i386 support for Rust")
> Signed-off-by: David Gow <david@davidgow.net>

Applied to `rust-fixes` -- thanks!

    [ For reference, the errors look like:

            BINDGEN rust/bindings/bindings_generated.rs
          error: unsupported option '-mno-sse' for target ''
          ...
          error: unknown target triple 'unknown'
          panicked at .../bindgen-0.72.1/ir/context.rs:562:15:
          libclang error; possible causes include:
          ...

        - Miguel ]

    [ Added space in title. - Miguel ]

(I left the comment as-is to keep the match from `Makefile.clang`).

Cheers,
Miguel
