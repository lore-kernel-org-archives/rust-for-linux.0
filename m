Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DB219F101
	for <rust-for-linux@vger.kernel.org>; Mon, 12 May 2025 11:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050087; cv=none; b=keItY74nfGLAIN99SWkFVTneSOGpM4PK52FsMkExpxELcR7F1GmPzKj/1GEXVoPq/ln9e1nWXSob91eAgH3BuS7QzEhEqm7cueRWOKkzRxkmiQoOCiqbf+bdDyyE0qHItNETI+7/0wVHKn8tPX9KhfaknCVCvtwN2V1LDh+CdzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050087; c=relaxed/simple;
	bh=BYVxKND+XEY43d8dqJTPMONkjRxmUNHsKeqtv5iE4sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oPtIThhHSOi7dVkCw8QDFKgbrGbCwofrcFjY8Y2JM/NawWYb2QY+OxGyz7beya+6g/w38A6KpEgNy5Zz205UczjAgS4d37kvnhe1vtVy7FxnSCkcuq6EwY5mqtOwaaTJelI+TNPXFTPskj1tpUnStK902ELIyZq2RxOc3HFakyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1BJIQ0X; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1BJIQ0X"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22fb6eda1cbso2669835ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 12 May 2025 04:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747050085; x=1747654885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWdZ0FvRG7jRFpnyMwSNn8FH9aRym0nmItdxHtAcDko=;
        b=d1BJIQ0X6nzrVep1s1IumOeYoGGzJSUvaHkJ94uJS69BMUh7fY3oOPAOMspf9Ijqm1
         HvhDlMieRK/6oqc8L7+qQ0ShCCf+Ri+BVbwPQf2157SBUaTTSuNHz0HpLaHb+DYxPb6W
         bewp9ob2/vA/6ya3yXjPVHTZ44K7GMGq+Hm2oFuvofXefp5BkiGvn29VNOqOG0YlD4UI
         D/yDJXVww3yPBE8ut4qdk8ZJkEU1ai2W6IDOko9nYJUt04yoS1n20TEHudrBnah9tyoG
         cUX12VXM0FX5arVMLh8JD1e46PXAof6rqOjKUefC0ZZPUKLP8kfginGno0ohJlUAAwnC
         /AXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747050085; x=1747654885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWdZ0FvRG7jRFpnyMwSNn8FH9aRym0nmItdxHtAcDko=;
        b=PCwBqKadqs42vjBOufEeStVGobHnyZXauRg5wall3JySNyoCnvBzvLn1g5s5fJ9CGU
         WIfYxWb7X8a6LOaF0Ec6oMzMKco69zMbPYEca6lyZ11bFyNEVM9QDNvPqGvrXfKT1ttZ
         UZWW1ITAgGqL7jo0JB1kJTWiffm36hKBV/IcTdRxoPx2PDr5h/kBDdhUMyq85aHpcDsA
         gZNY2fVB8+xGJ/NCXOuReBGXmQcADXl+qUZST+9Lz4UpIICUxDKFMlF2/Yd9JIWJ/jEy
         +3vXMiTpbHXm7yO+AsXDd5pz7GpRfrQKBn19D1KxNoEh3nYHibXt3JwjvQEbcraMOzT1
         GhJg==
X-Forwarded-Encrypted: i=1; AJvYcCUi5Re1LdsmMExmF7FxeFrFavBB9uVfeJ8crxNFmf2+UceR5IvfBm67R0GPQoT1TL0NttMl8C0BHaGW8Hh5mA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoH03FQTAGSzBLhjFXoO3qDcsp5GwLVg3U+H6dUuYeoyVKLsMD
	aYg/x532+ISCl/A3zVJwCV5sfBydd9RFdCDo76bV0z9KT2ZEGZMY+lLMy9WQkbFBeW1yd6hnZGa
	0Pf7wp9dl/WyHIiK4+eBFTACqabat4p8iOO+A5Q==
X-Gm-Gg: ASbGncsk3xR0B6tX9k72VjHlrLon3yuNCYVMPBpj8oXn3m7pyDYGylv8bJuO+yhM8dw
	jDch1/UQkF1flLjtVgD2FduWAjkPC9KBkz9L6iBx8hLpl1ITjy+Pii3kRwFeIZBa9xwZj3UbpW+
	VhOl5hQbzPsa0SeCpMjtHelK39AqCMHO+PbaPOL5iBrks=
X-Google-Smtp-Source: AGHT+IEtQf2BdCN7e2sHSUk0VJX0Olv5qlcwauAFJbrOV1/mqRMGEU3MBVPNlGdiu+mmHNXEQgSqiV+PRfZLQzZHfJg=
X-Received: by 2002:a17:903:3bc5:b0:22e:62da:2e58 with SMTP id
 d9443c01a7336-22fc8d9852dmr63171295ad.10.1747050085392; Mon, 12 May 2025
 04:41:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410235546.43736-1-dakr@kernel.org> <20250410235546.43736-8-dakr@kernel.org>
In-Reply-To: <20250410235546.43736-8-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 May 2025 13:41:13 +0200
X-Gm-Features: AX0GCFsXrceSa7Z-E7razDmeQKNGOcQChVn-chfnpWnHFst4WuM6qw4PjEJHdJA
Message-ID: <CANiq72ks_1rEQYvYY464WOqAGKJTQpgvjM_RoBkHTJhMx1euyA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] rust: drm: gem: Add GEM object abstraction
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com, lina@asahilina.net, 
	daniel.almeida@collabora.com, j@jannau.net, alyssa@rosenzweig.io, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 1:56=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> +    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Self {
> +        // SAFETY: All of our objects are Object<T>.
> +        unsafe { crate::container_of!(obj, Object<T>, obj).cast_mut() }
> +    }

Doing something unrelated, I got a Clippy warning about this public
function not being unsafe, and while the lint talks about potentially
dereferecing a pointer, it is still the case the `container_of` uses
`byte_sub` which is why the macro requires both the in and out pointer
to be in bounds of the same allocation.

So since someone may pass any pointer here, this should be unsafe, right?

Even if that is not correct, the `// SAFETY` comment should
nevertheless explain why that holds, no?

I hope that helps.

Cheers,
Miguel
