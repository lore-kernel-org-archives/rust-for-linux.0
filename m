Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D528838D
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 10:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508339; cv=pass; b=GV856+S05OQqayF8npH83GxyjEvOnd/4Q4ADQKb3KswPUaFJbsfUg1vGvBJwdygmbNLH1mHngvIYx05pIXR8jLhw/MrW5DElNuwJjofn/fPy/uk0pMEc7Cg3o5uGOJDLPERB5zjRK2UR4QARfLfDR8Z16wBvMjPN+XBqCT6efOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508339; c=relaxed/simple;
	bh=PbW9IsstvSDBtSP0Ri+qUOVSIUTIWVrO2FrRqUhJhd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=azwUKRZ8ovZWabv476L6bUHlAsqBHipgNgbVHOcbxR0xjAUS/sWDAnPBkCJTslAJdLSkiuSURv4wWNVBfVtX76dTLaB6ZgT53H9dyDNz1VtdUsjCdKoGx0hWY9BgwMMCNxmkkBGGMJivzb451SqymDe5PmfXzORdFwF/uYTkqVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9UWUcd2; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9UWUcd2"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b6aa67a792so391887eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 02:05:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769508337; cv=none;
        d=google.com; s=arc-20240605;
        b=VGGcmw9Z1R3/JOzag4JFKXV+NARuulqRQXbxxOjV7V7PFWO53+w0aOsVXqzRof+p3o
         0++9ue423lolYVK7te8KgMN8Xi4rID3/YmFl8o6EOEybI1LXqIOwn+0vEA+KcY+FuvfM
         R7eFIN4YHWZwqeC1mo5fTPjT8vKv+iFw6KkhifI/1hF43Pn9RhWqUUzxz8DUzSc5qThf
         JLZOLtyBtr25mZkZgeKBG1weHlOkrrO2Z1rl0fOOFshKTzvZtOtsIs9/fHh5Ucnpp+m8
         wp1/yvh0Xipj4mcKbuttKSo8E42J3YaU64omSRjLA5JRJpQuH1bQ0GS1Q15/xYPL7evQ
         0izQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PbW9IsstvSDBtSP0Ri+qUOVSIUTIWVrO2FrRqUhJhd0=;
        fh=S5Yt2orm1Uh8uiE3OR877UYC3vzYAYtBLs3EHxBrjio=;
        b=d/VjY0Vd1fEWutbn01cDb11W4DsjUq7kqHOalq7ZCG7jQVh6jTe8ueve/HRRWG0CRk
         nffXIn1wSfa4WkIrxqRtD29MZlPGIR0/JJrkVJsOPxm5zK07X0Ol5DYlm519dz5Wdy4j
         cP8EiiqXq0iMUKXHvsgIdxH9wV3NaUYrsX11zK5G98hqiZD5uakrLPkfyAoJn1sOH2ni
         A7xbPRjIdaltOfPWeJxTWsuNJaIfZ6y98fbwwwSyDD3pGRTBI46jnTZBV6iC2hHv+lvQ
         GqKuj9zpYWfsDpwSKXxCalcZT2WkYwEfLjCjtp58EtXYVN3WlDDesQyOGmHHXT47/z4H
         1LEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769508337; x=1770113137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PbW9IsstvSDBtSP0Ri+qUOVSIUTIWVrO2FrRqUhJhd0=;
        b=E9UWUcd2xJOtEIOIH2H943VVZwF8+YlxyGfUGHu5z/s6KLnjnzOcRfuBhFXnUBFvaQ
         mxA2QVc1WfEkYYUUu4Dfh/8bKJzGBFmXbO0fFP31M1Waq/5MqXV09ueQqFhl+jWo4lgI
         VeoQwRmYn/PLaHdlzP/p7h4VG9NnHyOe3CwIyqedaKxVGnZlnyeZfyXF2ht1qV7RFJZJ
         9MTDNHBg2oBerR4ZxOYM0IorhzETmm2Y1pu6HnoDDjdFvMALD2hl/AFV6fEIeKQSRfRQ
         W7gwNh1U9xQenwzELl0AdrrtXBHqPsi0P+CYEyHB2yoxtnwTQxGqOtSVTU1jtrOhMypz
         Exsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769508337; x=1770113137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PbW9IsstvSDBtSP0Ri+qUOVSIUTIWVrO2FrRqUhJhd0=;
        b=ixK1U4uNcRB5QA5TNQelWzmg82x528GavaVGwtnA4ReL3NNMZ95UHmdptUzdIkSJh4
         dbpft7NtK82ITm4Z32/UrAU3Qx5ZBuVHnSQ/PTYVL5EBtS0Y5QDayKUY7XIG0KPjtZvp
         yYfNnYvIQulfKUb+H4pp79CwNFOGgKuXJr0ZWt363aqfjvsfgGAxt2NBdsckpkCFdzXc
         79XQmg5Afi9OmTPkdpRUXDdssxQvOE1bfiI9ohsq1o9jV5RPwUG7/lqFnZqBzMwZUVH7
         rYwmtjdXKxTTFGM3wnVxf5GJJPNscyf9klU3Wu7e9yaFFN0HsyT9m0R9QyQ1NEZzanz+
         g2+A==
