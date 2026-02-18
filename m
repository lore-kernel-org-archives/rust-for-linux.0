Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF6229E110
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 11:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771415833; cv=pass; b=FtYi+9Ma1qeROX050LzjcIDCVJn/zdD6n4PLoohoSBpWcXEtL50w11fjJEzJr11/g9Zpdw1cHxgQjKc9J4gOttnKGOCow2MUsccBtiS7PPSQazk69KwfSGVd/YKvKFjGeSm6lSS8sw/EdlnY2AM+rv047knjYHeE7eU8Li5sVXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771415833; c=relaxed/simple;
	bh=zdS4SBQ9OFTES1E+OQoR9/zpzkioryCQl31Mr3C9Rbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KglE6qDNloxx5OTOlvfO9Cb8nXSskiL9IW/T0i37NmXnN37LtKgX44w75Ta/qPhdibVxYAR0ERRoxF7hO/kn4SqsJc+QtNwmvM42bhLwPRbueTAKvgMLN1Ctb12cM7s+T+MUwzrNFo+9OvYPXyUWiCqMAVBzlVxI93ONtwogTl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MN+iN7Kt; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MN+iN7Kt"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b867142b07so408376eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 03:57:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771415831; cv=none;
        d=google.com; s=arc-20240605;
        b=M5YtLF0e3qNTSm0Y4DfZSPH5NlzKvJ8pAkT6jhNeeTaGniie5FqBiErq53OOWLrz+X
         5H6BTZTU3n5VMdta1nGYxLrPJNnY/cQdd1V8fgT0XWnuK1eF3saAxNU+2D6WinVMQXJD
         rcVrdRT60+X0NDJ5jYDSxEpzBc5k0ZTAgBLA+Uc3n+bM6BZQOKWshw3iemFwlfmuzKWa
         F7x6D7q9nbpKYnjf6tyfPVthe+eESJY4Bw+0YSk7lXwttKklDkirPmThkijlRl7qZqjz
         2xO1apsqEEO1JhfHcSs6xPJGau0sOiHjX6q7KthLxxkvYMric1yhsPnxedLzHPIy2T7C
         TOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KtcVewlOpPdOn/A/YdF2EeUU8KcsXzWyfjr5ho6fnU4=;
        fh=7tPuM7Zr6sSo91kHa05G/+iv3Q7j1FY7LYkFIIrV6RM=;
        b=giBVHGMCV16HeyOOC9eesdbRlufMiauGy/KON4UQxLq+z56MyNJwsdIdmXAMDX1Iz/
         iYNFK//thSXkFXKo7RyvcVNauvK2etjRGWU0E8t0kQYRbLKiPc+DMWx9OkEOJM16Xy/T
         VcVE+mAbj5zoSuQFR0rmSuKHqZoq3qMJgZ7HDaw6/06PBK4OiSoOk1N0tvvM/zXgEt+z
         1FlhBF1owFU2LUkQwcEHS2ERIAVmD4W1z1X8lO4jY9NTSGx/5m8p4ilx78RD8SiF+mk4
         EZvn0X+FIDPX1pVfC2Fd9J/ClwfmbU3FIWpzkMwhHTdtV1iBuCV45SaLQlw5thEkYdp5
         iUmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771415831; x=1772020631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtcVewlOpPdOn/A/YdF2EeUU8KcsXzWyfjr5ho6fnU4=;
        b=MN+iN7KtO/FT5u1BSg/ouj4WUFKTASwDpSZLMchM1dMOAq/vWhDBIlEZ3Q2aTV72EF
         hmYn5wHSJeskQftrMIz2wqleTbumd3yS3C924XvG4EB7kdVUDD7X1n6iuRw7vLYKqoA1
         D3NV3YPC1XWD6vcr0ylZdpCugZCJjdGJGFvdMSu2dit63T1/HYOtrIG5wcNcH3JVlF6L
         C+TG8UHbCKyRLjAEK9nt8d9sA0TKf3fJeyZAtJikT8BVOugNX7pnc9zXxpfpCpaLtsR4
         z0H+Ng21xqOnqA+v6Ufca5fAU7WJMMmphmK1TSsDyqWo2zEc2idssABcytb/JFypM7U/
         LyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771415831; x=1772020631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KtcVewlOpPdOn/A/YdF2EeUU8KcsXzWyfjr5ho6fnU4=;
        b=uQqrl625hNwHdYVzu4LQ2rBZwUzpE50ZXr6jVvhRuBfw0mS5SFN9RlLYrEl6qbplul
         NyygIo2YPY29zy5z34X2gUrcUztBLqs8wNPwXsivqNv5oYp1tM3m3j/RVamOm68kn7Ck
         Z60knmm3Gzc5G5++KV40ce7PVRdUPn43oITQMH/jjP9RfIRdJlarAsWHiEjBNg15HvG+
         DZHuViwfGkY5OyjmKdI7JJCpmupdQ9gdkEHUDjU9dFgWmIgRhAslr8IWc2ym00B5X8KT
         1uSjyBUu1yI/fgy51ZdKCAft4dSc/GT47rXZxOxFV8sV3xNTHsEoA+zIfDfktuCY+61r
         wzaA==
