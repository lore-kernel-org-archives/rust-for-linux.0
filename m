Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5AF271464
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 05:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776405372; cv=pass; b=aoaLTZhVWL35JRj2wYDg/3whjK1iMwpa3/lMsQDbchea1ivqj5en/fhQuaWLuRf3/MJUICW1kzf2s1rvGmxlbpnHJQsihbH8raptcZ8CfeMMZEjNIBSoZEO+bu/ss/F+yXmqRVU8mz4E9aKbZR3yPRNwbL3d1MBelgW7lTWz8z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776405372; c=relaxed/simple;
	bh=Apfo0/70TN4suYxYMmEunGi8x/Dp4oPTxy9kv1ax5Ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=knq1/nPeZpeNSO4oYgWj4s8HCMJrvL0MJGpkkscT0Rj6GyyAAqsJ1vsBposiPAUOpoOeo1rcIIkwPdNdokqMrOgYdvE56HKtWWqHYcsUsx7bfWl3hIfHd/Rys3IITsE15WQwdqYqY1BqZ1WVVnjURJtdafBGKTDJDp08xJb5VZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2fGC6GQ; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2fGC6GQ"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bda3b4318dso35322eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 22:56:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776405370; cv=none;
        d=google.com; s=arc-20240605;
        b=TtGE1jUBAzlxCteSBOHWCjIFGXvY/kPTviLY4+MZt/xLqeHDaTdOTzJfOmNr0dZmB6
         0MNnRSgUHpyEhhZQA1J8695otuvIpn4MihpXMFSslJcXUVxehI0nkuBizbHG8aDEjhZD
         0uQQ3+bnzosbiXRnyds2q3wLuWBTiDBMycXSEKijdMuUPVkXzS+g5aVxszP9IMAEfpji
         UhZfa1ZFuymzkt0pAbprDUS/tSPRThKK/pWbKFNKk2Y+4fd/E1q7YZl3dkVmJA1BQCtz
         aFKb38oM/UF949SMWUtjjcbV3RNr8frL3FeSX+OL9k3/kemaunAOmbeO2higGSKcz/8p
         U5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8wLBjGvJshmmFrIdurJHEvic7nm1Xi3uImDSR3XDZcU=;
        fh=vZdKJRwvlUFSWKMqL9l9yunasQHi8KprQjrZXfE9Fmk=;
        b=HwJN35M+8kClxPPCBLaLUiDJ9RzMPZMsTdgEJTdCoF9n+iYhjM14kvKwD43jKUpHRa
         jzBB3mdpdGB8DoIIDZHB4NZCe4BnD3M+rcikWcpJ7/ZnyGuk5hescfSTKmw4n2shKo4c
         iVUKaIexGORJrWfKn3MhaXjOJWLl4CrFFyoKSK8mfQ1yszQsVCvqGzHBR8HeeSHjQyBm
         HM9FXqLcCTVw4xweC5xh8EzclmM31NfsHBM4Usw1Nkf5QyyLk4u+OL43gWhO+RoVYZ21
         73B8CTvuyAdVbZRnq81nwMsISp4SAga55YERjU/84bBMv7va9lMKIjH4V4dkJIAR8HHV
         36MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776405370; x=1777010170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wLBjGvJshmmFrIdurJHEvic7nm1Xi3uImDSR3XDZcU=;
        b=O2fGC6GQyysg5icVM281/KIv+G7LRYYsAOnEY7XqhS3oXjmayUQufXevre30+Epc6I
         zT0D0kOZuVkCMcLHwsOE6biFubhTSvNScuVKfdu1SSseSbhEB7qUiy1tsN7z7fTEq2o0
         wySmDGixKFsrwex6OcdU2Ucrasf6RuR9u8xFbfFbr69zdqf3OEWYeC92G+aHx2yZK3an
         6iRK/DCbs9KBR4IPS2WOzjFmdtgRX0CU+yarajBOrE+hiqb9JHjc69DpvKqTC5pqbCDI
         39/CjKdCqYFRT0xJt7mPPua53KXKRXlUpqKJsTsdpdcXb5za0wBCc0ViEr/6QEdMA7pQ
         NAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776405370; x=1777010170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8wLBjGvJshmmFrIdurJHEvic7nm1Xi3uImDSR3XDZcU=;
        b=UWOwu62upDJuU4FPUnbfApXo/0IjEhYuGKn1y4+Jhr4ppO8MviWG8wQCkv/RzLosKo
         47gCGlvB9HyxTu2gZgY8J9LoJA+lZz3S6ydWTBPWBN6vGW6yXDaKWJIaLvAXrdtrcegJ
         KfzK3owaEQFNu3Nb3G77xArc3TMr/sJsxdXzw+TZpJRhjgydcU9mt2GIQUjNMgYvHM5A
         dSuXXDnkjfJ3IXOSpQULCXszY+iAwiGmAXf8ijBkWOsVyPgxEsO2xaF9qE6eWhBRTPEV
         L8sMCx5wx6P83QS5lg1RQoEyVmV8GbPDK4mvo4kLVWeNZUkshp4jAZtjE4MPR5TcsM3O
         /fiA==
