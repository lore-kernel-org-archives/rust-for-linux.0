Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E340B43F8A2
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 14:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038190; cv=pass; b=kGRE/3ol/LoWKt1fVagYzRxcd2urzFmtogWHPxUnrmyWNu/DafIp6tcG1h0TC43k/RdSjjXehb1HUrjUPiO9hFCLzW3N0N0hYOPE5fE7YazvFUCEXYK9DD4tvR+2JkwAoYaWkQys09aoAyLzZJpP2EGqzQoXxW46yhKcZAiS3L8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038190; c=relaxed/simple;
	bh=5IdzfBAuda1Ugb7dvbIa+3pE4vsLysi0rcWtfaUR3BA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=W98UnEfkdpYUCwNP4dmxV8OuMA8eqZjcgKIjqGXR/Vg0kJYIlG8ev5bqw4R6uqIrdJbb56Y5O9V5CdXbuL8sFc3eu9wV+gKB0iedk6gevR6dFEhla58Htt+hDtaO7LIpDEX9gHLufXM9rZql8gh3FbDCJQjZxdNaVS1SWbnMNig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXeWdspq; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXeWdspq"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3860f32307bso731584a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 07:09:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784038183; cv=none;
        d=google.com; s=arc-20260327;
        b=V4OWtrVf5+1kspXKu54YNjL4dCX9Z9q63CTG8rO8Utnn49kj6J87rjbUAE2B2vpHjA
         i9W0TFdrD4HMXuaMOZgmht+7tfFbydrjH8RgFfHw+hEo4eepp9JQxqUME0872LdMhzL3
         omHfvq9Qi4wUc+qcLSl4ER5ziADYdaOiduuWOiVaSxCmaTAmrxGKYem18WXmSlH16/sk
         TUGFM9K8irNBWiOUpodbICxQEcvdrnhYQg6mwvPr/aVcysOEY+u2WpI9g8KCD7REOW+e
         BNo4BRepTWawm3lk7TlYqFOlnO/BfEovAlpy9l6eU87JOJsaHUQyh/w/rUSqQjQObi4n
         pTZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5IdzfBAuda1Ugb7dvbIa+3pE4vsLysi0rcWtfaUR3BA=;
        fh=ImG0MzK5xoG6rfMl11Oq6P3GXiabYnRU3H4rEu++17M=;
        b=rmxWrZSWRNfN+EAV+CohcHq/SsA6rrELMrHPgHbxcGrys+sQecLJnniYKJdG9zIVIS
         4c/nfrcdt4szkk1wbpGocGQ/GEx0irMLo3LtrQBhNmy7F0AM6JSr9VQLap3l+Cag54jI
         GTUup90elNnmbCxN8JcVT4kLxbXIcwYs+xt1q7LH7uIHaZDp3GczxSZbkhH+lbTwjrvD
         VGJGjNgVzO757F5EvOSTfmr4050jOqSIulGqkT0NFbk8sT5jSIVUdKtjkai+uDPwNey2
         ahXe+ucao2kcP1ISqbZy1vuq+DLwzRlCGzg5lx2HnHDG0OWtcZGbgMTZPeOGsH4JzzXk
         Vvew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784038183; x=1784642983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5IdzfBAuda1Ugb7dvbIa+3pE4vsLysi0rcWtfaUR3BA=;
        b=BXeWdspqbLaupeIZEjiitm9hl1+qYIcVeoIGRxKOEsZLOVLDH6mm1v3tG/sXYjGF8e
         NIE6np/yPGZvr0Cu+3Zc3rNcnv8/Xr0XzeXpBgORloYpFUu8gd350+lFMn0+970/+597
         n9SJPfghvl9yAstcVr+iOgRoX09x+gG85x4I0ghmXfTB3EuEQvc56oDZWtQnnD6Xy+PQ
         9qxyRO3GPNijtUJ9VXbekbKn3NALC71fT3w8njaxuNY6XuSh/Dq9JrH7hxGvawlrGhZa
         hNZsvZe0Dxgwe+iz1XMMEur1P3Kdfyu4Bhoq0w2J0A+Y/qoRccF1cZ6CLGfpJNsLiJJc
         p0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784038183; x=1784642983;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5IdzfBAuda1Ugb7dvbIa+3pE4vsLysi0rcWtfaUR3BA=;
        b=r+77UZj+Bgd+SsiIK/sL6WaMSmogMht6g0MEJMIezHLk55IZWn/TufcUSgVg3ePeVj
         /66xLzQwgkijbCr2ZxhtmRFhEVQO657RaNBMNjsntp6nXdphxXM/alYvczepzpOZa43/
         7SlyfRO+jgi0BpyGtTxvz2UUoU4FPFW/5xeXlyssKPBPnf3J3aAjT1gKL+VTEC2pAPDc
         8M2VSGyijQF1LFsPzV5okXJN5Okce8sDht9tgbGkc5TuYustaltsp9FG0e6VxpDWitXl
         bbQ05kMY86Lr1gHn3W5kpd14BjEnGOHtn3Y3cTP/qOHjhFTmALe6w/ag/gUK2PRfwaXQ
         sgzw==
