Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557801AA1D9
	for <rust-for-linux@vger.kernel.org>; Fri,  2 May 2025 17:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205836; cv=none; b=V5CxB4U+m//lHk8yQyrSImzYe/FQZGb3eM706VFSrhnyQcTEergRIIk0GkPeYnDrmTV6Gqp1PR4JE/q46mdMjcdkjsQIxk+K3DFC0yeX0NB905xkB8dJxSFkHD0pfOSTEMlB0frq92UrwiOCxfV9lVgbTr0sXZvlyBfpHtm2kWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205836; c=relaxed/simple;
	bh=+mCW1+76e5xHRuEqyjehg8HmtpCtT+in3WELINhexuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cx9o7Kvl91Gr8HRHjLNVSRMNrl9AUK63SFesnjKLkW3hT2Mzb2BXjynohqBJ3b4YFgqKti0TKDruVqyeyAANP8QniLHZtp1gBnUsbxWtvPpoGpgGgrQoBte7+JkTgwxqCSSH3FkS7WxM3ExXYsWGmjwhNO4x6GjGPlVbwj4OB9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqRktig7; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqRktig7"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-60402c94319so1497531eaf.1
        for <rust-for-linux@vger.kernel.org>; Fri, 02 May 2025 10:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746205833; x=1746810633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mCW1+76e5xHRuEqyjehg8HmtpCtT+in3WELINhexuk=;
        b=bqRktig7K8ioFeKMksHumkQOw7gt7q13AOOggxLajish2wwAUepHtGEl6sFiKRDZOw
         1dUDoAdIuTpaaWUv8E8tvBnfyeUHHpNOZBo4SVmvaZOb15OA8kdsaLJLVnPjsTCi/zBU
         6JDOqDm7ZpUyp/M7UG/B4R3NvAHae+6CW7m+/CshicjceCn3Ek+0EemaO2gl/JUjzDxD
         8kD2PijrL0ZkmEsEewwwnJahrUweHSGOtliQnQFWvOgOMfFS+aNZDOFdFJTQGZpiQDNV
         OHBTZgTNy/WlO3YbrzZkk1xHDsQG1ybwpcS1wdyXAZ7uyYhG6Yk1E2U6CGHl/pgDqNpe
         vanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746205833; x=1746810633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mCW1+76e5xHRuEqyjehg8HmtpCtT+in3WELINhexuk=;
        b=B3y/v9Ojxq5zYlcewtEKEb7t1523xCsrY4SFkkMFGBmmYHJlZBoR79lU/N7/GqNoa/
         IIzdcbSHdImWWNsyTw/l6xTb1gP8A022aArY8odt81qmYPxMQucjbOjffgRApWtBAn0a
         elTdBmLclc5w3DESAX91mtkldiToVPeqS2MWI7UUd1z2hbaNJ2kv8NLPAk1u+2MJesgc
         n2cn2+XEWfRFUbuoWHwfLkvU6v+CU5K5CK+usbNKUm2ocBo+Rh+IyzVxBXwzJFTsDLg1
         vhJloTjB+4+413RzvHLo3HeHTKPPjOjV62Sc2huoPQ5Dku6NcL9DAGYVbSexy1jdYbvD
         AGEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlR2XS0+lRED5e6Qwr9Rd358jtOmWE+CbIjuUwtQiS+r81ze9chesH0GRQOPgFga/Ki8ok5XsKnMVyQ4/dLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+/0uu+z28b2CZ0BpehvyMWvIOi8oZY/yPy9HXLhEp8pol5Q9f
	kQ78k7dIP1bc1m2UPaVs59m6CW6hfvPR0vJskgf7x+a3ZZg+k/9THcN5glvTUWjkXvKuFUMh8Ex
	DT2OiShlRU3TAEkuxUPnXYKHYwduhJ62o
X-Gm-Gg: ASbGncuykhAmn0VFm3FWYJvAXm+VcEUX/BRu1keeRJGBCLzddTrrMhaS/3f7gct2FOy
	uRv4wPZ2DC2E5tGV9rIFScY6WwO9Z0iJ/58yxkJ0fMPUmEDn9bpNbaY+s1c4fDY+nvbsqVSinfa
	vyQcStKTsN2kA96opbhW+v5RgTFJAkHVk6+wjP2DqNfcmy
