Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740F01FF1AE
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Feb 2026 14:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770043276; cv=pass; b=ltOhh4+mqlu9gJNe24GIdTwuR0QbcqaINdshO4kb8T6ka+JlwhvKKYtB2fI2aZgRnj75Fo7phzz3k0zKYpZeTEx+Wh7T7EFvz3PuCKlbAsIHZUO8wKcIwer/SxBFXuqQhyv0RVejGMqvzLrUps07HSA9czHezqmuncUuIl8gzc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770043276; c=relaxed/simple;
	bh=Q2gaInrTgpHIlj423WAjEztfWo3z2rN9vcVTa8x6Ls4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sw+GhBkF8gvO+S8hCIOyQElQskX+xhzUPe6Q9ruUvbvirxElE8+fdelgIDhw0YIHxYKGa6qVChud/Zmsnpm0GqdaMnNXUQjw62XwQynSAhhccSt7cULAT8g2u7GskBLC3mW4PZGx6FsPfZYcdepAJ+R3u2k8Xr5Fba1jOhoIx9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LozbpQd0; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LozbpQd0"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b807f85e10so107012eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Feb 2026 06:41:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770043275; cv=none;
        d=google.com; s=arc-20240605;
        b=BeyN03PY5lokZzVwviWisYtMm6fnFY8zwlmcm+iE6Wrjcuweuk83LhVup8EjTebOLZ
         CDqY2HJl46M9/25zQn21XL+n6Za9bTGCiq7RWnSoNvtB2zdrmpjGjVKHWEfS4Xa/C2+e
         2niFtCv/4V3uVi5Hz2uNkWlCBe1cWfxYzFMC4BhrfIJeuE9bRxdC7+pLpZNvQikTTz2N
         cK5iS+DmfSwCKYfHLDq5BnKsBLq3wtat49+bDchVOOQPGbeznWjgTN6WjgwXsqxirrm/
         UJNhpCAX6ZbM8nw1JuhiUAZPFrPiKemEKOT/6AqXdnx+lmeOHmcI61jcOjiCzv4B3ga/
         5Qbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q2gaInrTgpHIlj423WAjEztfWo3z2rN9vcVTa8x6Ls4=;
        fh=EwIFV/HgjcqDEwYbGv01kyniIGojJZ68Q0W367Q+v4g=;
        b=N6qE2BE30TbaIRlQC26XBHkqiOkqfoVOk43CDEo4kKRmr/eJrfW+RLdfxYEqEIUREB
         pKRWc/gHnPgBAvD8CtCsQS7KELCWOLlVrgpfqDhYfXhTNJ0MYXxFX5RfmR/Wi+BOPeqT
         OWa0X5s63c8A0o1BVB/TaZj9zmj7RRrw+OgCRJnUaAuhQ4msVnXf7HHkfPB/iuncAMFH
         15WUpz+t3czBOGTCVVKmofSrWVwgy5omV6AItd02/qMRs1Fjr79C8FJ7rws8DtTUPkuB
         +Fxxu349+4XohGvf6nh4RgcNYwzphomp4k4jlLt72Ob0Nm9H3wjXmGB6GHIEiRuoa9XG
         syQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770043275; x=1770648075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2gaInrTgpHIlj423WAjEztfWo3z2rN9vcVTa8x6Ls4=;
        b=LozbpQd0uJFsu5+ugaNAjkMjzM7H+3poa0Da3ukfBnZXtpidXXoSF/BRv65O3lGIIV
         U+ZirkEV2UMQcLgI9EV83Wckd+Jh/VfK6fWsRAucHluYKZXkTSguJOWn5iUO04PDPyKo
         VPDToNbml1LLzPE+/kUJNhOT13d0Szz7iI/pgsNypvmIDb9ogYUzyvpgihMS3rkLRcP5
         86dHvq6cW/G1NSWav5w0ZO+mqE6fV51p2OHAgXCNcrsgdA61BBW6aUrYG/1M/BmUGkAN
         ZLScrmeiwA9WZRgvyIt7xx76uR6bZHlGFzYLhnwpHgXVRd54VpNlDcZd5inMWw6RcZWy
         UUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770043275; x=1770648075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q2gaInrTgpHIlj423WAjEztfWo3z2rN9vcVTa8x6Ls4=;
        b=iHEw7gp+lg30+sLu0XKqF7pUGH5O5jLnBTob5WoUrvr+MBOWCIphxsOwCoCQxL+Ush
         nK2mzYA1NdkSwpf82O8Ko3wncZDfGU+ZouqdiFTf0tDoBWGxklyoGI/7m7/H7Z6rUbN9
         wxDPnYrlHT95+F6/45xmEqakIloJ9G60lXYCLBaAx4aBxi56Y8aRs4vDk3qjFr/mDGJl
         bLyu4NOGdmOksdaYVsg6sphqahDgrg7/mDrimucWBKCI+GQSbt/bsRWtrhed+icjz6ee
         /dpUbtF8VKlyA0jrcGzd/cNyWxJadS5hU8acn6lRTyxInZAYf9rqcED5vZC7y4azNijE
         QzkA==
