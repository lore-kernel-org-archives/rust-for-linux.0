Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C0D43E4A2
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 09:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784020768; cv=pass; b=ZJejZbJhBAH9BXDYTumLUdVlLQzCx6yW/CSXllOcrtXwGxs8Fa7GbJ8mZ2d667B7mk0TYF8hEb8hNbw4XOWVI/sb0dZChW9nVJuSCSZgRHzy0X+13daBBgtoyXw6pqVpJzADjqLO8DymURhQFIZTcSx1L7445EKhsrhKZqlVKnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784020768; c=relaxed/simple;
	bh=1+6OfoIbXmuIEVoIyX1bMPQc3AaQ9LY/ZItgZpQFXXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UgbFlSMXodqeiJBOoxBUpcQOD9H6r89xE93QYo4Tnyw38/BE/1FxEwIsFIx0NTWzkesT4arHX13JKSkK24wIrlLrktKsnnb7ZYEbPLEiahWtFzqTq99hVLH96P2YjNIUO1Y1wYV79jYztbGYCsDIjPWt82nHfLyedHwQWrEqNzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMDKrAY9; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMDKrAY9"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-384caf7b168so484803a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 02:19:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784020766; cv=none;
        d=google.com; s=arc-20260327;
        b=frEDkZqujBhUwcbznhanQDhmvh7K6uxdtFx8pZF1jQdWY2qgZavai/erL+Br/y26ps
         JLoNfUkU/LQslPdQ76S8qN8v/mjMawsLcVW7B+ME2/BkWhREKblC2vnbL+3gB2g/1yUo
         9X+AMPEerSmljQ4u2M64QZZACT12IxDlDtIQhcuqQOa4X1jkel3qcdV1YfP890Ff0wbU
         297TuU1b/+EL+XdHmG2YiWB6Fuw0PdxP5sp3K6BKOYlJZMTGqTSrb664ALrkyoNPKO2r
         JXO4X03wJ0HKkrz4xRO9kBAgDncNjZliq5nzQTifDzKCpMcXQweE8bm1hSgF9c25jiMt
         wFzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1+6OfoIbXmuIEVoIyX1bMPQc3AaQ9LY/ZItgZpQFXXc=;
        fh=eO9rRrxE/FQ035NdlTxtgGt7a64N3OebKLRmekKbPpA=;
        b=gopklQC16N+Y47AFORA5UHqVxgNet3nAPpw71+g9wgoRIrHytawNV01rTbe3ttjvcH
         JbgaJRs8LHVmmBXLyvxvVQiisAVD1oUh2Qd/8r3BjqCq7ffFkE2nxptVjrUXH/MUCx8f
         w7D9mt4tljUF+uOayanY7DKnQzl5W0zkCdQBg97yXkMqUMP9lVVcQ09ivWgL05qJpNYu
         bxNkLytJTRvtoTnIsISzvjhICcXJIuxAh1lV5auTd0dgxGk02ksRy4lPlES52ngpWnGl
         sTSQ4z2NEGqPYpkQTiwqRard7L7fO1+Xiy/YIqSzeYAL0ZVSGeIp1oEXypE52o/vdQ92
         FwoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784020766; x=1784625566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1+6OfoIbXmuIEVoIyX1bMPQc3AaQ9LY/ZItgZpQFXXc=;
        b=TMDKrAY9USx2GyQWgV48IQXQOMPhSoywVqYLHrJK0vFg8F4SluLxulW2Ic1qDCJGXN
         2+wSasQMStQrjT1KgoMQRIOXX3vCn42S9vS6p8rzI+yyMtWuhXpyT/5sP0AHkrF1F9+q
         h6icAzuqIMdWZimxjFRO1yL+Iyx1wervdi7gt1xMX39/bdr2JeHgdkhId0Odmvrs62/j
         /xplJ/SIr0pGLSgp4G0aQ8l2OCuqpVqf6fsz0Ilgt+3NeXtBzdhmiiXl22AsD+t9nysn
         mNFkWCoAo5o/keiTHYZZKGm566PAuPSvk6Ac+z8u0jynsO7oXTBJUa3x51UFNu5r753i
         pBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784020766; x=1784625566;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+6OfoIbXmuIEVoIyX1bMPQc3AaQ9LY/ZItgZpQFXXc=;
        b=XMRrfj0UPN8yGFMQ+md3HqJH0yLJ6YUgIKRkKGWABngGS/BSTwQ/zP08iqJKj6blUX
         sDbq3cRZ9Vf2raBEts1idZZvE96U3Qt+t6jLCcORd3P9G5BvAZyzr7iv152KgMA/Rbk6
         EAdMRDrniE/eEZXyhFb08v4rUEYagKji0KbCP23ws69iITUw5l4PMWJIaGLaG2d/Mrd6
         a5mM2V2M6K3Y/cIn12r7wluRQvwK6vuxckQ1gp/7KRLiOivCx6May6lHpvpolow6byNV
         8f6ak1e4ph8UEZW/oHeabCB6tN81ZTMu9/W2Ls/kefzE8ZXM+aJlM1uPRTvOk2JJ4WFk
         PCyg==
