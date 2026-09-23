Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D334443AB0
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 08:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151054; cv=pass; b=XzL2Ok5lm0FzUJw9YjUBNNeIkXxEVALbNgBlsm+z83u9B+ScuUqzP7+H3zxTvFhX70V9JYR47+NZCndJ/wFql/3IkMuktm0paySjG0SKOi4m1XloPCAETbTJP90SViF54o8BGb/IBIqAUK40/0UNeQqZEhZskXtd/gwLNfPZGCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151054; c=relaxed/simple;
	bh=52slL8Hr8rgjB8Ot10IDBs/l6D+Y4XBWl6hOA13KGyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oH3Nvkf6EUcYzhI0Sf/hcXP03mK8AUiVs0jjYqelS71w9bzvUz1HrBrLBIzn9BV/V96K1zBRzqpjJYhSgmg67Q3KU4yd5lRx2K8izDbP8NEHehF8KZJz1e03FkelAE22SRRCfZJUT68J6aMX3z+sbj1qoiRIidbmLSg00BquR7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wY/o/MUz; arc=pass smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wY/o/MUz"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-482f6351831so407014f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 01:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790151051; cv=none;
        d=google.com; s=arc-20260327;
        b=exifab6xXtT/1WXkZXqWYx4kqydh6L5V5uM2xgxGMx76XaXx2lZTE5YqlawH2k7y4h
         /im8ux8S8xC7SM63/AGJXdjLIC8Kbiz5+AS047PY950bxbKtryxcBf2k+BOCcY0yqD/v
         jIc/bw0u3RmBMWhe0Cufof5OMb7n74wnn3cmjXtk/d2eKjjBI3TAqQL4TcoA1NAKk4B0
         y+E6BVS/5uTfyUAzLyuLCdqp2n+XoEHpoKceW+u9SNcAOeuc66kG6zxh6dVa2nfb4b2m
         m7Lb8TsvXu8Jlaqvl2W8wHvtgVSBOs0FAryCHhLCX5N+LBXxzMIHTw9R7da9Mkob5TeS
         QbmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=52slL8Hr8rgjB8Ot10IDBs/l6D+Y4XBWl6hOA13KGyw=;
        fh=SRNTwAmRedmFoC9TzTKjzecvPM0Y4uaSiQstedg1EZQ=;
        b=ZlExMiGLaaN4ejx+LFe/UUOa8yDH4UFRjjeX5QWQrPOOEnAP2arwIGF0Y0pc+uuKwu
         UWaD6AiQPL4meZOOCuRkyfZFXAimr+STZ5A+ZUmHxgfGhU7xVB5szaU6JjwLYR4Vsh2u
         rBSHWDFXztoBK40/LQGFDvPKLyA99byLjU/s3DkoZc2bhju+Cggz+IVHtlWgkGDWCpMZ
         PUZf4Kfc1bRuNdPTSIkovJmqgdZ32+isOeUzmuonzZVbd1Pd8YDGaxz4AjNG5n+zNQC8
         O7osNtx7+d2BVDq9sWJOipyCAiJwamQMjSzUxhBcLSfjKFI8+nGkeMPzJztDmELOoHSM
         Qckg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790151051; x=1790755851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=52slL8Hr8rgjB8Ot10IDBs/l6D+Y4XBWl6hOA13KGyw=;
        b=wY/o/MUzRro1mx8juemsMVZ1BEL6U+icyGCjN7xSMOm54HlxJNGNa+TOAIrk87sCoI
         ViczLvNuFplCnJ4vDl8S+Xw/MakDAAjiLsJlNB/ds6WVVzovL7YDWZrgqSRamgT0PkuQ
         f0nVFq4dNaePhkh+bKHrv9QftOEtNdCSHny6BvyAZAF4NC8aQCjdqNM+P6TmU9kJMneI
         IvzNI7ZJI/JZ99IE6Kj7O81/GL6WDkNoiOJOlzwZ4xx6uyQEkjlc4j31UyJti3fi4DRm
         rN2j3FbvjXSLABu6hAm5vEnRhOsym89SMTyuX860Jc1Ivn+YSOxfFTttDCOS9bYLCAJb
         1PjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151051; x=1790755851;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52slL8Hr8rgjB8Ot10IDBs/l6D+Y4XBWl6hOA13KGyw=;
        b=RMmOr0kpS3ct9u3W5sYk69B3M059JP/mTgY3TPOf56djDy0yFcWo58bAWTkJKpnt1f
         Ee7OmDna3V3lGGKR40x6m2aUgZ/4xvwd92VT1UjcB4nDGilfYQAUup2aDeTSkzBccaV9
         7NgwxX7vFjnvIT+bhqHScitZY1bsmgLTeGG/pJMMv4+E7VK0ZKxwfP2U24HuCnLxJz2J
         sVDC6ULeHDBjrR+DB0PXxq1ggIgL44rSQ4tKls43q9j2mEk5VzPgdJO3xkv+cxD6Jvr9
         GQW5bq3ownh1xah3ukQrGVeTrEEe9Zf2M99+UB1Qk3hwdYOZrbAHRjvzIuGhbt8angNW
         vKAA==
