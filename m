Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6EB4A2E15
	for <rust-for-linux@vger.kernel.org>; Tue,  5 May 2026 18:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778004140; cv=pass; b=nYN7In/8+59R/uxPSKnMpHG5NBVIT15rJDtfy6B76xaydC8ZWN1jjmW4OyKjDTTPLMHIeI+z3fUGLXKFG98HU/Xqydje35NOB+IEdszfVnoCc1PhzKRrFYbE2itn5PpUsfSq7DwkTDgAQnCWiWyWVg2KlY+J0ah6gRFeMntsUX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778004140; c=relaxed/simple;
	bh=Y6s8035MnHOoZJp25aH4HKvP69znVRNLLF3Z+qvmjs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBDBJMLhGeTSW85WthypfubjdCaiAZv3v0dEcD1CTwPWs+AP/N9H99ZTsrSD07o+E2k6LrRTRy1ccgrT2AepxyJYwdxArHLT7s2ro1vRCbs1npMgaHc1O7mQABf2Egu04C4kO79u+R38HNdu2CYISg79udw2Vcic7pIWPUNFnY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJxyhCik; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJxyhCik"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b8095668ebso316227eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 05 May 2026 11:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778004136; cv=none;
        d=google.com; s=arc-20240605;
        b=etIc6gBU2mnxXUoHhjCZbyv9tiorXLb8aPHQL4lHWbUXZo9AYSp3VrX6ahriAwnGo5
         JbGzH+sOIhk5j/+5JDqEIVJ+r8py7398tAinviSLYdXyW5hmhM3qV7F0DJfYpEF2/fTv
         lAhNAwZrJHbRVCxiQ+nz8AGtkEKCJdsD9Inz/btoEEThNRtDzZijYTxQcjSoB9Sx//3W
         4PK5KD1hwrA+uTV8dCtLjlfmN5xtKu6XJIJwLOvRIHdgXzqzkQFBTNsJTBtqD8VilXBY
         rYLe1im0jVIa8triZMhdW1R6QWpVRMQpqcX6SWfuVys5160Br1FFRRrubQqyI3hS0SY6
         bKPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WtjqjpgGE4a0FLYJapYAkbo1Ih3ARD2vHl+aUPAHNhk=;
        fh=76AJTjdc78wvlUhLVqyZO9RwI3B+EzoD6KDjuLAq0Uo=;
        b=avAz7Dk9EW1QJ7/5X0Vh/ZHxVCVOnZ89iHJsVzMgvTTOYGl9GnmJcSzO78NRPITJN/
         Ul12flcmozUbP4LVHbjNLJSI6j5ThEMGHS9XZxPkGdSGkC1hfwv8a4zqO+n2nNmpCtRL
         upAKmn0doC3ynSlTWV7W60yAgc11U77j7jBv0aC5cqlsopwTTdd1R/9oGhGtIxUM+eU6
         fND2Y2IM5+XbUHhoO+yT4y26dqxAUMEuXPIul2WoS26Ksa9KgcTxtHul1fxV6Qjb2qPG
         WK2pbSlBS+X86e6mWWoOeulR1MQ/moTBsWFETjhlY5JegjaPTb9ancg7THrjf2IL5pWJ
         b+gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778004136; x=1778608936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtjqjpgGE4a0FLYJapYAkbo1Ih3ARD2vHl+aUPAHNhk=;
        b=UJxyhCikg/zitnG72e4pwDFe+7Hqlki0B/dIRh3QWXUagCdTV2Q6nxe4e0dAHhy+CS
         riDvt67IdqkzcpTojh2KOx/gRReJdIg+by5474N7Jn08Pk5C5ftiL0k8/zVexrbS364y
         kmgYzRc3Zn1nAElEfnuHJyGjkorSuXABtntDhyhvct2mnZpwn27Azef3jyQi4HrrwCii
         zyybvTJN+yvXBWwfFvGs2zyutxp0jiRTuWebB4NUmnexIzeCRXXF2XZKX5bPomTKXT6I
         ArBDA8putluhdzTDMuzFywd/eZCAuxb4ySUYS2R4ty7gkTuJm+FFE/S8GcXXgHnRJ6QQ
         WYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778004136; x=1778608936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WtjqjpgGE4a0FLYJapYAkbo1Ih3ARD2vHl+aUPAHNhk=;
        b=jz89Y+GPHuXrk7JPWT8kC6ac5Q7g4TnGD1P79TAvZxtcwXLWHq1gxuCWgaT+fP3yOO
         nu1qB3qKqiQdSJz3M7W5KpjpfIieirS/aNUjTw9VTtseoS4WHk2dnlWpzydHxTTqzVMt
         g974XNlODxondHjKz9YrmOzwFMzGzJ2BrcR1tfyKpGSwF6WAJO81MO/Cyjc/+7V4hPEh
         duwHe9ccv7SByxPTruTn51M1H50Ti2dvFLI53c0kkRe+/3EImxFo/rs5yOu6V81xapVE
         7XDKXZLQmZK31MUJzJrOmIxh4bYnIhRnuAtwVgJ6rNYT8pC1B8osFw/XaquksFcFV7oA
         BU5g==
