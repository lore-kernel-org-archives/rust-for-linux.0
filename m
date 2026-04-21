Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE4C2472AA
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 09:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764959; cv=pass; b=EY0rq2lk9XTOwI1pgmwE44sAZ82Zf4PfYMQIGD2cRdNR02zrf7TOhPTOnlhInAqj9z1LEoD/HlFbpLCeYtpSr2rlHrn3QNBz9mmLG3DLJnEKFqoCqP+BvoqnO3cL1ElfWOFQUq6RB1/YayJ0TxPRoi92MtNTZx2rwvQzP/8BnZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764959; c=relaxed/simple;
	bh=YXy/1+WV5O4imXKlloP9TggNn7W+ZDz4Sg0HPiawucY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KAQE/fpFibxHlR1CGoRgkTdISGt+43J133d6f6CeErUs5VOgKh0bFiDN6E59/e7WwfPY7vdzRCCfmkcgrSLIlZJ4rj3aLe0aWkDqLwRIuVfn1yzAcFlZud+TP0iZliPi1xzG7LyrSZ09xGkrgr/kyckYxEKWAWv7prpL/g7Y0r0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtenQqU5; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtenQqU5"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c750eaf4cso127268c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 02:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776764957; cv=none;
        d=google.com; s=arc-20240605;
        b=VcuXdGkm2pDZ0HHh9LKbQKV2QUrT/U3izw5w4Q33Wkb8L+LPTvJ/SmcUyHynUTcZP1
         AgTS9KEBdaRWYgKrYSEIIhelNsA0B1fbX7dAeN6RrCrHdku4tHhtD5DcQMTvEgzAMbu1
         Ibs/zrqcJ9lhV3kfLvhjF4ouhetzX7thmrB/nmWOI42FYQl48/CZhK9vK4lV8PWEwYeQ
         SmmMOJT3Q37CpTE98izoxe22kSxpEv1TqAqjQUkggJ56ruakwx2TjWsbKW+lwXlXVCZt
         7x3l99DGnaQf4RJageN057/WPjqBzDkVAqCuwAeKM/NcgrIi4L6mIFeyKd0sZYjxEje0
         mWxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rcIuPWx+5GLeMldNKEJ++icQE8nEP0msdBF7TbQJvOg=;
        fh=HwdAXX21fzvwc2/5zX8cK2aeCszMciOAzsyjPAriF2s=;
        b=KUkRZcY+c/xqewjmu82FUqTA/gOg4sT9C8B9p6a9s8efJXw70dTtiYXpQ9/8AQf18s
         CoFPqakzOtcRFv3Q4ZrOxbpYvkkz5AOhE0GP0/051qyVPMrxjAIsdsQPm6Xoe9Nu/PX1
         pzm+UogVcR+KolTa6dTJ9z+okiO0O77iOrTt3juqQV8OuKKYPfcS79ON0ULjxTIwylft
         uPwT5FvbknEd90ssB1++wgtG6vX6dsIHbBiqAWlOfZIS+FnMEhaviF+e4pjQYDTa4W0X
         aiSC99RDkJgAyYIVfgZasRBinMrZXLB/5Pm25HlZmgiRCcDM2B3+G5AfQ6LFc/he/9+D
         aqiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776764957; x=1777369757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcIuPWx+5GLeMldNKEJ++icQE8nEP0msdBF7TbQJvOg=;
        b=NtenQqU5UoyWqKUh55GXGO+I7P9MK2dCEBtxRT+/zbb6SJlQGnC5Hl/j1s5BHEykrV
         G0X+w9weknHr0V9bKTSWWOBCa51d8qRT942FXES//nTW4elZpWt+gkjq+mcvDcZA3zAh
         mZeiZb7YHkeUmcmQI1llToU/qJsuS07qgpIRNnw4Zj4FPkzW+IWpdlwVyymMleEFrYdr
         OVcebvAwt0pFt775pgw9alto7NCVJgqpJtEtI2Ic+VEZMuSDoxIBrhxJCqYaUxL99sU4
         laSs0ZlCpk6j3Ui6LXc2dOgelqpQPWrCPhPssjn5Tx2ygzfzN9jGFDt/HDVnc2VrGk17
         zEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776764957; x=1777369757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rcIuPWx+5GLeMldNKEJ++icQE8nEP0msdBF7TbQJvOg=;
        b=l3K5SoeAY4UKiwODfVwhrRlCkmJAekZvnlU5X4/nO9bDTcw7eTj+D6UVx1NqYwSGhC
         T/s2TYABUF/nhMitTLThaQ0R9fxLLW5V9NiMRXmlMVYYTbAqPx5+k3vlI6ySvIcviXdZ
         8v+T/xKXiIx71/lbn2aEC5UwQLOCgWqqIBkYpRk70g7GcBd+0gkUvwpQLLGGrNXT/aUf
         AAb6e26XelT3dybbplCFLJ1ZkiigeT0oGRJLHPxKq2iUYscUHMZtPfAm1hd+uYM3ihUD
         lUuhxK5jsFm1JYa4d21itajncAysX/w3mrJnrf+rug6SMDUsHqOi/49C6NQKfIX/yoL7
         uUog==