X-Google-Smtp-Source: AGHT+IGBjLoRP5XFi/TybTJQQzDLF855PY1TKjSDiBixDKTgpII8C0WppayNwNQrjDYR7dG1XQHUrDr7c5/KkxDbj0k=
X-Received: by 2002:a05:6820:151d:b0:604:6b0:c259 with SMTP id
 006d021491bc7-607ee7f2061mr1793809eaf.4.1746205833427; Fri, 02 May 2025
 10:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501005726.744027-1-marcelomoreira1905@gmail.com>
 <CANiq72ncOnDVHCNScjT7Y5+-kXzGvtcia=LpS0h-MfBqBMuOWA@mail.gmail.com> <D9LI1ISOHMV1.2721CU6HG3SRV@kernel.org>
In-Reply-To: <D9LI1ISOHMV1.2721CU6HG3SRV@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Fri, 2 May 2025 14:10:22 -0300
X-Gm-Features: ATxdqUGYAajVGfZ8d16OG8TKp1eikbjQ9YaCNAxeyCnoe_X8b28qvdIp02ngQUw
Message-ID: <CAPZ3m_hZF7yz9OygKidkbmRn5EXdoqC-6HxrKRMxmEHL021z_g@mail.gmail.com>
Subject: Re: [PATCH] rust: revocable: clarify invariants in safety documentation
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, benno.lossin@proton.me, 
	ojeda@kernel.org, aliceryhl@google.com, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Miguel, hey Benno,

Thanks a lot for the feedback! =3D)

I now get what you meant about the invariants: it's not just about
documenting them at the top, but also about adding // INVARIANT: ...
comments in the code where they actually matter =E2=80=94 like in the
constructors and in try_access_with_guard.

Benno, thanks for pointing out the missing invariant in
RevocableGuard. I=E2=80=99ll add a comment explaining that data_ref is only
valid when is_available is true.

And regarding RCU, your comments made things clearer. Instead of
saying it's a hard requirement, I=E2=80=99ll reword it to focus on the
is_available check as the actual safety condition, and just mention
RCU as a typical way to ensure safety =E2=80=94 but not the only one.

I=E2=80=99ll get v2 ready with those improvements and send it soon.

Cheers,
Marcelo M.


Em sex., 2 de mai. de 2025 =C3=A0s 04:33, Benno Lossin <lossin@kernel.org> =
escreveu:
>
> On Thu May 1, 2025 at 12:18 PM CEST, Miguel Ojeda wrote:
> > On Thu, May 1, 2025 at 2:57=E2=80=AFAM Marcelo Moreira
> > <marcelomoreira1905@gmail.com> wrote:
> >>
> >> This is part of issue #1160 ("correct safety comments and documentatio=
n
> >> in revocable.rs"), reported by Miguel Ojeda and Benno Lossin.
> >>
> >> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> >> Closes: https://github.com/Rust-for-Linux/linux/issues/1160
> >
> > I think it was just Benno. :)
> >
> >> Tested-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> >
> > Normally one is supposed to test a patch before submitting it, i.e. it
> > is implicit.
> >
> >> +/// # Invariants
> >
> > We also place `// INVARIANT: ...` comments in the places that need to
> > ensure the type invariants hold, e.g. in constructors.
> >
> > Given the issue, I think Benno may have also wanted that you then
> > refer to the type invariants to justify some of the comments, e.g. in
> > the "Since `self.is_available` is true, ..." ones.
>
> Indeed, we also need the comments that establish/make use of the
> invariant. For example in the `try_access_with_guard` function.
>
> There also is a missing invariant on `RevocableGuard` that the
> `data_ref` pointer is valid.
>
> >> +/// - Access to `data` must occur only while holding the RCU read-sid=
e lock (e.g., vi
> >
> > The "must occur" wording seems a bit strange for a type invariant, but
> > maybe Benno had something in mind here?
>
> Yeah, I don't think that using RCU is even a hard requirement. One could
> also call `revoke_nosync`, since one knows the revocable is only used by
> a single kernel thread. I also don't think that it's needed for memory
> correctness, but I could be wrong there.
>
> The most important invariant is that `data` is valid while
> `is_available` is true. That's what's needed by the different functions
> accessing it.
>
> ---
> Cheers,
> Benno
