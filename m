Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0128E26D4F9
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Apr 2026 15:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775921079; cv=pass; b=EBBmrJ4Pf+d7Ff8I8dEtKRJAo0C9tmIdKdBpQOV08x3jGQ8lsF8e9DroLZnrqVM7GGKuuv+iI8cfAWU+8y07DVaXflJ6oGFT/dJsyrSvANOnKGT3o5Yhze2KUkfG2CsFzApuhIAvHr3osfWu2CDqcDozObLTM5QygdM58vAOpmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775921079; c=relaxed/simple;
	bh=2QSXQAMTXKpa2OmPzggX/mokcAINUoDLvl5DYs2P/qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sg+zdUKnm4ouJVv3XumOs84Mt1Z/H2RlT+c9eA8vSG4SP/+UNVeUutFCbEWBnCvYxFaWrMcO501kMEYotFqdEwokW4Jb6HF2k7iQC+OlJHeTjTaC1rn5DM+F7ijFTsAKotJgdqJKD/gQjZukrMJiyYk6+vmfG1CJFNiWfqKvOmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAzueJLC; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAzueJLC"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2d44ef4695cso223259eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Apr 2026 08:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775921077; cv=none;
        d=google.com; s=arc-20240605;
        b=Qa1Ck4M8MHCJAY3E64x9thDjyvlEzZmjpMILua+X09bbbV3fS0gyTjZiNJXyd9BA0n
         YgNj6sTBeods4IPKuXG46dYtbxeQ+QSlNBKOWjUyGUWIdYqpEARnfN+Vdo/0OYCDWyMi
         r5Wq6rzI+mtUI4QE0IMerl92voumHSkCYnHEgGdcS7lh1Ho2f2Fw3HNIyo/0vAglE7Pb
         CYtc4nRq+yJ3AS9VhSOgjcCq59m97rB0Wr90tprz5IaorwF9vQXinhiv8Rw+8uHB6wzR
         lyD9szT2itJf8n4QZ8ddmTluOLTwD4DTd8VvFHl5RgdxMVymHi6Y+XtIZVTTZ0kAVZjv
         4n6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q5QPtqfJSB3xa8wkxTi1O7PIasEBFRAyVFsKCQ5h6Ww=;
        fh=7qpQqdHC8BCVc1hFDxYJ96LSwpu0he9B7vTSkoxiY9c=;
        b=B5Mkk9bXKG03VZHnpKEZZteD3RouBleI+COEHce5w1cURDqJ55HYsZO2j13raovutX
         k/Pkv35Bpef1h/EpMuHsgo6AM8v9Q3B/05HgEuOYx8JxZm5Gy5xbkndzwBiP7KLM6W/u
         2xBxMpt8/h5bRlpHf2b/YQlyw7yrzhdtHguu2tIo/ok2jsTEPjrDLaaH53wvvHzkdwet
         w4TDcvsk+HsHeOkCYhQ+qOk9rQl2T3h8KYXi89xH2zzDeZ0S89fY7IaFu66nUFNUCwVN
         DguVb9p3WcG3//+NUEhFoVA7ijUQqZonl3i7c1uwvAYhLIcvo4db2ilL7GgHmxG9JiM7
         RfMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775921077; x=1776525877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5QPtqfJSB3xa8wkxTi1O7PIasEBFRAyVFsKCQ5h6Ww=;
        b=lAzueJLCdfu+N6EX5OVLe6qGVltWswq8JWSx7rq63zpDGgGN9MkBo9OmNDzCxyuGEL
         uQf+XrWEkFPoaW9IpQis8QMnCzvPdX1vPM2lNaMXzuwwYHsVLFAIEfeB+sYXrnjwPYBi
         /QBCD5zUQY/RLlghpVnf8ssOGRJVn7idl2frlER1FhcGmqSb1tM6vmm7ZMGqyqSUYuD2
         zL/YZssTh6F+Q0Qqs73t/kyfSRt3p4Pn72WeHdgkoyp5w8gDvGpGxVGa0/Hq+FX02AMf
         GaB7L8I+N4PAcfIBmZC8rFdHnA97t2lCo3jEJdIypuUaCl0hGuQeHEkvd+PrTEGHXP6K
         LyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775921077; x=1776525877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q5QPtqfJSB3xa8wkxTi1O7PIasEBFRAyVFsKCQ5h6Ww=;
        b=KAI5PrdxEgOgSON54MeXCMYYUjh87w8diCCLEzpAtsA+7RIKIYBBBnxTH9pXM1WkV3
         EIyVeTCVAwaVsXwrrBI1e+gZc3Ef6jBHKbRXG+1k6TasenlArE0LKhu428IO9hat/ehL
         qftuKL/QI606+Gy/RbTicLdB4LdGCpS6T1IBxc73Ml8AHo7pPWIcSnkq57musbqA3Osm
         n17rMyc/9fNg2bQLNsqcETG9gHuZrNpXaNHmaj2pjquEFyOmn79b3Q8KMpFcR+ch64sf
         NTyR3quE6eEHjP7Es6ZPHPSuGrXVLFgTLRb2rl+bZy/e6V3PL/Npt57R7oksqU2JEKw2
         1IHg==
