Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793218047;
	b=qEIPYwc8QrZTQ+UNjAjCq6dM0KPh5QKWrx0Nyjr3Jv4Vq7/LSQ61Ovt4RqjXpn5VMNf4
	 6duBwn9ubcf/cD25v5uyfpbSzhmxZwlY30YNE6kY77ocaMrp2i6C4OW4pxHQ2Dctf7j/A
	 TruwnGWFoQ0HheX9mt6xGgL2zX8fG0MU1UAqATm23AcIxMltKOMVdlLRK/uUpk2lZGoe9
	 y3btJjSbE9fERe4pBjSFQsLbFzxor0TJYJ/8nsJUOezlxDJvpJTcDchKMM1Bez1MVxxJu
	 Xnhe0IN9SRMnkV7eTIeKXQ8E22V3NoVGGtrLH9tfk33fvXksRwtr6qKVHUF8vw4A+8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Lrhbbx4CO+oq5MwiDvH/mUB5MVwGHTj6HOvSaL36hvg=;
	b=vJhU9hX5dxq+Iq5R7tHcS4sALdgSnhfWB+HjTLxWEf4wwuXiZWqEilcwY3TAT9Noo/HA
	 pNvXZX7TV+5LgXGzscFa2NXX65w+LihylOD7OKXNZf56ZHWJuTyOCj8Ool+8ql553JVug
	 A38wejSyfpJUDrY1btg9aXVUBIAX89S9+Xm+jXvK4GVOmPr7KLohc3sbxodC0si9RLF8P
	 7TtgAdfqqlyyKHBzNrdYjfrZaiRnVDDh6NOQkbYKc1owLVQtRC1XvcVPtn2BFOOpEuMYV
	 kO67xvj3hWPUEepr6eQLse06lh/aaXMDrEEKFmqIDlJXA6FLQMyhkTo+/PXvt1lsXFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p3taxh6+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61D6606A31A
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 20:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D61D6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p3taxh6+
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91c5e31bea9so19021606d6.1
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 13:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793218046; cv=none;
        d=google.com; s=arc-20260327;
        b=Sf+9FA8J4zrPH06NStuFovqJkaDgsDtJyWD3U0snZnreVb+a7j+rq4VHcjdABZZEdj
         4EjDWW+nMvY/CXAA9TE5CbmSnVrk5uyUJLOIW3z6gnvXSpkiIkwAQxqfoFcfwJeCzet3
         7SqE/e3Y6b0PKwuiTDkUZzwBC2EDdqFoPlIefensH5PeC59G7KU0x6l0Mp2+//DTZYk/
         UhOlU/X0i+rieXdIKcT1l6uiQT7/whbYp0nLDGDxs2cXVL3HLsJ4lDOfnTlOxW3bsm4b
         5mnnUgaq5Y6GGlGR+rAL8YOJdZo1FHD1IK60n6admbcoOOPiPHJITRU3pUug0d10n2pO
         1A/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lrhbbx4CO+oq5MwiDvH/mUB5MVwGHTj6HOvSaL36hvg=;
        fh=C2UH9k5oJWtvo8knV0dbxEdQswQBvt83ZXEbj7w6CKU=;
        b=sKuSGTPlOP1B0piFPBEUNa82G19A+vVGrgBRd3D5bbUkiFIjCPrABwApPHb1TEQj1M
         AJ/0ACUYokqVhRIQE7gAt3NlvLdhac3Ko028k8c24CFjc8e/G6aAC2SxQuQKtusKr9Yc
         3gJcIuQgHzoNGDz7vzZ/utKPMwRCciPrkdKSzxrCgOMjfR+8hwP8JcXdPBVwuhozePdh
         KZsUNCpZXu40b36Y/44kCKMshsfovQyYos/IjYh+CLQrio9MXdhPvitbrCfQ/7qujo1M
         2lSuWu3ALUztkifWyjofgFMV8L5LlrhtPJIqiV3qmQX7CHmoy3uuhJK5ktS0LqlbJOpI
         nDwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218046; x=1793822846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lrhbbx4CO+oq5MwiDvH/mUB5MVwGHTj6HOvSaL36hvg=;
        b=p3taxh6+1zzWVc9EmShmzG9CuyuWlEjpboYJHc6W45sCKXGXjeJH5Li0UcdBireTcG
         Wh4Odk8rQQuaqHs73ra+lucr5mlVAKxrGMu8R9MTBKFA0Tkq2f7uGh4xRuo88zuAGvPi
         Onhs72B24PAxZon9uswO0flA8MVCF5HJz0E9d+FhKfBpMZ0qelyQRghtdcFrh6VjZU8m
         WESIHnfjOMZCg01pxaPgugzZMI30+F6//HFuuHFjACpjDW8IYdDPglwvJTazJQ3T/YdZ
         K9OLhk1aHNfgE8OH6D7Tq6tYwdLGNTWDP9QhFVrbhJriI/QhRT7kbA/9lARQKF/hJJxH
         dSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218046; x=1793822846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lrhbbx4CO+oq5MwiDvH/mUB5MVwGHTj6HOvSaL36hvg=;
        b=vzERL+qjjipG//vo2xbwFxWByl1UXkLdgwY1ZelycT/MlTnjWnS7ds2UCZt4z9le/c
         ltkI1iPDo4NXZYFs5N1QOAAI78RfH+RYKalbzjUPEzuocEPts98z8fHkfqG1hGpOGO7y
         xemRmakwCYYs9yulCqywOQR6DROWY+v/O+MahGZJmUkBlVI/CkMY+tHaCwW1uwkrMZE2
         D+IfMmvoI0Nz6jLkXaT356cyktApOafCd+lo7nBNhunjMrMGq9qxUjz0AbHQxVOgk4Qw
         7EAfVjurJjqypsp13F5fQ0TGgDDt0wRWmCjYQkeCSraCChkClkwdK6YeKiofHey8jt+7
         VSkQ==
