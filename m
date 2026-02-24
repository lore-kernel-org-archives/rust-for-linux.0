Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA59427E054
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 18:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771959203; cv=pass; b=Wd2B+gzRPcuQKFR3DTEn6S6+iAccNMnK0oG9Bzke1nJ2mTzSDnsI1YDAZ4FsJdmnML9wRNDz0rjFVdp/W1xGZDj0rUPvHdnz2J4UFkohHEdYVf3IZjkXOOFSMkf5yhuVkjPwanjB4a+kY6tHoBAAqex7/hfdC4qEjQ3qsuWdJek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771959203; c=relaxed/simple;
	bh=9c6iUfjvh83tz7TPk/e4JCYqYCELlYhpwmB/j+9dy8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8rneduKasaFlT2ayasTpLk37iHHZw/hm1Ue/X6Km/vbKuJn9OLXDAB4sigdHAHGgic0htjFv5D/vCMI3rJQAPzFHi7rxvcx+cWpxe0ieeh4ADcRB5EoPYGGImqyt6EIHrCFUNKcN3OVfMtqEVoKDsa0T0WGAHgB6ThMocGgLuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgjcCSZP; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgjcCSZP"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2baaaeeadebso180635eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 10:53:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771959202; cv=none;
        d=google.com; s=arc-20240605;
        b=K4B8NuEmtPsLXjrBNe63DlEPY0GZWS0KpdnYxEZjKocfpx31SX3f8Wf/87cmq+IRl3
         +PIbejTD/A5/pv3Y6gywQGnF1AN/Cy7n2MuH17RLxvwulQiLgkZ7upd0GUnTDqJGrun0
         yEftuX3eOB/zl9Y31xNHOjAXt+Fvc9JXOqlhyFjIZ1p3Y2zE1UW4jqqd4+U2cixm5HhT
         ria3u+PbU9x1G2daRDJ/lcfp8TgmhvrPAhCAGEeqZ+VN4IwsZheUltBBhjAoJ3fiTOYc
         TmuRWfYgUh9uOR2YVvn/0ZZTHTu+vUzG0F0sUOTuEHjFxATtzImN1J8J1u+wJjZEkg3E
         8gvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9c6iUfjvh83tz7TPk/e4JCYqYCELlYhpwmB/j+9dy8c=;
        fh=t6Qiy0yQmBcRFXCd3iTSFFMOOqsti+7/+NKZF84NozU=;
        b=MqpnkLic+cg4hOsr1jFt2YO+7rjC9VQFsCQxMmTyg2+lFlRN8OaWJG9aUBRtgbBUkf
         XNZvPl8/A+/5+HGkuPJnR/IRBEuLiLfN2prB57DtjffWGfcUs+Xjx5nh0CzvKveG93x7
         /qO+4ui1XLPX/IeXe2XtZqkDufnMZRornCZ+QyXRAer/nfZWJ/ESYO21xFZEGUTuGagx
         m2y7DVPAw4Fo+TSOFWhEdcarGzF2u67TVdDPaA58ruRdlpVwPo4uu3mV2rfieRcHIb5p
         MIm8Rdb5IiKJcoDA8V6XT4GoMH2AtWpPV5TY+S9k+rCwQkw/FEzkrvEzQ9bUN2DcgNR3
         TQ0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771959202; x=1772564002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9c6iUfjvh83tz7TPk/e4JCYqYCELlYhpwmB/j+9dy8c=;
        b=UgjcCSZPHfB9yES467JLAz3EiNHONZxce2TZEhHiLLbESxZWAhK+RaWXySIXHaBAzo
         Qup87SlYxBwgE+UN5WE+P+GSIEZa8I/FAKE4QZ4tsmvSGHNSGsLmsfnUeehlSFfVfiDi
         2NQUarOQTMW9yjtwBbsjlpYPci9aU+inYpo1ob3tz7+Jeo739/z2wNWtz7ZNFt+47car
         nl5nbkqzNk0kX4gK5UvAu62P1rfFJUvo6Dibo2IXcilLsBUDReZVPTOmMyyvq6PhICrj
         NepxBTZXITtLW6vDp2GQwvwQ0clQHxeR1ZAUOGPyyRo8CuBqxXH3PEWDKLEsjeubMNXm
         ZPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959202; x=1772564002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9c6iUfjvh83tz7TPk/e4JCYqYCELlYhpwmB/j+9dy8c=;
        b=hFhIiI5PukD+4m5t3Ja0T5PxhMVwdBI5vYVx20hlBzCmXXNu8Fh2chkCWzpYXxORPQ
         tqhq+XqGYKSv//nY1dslYsPp8zdFgOIGMkr0LzJBpWZDmblBLTdooJF6/HkHW1Xmjkus
         F50nKeiolORcAoelX5f6knJ0Yf8jEUq0A67HPfmqCN1NcvEGtMHqul9IJnQ+4WH6O73Q
         k6vbsVmOCZJos5R5PQg4R6nxWTpopFMJlrkt6f45QoSLeVPwkNPSlPzbZ0ohqsFJ0PDC
         BXZPDjYaHO34Db2+QHQg64bnGk5GZdCIv343QNX1b1wl4jVgxxipPrbrbeJlt8/o2VCQ
         HAVg==
