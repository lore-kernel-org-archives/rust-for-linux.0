Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35CA2D8DD4
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 15:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230715; cv=none; b=S1wQhQ7bPwmjZFauXXEOEi/smtHYANfVvYgvMbzH8VE9yGxhpQWCvg6XHQ3TWoii/VyRjC0jjdNQ5tnzkiXOPx0sPvUyJ5S+nMUv3xCYJnFJPwUV4zSCoZw/O2Q1W8F6Y0liMNhHpHPg0feva/voz8lLvNtnNQ6raagcUH/X68o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230715; c=relaxed/simple;
	bh=hbVdS31AjGbxiM4REiWfB3EQ5mxh8v0ze3TE0QbCrro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hNDMA68EP3dXCcm43TDLtRvv99SnnAt+lAtKCrmwlHbICvsjGv6wyKz1sOccAUT5XbDQI5Q3Ej3UW7RmxNg34bdZci9eD3RWLYT5qIEoFONLLXttGdUBOhsyLqeXLfHuCktQ4WonDPU256fNccWaYVVSTFjsnlMhmZUIU6vs6Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KoUzoaXB; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoUzoaXB"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b175c4bb64so368966eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 07:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768230713; x=1768835513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPNUpExGPZ0eP2PL8HPQ+bLbS1S2GR59K/pZ0qOKnYA=;
        b=KoUzoaXBRYbZftvo2Qcuv9vFmxlgSd3VdHgKlsroMvRAk9dzp/X1TH7QufvLELI6wF
         H9cDObAwbTuC2Uug8RjQgRaBojeYP6g5ITal6cdJugOzN9QmeTeJ252N1BZRgl4PdOBD
         8hSVQBjrP4ohSQBz57kp9Bc6fLQQRH65HMC0KRNpp5Z93fBUqTcGy2JdH4tB5AylnNtV
         Uiib2A1Aw9Y8N9nfkHcwTnKovV6qjfestkBup6iowR77bZX2CE4r3nzYoU7N8z8cpun8
         nI12vdcv89PY9/GMiF3pR0TwbMOgvyG4gUoi5xrYqiDEhJ5hbYI5fpE7ZXsA83tBdjQu
         G+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768230713; x=1768835513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lPNUpExGPZ0eP2PL8HPQ+bLbS1S2GR59K/pZ0qOKnYA=;
        b=e73sc4r1s6EyMhvadqFuPxTne5AHS36IwZ3h+iT5uZLVO2U9ICguS/cpNgKHRpsREp
         oDOio4n8SSV/i4AnjD/L2bueSkVRNaevfCsBzH8w0KO/Qyj05/fCQSz8HYZG8aetKHeF
         fZCjItyCOpeOuNUQRkfMQLnIlUGSN4qDiqYtscMj2dS0TBcpUORHveRgw4y+1Sne3sC8
         N4z4Rb+xj35Gnrsvplxd0BaQQJIMYIALF3d13a0rqecV582X4Z8Wt93ridnlOgSsDKIR
         Pj2G1fr5VqDqumQ9XWn2c/wAEYFPZhk6yIxo21ZxjkVs8WZl9bOVNszRZq7VaBNbknln
         f5RA==
X-Forwarded-Encrypted: i=1; AJvYcCWPrO32SnWCmKbU5KwhwKBmJCr43VcVvM2XfShfMiVfNH7DcmPcFm6S2OrV/qJKwx2ZbeBat0tt7BCkHAf0Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGJCp2mn7FBTK5OokXW0bmQq9jYSMgkm8XO3j0gJRPJ4qY/Fo0
	7ScKTaJ7cQ8rqZ9ex+GJNj/VhMOp+BzZCiuYx2ysXc1K+5Z6jtK65uaxXeT23Mk4o8mmipnxYTK
	WFjONN8m1KxcliX6npMaDuKuEoeJ8dpo=
X-Gm-Gg: AY/fxX7GGdJZwP2QyfTmCxWj+ey/GTj+lDd+HTtFD+aeIKKv6VpzUrda2Xm/TkB8PHn
	A/Gdx1wwGIS3iyktWva2z32RE/lAPhW580pRHFi2bNeQgMB41ALfX6rGw+aRYtZV/ojmaZ5lh3P
	9RYZZfJNGftrTxVzhjbEKy6iLihHSfJjkk3vcdzV3O5NDVxYWOiVzcZTLEpJsX5wAjBZ5nGS8uF
	gi9JM7seG4sjwV+PAcxYzArYjH6CBKq5eBw1vT6RH5D5VAb14uJ0P7FC0bcj6q2uBWbRdWzTLTD
	0gIuGhPwKrHtDk0XfdJGEhIKOIUw71x3k22srccSndi3LRYhUaDleSX63p4BpR48CBsu0oC9x7O
	+7gpMsdFNqp9v
X-Google-Smtp-Source: AGHT+IE2JSir18sRr+yPNaQngfQaMGaAN7gWIs8BQSI0z2/mMFjuJJRFlyAYimBq8J0DGl6BL9+5OvXrK6zDhUChif0=
X-Received: by 2002:a05:7300:8244:b0:2ae:5f73:1968 with SMTP id
 5a478bee46e88-2b17d24286amr6565850eec.2.1768230713100; Mon, 12 Jan 2026
 07:11:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107-jump-label-rust-maintainers-v1-1-702b03482f2e@google.com>
 <CANiq72nV0Z_UjdAwT=41TjjfmKnT6WL4hVNcxg_QCe7TAEYK_Q@mail.gmail.com> <20260112100006.7db6d31d@gandalf.local.home>
In-Reply-To: <20260112100006.7db6d31d@gandalf.local.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Jan 2026 16:11:40 +0100
X-Gm-Features: AZwV_Qhbvsj27jGvnxGNOxIBWj7t_7rzsFvwEcJvm8EWQBeKdpII1fMvWchJec4
Message-ID: <CANiq72nY2xUj0aG4q7YOKxt0EV29Jwos_kjAPD89eE3_irsr0g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add Rust files to STATIC BRANCH/CALL and TRACING
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 4:00=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> I guess the question is are those with expertise on the list of people to
> Cc?
>
> I think it may be better to have a separate section for RUST so that the
> rust maintainers can be included in the M: part too. Perhaps:
>
> STATIC BRANCH/CALL (RUST)
>
>   and
>
> TRACING (RUST)
>
> And have the M of the other sections be R here?

There are several ways subsystems have gone about it:

  - Sometimes they may just add the people to the existing entry.

  - Sometimes they create sub-entries like you suggest (usually with
square brackets like " [RUST]" but there is also a " - RUST" used),
e.g.

        BLOCK LAYER DEVICE DRIVER API [RUST]
        MEMORY MANAGEMENT - RUST

  - Sometimes they add them into the existing entry but with an added
"(RUST)" after their names, e.g. Boqun in LOCKING PRIMITIVES:

        M:    Boqun Feng <boqun.feng@gmail.com> (LOCKDEP & RUST)

Cheers,
Miguel
