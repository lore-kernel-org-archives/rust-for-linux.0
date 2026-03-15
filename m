Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60B235F609
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 21:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773609770; cv=pass; b=h0e9sT6hS3xjAx3tEjsizTbxjAEt1mDs7Q3QJuk8McteKdBsY059Ch2nwfDmoj7Q0nG2TMYPmpF4TJq8VYfa10TZwDkOVowWoVDcQmwYGb1zeuZcZ6rLSu8KZO8nIRLufoM+X3hPD2DbPFXzzoyYnYYteJ7vQQsNbpBVcb+aJ+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773609770; c=relaxed/simple;
	bh=kSDFhyU3+XacTSQQkN7fKJ39pcLSb9VyjW1OzdgSjVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEo19JC5mU5n1+Bh0xAuz9wNWFYqNoEu2tv+5x5IEhCgm2kKAs9bJWKRvO0OSFsymP8PgfDfdBT7FAqzB+0nZCi4Owjkly6W8Sg47vPziJR08i1+6MBmVKRu0tSMB6xnRKjX91gT7+UFe22GmIxk061em9JdWCREq+GtyyR8noc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/huJ/Ki; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/huJ/Ki"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-128eb45835cso124385c88.1
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 14:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773609769; cv=none;
        d=google.com; s=arc-20240605;
        b=M1fdkwEsajPo+qRz+LjaccbaIe5f6K/zet045x34ofAeUNlaRv7j0tC+wIk4E0/vZy
         1R536x0N+k4EoS/oNGBE2Qa+3E3lx9EqqgHyN8EdE2GjO32DZljmB71Gb+T/ptrwg2GL
         7S7w3C5bpJFHlS94xoaaI0Q0NvHBLCOARBfIpKlzpeTl4gaRCijX2ZSa/Jg4iwPT5k78
         6YtAFVfz6l7b9FjLnlOFKlXRtOYNjCB0SAwIeqhAhFZrVWT/j2GVSDRkd3qEOHsBG7+d
         wJ7pj2uAFLvMTufxWeg/9TNREpKaimh7K2RN0p5GXY1Q5QTgZ77TxOZ03NdHERV5JDu0
         3z7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kSDFhyU3+XacTSQQkN7fKJ39pcLSb9VyjW1OzdgSjVA=;
        fh=3Kcj136jJEhOmLokX5HwdCXE8O2/7TGUF5w0ZpZdAfc=;
        b=YKxi+mh4rXhxTiwkkSfD7FA8KwVjIqv93v1KCy/MLnKkkF8eQb7KXAKQXEz3xsaqsh
         hqOVymQ+k64LFnAQDZHHl7E0L+1x2Tf8DwMMdt1T9GtMa70uJnoVRCu9tQaTrq2wouKi
         uKdxtvkbo+tbAbD5ibeUT+knG+sSc3643LP1H6aZknzIWgnTJk2M8UamViMlNduPxkvD
         zeC4lp7gwy7X7c5ziY1AmacRruLoQ+5jZdLkN74MD6/TWJ7aI0SRm7xDifqQQe71HdWI
         dC/7rsJJv6hsJZxuui2zQBZX1Xr13PkpANJJE7QFaGS5qQZPcM3+untiskgFB6DM/xnX
         9/EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773609769; x=1774214569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSDFhyU3+XacTSQQkN7fKJ39pcLSb9VyjW1OzdgSjVA=;
        b=Q/huJ/KiOdJ751cjDDRy7U6TBUcfFqoBVzQpVRCCwX2fKry2+8A1EOONg5aKulI5WM
         GYocyUvbeu2yuyWNDN4Kmk7ts7/jmoVAUguIfQbw3TDA7LRTpXiTeR02Lhw2o1pa5NB/
         obWigZu6J03oQHKyxLbaGai80z9ve3qYfcXwkIxwc2eVLCUCbGw6Qjrcd+KBNLkiu+oE
         lyLay7NJMQY3685dqNkc7xZ96ZB6Jpdj3nRaW9ts9tpLozVA321sEXi+nyzveTea45bP
         htL4uUZKhgScwijjIwLu6hTO9N6z5U54iWw3KXJLutIZ3WH/FpzTPiSGTGsnzCLM218X
         ks2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773609769; x=1774214569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kSDFhyU3+XacTSQQkN7fKJ39pcLSb9VyjW1OzdgSjVA=;
        b=hHr8ucWwLQhNBmxinNDBFv4bxoAOkeZgxqk5nIMXMBXLuM2mIl9d9xcss/T/bsiQaT
         Ync7XRnmHtYD3d2TPmCgcKp3T4elq0nNLKsAu2buo/HwY11Vd1sKPkwDDsaQ2tuKHt16
         lYKgzc2UOT6/4pNa9GUQSTTMvbY9ISjxUFJqzDcPJkVzs5uxQuQBQLnvIT5sYur0uD/j
         oghKWsVlgeXG5YQgmVOL0FQgxthQyRHK6Unewg/ktBpLxjKMz8oIZlIPYTQnHg1dkDvC
         iwctYs77YaH6RRVwarH89Nzmo6SySWoGufE9+OMZrCXxCVFwWf5weTwf0aoLtPKdGNgE
         G3Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWG4TLsQb3D7o2oI1Q8mQ2oSMcp9UVDUWGFihdsMADqvmEZEn9xew6EAIF8AkwAq+M1zFmEts6KQEJFngu5Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnSOH52q/0xwtL5cwKF/PI308GsmL20RFqOXt7b6C+zk9S6rpI
	YJz88Lyr+QKmkaJ1Let2FEOpMaZ0sBPfB4FRWOpF+MVC5mVtjls9P6yoLiK9svpocyoV4dATvtO
	bh868EjIqeBplq696plN84XeF33tcKj8=
