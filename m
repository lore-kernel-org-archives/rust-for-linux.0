Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792524142;
	b=eALEYfaJGgCPa8lGDarCIigcEgY/xDzIR9WOCepi6uqIBngLTw0EL5DpMTaC6gtRg+aB
	 LskD/iq2hgqaGS1WgpqK2CbZjgU4Jzc8E812Z9HhwXSz4jl/rsd/+JP9pHbMIhvsZBk8v
	 l3BXZCFeIV37z+1gOwNIaqDSWaOe4aKDHCYTw1B/Ogh3Rni6dgZwKW2yNVeEuAG2NElnZ
	 uCTzaBOyRLVZfjZ+HxXU6rM+MDh4iDD1uYZNFt67dRwottoaVTm1bWNxD2JtqV+QYjuZb
	 E+jh1SptFSSFwZNseHivcIGReCFf6ovixpI1PqOd8UfE8ugJHpoGKquOppK7zJ/02oA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y6pW1Np65YgMNQpZAz08cJlPZzgj3oRGZ7hLNsVmwfA=;
	b=RhKNt8Jlhnf4M3FexqdDwg4aR7XYSnbkMI3Tznjv1iUxRRGQuhK2OEfEAvhLM8JaFlQo
	 2CRoKyeUKeJWcEtRL0X2y94Ih60ryuzYpk739HqcWBXaZIL+wVcMHWj45Gdk5ck1/lT3B
	 +CZ0+fZOpS572IXy3F22j6STq0bM7I9nv9OFOvEi/FRq6crmE3A1yBVzx9KrdUd3dAfSi
	 22UbKHk59lxIRjG4lVwfqZ8yv4ulqtLTPQKnOdgBwoS7Yhjo9wDyLIPt5MLzWg6GNBBIK
	 Ajem6SQyqchdp2Vzb8UeL89AIZWs3NFSwvIpXQFGD/1/KEGfrXT334MXlYFc89LkMdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FdVLlQeb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4063D606A31A
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 19:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4063D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FdVLlQeb
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3550dd02c9cso299493eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 12:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792524141; cv=none;
        d=google.com; s=arc-20260327;
        b=GdeXE9dfYCuW+wA3kEFGyMGs/58QDHxNfPiWC1O03umUvmCHNs45+AXB1xz9nqYaeK
         Ii9he7FfGikn3Kf2XjNJ9mxSkotLGIFUS9XX5VRGE3kabdgR8Z5YXYYONLYxsO1qsmkp
         kqdd7Tt2x1n44tFGDzR54IPvVj6ScQGy441EYO3q9CJRS+2T6Vcx7QTDCqI5KGSWMGIq
         X99IZCSe83EwWuRFHgfmXo1xL3RhnJCCtm670KveziQjZV88vAdeE9gUvu+LCFzo/SHN
         pgxjeXpJiMEGGTuq9gYgO2+/TaAa7iRw3duJ9gApDuFRO2Q0zmPUtbDutuRBo5QiF+ui
         /kFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y6pW1Np65YgMNQpZAz08cJlPZzgj3oRGZ7hLNsVmwfA=;
        fh=6i56mcG6deFNiaZ6qJFCB/ErqPcTyvZ2hQv8iFKrjhA=;
        b=Z4+ylMsVI+8WfgJHN/+iMe9UcKQrj50cGo4xlXhtC7w86n+/YWkPPNnOdgHHDvqLzL
         sWYGSzPDaHQgSczsmFa+x1qzeeXTv9Pdy0pVmypUy59EBI2oOE5XjbGmHaZtE4mVa7Bb
         UdnU+nPPAfUykO9m4Kb6g0a8x0C2Idlj6VT+LGsIPFFx04kP/Ye2SNN2x65C6iFRD7Ov
         u6EzkFJ2/GH5tVcqfF6gxqTk0Fwv8fFDK6N6pfAlecTDP1EOj4EMq5Zm551CDswmUyCb
         Cn4tSuBroVzdTDlFIYXuMjTLeZxIPMCY6qfFzkHiRofYsw0NimYqbrTPSpHaQxr3+6+H
         2bsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792524141; x=1793128941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y6pW1Np65YgMNQpZAz08cJlPZzgj3oRGZ7hLNsVmwfA=;
        b=FdVLlQebghmNvLxXgbuZKTIAmJvt9BwS3tERVySriRZ70dWkKvjz/xqm3oLrZ1R4Tg
         O8rrr/uv1nqGHzILbHpKq8LWOBEV5kf3uCo5qJe7X28cVK3HWgvSw9V/OB2OtvLkJfG6
         9tl4gHOQpGsRVZ6oSqH45edWhT25Mc59DqkqlieRw+lIJHE34/EkHbsdbeH4wBveiAXe
         e4+UrZnlijmA4q52HAMGYu76l8gIxFJtavs1Dx0nf8u4Hq+8B5e7ZE0RZPRLyxRcc/cp
         +Ac+3amZz/6YgnP9jCkx17SXnHq3AQaUCQF+BQHYpVbdzhqNbC0sffBk7J0H4zuW9+0a
         ZICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792524141; x=1793128941;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6pW1Np65YgMNQpZAz08cJlPZzgj3oRGZ7hLNsVmwfA=;
        b=osXlTRol77BR3RPE49JVdJJmKG+N3rzSBR8Ajn+0yvkdn/xAB5DxTJxXgum0Q3eOYK
         mT+zechclJ3I8fH05HV8RvhQw/M2IJtYeMcczF0wC/cv2m4PoAJNs3TrJYx9DNlsSIWg
         cHTCJD9DEDSGegY1Pi+z9+ggG/siuKghJ1ODrjhIOVfennZrjgWFc7QuPlvLPm474yZI
         D+X1GfUX6nB4OwiDrKfZsYUvoVEzvCmEYSW/526yacYwni7/KeMAaY1SB5q+slY5rVcr
         wYqXtR8/9gVqTHFUK2InrG1Bf4W1j7xbWOFLoS+FWd8Iy+2hSN/mnfN9g3EZEiiSGUmd
         J54Q==
