Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3CA41A89;
	Sat, 27 Apr 2024 07:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714201652; cv=none; b=taw67J3UyqTD8ec7CdkLdGG73WNv6DiqoJzxqRVTAd8b5bImKObQgNz7JnYynOg21q6YMw0S1YbEqpOUUbJ3gJNKbekWpEWQ+3h7/jtu/Zl/225JvvwQCgu7ThVMmS4TlXb8fWXmRfmaurb7nIJ8imockg0NFqclNFcaSFX9p6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714201652; c=relaxed/simple;
	bh=/CGA1YZNwX3gAWmnKXT2ml9BQalf1WSTv5fRQB8eosk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQHa8D/iMvfg2F2tTDpKCQh0s9eRF4E5dqCXGdwMDV0VTO6XuHseGXv2bd13eSYezynYhICIXQBqjLt31klZTes/fO+EQMCwVlWTfWpReFHyrPa4oD30le+OXi1Y2Ka3O+prE8qzcRhBLvd2zudXGqxKZr/xcaChTC9s69lv18E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdA54LsR; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdA54LsR"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2b101ac9ab4so59665a91.0;
        Sat, 27 Apr 2024 00:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714201650; x=1714806450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CGA1YZNwX3gAWmnKXT2ml9BQalf1WSTv5fRQB8eosk=;
        b=HdA54LsR/SmcSqWn2HrkRRBu8vWZxn5P8/7xe0qrQrPHNaClaHKQydw+XMZZaDnuBx
         rfiVKhYiJw/m7K721CzCbWry39xrNfH87cIjgoyUJ5MNZytg4IaqBq/7gMzkaVpLpp9i
         i9pYsFNjlkH7uLtidQVqNRYxg5O5wX4tnv1MJ0aPw0KGjeRxfgAdtJI5Wei/dbFh39fR
         gmwtpyD8FOhV46KRBJNXloIxaeaThvTg3VKSBO3yR/AR+SWB5zJ75gpFtU+0EZhMt/nn
         T6qoIRMTJvf4/6NwDaD53UdrYM5VTwOee18W5NqIxePSTZXNlp1joIeDSPzonIxqfET5
         Nt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714201650; x=1714806450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CGA1YZNwX3gAWmnKXT2ml9BQalf1WSTv5fRQB8eosk=;
        b=dzZjK5Eg07r0/3inuEZUu/H3rSFz2/DIjsACMOa7WLcGIin9i+9fvO19nqR6X+3+k4
         vzbnddxaesWrEILTXleRtBwurIpIBPFjNykqCjpZjfVR18PkFUY+ZHPQB4RiVqdtZn1M
         NYvNiXroVcyVOOZYViCE/2V1e/r+W3fcG8g9gpBYGdFdpSf+k+fK6OSVQAz3hHfpVdzk
         uzy8DHTpjGxElASK9PfX6kURcoEEORrueGSsSPP80tUs9EcM6U4b/Fg+iCGUlWsvq//Z
         Bw9ikkFiWtK0/6kv6oGWeId6VoVoOfZ5a03xWnAOLaVQfd9vzG5TGjxjSOTShBytEFZa
         ScHw==
X-Forwarded-Encrypted: i=1; AJvYcCWx6iXr0rEglg/ss7niWxP7rTYpzPJQT1AQHUSCctXJKw2FlDwkjPlJAp4nITTjB/vmJiDdnCsPNFFIYd4d8bGJXg3ZTkF8NBpo7L/L9Q32Sr3ME3Yx6HHZT3fEAIQ2vsgTRPhGv0sOE+8=
X-Gm-Message-State: AOJu0YyKc9LRS7VLdKNlZKCw6bnvrh3NAIXq7SMQa3SaakManflUoINL
	sMWmM68XEki61lhAXRoSmd0lPkKI+SVLO6hc2zHAyaYgW4B0RD5MBL5IULtwaiGPX4/s9oQvtIW
	jC68N5V6vV8WncqiPjgoJ4aJLdiw=
X-Google-Smtp-Source: AGHT+IHKofGcLoII2Oid/yXNZTA6rcCBJ0FPtB2YItGOSvF1xcF5lLBmzSBqiKigm0G2dFzG9rGbqfJbPzz3KVR7WaE=
X-Received: by 2002:a17:90b:4a85:b0:2ae:d03b:9594 with SMTP id
 lp5-20020a17090b4a8500b002aed03b9594mr1594141pjb.39.1714201649876; Sat, 27
 Apr 2024 00:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1714113680.git.siyanteng@loongson.cn> <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
 <87zftgnsun.fsf@meer.lwn.net> <CANiq72mHoh=qgOGPj29hpS7EhVcXi5Q_7GYsycKhYwj3QbsTag@mail.gmail.com>
 <f49129dd-ed6f-4940-b851-0282fc320234@loongson.cn>
In-Reply-To: <f49129dd-ed6f-4940-b851-0282fc320234@loongson.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Apr 2024 09:06:23 +0200
Message-ID: <CANiq72kDEm7prV6ynAf=rZ5VydT=cYD-Ncj=waZEUOeCA1wbGA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] rust: docs: Update the translation of rust to 6.9-rc4
To: Yanteng Si <siyanteng@loongson.cn>
Cc: Jonathan Corbet <corbet@lwn.net>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, alexs@kernel.org, dzm91@hust.edu.cn, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 27, 2024 at 6:38=E2=80=AFAM Yanteng Si <siyanteng@loongson.cn> =
wrote:
>
> What I mean is that if I translate these two patches as two separate
> patches,

Ah, I see. As far as I know and from a quick look at the history, the
translations try to be in sync with the latest non-translated status
at their own pace, and they don't mimic the development of the
non-translated side commit-by-commit.

So I don't think particular commits should be translated as separate
patches. In other words, what you did here in this v2 seems fine,
since it already contains the "final state".

Of course, there is a small risk of going out of sync with the current
patch series if e.g. the RISC-V PR does not get eventually merged in
the next merge window. This is why I mentioned that I am not sure what
the policy is for translations here (e.g. there may be a requirement
that patches to be applied to translations have been already applied
to mainline, in which case you may want to send the RISC-V bit later
-- but I don't know what the actual policy is).

Thanks!

Cheers,
Miguel
