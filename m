Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5234B384CE2
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Jun 2026 09:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781344166; cv=pass; b=dAmqU4HDY8fkt8hsVCMxzVCpBXnVGquE5JoARJA/OUwBHioohzkzUC0GL2rGTEOtxxGSDbIasPRgWW9uN7C5Vj+BLGXWVCGz4/B4Rlet073i+QobXgU7LjFsNB8lKaUQdYy5kdsCnGk9V1UvyaNkDdJvpYl/+MWls73EuCtpJqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781344166; c=relaxed/simple;
	bh=N+BOVUokZvEKxogb7woXjEf8tUSXjSp7mQH0tyGXKLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzCirn7ztYKznj3dwc6xV0t67IRV++KSfX5ISmwGTJ6QxRI7ulYHaTj/HPfSC2um+1YQPt/tO71SG4f0sLy5uEKM76X0iSs4FWPwopVuEldfHHdDb49b+fmIq53CHjdyvjw1467v0jDVs+5m6KUgu+hJKeMTRugIH0qxoYUTH4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFLAiA0u; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFLAiA0u"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3042a99f0ceso251926eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Jun 2026 02:49:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781344164; cv=none;
        d=google.com; s=arc-20240605;
        b=Xb+BZmeoPgi7HYVVrfNHnNjXZ6rD/ByMciNhGlj/vMtz8oNGvRwkLZxURDD2ryjnz4
         JGLIl/VDGu2uSQMiHiIVkYPqGudDESr4JzgiMj5bCHT1K3nrqnhchnXF7joxGjqSm7Ff
         3mMClAEcuVbxDr6oiu/J0T6fveytj2qGY9oSABFsPMksqNCAhH7AlOECCXdH8FjiEuyE
         F1HBZ4t0Z0DeDluVdUDF39/dEoAWT3yG6RUdDf950Ya027l0whABQhU3ebrOlEqnynNM
         +t0aeSM/22knsqOgNuinychgGg6kTYfFs55L3kbGANPCMNeVDFOGEkGxzHI/ubxDfhmO
         84xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OkM4+eHaDUAb02aEnfu5B6pMfFHeevNTKhJz3xUQyG8=;
        fh=vQaacaYqyFVZeTHRcPqU9sc1DKi7hHAmKbmpRLT8P4U=;
        b=SMDInNgZuYAL6D34xdrkmRo+be4jroDNg35hNaQenKKIBD/GnyO3GR73077dVE9aOD
         KZiKWnNBZnkm8mz51n5gYlJ+HalZcCUDihIuibXRNLzx6VK/AIfOv/gGOmhG6gFvHH82
         0w2L+VLYYFP+S+fqtEcUJI9MWSK0MLe0cAtalz6eiYgC7az8/a+ubbyIlGc5iNO2uVNW
         x8AJ3RjFLzCpkHZyd5NfdtJ9XNnEttGNSeNtLMQTZ0OgPBYf3Do10RUsdX4HvtbNUot0
         E7MXp2TzytmBerTF71Ghz1nGUgT+ZkeCWjYTofCklJJ65NIi/HTZtnFtGTpG/q+OSsME
         MoVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781344164; x=1781948964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkM4+eHaDUAb02aEnfu5B6pMfFHeevNTKhJz3xUQyG8=;
        b=aFLAiA0ugGg00liGLh5iuyumERkQ5p2AJy8FxSZatEWdGhqba8Ux6DHYO+1mDOOagx
         TOV5UWC/HfXcBBfrdd8q6riZW69HykzJN+eXia64Ay6+wo4j7Fymlm7MfI1ztk4WYgUH
         gekntzdeyIX4pQfrlbnsFtAdCenB8VaCWntDyd9uwUcjEvNQ61+gp++UTpizymDg62RK
         EWfVUWatdwGiBMtVcAsc/5nx6M17COI5UlXWPCWXTo6T/NA4L17wiSOBLfvyJJT55Qb3
         biN4lsfnI1ZTreTNE2IEKAJAcSG+ntsX7nLcCpBpaZyAzPxPrjmf1IkAJ/5z5FZr534r
         OQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781344164; x=1781948964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OkM4+eHaDUAb02aEnfu5B6pMfFHeevNTKhJz3xUQyG8=;
        b=WXTnS+Tn3L0I91BPn3JSEwmX+WV13sH9pkDYWp6aixCZhdiT/UAmYgH5Rxfl4CnVbQ
         QDEOxRsXPd20HQ6W6kPQMP1ubXiY1cTmBRQUbg8znNmPJHV6+9TiUXBxk0w4zi0D9Zo2
         k1v3Oa3IuqiKPnVUqOwy1swn4z0J4vaBogKPdJTe7sHB1NW0Tbk971c+0Ji1iOi6/g4F
         FRNa6myC83anxFOQIvIayn72DAfwIb+/X12gEkBFECnsWC4hw7Wxqp8mlC9uoLwhQER6
         tiKMtugEj4xrM3FUBUfWhp5AWPvdad0t2JL9yiv+WdkhbLtrkaR1DYIGQpZlRPzRGmuh
         692A==
