Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC20385D6A
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Jun 2026 10:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781347276; cv=pass; b=m10bg2M2ItTw5hW92V8oNQUyFA5hvVq8e9YJVap92Jx0IxpFTUDqTIumntsIbLVTQ18SWTOCKyN0DNfi3RLRTBzLUfaxsybGfwXar/gwKlfDbbIIhhNOXnoLiU5wOrll/Xvj48mNjN5HIft1Yt6I4fOor7W4xnW9LQbNRmL/GTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781347276; c=relaxed/simple;
	bh=7k6tbN+HH+WkUq4HSNO/mcXSBNU1lROqmA4mfJkiWzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WwxkJupkz180XN4uue5z+0uqfODUi15WrrXFatXAlUBkMEAMkItaQDuylNrsa+0bHBFtOLMjcIYisovj2e7M449e0a+g3CBDpOZiedsNbuBSHaIjNaugHFW5l53cgafSfoGnjyMf2qTPhEoOo8AvgP8yB8c5UTuaMDbMf+c5gqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hggXMU4p; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hggXMU4p"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304da3b4508so232640eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Jun 2026 03:41:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781347275; cv=none;
        d=google.com; s=arc-20240605;
        b=KiOMRasd2ZriF0ZE4L3bTS5kwyt7Jtc5SlaGML7+OnJpuF5ocb+7wNstAzY16NKE8f
         lGE6UjZoVFVY8ivRL7gFuAZEQnhjVaqUkSC5mdd3JOyiJP4iuJ/ztyLHDH06gA3j5McB
         STRp00dQ2zRf+Y8HLo+oln68WmbclD/JCIFY7VM8CpuZdBHARGLs6g+JTNY3VS4mz2of
         l4MPWueyjccAjt57m/EJAgC/6iC1G/+akZh6PKPAHoFnUW62MEdoGvsWY4TGzNZQgD7U
         KbNqfO7kBwT6RH0PVWz/hV6Y5Q7uwXv83KS9gJ/1vgiaWlTcb0kd98sfekYFofKBcOjW
         tsEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G548kc/xuN9FYSMWIgZO2PFN4NWhwpWrdwSftDKzZuE=;
        fh=WSR3r2iGuPxzriRVvJ/7xbtNq2nQ+7U04bqxb6INlbg=;
        b=MuYjHU4ll9j1DYONSu/R4YpOwYAiGtMZm2LOOa5vD0hUp44amChrzPpuo6FJ1d48lm
         mitmDGk9+rctlcYZ4oHA3S6F1jQvXXEtHpaYqO/ivd0YphaGaOHCSGZHxEUFZbh9mbI0
         rIvtN2FfchNiEcw2+kjrIgwTHyDq7MpaK2YhWs/YSayBltJrJs5cE3SDZG//WNPwDF10
         krcIhvLBBrTrzUYHx4CH6RF6LT37DT45a7SF5054cu0kdPkDYE01dxl6k5ClqNu+8xPV
         /z/TVkXqFy6MTF86mleSe4SA80oavG5CNxjZumYqofcGGYCflB+pGFsQe1XMTXV9o1z1
         0ToA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781347275; x=1781952075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G548kc/xuN9FYSMWIgZO2PFN4NWhwpWrdwSftDKzZuE=;
        b=hggXMU4pAdKn2lZVKQNgKjiSta2uifLDJ9Iw/l48crsFzrm3pbnbxxy1To2ak1jByT
         FsTwmGAtFUqq3xR5x2gmKgtlDFR6VIyUeIVUhyC1mv0lSQ2DJYl9aUHrq0Tn2vgbhdyD
         64MYLIERBYdof+mNse5jpRn3OOFgL83vhqj8wJobew/GLHRIadj/qPqfBvx2f+gu22cB
         G68l/HyYn1KEFja7mTg3a7a+gg9VZadaOpmNwO+Rv29lokcfcSpp6O73hfztkdCDV+Iq
         SuEmMC+UyKiLEGR/ETfUagX0rgZ1wJCMFxhRnmJd3XM3po15eqBiGDd6sa4rfqHAzYSQ
         mLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781347275; x=1781952075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G548kc/xuN9FYSMWIgZO2PFN4NWhwpWrdwSftDKzZuE=;
        b=hOHM2MTDoU5aKHcQ5pUczfgz4ozYMvEN3qVUVvcVnR21ratBIAUqhhHCKkazf45fv/
         PilM7ihhIi7Otcs+i2YlOsBWjbNz5+efFL+8B9D9yJKLuUccFC4DHmaoTxw0SvRmyr/4
         6SvQhp3nB4/R0Z9Cvl5xIqyai3JRHrYgbk6A7prwK9nMZE5hTx4qqRh1WYP530AdPlXT
         4mnQrTGPqXQHeRBeYe2Kljxibi9FUY+dNgJevtukPa3chOWeF+IXXoicUz+biwRGsRBs
         qWzaVtFv/e9wjnmYu/pCerrDLTc+kZWfKKKFDdu9Tg8xosfl+cleg+CIXVk8ICx2rwCa
         Ch0w==
