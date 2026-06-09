Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544BD42189A
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 13:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010515; cv=pass; b=AKhnrudJu3nY+KyQFhdE47BLp2skC3HuawZ/cmWCm3z2PXbILaTHeaxXeK0Qn4zfq/yZBCroxDfd+4oO2u90gxg7b2xaQ+PbUFZSkxZLq/95wvmNHAyhdk735oUH4Wpvpx4PnAPJAqAhr4woOTUsCyeYmpwMQOSQoiVaq4zYkrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010515; c=relaxed/simple;
	bh=KPlTDDfBa0SjQqDYsirXwUX3KwsC+Wlzz9vigQGmoU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jlloCk5Wmd6WlING93TsVdfv+HYffY5mDz3DnbrIavZJVCmpyHSfi8SDlggmXmCmwtO/VpwZNbR1YMJFLyTXDjybDnTVWq8tEXVy/vRl9apFMes3EQkgQwA8k6emz3jIbRAi3f5Wlc/xDmRUDWdSAvAcSi0rIObllS34o7JbFFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZ1Pi89M; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZ1Pi89M"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-137dd5481f4so396921c88.3
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 06:08:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781010513; cv=none;
        d=google.com; s=arc-20240605;
        b=E4zvQpniEDbw9P+D/T33p1xyocfHaTwMYA5hmLTfsDe3o1J6qYMJxa2o9UxwSTIln+
         CHZC3I7damVtOr7NOa99g3gLBskiyvg0C/mB6KAsAQtkoh7se8jMtFe9IEignN44rnpJ
         G/OEanyR/7xJBqjD9UnhAUQ+Icn5oHOz8sL3nUQqhLP6CYMBhYnc7PvtQAalaQywF61D
         wbxiLh1s7lGhZQvWZEdFvR0xUGlPTWzYq9qVAYqeWbWcty/1eXkZMO+79tnlrufEy775
         8DspKHMrd4BVHZXPtsG4S7eeofXOPU3cQ1imoI/bzmMiCIIMToBYiEbdpzheC0t8AGTg
         QRCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jWLfeb6Fbv3CpGCF6Qhd5cHEXEukaqdq05MrrhMnWmw=;
        fh=raikECyxUKDBdfD7raTuNPamTKgrRI29Vm7KqBjdzs0=;
        b=NPAei8b4t2hlHjLTV4kVupsQnD8r2Q2Q4IGGbZbFjgVQy6VTcmYfJMxKOkvDefYKRU
         vN+04xa+n11dGRKt2f51585YiFCPaYtM10lvONsDmtI4e3Rm/45tIZDl6+8IHwY+zj0F
         V/iPyuu1AIu4JdIsF1Twfsj9iUpI7TGCd0YkDhGVRucwC0XGlqctKIyyzGfk6Auo+/6M
         O+jaiPte4ER0ZURLSMpPI5lSeDImEJI7FWJJdX9r3Uy/snpedI0ED3E4pUua8OSKXDGU
         B5a70hLibGiOPQjBHTCWYKFeNP+m00AdGKYKwtKlKig4LV5ibtMMKiD1ivRHQIGgL5co
         E1SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781010513; x=1781615313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWLfeb6Fbv3CpGCF6Qhd5cHEXEukaqdq05MrrhMnWmw=;
        b=aZ1Pi89M8Zu9ofjG8igXOuVEfKe7ZBzSk/9mFsJgtHz/deJF7Wr2HLg8Uon45DLdEH
         0WhjU2GhpaUJ9ixh/fOIfuLNK3SPuSeW71YlDZ7YA8eFiwXKIkkV3G6EOxvaEC91N86a
         +lMwWkVaT3Zb2hNjl64QtsOEOQ2FI7QM3oqIFECOKm/YcrJ/AUJmLnlc7ni9XVeR2mrg
         db961ykboyRUJkTrmbBGFoc2c9Q5J7Jmse1xfIeLWyz2/H2yZCBVllkYpW2/4SGNaLmY
         dtMqKPgehT6uVaZfjcTU8yezYB4Y0fFLun0PgL2VW7cvUu7EFM9o084Gdcy1Xosm/8TA
         rhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010513; x=1781615313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jWLfeb6Fbv3CpGCF6Qhd5cHEXEukaqdq05MrrhMnWmw=;
        b=dJjQmfwlQuBGkHl8SOwAOgVX3LmR5cjt6RyQGx4B7QUBEGOv4japShOlcmlNZpZ3C1
         bxizt5q7/Ib9AygnHtQjf0jFVRK0+Jn/3cnCJwOsgO6RsF3UEeVqiMVosFDSL6QcPjol
         aQSJc74LFTV7ach2DB3nBJ9IAB8RP2SB+v2N0Sddx72PfNuFmldlcQDZj87pDe5uBRPH
         SOLSdBYFFhaUTqG0Hz/iFhNIcuXJx54fNGdgVrOFMcLk8+XnmXW8iPDBQG+G3p6jXzjK
         V+BHiL4uyx5LoDsRFyzwhRin4DWrdcIos83J4v2ziYP0gcN9xgiWXWengbNF9lN9dWuI
         gNcw==
