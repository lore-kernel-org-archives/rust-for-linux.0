Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D502826ACC
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 03:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774236315; cv=pass; b=hgy1YyEI+hS0u/LCKSUwGf1eZP/0GqhcWM+mSj3Yg9kBfI96Ji9MHiTV6UFTNobNmBhoj0uWWXV2v/7D5X8UhYhyjSNSundydJT0Jo7E4kdcf8bRq4mO47LOkylfWc23eSvsACcwq6ALhaOyp3iGdwb13vpyXJbBGA3PtFeKjBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774236315; c=relaxed/simple;
	bh=6L7OuggG1xx/psBeZawamh6lKLmj+yBN2DAvG0qZTM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GwM4tigXf1p43M0y2SwflstFoBGVdalKmPiOAsj7HxAakx5kPQ2HLryi1AapscgPwiaaA6em2My4qVhQBuNmad0VTrHpGX5HvhX5wnB/wYCil8orx++YgLe7J0HXyhdXSuJGvLNDzBYTyeMOEoWOANV1RFe9rIRgpLGBn9cF2sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WiCVebup; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WiCVebup"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12a6b260693so195810c88.2
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Mar 2026 20:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774236313; cv=none;
        d=google.com; s=arc-20240605;
        b=AQ0f6milHfL8aZXElWHWwRvvFFtBzIDMYqV2ZlhI2BETaZW3B9G9HIwwh5wrOw9Yet
         SWDqBOnfN4xhbA3UcT59uwC3smM6V4MUxUqVOLisR52THDDCQ77zsbi1Vl1YelK+ql7d
         TD+HvcL5Mr3gTZHeh4wuB99/o9OIci2QGEIf7fcI78pX0H3SHSKvo44LBQQDimob5NFW
         RfTVjlOT98UN4x+r0glA+w1h4fM+Ybj1MUmi3GeECz3xK3fo8cFE+CDnyLiUlLGk5y4n
         CF5UXRvsuYR12eqcxFhws7GUmyuffz5usTezgpYTZy4lpOZBg3bP/r5QYuiNmSOPA5iB
         1haw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6L7OuggG1xx/psBeZawamh6lKLmj+yBN2DAvG0qZTM4=;
        fh=ZVGVjWegP2UWmx8BABFaNCrFy9zbTq7EDLBY1LwsgXA=;
        b=X88eVgj9jGVZ71YObiL+tMyH1YHO+oyEoP6XErt39VGFVrsY4rafghp3vWUgP3vtkn
         njO/tr+fmtAqmR9zhkb7TJPwSnuUdfDT/jY5S3tuLGpc2RuwNHkc8za6bb+Y3hghOhx/
         hHMDKuL61azdVRMbKcpCiwmfxjxF8KcuCPl3zUwRdWQf/EGP/EF5T/wNUqPx1vUiWFTj
         PvyfbpTfI4iMdjqG/s1aOWtfIirxJ6otcN2YhmbzExeGB4+AeA/E5HSyAXxMRMXWo3H4
         30rON8qEQOibJj1eX2TzMcU1YVsGVfmj4fUXatqLFxMQ1A2/hpNYBTM0YYPfK5uM55f1
         rPlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774236313; x=1774841113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6L7OuggG1xx/psBeZawamh6lKLmj+yBN2DAvG0qZTM4=;
        b=WiCVebupG2Ch5W7z6Nwg87yhnXRnqABBXcb2SHL1m3Lci3m/8XkvTpwg6IHuOQEh/C
         4XXzVdhDg9SMkRGxMN4MpCr/3qnRpV5n7mNAPK0BMhSFIVujHVnEH21KDKx41MPZOIFN
         Ep3O0QlXF5gPaPxgDoJHKrh5FSU6jAQEgQkHvSKJV0ngia9JPU0qXO3845rW+OhJST/v
         cKxYl0y6pC2MTW4eZWAYA9+oj2ejmH31GJqsmo2NmvRmF+n0zGf6fQPqsA1xMvGwbU+1
         mZrgxujh9KUQu4wrorolMFskl+rrBTNtSsZdhwH4DMODReh3Hda1h3qImjBpmi2mFBbK
         Cvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774236313; x=1774841113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6L7OuggG1xx/psBeZawamh6lKLmj+yBN2DAvG0qZTM4=;
        b=jpLviH1TCXDsp1EuV4x5HJqXH2V7Z1n2RmsOZh7utCTrCNLwThUICGYJfqNo1zjtvv
         HS2FevKsHHa9OC6M05SHyRBW2yvCHk+ueZfMkoP5hhWb+OfHY4ua6l9CHr/XFqxFy7kH
         FfRVM3ioGs3sOMTGPt/EWybqOplzYJV/QDokTwLu/JOySZu4oNyM/vs+fT9RrnsfeTQg
         TcnSS3jTLLD65LNyyN3aq+A5JydCu372nMydh9nlomOuVVTKubX5A0VRjLMNUhBCelRK
         P1wXxLUrRzsxSK3IRwYpuyddZf/k0SmpR+YsLfU4C8qfhsWt0TUXrpvSIbsTZ9o5PpOc
         JD9w==