X-Forwarded-Encrypted: i=1; AHgh+Rr36TLs581CnSX5Mb22gRfyynt59x0f0S8zpHzTuwRriyMp7Ap80Mwc6uPHXCh5tqX5XBYKXu6nFIVcKmvAnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLSQZhmzexRLvswF01V7HtSLtXIDnNr1jnOLmNeiNX+qY8kI5d
	sJxDfRj+p56qFionorFupAIJUGGsKdI9ihhyhpvmZVcHDzpwnF2WnCyF5GWcwCg0Pc0Sip1gBPB
	ql+DtlpK1pU7HlHfF1zc7Y2ilfeo2y5Q=
X-Gm-Gg: AfdE7cmBCNpiIxKQHXeg7KlQc4ZgsO0FknmW9ooYgl+XMDi59SBL1xTeY/MJngnTSKK
	QJQCo6YcdO35u6zUSmuyt2aNM9Oa/AYmBCj3GtshYMX637hYdgY5m9WwaENAcetZ5wt0mqOrdU9
	fivwzgP8rmAjcT6u2JpJHwMikL56JscRLrCSiHqc3KP7olXwqALh4qObZ1S9RsudJiw6OlSC+ZG
	ZPVgpDDWzWpCMbNlJkHvgSfVo0xyC6dtoFMnHdpWyl4fx1vA47j0/mD2rdH3fIzyYW+c7a9UFHG
	Lq8tpCRn25VRPMQPDbwkLj4vrw2Tr3ua40m9S8lxNBVxRDC7Ew75xQR96Xw8jXNfkFlD4dNDIw/
	Fi8tB5JbQqZnb
X-Received: by 2002:a17:90b:564c:b0:37f:eda5:516f with SMTP id
 98e67ed59e1d1-38dc760604fmr9794243a91.0.1784038182439; Tue, 14 Jul 2026
 07:09:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72kHbVQfNrum5D2a5sCd3mFQHNtigrQxP1WW=YcggxA=WQ@mail.gmail.com>
 <20260714083331.69482-1-litvindev@gmail.com> <alZBCoBorSGsCw-t@levanger>
In-Reply-To: <alZBCoBorSGsCw-t@levanger>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jul 2026 16:09:29 +0200
X-Gm-Features: AUfX_mx--yhT3w1NL0wLQwdIGz-EJTA8oL5Ed7RG3qAqn7teI9MMql8DPSUS0vc
Message-ID: <CANiq72kCEr+576R3U-QpNkKm41HFPzrR42z7RCJNo_YAt+MR=A@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/tags.sh: Prevent binary files appearing in cscope.files
To: Sergei Litvin <litvindev@gmail.com>, miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, 
	nathan@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 4:00=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wro=
te:
>
> Miguel, are you with with it if I take this patch as well as the second
> one [2] via kbuild-next?

Yes, of course, thanks!

Acked-by: Miguel Ojeda <ojeda@kernel.org>

(If the `cscope` target is actually broken in some cases, then I think
it would still be fine in -fixes; but since nobody complained so far,
I guess it is not that urgent anyway...).

Cheers,
Miguel
