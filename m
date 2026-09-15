Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3725242E425
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Sep 2026 17:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493299; cv=pass; b=U6Gq3Y0w9hHEVFiiWwChMWR41vz+jlpjVrrCAtZpUoIEtT7H8NOnMPXqhbBCbPd5bQiLJkPqBROhES/L/VAdgy2P7ZAgSu7+0xFPST/Agtl8jmkOdG6Da6mV9dKuoPxRWp4IBhY7ylzerK8dmBElmfBE5FTgaNjZkE5V1eHOWHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493299; c=relaxed/simple;
	bh=cXz8ov4bwHxMA/tyqY3Crch8C4r5Qa4kwtPDiQjwdE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XIvZfRADp7QksszyxCHXxbQMS/Sahfd03KuhBa82gLyHt4HfBX/mc2Wc27MymkubdddQYqD4Gd2w3KyQ/M32snb1f6dHge2lKwGRP3Mu3+zJe+Y5Tv3r2W0eqOhKTheayWDWh76IPuB84aWXnRVqEHy1Ge5T5F0ZhJDANzNOH6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=WfwL9aYH; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="WfwL9aYH"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6ebso173366d6.2
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Sep 2026 10:28:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789493297; cv=none;
        d=google.com; s=arc-20260327;
        b=XvRvK5NUSxfdKCuSnEUHZFJa1/BscOodev960MefSgCTa4UrFnyuCedMRzCOBaebP9
         4jD77QWjlPRX5IBamWoViTKOx5FXE8Z/pOGrDIP0un+DpPBncBCZzfDKl1u0ISd4KAaw
         0edop4F/BZ89vqIk79WQteUS1Rqq0Cv3nBLu11V2AJvHH8VnTHqG00uonxIAdwuOniEc
         MefZs9uzfPuMCY/S2RDxN7Qh/swQdOrV2DqMTKBID6VyoI3eKfiF2JcUzQZ0Boslk01F
         bsTez/ARhSU5bWNxQgB+pov6+eHH02zYlyyR66nTPADjzrddAaRl6F/yQ3ZlzaK6OTWT
         fvqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cXz8ov4bwHxMA/tyqY3Crch8C4r5Qa4kwtPDiQjwdE0=;
        fh=6J2cL+HUI8d7uBFMb/y2+x9HI/A7umHhPnhhwtvRKaI=;
        b=oeHPPJnvLYLlaUuRQaHdf3Jqqrryv5N10gD0degfxIbxb/OrShD+xTTYWKO4eeXB1p
         o9LkF1um07ESs+DZanboROQY9cRRwYsrW/Q7EUJ2bAbQ4Y2ji8IrhAk5Cp6VtdpuZwdn
         MrPkoC0RMObQAHw7WARJyvd/ZplHjqaAyCqxcSTb2SwthT30sdyXRcNjXTAz33B18uPW
         BzVTsOhCynLkfy/A74iwbNFbV9CKzHBHR1xCmR+gw8/yKsnQihqxmAz388P8q5D4bGIJ
         p1XvLvl7QL/nJZ5ecLAk9MWvgtfCEfNrsFkARSXKL7pgWaAGWtYc1VdaJ6fnqMcGFU0P
         T/sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1789493297; x=1790098097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cXz8ov4bwHxMA/tyqY3Crch8C4r5Qa4kwtPDiQjwdE0=;
        b=WfwL9aYHE6jtvtR2ayg8rhZGwfBWAGYM8v9Ouu64DN7yTGzscxeH4HEwAvvYZ5C7GG
         1i15EgNGu6MonB+6s1A5T0gqil6VGbY+ya7D7HijZe0JdNN6TFsR02/hVHLKCApyNqGU
         7os+hIWT7WggUnmQbsOTy+gRpAm4Kl4tnD+YRDxpclpR5yNtJNjGnW7helKSQg65mq/T
         F79CT+U6XPpPy5Q9b8Mrfl7cwzU8RpY8O36/pxls8YBKa1ZpevmBzwuYQ4FLRMnROXbi
         3LEBdsk0luFxV6yB8+r5cfNWcM69DWm9y5gSF47hUYgJ731dD04sxupx1n4hcO210unH
         Mhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789493297; x=1790098097;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXz8ov4bwHxMA/tyqY3Crch8C4r5Qa4kwtPDiQjwdE0=;
        b=zzQJCJhqyomk2TdD7uts4Za/C3iVLn356YT8PARz6UhVaB8idEZT5JdOrYaATJO2L/
         ouu8s0Z5dwiCmjVFM3o2g0jgbm46C8ZBVNQUBFTykIsIXCP2qU3AIpaLlm1zhqUz1rqT
         G9p9Q15DGBc8sWfjAXTmKhdRKA2M7aCvdhLw6E1x6EqWKk714hfOyCuMus3DUV+guPVG
         3IjY2L8CJUVKfaFsG/y6BrEIWyZwBcCKGrC258bKQ+YtBMs172pwC9Ad6bhkB7YY2WNB
         NkYgHxlj6hBOkhhURt6tybUihx1ns+wl+TVAyNQyaYvIw+ysVKVZfsb1/TSKhbVNGVFe
         asdA==
