Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D79D12E75
	for <rust-for-linux@vger.kernel.org>; Tue, 14 May 2024 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715691737; cv=none; b=TzD799iyrC6rJD3jrdo7svUdXTCEWJOh72R+kWy247uUOBzSI0nZ4WNlagqjQEyx5QSvGeFBZaiXnA0ZFnYgYhQB8nNehrxlz0j1UYf9+XtkI9BF7kLrnAX9Sfkdaw34BA1LgDsStdAvx7ONbdYLvsuVVKgi3K5RsC1feYPpXAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715691737; c=relaxed/simple;
	bh=81Vs3hDatk5+oV0AULwuGRhiDaCOuBFD7ni84DWoO2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vfw88YsfC5A4KW9pM7QR7GKut4lYOREoDVWBrJQotcr6pEt2biPpjUXw8IhsHjecVoo9VoNSRal733KZpo5KMlYEjyuIO+1L+DSxGiFftfwV+OmNXkLW9ZjfaWI+XlHKGzaqB13DWoGn393RidSO9s4piDBlutCeTI0usoCbC8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3341O+6; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3341O+6"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56e6affdd21so25383a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 14 May 2024 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715691734; x=1716296534; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=81Vs3hDatk5+oV0AULwuGRhiDaCOuBFD7ni84DWoO2Q=;
        b=Y3341O+6WxA7456kmv66CT7izZSg7hqjqG1RK4ZU7MKv1DABJaqJ2iIgadefAX6DqN
         bRMNBZofvNKAdJD3t0tSyoPucpM56loMlOSABK+8+FpU6yVSyQuzNcXZNbnKV41DlVdT
         HYPpSkeN0uzw6MKRi00jvSSpj1M2Os/RNnciyLsyPlsYcMgj2M4lFSUfJUyyRBM5KNDN
         ydOgvobO5dt8LUB6+kSZH+AV0byJ/XMfPcilm03ysgxYXpV4Evitv/7Q6dKiLIZ3zn/U
         OD9sPZU6JBNT8MfSKVCWpH83EBU6O7lLc1aKiAQQTPGgdy5qUGl/x2VzE1B4gKcDZpun
         FRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715691734; x=1716296534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81Vs3hDatk5+oV0AULwuGRhiDaCOuBFD7ni84DWoO2Q=;
        b=ksGZzb8KcBPTYebNaSdfcSghlMdrazY+1M3I3LXcx9tmnV3iXhGaB3QFsS3n+k/2nO
         8SD9UvvMQ7iBCFGXxIpTPlVx7NDaWEdbaQovGWH3Eq6U0LaQEMyM8xTupHPANjBHT41Q
         Oqx71GAR/PQdoBpMezxBabUVstNrnCAiKTME4fAHfkFbEfqfgZUPOtRAPe+9NZRdu7y7
         BQHnPoLUzPFkU9RavUJN4nF7U/Au5HghA4jWqn4UR2vB05S+nPJPqsi3TOOcSX735+xX
         +j9DTr9k0E8C5Usr/uNf5+x5I5IZjqDLcNabe17CV9l1DzhbAIwFrCC5I9PLC4NmOM6m
         I9/A==
X-Forwarded-Encrypted: i=1; AJvYcCU6ZvQUrJTd+Ihe5B4nuhbgK3fxNqbfMIjGGbX6s+LTLHiOiQHV5YIT9VSPF0JLkGwkMU45tTAqQLLdTAjUJ+1/WQ9ioBI2trLMzd5f1yo=
X-Gm-Message-State: AOJu0Yz5F86+IEPe/VYIcRytGVoM838eHsKbGUTVu7HFraVgXP65fhVY
	FpUE2nSj3fFSgKf4iG0UcqG0CKemMKBBTLXf+XZoR0hg/sDtvQ6CCFMi7+gFsoJn7/FrqWRmsS0
	t8/oiRu9XzYRQTfFnTnfTRKBl5Uo=
X-Google-Smtp-Source: AGHT+IH6dm0KtY6AOXsBR8+CKLrncTjvsxXqGpDBlOK9nLz374DTBfAaYF/RKuf+ezQBiaU/EJeka1R58wiMkaM5J60=
X-Received: by 2002:a50:999d:0:b0:574:ec65:9934 with SMTP id
 4fb4d7f45d1cf-574ec65996dmr371051a12.24.1715691734261; Tue, 14 May 2024
 06:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240414180929.79033-1-sergio.collado@gmail.com>
 <ea4a1a66-b584-48f3-8453-370d9ffb1f2d@redhat.com> <bf76a42e-715d-46ba-8609-3dc3d804653e@redhat.com>
In-Reply-To: <bf76a42e-715d-46ba-8609-3dc3d804653e@redhat.com>
From: =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>
Date: Tue, 14 May 2024 15:01:37 +0200
Message-ID: <CAA76j90+FfXv+30a1=7p_UWOpD0FzewMGv8L6rhSrw6FCEq_Nw@mail.gmail.com>
Subject: Re: [PATCH] Add room for insn-enconding and symbol name
To: Danilo Krummrich <dakr@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, David Rheinsberg <david@readahead.eu>, 
	John Baublitz <john.m.baublitz@gmail.com>, x86@kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I don't have any news on my side.