X-Forwarded-Encrypted: i=1; AFNElJ/fFJ+NK2gcLu70Lm/fihmTiW/kGxibnnpy6nzn3u0bWo5uqYzAtbS2DS7JuCB16Rc8tAuT9bS0gRwNtAw2AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBZ/3kToaMUfWZGmXiwIog8JwcDgufQDFUFp0+KRIQwEI9JK+t
	46BW921y8wmay6Lu5woOW78dsd+5LQ96YMpEfV0rRSakVOtg+XkSTwh6HjzpVa0vV1+d8ZRv+V2
	GjzwKBpSAR0/7S6VKIbM0kxGi41laGEQ=
X-Gm-Gg: Acq92OE7Y197IkylbvN/Jtys5Eu1gpc/PJPv20Bbx9tp6AwVygpny+MIBDOfDkCg20E
	BbNtQOAMc97QSHgDN+ebsaZixKj2DdlPyu0c/jl/RiREu7dZusbs3xakrl7+If27Vzt2R22pCy5
	9kCc92z/3LQZXG2tAunEn5gV4YewmsDX6K7vidKqkEOaIfsTPqC99+SBv341dnyZ1wvqRGuc76/
	Dsx023XfaZc5sDDpO2AJywzpnvO3oF4HZHTuSgDQB1lUQU+C1hyzBcy+NwHh5eaqvZZUQHuJtxD
	vwBCs4ODVg6bnS5FpsT8RYNJ5mWsc/TMgCv7vvm8ktT3Dk0eIGfnfU4z1h5M9yTJBbT7bmFoKUc
	cLR9xg/qxBF1qgaXOxgNNXEc=
X-Received: by 2002:a05:7300:730f:b0:307:2e1c:17ed with SMTP id
 5a478bee46e88-308200d09dcmr1479282eec.7.1781344164338; Sat, 13 Jun 2026
 02:49:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DJ4Q5J5OILOX.1KCPFIVUFN2VV@garyguo.net> <20260610072947.338278-1-ojeda@kernel.org>
 <DJ5A6AM2FDGQ.19T1Y9N1T6JST@garyguo.net> <CANiq72khOCLC5kG5vWhDeXpHv6n7Yo9Nv=PewNS0D73AxUDB4Q@mail.gmail.com>
 <DJ65HZ2867HB.2ZK56NEAURVJO@garyguo.net>
In-Reply-To: <DJ65HZ2867HB.2ZK56NEAURVJO@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Jun 2026 11:49:11 +0200
X-Gm-Features: AVVi8CdobUhfSP0GVHy-aYqTcvmFqhk07mdunfn978mPaEmklHiQcpFapjBPE1g
Message-ID: <CANiq72mhdy3i+X-9ZDiwe-mAYu9DX2B29dQQi=2iAYMS8JMzXg@mail.gmail.com>
Subject: Re: [PATCH v4] rust: make `build_assert` module the home of related macros
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	airlied@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com, 
	dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
	fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org, longman@redhat.com, 
	lossin@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	netdev@vger.kernel.org, nova-gpu@lists.linux.dev, peterz@infradead.org, 
	rust-for-linux@vger.kernel.org, simona@ffwll.ch, tamird@kernel.org, 
	tmgross@umich.edu, will@kernel.org, yury.norov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 1:50=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> > Good first issue?
>
> Agreed.

For future reference:

  https://github.com/Rust-for-Linux/linux/issues/1242

Cheers,
Miguel
