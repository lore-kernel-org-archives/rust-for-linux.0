Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20090325714
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 15:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302996; cv=pass; b=qThgZyb8rSTwZBW6gehpWVuhovPH/3fcMkWdQSsSqi2zYZ46G/9so5fLUGyQo17CVHatVakyNe841p21NZ3azxz8Re52eavp4RwcNOO5o7ynZp1N0yHQOdXeQeSiuhUj1nqqY7t4P9R5U3oT1rcndvZeeKcztAp1KC91rovO+WE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302996; c=relaxed/simple;
	bh=PJa9bMhGX9RVMYwyZBZa0XCG92DEldh3qRNrMqjc1p0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBmrjg0neQwxtaWRyy6F1OEXeebODAelPVWwCf0i8NSdytA1Ob8ldndejNp7NoD5YRIsmpFFoFsGmHSCRxSd3vvIhUzVTCyCBNDBZZXNOY0rPoTwed4EL2xwqDCVSQ57XMcENfhuCDEvXl/6un+7B/VeM9rzeq6xOi3m1v92dXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oN8PE6iE; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oN8PE6iE"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso77867845e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 08:16:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777302993; cv=none;
        d=google.com; s=arc-20240605;
        b=lq3poevCZbZuP+BYOSyxLuNHojvH2QreZi/hZ9sa/ntoll5f/kr2VajmZuCM096RNe
         V3OZXQitF3gLo4NOImFDTrumZtS3rX10/ZsrXi9csxVylmYaRb2M3GpSF5PEWA6DxQWf
         3om8lgm+P2RziaZ/FYD22FrdeYHPCJKPMjcCiPP6mWPSxmDPOKa98LIO25d8hR4FeNxx
         jdNBAcxbeZ8SJIZztRaIj7wmgj+utj1QATjWgX9oS8yfeJfLeCwCzlVv1cobhBVneStk
         LvEyb33nQwcreq45KjaB3uprF9NKkV6pR1VXq3vN8yq3i1NXin0gOG55PEp11pg760Gn
         7yzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PJa9bMhGX9RVMYwyZBZa0XCG92DEldh3qRNrMqjc1p0=;
        fh=kjIZH6xqh1N4B4M0IgOCGw4GZ7xq3oKfYUBFGCZtPRU=;
        b=RiFdeiSyW1EGcjzRcx4Tfj/oD5m+Vx/n/AJoKYskqe/QDJpMbZ/ZmW4neWt0Zx9co8
         KtuLCFC7o+/CNo32cs9e9XkFbCBJWzc2Arm3l9H8hawmAOO8JE4zULabNLFEUHe4iqCu
         qMtbcQyWvFj6YcMgzqDafrTXnITAtg/sUysjZztnow7RyrAxepSHf5k2i8Q44XkBHowY
         ytdFSbvMsePYzx/eTnjZMkrPrKErtW1wiiESwe1GQ0V6DfGZ15sKeQYo8yhPE1McWs+K
         w0cfmfS4lt2tjtcNIdvo5qChLWGJQJ4Ga4ikkYv8slNaLYBYgrawS1thg+K69sNU28X9
         ojfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777302993; x=1777907793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJa9bMhGX9RVMYwyZBZa0XCG92DEldh3qRNrMqjc1p0=;
        b=oN8PE6iE7rz63Go1lgMaZ35G6PfVZ7eJE/daXd6fx7Ldf76+m4xMsE0CSeAQswcdbI
         EDFHn2YFsU+jbhU6p9L+jxtOOxy5xlx9UDcNh2YZsWL9IPZcuwnxH+2DDgQGjOxZcnOu
         3ogBruLim9N9QfsUtarCp8f9QRJtD4lFJrSguF9uXHgcICW0Iw5jw09J9v8DUOEsy6XU
         YQKG0nh+H7LQKfs9VqX4O/uVJlYfL5LzUNoHQQFX+6cnSl2ADZOUsgvo97AzWK9qo8CS
         aZALpNLljlX8gjzkEuQZ6purgiUOuIxw9rTn65zUxjVqNEOvdsog1okhjo9raBVd4CkC
         lqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302993; x=1777907793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PJa9bMhGX9RVMYwyZBZa0XCG92DEldh3qRNrMqjc1p0=;
        b=UsFffSs44mTDgeGlfi3gcOLpwtChrPnTO7BQjht16/cbVynCbxOeQOJkvoiA37Vko7
         5z1pWG3iVO7vS1OIGbSzYMZE/NxW0MJkbk8f1S9y6Riit4wzzw/M1RzXIpods+oFaPZ4
         W9srSY/gdeLvNEdvMAJ1NVNymkP7/8siYP4ZWJw0xVDU8QESrqCAxQmh8l+TedsF7OY9
         neSckdipar07XtPcf2ijj6RcZaYprhEcG2QvVZ6s559jXycYAnc+lz/+e5/TJVxyREix
         y1u57Ie+lIk2f0UeYvUnCCNUSkWB4YRz9aNP1zmPPfGlKxG5dMWEVTgoaTgvyYOrShyh
         zL2g==
X-Forwarded-Encrypted: i=1; AFNElJ8qInGDmJwsBvqBxT/cG7VaoXS/+OrI0x36W1EEUtvnMNRuBHJxcEX7EkYWDzldfMJbCux1untiy4y4B06AeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9mHqBHKixRn5w+sjR0Q5ZQJ4YzlOy0kaNGa0Jg0T7VS6lJCi2
	OZJJuYTGDv5dVwKCpRJHJb66tNpFvWb0ZmBqkzyA4PkxpsFJiy98FkNpnHypcax2HjwyGgd8M9w
	+b44onEsF/SNevbkz6B3nSrV9rVN0YOxDLIOQ54X9
X-Gm-Gg: AeBDieuq5G/yJPseUWDI1TfVfA9dnbBpTcDxLM+M2VV69b8bcbszSmwn1amReKz+k74
	AU5oXdyvSbRzEzQ7oLO4cUy7gIGrnaF75mNX2S85nQJSs0/tzYeALUBBdsh2G836Fen4mmreH5i
	DOKOMQTcHSmPLBMLRlS2I+tBdldAsjkNKIEcjKT+JPUuvIEM+SbLmF9fm0ds0YfYZlO8n2i6diR
	A9+WgNIwoWgCfNyrV8uo4K38ej+BjnuisxI4aCSCERkEEZTnHFxqgoQhEJg3QvHHBA6lEexmZW9
	eoo3t8rWLgamwnopAk6ryqSuabQEEU4lhudTaQ7ePTNTydniBxyRggw02+M=
X-Received: by 2002:a05:600c:4707:b0:488:bfc3:efc with SMTP id
 5b1f17b1804b1-488fb6e8eb5mr595352905e9.0.1777302992997; Mon, 27 Apr 2026
 08:16:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-fix-filter-v1-1-b3b197c65daf@nvidia.com>
In-Reply-To: <20260423-fix-filter-v1-1-b3b197c65daf@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 27 Apr 2026 17:16:19 +0200
X-Gm-Features: AVHnY4KAY2QwmGRnuhedbg-TBD-sFQ_NwPHSYpSKu7X_Afz8POA11i5FEeRnKEA
Message-ID: <CAH5fLgitiuCiSOLbU5f8uUxYNK6fr22wLuP69BSEHMoOY-Xi-w@mail.gmail.com>
Subject: Re: [PATCH] gpu: nova-core: simplify and_then with condition to filter
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 9:11=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> This code is more simply expressed using Option::filter instead of the
> and_then with conditional.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