X-Forwarded-Encrypted: i=1; AJvYcCXlCLQoSsV8DPSbxiuXTVoT+0oUPbGXaIO7SsTIAlyEiCMOWgDbjAc6M6YeInKyUi3/WyOjU/ZPnXk8GM/tlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBXDYsZcUn7u2lxBp3GCa1P5EDHRZ0LjIISowFjE9KM1fPkhfl
	VkLSzqzdtneaHSsGMxUEzVrV1AozDqQJOJv99cM00YTu9L6ao1nOyybI6OkkfAEt3EvgZHSFuqg
	NWX2aEVYdiU1VFbYksf7XDGuYkJOhYK0=
X-Gm-Gg: AZuq6aK2ZlVJqNPQBvFi9GbD6w7HZh5wSE7dVWYvz6ILBVZMBs2X18mWd3BVacrvuiO
	sdDrPBmssA2+rCLy+zDc2QL5FllL0VSJC3p1ISwec5kCVH6s1/bQPr6gVYOcRnD7GLz02YatP3m
	J097gGFmO8qa0sHFHWk99OgBKf5Cp5+6LaYyXivv7mU+BACGzJK9J2bZ1TS2TvnKvh159DyqMOO
	bpqKESLWoo0XWZw3BL7eU+D7fnO2AAebgQpAO5/ofyKn7TPMGSPt7n24QtGGt2dtd77uPWv+Qlg
	lsPdMSl1A75b1AE874Slusj1xw5oDmHxRxuC785dHsbnTPcj2Y9BBa+CYFMW+6C6LnC2jjodTJK
	RLjNcFYqSy0xa
X-Received: by 2002:a05:7301:e07:b0:2ae:605b:d530 with SMTP id
 5a478bee46e88-2b78da07284mr375984eec.6.1769508336082; Tue, 27 Jan 2026
 02:05:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120083824.477339-1-sunke@kylinos.cn> <CANiq72noQv1rE=13CP9Ci1WAUONqN0bqq-z1r75n_572ZWA2Ww@mail.gmail.com>
 <40cb01ab-e165-4f21-8e66-d003967d91db@kylinos.cn>
In-Reply-To: <40cb01ab-e165-4f21-8e66-d003967d91db@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Jan 2026 11:05:23 +0100
X-Gm-Features: AZwV_QgzQcSzPQY_IiFYdIUNlXq77BwJ9-2hrjPD3t6ABzo7gi9KCReNNzh4WKA
Message-ID: <CANiq72m4Xv7in5LCKdZ8Xkvo3gtJ9+MVrb-L7+XT8fbPbE=kBg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] rust: Replace unsafe core::mem::zeroed() with pin_init::zeroed()
To: Ke Sun <sunke@kylinos.cn>
Cc: Benno Lossin <lossin@kernel.org>, Atharv Dubey <atharvd440@gmail.com>, 
	Moritz Zielke <moritz.zielke@gmail.com>, rust-for-linux@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 6:56=E2=80=AFAM Ke Sun <sunke@kylinos.cn> wrote:
>
> Thanks for pointing this out! I wasn't aware others had already submitted
> patches for this. I'm fine with any arrangement, and I'll check GitHub
> issues
> more carefully going forward.

No worries at all, it happens :)

Just a quick note in case it helps: searching lore.kernel.org for
previous/ongoing work is even more important, since the vast majority
of patches do not have associated GitHub issues (they may be in other
subsystem's trackers or in none at all).

Cheers,
Miguel
