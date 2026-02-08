Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DEE1482E8
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Feb 2026 15:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770563789; cv=pass; b=glnINGbFjUUTHM1b+RDahNtJJP7u9qwWp8to67S02Inb2sZV27Riw/HtXVMmGIia/q2nQtizk+DF5JwCy5Rn9eqYBUk3kln7aoEoOtSb8iWgIJOZ73citEp6jbVZIE8txig7FgwuFZnX1nXF+OwsuJnMwFDvkGh1gUuPM3/gEzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770563789; c=relaxed/simple;
	bh=jmAyjtACiSCPQEAmRMGTICjJnLwemPxRTh95jqaPKu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DQ16gYv5w00nyrJfddPM09P0K51Z3jSU++w8PDS+e4Ee61McOuaPWK1W7xWsJJhymcdQwn17jtxqY9vkn6fUyz48UpWtIdniZ8/1lYHoLV5AqpcDf/O2z3xoiXeXZKCZtrtqRQ1BIePegHA3lCg6YibTbnVk+YBV7yCIrSTFrWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKjiXxPR; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKjiXxPR"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ba716126f5so9683eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Feb 2026 07:16:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770563788; cv=none;
        d=google.com; s=arc-20240605;
        b=Vu/UI2oYN6WzcBu019agdmVsYLriMEECv0j+MPk1EvL7qZoKskpb3RDOn59L7UrApl
         NP8SyGvKfE+CuMbaOwzgsEQF3DB0FbfE/A+Q4Iqx+PihGifJDBMJIshD6DIv/Qwcezfp
         aMqoMFN2ybBuP3JtBPxdQQwKOt3jXrmcRStndZf8a+YqjnqC/WLnfMl8VvymE4jUP+uk
         Uf6BQQ44UNkdz5HZAlOZlSazvBNv5yRSaakgyXy8hNsp3AZRQJ91J5c8pGEzmMrR/b/O
         kHkaktrZRHdnG4lgAGOieTsGFWYUURv+zSD9qu6kE+oTWl+SSG6Hwx29rQpDFdDsrg4z
         aM9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jmAyjtACiSCPQEAmRMGTICjJnLwemPxRTh95jqaPKu0=;
        fh=EFK271FM0aEEUcmu5gbaUrwSMyzdrnQJ4Bi5qG6XE9Y=;
        b=FHMSBkAXYffFKqVxXBwp8UPxE8X8ENDrsKS3fxUUb+Tmq5HG0+DkTmn4pAjLanLl51
         zZ9wMrIM7OF86Gqig6Z3tS2Ho61iW6kngrEM/BQVnhnR+1/jfZNzQJD5fQTV1NMQayGF
         Pqqnfp4a0U7GGX9XPMc/UGEeEVcb9Yr0McZcSKIGv4lalqp5LKp9pjLfPZ5UCajX5CiN
         Ezf+g23GcWh0eEFa+bbgdynnfXrEGNK38npII323dlDEoOFGQfmF0gv7rhaW6rsQ0rbN
         Jl2oJFqXRvsc66xIIf9BosdOG6LYonaskC7m28uLRhz0NqDADfqOXLIcmW0mP9uf9Gnm
         1mrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770563788; x=1771168588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmAyjtACiSCPQEAmRMGTICjJnLwemPxRTh95jqaPKu0=;
        b=ZKjiXxPRTK7Qry+k5EASRJJSmlK93UmmO8UDsskqVCda/mHV4XYzDWyAHuaqI7+MZA
         rByAGCMeezqZPq8tddPVUQ/s4WumE3/wGkd4o8U2bLBMhla4qdaYP3NeYaipkbsbIH6h
         6qLFC9z+rFZAMBXWgV7Wkq8jBO1RimRPh3w8slBBvVjZZHJZjlzUW0v1dXbwWJD3SJkw
         xLOn1zfjm1lc0hYemZFH5cydTFOu4I1B5psNGanWD2RrZzEocSatvgFKxR1IPGU+CMML
         Lys3Rl3oi/V3FnnTc4rqUifSwQfgogog+rwlwV+4aiRDXRS2BC/MVlWPu88oOFXU+rYK
         AXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770563788; x=1771168588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jmAyjtACiSCPQEAmRMGTICjJnLwemPxRTh95jqaPKu0=;
        b=ddj2ymlkT00VLDLTZQPMf7imgPk3RLmhijQFcCZAM8b8zaFNQ37zx151quu7MuYNjV
         dx27YB4v7A5eSx2Hd51kZQD+qHBp2Z1LUn/w6hRILN0tIXQ2abSebUFZfS5ELr+40oqn
         Z0Pt/10eQTahI87LZfHffrEnh5SU9I3ObsfvN2g+tlErMRtR1Y+MI4z2zBuWp6ZafGwN
         kzDLem3ZqiL1RsgpLKkeBBSgJTzPDGnQMne0OE/gkfQaSvG3UKMRklaVOcCWW76ebFos
         Yj9pdLHkABi3ZmqdV9bsjby+eXSDl36jzhskVde+16MOONScNxGjgYUGGRq2bAH1IPZA
         g6WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYQCBh9qivTr8AxeA+s1tSHt6fCxcqlvOXYNyrPpTkx8tInQ3zKOm+wsZl+I68uGLvqkhz93a1GfSsztZ4wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX1CDxAKTobYPneSG3pt3pRYZnzsFjLdX2kIBawxvWkJ+ADsDQ
	Kx+HFwpb4qtFZgj8ft488U98C8S6jkkNjEL2HZB31TUJ/rByXwmlvu6UaxKjVV0LuagT0nqf5/U
	MiDzL5Pj3xVSABNpTBdvTvf3S6jiXxTc=
