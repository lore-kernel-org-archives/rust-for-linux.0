Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6865736606A
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 10:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137019; cv=pass; b=Vg1ewyoftpVahYQ39jPx25CCGromOqn31SxI5UZdaibboYD/nTzF5seSyg3f+SyPVl4YWV2H96SiC+Q+7BHNxC+Sh2JGssfjKl8zh/9ArkyLE8zunANq51CzURJ0w00DZ/tBnzzeAiTwyYTp0ye/NbdjR+uSrO7IOTQWwRe7UVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137019; c=relaxed/simple;
	bh=/0rDbcSCE+CnSBaSP9QxsFvmuZ6WNjyY88UTqXi5IV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sXi5s5lgCrhIUBXzJ/D6JAWNeKxN+mvnvmVfPllINMuh62r6SHOvBvY/nw2Ovk0j4qEIrnNGd7Pv5emnUkBgV3rr9s3iUFz7z9D0nNeiNhmxnx9LwIGdc3HmyytZolh++31cNEs20iTIW6OvYRCSotw0LCWAEmFR8TgbigCaGJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eou7PfJP; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eou7PfJP"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b8095668ebso824129eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 03:03:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773137017; cv=none;
        d=google.com; s=arc-20240605;
        b=WX2tftLuSJO+1S8VVa7uRIMhag7OGpkZ8aPk1h9XaY4Pg/vUVeG6KwYcYz+3VBofGH
         6Crt/OfEE1U9waugVDYrQmieT34A0+nHEuQbOMRgPwWS4cTdNyt1/vVba8T4ajT/ls/h
         FEZupvRCzl//ex9g5p+OGEMdG0q+6xPnfnimKGxXKfGvmV517rSD0Tb4c5ylJkpZ5Bqa
         vir9/vQzyiuhi47WlKGyw+rpC4I15HjbSdvpfg6MxqgVc3R772Px8UN9jUF46KS8S6Us
         3QilSL4NPWCd9Rr9IQUZjKQ++NtGJx+ZPAKcJR63hwZDo6YBDD+VI9f0wrnULbs3bhh8
         qjUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/0rDbcSCE+CnSBaSP9QxsFvmuZ6WNjyY88UTqXi5IV8=;
        fh=npFu/7G2UI5IOKPDV46YC011tmmgoHfUOctrlNyZCNE=;
        b=jxbwx8CbLAIy4nxQKaDv+CMI9Do2hyUa4Bxl4AG4IgoUmQHx76RE9EoyC0AtD6VDid
         mS+89rUg/SzHXSnn75rKBCIPYlQjeXw7WWbTD/4jp3/TgoRVVL8s3HZzkVVG8vNLj2qt
         igPSsq8Vcym7WOT0jRAPk+XjO/BW1BcvqWuT3BqNXRXX48wfSrJguzG//ki4Hen0ZSDr
         aT8cg/PO1+csP2exlIvAXo5LShYIWmG3m/zUJfegzTOL4YGt3+OGxAEMVv2Ein/Z0NOL
         gMYgjJIea32MEPTGBaEQhK2AsRFzi4IHrEAMFVTzBK5xxeQUYkVljiUA8LrJrvNo8dkZ
         xLCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773137017; x=1773741817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0rDbcSCE+CnSBaSP9QxsFvmuZ6WNjyY88UTqXi5IV8=;
        b=Eou7PfJPR+jgT3Rqo4w+xm9A3EcYQE4WgtcsruoVbMjEESQwBGvD4r4IMggos6EWP6
         dbeQ8LWIHPte09Mv67idRVfPxZZIx0UEMo7KVavqmOJPt/gUy0BJ/w0Q3N6wsfNmNsKw
         XRKhaVIcA5VOgGDKhOPLai/F04khRX9d57EvkXTpuJmhguWpcBWCNR3ppUmKK0nueAao
         u48hQxzafUGDv5vhdGfnZXb3/sYLEKy5yw1Ex6wmHlERviJHEtN8RaKuhmNymaP5TV+Z
         l8s2o7pCEa+mwGHlO7wK6ffBzgFPJbZGKIftL7O1H3X3Ff5YXRfTAQ217eeJKallrKvE
         xVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137017; x=1773741817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/0rDbcSCE+CnSBaSP9QxsFvmuZ6WNjyY88UTqXi5IV8=;
        b=LqqQLqujUugvLs4NuPP3DdjU/yCca8fD/PcE36lPE90n3slx8e15/f9/0i8tA74xgN
         DGSRuqeC/QQ4gAMsvA06WyF3pKhIR74aLzTtNnemwTUMXWJROwVYI2Kvxl+32TAghihz
         lVl9/Lh2922dSJqiMIEUyve5Uxi5fOPTDu9CGSB7VppwpUIjRZ3E4FP5hR1NdCts2wxk
         y/6fr58/su/x2YP71Ul5+ayk9DqDx3US4XFXAXlzJRMbjKmmuHr44N2r62CbLubCjWdF
         ohhGXtdCvir/KRoYYRY6u5xnwjwJ0po45UnNhlNbY4SUwD1upT4bzKC5Nrw5RwwRrREf
         +A3w==
