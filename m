Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22F86A8CD
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Feb 2024 22:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707343396; cv=none; b=tCPBkeRdw7+UY1pyQmBkZ/U5s/BDcRHA+hCSr01OWeY3SsJMHsi/ec6nLMjUotKiaI7uZuAaCoqKsAX8Feg7eRG1LplaoJVI8qwvKFD9IU/3NSfs+xpUy0rOk3T7dWvgH/wQOkAA2KxiNlUPh4cIr7Lvl4ULIBErhVsQEjDe0SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707343396; c=relaxed/simple;
	bh=6mR7rcxm/ppgrI/ca2S5GPl+qYGE+n9Pmkat0YhA9dA=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=MjZUeam0p3vet1XiG4YXm440yMjlgWberNG6pwxAQV8CMwopz82ossUuQODdC3ikunDMyTPsbYvWcYaOdqeroM+TMaYc1TcizvO0GyUJuhl03GEzutwGTqcCjITbAc8SlxuvUncX5k5ua7Hed9b/EV7bmqGBetcr3K6Hmkwv2SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=ovm8eGmt; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="ovm8eGmt"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5116588189aso2029448e87.1
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Feb 2024 14:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1707343390; x=1707948190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YbG+4MV+3AD7yeqF8k/LRsUO0hQvE+VAJ0nYQJGUoQ=;
        b=ovm8eGmtNLUsgRF2r4d7yeTgk5iBSgk+kAT/1PQAt5fP0Z6yUhTg2OupNqGtO6Q4hf
         uQc1kYpy8qyfsTPf5xpaIzoP7bKUifDejEq31+Cu8/AGDbEvCBvLUAaxl946aauYw/p8
         9FyHNLSuZ6o37243+O//ogO+hf44JrlfMOVH/UaI6h3wB0twaXGgNzWplIQliPPdQplG
         9PC9oB4ZvK+J9gEiOxW/fF0qS4xfyvhi6NODL9Qgrn1vtL52qsi004l/OvvBCsLBvsvj
         Ycgeu4vnb5o07TvNw1FEFVnEQEKJdAfJmOAR9L9HCNfSqSd/ejcqF0yg2u8mImR/Li4d
         hhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707343390; x=1707948190;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+YbG+4MV+3AD7yeqF8k/LRsUO0hQvE+VAJ0nYQJGUoQ=;
        b=Q0OMy7iroJCbnMy/EYWS0+7Qv1Sp+wBbdI91MZJbBtX5tuzqaPy2cQwkpG1YWPJlaJ
         QAj/6Xm2VLdgV3yPHY524l099IrkM1KNew8mctDvlPBI2wiBzRaiPTSWvIm69NmbBgND
         CoRLbZSz0YCa48GGd0B2jcf+1svK3DtZ+AbKtUiMOYPNKDcUzBGPYze7rYvo5kRZV9Ol
         BR3U9ad/J5Kl/TxrcAVLXv0Sn1R3ZTVf3pnMM6aoxcVPgSFIHZgXWshCJLWZ0JVmx4eV
         +mVYrk6KadVEmHGY/jR3o06Moux3XV3O7dEEqO79rRavOMBlEGOfyid7fPyhHGtrMn36
         j4tg==
X-Forwarded-Encrypted: i=1; AJvYcCUu7tT1zYWJykBE+o3Aze1C7GynbYgiy87N53dhcs+81qxHInGVxb/2qfhPChQt/vyBvyAvLYfjrUg8flyoeIuy4/lm2vmfrnN3ax/HFFs=
X-Gm-Message-State: AOJu0YxxP+a0MCsnN/lWaU5UphidCNyjBEYExIELSgWZvOGdOzdD9ckj
	puXcMDMgyV9WxCFaLEIN0s0/pQ66CmNqzLBovE9MABnMqdltgBGzucf49oECLpzgxFeMiI79rOD
	u
X-Google-Smtp-Source: AGHT+IG9pCLI6NQk1z3wiTaVJRTBeGB2sX3LvSTostgeSYxWDqARGRpRr7Lux8ruPGSZ5duKbJfQXQ==
X-Received: by 2002:a05:6512:3d0a:b0:50e:6e7a:fabd with SMTP id d10-20020a0565123d0a00b0050e6e7afabdmr6730145lfv.1.1707343390242;
        Wed, 07 Feb 2024 14:03:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXi7xEj5eJt3BGTGYZrhRy0EjjQhi4AK/Twa9xxtuCxUmc3mlqxw++2UhpJJSAgfpoUrAMRkJdpEoOjvov3ynAoJh2pdrGvAGBNg1oF3rnHBzomD1bv1VK+GfvORXBLQTOVEjhRhFkLMSxRC8RS+js3bu5nEEpqdAk/3u19J2dr+l8iO4U0
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id l10-20020a1709065a8a00b00a368903fc98sm1176482ejq.136.2024.02.07.14.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 14:03:09 -0800 (PST)
References: <929f47e0-8aca-471d-b54f-26908321999b@redhat.com>
 <CGME20240201185509eucas1p253299bc51f92d6be1041765c804246ad@eucas1p2.samsung.com>
 <CANiq72=zcLXOzYbLjNz08s_xN=oC1ZaePnsRigMJLzQONUa5xA@mail.gmail.com>
 <87o7cztais.fsf@samsung.com>
 <CANiq72mSVg62nS_Qk+7o74vzcMdt5Vx5COWEfnu+tpj1_2JzEA@mail.gmail.com>
 <f60af824-633d-4e9d-b20e-7fb9911d9e0e@redhat.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Danilo Krummrich <dakr@redhat.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda
 <ojeda@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Greg KH
 <greg@kroah.com>
Subject: Re: RfL branch for PCI bindings
Date: Wed, 07 Feb 2024 22:54:43 +0100
In-reply-to: <f60af824-633d-4e9d-b20e-7fb9911d9e0e@redhat.com>
Message-ID: <87zfwcrkyx.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Danilo Krummrich <dakr@redhat.com> writes:

> On 2/3/24 19:31, Miguel Ojeda wrote:
>> On Fri, Feb 2, 2024 at 11:40=E2=80=AFAM Andreas Hindborg <a.hindborg@sam=
sung.com> wrote:
>>>
>>> We could start out in one configuration and then change later down the
>>> road if it becomes clear that another config would be more beneficial.
>> +1, let's start with what we discussed -- we can change the
>> arrangement whenever needed.
>> I have created the branch in our repository:
>>      https://github.com/Rust-for-Linux/linux/tree/rust-pci
>> And added it to the website:
>>      https://rust-for-linux.com/branches#rust-pci
>> Please feel free to push to the branch as you see fit -- thanks Andreas!
>
> +1
>
> And thanks Miguel for setting things up!
>
> @Andreas: Please let us know once you pushed the patches.

They are up. Please not that they are not high quality, lots of TODO and
missing safety comments.

NVMe rebased on top is here [1]

Let me know if you have any questions!

Best regards,
Andreas


[1] https://github.com/metaspace/linux/tree/rnvme-for-6.8

