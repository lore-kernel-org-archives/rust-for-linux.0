Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4416D35B143
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 19:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768332726; cv=none; b=m5Hxf4ZbKvRR2mMQyqQNTHGEr3MjyQgTwIxYqrL7WMmFibFX5PrVSBl2rn90tLvZeLaVqyihznTAjNidqYWI54BsUBioX9luVG8CCuEYNnWHHTVr54ui4rbo4kXpo4L9gUztxCTe80OwwFU1mvKHH8nPfIoW1I6h1yVd3ATqByM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768332726; c=relaxed/simple;
	bh=2EM/HXR8i6XoI6VJl6+fgNSFc2uahyunFLqLR7E0qUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bmA7Rhr6tuBO1Gj2aJjAW24BO8dqjaO5lvsRVdmReDW/RaHTLi4Er2O+uAjfyDUILyPEvUdB7JoCA4hjUNvwxLO1HyizqFhalKtyVeTyp4r6N1/cYKRoClnpUTqNirjR2vmowItSMbPRgvbASG+6DrD0DVlsQMRKOfHmSnZfgkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0g9Pg2qf; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0g9Pg2qf"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so64052605e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 11:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768332724; x=1768937524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EM/HXR8i6XoI6VJl6+fgNSFc2uahyunFLqLR7E0qUY=;
        b=0g9Pg2qfdIYsBzXcD0OYKhedFjnJl95XQo2HnoWbQnWOnAs0vCUS1mwbf33Tl5ydx9
         w78GuxAMWyNwUov8wIE2RExNNdzdJu7UIb1fII1bgVIQW9Ohw+sbzOB+YzGy8reAL9+V
         F77slwFRZxaEJmj6NbDYmNS1Au2UiIYaHxltCnBrHUQheBI/mzBpWmaqVtSl9oL4wJTn
         GyHspHrSbga/wbRK3XG3JsWzF/mlAo3Z152tGwomhdoAy85zvVoVcrjuHT51YHNfynBO
         oVg6SCfN7OJeQgG0kF3vCt6OKkL9q/V4OcqYyyqZm2QH8rCD2ExBIwfUyOdHIprWeY4T
         WbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768332724; x=1768937524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2EM/HXR8i6XoI6VJl6+fgNSFc2uahyunFLqLR7E0qUY=;
        b=pi1yPDgKeJRp1SiT28nse4E4hsjkkjHcpdIfeX7Cgm21oN60bNfXbuxUm/CzSQBy8/
         bDr9jdReG5VM88Tik3CbABTOU6Ht4xwtDwZth5Ep7GcnudkbLd3K6pEEzqdBPT8EOo10
         m0jaP5HgXaBsvu/uc+bLnKkZEwFGGUwm80biFUJgsT0u5SLet22iHp94Ew3HxqfeAL4l
         lfUOdJzbtJtzx548iO1OD97l+T2gyNNwDAnRptJGIGMrX73PZ4MZK+fH7JkjS78zppjI
         h9RfHsLcLUM8zDBZDvO7cJSpdzZLVZ3ZZhWWUYTYwJ4nXUUzVIC4Old+72KLK5AXwPq2
         QIbg==
X-Forwarded-Encrypted: i=1; AJvYcCUvSBMWrNzD/Z6dnyqO0QGSQtOP/TtIH0TS/NB2+eaGXErblj5bsvqbcR+KYGC6y7SQ+ZqHGLpcErrHc57RTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2qZ+2uj3f0t72/myGJ8xzNhGgaAWZJVmNHBpiWGmxECoX/qxP
	ZDLPeRZTYao0TlNWrbHbXglOMjBfiPnC56EJifrf2MNGEdTa9wVXLwt9pOFnbD+taMU5ZWMSqh5
	QRuEutrROemwBzTp5GLUsiYQB//1m+INWnPE1G1x0
X-Gm-Gg: AY/fxX5xkuDGd6FgT4nD7NdVqM6SKPPSvu5F0QiLnhsY9lnbtDww/rK4x4mTUmywjtD
	zebMyjrFv/doBirFHhM73sZLyspbSS57woT5lt8XMa6R0TgUdqyfUB/wkEtfUdBspMKHsiiBCEs
	l3/xHXsoczk7Cpa/NKK/4LJRJ6o3vdRpp2C7iFGy8nz5g2RAwOb9qPVnfQcbboGUcLfo9tuPKiN
	5sgFI4KxVJeOOIghf74whQ3sVrfbFP9kIf76hc/cvX/Kfg22RyQ1bW7eBV1vkBL8HyjckN1qvcV
	33HYQN6YD0GFLUP9IreCfxttPw==
X-Received: by 2002:a05:600c:1c15:b0:47d:3ead:7439 with SMTP id
 5b1f17b1804b1-47ee339e454mr2674375e9.37.1768332723438; Tue, 13 Jan 2026
 11:32:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113192949.689834-1-lorenzo.stoakes@oracle.com>
In-Reply-To: <20260113192949.689834-1-lorenzo.stoakes@oracle.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 13 Jan 2026 20:31:50 +0100
X-Gm-Features: AZwV_Qi7Bzjv-dKzq1Xb-JuRodbFd8y0k7GJp27_jv93nq2MEefd2rQApS7HzMY
Message-ID: <CAH5fLgg4_uZrFXy1maSUQ=0xE+tyzyWEV8Fyh1R_B0ww8N50Cg@mail.gmail.com>
Subject: Re: [PATCH] rust: fix typo in bindings
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Chris Mason <clm@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 8:30=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> Commit 2b6a3f061f11 ("mm: declare VMA flags by bit") added a number of
> overrides to the rust bindings helper as the change performed in the comm=
it
> caused the rust binder to not be able to automatically determine values o=
f
> VMA flags.
>
> However a typo was introduced leaving VM_MAYSHARE to be incorrectly
> interpreted as VM_MAYEXEC in rust code. This patch fixes the typo.
>
> Fixes: 2b6a3f061f11 ("mm: declare VMA flags by bit")
> Reported-by: Chris Mason <clm@meta.com>
> Closes: https://lore.kernel.org/all/20260113185142.254821-1-clm@meta.com/
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