X-Gm-Message-State: AOJu0YyclHvoWmodQ/F+vyhXDCXZ2manUdF/lL5uHpXfcpKc9yn8BmeU
	ajp2GG61NoHRzkOYvQb51Fg31UMGFBiMsAnyhk2qo6DuTR10IR6ZGUgBCYn99UbkT4hMR6MhNCx
	qHwef80lOYbMAgq23DUmoTlVAPeOGUZM=
X-Gm-Gg: ATEYQzzAFcbHcfCd5BeVbrpUPIVfOGN5XFxZu4TNEsqRY8U/GujUWTs9J40NO1cmZwa
	AVkopmiiGIGGzTeUchLC14VVQ4FWd3spAp+mav9w5gg6R75uaIT96BmD5izRYKybuOQla/w51qr
	Cge2u4wFSH5Mk8EPTmrhc0aVWT/Gp2L4hMOKMDqw67ipNnc0QacplaQolBgqH7p+uF0BBpRJ62/
	m4s53vvOodaeADo28mpE5nYAC4CeIxTqcexRURDag2Q4MqPE27B3WBLW76AAhCO4itckbVF+45r
	UrTYJ8AA3wTA2dtc2NVnF+zbnoASKX60GpV0ub8K/7nFqKnQPAYjZ7HYhYklWtLxcigqDciir7m
	0xHfTaFuNt9HjJmipBBe+lJw=
X-Received: by 2002:a05:7301:4188:b0:2b7:ff3a:af82 with SMTP id
 5a478bee46e88-2be4dfeb1fbmr2943312eec.1.1773137017467; Tue, 10 Mar 2026
 03:03:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310095710.1166-1-albabhasan276@gmail.com>
In-Reply-To: <20260310095710.1166-1-albabhasan276@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 11:03:25 +0100
X-Gm-Features: AaiRm51RU5DBerQbL1om2O-oUuW9v8xhCdJuB70ZppAP8lLiADYAwRckp27K49A
Message-ID: <CANiq72kO1jmF=4PZY=v6f=ckBOeQLBAmwBcjZcu8ht9suxQfKA@mail.gmail.com>
Subject: Re: [PATCH] rust: transmute: use split_at_checked() and split_at_mut_checked()
To: Albab Hasan <albabhasan276@gmail.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, acourbot@nvidia.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 10:57=E2=80=AFAM Albab Hasan <albabhasan276@gmail.c=
om> wrote:
>
> These methods were stabilized in Rust 1.80.0, which is the current
> minimum supported Rust version for the kernel.

No, it is not 1.80.0, but 1.78.0 -- please check
`Documentation/process/changes.rst`.

We can still use them, since they were added in 1.77 from a quick
look, though, but the feature would need to be enabled.

We will soon bump the minimum this cycle (but it will not be 1.80 but
1.85), so we could alternatively just put the patch on top instead of
enabling the feature.

Thanks!

Cheers,
Miguel
