Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC9829D288
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 09:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758014754; cv=none; b=hur4pKNRWNTLIhdNz47sPCi1iq4ZAe108dmVvfGLaU9ylFetn+LuHFrMuoG8IvVIbfoNZbbLKSAQ2K5ZipVzyMHTdOJbZqKURCnMS3TV5BL6wOyv/RaB1QeXe0/C6fuI77PJrIVcbR4Npunr4SH6N/iczN/nbWp8vP12rpJ4Wgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758014754; c=relaxed/simple;
	bh=prkrcgQgpwPbi8Cfds13n7nM9MiR8JPZLk8prSDLM2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qVTySKlpxJWCibiffXE9T+nwaWvvb97aFh6e1pVj29jedGXlqYgta1i+ezzfnpsASCK/gvfFB7oQ7URahIA9av4mA20EvHJHom7BtwXpjZxvse2+umR0xLhAmu8r3DCOiwnfcbSUmTAsAlLhYMIEZc9iahFgGXSHykiZCowR1y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9GWTVhI; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9GWTVhI"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-25f897894bfso6200395ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 02:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758014752; x=1758619552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prkrcgQgpwPbi8Cfds13n7nM9MiR8JPZLk8prSDLM2M=;
        b=Y9GWTVhIJtRrGpeL0bZclzvTItu83iRH38oBrb2EcNhXc3csSEaIHLjxntN6vPRekG
         U+fX+zMMyWvq4fU1tXc9j2glULsCsD3HDQtSdJDyCms7FAzij16kiCbq4ZFH4GfX1o2O
         60bm9gvWo1/H68oAAxP9Bh2C3rYz1lxFDBZZr5Llaxr51bh/syGn3RGUDU4Wubvi7ara
         /L0GnCtskb8YvQYVF0Cb8mRK/F3O+YZqvZLAJowHKwv2kqeo8uPRcyKtqEPj2z3PGkaP
         rt4IM+0Zu60Px0mIEQ9DMA72XYDEi5sZQhNM4KrzJelebhotOVNfMemzPC3+X9ehK8+e
         a/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758014752; x=1758619552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prkrcgQgpwPbi8Cfds13n7nM9MiR8JPZLk8prSDLM2M=;
        b=kx3mdH+Uo0e6yIlpg20dEVniawyr3Rf2ND80iidMixCxnuyTa+EbtGpXNEgDZ/ojP8
         2smMDOGa8YWeQPbIbIB2xjdHdRLhnYoYmBnjlzeulh9kO9P5/TKI05NpP520yEASjAAd
         Cy4RRqsodK2/aj5VoSsSq+AYeZgGoYFCB4Qeg2siUI0fiHmraLhY8/G60+SKL7xVyhUs
         hmm6L2d87POqtK32mVvwrba1+ei+zIo51aLeNIduLzSrG168RW3e+F1is+pGnGlyJ798
         htAWxF8eSuPeRLuhdd7dOmd3CPii7jQChufST86sk5l55mPlafvp3Hpl7VOVXvGbSAju
         c0Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXcJCiQc+q1PNa+PSVdb4muFOxY2vIdeFwFFJxutlvvH3k4fG9nzyJu/XhrVdU2bPMqyQa12DWW+wTPHo6UEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybuxywhOltdy6YQ5nVRRZvv3lavmAjDvDtb1eZbphQylLcDUwJ
	uqfm8yTXBA5l5OlaojkMvVa4nIQ8TDYxLSFUHiGVsPIyV8GlTUpZDl3tvFM3LliqDg8i1HsV94C
	qDIZrdYYSQ6a5Nm3itiQL//O3kpJ2MpI=
X-Gm-Gg: ASbGncs1CheoV8z+c/vkn57cLAJmd66agVNQldCm/SaoNEx4RdDLQLUF0UXYFPF8LYP
	YJOwo6GMrEY2ufv5gn5kG9EOwrvFW1yIA9c5yFepMH3Sb4rlPc+DuqkVLPBOJADGq0OFdv83Ajd
	tTc1jE1saPAnl6k4D2M4TrMyKkFdiD9C96OoiTLwjy6OQAuGHNroIs8PymBItGT+68O3ia9wL9p
	aSv1OAYKUcrHGpov8jsWm3/vpyzYtDUYrckqHkkUGXekQzQ8vMOvc6S0EG1Tir1CpKw8opOB9BX
	wMIzzpdX/1vLAWk3+3ue4LR0SQ==
X-Google-Smtp-Source: AGHT+IFwc6Y1OseNifdIO5J0qDFbM+aOcV8Z7xSmon/0tVZxaKw/+AP4a1wI7bqiW8muI5j5MuELqcXm9FvbGpAicyA=
X-Received: by 2002:a17:902:e5c8:b0:264:9287:3fc3 with SMTP id
 d9443c01a7336-2649287431dmr60170295ad.2.1758014751666; Tue, 16 Sep 2025
 02:25:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813-core-cstr-fanout-1-v3-0-545c14bc44ff@gmail.com>
In-Reply-To: <20250813-core-cstr-fanout-1-v3-0-545c14bc44ff@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Sep 2025 11:25:39 +0200
X-Gm-Features: AS18NWCYvwyg0oQ7WKMGNn77retnSNUsfiN0nCmq9Ts2BvgM8ip_kHMckevDcv8
Message-ID: <CANiq72kq4RWNO1pJtJuG8jBpARq5ft6pcn8dHuUWJx=nosweyQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] rust: use `core::ffi::CStr` method names
To: Tamir Duberstein <tamird@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Jocelyn Falempe <jfalempe@redhat.com>, Javier Martinez Canillas <javierm@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
	Len Brown <lenb@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 5:42=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> This is series 2b/5 of the migration to `core::ffi::CStr`[0].
> 20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com.
>
> This series depends on the prior series[0] and is intended to go through
> the rust tree to reduce the number of release cycles required to
> complete the work.
>
> Subsystem maintainers: I would appreciate your `Acked-by`s so that this
> can be taken through Miguel's tree (where the other series must go).
>
> [0] https://lore.kernel.org/all/20250704-core-cstr-prepare-v1-0-a91524037=
783@gmail.com/
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to `rust-next` -- thanks everyone!

If any maintainer has a problem with this, please shout.

Cheers,
Miguel
