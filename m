Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FFA23E340
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 16:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792653; cv=none; b=n/2nk7qIYLS3h6nwXaSSdLkGitjZi6hIUXUlKTmDoOqT0pDfCGk6ljxVhRKHGRFz0B6pzoZ7ZWk+EsTKPrTAbEFaYIck5ErE4fwoCrkyxDShpzWivqYdnEqXqfdMVynX1Lrs7kBjUFU3Xma9b4Lyf0dGtjnjxBD76YJFLpHuZsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792653; c=relaxed/simple;
	bh=EJ5gnsprbouoxe4kGGgiVEvtZsgYgTfaDhSxGwHRgGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FfDfy4H7w8YRFwwGAlTTpXFJ7XENynQnWeUi+glU7YF8WuMxAJEweWFe5Zk2mvLuetoajrB2XKuIWv0EkMrulr/ob5Kf3IVrQzUdO2BRPM6nynVR35F/vDVq/UZmeJqMJtg4Kbfl1tgJSNifwzYiWy8e0Y4BZpBkbVlLpUCFnzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvXdr3tj; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvXdr3tj"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b6a42754723so256640a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 08:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792650; x=1763397450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z10RQzCc5agOD6WRpM1Fa/ztJq8LZZ8AGoZRmeqxNHI=;
        b=LvXdr3tjXaTIW/bBbs19MQufWQ5HeUqsu3QQORRZhM7Udq/DbxPP8LuXaU1lyyvBl9
         jx7teON/yDes6AGiGOMsQUOcCmRlm2E/d5xfE0OFkto5KLFoWohqlJ50sVt/jxoxdm20
         0P4ECr/3Ea+5uyH2nTOKSacPuyGZsLIF4Sp/4YsxSArpo2hySyD/2yhFJt1NmmID96pm
         lhOBWaVf4YfIIEQNnls6Jo8lyOSS9R3WLRtHegLJGk/PgxS3p0DiqCDfQEonLULMWBS+
         GHtrpT2lCLylpCnOKJFKf7ITmwKlzZisWCHmA2XhJfBOsltffLhjcgXqA+3Jz2pJkwDI
         jTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792650; x=1763397450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z10RQzCc5agOD6WRpM1Fa/ztJq8LZZ8AGoZRmeqxNHI=;
        b=g3mxMAYRnFqY+BhKW6AWmXMKnnMRL3rzqwgcKtcbmWHLkuDtPpi0HK1moC3qVF7ahf
         rK/Y8brfdjL3HaVqV/nD4eHRHzYxU/Q6HNGMz9C8GnZ82tU9XRRb9YfrKo0ZrlZsvxQr
         IV4c06mCrUtK25jpUsR0aEDPqWGYzZSAVP5MDBAynVbLqlRQ3KGVJuFDzhnptnFO8g8i
         /tAniQWwhbxnn3+i/SjfcyODZ53BQkAimUUyn95CHt69kSTnfiU1lD4sNtsLzDZnP2js
         6jTUQhazUqV6/5yOnRrTqA00wGF33z6AomfJHMdxfxnyOBpLh+apXlDuS9plF9RDwIFL
         WTNw==
X-Forwarded-Encrypted: i=1; AJvYcCW0ETsH1VtvsAHmYNKZA8rJd96H++BJ4X0bAnH0dkyVoQBpyyI+RmQslzsI4qtUXOxaVSsVm2kpeugDU3C8yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU83h/lKcENO1W1tLU5X7S7iffWoClze++STgytc+K4TCNzSYg
	ydV3EvwFM2jlJErGU8/p/wPgVJKU7YMv3Xm/s6YHdjLlqaTJNRpSYpMPK8CI6PpsaBs2ScyYybV
	yhM0lPSIge2P7zzRA2PHecdEm0Yqg11Y=
X-Gm-Gg: ASbGncv7uW8KKP+hWPWar5LCdbHKdRcioSitpeusWC/VAR0WkyYt9fPL0GsIsjFG47O
	IcwT5bK3QoFG33c7kkjQqgGTlJIC9xPosvXsz0CvAUKFUKlc+28kmydZ11w8KHrEklShNE58iF1
	HjKhhjB45SvpoFUS6WrkMkb1rGV/FCq7vX0eFDkOp165KBVO1RaSonHJ4cIEEHCkdrnbImKo8fT
	TaN3E3c8xSimOb3OR/gMehyQf1tUFAt7j9xFNUil2i2dzcHknhFdvPo+mVj1cwN+v669IgZ0ax2
	obWGQSwoRnwwtM9gINaOU+aBM0+LIL5VMvz0FXvKKjU22LPpC3ia8+jdaPyODyyCOCdqkMTJ2iI
	wOoWNN9qEcbfQGQ==
X-Google-Smtp-Source: AGHT+IHJofdzytGe2Bch8Dllebkzni1knYGI9QeQTT2YWhEKYoPy89JUi0RvcxtVd491Bb2oLHMenq43jZlD9qGljqI=
X-Received: by 2002:a17:902:d2cf:b0:297:f3a7:9305 with SMTP id
 d9443c01a7336-297f3a793f7mr54872485ad.6.1762792649991; Mon, 10 Nov 2025
 08:37:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106.091026.1308953895982406095.fujita.tomonori@gmail.com>
 <aQy0zxs53EAnntwR@tardis.local> <aQ21xajAygTbi582@google.com>
 <20251110.182150.1392834304602894143.fujita.tomonori@gmail.com> <aRIPgOPvi4uhGQcM@tardis.local>
In-Reply-To: <aRIPgOPvi4uhGQcM@tardis.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 17:37:17 +0100
X-Gm-Features: AWmQ_bkRkJPM2j1WAmaNZbzbNadF7_2Gcqh2vYJTHIeaj8EcbpOFuWMrpqiqB7s
Message-ID: <CANiq72=REF4mdB=g45c=eB7G6ocGa5Qf4PhqD4zbwrbCP6N=XA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function exactly once
To: Boqun Feng <boqun.feng@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, aliceryhl@google.com, a.hindborg@kernel.org, 
	ojeda@kernel.org, bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net, 
	lossin@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 5:15=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
>         // ORDERING: Relaxed is fine because we don't expect
>         // synchronization here.
>         let old =3D self.init.xchg(1, Relaxed);

Meta-comment: I like these `// ORDERING: ...` comments -- I will add
them to the other ones we are getting implemented in Clippy (`//
PANIC: ...`, `// CAST: ...`), i.e. we can request them when calling
certain methods.

Well, unless you think it is a bad idea for some reason -- I guess in
some cases they may be obvious, but just like `unsafe`, even "obvious"
ones may not be as obvious as one may initially think... :)

Cheers,
Miguel