X-Forwarded-Encrypted: i=1; AKwUvBxtNaTdZe42IV6adiB55Qt90B7kKIBl5vgcFsa7X0BkHwR6fQ5J7JC5Jsqup9Xco/DxpADJSl3b92zZ34o97Q==@vger.kernel.org
X-Gm-Message-State: AFuF++l+PYrDcp19lVwueA80jVFSFk+5f8rT5GtPuSZuxHRWp7hlICgz
	He0WJPZRNFisK2VCwZwR4LqM6vQlAcVYXU+ifK3cmx5YCrNb9yCV0tdSSsdrw12BYcElcFs/S8M
	+pbk/RXA7mPni8qvLYKbewWN4tZIGS7LsGcAGMVNG
X-Gm-Gg: AYBFou2/goCfLBC8dVnaO6Y7XXoNkcmygA365SIgKTZnLaaUVU6yXGdJQJZ1H0FLKT5
	MSKBffUIiCQN0kgv62A0TjstiX4CPjq3mtdn1Z/BdZjxSa1tgZ5LaY9dEzhNGv7WK5HoGZ85nsV
	VVhPAcv/sLi4j6w1mq2WhJplQWok67bkyWXYIWlnZez4rH5mejTlgCGrhlmD9s4Xus9WrjT+b5b
	bMBOnAU6Zp02gnrAx1AKQxiwrDXRJ7/Z8UcuDCLkEH1uCUtco2LQmimdaVnH1pV0qPAYcblw0y1
	cc6pjFVgEPMDMiq7QGNsFDX3fOIp/VUwG++xAIatjW23210sJuECmUNpCAsat9dx0hN2kxWtB6H
	m7CWMC8HyaBdhFn3V/riaqKXl4zbrvi/cm/YdndxZww==
X-Received: by 2002:a05:6000:26d0:b0:487:360:4fd1 with SMTP id
 ffacd0b85a97d-48867060af3mr3013286f8f.5.1790151050299; Wed, 23 Sep 2026
 01:10:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-b4-add-list-for-tyr-v1-1-cd74ff2c1f8a@collabora.com>
In-Reply-To: <20260910-b4-add-list-for-tyr-v1-1-cd74ff2c1f8a@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 23 Sep 2026 10:10:38 +0200
X-Gm-Features: AclHuK83N6NgEdKtHsRmRTgf29F0Bv9EGKeqa04ZEKo4C3bnWfWqYur52dyGeok
Message-ID: <CAH5fLgjerphsjv75W-dS+GOg+XgX15KchR1oFv3wCS-23MLreg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add rust-for-linux list for Tyr
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 1:20=E2=80=AFAM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> Tyr is a Rust DRM driver and Tyr patches are reviewed on the
> rust-for-linux mailing list. Add the list to the Tyr MAINTAINERS entry so
> that scripts/get_maintainer.pl and b4 prep --auto-to-cc include it.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Merged into drm-rust-next. Thanks!
