Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5F44437B
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 10:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707216709; cv=none; b=Xp/kGSCjJmdfhoGPHG9m2RiOFo+nX80lENtlETDLStA4wllqDsLeBZC6BLByeXLmDnqbK2skcmcE7dC1eck/GmRvOJhc75MdenLi40sysO9ZdGuXZoH76sE79p+nISAgAME49OHZ4RToIArLt5mmycG0FMyUsLl5xryX+q/J7c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707216709; c=relaxed/simple;
	bh=F6uLDa8ANszizOuvxNVc8d0UEjU9017F3rOX84JDXtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5BOaqbL01E7YExhCYRcJ5Ae8dKdElFe9m8SHM3jtHaSz+diyiDYkrYRpFoD06m0hIO4zsnWp0V+prRUBVBxynqOLR7e23dfFOFjvWItHC0sGAmoOEqpwekGuZWE40Pp0zmC2XmnLJgaTIc3p+lsQo/CPfNjmUQV3WybtcfKdEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZcWQ/Sw; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZcWQ/Sw"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso5187227276.3
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Feb 2024 02:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707216706; x=1707821506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6uLDa8ANszizOuvxNVc8d0UEjU9017F3rOX84JDXtw=;
        b=IZcWQ/SwmVdkcrL6k3Yp3fedE8wZLawLu3S07svgPld+z4cwhiaOQvTrcZzhggJXXx
         s9C43sjfzFC7QnzsGjjfFuC9fjn356EThTA4o7Ml3f+au+O4s5ne9vFxb9KudAeFY/Cc
         tpNhD2OekhoTvS6gWKlhDr0L9q8RCp2eVWTVHbRD8fe0VWso3K/oXFLUhFoqtTZBHnAO
         pTcp26CLy7jPbXNdZUXm6xbl18mBIZXP6QSu5R0FbN5Zy9KwTfT5XKEU5UUseQYO5P9h
         hvGdyQYUZwvfJtSvMM6xitOvfhoaw6Uqu7NPidydanARWn2kTj02B2P4qodFbrA8OQT6
         ZM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707216706; x=1707821506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6uLDa8ANszizOuvxNVc8d0UEjU9017F3rOX84JDXtw=;
        b=P1N1qhWqJjhmw9x4ZF/ADOBwaN4acrIEPoa7qBxMlfN8/tck9zWJ/5GFVJTPg2WcIw
         tV+B3g6GWZ1XJcqYzauMD1T1tcz3koA4093eiosdtmgB7n5PQ9dEyU0uzpdLZ9zoP1ct
         xif/B0/d7u1Si3M4z0s/lXkWe8GS+XmPhN4A4FaBBsjZIWCQsvLxZFzl73NrWSrcakVo
         SD3ovfMLzwV68pmUWPbSfpto9OIBIhxiddBvKp4G1fynqJbFcrQqjI0Spay1r+ZvE5Ey
         dAV8PLv7naHCBhpFfaiYFlVFeGeDvW96sjPJK2Q4THTZj0pWT3UPWACNLNv4zNliprkk
         o26A==
X-Gm-Message-State: AOJu0YyfprLRAm2kkO9n4pRx/6MdLT6PNN4cd+Z23z1erocvYGZaYdR2
	sG0JsPP6p/t4KFtHtkjf2WwEDPCXm4y/k7Bb8AkMUtRmfCsXMJ1/3xVwWzkS3LfZ9D5YJDcXncy
	QbkkgTQlZHI88b19S3z/24mEdoOg=
X-Google-Smtp-Source: AGHT+IHfdX2FHcFFDrPWrHBKeEf01Cd6kFU2RNs2OITB6C0E/bBvvT4MxkNWHOjTdLl65pLeMMEK5ha5fpPG6XS2r84=
X-Received: by 2002:a25:6984:0:b0:dc2:3c3b:fa3e with SMTP id
 e126-20020a256984000000b00dc23c3bfa3emr1232824ybc.31.1707216706498; Tue, 06
 Feb 2024 02:51:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206012535.480193-1-tahbertschinger@gmail.com> <2024020646-browbeat-cozily-0bf2@gregkh>
In-Reply-To: <2024020646-browbeat-cozily-0bf2@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Feb 2024 11:51:35 +0100
Message-ID: <CANiq72m8V2nycL=P8yT3M=e6Nek0w45zBK48Aqbt39Kpt+bwTA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: place generated init_module() function in .init.text
To: Greg KH <greg@kroah.com>
Cc: Thomas Bertschinger <tahbertschinger@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, rust-for-linux@vger.kernel.org, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 11:01=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
>
> "once" is not right, it can be called zillions of times, it's just that
> it can't be called _AFTER_ module_init() is over for the file, as it
> will no longer be present in memory.
>
> So technically, the wording you added here isn't correct, sorry.

The safety preconditions may be stronger than needed. For instance, if
we do not expect anybody to manually call this, then we can say so. In
fact, we could even say Rust code cannot call this function.

Cheers,
Miguel
