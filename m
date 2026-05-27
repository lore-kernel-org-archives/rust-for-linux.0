Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DE43DF01F
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 11:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779881151; cv=pass; b=jHOPM0XK0rqt0WgzVzUtrfSkPVmQdM4Mh5e98NNoljIuaibilVMCijJtgobJtHFzyyafQhr1H01yYuYXt4I9c8bGnMERzhe+PCpXwOwr6uE33mpQJ8q8nU0wYf4eejbm4Kqn+GnKuysTzWQksbgF9yzEoUOAgWvQ8UvWRvnovgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779881151; c=relaxed/simple;
	bh=YxKOe5kYUBF+6ogzITljT7Hz2UyIsYXDcVAVOtqowSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tgs4XYhwxtRFnCu8lq/tW7EPdVeQtG/I0RuOh2qCH/iHhDVhb8vR+N03wdFUpvJKvKoKrdnGDnVdRUP/k3R64S1yQdich4eDFqH6VXtdPjXvnIiOY2nCQy+Jz3zZYGLBz99SQuqd+BfJpYG+Me/Ee0jy8Qu+28+TJBS47H9k3SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpNQ29Br; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpNQ29Br"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2f24905306dso1225811eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 04:25:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779881149; cv=none;
        d=google.com; s=arc-20240605;
        b=BCidv2PNcwL0vlxawB/ECaHbG73ajuP1ULrx672NZ47LaetoHMhdZVDrrWRY0dHwNo
         bnq6IDqxIrfBq7juMD0x2HlDzA0IO/NTPA5MnvU4x0ZRVVm0axvXlYIczPv1BxM43dyD
         24lQElHCdi2BW3+RPF52DDd9YiZmr0s5jOxQDivmo21Onz9xdg6OhkyOFb3JmWLwLsXf
         LL6DIM+/0YMLcyeUW8tcqX9p8Jz+ihuq0jOBGWCyIVKBzqqpQG2lx6X3OBtgEhciHqAz
         /ky+WKyvTgb6mwhJYTCJmAyU5WRTeWtMlfhy/DOZUBxWmzxEwiNSWZ+ACImLYVRoGM0m
         e3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fmh0eC26NyEByNociKqTkecLXBrnad/uLlAySRcTMF8=;
        fh=2AKzwTYktVjgdW+8mhsp8nIMn2vp3kaKezL7riLadf8=;
        b=Bp5g9GQx3oqhh6Woy2PvoAAWG0yzvqGVwy8qlo64jJLuxC4smNXSMlJA7CM0UNxG9C
         aRwMf07Ig99gE+QlYaXy+RrSG1hbmqpt9ofEzMhoO0q4Lsg8sGk26OtGd/0Q+20ZxAW9
         9gKSQn9PZIfgWRrBy+RGFdWqc3jdw9DJ6KfJTd5OkX/iBc96FvdlI0EknJ+mVxGoklbx
         IIDpp7IxxR05hxIhNSfPlDoHdHhQPB8fdfk3HdshiYV1T7GO4XGW7WKFvRa+9/zbjlEP
         NbzAEJsvbdEfjMt9VrWR9T4Lz5mdKOokGxJB+t1TaXgB3T8T2xtSiLge+PV+RVtfwd6B
         /Z+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779881149; x=1780485949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmh0eC26NyEByNociKqTkecLXBrnad/uLlAySRcTMF8=;
        b=LpNQ29BreO+bAjqUZ6KxCBQJq4RohhLiZmwrhT5wMuQnT9yyiildPoZeQodFZ4cbDr
         UfzdJ8oVJP3OnYNySDRTklTYuwAB4PG2rNBkJNskovPttWvjdfUx8uFYqDQkTJPsVUco
         Y72WCN+5yhECC2I1DfWykGkGCH+Xn/BYAfTOqwWCaONFjEXwhmsk5vcwu7SNRqMTJ/BU
         bmJjG32krTk4IJ8bugVN04pDCkYcvx+qE5R8iGzax+V41o7AyGNBi3SG9MM0U/jXWCzJ
         3R+TvWxKSsZjBajwGOj4uWsvOeMJS8zVI8yS8/q3XULHsteiuX103+LIC+ROlw9iSNsC
         1MxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779881149; x=1780485949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fmh0eC26NyEByNociKqTkecLXBrnad/uLlAySRcTMF8=;
        b=aOVSEPJSaEDrFZHJyIr7g0HjSRb86bUHVa33ExeEgc7zYcE/+9At0qm30OcAES4Nfh
         RobSN0/ncJ8odQq1emjr2EQaJzqLDfrfPkWjQMulmM3woFI0XABkLVAyD18M00HtGLuc
         mwVrSvL9c8ZHppEM0q/0ldqutWGyWYfOa8UJggTqCpHnI/SLZfbIFqM28UThrekBeCUp
         Qp5rg0ztoC2A5PZdC27OGwR8IuKfvLnoJzeonZQZtmdyQ/R2Hrm8ngxMe1t1+GWlbW9S
         9tqmoM3ORQZaGof4YC/kxGrI4ELTz74JiNcuDhPilLlp2T4cmqNyylowPaz8ZYbQKTMs
         OTaA==