X-Forwarded-Encrypted: i=1; AKwUvBwXMSjAT7HXdgFyrDoLG4FXekygA62tX+b6gt3u1xnXNRj7pjbWzSWBGWZ3ja95OUK/zLvoimSTCpRkU4OvZA==@vger.kernel.org
X-Gm-Message-State: AFuF++nR6bTemA/zk5LUGY/kqYz1gNyVNrz4BmaHxAsY/17VdR3opjOX
	p6L/g8SH0CSTwiPH9b6waeKIt6ur2sRhiu0Ny6sIXmNsIi+7ydWZ2LVX8xQoKT5A8jDYEA54buV
	3RQB0hWg3cv3KvIDd3/XLdbpRUUxT5oNaFRZnujuPYA==
X-Gm-Gg: AYBFou0m1UGuEuNUIzXh6VPvFB7REba57dkpw3dn+UGklVRUK6NgnkABL1LrEpAy1rC
	Ij5caWqMkYe+1cKumubXfWug8y6/z+L2gnFM5ONfl1/ORfNGwHcopBNZnRZI95NxfOVYmvOH1u+
	Q0vSjFGsSynGRJICuL8+dSlTPkG7dM750Cz2ykCih8lxmQs0vp4Aoo+UJLxCHCe0UAkGi6+XiYC
	dLMZ2uzHv+42G4qabtJSP5TgfSBYe6atCu1WD/+jiQPwZdIgUWxqoS02g5IDaoxnj0N8+a1RLcZ
	MVIZeQos/TS7shy8dSY3WngEfsQqGgThLlZV2sPwnMUXqwNOMa4/AxyF6YvMuTk+8vpLH6X7YKX
	XrcR3c+283fc=
X-Received: by 2002:a05:6214:4285:b0:90e:873f:112b with SMTP id
 6a1803df08f44-9122e51912amr132309106d6.16.1789493292175; Tue, 15 Sep 2026
 10:28:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789420324.git.pgovind2@uci.edu> <f515b62bb05e7b6bf0bb06c8fdb362486fea25a8.1789420324.git.pgovind2@uci.edu>
 <CANiq72=jRupLtnQSnAewyZZC7q4-oeAVmA=SfBGN+z_nefsnvQ@mail.gmail.com> <CANiq72nPhNRxesnUQ3HKBxtfxUD4r5rPYVQOxbiOAvpEtzUrbA@mail.gmail.com>
In-Reply-To: <CANiq72nPhNRxesnUQ3HKBxtfxUD4r5rPYVQOxbiOAvpEtzUrbA@mail.gmail.com>
From: Priya Bala Govindasamy <pgovind2@uci.edu>
Date: Tue, 15 Sep 2026 10:28:02 -0700
X-Gm-Features: AcwNN1WfaadzBgQ5koNE2WDSXdYwEBE4lZ6PVotun2aDdrF6D5VwA-Z1FB1DNk4
Message-ID: <CAPPBnEYRjm80r2v=jBnRS8xGf4WS1g0vo1=xagu+xPxixxb9wA@mail.gmail.com>
Subject: Re: [PATCH 1/1] rust: block: Fix unsoundness in `Operations::queue_rq`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: a.hindborg@kernel.org, boqun@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardalan@uci.edu, zhiyunq@cs.ucr.edu, 
	dzueck@uci.edu, 
	"linux-block @ vger . kernel . org" <linux-block@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your response. I will send a v2 patch addressing the feedback.

Best regards,
Priya


On Mon, Sep 14, 2026 at 11:55=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Sep 15, 2026 at 6:39=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > Finally, it is usually nice to provide a simple example when possible
> > of the safe code that triggers the issue.
>
> Ah, in case it helps: the cover letter was on my spam folder -- I see
> you provided a full example there, thanks (it may still be nice to
> show the key bits in the commit message, e.g. the part of the impl
> that goes wrong), since that is what will be kept in the Git log.
>
> Cheers,
> Miguel
