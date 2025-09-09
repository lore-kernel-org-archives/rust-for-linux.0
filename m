Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326AE317709
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 10:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757415475; cv=none; b=H2Tc3HcEN57v2rcJPnju511PSjkPHpPWvSwj5ZZmbo1At1OvG9bfx8VQW0h4mm2TDXsYw4YdxL8qjHpsfppC5Jr+fwO52dMoxcDIGefrD+m3+JlQP1YfvaVXAaPq7HlehTUNV9QvvLwGstJBOdXyLmizEq8c79R4WPm99L1vdIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757415475; c=relaxed/simple;
	bh=2qJii75iX2H9ZNmZHO96TRyyefKym2oMcBVinEsMC3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOv1IUOjb9eFh3rPnI09m3wEyPr4L0WDM/B+IjFY/eldCSAD4UK+g/oLdXpLSQ5WsJ5RVjtyxUwG1rPMyjye5/PYP1gpAU8MXV2nHFoYzQ0MGDqUBx7chk4ycydbKPIu3+z/mssxeuApUyqJfX3nqxyGU+6O6N2U0az8mohiKeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHrtPiqS; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHrtPiqS"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-32ba5163454so452635a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 03:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757415472; x=1758020272; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOj657j5Mnz8nVz+aHzr8oWclDauOAy9FeLA5tjE16Q=;
        b=dHrtPiqS1VZM0UI0SiB0xsl+itFnqtwkkrVklzKNexbMHFJLuOXKzgY8LxTDtmbIt6
         GhY0HV4pIFIdU8D3/2gA8OWldM+gV9KFerqT4LZ+2YSdRveymIoZrRW2flPrsTHZF0C/
         aDnUpsGxmgiZlSP4kDnjIytEO7V/H+jCQkakVc50NoAm1Z0IE+j8vFLVR+uWPvr8Zy9N
         lMURjwcvcbvzuhFqd0v0lhTmRq1eBEzS3VakiEOY0lifJjWBWZlKStWjSDN7G+Xj5KLP
         p4isBv2c8hS4BqGXGimtmTqtJCuKTVRATYAvPtvF+jQ3cA9KoRGOLHTQbpHLqgkLZ/nT
         Uoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757415472; x=1758020272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOj657j5Mnz8nVz+aHzr8oWclDauOAy9FeLA5tjE16Q=;
        b=s2HC90mcCMb30Up3/1EHK9+q0ivg/DDXB66WQQn29GOukj1Vhm4KUqOyg0NzchkJ1b
         ICAkiY2IVMa2IXRLMgKbRMUVleugfPQfakctHNsJ4H43MycuH6hALw7PokeUGKzxLT7C
         NvwS4dLXMiqpw56oGWjy8Rz0Nr7gYp4RIbdPveSgmuFQK1y2YrYPg01BoLW/8PsZnXW9
         u2CzIQXdy95uufvOX4AEG1AVrG/QhG0c5tH2G/GUNceTmp5oZpQQkMU8RWp0dXQuNdN6
         S8nO7sOPdJqxFaxeIe46R4wWK7GupGQCRCvN+qN0ZLpTL+TkJ0CN6porrUGtgcA4mUw1
         Pppw==
X-Forwarded-Encrypted: i=1; AJvYcCWuaChwTdnfK3TYCBW908fStl70QSxzpZyFrY0MF7QrmCVniCzHJRhrg3mfz5VguQZHDLfDPwy8r6WtDAt7mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK/ZdnZmIAd/8dTG0bObopIcT23BncNX0N4Go+rrPlnfk/eYOp
	oS2/RrCHGmZzXtQ1nZGtYQH43Zg7y8w3rJKIjp6SPeIGtoLactXliCZooepeJn/7ydKvywWdqnN
	7i/iPUmde+WlcZzFTpXxCz4eoiupWlCk=
X-Gm-Gg: ASbGncvsGsEfhkRZWRgExmPJ43/biew9hJ5mlYvHfxz5LAq8ovujgMZ+8/QpMvITNkG
	Iicuew+zy0t02hkIN0tJ2cczDTBZfPNMZ/HjdJS0wMDD9+J4nRoO058fc4MRNMxKl+6Ixm66OLa
	mDk1byoAO75QrG2uIhEFstob7+TJJlws+vTDCIEilQkpNlEe2DFHC8USnYkSujDgZJiE1d7FyOn
	fT7rpmm0+4ocUQ7bOVLeh9w6oM6RBG0jTk8S5HoSMvejk19vz/QYsFOiQKGvgTM6FupezZME67m
	tybzD42AuvRXjfKLukgjQbOl7mrD5qPboKZo
X-Google-Smtp-Source: AGHT+IHmJSD9mvx32JMCMKUtj+A6Iea7OUmn870TZehtVnrYC8OSU5oHqTLumOjvLIOX3eQTIcrVZlGUnPI9cim9tKY=
X-Received: by 2002:a17:90b:1d12:b0:32b:6abf:d94e with SMTP id
 98e67ed59e1d1-32d43e2b577mr8427871a91.0.1757415472504; Tue, 09 Sep 2025
 03:57:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aL9Ch_XaYTxMzFXK@x1>
In-Reply-To: <aL9Ch_XaYTxMzFXK@x1>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 12:57:40 +0200
X-Gm-Features: AS18NWCGswd-XFUKG33qMZwlodKSwmA-15DaQhSx_nbEJ5Xz7_FyaFy_GrM1YqM
Message-ID: <CANiq72=6yb5PZnuPYX3xWAms6pfYmfpoPj-GE1AZv7OfxcROJA@mail.gmail.com>
Subject: Re: [PATCH next 1/1] perf symbols: Handle 'N' symbols in /proc/kallsyms
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Ian Rogers <irogers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, 
	Kan Liang <kan.liang@linux.intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 10:54=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> +       // a seemingly Rust mangled name

Yeah, it is a Rust mangled symbol:

    core::iter::adapters::map::map_try_fold::<usize,
drm_panic_qr::Version, (),
core::ops::control_flow::ControlFlow<drm_panic_qr::Version>,
drm_panic_qr::Version,
core::iter::traits::iterator::Iterator::find::check<drm_panic_qr::Version,
<drm_panic_qr::Version>::from_segments::{closure#0}>::{closure#0}>::{closur=
e#0}

From your `grep`, it seems that is the only one you see? If so, it
would be nice to understand why.

Cheers,
Miguel