X-Forwarded-Encrypted: i=1; AJvYcCXF6MjZ2/qZ24rccq2k2H9rRkcUv5talWfVYOUjVDmX2RpJVlFePJe64o86hKPIORxwXCBd2Q3sHSHGtPbL8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3krdGWDnPUqRXQ54k0h4qU70sqGE/ekNitVYZbqG/YlWPFRYh
	bXmM/cWZUStu2a8iqhXowJJBQMO1zKPs9oDi/uvasXdj2xHHojTjQk/yDxX9IKTDEVXZvPnoR15
	geAq7KlnB/Fl3dD/D6JSF73QdrYTKPuo=
X-Gm-Gg: ATEYQzz1oWz/SWroawk095NWON7bwixNAldSthrAmF0LxHuI93qCE2TJFs783Gy9Lfh
	xd3eu9C9vDTdWEPVij8z71qwJIEsYX4Rw37NWLXoqJEpiI6h5K6Q1etFO/GvvoGaGdU/XkH7DQZ
	jFLD/NrGr9MDby58eAH7h4Ks6C4Z5GXUVhxoFYeebNZeeUbQ4BxtshsKsoHCLqr8e4YqX7iFzEf
	9GLiEImTrpMmKilQ66Jck4syyAF530wHgGRjODIsOHW1IJcWisaBvk/onFs+D6CMFtaifRV+Ejk
	LzTH+7EOpxuTXeQE42Nkdk5A/zio7zUlSjrX257uaHUYvXH4LC+c+t4wCoeo5WRCvU/pAbeYXey
	pSyBZ9sHR7qa7tWZvkKSAhul+l1EHZl+V4i87ke8=
X-Received: by 2002:a05:7300:dc8e:b0:2ba:7013:2b94 with SMTP id
 5a478bee46e88-2bd7bd5a668mr2793317eec.4.1771959201913; Tue, 24 Feb 2026
 10:53:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220-atomic-sub-v3-0-e63cbed1d2aa@kernel.org> <aZyWqajbCfnGmH3o@tardis.local>
In-Reply-To: <aZyWqajbCfnGmH3o@tardis.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Feb 2026 19:53:08 +0100
X-Gm-Features: AaiRm53wBqxVZ4uFKZhJ207LCjCf0yCw_mkSLyXRITP1dATHnfU1T-1IzQHe3HU
Message-ID: <CANiq72mVeLh4uLNqqO6vn1PnXZK8WaKCOCsCXPWVv9MhNMgusw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] rust: atomic: add `fetch_sub` and update docs
To: Boqun Feng <boqun@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 7:04=E2=80=AFPM Boqun Feng <boqun@kernel.org> wrote=
:
>
> I queued the whole series (with some format improvement per tip:
> Documentation/process/maintainer-tip.rst). I also added a Suggested-by
> from Miguel on patch #3 (let me know if you or Miguel disagree with
> that) and appreciate Miguel's suggestion and your effort to apply it.

Thanks Boqun!

Cheers,
Miguel
