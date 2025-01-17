Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFFE35960
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Jan 2025 09:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737105067; cv=none; b=iLsn+4+KMLam0dD5tFx4NUO/GqZ8SkhaHrs+ygUL3sVGJQTbbVY5n+noMn1DCrGKKDPgT164ThTxIWIUCuLUmFAvwDwVHBxEkIWSb3pybh+M4RZzHbSNkM41DLVAA8dlzQYQ6guEbzoqGRbVKPLzju6axJZv4mLOZrAepOytxwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737105067; c=relaxed/simple;
	bh=7S3lJxmtNX/rVJ06DnD6lmcLozTJ9i458Gm/gv9iZLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsrAVa9yxbmtMCfYhOy021+j1jg3Bnfm45v8kwCkBXVzDEnLOx25gJydf9XVvbQ4rkmwN6O3oedB2Ui9P8Zb1OuPOf5rNChaayIGtGcogw/G85B5Ax7DAQmPiqu0W5x9hWMTHPoBXcP77hmNpqR62qWSGTO9Tdwr5rkdpNLNeLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YSmJgAhy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YSmJgAhy"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4363ae65100so18848195e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Jan 2025 01:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737105064; x=1737709864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7S3lJxmtNX/rVJ06DnD6lmcLozTJ9i458Gm/gv9iZLc=;
        b=YSmJgAhyM/uu9QWZeqkiECHEao2C+CxUUvDvXBalcr0vH7rdmeGbaNgc/5S4MPyY/G
         348F239TQ2YEHUflCAzbxXwqqsdj3CbOekh6/MUfbdMmJN9CHwOvO8i2m0B20Tveo/kS
         5Jh3cJSVEoG9g4DrVphS3nQEC98bXFzfksv9Es4K/sFvn6rNPaXn64TneCbiPx/oskey
         3jnnt/i5WeU29wzZHc/GD9Qy1QPyjHCgCySGRFIa9dQ7X7Ie5Z+hd9nG5pRrmgp/ux9j
         cO+HkRVY5vbMT1lxlEa5I4wMTsZ0BHgPOHXsOx7Bir7WbAkFTgYKDDul95qxEqo0pvB/
         RCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737105064; x=1737709864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7S3lJxmtNX/rVJ06DnD6lmcLozTJ9i458Gm/gv9iZLc=;
        b=YCVd0KySD6cs3YecRZhHJJclqAFPuVyM0cRrsuumcWv63Q24fwFm6qDrVWlT56zQvM
         jn25hNozo437UYZTGXKkbsUsIN/dZBk4EzZ7G5GAdWA7QVj5KIkypntMhPwL8cBHUc88
         ZT3wNLxx6IGb5hjUwZ1/wMtCvQdagJ04PQu7mXCItbaChD7yi8oqzRbK2JBaaXPiKi+d
         yQVcgNZhju/n3UXb3x39hXt2U6UdRGs8S+2CfeOg0Q4kzTXwH+T8EwuDlie8l/pGku1H
         7UJ6xwifk4HdHdCtc3RRd+6bdxpvRbjDgDSI5VZj/bfXNirfXaaTMMnGKMiIb0xGVqL9
         IocA==
X-Forwarded-Encrypted: i=1; AJvYcCXJo9rEmLS3P8F660+eLpCfJe1Qa2cj5JNEDuzzpnrSEWHlrzN2O6OnwiRbSbyeH21eMfKhHn7d/XU3KF5RPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy004gfgINQFatZltojpILpOWGLtLW4cGuH9gDGxlK0M4GTvnNK
	2xi1R+0Elcm74xh9Pb/fkaBoYyVHBIR9N2PRL5hE7wEcgbRlj6M9jANhmryAbc41L7i1TmXnsa0
	SyApQQgpOK0y3+uP7so4tLyGJsQN6w+zbrqri
X-Gm-Gg: ASbGnctfeVSPsmzwmWo+cdrteJEXSRMYVSJpGft3ql8azBxw1AcD8UdV/vTIhQfoW9o
	nXFlXxHbfrkUpoWrFAm+uZn1u4CKwzETahbiMnRY=
X-Google-Smtp-Source: AGHT+IExpp8k/22+uNaGQKrpJQAhjTY9bJfJx8GBaFS7LWvpK6Osh5wyno05pbLJujzYKc6jkA95KExXBUzzpaB0dok=
X-Received: by 2002:adf:ec0f:0:b0:386:375a:8322 with SMTP id
 ffacd0b85a97d-38bf565989amr1175845f8f.13.1737105063905; Fri, 17 Jan 2025
 01:11:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org> <20250110-hrtimer-v3-v6-12-rc2-v6-3-f71d50f16482@kernel.org>
In-Reply-To: <20250110-hrtimer-v3-v6-12-rc2-v6-3-f71d50f16482@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 17 Jan 2025 10:10:50 +0100
X-Gm-Features: AbW1kvbhj1PKmv7kUd5qcKu-zENZlVZ6cbUl2GDa0V5zFP6KLoPRqoR_AhVqna8
Message-ID: <CAH5fLggYrVviC2+xVzZmOzYrn=bdjj73Zt7f=-qdPDn0v6fayQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/14] rust: sync: add `Arc::as_ptr`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, 
	Lyude Paul <lyude@redhat.com>, Guangbo Cui <2407018371@qq.com>, Dirk Behme <dirk.behme@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 9:17=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Add a method to get a pointer to the data contained in an `Arc`.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

A reason for why it's needed would be nice, but:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
