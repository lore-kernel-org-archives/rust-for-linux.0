Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3448232ED42
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 18:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768845613; cv=pass; b=lJWEBn7iE/ZeMn7zEGCXaykDSMspD9VJBsg4CuTOabtJmVSYZEbP7RZseEvlGyWJtiIZOWkUGlKYM4O/m9XvCVMzsv4luAwbluyMDwKY7FdNVUys6dBqq5/X/IvjpsTBGrMY65GCyaviCQAtkRZ8p/l6GEEW/gHJu/ouP5S0zc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768845613; c=relaxed/simple;
	bh=cBK0XomjoEWCMk/yUF1Mrq97OYn4i0QUJa4LmHepAss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0uc37m3Vl6wSh76+EDfusVtARpUiTCO0K2+EbVCNe7gBN0FxN8FXK/R+Hhyracd8fZIIBXBg3lGiWr6Dqv4xosYI9knBqv1n61wFINI6ty09vNi7sgySeQ88d6qxPLAbZ/0wevB0EvMNkWFpz2G2Cc0Gt9V0ubLQNz4taNYVZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtNfKSo4; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtNfKSo4"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1233bc11279so282359c88.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 10:00:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768845611; cv=none;
        d=google.com; s=arc-20240605;
        b=SrhcPFXLWMzx/5Iy6EuFo8Ki93Mpehwa7j5jf3iSxpI68FMx3bUcm2H6i2aHAAg5uB
         a1AmP7QzYpCebz3aHaam86eo1Gi0o4JOXU7F4z1BSXJIDr5rb/Gz43/Azo5dFixd+pN8
         Y0WRkOnDcp1taRke6TAgd4IdzIK/cujXViJy7/tS2v7Flh/GUm20Vib0kKOfcbHVBLxz
         tDvBFtTpJcvmOBXHtB7VvAZEa8XjrlF5AcEiZsQksEWxXVgIhsy19QCxxxE2qgkEsje+
         +kf356gO30pLUB3h+nofi1ZvxDU4Ycwc1PoJFJ+KmwEla+lgUEen1R0234gKWT+TyJiL
         CyZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=24n1hBg/G9VprywVnyvsBQEj3q/7S0xyV4+1Oz2Cusc=;
        fh=Szo9K5qzEs2qFby8bAFVKE78Kww9W/fiYNGh+xQ73/A=;
        b=UOKyCGJoUQUx4iKLO6hTazAJp7qEKdTEgV/UWNhxvh1HJpHhvUVjZ1/nD3b31cIQZT
         OHxjGQnY8OYm7XFXuFgCr10rnoawnVOSK8vw6nWq7x5qXBpitzkrvu8DYXHaF5bnIEs7
         +b0hPO0q/8zbN+wKG2xK4dG1qliLewrsq0pzT5zpuKn/m3w+WxJE8AT/IIyTq++qdLIQ
         jDMKH9Mdl3VWUBkRjZFX4eD9KJLMrNWFb3AI/f5Dq24tqa2hnmwrs7n6i+VJlVsp+4OK
         RJ9YGGSCs76khGGCPG0+j4g0Cl82mpnlVm2u34XSHCrbVfGXNKPZXogT+eKgtS2Wa0IV
         wAOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768845611; x=1769450411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24n1hBg/G9VprywVnyvsBQEj3q/7S0xyV4+1Oz2Cusc=;
        b=QtNfKSo4YmAwefCRbId0ho/mPTY4hXefAaqQ7kalEMX/kfHn+hej7GQcVRLtpwkVlw
         alMTbjTwV5D4Fbvjnh8JQXA97NHVW7fc0VCVuwsR6J34PFTwaoALuxCYJFzsxQgP0Gdi
         l+tqYwbanY8OIGYZ0J8r1sVqoxC7jg3CIQoUkhkD7oliOMq193fasksb+E3/aFXx6pQO
         FW8LcnhG4/9MUggFYKNyhcTLGo8g8skohxwJOmcTOXKB7ZwXwm1fHinMa1jPqqHHl1aR
         JLojkiki/7Z+qhSRdBruZAWs8IjhQ/2pCBTYx/mGax5/GBOZTqxsy24fhm2nzbqAQx9H
         bfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768845611; x=1769450411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=24n1hBg/G9VprywVnyvsBQEj3q/7S0xyV4+1Oz2Cusc=;
        b=FZqCSiFVDVCI3dTCS9O+r+UJJ41hghYQ37WKErfYEegYGk7Cd+k3oOotZ7K3ZHuE39
         BenOX1DzmNz4J4+vwj4vyeIvWeLnu69NCMBZWd6Zu2lFEQNcAV6i9IOZNdxXY/AAEr5v
         veArMEZpX37a1SK6niS5e0An2l3fsr5evh982o/Ghzl6zVxxIaZjetzDWwj7Dht1S8Yq
         uCjRUq4hOUVVx0P1PVxURXwmuU9fIt1L6L/9pt26M596vIcQdqvcPrLUhaPElTPbFfjA
         nbQ/aRIsDULoE0B+H4yjJT98UlaU/xBtR3xWZvzXxRIkNd2rHn7/HBbZl9RtbMxyuAM2
         HVWw==
