Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360E913B2B2
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711546306; cv=none; b=gtabNOH9pAzXrQEqjm3Njhc4lw+UKkvl77sIqesmtgCMUnjVYeItSqAR/G4xPsX/MKKOsrjbP13A1yVWU2RAkGzILm/sqXCKI65P9ib14rbOqtXmefqKlY7I8JxqV0qibDuWbgYDMqycXjy0HfdbZQ8bB3tUSARRjcSaUW3Mu+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711546306; c=relaxed/simple;
	bh=KLa9HND9XMxoUTfY1WBAdWlDKV7AEQUyDv5dh6zhcc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GwrGc4EyZ6QXo+RE0XRTvLryoXeYjew/m/VjNfD4Uc9VnjtghLcPd4zDitL56TjLf/yAK7SGLIGCGa9POlws8eInh9GeSnzv9EaQGX6a7W6Rl+WZar+fEL3pLAvrVtm1V5RPLvijgmFYGVlhn/RZrx9O5ntyEqEQpjihgAC0KYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkOaeIMG; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkOaeIMG"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6ea9a616cc4so2972333b3a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711546304; x=1712151104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLa9HND9XMxoUTfY1WBAdWlDKV7AEQUyDv5dh6zhcc0=;
        b=OkOaeIMGBdsBC4xsy4Zx2efwyURN1ZKUXvRhQfQHnlyopelUciTjyyfdU5kCLSSwvM
         Qwp1CvpttCvE+hbGQJKqEx0iOqhR3Mt9X8mprTJe4IRkLVMMlthC/iV0bRJUyNYgOCCV
         g/+iFz2wv3qEgxiL8/L4lL9XPr/IZIhHkYySk3A63sQHKO5Pif/g5DqQuyJOe4Xg61/8
         bfBCxd4eIU84u5VrfGvptn+WdrQvO5Cd8C9lPEmbKRWbLYslkOmrHg5Fzfo7K8GFtC8F
         ae59B9MNmajK7Z8R+tb0oSb6KAW7f79lRUGUsZwuPE46xrkSRNfjoaBt+ke3MIEUI/8V
         gmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711546304; x=1712151104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLa9HND9XMxoUTfY1WBAdWlDKV7AEQUyDv5dh6zhcc0=;
        b=sp4/G7q7b2kDSd3Iczy/ZD0idwRpZtTSgap+N+Hv0Ksojoizj/fHpomQchaVV0F8RB
         ljIyCcDAHvUosa3uOIZKOYrMwHNCqLHqvf2nrSslLw7C6l2NVpJ03jEZRf34SlBXPjpF
         GArdK+ylNKUMhJshIJuBUsTpFg4o8k/9Z0Hady8H5uOi6sgsCwRuNV+HY3thrdO01Vc2
         Di6KCIRocDxe4f8XpK5VlB14R6eGJvWYlzEPQsfLEf2T65GJMMWyC17xo0t9NzdEvst4
         +knHzAFjy5oERKyr1KqiVLv2R/RsfreGLSWsTxm+4BRtXjINInG83R1EjCxTBPvTIjjv
         j/rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBSva58ZIF7zi8mXrEXaZSO8XCzWIFrT0z7kzV7V1YZJPExwAKhYakvE2QCElNBKmVAK+w9k0HcgB47uD6C+WW+ZW5pCFnwlIzqaQjmW8=
X-Gm-Message-State: AOJu0YwbvmaustgbCSrNwQuq/uxDiIXDb6KGHLFbd6BebLp75SWUk4lD
	V5VCUaIhSYmcUR24tmg5DKOUWLubrIIIdrGuaL1AhuaGAmL/N8vH0R1PoOWMIWW93moC6+S9s5H
	dG5iJBJfx06Pc9D+Z0NdoLuSLUKI=
X-Google-Smtp-Source: AGHT+IGrwtZDjHS5kyaqYYB0ZPUMxAvHFV5Y9KTa3T92KNEXD6c7UJbhMW37Najye1kADHdgZSYgkE3ZFdQ8x2zqxtQ=
X-Received: by 2002:a05:6a21:168d:b0:1a3:6aba:e9fb with SMTP id
 np13-20020a056a21168d00b001a36abae9fbmr1092038pzb.25.1711546304433; Wed, 27
 Mar 2024 06:31:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325174743.95542-1-dakr@redhat.com> <CANeycqq=qETyG5ZwmKo0-iLehWeGVf_WqLf=OK3D1LN2yzYbCg@mail.gmail.com>
 <ZgQCF3jp73n4BTs4@pollux>
In-Reply-To: <ZgQCF3jp73n4BTs4@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 Mar 2024 14:31:16 +0100
Message-ID: <CANiq72=s576RhVFCK0+BHSY7Z7gsef9ddh586zrEDhQSoXAXwA@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] [RFC] Rust device / driver abstractions
To: Danilo Krummrich <dakr@redhat.com>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com, 
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 12:25=E2=80=AFPM Danilo Krummrich <dakr@redhat.com>=
 wrote:
>
> In [2] I was asking about the preferred way to get some immediate discuss=
ions
> going. When I proposed to send links to the corresponding branches to the
> mailing list or send a patch series (for rust-device I ended up doing bot=
h) I
> did not hear any contradiction.

Sending patch series directly is something you/Philipp proposed. And
that is fine -- nobody can tell you to not send patches. But, from
experience, we know sometimes it is best to get in the same page
and/or room.

I specifically suggested reporting your progress in Zulip and/or the
mailing lists for that reason, and because lifting code from other
places like `rust` generally requires revisiting it first like Wedson
mentioned.

In addition, we always suggest pinging directly the original authors
too before submitting patches from them, to avoid this kind of thing.

Moreover, I would recommend tagging more prominently the patches as
staging/RFC/... (i.e. each of them). I know you have "RFC" in the
cover letter one, but I am aware of at least one person that did not
realize initially the patches were actually RFC. In addition, I would
suggest that the cover letter explains where and how the patches where
lifted from, so that people are aware of their state etc. I would also
recommend, for clarity and even if out of deference only, to mention
whether the authors of the patches you are carrying were aware of this
submission (i.e. if you explicitly heard from them).

Finally, it is not always possible "to get some immediate discussions
going" (i.e. emphasis on "immediate"). It all depends on who / which
subsystem / etc. you are dealing with.

Cheers,
Miguel
