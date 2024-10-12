Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D016A13A26B
	for <rust-for-linux@vger.kernel.org>; Sat, 12 Oct 2024 10:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728728738; cv=none; b=OEqwfPZ7di+K9wIrsn1RXlmCAd5ihmWVdAQA9kTl06dgM93h23mFIdCBByrTJPmVGVUHcuYGDg7FhCqsKWx6BsbrwKsAETYvT6m0a/nFBxqXeHdp2caDR5x6nRwryteeALnFqzWbBmKAHQUYK48JBXDOV3U7jlhCJsgX3auCiiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728728738; c=relaxed/simple;
	bh=XVQOmd84Fzf9n39tA5Ey6fn6iO7ssHmPrKVq/9pBYGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L5fkPTKUqKMzIDAtKOWjEV17fWUSFFYvq9X8GLVk5NJVS2ls878mX7uTPXJx6LI6/HwfJy63QBEZJFfJTNl1pI5TpXIhjyXT+hy8cfsWEVeC7RRqB6Wz4Tfth0udpioSKMx33j0r/TXNhL8LFCANtQ/pc1P9SMCTWYJ7YjAo17M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTGWtgfk; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTGWtgfk"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71def8af0d9so336046b3a.1
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Oct 2024 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728728736; x=1729333536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVQOmd84Fzf9n39tA5Ey6fn6iO7ssHmPrKVq/9pBYGE=;
        b=aTGWtgfkrCD9r6RVhxhe/myMVGa4njU0XmykyXZhH2wUoPDuGmDLUpxgC9W33JBB0f
         ygMuXjXjbRL0XphmH1Glp7xtQpWddwb2CIumlI7qStflDFTvHPAfYufI/ZUVoZLl1l/I
         VLm23Hc/gEMI1EQlkt8sqqrq5NsoT3xqkq2pJHe+paphNZwA+vsIcWG8f3PfSjnfWftr
         a95PFTnlGDhiNDP5/0kZL0yprWdiLZEhNsNCUQLr0MMBlzhzzKUK5q+wfcEpZbLJhpZH
         2Xfq7ZrXH23yeYxKa30/FMYX7W+NukEBZUAF8bClrSGg39ok0BpWQpcxbcBEEBHQrqUq
         cTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728728736; x=1729333536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVQOmd84Fzf9n39tA5Ey6fn6iO7ssHmPrKVq/9pBYGE=;
        b=adkD2sxHTIR8eqtEOS44GdfEKsS7aWz4DSKTQ2cfxtjO5CpNznuJmeNCVz82rbhPZL
         0Va0ZgtJBduaO+SwWslPiOs7khRp9RX2Zl6O5DKTZa2Ya0i5wdEUpauNv+Qiz7gi+Bpx
         E2y0F/jAE6Kdfgudcz73TlLEXbKiGxDitYpMfPnac56kmP+IDQAQkbooFWALbsdPxdFg
         We5gLVt88Hi3YNeg0Aeg1wDK5dm3cY/Ep93f9Zb8K7uR5tLa46HBVMwTn0bzVboN7fim
         5dz4el9uElwWxA1RfaV+G49cl6ytUdl4MtVhTggPq7yNZF6k5VIQzANCWdcDrx3Do+s6
         Nm2w==
X-Forwarded-Encrypted: i=1; AJvYcCU2IG4tQE85Re+AyhdTavOQm4n7mTLkoPInwvGaoaj4oQEjZH6ihFpMRPM/IRimy/LhnOI4aUDY0O0Tyxqm7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaZG0uAO8CpJYH+n576EVs0KUuqNf3CGaTAEBGL6ltfRJqb6L2
	lS5slKqsHNWEyVvsQHsHIv92sPk+S0H94yWiBu8fd3VezJ+2c3oihwMuBOmeV81XRwjII4/+4Yg
	rFlM2IsDjTrdYO1wwUanNsKmzyhwetEIcw3YNhQ==
X-Google-Smtp-Source: AGHT+IGHDqpFsQNn+Fnya46jMZDL4B6/s7LoZZ8ivEJj3TUAOq1V6j6gbIR+Pbp9m1QtC+21y59ps9f+t/eZucLeSTQ=
X-Received: by 2002:a05:6a00:91e4:b0:714:1aa6:2266 with SMTP id
 d2e1a72fcca58-71e37e2c125mr3792807b3a.2.1728728735866; Sat, 12 Oct 2024
 03:25:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9fb9930e-7666-4520-91d0-7e79be56b8f7@gmail.com>
 <ZwowM_YKc8Ktzgzr@boqun-archlinux> <Zwowy1ABlKJDbuOb@boqun-archlinux>
In-Reply-To: <Zwowy1ABlKJDbuOb@boqun-archlinux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 12 Oct 2024 12:25:22 +0200
Message-ID: <CANiq72nT0u6pi=sirs18r0Oey+HCpeBX8qZ1oOULYe0UZaDS_Q@mail.gmail.com>
Subject: Re: [PATCH] rust: workqueue: Enable execution of doctests
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Dirk Behme <dirk.behme@gmail.com>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 12, 2024 at 10:18=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> Oh, but you may want to Cc other Rust maintainers and reviewers next
> time ;-)

Yeah, that may help others see the emails -- we have some notes about
that at https://rust-for-linux.com/contributing#submitting-patches.

Cheers,
Miguel