X-Gm-Gg: AZuq6aIHJ6/rjRIoOo1gaLkhHuIzZyIUHyUNOsBu16XE08NUqXn6Wv8QgIOO9kqF1h2
	qYBfbE015cLrSaqMbytCTylIo4oTSIc7HeJFmqvx8l28gRdAjtyAWerFLp30WcBzQ9Bo1G8uZp6
	sHRNGZHURUAeVM3MGyjQjup3uvgRcAa8Rgs0A7UsGvNFuTaayOpklJyfrH6zMa9vOL9USNM5Msz
	dpJ6Q1t6UoJFbyarL8+IVac2EBzpfLZ2Iny6q4AaHMjSPaaJ0y6zHG2NXFRJY8XKcm14vFycM0U
	LCTNNcx14YkS01zF0r4hN654h2/q72jPc/GJ4wVr8MC0Bs3MxOHRHQhnl4x6h59bKpllTXzFpFS
	KeRDtC38L4w0j
X-Received: by 2002:a05:7300:dc08:b0:2b7:b6ee:b3c6 with SMTP id
 5a478bee46e88-2b856520cbbmr2075162eec.7.1770563787994; Sun, 08 Feb 2026
 07:16:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260208122227.3524-1-9erthalion6@gmail.com> <aYigHLZtXooznMB7@x1>
 <aYig1O0-5yxy91la@x1>
In-Reply-To: <aYig1O0-5yxy91la@x1>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Feb 2026 16:16:15 +0100
X-Gm-Features: AZwV_Qiu4OKbW4xqVSy-rfd4vUd-D73QLQerjhiUTXcbQxRD6AzuaUXsgSc3LgQ
Message-ID: <CANiq72=URHDPz5=t5jDr1r7whEhRzQiJdMMp+HLyP6fBH2xfZg@mail.gmail.com>
Subject: Re: Rust data-type profiling working in perf was: Re: [RFC PATCH v2
 0/4] Test annotate with data type profiling
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Dmitrii Dolgov <9erthalion6@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-perf-users@vger.kernel.org, Namhyung Kim <namhyung@kernel.org>, 
	Ian Rogers <irogers@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 8, 2026 at 3:42=E2=80=AFPM Arnaldo Carvalho de Melo <acme@kerne=
l.org> wrote:
>
> This is an interesting piece of news, so CCing to lkml and Miguel as
> well, please CC that list in the future.
>
> Also please consider adding examples of output of such new features, so
> that people can quickly see it in action, data-type profiling for Rust
> seems interesting, right? :-)

Thanks Arnaldo for the ping!

Cc'ing rust-for-linux as well.

Thread at https://lore.kernel.org/all/20260208122227.3524-1-9erthalion6@gma=
il.com/

Cheers,
Miguel
