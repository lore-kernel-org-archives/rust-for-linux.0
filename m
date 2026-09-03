Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455454B126E
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Sep 2026 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442158; cv=pass; b=EPD0HtW9Hnl3Ah9NFl3o9kNvRxomKYoHah7HH85z806yoBBqOI7VCENznHamkyylKhn7Btgq8xavSdCrZh58fYJVUZhGsYmey8op2br3GnFKF5dtcE2g7sltI5kbwG9ryv/iruqWt8crGORZCu2A65Z/y0Ueb2QirBLaK9KTu9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442158; c=relaxed/simple;
	bh=0lzGBDpPSFyRzORpVpv5BVqn0OH17bvA2nEL9BC2eGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EteaCRNb5pS/H65eqN7+XvUr9wqLO8zUJtW3DA6fcH+RDK9mRZCPWec1K782SYYa2VRcN22uZiQlkv/j8A6kepmEalUDDL4Vna3gv5TgS52WeLjWaEdxEzmb3GgciV5aQZFF7e7HI6+qxMLL0YB+plu0yZZx653aUJB4dGqlo6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QibOJQnk; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QibOJQnk"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d906cf83b2so2771055ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Sep 2026 06:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788442137; cv=none;
        d=google.com; s=arc-20260327;
        b=Al3vJ20YVQ+FZZTc94ntjBFr2ews7WHyTlu6EU/7aXESVYzVeLKTmCd9OazUDLrX0y
         yyCF3lQ5KIh5xa2Yp1xBGuzS5wUlzlRgSdqkpTCo3THn0K63iThuJHI7ozF1Y+i30WI8
         y0avLPYAdznqj6UJDPrU4q0XZpdFkUv4cpNvIAggnD0ZQ/EvkheOKnDa1m6vdOGeKQYw
         M+7n750htM29xeL17blkeTEsvpYVpytKfhB3oAmidu14Pwtn0gJS9eVfUjgYXkmiWyRu
         p0NEfnQkHXpNGueKOIl8/PMFH9KC5J0J4ZjOeSwWb4yJmPrL7BDBstkCCtm9ESIOaBrz
         UUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0lzGBDpPSFyRzORpVpv5BVqn0OH17bvA2nEL9BC2eGk=;
        fh=FxXyg/qVVtqKEFf3jPEFfoefVpodAA5fw3vWc86CdMs=;
        b=IMsCqBlngx7ZQDK5h1YQV3OZDNnq2NaFU9jttgMyigd/XuE+VcjaJq4TAV5TynwvPz
         dVUWxwFURPLbLnXX+Ix83LCleDQu/8Xt2MECGwWFiURMwNL73huypfuhXaLufdGv+28B
         ge8VqHJsglNig02diIdwFJ2daJ0vAS72hHfg3ySHnl4A+IhYPhHiQyBnMmgMZrtJRyTs
         RRNgxQ2pvGJNsVaXl/8COSWfBqmvwf1x3/vbYMd0PmYQso5G2zkFCzxOpOEdTM5HynKU
         /2k9eF9VsJDp/w6KUijXVLEWtiQb8IX4rETXjXQb19gqSVlQ9SgGlGjU3pHyfVq5kohz
         7Dlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788442137; x=1789046937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0lzGBDpPSFyRzORpVpv5BVqn0OH17bvA2nEL9BC2eGk=;
        b=QibOJQnk1IcJqAPts7niHKXB4MYd7rKKk/wudeEGKQp0iGQwDGwevv3JskZ75xdch6
         jfqm4L1dCpknWVRfoup0pgPVeoVkxrEgPBofP5UlvVojRvaPkpNXhQFo3YOpI5eUKzJ3
         oVIpCzNOrezqt2zVbyS0+jWle3e6IbhPsEo3ji4QqZhQGS8vqm75osJq5KNHbniSe7Cs
         7IMjXLKRAKNvoWjZP6f0QpU7q5nxhdS5rzzAAq7Cy/eRo92sBJSuU2C/89sY38/jJfVI
         jvANMBPDBxnLupAoA5f1OGYcmYjS1lAQ1aXvNLhVjMv0fKwt2U1nwuAN5oFlZ7SxOXAL
         4HoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442137; x=1789046937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lzGBDpPSFyRzORpVpv5BVqn0OH17bvA2nEL9BC2eGk=;
        b=V/qGX9eEZ3yQ+pd8fj8jbXp7QsCt9hiZtb292/DPI16wUSytJaoFIYxxVw1KO1+6Me
         70bOumPXYW8vV/ec+CZl1sL5Zig4SBJZ0TErwCBboSQCqDyAKMRE+YPsfazAjGbuEucV
         rVKo5dU58ufEuNbLyt9e8iaA+DCbABDXp6K4P3ZSiJJ+Kera0zG9xuY32rzqDRVNYGZT
         SP9OksyTvR2FG+Ky32F+Jb9p0nXl+vGmXdjSNs/y1SaTFrp4EoruwcxNmRHVYbuwSev1
         VXm7MQe/Q4deOdOmgXCZ+60iILZ/PTnpxijS3yz7uDbII/MiW/j2D3YSsgJALQ9xscUF
         hIgw==
