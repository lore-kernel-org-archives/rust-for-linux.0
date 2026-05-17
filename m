Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0EA32D0E3
	for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 22:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779058398; cv=pass; b=hYRILmGS7CMA+m4pNx8hDqR3P8IXnhxwUbR2ENlhrgHsHom3s3JKaoQcuw8pvBy1CeqVZEe/3ReLceFtratw4hD7Q+3QMmHWMDOw9gOoxodI+joElq+5hIyAjzaainODeDtRyceEM+AUjfPn1DWJ3DMK3qoWp7y2BYFl9g/aDe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779058398; c=relaxed/simple;
	bh=2mM9qMmNlEv3GNaqlQTKQMssYkdCVk+G1o/Wo1ps+qQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVHiBoLzZ9Hskf97UcT+7FwLEFYDsj9YVKeqFgZpQ9fRlTnLVxU1GQ2UOG9K6oPROIKYH88CqXeLZfD1Aamxnq5yMWmfhJ1YPWiRmcpeFIjP6kjOLur8wsyuxYT2RW7aicl7kmtHvNdJvPyKObYyInC08XT458sufw587iMAqP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwabBkpr; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwabBkpr"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1351aa6418cso88624c88.2
        for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 15:53:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779058396; cv=none;
        d=google.com; s=arc-20240605;
        b=XTOvLB3/8FMBaCEJG9PTr4wvQi7JC/s5WWhx6untsTSmwxiOPMCMEGBJ+fCoW9qAyp
         yGuwwbeipWo0og+1Vy+428LmnK6hUPPN/pXzjlQDdItQsTvVwfj8CbMYXNmxKo1+0Ny8
         rcSo0MavwFXDCcfTGO2+eKSP9DEySKBnbXNJAGf2G0kUulj9MjSnkRXWdGbbluGZQkMT
         tTR+UcCqHFGnO/xSCqTohcPqgkByh4+hKvuFWsUORMc5BkSzqHd+OSnqE1rqpz5QLuAH
         beVECE0dLj/STDRRHoZpI/Qg7x95EfJrom5WKD27vAc7r6oq1AWUYglU/x0P3tqDPNGv
         oOeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2mM9qMmNlEv3GNaqlQTKQMssYkdCVk+G1o/Wo1ps+qQ=;
        fh=ciV2ZBWkebxCJrBy6qFlUwSssL3ycaU9biLwbRMeNUE=;
        b=Ml58GCdnNPvKvN6YlLC4ZxDxwMztAkDJDcG6mdpAQLPJOcy/UAmCQizVu2A2lQ/nmy
         Ot4KAgijKVEIrZtilKreOL2RzZqKT4TEB4bF415wQllRt5+INRakKndzlZ/ydbNI1llf
         8bokHYvGFuIdvUpauA4FbF196BuDkaYVFXWrjPYrr+xW5OWc502hzlkPCAPZRDYTNpFu
         J/rqRApfq5TAtxObfGqdgEjFbZPd+Q5hC9bJ8pwcFiqKN+8LYkWjeKzW3QMHwSzDHNms
         jvcHKgXFzX6ZLtxJluRwWBEjt+DKvSceWyriL8LZE7lRWyyfaPAnd08ppxX05Jy677rg
         Zv8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779058396; x=1779663196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mM9qMmNlEv3GNaqlQTKQMssYkdCVk+G1o/Wo1ps+qQ=;
        b=iwabBkpryb/tiBEc7gMiyMUXR7SMEltMlOWzBrIyXb4oN2UYBIhbDQzQswYwjPAuPm
         9WeeHJaJ1EElkDQKBgIe3aaOX+DHWKeU3YPUN2jNpsOW9SEAr2ewQ9DvwmEbnLck4Y/0
         o/uf128KMpUHIxl6tz4S7DLPlzrEyvQveSVONv/HKMdJ424Rn/cAAKUJp/FB8Jale6Tx
         QVDyNUnPNy+/EGl9iDFKd+s7T32L5Rk/7EFp2dBUjZb6L5S5gX4/XF5TXSGxcFxqL4GI
         F03R0NZ0ieZaZqntjJOIuya7GdrnHnQkTixsmivOmqzTCEmkRQrp5b2LtgiBX+SOsQ6w
         cyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779058396; x=1779663196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2mM9qMmNlEv3GNaqlQTKQMssYkdCVk+G1o/Wo1ps+qQ=;
        b=X7fdWqfvVPkOYtEfmreKj8EAlb7T0bhoyymPHqFvARFzRyuaJIfbjSBJObAemxQiaI
         AJWndmLorA3i9g6tUBpiAJSfX/6CTT3rtN8KsK7C8BcviLbxPVsLQ+tOt5GahL2eIlr9
         WJbj+LMBYEFhvr0DnGmcW+5VlWTkdaAY1EBDXq/5ppH30odcvwNWC6mHjczIERF3sDqF
         HbDnOOPYmW2sgwuI39EWo/4iEdCDsI0N2eYzkP75lwHfK8JriLbM7WkiU1NW4qOI774e
         t9y/3R/NDXISpyNSG7G/lUelUUXIRGeA+lCLdLwqNIllnETK3SzVhz2Tfa1KzMt3gKXN
         YaOA==
