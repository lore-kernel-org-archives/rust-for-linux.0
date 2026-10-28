Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793217967;
	b=HOzE+zwVq4SIh1drMpSsHyYoljMIYgN1M/W+B8w0Omi3dX3DDUzz9DM+gpA+Tkuj6Zwg
	 iP5ZUqayOqJbjK9h8rakRXuTXoobd/0F2thbqsRv+tvuY1WGCfcVPBi86ONzwo0G1MTw5
	 LuDiUTF/sFHy0qPQTDxkv4QDKbJsLtvD4pC5AargP8V0vhmCYr1r1OiJRFQWemj8rTYu4
	 HOWhcPOMfDrqrkkGK2h+Sli9eWfUUcm9F2DAbaGpOxKuA/zvcXRYqz/jUuubPuhdUn9Qg
	 LUk6bPeahIuEN/7XY6SZt8BNDZ3NH9Q45WWA9A/T1ypycOOzePYuHj/qF2d9jaLjp0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=E7ixOB69ERI62LQAi2qp7f/jJpNcrGT6jByhhOIKXrg=;
	b=VjpRpNF2EBu5KhdRAVsaEjncI3NTVa97Ny/Lu+HtY5MnX2/XIgCeN2/U5elK2kUV1rh4
	 ITcB/BwMSVCp50sVabzd97YjnJ4tciGul53/PnACxsDGwIqunnCUPvk4i1nwRPPczjdQf
	 P+pSOk+Eus+civ/ajYZP7wiXWIts0z8IuOtmq1M6TkTpML4qVes/95QYIJaz4xjKksElJ
	 YBKqgsKhUS2FSIUTDvdTuD+ESPodANbqzPg8oJasvs+Q2gHUoym/dS8tfFSgiCPPMHzXR
	 t17lCZUZewi8yt9xb5Sri8022ylM300IiFQgzc51bvdTusAllUUmLT7/DjVifS1UzuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dXlutysd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A42606A31C
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 20:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42A42606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dXlutysd
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5363c8de563so16869961cf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 13:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793217965; cv=none;
        d=google.com; s=arc-20260327;
        b=NpEUnpX7IJ1F/4aXHXm7Mhg8JCZKGcgfROJpt1zZkAi+gXGKIXJvyA9aKzaaQO2DM0
         O4i/OFtP7GT6R9r68De8ge56mFbRkK9NJukvDyQYv/SmtxQDnhctGsOqCCkK1GJ/gi54
         /PcVVTKE4XKejGNmnHchvuTOyPBRKH0HCHsophYr6TXHjQvsqKRRTkcl4hMrSJhdIgMw
         dGAdB05s7WoGdtOdP52S3K264cIPPOhWOSGAV7/91c5Gi+4SY9aIzGjJ5RukYmz6GX+P
         0wUmbk+gMQTcnFTOLewQqgrvPDptUIVtsl2MM0kbvVMzU5xb8zCoUtOx82NMbSLw3eW5
         nqLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E7ixOB69ERI62LQAi2qp7f/jJpNcrGT6jByhhOIKXrg=;
        fh=jiRNwCWc7qkKZUbQWiilVmJ3wGx4RSxnFaDXdbfrgrM=;
        b=ertChSkqOMvLt/V7wQcO8CBMCOgnDQoOLDof2mIQ5arGXd5xV6176YWeCB/avHzJ3H
         DhPkB3GBgylvZqS8LkvYn3X2qWI/Nhkd/u+1iqTdw4bGj79uGccqwNeY/ERiDrUaOvXJ
         sF304y/0ivG1RScXlGNy3ChZCorCv9repvOv9mbCvlsjzsOynfrRbWrr8p8u32VjbJBL
         D0RXf1bhH2zS8lQQMr/nY8MXo0axS0K//TP4hopy0zF3wXgMPu0xeln1iiI3gtBPGPK8
         BSbPU6pG3uLs94HPiHCqw56Cc0lqJxLF+IWwbVEu00hyJlgnGgrz8T6p85pOxRDQWb61
         UzJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793217965; x=1793822765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E7ixOB69ERI62LQAi2qp7f/jJpNcrGT6jByhhOIKXrg=;
        b=dXlutysdDhscdJmeRbPa7EM1sLb4yD199vkD1Ud5wNXNla2GnfyQapJff2WzczuP0y
         ZoScjWnXZShxVmWz9NPieu6mPwchuubNN4y7UAizgNwTD5dSTLPO7oagVoLQhXgFwI7R
         0ax81qAMbxaGvmxEDaZrIPclJ3y8sA4VvsKl/tdlP8Xza6OaZoMCzoeQ6mJK7dbuP0Dh
         n6EEY8267H2Ahnai+uaOOBePk7JCxf7O1jC7P83jtze93Mn/OFhfTe77V/idFSexTZVg
         PjpmHlYWxCb/SMBZbZRok6C4ExF/hzy3pfjJ2pGP1SCnuqw86uG5L8xj2e4geQGqcLCP
         v20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793217965; x=1793822765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7ixOB69ERI62LQAi2qp7f/jJpNcrGT6jByhhOIKXrg=;
        b=wx+ZUxSLij4Qjfpm3+zVqjd51wFvGK0p8XQu6Ve1HvEgYkyGeBwV3Rq7c89L+nEaWY
         5xKFudzzysgEbf/a+NoW2jexYehwGBHiJlbQo1JVXG5VUGPndJVeHOFKgrdw1PUjk/P7
         H5C+al3pilvddTCkPEy9IZF3Ka0zDV301pBauSnpBp62N7G3mJwt5XP4gCPVA7beF6yq
         +QIJWiJr1ZoQO5qn2iiueDE2MZxemg3BBJuRmdzTMnugg7wWPz5nrVAoYqlQai5/v0c7
         mmMT/rYGRPXk4w0H6+tCgFN6JX3mSpq+/03pG27456gJZbog5TAwW0UwSnCUG12NUnow
         cr4A==
