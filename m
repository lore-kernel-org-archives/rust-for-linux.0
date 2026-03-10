Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321543E8C71
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 20:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173681; cv=pass; b=A99PYpjyw+nDcJsjrdwsO08K3ERsZZf87PLboVjxoRtei3uNM+84tp0n4+nnzw0NmlPt+sDvBcaAyO+65uT3kU+oSHAh51a2myOcAVM0VXZZZJK/DGieB7jtB2j5ee2fiZpLrZ2rfOaV07LsbdJXNg4iV9bESdlgscmAEIjqnxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173681; c=relaxed/simple;
	bh=JCnK0AMNUESWhNDknJ31xLnBOZD/YQdQDIFIYsdNnW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+Hv9kMtExG6SuvkODxEtkrYbGKtWw3IviDE3/7ulqjYEyvTnDCVXoMviUtzxwszQfbx5TR4hBIcwEvO4oWURiqRHOUS5itFho3nLLUYoGGwVTogV3Rh6fqnV7qpLnJpBXzRZkwTo1qFVztlBPRL72AdJCZzcL6JFiH8O6fjRyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMAvSP0D; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMAvSP0D"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a13d3170acso701718e87.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 13:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773173678; cv=none;
        d=google.com; s=arc-20240605;
        b=kT+ElaKCsrmBfZffRyGt/aBRwyNDPYY3SRQYPKVz+Jfd9GP/1DXuE9hYTPrARBmDtM
         FJPbOfTtPgP3tZ04l4tKNqlyMbDGESg2yvieMWGErxbAryW5pYYmwWRP1yhGSgl6MDvf
         wywo/IvyqqqBIXEMm+8qshn0nhq1u7AyljhP+p6s6x50r2zS6cwQdN/G5qdE3u7akSqt
         Jb5dwbvLtAEVcvVGZRPjU0YkLSCFkPnZV9bib7ZJircP3+qQFk5aU7JHpbJFHrn334vN
         z4MUb1OZI61uAq84kGkd0V0fmGwbZEts4U6gTJuNCeUxrXWdCvojQDSDhmwIHBOauPJY
         UIdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JCnK0AMNUESWhNDknJ31xLnBOZD/YQdQDIFIYsdNnW0=;
        fh=i0QsgLy2NT/hQ+aqG7TNtN/y6YMgmlbe03xG9AhrVtc=;
        b=RtzW1Kd44MLI3GC0/nDR9OoEuUUSj7XEmzRc31641IhXU2tEL7XtWCFB2MJhLT0ThU
         GAt83U1xlwNhLKcExxzBXp6kV2Kofyr/aulDtfAwAKTOCRInQVYGxd1Vd6HMVJ7Ac21d
         PA1j4uUGV4Ck6kwTutNv0mnNq2xihv+9kjfvAc7lMpPAAk4OW5z10jx/+earDXWlTkKr
         nuV2Y36yz0sj4DVnsIg1j7YnPKYnZBAmxWzSWP4QL/GHd8u3e18bCmEh2qhOyPtVfsi4
         bW8SXNMQhZID7SHAESD7ocgmhbHJij8M8GPXYqqaMnbgeaLRmEvYkSRr5u3CeIOuPvML
         x1QA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173678; x=1773778478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCnK0AMNUESWhNDknJ31xLnBOZD/YQdQDIFIYsdNnW0=;
        b=AMAvSP0D0mkeFLpGLRsxzt9dXzufCksXmLfSp9pES8MSwxWD7K6AcRTBcGzvamXuip
         HKl57RaRdSHexpqh7x3ks5iWCKHJ0R9D5Vne3N8nNFTuVcYN5OkK/6l/M7yzBH5vMgPT
         eg3jLaa6jh5gzAIV3AN70liQ2PVcWXFJXGGfCTonwdOtVsNjtB0iPWOaltoLtawv+n4T
         kZvrEcQciW80HLHJL7bbI+SPSXYQVpI+zi0F3Te8RRrIVGkwQS8SQmFyPkKYEyYfAt66
         7qLeGwb/Xnm4pS9qu7XO91Strbxg0RM2EdRWlsYqBzoGCFo+WkUoK2d8otARQl+Zszs1
         1rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173678; x=1773778478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JCnK0AMNUESWhNDknJ31xLnBOZD/YQdQDIFIYsdNnW0=;
        b=K5jIxcJxo3NDo7hfzGU/YXsGkzqLydRhPPnKqZwsisnAI7Ts9q0INl3y3DXaz3P64e
         X//9umNIcuSuvIO+qH85BCU3otEzPJYWh4aWES8bLImHjMIz6wS5uq5RkiLhR8oHZRLK
         5yJ5GUGfWVt4yV7Ibi3AG5zESIcjCWCNE97IVhOMzA0bNH/gg91Rddvy6s/DPCu7w9wl
         DZIi7vScHg6O/H/1wLnIUh2R+ptMcP6G2H73sqDSOONXpdpLcrdMyZ68KiaoMDdiyIOM
         MFif76j6zv8v/4jbweTZFoDl9mYsW3dAG4FsGhQ+w7q5XVfYaVUvM2bmqfP3ajKZDXqr
         qZhg==
