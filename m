Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAD73264D4
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 10:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210526; cv=pass; b=uwCroEfGKAdnOcIPDStKdrgiPvAy9TEVkv5+u/ZE02xqP5Dyaka0w7uK1GE9B5wTcOd4um0+v/J1kBlfiwUF903+O3CWuVHKdENEl+u2cXpkvWJX0AW/vMFKPHLCp7MPoAWUau1P2wLrjOFHE/l4i9kBMNX7w4V0RHc+I1/XVtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210526; c=relaxed/simple;
	bh=+OcFsOVDKBHkkLesEhr5A8/7FlgDjHxv02E1Yls127o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cc8iLLMH5SMLLRFLLeOXdeWoRBBEJ0HAat83d7YxrDk+9WbbCl0QJ7aPE4rwO22sQkEkVfIQOOv+vdWcxAGo/lst/xFzewi5HzlhuXkiQTyP0RM/b0wCI7fP6jB1sh6os7W9JaBqdpcSZlqIL2FLua0xUEcITHRj2pkiiWo6aqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMmxwBrB; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMmxwBrB"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bda3b4318dso129903eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 03:02:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775210523; cv=none;
        d=google.com; s=arc-20240605;
        b=dZ/UXGzdaKoMcqp+N7LEQqNLK6CYKE+CeWxOk9zxU5WLs22GYqRt+G3jzY+1NLOkpI
         F682LlyXsfhMVt9xvFHD22dQ//aMfdcLtjH34+vyF+IGDPtKYLQi2OwFL0+8MOPgp/bh
         3gfbb3czvXELerSl7AIsh9w5DSncLwdLULfeMBN3I9Q2COPNaH6l2dlVVqiD7w3jz7T6
         5FdIDtAwlTgT3m7tV3IG6clLLM7ij+OU04IV8+6Hs1bxW89eFf445UTAZDAtW+iCXxRH
         5+887hfrOrixThfIH9E6by1utUK8bQQ4r6Mk6EUtBnPPymW+jjiN5hgaCylLPSxeiLzk
         My/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+OcFsOVDKBHkkLesEhr5A8/7FlgDjHxv02E1Yls127o=;
        fh=fQxViu6Zq8/fkCaSE/CWPlPsI9CPd+tHNW/f6dyt7ck=;
        b=hc3Xz2Q8o6IyYIOQddcVW0/mqs0LxojZWE5qILV8Epf4hRzwnrUV6VDkeUDnJQoRNJ
         eOhpPBNdrcbJkTdahC8jtUwzwrqwJ2bhGSnJ6Z8oavJ8JqLNyTBu419esGrFb3PztTFv
         B9pwwiA71UaesiyAyD1JNJPkxfABu9lgy31q2tD0cGcKHL3NSBkDh93UIv1+2sC912wI
         JROq+nFNRz6tJvQ1Nkw5weyYXPf7BiIqW2a3ZPkSCBHKRML7q2gUZ2NCWIUEnALzqPgB
         NwEcWWm4JaQDSqemRJh+kO/15XkbG2M1GkVodK9x+rlsxnLyjIBLzexnjGbS1hkzP0UR
         c/LQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775210523; x=1775815323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OcFsOVDKBHkkLesEhr5A8/7FlgDjHxv02E1Yls127o=;
        b=BMmxwBrBhLoG44/fGTdMDcx6pt8z2VBgbyxu6hM6LhKLXRAXZDWwqkYFON5n4fLhBt
         yxubyBOuxTKeL2WWhHBfR9XQYQsLTwmRurif2cj6iPHAy+6K+qclXFrjXmnvp/B6MGm9
         P8IApmOdUYKwjKinYkJx3ptnriVwj1V/n4Af2ooAtiBcvc9Wls+qWKpOLtbzbaRzwBue
         Zdm87r4+GBM7j9Lc20PuDWlpS44zkerolde0UuGakuQTOOkh0meMMSGQqGRyGehIc7JV
         zBcxJ8ho0Izaoh2IKMYIoc0wMEmQWYSvSTkCbJv9KheWZ7a2ftsr2nzNxc3tmY/4CmO7
         UQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210523; x=1775815323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+OcFsOVDKBHkkLesEhr5A8/7FlgDjHxv02E1Yls127o=;
        b=OyyDDJy/Jr/d0Rdxk5xWPQdm69FHfUHR+qsj237X3XUYXeQ51sIBdeQ6ZVL+d83nVF
         +a/RQwRbKBc3FEm7X/wh+y2B0mAfOenzMSmvIz5ooZ2x49nsFVuVJlCqbCzUy4IMt3b9
         7UxCLOr2vv4ue7WM9fCCSIldKIO0+WZBs2jYepAUawcWoriYWXVMMt3Q0gD26EAB6Gk2
         MOpMUgAAjvXAA2xfWlaXptP4dA6iV0sPIURKyteOx+zeYD35vGAd4lI9dcZtePDYpCT6
         T1u0TvaiNb9jKT3J7cLINBorUOmmdn6JlxD86RV5JTDzuCBy8Cc7CdKTKfc5yw17YN9O
         sgqg==
