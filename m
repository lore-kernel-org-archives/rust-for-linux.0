Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57382286281
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739974910; cv=none; b=HEb6lvb4aaYXjt8H1Mhf0BrIMfpApUDhloefL2j/OGPhp6ZY0CpyiJHhcg9O+JEu/Wfpzqjxzfhd/tysI2rElAaFpqq2MHafOx7stEBGCR2AATM1G0PWZ0Y2Ff5kS/Pi9U3FS6fCHrowbX1f0WKG5LTGBAl5s14h+e1+EyoGIyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739974910; c=relaxed/simple;
	bh=BMno8u1jQaY+amMq4TjieD7YTySdfmoY+TyBJeZ6gJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKDCU7UyUx6dci6ZMXhKZC5Yw12703rY6N3wttEfdS7zn/yNcsXsKe8AGYJRTYR/+fO0Gc5VXkPBMkVxCgAe8f7IqcV3o138qJa9LZnsGUqAxNdVLywI+ma2OsT2D1TW0v6q5XnRyft1I6vmkYMtYpY/L7UyvCwtTMpI/DXj4Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FXjIanlX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FXjIanlX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43989226283so21379055e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 06:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739974908; x=1740579708; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMno8u1jQaY+amMq4TjieD7YTySdfmoY+TyBJeZ6gJ4=;
        b=FXjIanlXwxLLCS/NLzckdjAH0OinY6jSGTu9kmorP93oqDTmeJH28UAbNSa08soW/c
         qPewfqGhG82cV5Iws2doMYuGyZarjhoj9lDyeqvM9/mclUcv+XAmxvqB3uGc1DWjE4uS
         875I4L52GJ/MpjTqTCMFj9NhYegkmXpcOqyJIsOjODGp5lr0UIXLIFgk/RCno3RbYJZQ
         zdz22xDakVJ9YGigSQFvuSMStPHHLbcEgBFURssO9MxKTAFzmMi7biNxf+jYNC/LPWzs
         RSX6KJtkQtIA7UQkqRz7W9dtGSPjiZi+exm+W7Jv42/wDs8DZCmr4eRBfIv9Ln9gWNxO
         XK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739974908; x=1740579708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMno8u1jQaY+amMq4TjieD7YTySdfmoY+TyBJeZ6gJ4=;
        b=iENvS9hm5Al23f9sPTeL329jSNPOWy4B4jNir1siIHslz4ck4K8UOKYCtOzTK1Youo
         w5PbgIfWd9Jh8TqbzMxlnmxVcrDSTPmZnyrcNyMEwsY87RBKXOZdFSxkzefLiNshp2L8
         VrfG0+MmiwXHNysbjnW5w7dcXWHR7D1VPbqwMcL20MlcRJ35LIFNkcD26VYocNRpgbUT
         GlwY9r9J7Ee0eaek4YXMpxdU9bcNL93sgP+QYAT831dTeo0nwptHhuaUR48BSQ3yrvOR
         GHR9AG0z0UYMfFUGUhBNQZ7+oAKV+fsAKNwcNwDWpaOrW75/jPSTxeK5EMXGuq8vxXAD
         kXOA==
X-Forwarded-Encrypted: i=1; AJvYcCU31gjI6brXTBwMrPebWpx4lujqBPpbtgj98XglYaP3mKdZEHaec06OdQIqKKU724NCagVsTZlwXAtBxMLybA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxswFgqwyPQbCbLDMpBp47myOWJMc3rVMMVMBuVkrPtn3X2ok9e
	s2vZMEyJ0ajHl3/PXO6+xsZKrQ3qqFi9Hm9qQzMvgP+CpfFWKo83tr2/ikXwdvM1JpqasjrP3uM
	PKGGvkYZ+cDnsWIT8iqs1M0fDYWLaXCXnj2Jn
X-Gm-Gg: ASbGnct0b1vH83zECFxYqGv7zYKdU+UbxBlCwtdV0Yt1GgVpdHvGycwYFusoc6x/RQu
	b8uNHXUYf19CWBEMW3fBTZICF1hxcFcRp3IGmVFmvaFzy5JFnYHyP/mY9UxDdq+eR1TrAbJUK7P
	Zc8ePEebIsL/QHBS8Q1AEBHfw=
X-Google-Smtp-Source: AGHT+IEHmOP0OIR1HQB+AjYFJidgPWNTjvc/OEe0XXt8WeB19O5qwBJSAHxS1wUWMJ7zNk/RjiLD9QwOgvYqKI3m0cY=
X-Received: by 2002:adf:cc8f:0:b0:38f:31fe:6d37 with SMTP id
 ffacd0b85a97d-38f33f4e465mr15693858f8f.44.1739974907594; Wed, 19 Feb 2025
 06:21:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203-cstr-core-v8-0-cb3f26e78686@gmail.com> <CAJ-ks9kyozt45VeXG7GBTN-ejy_HGMOekFYFMmzS8AbEusZMWQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9kyozt45VeXG7GBTN-ejy_HGMOekFYFMmzS8AbEusZMWQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 19 Feb 2025 14:21:35 +0000
X-Gm-Features: AWEUYZnUHqYYyjcRH7G7RaAxm0DW3eJL1Y81A4cBEKNG0n6V96JVQgaaYR4P4lE
Message-ID: <CAH5fLgjUuCo5Ayx4WCfnrVAC1prvUbY-pvZdinkAb+KcSOWvpA@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] rust: replace kernel::str::CStr w/ core::ffi::CStr
To: Tamir Duberstein <tamird@gmail.com>
Cc: Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 5:05=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Gentle ping. Trevor, Alice, Benno: you all participated in the last
> round of review - I'd appreciate it if you could take a look at this
> series.

The primary thing that comes to mind looking at this is that losing
the Display impl is pretty sad. Having to jump through hoops every
time you want to print a string isn't great :(

Alice