X-Forwarded-Encrypted: i=1; AJvYcCXiGVfG8ImUy+W2mzAVYl8572U1SrHCK+0dpaCwNhTB8mxFtkaRc0pbIb3fNmTmdVgd/GsvUkUfEGAPEnPTzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ54mt3mFDZS0lpCNElTHPUVRwO6EeR8w7xd9p6RyoTF7SxCBD
	tJ7PfLcpA3W265g1/90vejn+mSwXOek4hWR8IVvLIUI52d4wkZVoB+ssH3xBzroFojREOclKjpo
	plk/jat/lHWuwyjpLRo/aYnPV9cno8d8=
X-Gm-Gg: AeBDieuv6KKwwzc3XJRXpQJDSKb8J37yV/2ogz2Dwcq2RDKhsu7akr91nbkcC4gxcsY
	/SMO2xYNoonHnhltH+vseoDA1oZ56ZahN4bhodP70nSNIR+iB746/6qetQQvcFR9Pmn4r3xob6i
	s2mpBzXEoYx3sfKdfpyc0UQNDguBMHX/ZBqaFqNd4QXM3iEPd5ZDa28ZhSr+f76BQEXCsae8UN5
	7zAX4px+HHk3Q2YlhiCoqi0r+KviEf8YhAIatLJfO5Q1kyZ61lwHxolENtzy1GVPZLtvIQkwcqi
	d1wzGTcbhseuQMq3W5RzaxKnOOpordyx5y+Set1SWuStfHnM9HWCfNJndiqQKxGBfzzpc66aLHa
	prQdVG/IxIMI8Z808COF4N1Y=
X-Received: by 2002:a05:7300:3246:b0:2c6:2bac:8af with SMTP id
 5a478bee46e88-2d589cb5e62mr1897751eec.6.1775921076968; Sat, 11 Apr 2026
 08:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1f4fa7f2.351a.19d7cc91931.Coremail.syscaller@163.com>
In-Reply-To: <1f4fa7f2.351a.19d7cc91931.Coremail.syscaller@163.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 11 Apr 2026 17:24:24 +0200
X-Gm-Features: AQROBzBPl-Klt1WPGgyvHIuqKru_UOR7llwZxHh-sF9g9hJtkLATaR8JFT1mHyc
Message-ID: <CANiq72kiV+gBLzLLGPZBmtAM9c9GM=exK6-qkficZOB1fs=fBg@mail.gmail.com>
Subject: Re: [BUG] android: rust binder: sleeping function called from invalid
 context in deferred_release()
To: syscaller <syscaller@163.com>, Matthew Maurer <mmaurer@google.com>
Cc: gregkh@linuxfoundation.org, aliceryhl@google.com, arve@android.com, 
	tkjos@android.com, brauner@kernel.org, cmllamas@google.com, ojeda@kernel.org, 
	boqun@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 3:45=E2=80=AFPM syscaller <syscaller@163.com> wrote=
:
>
> I believe the warning is caused by the following code in
> drivers/android/binder/process.rs:
>
>   while let Some(delivered_death) =3D
>       { self.inner.lock().delivered_deaths.pop_front() } {
>       drop(delivered_death);
>   }
>
> The temporary SpinLockGuard returned by self.inner.lock() appears to live
> across the whole while-let statement, including the loop body. As a resul=
t,
> drop(delivered_death) runs while Process::inner is still held.

Please take a look at:

  https://lore.kernel.org/rust-for-linux/20260403-lockhold-v1-1-c332b56cd8a=
e@google.com/

Thanks for the report!

Cheers,
Miguel