X-Forwarded-Encrypted: i=1; AFNElJ+q6PFZZRszdHBk/wWJarVulQAvh3ozb4sVoA3CG+8245YC/VOKN8GWSOBFx3jguL7QuUkgFdKttom8zIo7IQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLepCG6Gs9CMctmZ1Zil7fIj5S2D602mE+u1dJoWzFDUqjdaIv
	QXzPzXLNQD7sJ4ByiHVEFn5hKJijnzDqhhUmXbrm5c7wyk2gzht6+xt+RI84YGxeQ+k0x+F5vdH
	wGBYgshwnSWL4ZfQ/W7AW5m+NHBZk9zs=
X-Gm-Gg: AeBDiestjnYbB6JhVmLPCHi505GrQlIZx9tyaRxAXCoq7WZwMYw1SoeSn0LFkR80Gbr
	aJ5lUbKbltIh/Q+jQK8DTa4pMq8zcnu7nE2d4AQX9WwR0AO0QhCDRjo/oBtCPpdKlDQzByx7Wpa
	7Z4ydmJIFvyCDbNjzOlzGmFZtmyt69mqgzormtv7V+NmbnAH8+Y+zVGheWjkEI3Pvu6yn5wrlGB
	ykKHJJd2f+ewFWrqcv2/qMJQDARYU689ZlLynCvab7wJ9qNwbfknLNxbC9agoilsPkI8mRswWAr
	//MZVJ1rhaS5DZWSsJX1FC/Jyhld3wXrkjFtSen+WRXKNinjjOxlgTNhT3q1MUb4WyuDixMGfi2
	0mAOosEb24ttTaQuBBy4ZhZdxHVi5VakaTA==
X-Received: by 2002:a05:7301:6784:b0:2f5:2154:c7b with SMTP id
 5a478bee46e88-2f548a8c16fmr72370eec.1.1778004135943; Tue, 05 May 2026
 11:02:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777987027.git.mchehab+huawei@kernel.org> <921e5e6a074f9d8cf77483d73e6801f49254bbb8.1777987027.git.mchehab+huawei@kernel.org>
In-Reply-To: <921e5e6a074f9d8cf77483d73e6801f49254bbb8.1777987027.git.mchehab+huawei@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 May 2026 20:02:03 +0200
X-Gm-Features: AVHnY4LHZHy1lm3OKzcJY8KmXCJf6ikQmw3SViGMY2r54h91fcetCb2RjR_TECs
Message-ID: <CANiq72m_+CR1BikHHuAR2c-srGOtx0WPOF6wfDD9ASkbE5L8oQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] MAINTAINERS: make clearer about what's expected
 for "P" field
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 3:32=E2=80=AFPM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> extenal site. Make it clearer.

Typo.

> +          patches to the given subsystem. This is either an in-tree .rst=
 file,

Should this mention that the file should be within `Doc/`, due to the
requirement of the current system?

By the way, are we keeping the parser change to avoid breakage in case
someone does not follow this? Or should this be

    ideally, an in-tree .rst file within Documentation/ for best rendering

or similar?

(Also, if the parser is changed, then I am ambivalent about changing
the `P:` to GitHub, since the local file is available by definition,
but GitHub may not... But it is fine either way!)

Thanks!

Cheers,
Miguel