X-Forwarded-Encrypted: i=1; AJvYcCX8qcCd2NVtZcVcVi17kRoHKCxxeD6hjRIgJxviStLpsd732br+ncK2vwY1bRgt/nmnbdGvfMEPmC+o+Uk9yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfaoE0rUVt4WaD+GOq+MIA0UUtr8n8QQAtc8QYHWRbbV2XYY63
	mzXhLefvw3oPc2F3O0dx+346Qtdav310ikG4tAPz+ziXLRVKwnLs9p0VqLBMIpaN6kPSpIIqWvJ
	YnWyO5CVlI88Adlhw2Ah6UdS+jyQ1M10=
X-Gm-Gg: AZuq6aLE3b0I976MqxOkzTLKdCSIGnd3gXzHJiY1X2yXKcNPcvulVO23KrTmb2o5L2Y
	/3doRmyXKt0kAy/JX4BiXmzf/6J5QktnYB3/QlOtx3QZTDcoLWkqz0se01tlAMur8t0L5U2j5o+
	mNp+lzD4otX+FGiWlWj1zwEkUrM27e0oDfiOvvMz0/rdcXiTJSv5DplFdMBsd8ambigDeHmtCU3
	53NrejCgK4tTFXwPhI1R23EWqs1zuebnWV51lcHsnzqj1/zdJZFtG2gGOe89L0dRjv2pq8qrHSj
	v1YBcLWN2HFHdyEeoGMnp4MWtGApKrlA7kee+XhU440E+gm5+6bOtGhtoQHkGyKnUSH/F96dMTm
	XPxfLkjTj15Dc
X-Received: by 2002:a05:693c:4095:b0:2b6:f432:8f40 with SMTP id
 5a478bee46e88-2b6f43294d7mr305338eec.4.1768845609633; Mon, 19 Jan 2026
 10:00:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
 <CAJ-ks9mjBY7x1s_4wqMC8xqWsX2+aCM6NHn0j7yh_+daKiyS1Q@mail.gmail.com> <CAJ-ks9kn=0Sm2_1WV4xyzunzcGG1VZDKy8L=_SCCWyV2OkJTDA@mail.gmail.com>
In-Reply-To: <CAJ-ks9kn=0Sm2_1WV4xyzunzcGG1VZDKy8L=_SCCWyV2OkJTDA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 18:59:56 +0100
X-Gm-Features: AZwV_Qgf1QkDRHxM_KnLyiORsPFw3KDaXrXdgGz9YfanN_dj9eEzsucuWhLe8dM
Message-ID: <CANiq72krt9De1+WgMh0y8XX5K9RrU-_1FuSp+sKO1Ya8EaVoUg@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 1:52=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Michael or Stephen: could you take this through clk or would you be ok
> with it going through rust-next?

Either seems good to me, thanks!

For context, this is part of a long migration:

    https://github.com/Rust-for-Linux/linux/issues/1075
    https://lore.kernel.org/all/20250704-core-cstr-prepare-v1-0-a9152403778=
3@gmail.com/

Cheers,
Miguel