X-Forwarded-Encrypted: i=1; AKwUvByX375C++OslNoLt8qHFagSyIvccUXiJl5wsNovF4cHiam1m8s5gDvV1geRTeocq/uN6NmPixePrlyZyXc+4Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYK68VDRuQ2DW9YoVJ89CsASVB0YqQyWWyzREQ/l0F9Q14Rtomgh
	o9QDzG0qC8XybnNodfOfzrS7aOgXLQNcYisUOF6ZJNmmPmOCVoWvxU4DjI3rdP5R2CGq2dLnWP6
	uDywhHuci/xycUe9VAo57CnD3ZR7yEps=
X-Gm-Gg: AYBFou3E7pL0QqF8yGQp8grQlIID5EUNZFeICMO1lWFszv2b80sUIuffi+FMSPHFywH
	6QseZwSQmKrhKfMMpl26FSEPIaT+BNLcM62T0HA6O7p4AUXU/N+FO5GftA64J5H27c3AFP14GYN
	oG8w9BW7+EBCwGSv2/udd3zt/N0mz5rotOniLcaoB9mBws2mAyBStcF9eijXAE3siN4PgivWjNz
	+XA7UwmSS7c0oleBDEe2OLx1SizJgM3wOBBhtGJPnuwCeerpd5callLqGfHb2ptjNNDsZ9Vj2fN
	XIg81VP710Q25+/ECAXqRob2hdzE5FWSmwmQMfH+AZMJzG/W2BJpG94JoRwdsRN1LHy20QD13BL
	f/V4Cuvlf0nsCiB7BwAAjp+QcRFJ/aO3iX3r2
X-Received: by 2002:a05:622a:1b06:b0:535:11e7:fdb3 with SMTP id
 d75a77b69052e-53fcc4cc979mr53158021cf.34.1793217964993; Wed, 28 Oct 2026
 13:06:04 -0700 (PDT)
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
Date: Wed, 28 Oct 2026 22:05:52 +0200
X-Gm-Features: AclHuK-gwnM5a3gchHzfHJ4Fbkh10NoTzJM4qf8pmkxYyLfJG-2YoMNVzSxHgK8
Message-ID: <CA+YDrKAjSO7SVOE+odJ4zYEphfJtytjteSvQgGwmz_rD4tsx5g@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: document emit_base in ModInfoBuilder
To: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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
