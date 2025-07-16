Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB50267F58
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Jul 2025 23:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752707977; cv=none; b=YrjutUviVUWsKDu6lUYlSs3TEy2jIjfBHaP+G9TYnIV7MLreGfgpE5q3JeTOafL3Hwdv3mj8MhlIN+lQPLukKUHJpmjMFgwXhazU1WepwaNxLYLZzgeFwf0QGUnQkHWw5km6yIHluHPmfcU7r/1HkOP+eMJB93KiODkTburR3bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752707977; c=relaxed/simple;
	bh=9/NnJDTcQwKH0nX4EoIsUlDscSEoGQ+CI3cGaPK+Ctg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t8HbOV+xTaxNlaMcb9DRMqCRt+wqh0eE6r6H8S7VgHlefUDcRCZkaG40xz0ed8x47mWex1Y70Wamv7JC9imM3ggecagkyP4a7s/ayKaQO2BAxC0gPGs5/hs932oHVi7k3kcOV3nPSoawn6GYntaA08EfqRhzqe9AUh43pfrsgMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ifm2d+JE; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ifm2d+JE"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-609b169834cso2619a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Jul 2025 16:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752707974; x=1753312774; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9/NnJDTcQwKH0nX4EoIsUlDscSEoGQ+CI3cGaPK+Ctg=;
        b=Ifm2d+JE80BYbwXflvBz3bueuGj3YgIHqR4QY99jKgc8N95hmnd3shmqX6OmpFQVrp
         p42Go6U4UFu0eZsm8GKKSWc3sik/JfpEwKdtvMq4wLN0z/UbAyoRyOHgN6cbdziZeudx
         PIpjCiz/43rVxFPnOgSmsHrRO9Vsm/rjv3YibMQwiigD0v5YfPIXS6gyKHPf2q2uh2fh
         o+A1mg7ZRVPctGbmLcTN8VXXsq+XAXLiiI9eaFQBFE1KFJdQhgP2FLXMYFSMMQ3DAu0E
         zL+nMsHptOWKIGgciwtBOLFbVrarfsOIeUpWMmquKsPQ7iXBM39MywcAsBGCkiK3YGVy
         n28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752707974; x=1753312774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/NnJDTcQwKH0nX4EoIsUlDscSEoGQ+CI3cGaPK+Ctg=;
        b=FRFakQMNcBvxjGAJm7G3xx1N9iVkspF0QnSFYx6azFEx4IZDtDcqcA5S+LhgBMec0E
         Evg/v64FsilItTDNeJulufnyUkbib8SVRZpVNDr3LYwQOmz6+EsAFG5X4am9ZLehOhGR
         ms3344HzQCTgMueBQMiOkMp9pjIOaHQbz8qK0YaPHHLba737c50s+182xt22kdROeHRC
         z5KUNk9sNrpf3xdV2hKksDsprvlez0mPivsuAhX5/38VN5d+y4Ud3e0Qo1vTWdqSJqr0
         2KmKpIOziIjkwBdDtC3/4oaA6A9NjusfN3XnQ17hJNETDlLWRFGTk/kQkDDhTHYS4AIe
         05/g==
X-Forwarded-Encrypted: i=1; AJvYcCWK8fkCHgCJzjjzwtBzE/K+hHRWzAVgU3P3CVgzwG5ZxWbsOX5DX5Gku+SdyEL5Jsdo8+C4nV3chC+JGAt9Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy85UlLqio0wJaO6gXzbgmfwFhroRPq6VOnompEDFZz9980inlF
	raO7BnKk9TXFagjx6AuHdZGpou+yC4aWLGvJbmY9QBlWKxe83Ju0hYAEfgF+8rY28/WOWBAfBvm
	NMnEIiXp8Np+jnxUDTFAS4QtX049d1VCKaUqc4hoO
