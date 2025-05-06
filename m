Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50F3215184
	for <rust-for-linux@vger.kernel.org>; Tue,  6 May 2025 04:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746505418; cv=none; b=P37jWw8uOu+dAFYSRsAn+HwhUzACG7cUdwW9aAR3XLhELkOUCXPzqrzUMv6hrh2i850P7IZ01iZ8+wHut03Nyog/H6MCkI7nUehBrl1zGm4llpjQdqmlwYJ76mzLtP4Adz9hqKdvrhdObE4c+6JxmPQlpE1XsBRrVUuE8Gw+3b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746505418; c=relaxed/simple;
	bh=hn9c591dXJgjp1caC2arr6sOqTPBu/Sc8oYI1nnrfhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BIg7Pq9ciiSBbWpCzneYDxwnw2BVceMfOC9I7qMSWTSe1W9nl2PxGhnXibw58NswS4QrCTIm04otbDpBfN+XhYwHkulvccXnfewt7oUDw0O8i3hIs0WDwu7wcYVAHg/o2/bXlEPinRNvoh2c9mkB6UF6TwvjGe64RNQNNYMIHXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=wyMyww7o; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="wyMyww7o"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-708ac7dfc19so40015897b3.3
        for <rust-for-linux@vger.kernel.org>; Mon, 05 May 2025 21:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1746505415; x=1747110215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kk0rHIP824tzYSJd/wcdfmqz9sqjrngOzbFuZVahSig=;
        b=wyMyww7oVuoSHfIbHaQN31ZjFvVLsEkkh1UigINhxrJdg+2rrH+WK9v/6CdFhgsQG9
         Vcju+28T1CJxfTl8bxazhFwq4sNZ9d3daxaPMRRziyhVMeuO3EMa0W3tLQpsQmN1ijNr
         WQENFLoqJbsT4JcrRybyr82QbsuAm178stgTMsNJSatDJtUVbSdh0JXe4/N/3OFNy2AM
         My/Zs7kFLz4RaBP20Q9lWee/FmZVR83jkrMv+JHVLE7IwSgHfe+uBMkBWTTieL16nHru
         C3cDsgWvjoCwku/Wm2BbyrVANC8Cdbb5OpYEaYI9UslRErnWC5+5OBFs8h5T8j9NhN2y
         myiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746505415; x=1747110215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kk0rHIP824tzYSJd/wcdfmqz9sqjrngOzbFuZVahSig=;
        b=fqyksTgh6Q5eGD4mfqPaIcOzvcul2O4fgzmDS26JK9Rob/kRSwH1KoY7kAU0XKc2ZS
         Dk4d9PTRPe5suTpHFAJAh9U5cJsNHe0FQt7pgx8wVTRLN2+cJU9FZqJ6hNLb/XF2/NuL
         uK4Fatr6W/I1KI/c/e5ZkVdL9P48bCqHJDSK/t+sKARg/GGCcAsOy6hz2/GBjvTkg0Q1
         0IUl1MY6mxvVeRCy3A1cdwPo3o5FYzlNWsGr9UDAkIku0Adyv0qJeJWueqCg1aXWpCBX
         +eYjU8ZPeICP1vaoUGAzi3EQtovCGnkhzvT+oyvL0obSz0kEYAQFzCVC/r4yBX9m2brF
         yRYA==
X-Forwarded-Encrypted: i=1; AJvYcCVm72hFJbIsjzsfF40tQvfYuOos1BqRo+AntZ+9NYHIFrjaKkmhe8hrIE7SIxSBvvP7rOToOd0TCT01B+Oqww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHMoUjytaY+NExKp/8bjGIXErTLWg3bYEplQsnaGaY58ZH8F8M
	hZf14Aixx4lekFhRJwHWame6i1IBvPoD44D9LdAeTqpgZz5lhyuBNM2Al0sI5dE=
X-Gm-Gg: ASbGncs3bxc6zCKxZ76CxR4Q4HBlbYpV8zoz6/ID7ExjkDpkkSSsMMfotWuIh0JnAsn
	7OxZwnRvBoDrwgmD6bNc+rov6Jg/DqCAoeNK95+cF5EME5Tt9uxozPAcxnfh5oGIjDCOOf1K8xI
	FfZjff52UsoEkflP3eL4+bEuY6bVfaULIZsnbCCMa46qAkwilmcyEFwgXKaAHhzqoPsHuR5Z0g5
	vGaCu1WBe9fe3SdlL78llA3MUrtIwwbyPo1TbDTDrPEYjhRHZWRjvwKMmFzcATcDhgbW/Yy44kh
	Vz2h9T2l7nyhJLnfxORZruY8WBxyJ7Mt9RMX/malKDAkj0Ddcc3KlQyXaj+ecfH7iZlr6x75iR3
	UvI81lvKiySGsdl9JwDVo8inYbq9LbbH9Y2Qi
X-Google-Smtp-Source: AGHT+IGauOMcdmDl7gE3jT1FrLe8gRcfpx/0h850sWX5FJCsvFHooQ2WBnw1X6kYbTtIVDUjYEjHTQ==
X-Received: by 2002:a05:690c:7084:b0:706:cc34:daaf with SMTP id 00721157ae682-708eaefed5fmr142349547b3.20.1746505415634;
        Mon, 05 May 2025 21:23:35 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-708c3f0a86esm25385877b3.14.2025.05.05.21.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 21:23:35 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	contact@antoniohickey.com,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v2 1/1] rust: kernel: create `overflow_assert!`
Date: Tue,  6 May 2025 00:23:30 -0400
Message-ID: <20250506042330.281501-1-contact@antoniohickey.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <CANiq72mvu54B=U+YCUmbFctj_wXgF5zjeE-BB-vHVnAP+3mPcQ@mail.gmail.com>
References: <CANiq72mvu54B=U+YCUmbFctj_wXgF5zjeE-BB-vHVnAP+3mPcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, May 04, 2025 at 09:41:36PM +0200, Miguel Ojeda wrote:
> I was thinking of just allowing any expression here. I can see the
> value in printing the values, but it makes it a bit harder to remember
> the comparison and is less flexible -- I can imagine we will have
> other operators being used, or even things that are not tested via an
> operator.

Oh wow yea this could be so much more flexible allowing any expression,
didn't even think of this now my approach feels so naive haha.

> By the way, would it be possible to have the `cfg` attribute inside
> the macro, so that we share the docs and so on? i.e. to make the
> conditional compilation as local as possible even here :)
> 
> i.e. as it is currently done, we can have mistake like not sharing the
> "signature", and the generated docs will not have the actual docs of
> the macro if it is disabled.

I originally thought we couldn't do conditional compilation in macros,
but I'm looking into it now and it seems possible, I'll have to test 
this.

> We could also consider using the `cfg!` macro to force it to be always
> valid code -- not sure about whether we want that in all cases though.
> The standard library does that, though, so perhaps we should do the
> same for consistency. If someone really wants to skip it, they can
> always do it on the caller side.

I do like the idea utilizing the `cfg!` macro, it's cleaner as it 
reduces the empty boilerplate currently required. I do wonder though
could that potentially cause warnings like unreachable code or 
unused variables?