X-Forwarded-Encrypted: i=1; AJvYcCU+1dmRCJO7axaNGHN1Atcz27F+PIXaL18Djraj7b2KSoT/aZxvNGjJXfr7LHRh+uEFnyHgwn0/bnw4/LNI4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBM00tbjCxbxsAEyHpag1hQHAjWsGGYQnZSW83YBEp5ZSBT4zo
	xD9WOOtAYOGx2DlZS79C5n23LA1FpQZNzCr+ZA73UUzYiyRJ4SoBiBvTDckIyQSzDhI+JX3hTcb
	JPACcNiwRGF20G5bl/5sZ4fyEj+nVWhQ=
X-Gm-Gg: AZuq6aLu2vLgoWbxGbqsyTlVrN71XB/HjmuqAVjOgtO9C2IG4ijPmP3oU5VoSV/OBvx
	qVD9RH0UREghHGN+hUHFLu+wJBlmhERhuTHIIKZ5dw19WJEO9+Q4FiVr4GEeSJCLrCcyJwoCTDN
	/KB9t5i3Pz7hHWZcY/5w5jcRnzqpK2CPSef24y2OqwGPsNZbOueEHWObMiWgmviLIS+J2YnObOA
	Y/8qZyCPfzXazoKW3EE749an0i1IZR3DIE3GxvEN6M21lwB7R5JMLn69o2yRW9BDl0BCSiUJo51
	S4zvYKVAqMPv24pidSZE0gH8zJTnUSoSHIsim1iJPeupi4RGUBUpWiyXGdwVjMOd9jvtmRPttLG
	oWq4o2rnL9bE4I+a4jO+S6QFVtbl/ebWD3B0=
X-Received: by 2002:a05:7300:2327:b0:2b8:2082:5bc5 with SMTP id
 5a478bee46e88-2baba0da25fmr4290106eec.5.1771415830789; Wed, 18 Feb 2026
 03:57:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
In-Reply-To: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Feb 2026 12:56:58 +0100
X-Gm-Features: AaiRm50hToXgBrb4YdoI6g2TqLtBaS1_xidHsii392EXlW0MJCp-m0oWjTwIcQ4
Message-ID: <CANiq72=5r2miRm6GWszb2gDNi4k5-RZUzvdOdFQ3yyndvmHbAA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
To: Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 7:43=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> @@ -282,6 +318,7 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset: u=
size, len: usize) -> Result
>      /// # Safety
>      ///
>      /// * Callers must ensure that `src` is valid for reading `len` byte=
s.
> +    /// * Callers must ensure that there are no concurrent writes to the=
 source memory region.
>      /// * Callers must ensure that this call does not race with a read o=
r write to the same page
>      ///   that overlaps with this write.
>      pub unsafe fn write_raw(&self, src: *const u8, offset: usize, len: u=
size) -> Result {

Coming from:

  https://lore.kernel.org/rust-for-linux/20260215-page-additions-v1-0-48277=
90a9bc4@kernel.org/T/#md120cdea73132fc698bf69bf3d69287c2cb28449

Leaving a comment here to avoid forgetting: I think the new bullet
point here and elsewhere is not needed, i.e. the first one uses "valid
for reads" which I think is meant to already exclude data races.

> +    /// - For the duration of the call, other accesses to the areas desc=
ribed by `src` and `len`,
> +    ///   must not cause data races (defined by [`LKMM`]) against atomic=
 operations executed by this
> +    ///   function. Note that if all other accesses are atomic, then thi=
s safety requirement is
> +    ///   trivially fulfilled.

And, for this one, Benno said perhaps we should introduce a shorthand.

Cheers,
Miguel
