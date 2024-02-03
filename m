Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B235235
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Feb 2024 18:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706985083; cv=none; b=XSLodPxYMqMv73yiTj5RC+4DQ7+v0M9f57d9Edw1XPTfdRAj7yi7lqTT/MAUkLYgwt/mZuWx+Ffnaeyn/KYVkYkgwC9TR8tslDpLHNSXIsKARwatFJmDwWjKF1fvoh/XPYy5YFWJjeRr2BjA+PNNQ2gLiEcMBnKRahiS1MfJ664=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706985083; c=relaxed/simple;
	bh=HbVWmQ6LUrnu1i5zXEMUcLTpa0DeG4x4y+Vk1WJazzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HkylnGsEagfFOCyguZhAyEBfm+jBhu6jHV0zJpEAR3Zgm1PPFRLKTxVV5l+Nek5BWhNaMg9y/qiGS3hXo7+BIjMKIh55Ve2NXWTxG5VzER9giNSq1DbZFN9p6kzdEF5oneBkcenImn9ycEEyMMG852931SdSKubQnK7fXVgOMDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZ2hnPDB; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZ2hnPDB"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6041779e75eso32412517b3.3
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Feb 2024 10:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706985080; x=1707589880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJFlJx1vuiOANycszSWTifITr/z6WazMo2nxTdqKk3M=;
        b=eZ2hnPDBoytHSigYY03UBitJb4tmVKAhmjKP5AJLh8rVzdgc2a+ahdYD8NbHsn05xd
         oKmeYF4hun+n0EtnQ9wLzy5I411VbH2+Q4JAs6Jo7BmjMpll8w8B6fvr1YDT/M98qKQA
         19jOXTaG5RTaMMHuv60H5cwwja31B1MK3zEypiWqOMiVtnadAQEng5/Z40b1RAQ6hvW3
         hpyAtUR30gOqNhNGaof/oo2KreauEpmTfCkt+0di/P21Po8ER/ktB7m01pbGd0azBbQY
         /JcA0Hwb6t2+mm9jhuBn+f99lCMuZm+RYvwZh01bL+SS7tq24tmWslpmGidEd0QR7TIP
         W/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706985080; x=1707589880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJFlJx1vuiOANycszSWTifITr/z6WazMo2nxTdqKk3M=;
        b=Z3iDzHoVsms6is4MJotJFAcpH4l71ngMSCKg8DVDy65VdwmOZQIBTuSKDPyfVi8aLw
         tlv5mxqRlelWoORXDADbv79wkg51NLeMj1uSZsrRAuiH15X4fIgj1D+vVDuIztH0wVL1
         DiEdcdHU+SyY25qdFH2ImOrhKtt0oxIe3g0CwOYKK8DAPNvRv8/7R2HgG8yejIbuEhdb
         R0BaXhGQlKzSKa3N/qqc/txMK2NgskfFH0KWPb33Dy9eKGzhjL7JGJJhJaGfQnwm+y6r
         hdyVNRLdiHlJxIb6iRScFbd8rQFxnWJcI5oD4LjtmY3vgjjf8KITecCZf+skmKIePE8H
         UyfQ==
X-Gm-Message-State: AOJu0YywRDY0kkmvLeA3NbD76hApskRBY+sbYGZ5hKQ3rt74GwvKwTk2
	lWWxHat82uLx5H5hu7xL9CFej2yWeWLNuEAw4BhoU1idfJcU2dFxuE4ORGgUmQAFvXA5ydO38dx
	NVGWvZkKURJ/Yor/Pfa+lRNDMxOg=
X-Google-Smtp-Source: AGHT+IEH8W1F6W0oQ0p5BwgfZRH59UstnXBNGwZ7Q0ECBAQF/+XswlV8l/TaDRJVwlBb3NUcBUK6PrT2ITlr+wXPxZs=
X-Received: by 2002:a81:9bd1:0:b0:5fb:da77:af07 with SMTP id
 s200-20020a819bd1000000b005fbda77af07mr5709239ywg.32.1706985080533; Sat, 03
 Feb 2024 10:31:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <929f47e0-8aca-471d-b54f-26908321999b@redhat.com>
 <CGME20240201185509eucas1p253299bc51f92d6be1041765c804246ad@eucas1p2.samsung.com>
 <CANiq72=zcLXOzYbLjNz08s_xN=oC1ZaePnsRigMJLzQONUa5xA@mail.gmail.com> <87o7cztais.fsf@samsung.com>
In-Reply-To: <87o7cztais.fsf@samsung.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 3 Feb 2024 19:31:09 +0100
Message-ID: <CANiq72mSVg62nS_Qk+7o74vzcMdt5Vx5COWEfnu+tpj1_2JzEA@mail.gmail.com>
Subject: Re: RfL branch for PCI bindings
To: Andreas Hindborg <a.hindborg@samsung.com>
Cc: Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Philipp Stanner <pstanner@redhat.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Greg KH <greg@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 11:40=E2=80=AFAM Andreas Hindborg <a.hindborg@samsun=
g.com> wrote:
>
> We could start out in one configuration and then change later down the
> road if it becomes clear that another config would be more beneficial.

+1, let's start with what we discussed -- we can change the
arrangement whenever needed.

I have created the branch in our repository:

    https://github.com/Rust-for-Linux/linux/tree/rust-pci

And added it to the website:

    https://rust-for-linux.com/branches#rust-pci

Please feel free to push to the branch as you see fit -- thanks Andreas!

Cheers,
Miguel
