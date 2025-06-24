Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641EB291C00
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 12:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767740; cv=none; b=ZzDbgVmvWvJN8dLZQISFxJGu9dUt2fLrPnN5E+lVtfdRxqUviu18gkhsdVHnEA5k/eUhW59xxCNtSRui84vHixz8p6/uIO2nscxOwMQ8OiXyRtXiNxJgdw0aXt6lDH+V8c/P68lu6TF/aUL/+5j4BQSYEP0reqGgjXY69M3meeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767740; c=relaxed/simple;
	bh=ke2WQPybOgcUxwixN8c7d/mhUrvX7BuU8BuS+ykj3b8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jIoFA8C0BxlbqVrTkk6RPAt41YpfqBJ79hxWJmRLuxyuNrMLb14o8GBQatC0tJErbIRTeAarvY8xO3QdTQtgC/53ABStIatDeHy0X3Sj+aDJ4onx3Vk3fpmi0EVy1vfp/Vd9z3hfJAI6BImjsgd07RzTka1OMQ550BYM62JBfYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OBVypqI1; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OBVypqI1"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so2764188f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 05:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750767737; x=1751372537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ke2WQPybOgcUxwixN8c7d/mhUrvX7BuU8BuS+ykj3b8=;
        b=OBVypqI1i+kHmUZvkZlNaeKKUqLHM6Q9ZLzsFW6MJ+GPEMSncUwuoDLlX7C8NHGdim
         8SmIg2OlZ0/vtApRxqNfuO4M6g+Znle+p86vP6x6uBnTRyjOGYJdUAwHippvxBE3LZle
         9WnokrdtIxrONPuU1pUOtbbPczNsdwcqTmXOP62uhTpKBt1wirPDmPGwVY3gSScpZvwn
         QrVhSmHlUGm7PB8p3HRyl2LIqk/qDJHqhaswIiHS/ClP+WJN6moQ6oKJlbxWJUo6WKCx
         Kq2DN6AzdSld9REEDoGumYJ8BC2+UPbvhQ1VCQwbz/DFIFg44rfmF2gWkt4ePMukW9Vf
         i19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767737; x=1751372537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ke2WQPybOgcUxwixN8c7d/mhUrvX7BuU8BuS+ykj3b8=;
        b=bExxahhPTAhyv99tZVBdMb7jyGi8319HOiJmd90E+E2OPSyEsrf5AY6szo5Sa9tyNe
         +6CWIJCor2nj1rv25uqTU6ZQqlse9yw1hWMuVJS0hUcQi/7ZIpVkcrMghgh5hdWOTimt
         pDlH0E4z+5jBELOBi9sOGjmRWwgJrMgw41riLvporDCutg/dolNDn5ysAkEji1L4/vHA
         kl8e/zh9gDng0DKvemQ3fsJGMwCuVNiH/WyKzRct1H4fCOv0quHub5xTCNrK/DPIFts4
         JCAE7UEVjELpMMQ3C3ge49i4C5ZRFJQgki2ICIiwjazFWEY+MDVhsoxXGfKLG0yvSuod
         nQWw==
X-Forwarded-Encrypted: i=1; AJvYcCUesB3ZNxg85d+UeuC2CENWz2KR2ectitdobSYHCarEaT6X04WKZX7eD/efbXgx0e5/4Lkepc0bPNt5gbEieA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxayPUFTDgnDSfn1a04X/hR5V8J3eJysYtcTkfd3S8Ezrhw0eN4
	ePk4WishLngvHLeXJbI6RTk2RnwvRV7DEM3mP63iNNvpcYBMIA8JayzCGcS8PF9pNa8642VE3o3
	fQqVaChPKYnK9ifrp+3qyPX78Q0MN0I5x5WQ+xYS9
X-Gm-Gg: ASbGncuUu1KZmjguG12zlFOgsrbSpZHdjDoW2cjGS98zQ4qOUCvScJCdOIhfcxSZNR0
	aAZTnsjrCgNYSS9FArXHYduz0UBavGiY8dI0GvYTmaIrSoMe5DYfPdUjxwFmzA65w9MwVceHyn1
	dmRGJhxC29uJfhfGe2xrmiLIl5PO8NXfH6eOS3wpk4a+0CdnqsvFK6E4cQBkAwUSJRBQ2X0zNM
X-Google-Smtp-Source: AGHT+IF8J2EIOp77UpsDYtqYqawDpL1XEbi5QijdABp269UxxcArWjT7XxJrGBHU5TuZpdlADjizO9R97lnrT4xeB98=
X-Received: by 2002:a05:6000:641:b0:3a4:d4cd:b06 with SMTP id
 ffacd0b85a97d-3a6d1307071mr12170709f8f.34.1750767736581; Tue, 24 Jun 2025
 05:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624095121.3243540-1-vitaly.wool@konsulko.se>
 <aFqT1mK7SYsYd3DZ@pc636> <D562EE6A-DE99-4C97-8934-D60682DDE711@konsulko.se>
In-Reply-To: <D562EE6A-DE99-4C97-8934-D60682DDE711@konsulko.se>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 24 Jun 2025 13:22:04 +0100
X-Gm-Features: Ac12FXyXKMzbHkeJyOfFWXEnIgdkzQXLk3r2f-LL3zzOyylWWdebOstUjTi5q2k
Message-ID: <CAH5fLgjYg_S574yQac=jQaCMM9GLkjRstkiB7tzw3iopkXAbTg@mail.gmail.com>
Subject: Re: [PATCH] mm/vmalloc: allow to set node and align in vrealloc
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 1:15=E2=80=AFPM Vitaly Wool <vitaly.wool@konsulko.s=
e> wrote:
>
>
>
> > On Jun 24, 2025, at 2:02=E2=80=AFPM, Uladzislau Rezki <urezki@gmail.com=
> wrote:
> > Do we have users which require alignment and nid? I see that it is part
> > of kvrealloc() API only.
> >
>
> There=E2=80=99s a patch pending inclusion of this one which will be the u=
ser of this change. I was reluctant
> to combine these 2 in one series because the second one is on the Rust si=
de, but it can be found
> here: https://github.com/vwool/linux-mm/pull/new/realloc-extend.

I think it is useful to include the immediate user in the same series
so we can see how it will be used.

Alice
