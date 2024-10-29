Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F012022D6
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 13:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730207792; cv=none; b=X+hSog4y6Ce+YEdaF3gMLoOlVbv5aE+fQSgIeyQ/EVGBot+Q+U9AqEWRhZ9sDLFqh0Rw9G2UBVizSK63kR94TPVoUruQ1fbXrFziogq64+1fG+U64r14um3iivbgf8U166v9ZE8ZYZCl/NAe5eA1/CDlWAffJRUIqh/XM7xNfFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730207792; c=relaxed/simple;
	bh=ORScFiiSj6DBWVhn8Ip6edyJLDCC004uaKK2dEp4X1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IiNkTbAP89Gt2Xv2L0eJ5B+jVGSxa185ojs+p77LHMCTCI9hkP8VnGQ1qHUmMKmDNtYZh4POmckDAJRY9hJxPcDzX4YiNZtc0yEQM8c8Dt2aAmkeGqY0tVkSUOsMuda/MCPAcfWf1f54AHwenBGzjpG41OKmQSYIyDdzWA2ro14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ogG0of+B; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ogG0of+B"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-208cf673b8dso50822675ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 06:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730207789; x=1730812589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4FgCQ6GkthTlMOY7Hwmvw1LED0yrWV2Of7OG03sNbg=;
        b=ogG0of+Bgo8R4elC2gdsau+roG160QzUNvRJF+l8FYhN6C+6f/yCSqPvHuI3DYybXf
         e9zun2XeDN2QAb3xiauDaqFLlxGC0luC30X47Q9s9vz0UJrqkBCDUQxlMAkYG6pcyvaD
         bsDfLyKaJ5mKdDfL4aTXohFz+ywzYuE4EFVKf+sy3QU6NCQM+KfePC9ECtECRskG7lP7
         wDSr2h6Yfy4WOUnRhizfobsqLx/p4bIOv9GeJUABS0RIZDJpsK4vh2XzZ4ASe4KYWXvz
         Iw7AY8bbZ3YPl06EaIYRlI+ZqDk2/Bxw4r1J/yriK6i96vLcYLhr7yh7liNiM/7tolUK
         PHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730207789; x=1730812589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4FgCQ6GkthTlMOY7Hwmvw1LED0yrWV2Of7OG03sNbg=;
        b=BLlHrQUY1PvSL2sMK0aMeSOjChHHjnxfwFGssnYH8AwUN2tW3pM9ENE8LGoz3CyzW4
         PmcMqF6dEULZ2sCtMf4G1LJSuy0ticBy5g8ftfey+Hp3D5X9u9Buk0PB6td/xYWtryEk
         KbU0dEoA1x4iJY49lx0WIKbMW0Yt40XpLGhB7JjAlo5UDJiIIWavjiChylDsyDcfCDgu
         ow5+rMuO8lHDtp4srT+aoU0dBtme+Cf7pzioeuQluvOIXX+xe6aNUNys3S4vjeI9HSMP
         9Y92Drpra+i6M56mZJ6CuzLcNxYSAe5KkbnrO7t9ets2lNoAOsez3DYQXCgreEuBv4ar
         o96Q==
X-Forwarded-Encrypted: i=1; AJvYcCWE+pyowmRDruphDAYBT9v8cc7R+fGGuwQ89bnuQ5C63TTzcVMOVzohyyzDhzeCWww4OcPNJz755mLYgxK0Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKR9IX66MjBpAC/cjeXsDbAoDZelVTwBiM/RgQEAfy+FS7fyiR
	wdCVNtX3zzPFcNhqUBKS12UN+tydZ+9WngWhKOf752G+b2E2W8INw9pKb8cxWGrJSuZFj9MepBg
	o70CMt8aJ4l7RfHeGmT0lVyHy57PzKZRi5i/n
X-Google-Smtp-Source: AGHT+IG7aPEWXrKU2oQ6UttFO6K5zHHkqze1cQRhd6cCywBZr/BAJUMAwKfw3MVUjRift3AdGsm8Yxujz0XZfRoELXY=
X-Received: by 2002:a17:902:d4c3:b0:20b:b0ab:4fc3 with SMTP id
 d9443c01a7336-210c6c934c1mr173443635ad.49.1730207789184; Tue, 29 Oct 2024
 06:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022213221.2383-1-dakr@kernel.org> <20241022213221.2383-16-dakr@kernel.org>
In-Reply-To: <20241022213221.2383-16-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Oct 2024 14:16:14 +0100
Message-ID: <CAH5fLgiab5vssuQ2CO4kuKHhhWma=17858w8wbtmYUOXA-Cd1Q@mail.gmail.com>
Subject: Re: [PATCH v3 15/16] rust: platform: add basic platform device /
 driver abstractions
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, bhelgaas@google.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	tmgross@umich.edu, a.hindborg@samsung.com, airlied@gmail.com, 
	fujita.tomonori@gmail.com, lina@asahilina.net, pstanner@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, robh@kernel.org, 
	daniel.almeida@collabora.com, saravanak@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 11:33=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
> +    /// Find the [`of::DeviceId`] within [`Driver::ID_TABLE`] matching t=
he given [`Device`], if any.
> +    fn of_match_device(pdev: &Device) -> Option<&of::DeviceId> {
> +        let table =3D Self::ID_TABLE;
> +
> +        // SAFETY:
> +        // - `table` has static lifetime, hence it's valid for read,
> +        // - `dev` is guaranteed to be valid while it's alive, and so is
> +        //   `pdev.as_dev().as_raw()`.
> +        let raw_id =3D unsafe { bindings::of_match_device(table.as_ptr()=
, pdev.as_dev().as_raw()) };
> +
> +        if raw_id.is_null() {
> +            None
> +        } else {
> +            // SAFETY: `DeviceId` is a `#[repr(transparent)` wrapper of =
`struct of_device_id` and
> +            // does not add additional invariants, so it's safe to trans=
mute.
> +            Some(unsafe { &*raw_id.cast::<of::DeviceId>() })
> +        }
> +    }

Sorry if this has already been mentioned, but this method should
probably be marked #[cfg(CONFIG_OF)] so that you can use these
abstractions even if OF is disabled.

Alice