X-Forwarded-Encrypted: i=1; AFNElJ85tFxPYuwdSTf9yjWKCwkQ19xB2ygJn7phN7wNeCvgNtfnfwNKbeqzNpwVrv0JSNvonumo4bNUjhi9WVwY+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9XJVlfb7FfR/JzFzkC2EdnxthO1N6cJwHBB0mAdSrCawtG6NC
	rj83USDcQUyxMUlQo21nL/m+hPQr+KNWSyOqVutA3rtRw+AmQ/43VdW2zExUOS7MaQYL18RrGnj
	ak51ogTAM7lzrqp+E1az/PPggs79aMh8=
X-Gm-Gg: AeBDies7ALHyPLvAwBpcaPduAwQZKpKemnY/9ZDvvO0OtWBP9343xYcZr1KpJDmpnki
	NHpEHJj6g95vBggZFaCUMY79V73Wpz2aKaPRyREzkP9wr7oqnngnLUZRM2T+QrV2JUKdzphP/8p
	ZzbEp6pVVw6V27JwdkmBl+T5HoyyN5kCH6uCMu4OgBeSWvco1auT63ZkqDWvKgOQnwzKa8F1j6f
	TaMtegfXLIZVOfzlSq2nbQjrXPxDURsm22OZr/p6ZE2d2Ae0kAeanQpcO3cY/FHNf0Jcead/rl5
	DCBaq9Aibw9WX1QhBrW6Ca1I1OCmxaCtz7cHonFr2SMtHju5uUEKNAvqxXjFzpewjPg+gUEPa9W
	Whmkf8vhD2rjQ1Cq/vdiYilB+/JfGhKmxLw==
X-Received: by 2002:a05:7022:e1f:b0:128:d0cb:7a97 with SMTP id
 a92af1059eb24-12c73f93093mr233445c88.3.1776405370040; Thu, 16 Apr 2026
 22:56:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409-bitfield-v2-0-23ac400071cb@nvidia.com>
 <798e83e6-eb7b-4502-85e7-5a0f6d9c6281@nvidia.com> <DHUXFAD38G5Y.6X6QNTANYNGH@kernel.org>
In-Reply-To: <DHUXFAD38G5Y.6X6QNTANYNGH@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 Apr 2026 07:55:57 +0200
X-Gm-Features: AQROBzC6Y3v48sYFOsEz2cwt7XYI8G2mRokkhCY-Bi8cmA958EMimlDkpSumvjs
Message-ID: <CANiq72k0FXcekxs=E+xLe3=wyu+KHr4yM0wLj1VgtgTUb_K4MQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] rust: add `bitfield!` macro
To: Danilo Krummrich <dakr@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 12:19=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> But now it seems to develop into some semi-official "shadow infrastructur=
e" for
> when the drm-rust tree is closed after -rc6 and during the merge window, =
and
> it's not part of the official drm-rust workflow and other maintainers don=
't have
> oversight of it.
>
> So, in order to not motivate workarounds, starting from the next cycle, t=
he
> drm-rust-next branch will be open for new features at all times.
>
> Consequently, all patches applied to drm-rust-next after -rc6 do not targ=
et the
> upcoming merge window, but the next one.

I think that for branches going into linux-next, in general, new
material is not meant to be added until the merge window closes, e.g.
from last -next:

    The merge window is open, so please to not addd any v7.1 material
    to your linux-next included branches until after the merge window close=
s.

Some things do target future merge windows (e.g. Rust itself was such
a case for a long time), so it may be fine when adding it before the
merge window opens, but I think the idea is mostly to avoid too much
movement during the merge window to avoid interfering with other
maintainers finishing their trees for Linus etc.

But not sure how flexible this is -- Cc'ing Mark.

Cheers,
Miguel
