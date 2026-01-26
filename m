Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33FBE55C
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 12:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769429736; cv=pass; b=DpmtAh4edDhdQHOSFdKo6yqcS65C0Ms0xl/2x+egoyPS4yao+/9qMrOxa4gB+Xd91oGUX9PxLWVwBfT7MzLaY81n/HB3bOtwq82FUfKDubvGhQzxKibeitIBv6sjG0V/WLc8D1CRVccIbRbgxSg08+9vFuwJ7CkuZ1TUt3rf++U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769429736; c=relaxed/simple;
	bh=9xseSJ5P28PtHb9TqnfdbLmC1Wb0o0LuhCZEaoJRH5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2jp8m3xvZntm8jKa0GIUfNBkfvvDFhCEAr1X/oFOQJadaqQWWHQcSbvaGs/VfUAeP9eoHZ1BSDJhA9JYC6PV9mSv1SDFBr1ocBeN2Uwk7/Nlfj0dwVuvCSMG8MoImvgLmQ1IrXR0uaE6iagthaZ2aAMLNC5vMoODyyyd0s6+oQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mT2cgmy5; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mT2cgmy5"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b718524994so190722eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 04:15:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769429734; cv=none;
        d=google.com; s=arc-20240605;
        b=LVN0VKjSjM96rIpZ7NDUlcRjipoT1Cxyf9NilRw6wkSJHd+TZyZvMXG5hxZtT6e+HI
         jsSc92vvET481eVaKQWoHAGAru4FddydLzjsZvbJ5fj/zRi3GpVbyqh48mbvtBb2MGDn
         sl8zog7WPuLc06/IAnkwqWqqCUcC3nVt6iDKgys0fEj64NAt9i8Dn1eLjj+PNEyX1rpW
         BrpkBvtoRfS6VoOD4xg6FiDOwaBHDo5ZxhoMuYPoDjpOnAn7UFj4/VSnnifqdkO5GFwe
         x4BtMntRNL1npAPuCQLGv7zDcuK3e7IXOIzqgq9dkMrag35UZabmW/u/oG6Li/BOimUj
         jElQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=467gqcHqnIQ9VVwNI4wTrt6UrXfdyjXK86YLFCrFEFQ=;
        fh=dLWL1C+LaUqBgYWSUShiL7gUB1TLRQW+9WZUbBJ+EEY=;
        b=Ut8zWHezUX8qWub+Wq358g3TN4DsaB0UsXhXW5GVb1Tdgu7LOBn3mB4HZ5O2wQ5Mlc
         Vu9hqdXjRMNZXxHgFaWGfKkZLA7xEN1seDTAYLoPO8hb+ACp0zBGiZYRINaTO5LuISnY
         hnFqpOYLZ+WySYispMXxre6GCZrnhaoBe2YpeHFmtr0rWNNzoqf3xCPsp8YN/JsWvVAO
         Nnyd/7wkk4DKYdMaZmyrGhKrYM0Z1GVwfcyVJz1VRVcMwBRwRPBo2r/TjZYTn+ECYJAZ
         T1+iHiJrd/zhGLAajilECtuT+a2UVmwoyS3/Ow836htncqYhh397XLshBrjUuNocdviK
         YIPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769429734; x=1770034534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=467gqcHqnIQ9VVwNI4wTrt6UrXfdyjXK86YLFCrFEFQ=;
        b=mT2cgmy5IlA5o9pe4yQVrBhIEKnh22HLL3tGyFS4757p142cD4qVAoFvM41eDVJwZ2
         tww1tyH9KJz3wBlW3ZcIz+9ELTR1Dg6jVwrFrKEnfX90lnEpqrC1OOC0BKwY88Q2IhLU
         uNmgvVzGYt0b6vU+vPwJD8XRV2hHfGwZH5OA7lhAXx+7dTrJ0NxKdHPbyxQU+9J/Md8l
         fm6JdH4WMghOLpMA9W91B3N0iVDWoBUKcsraVnbHzvcavlurKMSsTQ624QZEvF34doUO
         q5U964u6y9BOHo0jSlE69/6JbPVHjpjWJd0AKkBezdJBr1K/g4DxyapyMrlovmH1JvHQ
         q4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769429734; x=1770034534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=467gqcHqnIQ9VVwNI4wTrt6UrXfdyjXK86YLFCrFEFQ=;
        b=AsIWZPuFoZKtHmwekPpTjqd44nonpV84/w7uTkDg1BPK8xl3XIcJia8LSc2wxEwwQ+
         jlfRWfdvxODz8xsbd5lSu1QTnRMVkC0IYqT3Qgr6OTQw2p8N26b8SPhvOGbKTaSFJE0G
         oLEs3mCHxo+8CEEZjUpRQ/Nb3GhyaasqIgOF+whDfXBuQKGGB3vl5UoHVTSJBFYAbyxD
         /cTiAxq6c/+7v+GPZzzOnJdc7reA07Sd/1Yso+E40nK8jxQH8SLSNIrvQg/fRKp7QINf
         vu2rZ2NgTrInR+yihgsckzj09kCU2mB6VChs2OntxzDs5GIeP6WKesCHST0ZxCkk6tuu
         LhTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXND6qd5NyS1soB03swQiw2+MGMlDxc5WrMP+R/TB6XnwBMz+KIOSAtU4ZQhtRiHTuSiiGb33Y0F/jMsl94Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEeHEOh74QpQoplZ9K6dFcvnGF9xgJOHiHPcvIAEDSjgTSG5zl
	5OqGsxCqyaoBYOOxL2awnrQj1Y2VYvP1UWGZ+pI9Ych+XVJUeYFEYL8c/kcFIdlGBqYSe3Qeuzk
	mSXvNyleiWx7+bEe/IH+/ro/XRxWa30c=