X-Forwarded-Encrypted: i=1; AKwUvBzjTGrvLi1G1HTozcbPRqH73i/W6iYBv0dbBGDlt0emdUsvdjrnCymnii+91bUy5k5TRKXJkhzgTPQvEyczRQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLRLTfHLPP6Jk+dMdQvxP+iLLmkcAqKA6sEJ9zAgZqUFqEF9DQC
	O9FoGxcJWitRPvoJ8yGVgqZ5HQqlJrhXuvaLqPvPIp6ZeIcFEgRi0ODuiMOZvEqmrT+Wf15S+c4
	RUeJddE5RZb6ZNbSCf6HUtSwSwg6aAX0=
X-Gm-Gg: AYBFou2sviGmRXoxZy+zdPwlpp/L4nX2oON+jc/RB8Oxj583lSWzQxHj0KE4PowAHIK
	iUQUbu3Yr5HluJNkDEyTR2UzgLK5sR+Comju5YXYnSjWUn2yCRGgBf3WqQLDCb8kqKVYdGk1fXJ
	nDdILCkH9MP3X1yznsOLuQvq6fI2exKLCTK4p3RwQiIM1mKQgrEmw80OGgtYYJmeqn87kZKl4OL
	q4RpaC906kgZfT/0740LQP1XKDQLXO1M3Wp2eYbEkE66cBogwA6dZCByJ47DjpFB4gRsRkgTqjK
	IazzzPpPSDkghMb6LNkuLfUkx6JE8kTg4y1T2H3uAFWgrd3MXaONYn5DrJHmObMOiS/AUwOLzxV
	rmMQT4IoNSMfcx0nvewHC4NlEnx/8omAoWfdgv02xTTnjHlbNF4STdjQlPSeEV5epU8S7qCGSP+
	ycyi/q74l/0aRv9U9+Sqgujr3OzP3NYeRJEzTuKxz6q7LpB+rODRGzMFdrVR33bCk+I6V9fx1Bj
	0RTgQzK2PmcIEUTqcqfIBxMjeJn9fSR5fkB
X-Received: by 2002:a05:7301:6196:10b0:367:2bed:e7a5 with SMTP id
 5a478bee46e88-3674d54de76mr374081eec.2.1792524140925; Tue, 20 Oct 2026
 12:22:20 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019151243.1595858-1-gprocida@google.com>
In-Reply-To: <20261019151243.1595858-1-gprocida@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 21:22:07 +0200
X-Gm-Features: AclHuK_Q4B91U235uOypRate9HJl6NJQSOf6P4vyvpd5ZbK3OTSCP3Lki8_RDRA
Message-ID: <CANiq72nqq4oGBWVtSMBhXS6G4H7fYg07ysD7SjnOWWt7R9_ajw@mail.gmail.com>
Subject: Re: [PATCH] rust: exports: emit ___EXPORT_SYMBOL without C declarations
To: Giuliano Procida <gprocida@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:13=E2=80=AFPM Giuliano Procida <gprocida@google.c=
om> wrote:
>
> This change defines `EXPORT_SYMBOL_RUST_GPL(sym)` using
> `___EXPORT_SYMBOL` directly:
>
>         asm(__stringify(___EXPORT_SYMBOL(sym, "GPL", "")))
>
> matching the `__ASSEMBLY__` path in `include/linux/export.h`.

Hmm... It says it matches the `__ASSEMBLY__` path, but it matches the
`#else` path, no?

Cc'ing the `RUST` entry and modules too.

In addition, I wonder if we should avoid hardcoding the particular
form of that `asm(...` and instead expose it from the C header. That
way we avoid repetition and getting it out-of-sync -- that was part of
the original reasoning.

By the way, I am right that you noticed this via GCC builds?

(Nit: please write the commit message in the imperative form:
https://docs.kernel.org/process/submitting-patches.html#describe-your-chang=
es)

Thanks!

Cheers,
Miguel