X-Forwarded-Encrypted: i=1; AHgh+RpibPPS23Kpa584AFYpEx2LLLQ9b7Yp/zK5kvHgCgM5S27hqzEkvJ39+K1/s1r66HS6C3LsL2dqZioYcZSQPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDldPR5yq3xZPmNAR3w6TqpPvf/9AKiU/h8NxZupoOu+PJMM4g
	Qvl5zvHufa7fjSTJ2nnhY2JXfr3jWRwPWATsJfiF/Vj1R346pmxlh0Ip8ygSPkFnXTZwnUEDfhG
	MXbwDDOGcXlsivXcETLTdjPIcGA287ms=
X-Gm-Gg: AfdE7ckgKhfkPeOTlNx7ile+2WjVPQQSW/2HdQgSPpp8RjI9pj+VjkAdbrfVeE4NHgu
	oJ/hHrJfia9TrwItc1DuK669dqUJllfM1u/DUqPe1SdNidvhCNVb/nRWtnSznHlVhGnIItbBhig
	8Lz7+0XM1yos9tudcD19gwK5bihxfEdayOxKzz0OlFnsran22+TE4MqQuwp2HD7/sTIvoQH7mLH
	lQzfvRx1EREDVRlkSkGbZJ8Ft1MnP41KXztkWWA1W8fYADmlcxyEvlEHQLUTdtu7Ig8nFrksh8I
	ZjKp0N897W6YnHID5TTflzehd5EotrxG3lWvm39ZYVzz3bma18zCV8EnE5Lspq35FJBm1Ocuwr7
	piNfd7DFSlBQt8IXexUraObk=
X-Received: by 2002:a17:90b:4c02:b0:38e:bfe:81e6 with SMTP id
 98e67ed59e1d1-38e1a9d90f9mr1536708a91.1.1784020766402; Tue, 14 Jul 2026
 02:19:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72kHbVQfNrum5D2a5sCd3mFQHNtigrQxP1WW=YcggxA=WQ@mail.gmail.com>
 <20260714083709.69517-1-litvindev@gmail.com>
In-Reply-To: <20260714083709.69517-1-litvindev@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jul 2026 11:19:14 +0200
X-Gm-Features: AUfX_mxhVU-rpFvO4T2J_6Fnb7m9tCvhM2LiAWJbL3xu2TTk-JxiIQfVMXQWuLg
Message-ID: <CANiq72k0RbkWk=8hiNzHUmFWr=6OA2DBHAUew4OfZb_Umb=6hA@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/tags.sh: Add support for rust source files
To: Sergei Litvin <litvindev@gmail.com>
Cc: ojeda@kernel.org, nathan@kernel.org, nsc@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 10:37=E2=80=AFAM Sergei Litvin <litvindev@gmail.com=
> wrote:
>
> Cc: stable@vger.kernel.org

To clarify, I meant this one for the other one, i.e. this one sounds a
bit more like a feature.

But I am not sure -- to decide whether it is a fix, it would be nice
to get a description of how each of them breaks something, to decide
whether it is a fix or not, e.g. the other one sounded to me like it
was a mistake because it added extra unexpected files (and I guess
that could in principle confuse tooling or perhaps makes `cscope`
print non-sense in some cases), but does it?

Similarly, for this one, what breaks "in practice" for the end user?
e.g. is there an error message, or does some workflow break, etc.? (It
would be nice to show it in the commit message if so.)

Finally, if this one is a fix too, then this should likely has the
Fixes: hash too.

(By the way, if you send a new version, please Cc the entire `RUST`
entry if you don't mind).

Thanks!

Cheers,
Miguel