X-Gm-Gg: ASbGncupTp525GGOTxE2FBgU/2e4AEzJzD70LPcS/DXQp0ROApWucalfW94nNW5GeIF
	4ylLCYCKVlKmy5GLDFcJcZheWrQQ1BMCApduZLRKrbKqOznnDNAvfkBrfz8hgEVsY4t9db5RIfk
	HX7Ns1EPKLrmGhzbZYeWQ7O+cmfuk38GqPpnfXhR2cAUUu2MzjVv452wU1lVGcytOeh1aJTsB7O
	Eog0QMk0JZzqJzLgn6G03BC/uWj55WQ2yaV/lOzUejZU40u
X-Google-Smtp-Source: AGHT+IEWW6wSvnNGlneW8csSuEUINBhv5Xrj4krisO4j8KjigJe6weh6HtfKmo/FhQRiZhIVz1T5uW67ohk4ura9SHY=
X-Received: by 2002:a50:d75b:0:b0:601:f23b:a377 with SMTP id
 4fb4d7f45d1cf-612a4cf8fc8mr29145a12.6.1752707974101; Wed, 16 Jul 2025
 16:19:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4c459085b9ae42bdbf99b6014952b965@BJMBX01.spreadtrum.com>
 <202507150830.56F8U908028199@SHSPAM01.spreadtrum.com> <c34f4f606eb04c38b64e8f3a658cd051@BJMBX01.spreadtrum.com>
 <CANiq72=v6jkOasLiem7RXe-WUSg9PkNqrZneeMOTi1pzwXuHYg@mail.gmail.com>
 <24e87f60203c443abe7549ce5c0e9e75@BJMBX01.spreadtrum.com> <aHftocnJcLg64c29@google.com>
 <CAH5fLgiiZE_mFhB4J+G7-Jdz46+d-5NP15npjn2_H7DgSAynxw@mail.gmail.com>
In-Reply-To: <CAH5fLgiiZE_mFhB4J+G7-Jdz46+d-5NP15npjn2_H7DgSAynxw@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 16 Jul 2025 16:19:22 -0700
X-Gm-Features: Ac12FXxXgsXM-s4jPwxbK0qidi2uE_QL2umvn-Fdybn9nHdZCi0VGiyXjMukuYQ
Message-ID: <CAGSQo03DH9L7OFZsGXU8gt_4iq2zo6gZbJtw3p2hD6tGp0KTzA@mail.gmail.com>
Subject: Re: Meet compiled kernel binaray abnormal issue while enabling
 generic kasan in kernel 6.12 with some default KBUILD_RUSTFLAGS on
To: Alice Ryhl <aliceryhl@google.com>
Cc: Carlos Llamas <cmllamas@google.com>, =?UTF-8?B?5YiY5rW354eVIChIYWl5YW4gTGl1KQ==?= <haiyan.liu@unisoc.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?B?5ZGo5bmzIChQaW5nIFpob3UvOTAzMik=?= <Ping.Zhou1@unisoc.com>, 
	=?UTF-8?B?5Luj5a2Q5Li6IChaaXdlaSBEYWkp?= <Ziwei.Dai@unisoc.com>, 
	=?UTF-8?B?5p2o5Li95aicIChMaW5hIFlhbmcp?= <lina.yang@unisoc.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	=?UTF-8?B?546L5Y+MIChTaHVhbmcgV2FuZyk=?= <shuang.wang@unisoc.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	"kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <christian@brauner.io>, 
	Suren Baghdasaryan <surenb@google.com>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"

The reason removing that code makes your build "work" is because it
entirely disables pointer authentication in Rust code when you remove
it. That is likely not what you want.

> > We have KASAN builds with android16-6.12 and haven't seen this issue.
> > Can you share your entire config file, so we can try to reproduce?

This - please provide the config file or instructions to reproduce the
build. Since this is an upstream avenue, ideally provide instructions
for reproducing against `linux-next`, or failing that (e.g. if it's
not broken there) against v6.12.38. The default android16-6.12 build
will work fine with ASAN. If you can't provide the entire config file
in a public context, or if you only have instructions for building it
with Kleaf + fragments, or can only reproduce with the Android tree,
please reroute this request to our bug intake system (I am pretty sure
unisoc has access) and cc myself, carlos, and Alice.