X-Forwarded-Encrypted: i=1; AFNElJ8L7NOpRsH/YQ3Bam7e6Z39fVFNMrDfq9PYK754Y2npp/gLv8k5V2VYhyss1dal6JbDZei8/hFXm4I7aeQ+9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAtuB9fa80/RgLKYZJrELZPcxeLsAtUfQ654fwIXai+lbyWxil
	Xxyo6cYKDOA0SZCYC8PddCh25nFgaN7DrpquyWJI8jRu+USeR8+ayL9bw8r4h0p4tW6YOoo/uMF
	YUdFVh4BMQzT1u0t1cTkIQ17i6gb33d4=
X-Gm-Gg: Acq92OH3KlWpsRiVn2fNAipKzZwStGu2AIajosWy/ZOaU8Qmuc4b28vlVapqP+msatn
	yiB2ODgN+rCmIS7xAn31Yk9n9pmu0k3k5Fimiv3XR763tE07nQje3zQIX5eULfi0EmDjFhqcoH2
	QZPcsABvlpJULbHi3jpGPLZVlc3qDUYuTltgi6DjyPlJEtoKpUmWeSYRcEUSKeIyOTmC6XGc66F
	xxGnDUtK+4AlBr8O7trngdbUVR3bbmKBN1eeEPsj+i7UY9Sw+C58LrBzCVUv8qbWEZpOjHefHdj
	DFSvWnvg2AoGOj2zYIcbN06t0OeacDyV2M9TZ99wAP50PSQ157aZtTUJQxcqsj6jxNOh4uNIux2
	dhITQpqdpnW9+/ueJ5p7E+MSWOD8Bi2YT388rPSVt5non
X-Received: by 2002:a05:7300:7647:b0:304:e327:aef8 with SMTP id
 5a478bee46e88-307d5cee0b8mr916334eec.2.1781010513200; Tue, 09 Jun 2026
 06:08:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608141439.182634-1-ojeda@kernel.org> <aigFQcq3JHtdpsIn@google.com>
 <aigKVysaNhloK9bS@google.com>
In-Reply-To: <aigKVysaNhloK9bS@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 15:08:20 +0200
X-Gm-Features: AVVi8Cek00Joj4d_aKKtisUpJJbp7iNWZsbX2BrV8CNc835UtTzoaEOV93gsH8o
Message-ID: <CANiq72=vsePio3EBdzbHA+kTHfPQyHyYmPGnkm1r8ktsCuPrqQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] `zerocopy` support
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 2:43=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> > It's not clear to me if changing the uapi headers like this is even
> > allowed to begin with. It's a somewhat non-trivial change.

After our call I recalled the tool I was thinking about:

  scripts/check-uapi.sh
  Documentation/dev-tools/checkuapi.rst

It turns out it uses `abidiff` (abigail).

From a quick look, it seems to complain if I add explicit padding
where implicit padding was there before, i.e. as a "data member
insertion", even if the types etc. are the same.

However, for this change, i.e. when inside the `union`, it doesn't
seem to complain.

Cheers,
Miguel