X-Forwarded-Encrypted: i=1; AJvYcCXw0G59+hFWdITlpMlGsXlDk2opAhlmIwcF+NkFDqPrghKTqBIf0mKdc8LASzXiJAjZbd9hAj/eJ/G5hae2qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSOOu1CTzmdrJbMEPRz7zfph5RgFGXPzd+IViANEp+NgVBsG2m
	HGU0rfwil+3/fk7Uaj1kz1RpVXdIIcBPzX2jRUv18ts6pLxYvF5fnPQeFrchYA/5/W6Q97oxOR7
	IqBy9y3S0JEvDk5E0t5t10AnCd1ince++R87VRnkpzQ==
X-Gm-Gg: ATEYQzyYeOcknKQd++ZsmPwyntD9CWIShxO11IFPbUP3CwHLFx1QVSfHCVyplJvOWhU
	48O+VXWbea2XSOiqwotXJ08C5Ajh2STmay6xMvK7BaOyhDt45dFCURv7tpXCG8fsLO6R0/t4lPF
	AimFRnZY86XZbDr63ZI/1vCd0G1NOhLsqrEZVAX71PrGxvSrUkL6QoO2sj542k1fwX5Oylk/RYi
	dua7ZGySBKHSax0K4mgXlize6ZVjSmhgdwbUAecesJTENdv3cm8MeY0Pbdo01QnvQJIbi4yWKK6
	ipjXuPJf3UDpIGY38LrO39uINeEh+KK49fO1ke6o0/8+bzagoyeqCBTx6Pok7mkDvhkhk3mEBpS
	29KyF4MIbVut98HaXI1VP7WA=
X-Received: by 2002:a05:6512:608b:b0:5a1:4526:b8bc with SMTP id
 2adb3069b0e04-5a14526c6e0mr1985879e87.8.1773173678191; Tue, 10 Mar 2026
 13:14:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
 <20260304200715.76360-4-edwin.toribio.j@gmail.com> <389808bb-f71d-4c35-bfd0-b4db14268d58@gmail.com>
 <CANiq72=Qe3x5xVQsFOd4YuD35mOan=mUt4PEFRQvStGnmLUcQw@mail.gmail.com> <25240ce9-0886-461f-a969-d049c84ae80d@gmail.com>
In-Reply-To: <25240ce9-0886-461f-a969-d049c84ae80d@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 21:14:22 +0100
X-Gm-Features: AaiRm50_MESA8RwRkbA-1d6RC2ULGLODPfpxbpwL-zrxkxJSvvasen3MhAf2yGY
Message-ID: <CANiq72=ZBYS-P7smq3u=CKN5y8_LTo5jThAegCVHhmo6TXTdpQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] docs: sp_SP: Add Spanish translation for Rust
 coding guidelines
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: Edwin Toribio <edwin.toribio.j@gmail.com>, carlos.bilbao@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 4:33=E2=80=AFAM Carlos Bilbao
<carlos.bilbao.osdev@gmail.com> wrote:
>
> TBH, a reasonable case can be made either way, and there are no written
> rules on this question AFAIK.
>
> In terms of precedent, the Chinese (simplified) translation keeps code
> blocks unchanged, which I suppose avoids giving the impression that
> non-English comments are acceptable in kernel code.
>
> That said, the goal of translation docs is accessibility, and since these
> are illustrative snippets, Spanish comments help readers follow the examp=
le
> without having to switch back to English. Personally, that argument
> convinces me more.

Yeah, I guess it depends for whom the docs are meant, e.g. whether the
reader is one that will afterwards go and read code or the English
side of the docs, or whether it is meant as docs that external readers
may want to read to inform themselves about what the kernel.

I don't know if there is a policy for translations about this, but if
it doesn't exist, then it may be a good opportunity to align.

(Relatedly, machine translation on technical topics is quite good
nowadays, so if the intention is that a reader may read the English
docs or the code afterwards, perhaps it could be nice to have a
suggested way for them to read those docs via machine translation,
especially if there are accessible/free/OSS/... solutions).

I hope that helps!

Cheers,
Miguel
