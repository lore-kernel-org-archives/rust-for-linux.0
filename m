Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E7B28C866
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 19:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770925888; cv=pass; b=GvXNMU6O3HE+wjO739wdrUorL8UzxGd4d1TB+b5PyoIfUtawkQXe5bAtH8wwXr8RN/AMyGjFecPb1fzAdEcw5OzGqDofUecQtEy4mtyeYGURQujyGKJoWo6V2FXVLWqBSDkTtdCXrwx0iKPY7O2qWb4S9jWcBbloKjYbKOKhjEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770925888; c=relaxed/simple;
	bh=M/7ignu8o6Z+KEOnTMNWjMhlF3hUKJ1UshFUm0MxyGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=df/fInMbXmlG5rohivCFeiB6KbC6qwxsMLkC8I+iV/f6J8nU20dlXXPNDtFZLTI1SubqOgnQoPQVxT+M1d61Uym9zKsT/hpAAZESFBw1GndiPec2qYa5hNAhseVdHMFwQoh7hHj1HNVFCnPhckUs224hxbP1m1zWMN+BDSwSZYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eN/AHAK9; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eN/AHAK9"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ba716126f5so22383eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 11:51:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770925886; cv=none;
        d=google.com; s=arc-20240605;
        b=YYusu5+xsfPW+8IXbtq3nFQgvb8ZRaznL+ZjGw+UWet0UXO+EFzI0GfEUgF0U1IRdA
         xoJVLHsmlSIqyOzx1Wq+HL5Qh4UvlRiGVUdbJoEt+rdr6+XAK3WrO22n5xYpikfNl+ap
         ydD6DxnAQkQI2YplpThHzfxrzKqO8CejrzM60RqZm/ioKWJAVdh8IXtDsaipRZmcN0zt
         xduTg5w9uIRCKb/bfNV+3Xq6NoliqRYNHchvLBWniNxMs7fvrP1o1lYYCGK7u9GrcL3o
         kan+9b3S9azJhEgB/F8pdd3JLFhSACqflwWQvbqdiGcDBMlcsZLPacV8w4n3vzc28K+w
         GbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M/7ignu8o6Z+KEOnTMNWjMhlF3hUKJ1UshFUm0MxyGU=;
        fh=QPWelDMxbfq17g0lpxcElh6C0Dtjte7CyF7jnvwuCT4=;
        b=BGTOR/5H1lpJX8UO7hWnpbA9PUPNd5UwrDPw8f/llOzJ6wuc41CHPJyh2eDrAtKEcr
         uQIlxdFeceVRTpApt6YVELWc4k2DirGSTlcmkI1FXU1r/LWZj8NGgkj4+wfllV+ifjNH
         6iRVHLF7GsyDVx2qEHSe0Y/vD2jytH/SrNJW2k5ZtwMrhvJu2w29ByUzEdLa3lOVBETB
         vz446ISCvoq4+zqDafmDKy6kNZY8XCjcft7wnT6JQlXxusLIebsHaCkSzHRkY6RQCjfZ
         KS5JDGQJiuIpreoVD5iiTmWDpogSI0ejeoFMZ0m8AOh0SCPLsTDhEdS4L1ELZaesPNG8
         fZFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770925886; x=1771530686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/7ignu8o6Z+KEOnTMNWjMhlF3hUKJ1UshFUm0MxyGU=;
        b=eN/AHAK9zOQgRfatKmG7vpD0mW1pkEdqbnFDxAK9v6DOE+VI4s6FGx/5/DN8GpQOqi
         7Jq00yUM0LivVaTsEyp2JKjO6LRipZmrc5thKjibMFaB95GkKesVellpk9UeXQqvohZH
         IF7+F5dVGLNWSyDc3OF0wGRPZBULLrRfEZAlbmQVV7sSaUG4xjJIVvIODsmKOdCveHlU
         eNSavbMDlKq/DX0mktJX1UBT5SRpHUYNYFb424rQMq0qPxznePVMUlr7H+O6P5mKVs1Y
         aWhSSWJAKiN+yrXpzhQrZ2yO710GdqMTGSFrkzuk1+ckyhpusUIg3OZAvEaB8qH7H1OG
         Wb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770925886; x=1771530686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M/7ignu8o6Z+KEOnTMNWjMhlF3hUKJ1UshFUm0MxyGU=;
        b=qoh+bYvKDqnb172UGB/eOdxgw8Y7H3rJzIcgFFa22A+hTy5GERZ6xwZPT9VQVTGZ0O
         po+A8Eugt6nOt33xjnH3+wJfTqgHyzVf0uQtzz1iDiZ/HBa2RU77XDVfjWhGRn0mpKFo
         NqtxsEh/u2S7mrdjNmgnhCLVwkbBu4j22ZVn/ekXmxyi19BJ/HDmZ7QS9z4j8JDIL/ew
         f2i5OOifA3/y7Axp7ljgp2XxNmtQx+pIPmEPolEf7Vpgnoe8deWq6MVdpz+VoJSweVnG
         4WtChjb9f90pRYvA09/1iz9HyBYr671B2FWtqNicE7YeCawoH9UiXtfAKrFxHjEAnVfl
         So3A==