X-Forwarded-Encrypted: i=1; AFNElJ8vXtMnSJRqPUtxD8JSrqx8Rc7iLPATlcY2BDFKx5pTUe6uE6kCk1OA/McHPbMi11b6XnIcVfPeh7k15hlKlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/05gYQzIRW2emLtWLPDYfkAdQ/TQP4QoZWhnLfR+imsx9uBB7
	Fvuu6Bd4sv+bKg/b1nrl5X4DdgEBDLOEWiJKgw3NVm0F64InX9jFfqwoihp+9Z+NtVE5hG5TbjG
	5zS2XzRxULVEWvrd3mV6dFTQ4bADipXU=
X-Gm-Gg: AeBDiev+4ABzRKm2Sq+g7GgzOJvngg+quL/rPXE9PFrwTieYZL6THrW9Dk7SLOCdIJg
	ugLW1xgMjd8f1bMQHONcGcWiT4RbwSoIU0X+JmWJXGXdB+AqpgapFldq7phT16HIGxf0ZF123+l
	iINqFIXDh9zXGFNc21QjfaQmrx6RWnuM+TaSP+e9ayQIaQznA/FhZta39ZGSxFqpVCrYObcAZ4m
	ZxnahqqLznzUn3MYiYBfff0cJ+4Ogpm6a9isJXsaBAyQqXQmEeDs0b5ukGTqVz5IZixiago4ZTJ
	vdCB5hTbziCakqaUhE4wYR8LGqvoWvY8u3w6rPY1ev117yxoTVdy46pJYBKaDIph9VxI8RgBHsG
	1mALqm82eq54K8828TlQb/hZaEvzvtwGmeymroGhkYvMv
X-Received: by 2002:a05:7301:128d:b0:2dd:5641:ef0 with SMTP id
 5a478bee46e88-2e47930f7b4mr4083612eec.6.1776764956745; Tue, 21 Apr 2026
 02:49:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419151327.26306-1-muchamadcoirulanwar@gmail.com> <20260420193320.22df4979@jic23-huawei>
In-Reply-To: <20260420193320.22df4979@jic23-huawei>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Apr 2026 11:49:03 +0200
X-Gm-Features: AQROBzDAAzftt6pbRJZemN5AYHUZ7t5X_PvujovlzEk77pQ5L8tWWRpcKeKc4uc
Message-ID: <CANiq72kKkRW7vwYKi38dvsM4HCtKGwzOF4ujMS-X=peGb_Vi3Q@mail.gmail.com>
Subject: Re: [RFC PATCH] [RFC PATCH] iio: position: rust: add initial AS5600 driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Frank Zago <frank@zago.net>, linux-iio@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 8:33=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> Do we have a rust equivalent of BIT()?  That tends to be easier to compar=
e with
> datasheets that don't use hex for this.

We do! Please see:

  https://rust.docs.kernel.org/kernel/bits/

Cheers,
Miguel
