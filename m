Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7AF1802DA
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 18:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714501355; cv=none; b=kKyIC7A+A/sJ0LUxwskWG5c8DsMYTt7W5V45Zha9XZTL5OYXkFZzeVtTRWTJ4abldPNgMx0763I1LHXaYGgkUVsfw9xv3bESP2JvhxtfZB0vtXMHYMBGNa2y+1Sz469BF66RthvahKNYnuGvth2dqLGtupidpj3+Nzhsy2Q52+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714501355; c=relaxed/simple;
	bh=Tys9Vqu4Np9NrR4Q24ohGiMMf8UxyZr7+N9SeUjltmg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nt10hzo5U6/QUGnNR/7KudUF91NcAgQ43BvrcGYMy4bubP5yksHPoDBD4+FPLhb8r4/7L8NJp7oP2E1kqlX8nD45dkcACV4/iE9m+6rJnBJpmFM4fafyi+0aoSwzzIl0C2xjKXwpzdaatd/51upMLKtemYOzDcJWvXH59OXMaVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=jVdcxRlL; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="jVdcxRlL"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a58f1f36427so415109566b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 11:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1714501352; x=1715106152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eim2qM9dw2NaPc5K3CL5p94YEvS81xT9DDWzSJ6rzVw=;
        b=jVdcxRlL5j4m5yjl+WkqXscbtYgVttxc/4JvOHNJSKoCALCp8m5WMRqqDyNQCmsAA4
         WChmteAaj0mZVrJnCchQERr0n1ieqhyYmztRykfsQJ8lMjLyD4kBUjPTGhhmdCk0MMJ1
         ZqXLxputKkkwMaIlMws1NdafEq2PMpSbXYuqGSfNedb895+iaPrvIzXcuN/4LibEUcjx
         Cx1fTACsnSES/HawFo/TwxuJ7jG6+oACt62OwtYWj8bJN47HBesy6pQd1AASEl63CHSf
         rvj4vjVYZYyRwtANKrfZU7hdxVUMZfbaL5vgQ7EKZZAWENl/MEvXAhZAre7eiM0F7qtW
         +C4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714501352; x=1715106152;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eim2qM9dw2NaPc5K3CL5p94YEvS81xT9DDWzSJ6rzVw=;
        b=CnVoxWV2dOs7ATehV0bWgfXoeN6UXzDi0oq3+MjpSVgcA97MC0G/h5NL39tLEDO3E/
         57JBufxm4eecTXQ8ZUHhcc98VE8iHuFy8YzC0rerJukgBujRVpTm8iUwAmyjix/rKBZf
         k0Pw6xgkSzSs/sRXNyRsZsLoae7D0YgaZoY7cg8WZuB3Vl7cHmXmOQwRYR4rHUzCt5FO
         Qz/l68KbXgrIRKBjkO2TQW6+Aj66ZCZE+j8Age3NBECXj7E8d4lajfdUL8fdNilOQNYw
         Fke6we/D4y2no5E6ugjo/GAcreIWxsxgyYae1gT88lJ1WqJQCMOu+q0fobrCCh5tm+KI
         IW/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6l3XDUunwDhVwinAjIMhmD4kDdXrosekY9Q87ugHG9l44oOJ3X07nCmHEsh1cTdgZ8EzNY1Fc2DZq2HXfIfkl3Daz9m1meX7LVviZebQ=
X-Gm-Message-State: AOJu0YyIypFsS/oyASNuqYGhGatiHlYo4relCHXYvZDOk+RV1UD7WhMd
	rsLV/7rLdGFGJrw/E+bqyG4maaJ2Wvwk0pUZeT5UZcO7y+zGM5oiVOaaMFFiTNw=
X-Google-Smtp-Source: AGHT+IE5aiBScuaQ19uargUpEfy39/b85ALLx+hF4lmyoM77hZpnbkfe7n/+rxmBeqSK1orOCqLUdw==
X-Received: by 2002:a17:906:c791:b0:a55:b592:7e0a with SMTP id cw17-20020a170906c79100b00a55b5927e0amr377859ejb.48.1714501352560;
        Tue, 30 Apr 2024 11:22:32 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id j11-20020a170906474b00b00a58eeb329d8sm3949305ejs.44.2024.04.30.11.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 11:22:32 -0700 (PDT)
From: Andreas Hindborg <nmi@metaspace.dk>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>,  Miguel Ojeda <ojeda@kernel.org>,
  Alex Gaynor <alex.gaynor@gmail.com>,  Wedson Almeida Filho
 <wedsonaf@gmail.com>,  Anna-Maria Behnsen <anna-maria@linutronix.de>,
  Frederic Weisbecker <frederic@kernel.org>,  Thomas Gleixner
 <tglx@linutronix.de>,  Andreas Hindborg <a.hindborg@samsung.com>,  Gary
 Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Alice Ryhl <aliceryhl@google.com>,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: hrtimer: introduce hrtimer support
In-Reply-To: <ZjELgVzzX4oru0gi@Boquns-Mac-mini.home> (Boqun Feng's message of
	"Tue, 30 Apr 2024 08:17:21 -0700")
References: <20240425094634.262674-1-nmi@metaspace.dk>
	<a7a560c7-fb8c-4adf-9f46-2e272f24b335@proton.me>
	<87v844lbhm.fsf@metaspace.dk> <Zi_Zb1lBOBBUFJFV@boqun-archlinux>
	<87plu7jahd.fsf@metaspace.dk> <ZjELgVzzX4oru0gi@Boquns-Mac-mini.home>
User-Agent: mu4e 1.12.4; emacs 29.3
Date: Tue, 30 Apr 2024 20:22:25 +0200
Message-ID: <87h6fik8wu.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Boqun Feng <boqun.feng@gmail.com> writes:

> On Tue, Apr 30, 2024 at 02:33:50PM +0200, Andreas Hindborg wrote:
> [...]
>> >
>> > Could you see if you can replace this with a `SpinLock<bool>` +
>> > `CondVar`? We shouldn't use Rust atomic in kernel now. I know it's
>> > unfortunate that LKMM atomics are still work in process, but in real
>> > world, you won't do busy waiting for a timer to fire, so a
>> > `CondVar::wait` is better for example purpose.
>>=20
>> Since this is only using the atomic from Rust code, it should be fine
>> right? There is no mixing of memory models on this memory location.
>>=20
>
> It's better compared to mixing accesses on a same location, but it's
> still not allowed (for now, at least) to avoid mixing memory models on
> ordering guarantees, for example:
>
> (assume all memory location is initialized as 0)
>
> 	CPU 0				CPU 1
> 	-----				-----
> 	x.store(1, RELAXED); // Rust native atomic
> 	smp_store_release(&y, 1); // LKMM atomic
> 					let r0 =3D smp_load_acquire(&y);
> 					let r1 =3D x.load(RELAXED);
>
> The smp_store_release() and smp_load_acquire() pairs per LKMM, and
> provide certain rel-acq ordering. But to make it (r0 =3D=3D 1 && r1 =3D=
=3D 0),
> C11 memory model needs to understand this sort of orderings, but
> currently there is no such thing as an "external ordering" to C11 memory
> model.
>
> I admit this is much of a theorical concern for code reasoning, in real
> world, it must "just work", but "if you want to have fun, start with
> one" ;-)

Alright, I will change it to a `CondVar` or a `SpinLock` =F0=9F=91=8D

BR Andreas
