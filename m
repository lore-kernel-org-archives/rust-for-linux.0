Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968A71D86DC
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Mar 2025 18:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743446034; cv=none; b=jCUXyU92vbTIFNHmzaSRomVUTmlt6/iwpS8aimcG8rhHlvCC5p8clzeWKefkRnvsMJ83Q/3NZc/krgn5qRwZfreEXa6zFWpkil9OG37h5DKTf21MOziSOsRUldI4fQKnc0H9pG1vG0gAPEYPQTrAxlEpMfrMoAKlEDUOVK/qbjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743446034; c=relaxed/simple;
	bh=vrNk5gWMw7fslC/aSH1cmMvB6VpmLM4R+bB7EgWYcKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P5CgCZddNnMDiudO7ZWFMXxI/z6Bj6tnJ9/ziFEt3bRcxs53uTCY6LER36VTvuHSncglU9QeOY7/sK32vP8ePNSoAe+ElBX8Yw5Nn7519ScRxJcEYpOYWZ8L6BxA9oIoj2PDPtGycKMFUiosZPkjbsgoMRYvPYnS+3yCQfzcZFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WfP5AT3x; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WfP5AT3x"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so4701345a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Mar 2025 11:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743446031; x=1744050831; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qm1O3MAg26LYGeV9+5npvrxVPsd76nUJvpjvmTv2VoQ=;
        b=WfP5AT3xhp/kBDaIzDItYY2VaJyki75ZKTHnbcb7lgbT/m8V/+v59rkCOnEEJNcON2
         BQQ4Vs9ZWR1NswZZJ+pILHr6jn4lUMDnijkxcLjwoIlTISjXvBMkKM97pOPmL+CxRsCT
         CMyDettZAOSog8EM8Lz1p+YeePS3xn3RKpl4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743446031; x=1744050831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qm1O3MAg26LYGeV9+5npvrxVPsd76nUJvpjvmTv2VoQ=;
        b=uZ1LRhuFZnQpU9yonnXDr1ARxddXvLbdzXDL1Ihhqy55dCR9aTqQ1g2FJOkMnW9NhM
         UF8puYxQj2kXTzKiqR1pQcUK/uyfBaCayErWLmjsLixf19KjDzx9H38INfFgUvqoFh5A
         I7Nc9mtYTrUlmblJ6BrVTYEV7oHNdk8sCgYnJ0xCryyHzNbClZRGEt43nMOr00TJbsGo
         7EICzFWenfYCBVc4hQ3je0kMMumM2vOtFXV32Xb/mnwrJRXW1KxH0z1pmkHwIDAASeti
         xnzbCsM2nc/CLUM+fWeY6Sff7jNPexFLzMvhLdD4hrxj70+MgTbXOkZP/kiXAPcfbx+G
         ZMiA==
X-Gm-Message-State: AOJu0YyZ5NX763kcj370RIHGzo1WwOPKW8+6wQEjuBaZ/fu5Epkxf3TS
	UWNJ7wqOCy/7tNvJd1X3tbxL9hoosTgXiQQy1pz3Aak4Fjw6cNxYgZ7Fr22QbbK66yLO7DZSzai
	KqRY=
X-Gm-Gg: ASbGncsZG5hakZshGmuaUs5qNMplLxXnCzlMnJq8LxHN4vJmJOEULXhn1JOHZCsxMm/
	1dVjx9eXNC8r0z8MjwTefeRFq4cPlZefFFqfZnucEtdaNkC+4WzOEmSo05iVZU3OYcZPyoxTJWh
	n6X7cLltL/QmEOjgYeKYhPgrJjOPxq9xQjz73QCe4j66rrchAfJFOAjxAW1lC98ES3CK7KoOUMN
	rcD3+by5pVpfxrzVSX4uZIwrrMZbIMMs8F/bn8QJru07j5U4/LIC7BXyFcRGybq+N0YIAi/vjqN
	on5uKlLtJCzt4QnaGkAUteWZW9PEO5bIMdv9LBdJvI6R6G9bZN4XKK4Aa7iWe1+mPzWeRmxybmZ
	XOBTJ/utohopYI1azNw0=
X-Google-Smtp-Source: AGHT+IFfpYPPYk9JffmOjuPmrFKg91dn60qYPzz7V9PmU6I6AWgn8MiYoK3ULN/0ygZHOMGP3AcrwQ==
X-Received: by 2002:a05:6402:278b:b0:5ed:5cf6:e168 with SMTP id 4fb4d7f45d1cf-5edf5965b03mr9494990a12.9.1743446030762;
        Mon, 31 Mar 2025 11:33:50 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ee17fc4b83sm4029017a12.13.2025.03.31.11.33.49
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 11:33:50 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab771575040so1143234666b.1
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Mar 2025 11:33:49 -0700 (PDT)
X-Received: by 2002:a17:906:6a1e:b0:ac2:3a1:5a81 with SMTP id
 a640c23a62f3a-ac7369c1867mr725809666b.26.1743446029615; Mon, 31 Mar 2025
 11:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331122926.607374-1-ojeda@kernel.org>
In-Reply-To: <20250331122926.607374-1-ojeda@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 Mar 2025 11:33:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgyOSX4tbq0qhAkk0OCZqwiCA4EtwKZOBXAdkBW6FOANQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jq4JU66PPrn8dDycOvivpUoHu2ypgpPWx05AnaaKLgbL8gGe3Xow4zKumo
Message-ID: <CAHk-=wgyOSX4tbq0qhAkk0OCZqwiCA4EtwKZOBXAdkBW6FOANQ@mail.gmail.com>
Subject: Re: [GIT PULL] Rust fixes for 6.15 merge
To: Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 05:29, Miguel Ojeda <ojeda@kernel.org> wrote:
>
> A small fix due to a typo during merge.

Well, duh.

Sometimes I have too much copy-paste, in this case I obviously didn't
have enough of it, and just fixed the conflict - incorrectly - by
hand.

I obviously didn't see any bad effects of this typo in my build
testing, which means that clearly this rust-analyzer thing isn't
getting exercised by my normal build.

Now that I know about the typo, I can see the error with

    make rust-analyzer

and it's not like I'm going to add this to my normal build rules, but
maybe you can give a list of things that I should be doing when I see
rust merge conflicts so that next time around I'll notice these things
rather than have silly typo mistakes.

Thanks,
              Linus