X-Gm-Gg: AZuq6aLe21Tdunv4eqUtC+f3zpEnaVZYA8z0alAdzcpZ/YDJzbxjtBw9Mn/jwaQF9R4
	RPBhTw3sw+GSdrSQToLK1EgjnXrakxkdbokBaSVEPG7rP7xzr6iqDrtcVZG20Yc32vrZ8ZX1YHq
	85SGvOTpjqHhcpI86jvv19v9Hwd7qaUjy2z8mGPoCfpQRjogLJbb7n1i2D9KB2YQXhANULPi6Dv
	WM2lsdw/NFUyR8mIKtvdwhM6QRajpxh1bmV8MBo2l/tp2VHVUBRkv3RH87gQi+4s/AZilXSxlNc
	ZYTs46FIV7iNWorrnhEsmy9qmEtMW9hadTkyZL5T2UEdnNftZN+x9+nayqdFQ82WzH5XujdYxhF
	l5eMXhA60+TG7
X-Received: by 2002:a05:7300:730c:b0:2b7:103a:7697 with SMTP id
 5a478bee46e88-2b764828e58mr995313eec.5.1769429733882; Mon, 26 Jan 2026
 04:15:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
In-Reply-To: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 13:15:21 +0100
X-Gm-Features: AZwV_QgKhnNNbMKQO6XKgBIfpElvwvwX8oVrlUj8qdRiKJuHYG8VHhtnfvBlY5s
Message-ID: <CANiq72nNRh-yx7Tts17kJ1M=x+ML=Uk663TW9HN6HnARrg5J3g@mail.gmail.com>
Subject: Re: [PATCH v1 v1 0/4] [RUST] Framebuffer driver support
To: pengfuyuan <pengfuyuan@kylinos.cn>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Helge Deller <deller@gmx.de>, Hans de Goede <hansg@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
	Zsolt Kajtar <soci@c64.rulez.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 9:18=E2=80=AFAM pengfuyuan <pengfuyuan@kylinos.cn> =
wrote:
>
>   rust: io: mem: add ioremap_wc support
>   rust: device: add platdata accessors

For future reference / others, these are essentially the same as:

    https://lore.kernel.org/rust-for-linux/tencent_63DD850B43CC086844717B73=
C574B8358F05@qq.com/
    https://lore.kernel.org/rust-for-linux/20260109080528.478731-2-pengfuyu=
an@kylinos.cn/

In general, please try to mention if a patch was already somewhere
else and add a changelog to understand if feedback was addressed.
Otherwise, others will have to do a manual comparison.

For instance, I may guess you sent this as a sample user due to what
Greg said back then. But that is just a guess, since you didn't reply
to the feedback nor mention it here.

Cheers,
Miguel