X-Forwarded-Encrypted: i=1; AJvYcCXHUJelkOUIOTmEtWGGnNoB5qfu+mWufrSJM2E5aVqc5O2nhccTWGiB26zcJVdrjXVpJ35ncO7dnDtl5zB5pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCPz77AJtAwr0yFDOkBGrJa4PYnslO1o2CQExQSObIFOesHkSv
	+aCCEnhfWnx0jVtVGKNQ47qNLBgn5o0QXBzCGC2tDn4KPbp9a0c/eP276C6fVibVBbLUn510hBs
	+HAK67n2+2/TArPy5F/cXzUPFVh1GdYE=
X-Gm-Gg: ATEYQzwTfaxJawoLzGIGxnTC4kIkz8jlKwKs2u90+DV4PxcKmwTU/rr7PoUP+hJTuF6
	brl2VzeRjfXaAScQ+H5EfLP959eYPBlRNZFrbyEcN+ILktr5uISwZjoeFLqlUZCWXXds6/aKdyk
	Or98I9zi1jTC765AHym7OnosiSzBlyYiMliI4JY7lOfY1H9W9WTZlDyGEIurK711o7PBqP7k6Nb
	4JI9sYAEts/7il28FxTjxEHgVvkuBCasXk6hVuW4EsU9Y3I6+DjiQqV+mCjkZdE0bze/ORv67j4
	QidoYNLZEzteGiPiWmrFo1MmUH5TuDRb7OCEIOI8HwC3Dpd3ksAHU+SVO0ssKYXdKSdXJ9PZQ6i
	6+2eIfffbMFLlJBt/boibq7M=
X-Received: by 2002:a05:7301:100d:b0:2be:1946:858b with SMTP id
 5a478bee46e88-2c10970d302mr2034525eec.3.1774236312928; Sun, 22 Mar 2026
 20:25:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch>
In-Reply-To: <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 04:24:59 +0100
X-Gm-Features: AQROBzAuhFHkGwwSKh-Ea07cCRjtb6eZEQluwHGIFmDfJPfdFW0BK0DaJf2FJhk
Message-ID: <CANiq72nwSWVDRqm0Vap5j5X5k+Q-wq8okQ9d3KUgZt6M4CpW9g@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Andrew Lunn <andrew@lunn.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux@armlinux.org.uk, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 4:04=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> Rust is already fragmented, because it does not support all
> architectures. Do we really want to make it even more fragmented by
> having some bindings only work on a subset of the subset of
> architectures?

That is not the case. The `depends on` is not about putting them on
abstractions, but on this experimental build feature, which is gated
on `EXPERT` to begin with, because it uses a fairly exotic approach
involving LLVM bitcode, which carries potential pitfalls, like the
mismatches on the target string like one of the commit messages
mentions, and possibly others.

Cheers,
Miguel