X-Forwarded-Encrypted: i=1; AFNElJ+6tbaXtfhPfohSE3w4CkX+wL/xYh0tsXqjpZXy9teEZVYX16RtKxfc+YD74ylRkrMh2MCLtoHg0/bHb8HDxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNpW2FD+MfZvNLtsg8xB3GbuEtMB+uBanMdvzhbbavF3+4ym7O
	GXuwYi+XACzJwcFAKAKTUnoxNZjuTmeIBLVoqblx5+Ldri6e72ShpsBNQTg4B0M8CcuNy4TuTKB
	XhUGGQjufBqaNhW5bc4kNbRcEu0P2TqE=
X-Gm-Gg: Acq92OG1Ym0b2bbBVN0DXuEJNpQelsK/mMeqmK52sRCdL5i3dbk9mZ5WQ4KtyIP5ec2
	vK/9de70/L2Hgs5TumIkFqg2Z9UA+cfm6TtGz3qRlClm3wOD4hN3BkAHi/PhGNC0XuZojCnGf47
	UGq+gxvdPCFlSGcczmqd9KX/FgZv29Dndxvb+q8DIAPX72FP7OgUmOO9U8LMVLrEX1ncfiMI8t0
	ka7NyW+i0i+HBNnFP5S69PBWAll72A96+I8pb7wNSDisyS0UIQhXkcR2hY+QwWL6AzZOlTCp9IW
	dIuRMHN9V0T8zt1p9HpTvrGtIymaIg82ut15AvvF4A+CmkaqcFmEChMWOmz3eKJUk6oq7heFVAe
	m6YIV4qX9To9aYBb0WBjNAyLJxK0mhLY+FQ==
X-Received: by 2002:a05:7301:2092:b0:304:4f23:4823 with SMTP id
 5a478bee46e88-3044f23c523mr3137429eec.7.1779881149578; Wed, 27 May 2026
 04:25:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526094329.533943-1-kingeaary@gmail.com> <DITEOVJASZCH.21TYX8VM4I64@garyguo.net>
In-Reply-To: <DITEOVJASZCH.21TYX8VM4I64@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 May 2026 13:25:36 +0200
X-Gm-Features: AVHnY4Jm6dVbmTo5MBgpxT430IWSgcMskQ1BIntPPhZoSsMLnTER6rDd-AX_E_o
Message-ID: <CANiq72m6ZDEPpG5sBxPA2kmb1q=GUTrTgW1br9MyNwZPeisMkA@mail.gmail.com>
Subject: Re: [PATCH] rust: devres: use compile-time type_name for debug info
To: Gary Guo <gary@garyguo.net>
Cc: Aary Milind Kinge <kingeaary@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 1:01=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> NACK. The feature is not stable on latest rustc and is unclear that it is
> planned to be stabilised, so we cannot just enable and use it.
>
> If you want to enable this feature for kernel, you should first try to he=
lp
> moving the stabilization forward on the Rust side.

Yeah, I requested the justification -- there was a v2 here where I
left other feedback too in case you are interested:

  https://lore.kernel.org/rust-for-linux/20260526115825.1480768-1-kingeaary=
@gmail.com/

Cheers,
Miguel