X-Forwarded-Encrypted: i=1; AKwUvByMfOs+sTDx+Sw1WLp22y2Kq60fkFJ2NMd5uA99ixCCHSKBHUy0+FCt2vZALB0SjuVV+bBugz4ALSJtira2lg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI8sciPdPwt4Hl0qqhuvVsfDGixL2adqGKXHJR74VJh+MzXPoyQ
	tIVDHC7VriPFMkMdSdQmCXxDD5lOTssO6Ywh+A98EjqKePHO1Gp8x87lTqwrCy8csFp6CrWwaUp
	S3cvsVsvNsGuJnBSwdgF1HoAz3u5gcSc=
X-Gm-Gg: AYBFou3PwxJ4klUp4nZx6VpWOqFAkGDT968ZmXmXO4e9eNMieIHThc3iPIlbDCkiVzF
	PVpwmE3pqNbS0kY0orZOe2GJ88lFpJiu4z4FPz/vSjZwfWFVwGEjSqgDL3sD/wc8J6cmERfmV+w
	XYKRCfT4myMbUN9ImO315We0CbIBZjFGW39wu3MV6U55V4zsM6TDJsoA/n8cWgPoaJTLyBaS46H
	ZFvQzsDCPZ4zRAnjBXDh7WTQshstgl5F0urf1E8ySvmJYyFSl4x9+53mmA9PwPP5oiPmzIEvQzy
	UU2xPWqAhcx0TN7SGFa0A6afHu2ogZgubm/BFlne5jIVuPS9Wo6FCJ3HYYGgorr3s1FLbxzAA2M
	HSClKa+GbzmMWcrugBBcVyD/qyfYKJbtsOMtX
X-Received: by 2002:a05:6214:440a:b0:91c:7a28:ac2c with SMTP id
 6a1803df08f44-91c7d1c8ea8mr57159156d6.45.1793218045636; Wed, 28 Oct 2026
 13:07:25 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028155005.174417-1-mbkchelofficialdev@gmail.com> <CA+YDrKA1hTM-Yh+qsCz7Q_O9f4m_JWqyxkm4izaz4uAao_Jz5Q@mail.gmail.com>
In-Reply-To: <CA+YDrKA1hTM-Yh+qsCz7Q_O9f4m_JWqyxkm4izaz4uAao_Jz5Q@mail.gmail.com>
From: MBKCHEL <mbkchelofficialdev@gmail.com>
Date: Wed, 28 Oct 2026 22:07:14 +0200
X-Gm-Features: AclHuK8ADXWg0BZmsFa3zyD6jUTA8KjkgEaCcTELUDSN5BqekvV-5qZiXzunHtI
Message-ID: <CA+YDrKCkQ=xzsawRUdk7FUXuO+JvKgEjFuvFAGZwMtOR2Aw1BQ@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: document emit_base in ModInfoBuilder
To: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Please note that I made a typo in my last name in the "From" and
"Signed-off-by" lines. My correct name is "Ivan Tverdokhleb".

If the patch is accepted, could you please apply it with the corrected name=
?

Thanks,
Ivan

=D1=81=D1=80, 28 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 21:57, MBK=
CHEL <mbkchelofficialdev@gmail.com>:
>
> Hi,
> Please note that I made a typo in my last name in the "From" and "Signed-=
off-by" lines. My correct name is "Ivan Tverdokhleb".
> If the patch is accepted, could you please apply it with the corrected na=
me?
> Thanks,
> Ivan
>
>
> =D1=81=D1=80, 28 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 17:50, I=
van Tverdohleb <mbkchelofficialdev@gmail.com>:
>>
>> Add documentation for the emit_base method within the ModInfoBuilder
>> struct. Explain its role in formatting metadata strings, handling the
>> differentiation between built-in and loadable modules, and managing
>> linker sections and conditional compilation.
>>
>> Signed-off-by: Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
>> ---
>>  rust/macros/module.rs | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
>> index 0a7b9e24c..6f361013f 100644
>> --- a/rust/macros/module.rs
>> +++ b/rust/macros/module.rs
>> @@ -49,6 +49,16 @@ fn new(module: &'a str) -> Self {
>>          }
>>      }
>>
>> +    /// Emits a single metadata entry into the module information table=
.
>> +    ///
>> +    /// This method formats a `field=3Dcontent\0` byte string and place=
s it into the
>> +    /// `.modinfo` linker section. For built-in modules (`builtin =3D=
=3D true`), the string
>> +    /// is prefixed with the module name (`module.field=3Dcontent\0`) t=
o avoid naming
>> +    /// collisions in the final monolithic kernel binary.
>> +    ///
>> +    /// It automatically generates a unique static identifier using an =
internal counter
>> +    /// and applies appropriate conditional compilation attributes (`#[=
cfg(MODULE)]` or
>> +    /// `#[cfg(not(MODULE))]`) based on the target type.
>>      fn emit_base(&mut self, field: &str, content: &str, builtin: bool, =
param: bool) {
>>          let string =3D if builtin {
>>              // Built-in modules prefix their modinfo strings by `module=
.`.
>> --
>> 2.56.0
>>
