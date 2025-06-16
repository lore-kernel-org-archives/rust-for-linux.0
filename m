Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2C61D54D8
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 19:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750102440; cv=none; b=mb7EdAgms7LJYZ0ZY8O5HKgE3NCsXIU+eZLrgf6l1aqfpkXy+0pf5OnwUtSAZ8IRbUq8Sa1LX1oOyxHR/NLYpMRld9oHki1RhnwVG90yiluXGklSA/YNetuAN01wQ6S1PDOTWn6oh6FSLdFZJiEICzW4L9+ieSmr23cx/rQ8aJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750102440; c=relaxed/simple;
	bh=uCedvSrgAICW/jw+EN4TMS/9a2h0bxIMv+L0P4+6084=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XTx2RQ+ElZUAotBxjWxYOozsACBzr1FIgqx3B5dmU/nXt8xvvzj8XdC0+9gdZW1yHv/OFkoRwjaKIXmMc1HJmA38c3sW5JuYC9fUYDvYjN/kTSCFPokNbeCEqamZRiAppRSPY9aKpsaKJCeGHmk0OMfN5ZzvJgBVHFgLXPj+mbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkmwoO9r; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkmwoO9r"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-313067339e9so836731a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 12:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750102438; x=1750707238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCedvSrgAICW/jw+EN4TMS/9a2h0bxIMv+L0P4+6084=;
        b=jkmwoO9rc+X5BH/7oi4m7my1F0NzoNIf3mVRVV8B+L+On1Fy/Pa6E7dbLzyhoauVWK
         DYDD5/NKL71iGK0udao+Z8GUzlFjzp8uz+49LmT4TkEQ1isK5eKbNraZU4tX4Yt57Hi9
         XAQq+x0S45DsItZnuQmgBczC9tYlQ9r37F4vE4by9jRhTD/YZdmxtBPhARTFTRknuFUr
         PI+kvmqJ6m192kgYT+YNj7JDvaKAs8zar9ObivrFKZZpWJ3TLYXJzAMRCaOg6EZ2gpkT
         6SGI5g+QwhC2zbUYufeGAbVaRdbOr1urlRLfsvjOsBJ6rw+IuO2BhZ1u+Z56AE1iL07j
         WsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750102438; x=1750707238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCedvSrgAICW/jw+EN4TMS/9a2h0bxIMv+L0P4+6084=;
        b=qLfe5VXoYPqIitNVDAlo59ooiRTC8rTrV5RoUmqu4blMu6Os0NpucP2W6Igx56dzAI
         WveG/JTky09ZxxANpoJ3WFyX/cR+lFT2KXZW0J0BSYPb1RY8e7kbgj+mAhjHBCI7Yjg6
         gIc43XmDGpomIkfy1nOsyhq7LwsFgb0aFm7OB1Z+wEzHjcUEtdNl0IIWAZdFJmmqPYh7
         2UdIbYFUIcrP7ZH4NyO/gITBOjgg6QFtbBqEPtrJtaNVuG07f3mOVSnVV4j+wNlpDvHQ
         kLvqkKH18q4kJf5Uns5lIEaX+RkiTKLFs7UU2MuIaMVu1YDkvNbMA6AmbZMvFHGVFrQM
         o+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUycbssNOP9yczX+7pwMQEDg9rEazccg3ebutG4XC/mukLiwhU+yzOu2+QMV6QEXaD9NVWgBOVd5f98lNULzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YypnBUJnRM/PlHsgpi3QRJk37qsinSBsJ+lMMkeUAErA1TIhUVx
	qcEYGPmB+fl+fPIG++dYA9QyywIELtPoz1HlrosFe/9wfxsDSRVbTEpgmPNpydjBH4/KXYEyzEx
	aS1ID8M+qsCi4etTNn4pFbFF3XqcsPlz8Yuui
X-Gm-Gg: ASbGncvSwM2IYYHirExAfmiRHX+5ijJu/wgOCvZzmd8de77HRVSz6ANy72kCdCTpBQI
	+7l9/lEvw52VG3/zfbsDNiiSEh6P8qJkW1jr7KaOWqYZjonHgFIvlNRooj2ppPy4JuLfgYmgqbT
	iabe3bIm5tRX0HbqHRUrqnF7JFhqNCFSbmsql1MLERxlU=
X-Google-Smtp-Source: AGHT+IGX1yTNJn9QjTBq+4djSQclteAYttiWkHLIUTJs1acMahla8Gcc0/uhfgKPFjM8MtLUlrJysId16RaIFIL8I8c=
X-Received: by 2002:a17:90b:17c6:b0:313:2f9a:13c0 with SMTP id
 98e67ed59e1d1-313f1befa77mr5972239a91.1.1750102437885; Mon, 16 Jun 2025
 12:33:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com> <aE_xcV766hQacECP@pollux>
In-Reply-To: <aE_xcV766hQacECP@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Jun 2025 21:33:45 +0200
X-Gm-Features: AX0GCFsppoY2oxS87ex3PV-5TXOb_9kmj3nhJIvD8pJAvmN_kTi_G_nZ26aBxz0
Message-ID: <CANiq72=YzDKUCbkw9tWuSNDSUHPybhVfV+BsA3Ze-1x48=SThg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] rust: revocable: documentation and refactorings
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, lossin@kernel.org, rust-for-linux@vger.kernel.org, 
	Marcelo Moreira <marcelomoreira1905@gmail.com>, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht, 
	gregkh@linuxfoundation.org, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 12:27=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> @Miguel: This series will have conflicts with [1]. Given that it does not
> provide any functional changes, do you want me to route it through the
> driver-core tree to avoid conflicts, once ready?
>
> (Will have to backmerge -fixes anyways for other patches.)

I think the conflict is not too bad, right? But if you need it this
cycle anyway for something else, sure. Let's see the next version...

Cheers,
Miguel