X-Forwarded-Encrypted: i=1; AFNElJ9q/eMR4yNIfUK5XioxkGXEkFQuTS84m15Wf/XNOIDQcd7ua/tLNV9MqcdU2CoN5WPnSMfOgnWF6qHZoLqR5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Ds0Vi68E/IX9KFV2P8bpWkDjurDioUTVc35l3XG69CdmHdIT
	Ebwfn+nUjpWdtIMp+5NiTDEJfa1dgxpUdRcFxkehscMwJzsDAiFIWaJdLrLPrrh+xrdDpWy2daR
	kpByLbCB5tJCVMjPpwYwtCo4+C7fyyUc=
X-Gm-Gg: Acq92OFWcH/ojQR5myw+KEouP3XHQiBbngYNUcf+dV1ADHdXq3g4gV+nOxmXsS67Umr
	ojlf9Nmol6AQ6ZrWnTWwJzLRdkCG5ozIXGbRXROYj5TqVSu+lkHJfbI5zIH7674Ua3BDAXZSin4
	vnEiYmri6in95Z0fzZdaFJsOGgXqUtWnVuyhUZAh4MhWsszkdMt1zzWAu/CwzttcWLCa54UcJEF
	rvbj4/GlFRHmKOQUifsb6luR7dM/Y7HFkdv/agAhB34ss7KpnvTWmxhgCDer3vEBSY76HQzdObB
	bjN66dUNCvt0MUdoZE9mDBP+V/U+V+2fLOdNQ6jGnRqfw1w5fcpdzwQzjf51Jv6rDhTbdLk1yVS
	DEQQMeJuchncVGc/kbcXG3WZLL3LPqKQr0Q==
X-Received: by 2002:a05:7301:1e84:b0:2d8:7302:d3c with SMTP id
 5a478bee46e88-30820037738mr1755166eec.4.1781347274604; Sat, 13 Jun 2026
 03:41:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612-configfs-syn-v3-1-3292fbc5cc32@gmail.com>
In-Reply-To: <20260612-configfs-syn-v3-1-3292fbc5cc32@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Jun 2026 12:41:00 +0200
X-Gm-Features: AVVi8CfjPkD66q9qYEn1K64zbUlvP5cZCsx1hvccWsDn4EDiuxrat-r8eY-_Akc
Message-ID: <CANiq72=RX5V6W+1tj0GHxZusrk5OqYbZ5-xV=wvSssrx_CWXAA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: add procedural macro for declaring configfs attributes
To: Malte Wechter <maltewechter@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Malte,

Some quick notes...

On Fri, Jun 12, 2026 at 3:29=E2=80=AFPM Malte Wechter <maltewechter@gmail.c=
om> wrote:
>
> +/// ```ignore

Empty /// before examples.

> +///     // This will extract "foo: <field>" into a variable named "foo".

` instead of "

i.e. please use Markdown

> +///```

Missing space indentation

> +/// Expands the following output:
> +///    let item_type =3D {

Missing example block, both at the beginning and the end.

Please double-check by generating the docs and looking at how they
appear in the browser.

The prefix of the title should likely be `rust: configfs:`.

Thanks!

Cheers,
Miguel
