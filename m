Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B46E34E746
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 16:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788630; cv=pass; b=T1/XQAoFDcQgDyQdj1DH0nlgvlFLLVDMF4R2jIvHpvRp7J+ySd+tkDB9HDHdrtdHqcsciTZfnRY7Lv/+W/JT5Jm2mdMpeNu+Xdh/uonZUDh1soA24+KXtZT/gViUczu+mwPEA65BRUn5btj0qVg1ifHIHzo8tt+r2qRRQ57wfnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788630; c=relaxed/simple;
	bh=ZzeujSdsWCVVN1DdUwSWJZ7PCK8VF1sapEwykIQLEYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RO3Z/b6ip1y/czFswcbjvNb+y/YHV+ppPkZS29Gv8SSuOX2CbQcGlOGB9iYIef8O3rmklR/LFTto3d6IC1hpuTbLt/zYlJwq3eUpZ3R746mt3tpVIdARw/RWBz9+IUonZzO1c3vh3GpT6TqzjtDJjAcabGQbmDNd/le3DK1kBKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUePJ2zs; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUePJ2zs"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a41a9a97d3so624387e87.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 09:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776788627; cv=none;
        d=google.com; s=arc-20240605;
        b=UsVuGRpjxnji64DLD69rPdx93nM/hSiyot7tzjZp68b+t4pAF18fAAog4fWEQctz0k
         ZEK1FW1KY3P1jmdMQLp6op0W70pNzV1wDWvE6xeyYKRz5sav8XJvT8AflQwqAypVWp45
         dmxi+PdXlZQ0abw7aixrs3r/4fn+zkul3/DEeLUdZ9LyMBVKXQW/IksjILSPU1jh7xrH
         /y1JkAy7pKSrydDem/bSbBPBjaGTd5gxKqkasuyPw4yviXj35xkfoYvChollzITjRGp8
         n9g6c06BdPvy81zpuwa151652Jt4B1P3JjQ6FzJ2/dvWDOiHELdqLko/1PgNxcm6FT8G
         KLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pII6GNgKNm5ogHzia8R6tYvSqBbEHUePaPOz7cJsyX0=;
        fh=+AkoMlACZ2718n5SQ3d9xycV0xvuLBdziZb4VUthGEI=;
        b=LEUOntWjY/iiacJda0yL3QzpRKPiirStruFzSUmtcXpCsFxoSOalg8dpKhkXkt3Hxo
         pfPkUKtfii92hoOIrEArg1uznFt4YHChIdrVujtryuQv5cusxXUE8ofMVJYHRvszF1d7
         j1pSUUDzRkfD5pBFr2A5uBBLxbkNAJq7unqIl4O1NOn9ZKd2O6x0tWnR/InJNNMg+3J0
         fuyMOiUbVJTpuy8cAYzhGOZVX125A+pVCOir6OavUNy45sxU8ayWVQn7W1FsiSIpmfCC
         SPEayf49xeAJ/Ty7DZkx35hjMSEEeMO2O8y7nOE3kbkJ0ngAzdamSPeHzmNwYFtlVSHk
         n6wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776788627; x=1777393427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pII6GNgKNm5ogHzia8R6tYvSqBbEHUePaPOz7cJsyX0=;
        b=TUePJ2zscwZ2ZYdkPa+/Samwj6znpZnMq7yYW8JC5Othbn8QprJvyVS2pBqyiNA6l5
         tNYhm6ksvTdlftIv1SLm0IkUDDOkffIOQ+tcGL32FUJ34Q5tKx2K43Vj8rRWUljsuVJR
         QO5nbWw3Z+xXO8yiUJWCbH153DkQcdOQgYbECCDsmzNddb2N4uTzd+3/mQCIVEeZVtYa
         aNQSAjoYB7pptmTjez6GvGvHZB74stKKQR7cWfypCpyrExn7VMgTvJtx9xziif1GpL44
         HylSIii3u7chsrVyRbgmTT+8/FhZOQXEpkzHUh5lCeqUyW1iIQVhsbShu8+1sTJhpcSQ
         5MJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776788627; x=1777393427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pII6GNgKNm5ogHzia8R6tYvSqBbEHUePaPOz7cJsyX0=;
        b=mcJF0mxJezGgqh0xrOy+9apMrscULUX1a+Vqqx6vd3sUS6HKxT0K77lf9BlmOF1zoJ
         HjiuB7QaIGHIO9QwUUvCx7lmjunz4yjf4wVpqQVoZWW3tPND8vG5gABEa8R5/GtBWNl6
         DrTkmMeppdkicwJ0ThswKhPpOt8Z/BSudk1YccIyZ8RDRDU5FsHi82u9tNQoJBF5NszR
         8uxx1P3iAjIBxG5vMXE0LTMTAQWdGGeo8nvTS3POoX3V57Qc0auCs4nyrFPQiQEwjJzu
         yGPtYxJyMRTC/7pSwQaUl0MEB48mq2rTL6wC7nC/8oI3CPVPii9XSO2VwutrrDtFbaTu
         7d9A==