X-Forwarded-Encrypted: i=1; AFNElJ9AWfcwnYPg4rd36GLIU+0XTuazp1LKoFL9ww1tA1wYSuTofLxw6yh3yHPMghtsA5eFPLXeuIZuvMzCoNRHFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdcZsh2uyrYDX41r84XJ8Kaz5BzNHa1YhLziqgl+iaabJ0Yy25
	qh896BnYjM0LEAQQ3pT8xBM2z32IixYhar397Qt6jAe9Vih4qxSCv7bKPN9IuXbxWjj8qRC4fC2
	TsIP2JaOGklJ85TtkfS5r3PvG4ixTfaM=
X-Gm-Gg: Acq92OGSgf0l6sFON0Xj+XGAb1Xm+FKgeB5xfOEgsHWiJw16qoS1OJQ4LugqvArpYTg
	Jd7S/IAtoJy7a9YZZRuuiIH5+2PY284zWarJdkjq1OzJ5RnPHAAfNzidouKkp2cACYB3IpbGRt2
	aN7/KcA5UsKi+mhVSDDORm0MaN+5A355yTElk3kihn5IC7xgGRcD5YqBYEirl+m4q5E9XxhT6XC
	ag7r90NV03o9d9e5rKoHaidUKW38pYQtp6OP4wK6EoX/P+eLbdhnA5QebfAQFlbOVZqmCd+8jrv
	5ABKn5nyzwfp6gq49K/EEGGdzQ0Sipe5ddpDTTF3MUapXkQlgJ0GXsntJ6SDNasE53mUpO929EG
	KlRGru3G9CSs5/BBgtoHa0S4=
X-Received: by 2002:a05:7300:dc14:b0:2e6:b55a:76ca with SMTP id
 5a478bee46e88-30397b88952mr2469266eec.0.1779058396471; Sun, 17 May 2026
 15:53:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com> <ba7ec52f-c4e9-4588-9484-dc8280d55593@gmail.com>
 <CANiq72k_tXGSCd1BEg8XmTr+acZHfdRbcFOVD7=O6yAbmv-nHw@mail.gmail.com> <f77a4858-2bcf-4bfb-95e0-24a5d91e0862@gmail.com>
In-Reply-To: <f77a4858-2bcf-4bfb-95e0-24a5d91e0862@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 18 May 2026 00:53:03 +0200
X-Gm-Features: AVHnY4KBxDsmrWmWB1r_5d-YCkKw_SSUFyDdSueLkpNJn3Kc6QzpiTKf-tfUDfI
Message-ID: <CANiq72mGTehUWS2-MgukOKmwAn3fB63boFNqbNENse6B00M7Zg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
	jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	qingfang.deng@linux.dev, yann.prono@telecomnancy.net, ej@inai.de, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 10:25=E2=80=AFPM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> I was hoping for Linux to avoid the Rust trend of downloading tons
> of third-party crates, with all the supply-chain risks that entails.

I completely agree -- it is why I said a well-known, vetted set of crates.

That is, we should decide on e.g. a single CLI arg parser, a single
logger, etc. for most of our tools, and ideally they should be
well-known crates (ideally already trusted via use in the compiler
itself).

Moreover, they should be pinned with `--locked` or similar (like we
already recommend for `bindgen-cli`), so that we only ever use
something that matches the hash in the lockfile that would be
committed in the tree.

Cheers,
Miguel
