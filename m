Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDF32594A4;
	Fri, 20 Dec 2024 06:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734675380; cv=none; b=ph+kHy9msPXpjSYR+PikmGK54nrnVyIjiUOo/M+EIKN/G7T2uu2TYb+g+Hdd82CWKjaIi4gfC/oSaDuv3N9upVR68OI8bIllidCSnUK6NKy2BeY2wC6qx+Hy9R6XznZJhsVEhqV+/fWX+6/EcpmI5Ayo4mjDK4Epd/rfzibfQZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734675380; c=relaxed/simple;
	bh=HVh/qkFVnfV1E0ThqnUwXiMcxIDYHAX8rrGB2iYfSBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sOx1DI5GuKvStTwn5sUDKfxUzKnhRDv65yexg0U393NYZC9SX1p3LMiETJr1ogHOlSFt6q+TYYnHobY8/OSnaWa2Bg4QoiT7DWHKBKH2MEU3HDaTxAoRq+9HwIGHsIv/QFvx8eKstCoCM9FxR6etEXm8SK+QfSkh0+vGIawAXik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TioYtaHj; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TioYtaHj"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-728f337a921so1667447b3a.3;
        Thu, 19 Dec 2024 22:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734675378; x=1735280178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVh/qkFVnfV1E0ThqnUwXiMcxIDYHAX8rrGB2iYfSBU=;
        b=TioYtaHj0E/O16kbM8MpSE947nd3kWSu0j8n6x8KlfzmIC87ZdF1BmIuzEbXA7Un/T
         S4h4VoKmCl1fqfCvDCdOopwobxrQwL9v+ndVwJ3Vrcm5D8xLpbQ1qsKNav1suKQddMu6
         oaADxMNJ8fbPsbB47lL9I+lRCokRxSmB6a3086kcC+ylujhGbdwCihJdaBCFhIJndytW
         wLfu0hv+3mzdjHn1FAYG/17diffmMnBPUmhM7UcxbRHFinm73mHauNCfNEgFvKnrP4wt
         vCDfR4kP9/0Un4uNF2ns0a4/SqjucRB5rwgUlCJzTWXSgotJXCkZe1lqmVxqG35taWxp
         o5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734675378; x=1735280178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HVh/qkFVnfV1E0ThqnUwXiMcxIDYHAX8rrGB2iYfSBU=;
        b=V+zWvNj48pr0af/QgwXb2Jf7j0C5rr9Llk9myiQ7/xyLzmmeBHFWMG7x01zS8t+N6D
         5G9NT/4GYxxChehZMLo7htD+VFutkRu/Z17MyTVz3IMJsTQwbt/+Rjkvp1Y6vQSTKXoN
         guAFvFoOXhYm6mDxEuXSKXm/i6vk11XaR71+DPVDO8iumKejIFoR5Gn0IHXVOsvV+GcX
         uFdhhmwFdDO7O+d6tVuJQLWVPGrbMALmfn7mCV6ta3DIpbblvHPl7BkDpdTzQ5XIW9ZD
         InTz6pBQcSr0hua7tXK+Gg2hlL8r6x1e3sfAp2tKilbr9XS0PEnB5P938+8yZ859u/dl
         9NkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoyvub1Xw86eydqMUByQQNhf6Ww46cw8R/nFaeaswnKDGpzhd87r0UmTesrNp+/J+0SfD/SGb7KGQgUpc=@vger.kernel.org, AJvYcCWWbluLczD/Rhd3UIF0hBgvFsNu3KCx9pI7vyj5sJEYp/KrRxE4dNKwrrYJyrm0bUjL5BwZFyuzBdoxFux9Qig=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH9X0xi5ciDuOhD3Fwq0ui6TVdKsMPwVZHbmaGkxAoRPOIyh7a
	X+qFN2Yi3TBP2kzKJ2lkPxvwQUdkIssXHrnl7+GPn5lR+jiNNPL5
X-Gm-Gg: ASbGncsq+FfpIbOUuSTaoSLRTGm1gutmuILicRXyoiSQt93MDkbxwT0N/VYRkxkO9UO
	8pANE9s2fcL+ferIsrqHwUHsCuRm1QR7fO51vjFlGeNoCMMcxsQnOnirNJOJuNPHMZlbqAbMvYG
	LckJ2KV+NzyPPbsgAr0nosSik3yn4v9S4Weis2zhbiqt0eyzi7NlgGC6ErkZQfay0i3kJ0o6DbD
	SwszGoNbgl9s5jB3cRkkleki3zon97z4XwquQKNOKSSmgP7+dNcy2/eFsbDeg3+3Xw=
X-Google-Smtp-Source: AGHT+IHpP+lhIbDBthVETNK+S8cKji9xA9cQpSEiNneztw1XQk4B5do3E/2rN8j2yFXQjP8VWOfk+A==
X-Received: by 2002:a05:6a21:3996:b0:1e1:c4e4:8898 with SMTP id adf61e73a8af0-1e5dfb67313mr2946348637.0.1734675378123;
        Thu, 19 Dec 2024 22:16:18 -0800 (PST)
Received: from lordgoatius.hsd1.or.comcast.net ([2601:1c1:8502:a6c0::b10a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b229c48fsm1818131a12.26.2024.12.19.22.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 22:16:17 -0800 (PST)
From: Jimmy Ostler <jtostler1@gmail.com>
To: dakr@kernel.org
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	alexmantel93@mailbox.org,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	daniel@sedlak.dev,
	felipe_life@live.com,
	gary@garyguo.net,
	jtostler1@gmail.com,
	kernel@valentinobst.de,
	linux-kernel@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	walmeida@microsoft.com
Subject: Re: [PATCH v3 1/3] rust: error: Change `LayoutError` to internal
Date: Thu, 19 Dec 2024 22:15:52 -0800
Message-ID: <20241220061616.308635-1-jtostler1@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <Z2LDa6cHRYdp__53@pollux>
References: <Z2LDa6cHRYdp__53@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Dec 18, 2024 at 4:43 AM Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Wed, Dec 18, 2024 at 01:57:29AM +0100, Miguel Ojeda wrote:
> > On Wed, Dec 18, 2024 at 1:24 AM Jimmy Ostler <jtostler1@gmail.com> wrote:
> > >
> > > Add an implementation of `From<LayoutError> for Error` for the
> > > `kernel::alloc::layout::LayoutError`.
> > > Remove the implementation on `core::alloc::LayoutError`, because we
> > > don't use it anywhere.
> >
> > No need to send a new version for this, but it may make sense to
> > reword to clarify that this switches the import, and therefore the
> > `impl` switches from one to the other. The way it is written, it
> > sounds like an actual `impl` item was textually added and another one
> > removed.
>
> Agree with Miguel, the commit message is slightly misleading.

That's a good point, I can reword that.

> With that fixed,

I'll submit a v4 with that fixed, thanks.

> Acked-by: Danilo Krummrich <dakr@kernel.org>
>
> >
> > Cheers,
> > Miguel

Thanks,
Jimmy Ostler