X-Forwarded-Encrypted: i=1; AJvYcCWTRadt/rJoEUAsJ4pRhV2qAw9D3CTMKhwrUHc3E8vl9KXISx91jBx+mI2T85vdE21zBAY775BSay8Q1x0x2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzip7Qn/GPHO9PUNfmwlNiZ3vG4CwKejuU/1vba0zn1r7m4QOox
	0zqkpgDKc2kIeZ9FPiGK4PMMMqFEgNMRTnQweYSCF5mCqsKHYgAubiranzo7WqZfhhE9zeRIAd6
	5FauislteuntgSVqE+rU55E/B2L7UvcbD05sj2Mk=
X-Gm-Gg: AeBDiet4d9EetkJyt23taZaFmNmpF0ljElqzvjM/iuWbIZ/Yq4Z60DAFD3g2YHHy4w0
	SS1Gkxq3M8BmuoR/6ZOis+pXJ3xGBj3re5zMt1X0u+AfreXQ+DeNoyXPvm9T9I4mH0KbkbDUX6e
	dB6EifRVI7OSvg68/GHyXc8kuXFgwToF/d61Sf2s/4G6VJoX/J7IOtW/YqQUH6JrnRTQS9I6Bco
	j6/3RkZgVIurjYNYO3n7XES3uKFTEBaDXCITB+5pDkc0okSDbguh9O1463KwwbJYWQOMtnZMbpk
	enPkGunJwnpD4yPSkUpY2iFM5dwl6hbpL0N7TZzsDOUaWPvv0StduMkjRGp7Wt6164NzyfocpfU
	sccjdMyOZoNrAI90pTflF5h8=
X-Received: by 2002:a05:7301:7d06:b0:2cc:5bbd:c17b with SMTP id
 5a478bee46e88-2cc5bbdc229mr179502eec.5.1775210523220; Fri, 03 Apr 2026
 03:02:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326013902.588242-1-jhubbard@nvidia.com> <20260326013902.588242-17-jhubbard@nvidia.com>
 <DHGLXL0DVBAJ.2M58T9RSK5OO7@nvidia.com> <dc9aea56-d95c-4cb8-a94b-5195d16eb4a6@nvidia.com>
 <CANiq72mrfavWkAz0fAqVFcGF=fXRuD9w20mbQqoT4O3o0mkdjQ@mail.gmail.com> <db891b62-0c23-4975-a730-faa0d6a85257@kernel.org>
In-Reply-To: <db891b62-0c23-4975-a730-faa0d6a85257@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 12:01:50 +0200
X-Gm-Features: AQROBzBTF4ja4asJ7H59Z24ss4r3ZIxJTR62j7JaaB6RK6yzmsq16Awls0wO1YA
Message-ID: <CANiq72mJLxafAQpEOJ5U5bS4WwxCE6htnQj4tGZPZYpWHc0tcQ@mail.gmail.com>
Subject: Re: [PATCH v9 16/31] rust: ptr: add const_align_up()
To: Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 1:54=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> For the stuff I maintain I generally tell people to follow the kernel imp=
ort
> style in examples as well. Especially when the imports are part of the ex=
ample,
> as it would be teaching people the wrong thing otherwise.
>
> I.e. it would be a bit odd if an example illustrates the wrong thing.
>
> If they are hidden it depends a bit, and for some cases, like the one you
> mentioned, it might make sense to keep it concise.
>
> But in the case of this patch the imports are part of the example (i.e. n=
ot
> hidden), so they should follow the usual kernel rules.

Thanks for the feedback!

For context for others: we also talked about it in one of the Rust for
Linux calls, and for now, at least for visible (i.e. non-hidden with
`#`) imports, we will follow the usual style.

So adjusted in the patch.

Cheers,
Miguel