X-Forwarded-Encrypted: i=1; AJvYcCW5GLO5hforMYOTCZYxcOHpOmvDONDa+EwkIY7OvsvFgmBjyzWXuQXMIYwAUIZrnQ4UsYNtcEfkPMGC+rpbQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcfScZUDjgfhzEZlmyfQtyjhf5Ttyhlp79TIdbA/IVCWziIXnu
	euCMN5U+pTCRyBlGVoAawyDSh0oeudSbbJhHJ7hNx9E2PVQt+suNVRKmrzT/XswTORM7jFU/X09
	sfYYbY6YuZAYaw1HD2xN8656tpiQ47oo=
X-Gm-Gg: AZuq6aJ9HBy9Opu5dJqPQx3hdSoIWWq+xnV9wgw2UDIh8fmb5ZYyXVVu7CqI7CeeITS
	mgIgttgKlzWrh4a57eJFu/Qwf/Y1HrUUKtKC/Gyh4yN7+LEmb75y8gmHEs5jBqPcHexKT21VCEk
	VfD9n8DsIso/Wnu4Lv3QDIWvmilPJXqi8jiALZ9kHCNTHLxFsQERCV5lrmVmwQqBj5jU3w7Hd6J
	AURI97Y5969l02RnmuYpSC2QPTo51GGVOoUZSf3UwOly3ZpKDU6Kk2+AvS1EGo5jSf7ld4tzkTW
	S7K1hHJ/KgesucI/bJs50ba3mxgHROxWVXDFptB6zsOBjOgJD5K4013NBUdBMs9Cl0AHIk+Xeip
	X09k2NREftxO0gnYVOXLAdWdR
X-Received: by 2002:a05:7300:cc10:b0:2ba:7783:d1d1 with SMTP id
 5a478bee46e88-2bab9fec7aemr19131eec.2.1770925886342; Thu, 12 Feb 2026
 11:51:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212125427.122362-1-alizainuimx@gmail.com>
 <CANiq72nQKFVVtGs1Ra22D+xqj+f1Xtc-2Xm9aitOuhQ-31o=DA@mail.gmail.com> <CAGjWTa0VznxHuq_tQ=dLusxOUZtngZgsCbmdC=7xeVtM90ypSg@mail.gmail.com>
In-Reply-To: <CAGjWTa0VznxHuq_tQ=dLusxOUZtngZgsCbmdC=7xeVtM90ypSg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Feb 2026 20:51:14 +0100
X-Gm-Features: AZwV_QgKILXnI7xUfqe8W5nrkdI8T8g4YXsQyS8fwxaHXH94CEuk0RMOiTEZVNU
Message-ID: <CANiq72kCk6uyo6R_0Jps0ftCoBy=mvqN1OXr_7_i8S-eC-SdkQ@mail.gmail.com>
Subject: Re: [PATCH] rust: print: Document SAFETY invariants in
 rust_fmt_argument and call_printk
To: Ali Zain <alizainuimx@gmail.com>
Cc: Shivendra Sharma <shivendra02467@gmail.com>, 
	Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>, rust-for-linux@vger.kernel.org, 
	ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 2:56=E2=80=AFPM Ali Zain <alizainuimx@gmail.com> wr=
ote:
>
> Thanks for the pointer.
>
> I see that this topic is already being addressed in the v2 thread.
> I will follow that discussion and focus on other Rust areas.
>
> Appreciate the guidance.

You're welcome, and welcome to the kernel too! :)

(By the way, if you send patches, please send it to all the names in
the relevant entries in the `MAINTAINERS` file, e.g. here those in the
"RUST" entry -- you can use `scripts/get_maintainer.pl` to help with
that)

Cheers,
Miguel
