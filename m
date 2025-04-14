Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6940E1A23AC
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 20:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744661065; cv=none; b=I5JE+FSgWmKhnJ1yoiz6gARK2SiXkz3SfhH99mWME2v8ROQ54Rh/T3OVFcgIWuayJ3oRVqzF5xlHyhwr8EwFW7UTX0TBYmuW44A3dqlJDyClTPhs1wGsfaYY+cpfh94BVACjuAl2fDONlHf+hclE9/dLDdhdwRu83IPwEzViPeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744661065; c=relaxed/simple;
	bh=zMHnsHq/OTZKiV4PYYiWLQwRz7k4SvVkH85VQAVMhEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BavhJV1Ww4MGvcfIHJ4vbyM+1EeVlwgXVSQl+VpZ9e1tbO0g2kDm+z1IBSbYXMZcTPAFkXUlLVuj1AUrLBuA9ytzgLP3JfRxlaZkt+AnlnH7bRjMMeNKz/BijjQ9pvmCe9qmTtiFfJHIoyrvg0ln1UV69gduxTmcTRKkSEny11Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqehwUJ3; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqehwUJ3"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff6ce72844so877674a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 13:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744661060; x=1745265860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMHnsHq/OTZKiV4PYYiWLQwRz7k4SvVkH85VQAVMhEk=;
        b=gqehwUJ3cVtV2UGVnKVZEO+9ls2EzEMaK5sgEaDjz6N9Q+UNKOEt1+uvOlEOIDqvm5
         6pg5mkZvCaN2YEWa7oR07kaNt6sfy373hb79A02dHJUNkL9d27/SiZ370zcfwU63kIWk
         OEjHlu0Sw18sW4OgYEBg+I200wJ24FvKlOHflGnvN+JRW3XLzSNEh12AA7IH2Eqgfq8B
         bOnibstDmuqRoVjJvTAoWHkdLcpK73cqY7LdQMGm980BjxE1tg8qd9nOHh9emR0At/0W
         sxNSgU2mnslBlI6klGMQD8afxW+R6kpsynnWqiOYSFfK3wyuLo7fAeO0IkfSy5b8Uxjs
         BMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744661060; x=1745265860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMHnsHq/OTZKiV4PYYiWLQwRz7k4SvVkH85VQAVMhEk=;
        b=qN2cc0whmvwG/4b+iqSwoYnTBDsPsswfWUj44UIPLYL5aXIUlM1cRvsE3+BOX/BA/C
         g5z5JSxcuzK5Ed6iNX/H6mgvOiElrGjcg3jjqyFhL3x35SB5LfALnuESLxfqzReGkqIO
         ft+C3YtVb9Ggk+EFJkBUHpY79IjtzpHdqKjxtq/RmG+CxXaViSTuMhs0W8v36nb59oTZ
         pCT37oyv5tKjVWBEli30XtXVkVQZlNGMjG/tR06uVXrK0Xt3+jlYWYVlhosGASN966jn
         eA2GSDJf0y5uGIOnkzKiOUOO9NKdP9plyjnlkg2fCCgL0TlauUtmuN8YfslCGaDjDNVw
         Hvrw==
X-Forwarded-Encrypted: i=1; AJvYcCWYJCnfJogY87/2EJHQJM5h0BZKQgcAMzcU042adLTXlwGJVi0B5kYGSi/5av/tWxyHJNHqJfXvB50H4kr8zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDXJk7UTfoCSxTLS4+KmiU8gnIpc2+rd9LI4BUkTFiYl9/RJ5v
	t+tD7kkgjcDrpoCvundCnDjgfMz9LKxple2k6GZCJRZjud60mkPXySWC4GuGvk08UXsuXB1GOHH
	5QaSURQgsSzWUVdO8OT3+8ulTrSI=
X-Gm-Gg: ASbGncubXYkyerPZ9QdOMvVSonRVsLKCohcM28kS/joVNZH5NbAXdoH/9DVUkdm2JsA
	2+qH9J+uJtlMB5AMuuWKI7Ggjr0oB3Io1uBw04bFfTMQUa3JWOFUIoA3YNOnV731uZ+q9S8+Qqn
	1TbLPtpSzazhxwnN0+/mOZHQ==
X-Google-Smtp-Source: AGHT+IEIsC+csnI6Weh2OROunc3WgcgEHXLp5SfVQnPJhalUb5ZDeDIp3PEVZXXpGRp6IE4jLRwQHMQHJQ/2aNQrYNg=
X-Received: by 2002:a17:90b:17c4:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-3084e7660a7mr588747a91.5.1744661059013; Mon, 14 Apr 2025
 13:04:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
In-Reply-To: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Apr 2025 22:04:05 +0200
X-Gm-Features: ATxdqUGhP1sZvMYgYKWAALlWFoszwfZM_Wql-C1K7rgS--G_42gWwTfE1HErvmc
Message-ID: <CANiq72k0BY04QgxWUTsgDTZJmwHurtK4XKmdWrBA1qN5jKZqpw@mail.gmail.com>
Subject: Re: `u64` by `u64` div/mod in DRM QR for arm32
To: Jocelyn Falempe <jfalempe@redhat.com>, Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 8:14=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> operator with some support from upstream Rust. Or do you have

Or, probably something that makes more sense: just forbidding its use.

Cheers,
Miguel
