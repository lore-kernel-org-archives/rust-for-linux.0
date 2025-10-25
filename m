Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1037441C71
	for <rust-for-linux@vger.kernel.org>; Sat, 25 Oct 2025 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761397240; cv=none; b=tiJur6vlyj2cHG/mGNs1NIJG7yJhkWXY3O0NqkRm35xqgNGQnLKz9mS4r6H4Ywh/VzRucc5XqFZon9SCv04c+CB1w5ejk+vqZFKqw5PECgnywLJELBJfAaahtsDgs+g39A1ZfjqWBck7wUh0RY8KX0yre/ukRL7cDPq60MzideY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761397240; c=relaxed/simple;
	bh=EASrkkWI0JBpW6t2iVSbWSdDzPlBVsOxlTbS3n8qIx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRLzsVjsk4mNXewkiU79RwpZymeLKu18ikF3vyllixsTZTGXuw0ksgO1kY8NYno3POOTGKgFH/QduDB6+8bJHWZz7KOAEB2UXz58983vyBaUumMrqjS9RKMZj32o3dz0Q4c4SabtIuwdpw+4928p6FxNhqIsyW92fMbCIvF3Zcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8wvdelT; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8wvdelT"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2930e04cddcso5868395ad.3
        for <rust-for-linux@vger.kernel.org>; Sat, 25 Oct 2025 06:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761397238; x=1762002038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TFesFsglqC08jCidE73APHCSjqIZFDJA83IY2oNpTM=;
        b=M8wvdelTi/zVnVycWMTSNZQ0yhybu9RiJwgozMHICWYL3Rs09W4QGpcQzVpk7sgKem
         KHktEGICq4Qj/1KczZCrBLlR/P+uv1d0X0GhuWAcAbVJV96R98Ql2Ys8UWmLchJymW17
         Q+nKYNGWzMMljmNzRJFv3npTRyN5E6vVM75+XmScCPQqpn5izLBAZcH1aRNQMlCEW5i/
         KEEeLICKgEGCJjORe8nxyuAowSL0mo9dpMjuJB+b7WiMbaPQJCfc+1OKEQIQy7mWNfmX
         KqdobCeaMHtJKtoJ8oX35MukYEkNHh26nETVGDOVRxFnGfFihVBVVunwT+OwkjcDOhV5
         qiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761397238; x=1762002038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TFesFsglqC08jCidE73APHCSjqIZFDJA83IY2oNpTM=;
        b=kb0gOJZ5g/V+//oUN/lRevLt33YbOFCJVHDeyTyZc5oPdlCyD8yQxf+U9q5s7xBaIX
         0O92ZN2utj/Vz4AoYaw6w3u/CqWSlQcM4k9bjL2dk50ws2RKVroNBj49obW4F4nCYjmv
         WDMz+Ia6sVhTDBOW9F1pDSvUnw2KOVssBCyZirsyRBn8LLK84fllYFkRo6DbF3ddsuvk
         9W3C92OBlvEcrJKb6KQ4sGqU6HKeOrRwlXzI8b8Ao7JCcJ0Bp9nxuP5ZFg7RqV44Jusm
         4LeaqjmAt0lKILgfsP4m25YScyxEGldBFiSw1XuwVE9ZEWPUuhJGjKYDRCpqI0t3xaI8
         QCSw==
X-Forwarded-Encrypted: i=1; AJvYcCVJUtlp5kmb/4gm3T9Nc6e+CTPbnVJ7ItvtoeFGNLa8Be7k6mbiWfX9SMD/XIm2WcSByJr+CXEXUPNHaPYBNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzCh/zuA6OtHSpvvUSAWrz+YPAuRpywXYNjXcTXUXtUVbLGc1z
	FsitEc8kxctp6upGjAURHsrUlyREYDdKKskzRj2GD7NuMGHWbIc2KdOwGBXZuxPPZdI/CTAdnsc
	POksHr6QGn6wFpw8wYY+nERR4Iz/LZ4Q=
X-Gm-Gg: ASbGncsnIyRp6GaBmrcPd7Fl8ZB3fpiHy9DHRgrpyiI7mF1z+Q2AnFhzfOjMpJEeGLL
	dCUGM12vh+VBBin5ZRpY73LddXLM4Eyv/mIDFPu/9uSxI0aekzYHfpytV/4I3qkVihAsDB+KmjQ
	21CBUGiIl/hib+C7PaJtPSL5b+CQfzfJ2bG2Pu5+1Lze3eEjdZ78+Srw8jvtbW+RnpEUDPSKi+t
	GCJOsaRThJbQwLMygzrNVBDrl/scWbbqfWUMRpT2BwDney50yQEYowMnY3MXQO9V03BJ9GQmgGZ
	XZkPeHUSkv9q9g6sY/tS3f524lJpP/vaGWXdgM00bcqHT1Ce9mUtuv17UC145+w5eyftzBUv0/J
	vBQUrmPEO4lffQA==
X-Google-Smtp-Source: AGHT+IEbLNoUs/7TUmb7QhdPzsK9jT8ZWrQxkiWqqM8zlucYBhznBt9a3wsSN3HfQJ0dcN6G5T51p7iEwBJO4hkdeVc=
X-Received: by 2002:a17:903:1965:b0:292:64ec:8f4d with SMTP id
 d9443c01a7336-29264ec9324mr156200135ad.8.1761397237982; Sat, 25 Oct 2025
 06:00:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251025124218.33951-1-sunyizhe@fastmail.com> <CANiq72=d0zXWAryVXHUKLUkcM_dPoC_uPM2drMXAVB7kh1YSjg@mail.gmail.com>
 <68b53c52-9834-41f9-8e40-ad27f00436a4@app.fastmail.com>
In-Reply-To: <68b53c52-9834-41f9-8e40-ad27f00436a4@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 25 Oct 2025 15:00:25 +0200
X-Gm-Features: AWmQ_bmJOsQ0f363KiSb1YhEOetWFbn1bZiw_EvFWfI2HmZUeHb0IvCaFzOzsSs
Message-ID: <CANiq72mfjbiJDSz=n3BR1quNwbzYB1ZZhADDU5P3b0bDmGEk7A@mail.gmail.com>
Subject: Re: [PATCH] rust: phy: replace `MaybeUninit::zeroed().assume_init()`
 with `pin_init::zeroed()`
To: Yizhe Sun <sunyizhe@fastmail.com>
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	tmgross@umich.edu, netdev@vger.kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, dakr@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 25, 2025 at 2:50=E2=80=AFPM Yizhe Sun <sunyizhe@fastmail.com> w=
rote:
>
> It is. He requested to have his patches re-sent because he didn't have ti=
me. This is my first time participating in kernel development, so please te=
ll me if I did something wrong.

I see, thanks!

So it is this one:

    https://lore.kernel.org/rust-for-linux/20250814093046.2071971-5-lossin@=
kernel.org/

When submitting a patch on behalf of someone else, their Signed-off-by
tag must be kept (and then add yours too), since they are the author.
You can read about the procedure at the end of this section:

    https://docs.kernel.org/process/submitting-patches.html#sign-your-work-=
the-developer-s-certificate-of-origin

Also, what I would normally suggest is to indicate that it is a resend
in the part outside the commit message (written right below the first
`---` line), ideally including a link to the original patch (i.e. the
first link I added here).

By the way, ideally patches also have a base commit with e.g. `git
format-patch --base`.

And no worries, it is all good, getting these details right the first
time is not trivial -- welcome! :)

If you could please resubmit it with the SoB fixed, that would be great.

Thanks!

Cheers,
Miguel