X-Forwarded-Encrypted: i=1; AFNElJ8W5iZCYOC8UMqbZOhpTABGlPk52sYeFK6VymDO2Rto1Tr5PI7C85FfePT8eecJYIxP538UCMSIykqXm5gQjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJsti6XqLbR7G9dCLOWeAQH22x+QlW/VMF8EN9NTfdov6akHVK
	oAmczHFhB18oXVG/cWhfFWmvTofkbWFeyI4EBQtpJcZQqVZmIQZnsxicRluHKUk206dKInH9jER
	JRGkkYRSKIxbpf8BP5KKK9vwQcsNVkQM=
X-Gm-Gg: AeBDietK2zCvfiuWFFpkLwELfU8tz38iqi+Eum5+06h+ZYtN7rr78YNQZEszMvKaV+/
	xaALN8BHwxgjjUDcvazM/GfZKvxqaZ4KVbZejHhtJEYfhG+iLroto/+xIuXiLnnbiiz8/g2j2G2
	dLUUu2IovXAiJqxwzjatIsVHn1VlLJBHLWtCdxJ4D/gvmpx67bwKRqIAv8QldysbeWluvb/Cnqq
	uSo7Dgei0trkSWMROrs2tHwtn+9vhZeprCXRkCSmwyw45C9wU/TcxeAqOL2+wWDGt6n/q/hoXHI
	RIhtQOdthG8WLG2bPChfITSqI+c2WDW0PK/ivPNqGzHyj06a/QpmC7l+FkNEtrQWjTQ3k0KCpvD
	xnrkMsWiMDol9PaloE6wN1jl5PCFXfnUQKQ==
X-Received: by 2002:a05:6512:3d9e:b0:5a2:a82a:178 with SMTP id
 2adb3069b0e04-5a4172d168emr2957766e87.1.1776788627152; Tue, 21 Apr 2026
 09:23:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419151327.26306-1-muchamadcoirulanwar@gmail.com>
 <20260420193320.22df4979@jic23-huawei> <CANiq72kKkRW7vwYKi38dvsM4HCtKGwzOF4ujMS-X=peGb_Vi3Q@mail.gmail.com>
 <CAO26r3TqeLOF0mEgrsZszNU2TnGv6++OtSzEWtcSgXj-OvpTfQ@mail.gmail.com>
In-Reply-To: <CAO26r3TqeLOF0mEgrsZszNU2TnGv6++OtSzEWtcSgXj-OvpTfQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Apr 2026 18:23:27 +0200
X-Gm-Features: AQROBzCXtxVgJu0Q6UlV7AensaVDHs_G0UffM6H2cCriWMOkuLQvzbOnutpb47A
Message-ID: <CANiq72=z6DxC=uJaPbS-AFd3hcB6T4dSxjH-NcexN8a41kix9Q@mail.gmail.com>
Subject: Re: [RFC PATCH] [RFC PATCH] iio: position: rust: add initial AS5600 driver
To: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Miguel Ojeda <ojeda@kernel.org>, 
	Frank Zago <frank@zago.net>, linux-iio@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 5:38=E2=80=AFPM Muchamad Coirul Anwar
<muchamadcoirulanwar@gmail.com> wrote:
>
> Thanks for the pointer, Miguel. I will update the constants to use
> `kernel::bits` in the next iteration so they map cleanly to the
> datasheet.

You're welcome! By the way, eventually I2C etc. may also want to
consider a more convenient way of matching a datasheet / defining a
register map, like we do with `register!` for MMIO and PCI config
space:

  https://rust.docs.kernel.org/next/kernel/io/register/

Cheers,
Miguel