X-Forwarded-Encrypted: i=1; AJvYcCXZCkWugK8HhqrJ68Ul0eWZOucCK8BlqplRGORxdPN1417pirkGkHiYqKQ+1xuUfmgVzAm65wlJYCRtWEdkIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGrx+PfdRnjV6qSyYBlsInk1t9RXHoS3lbLAr9AInutFJumgg5
	Fm6if7XwTAtoAVwMbIyFzfxKaxKPEZQRN/nLqcHs613qMhvsF0LKsvdHsIXtiWIdroSfHpUdnIP
	6/JUT5IBX6OIJTOQKzfFd2HQZDzFM2dk=
X-Gm-Gg: AZuq6aJOLdGeHr6jcVGzq/3260CmtpZnQr5xc+FLSstbkY00MKgMFIhmYFCzAwQl7w7
	OXhp4DPRI/F3ecYGT39fnNpHVOi4qVQpN+QBRCFQfPVpZxa1vLBdppaPS8Mg89aI08Wv0v1fQ4A
	GIOUlOtNI/nfy8paZSWtEVDkFK9SS9o3A01lfMpJvEI+YyGXpIMMKymK5Q4PpaFqXXBdEQC2LBx
	SbJu4QsSJCJkveDSlRSavTLLYXcFujq8nGczQGBEzbx0ejyE3qC5fuo7dqRSgJwqEvAl3gL0MUC
	MqSSVU3ZdO82ZigYYyn9CGG9tsDv4fO3AdpkPP0tHe/ADQLEoYEkjs4NMqifTLpehYj8uDG+4rd
	1xeIo7FIHOaB4
X-Received: by 2002:a05:693c:2287:b0:2ae:5b8c:324a with SMTP id
 5a478bee46e88-2b7c86dba33mr2805059eec.4.1770043274410; Mon, 02 Feb 2026
 06:41:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72kFFFB6k8D9TeSe2hFG3e6AhCqWTMVJXkKyLc8F=TFhbg@mail.gmail.com>
 <20260202233900.2699668-1-mlksvender@gmail.com>
In-Reply-To: <20260202233900.2699668-1-mlksvender@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Feb 2026 15:41:01 +0100
X-Gm-Features: AZwV_QgGrTYFbEQVrJilAjje-UKVsTP3cEkZnz2l6lEnBeYzW7QRnl4jNfyoz1Y
Message-ID: <CANiq72nEWO+L6P6oSPCE7X6BzfG26rUNd80pYF8-rPTgWGqbVQ@mail.gmail.com>
Subject: Re: [PATCH] rust: Makefile: apply fixed-x18 workaround only on arm64
To: HeeSu Kim <mlksvender@gmail.com>
Cc: ojeda@kernel.org, charmitro@posteo.net, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 3:39=E2=80=AFPM HeeSu Kim <mlksvender@gmail.com> wro=
te:
>
> On Tue, Feb 03, 2026, Miguel Ojeda wrote:
> > Could you please elaborate on the issues you are seeing, e.g. how to
> > reproduce them?
> >
> > The flag is only used to silence errors from checks that were added to
> > `rustc` and it is ignored otherwise (that is why the workaround was
> > written like that).
>
> After reviewing my build logs, I found that the error I encountered was
> "unknown codegen option: -Cunsafe-allow-abi-mismatch" because I was
> using rustc 1.85 at the time. The flag was added in rustc 1.88.
>
> So this was not an architecture-specific issue. I apologize for the
> confusion and would like to withdraw this patch.

Thanks for reporting and double-checking, and no worries, it happens! :)

Cheers,
Miguel