X-Forwarded-Encrypted: i=1; AKwUvBxNaZmFRJ8eUnIkW2u3iZXIgw50Q4cOJradXiZPOHLkSl4zu0ScxJU9SIB8HdT2GpkQBogBripuKvjZ3H7ayg==@vger.kernel.org
X-Gm-Message-State: AFuF++mPEHVTqPVNug6MN++UwE638krtFrbgl9mE8nvbcSSfJDpE3D7M
	Ydwjyn49h458p1yoDZi6WVPK6+AIOBFi/roCs0ww5Y7o6aXj5Sa4SEzerDWuoUsKY6x/g1KCY+K
	2WyUFWYKDY5lGVjZyjmVqnoyyCur604k=
X-Gm-Gg: AYBFou04J0x84VSi4yb+KH59iXtim5YR3a0sFqzhBx2blsA5O13HXKhM7eYbnxvTbAx
	h+PaJh9+PYCCkrDtTo/xCZWVn2OgCNdgrHuQIRfqIrqeqC8+PAuUQayyYfrLY9o/D17Q5J9hNb+
	7GJrJdMWqXD6hdC+F6oy3VpBnW1LfrA4ffaSfIzmzec6rycO6Zq7HHWvpI/gXJkVTdkOnvCblK1
	Bug09hRFKhF9Kf47vqV06tWEJd8d6BLgGua9UxXWeZNSAlRU/s7gna2M+Al3mtj3PaHp9oMt+VX
	DnzcchOOzJmpHINRe+1mZcaDsjpmjeikQcMmmnxpc8ql6dSOYt8SfoJUZ2DiJtLdY/apP0svE1+
	7wjAkE4ZhJVg2RMYew/2be2p+Mu23CBQPQpm7ZGTn6x7NIiAxa9+ig/Upu1Q+
X-Received: by 2002:a17:90b:1d0d:b0:38e:c140:2a0b with SMTP id
 98e67ed59e1d1-39aee0e6ed8mr12609481a91.3.1788442136905; Thu, 03 Sep 2026
 06:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-unique-ref-v20-0-490735672187@kernel.org>
 <20260824-unique-ref-v20-6-490735672187@kernel.org> <CANiq72mPLrKQMzb37ow2969m5r3Z2Kh_4LHERUun6ALw3ea6tg@mail.gmail.com>
 <87y0dt1b8b.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87y0dt1b8b.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Sep 2026 15:28:43 +0200
X-Gm-Features: AcwNN1XsmuEPyO39jqyvRGfAMw_DGGPMkiDRHtfg1ZEoNlBhpVDCHnmjvBP_pa8
Message-ID: <CANiq72muo8SotJHJQhEe=2kiprbrQTvrEMqd1Uw_7yNSfA3Gpw@mail.gmail.com>
Subject: Re: [PATCH v20 6/8] rust: Add missing SAFETY documentation for `ARef` example
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ira Weiny <iweiny@kernel.org>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Oliver Mangold <oliver.mangold@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:29=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Do you want a link to this issue with a regular `Link:` tag?

Yeah, thanks!

Cheers,
Miguel