X-Gm-Gg: ATEYQzwxefGkgiDq20CgM8BRfqyRcl2L/8NOp9Ra32WIzq0R+2jc1Yk6fJWDR/vBOmN
	NfGa965VARf63JN14vVc95aU24Q3HuXR/4N9y7oJFFbKfwdfT4EPv85YjpGPQxBTys8cdsq6XIz
	S3rq64AeqVbqo784YMtOx6akjGvhEyHidRQqKmlTOe2Ppl7tdAiIhGH/HhFCJofJpwTTFBwjMEN
	pVu8LXVB5iZ58MnnlxHjis99RYPCbngCbtZf1+u1Bj19F1APU+rNH8qYtbyq/fnspwv7GyY6E1H
	GPs0xWPGt++Ow/AsatTtdaJVutLahTMlz477pWBbUDs+Lnuj+ncVWrYqq4xe26JZ7h8h1X2LvAE
	8l3MKUEYNKmHvwpgdAzfPygE=
X-Received: by 2002:a05:7300:e887:b0:2b7:e929:856b with SMTP id
 5a478bee46e88-2bea5590920mr2510000eec.5.1773609768815; Sun, 15 Mar 2026
 14:22:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72mWdFU11GcCZRchzhy0Gi1QZShvZtyRkHV2O+WA2uTdVQ@mail.gmail.com>
 <20260307170929.153892-1-ojeda@kernel.org> <CANiq72=drAtf3y_DZ-2o4jb6Az9J3Yj4QYwWnbRui4sm4AJD3Q@mail.gmail.com>
In-Reply-To: <CANiq72=drAtf3y_DZ-2o4jb6Az9J3Yj4QYwWnbRui4sm4AJD3Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Mar 2026 22:22:36 +0100
X-Gm-Features: AaiRm52WZuU_9qvGI6K7_I3dVWa7hrbA1AfH9ApfWZiXnxNTtXGlv6pDXlVsoyg
Message-ID: <CANiq72kvxvTh1_8U+1aFCXRNxDY_HQUzkhzjoo+8vTrkCSWoNQ@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: kbuild: support global per-version flags
To: Miguel Ojeda <ojeda@kernel.org>
Cc: a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, gary@garyguo.net, jhubbard@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, lossin@kernel.org, 
	rafael@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	viresh.kumar@linaro.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 15, 2026 at 10:21=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> plus `clippy::double_parens` for 1.92.0).

I mean < 1.92.0.

Cheers,
Miguel
