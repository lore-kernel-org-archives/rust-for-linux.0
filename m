Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A590A3DBD6A
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 09:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605197; cv=pass; b=GaQ4fUyQv6TqdXi8EoQuP25dERLv/o4Yhd5LWlOMqzNWaB6RpuA9KWOzId8bSI/gLD6nnX7kyXnDd7pmr0kgRW89FV9ModWbJQk3DA4uhF83LZkZPMq1YxenO1/C9VimXKKOsI0PRX7j58UKXslC1PyBoWtK6+Iy49kedF+KW28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605197; c=relaxed/simple;
	bh=aepuwxT3La0r7vtalBiO5r2dCdjcwIjPYF1LVnwzA5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GVtNfsejOXUw+/ZOcPwqK40ZFPdcNUlXOFpz9Lv7O924m+8E3JAnhgI+kL23vp7EYFdN5FtwF1315FBr4EK8i5fWQkjlm7rbkAEcaZLt6V5rT/hyUbtcEv2QtiH93ncUoWvX/PdJ//36h7ne99zqsSUDFxn9+8BuI6JdkVZ8vnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkZaA45M; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkZaA45M"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-128eb45835cso110887c88.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 02:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774605196; cv=none;
        d=google.com; s=arc-20240605;
        b=iBbmTkLmQih8xk+d1HDDmUEc3kep+WEBoohLocBXygHarLpnW6e2s62Gc4RhoxFZ7S
         CVMuje4hd+zxWFPOgcl03MdCOWkv1REREHCpvwElyBR+kV+1QuHKTtDV7Om4oedDR8R/
         12Lw8yg9ubqCiK/praDSXfLCX8XfxksInCSBsVOIG10YuFqa62pf0gLYvKOney3/+3hR
         GzSS7l9mtj+lZ5QaCb9cYOPqZF2NKMAXpq5XV5DkDDyGqaoEKurtn5aixTqaUaJ5y/dc
         dfAeok8b500tgcI9AXju9juC5UPcZKUAW4IZrpJ/KYjUiCzQw1V6KiLVgqOJSGmuWRBj
         /QEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v5btyYX9lHdsVC1fopO/cY1LA4YDt+YdOziS7/7GqeI=;
        fh=++3Vg0gUr71b/CUF3yiVaZxqHjgH9Fw3k5rhSiuho/E=;
        b=ZdtHSk+2/uMu5EGYvpNkflSLMImsQqrWSlaH72GIhqF9nhgNI9Fm3BQ4xDZkSeAYCI
         h4+oVYnq6Jpi/mHlvwADp+f5oF6Xmrkxhs/5uISXdV04GPJ7GX/DfBpULKfI1Lpe75Qx
         5SRI5SMgzTyTWoYCvfbOT+G9zm6P5lJOcTPwsFUuUpBjk2+/e6LBlz6fdq0bdXeakVmB
         KacqMZiK8iDlUEhMoL+VCEM97yJ+SLTCqIUxK1CpH7Jxk/xqjUv7MSrIMuE3AS8EG5au
         EvrLbNxSG3pcnGUpZbHmYZAp2l6wD7MmRqMTa49aCqVud/WQxfKu0c9UhwoNKJ3IjiSH
         zbZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774605196; x=1775209996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5btyYX9lHdsVC1fopO/cY1LA4YDt+YdOziS7/7GqeI=;
        b=kkZaA45MGVGHwy54eBxaNSlUNCub7++1ZL48O712Y8AQThZyxXz8dlbZQS2KeePfrp
         uBYF8fXYG7ELZEDfw4tMvp3md2aY2kX818w7QioqdYB/7FR2jIdcMyYa+4yUQfNCzs7Z
         qNrRCeoWvwMtZib0lDYesKILKpRfRvETrJs5XoFUcec1lKEa/VPHlL1f2h69KOUjjkNQ
         m6G06/RN5PeAEnp5Wzq+9bo3O1sndvbZECF1lMlhSb56BOzE+JZwWJ08w4/7lSRFuJ+M
         mCaUtjgoAhrRCoz1n8zoyQlMEoHmaVoNEj822RMweAeq6x5ANJXJ4vsu47A+/5oNxujY
         41Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774605196; x=1775209996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v5btyYX9lHdsVC1fopO/cY1LA4YDt+YdOziS7/7GqeI=;
        b=q2Our7DbHZD5Lgkl/Twhzt2IUPMwlFG0MWaptLQWAqLgk/FfAeB+oPbV2TI+ZwMQsZ
         ldiwozH8aEimMRbm/XJbH+dz9ZKQeumv6cQJOrsTLPNXjBUyLm7p1t/ogyHRYRqDzsbc
         auD6vJG90YnEu7nLr2s41EYw64DA2lQUJlTPzMv839QPAxnqFIewmFHwdZFexKZkYZgg
         dPf44H8XU/90WY82yjs/83ypP/1AOB2eW6zR/i3JD7kOZ/MQnSjwbgAC62FTYEnLmSl2
         SIT3DGgtl/f2rOeIV234R0y3vUxPFe0XkTHsuO1zFDhuCoIv7Q+Tp87Aco9IHOGaxy8q
         IjVA==
X-Forwarded-Encrypted: i=1; AJvYcCVsiNkkMX21mKyfm/r3ZluQo7htKGovhFOFs8FYCAa0F6YpuuJ1RSlufWOogJx8n/hl34cWWkGaJQD74Uso7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqUwRKrKy5yqikFFFJUpnLU29DE9dK6P7fJDDgRvpCoPVgwiMo
	joR8ofNDedj/hecB7WLvVk8lrwjh3r4e4jgtqcEL86Ow+Zu7jI21qZqylgbSSizNVYCcYcPSLR7
	mzghELA16DkH9+x3BcoN3ZzJCRkWb/8Q=
X-Gm-Gg: ATEYQzxLGkyLGwSCiAcmL/sAIWO7GEuZPK4cqP5tbd6LeNyVP/Jy/cyuARJ6Q0+GSdV
	sFlxYCJRDkDv6Qf25m5vOC3KBkdsDKSMdjAeVMXhFJzYBelEgmG13gsVjrhngxVYwKQPVKnZge8
	BkgpeZnLLKmEd6uw7xGbO9RfOQe55zgz2ZS7j4qDG1r6tNu9uBbkV5prD3plyACowGnTvOTrKup
	9s/2NdtTmUZ3Hs1mxAeqO0Eplz9L1DkrsslBzylgpNpVaM+F65mwsUk/EzaxUCP0EBNftz6rddm
	Kua/CkaxWhrpnlu/RnsCYtfsE9kJEHCl5eZ/7xo/uAyYv934fMe4eWlxGgWPrQSU7zeeE8nALhm
	9baB/fds7GAxhbDPa6ql91Ez6UGRR6FaWBQ==
X-Received: by 2002:a05:7301:578e:b0:2c1:82a:8711 with SMTP id
 5a478bee46e88-2c185cbaba4mr489012eec.2.1774605195712; Fri, 27 Mar 2026
 02:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316211646.650074-1-lyude@redhat.com> <DHCBEGGPWSVK.30MV8652PV4PY@kernel.org>
In-Reply-To: <DHCBEGGPWSVK.30MV8652PV4PY@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 10:53:03 +0100
X-Gm-Features: AQROBzCDQRLEXYtIjvWCBTRZrsm2z1WTrrxZiqYf_IZKuXYInSunVO95k1Dfv0Y
Message-ID: <CANiq72muiQzRkvcEZNUceqxvDmUf0zPLaBvQRH+EfDSS0edo+A@mail.gmail.com>
Subject: Re: (subset) [PATCH v9 0/7] Rust bindings for gem shmem
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, nouveau@lists.freedesktop.org, 
	Gary Guo <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	christian.koenig@amd.com, Asahi Lina <lina@asahilina.net>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>, Boqun Feng <boqun@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	linux-media@vger.kernel.org, Shankari Anand <shankari.ak0208@gmail.com>, 
	David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org, 
	Asahi Lina <lina+kernel@asahilina.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	kernel@vger.kernel.org, Deborah Brouwer <deborah.brouwer@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 2:15=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> @Lyude, Alice, Miguel: Please have a look at what I came up with below.

Sounds fine to me, thanks!

  - Regarding the enabled unstable feature: looks good -- it will go
away this cycle anyway, so we may get a conflict, but that is fine.

  - Regarding the `&raw`, that sounds also good. I see you did it
similarly to how I did it for `bitmap.rs` -- thanks!

    (And for future reference, the `bitmap.rs` one was 1.92 instead of
1.82 because that one was for unions, while this one is
https://blog.rust-lang.org/2024/10/17/Rust-1.82.0/#safely-addressing-unsafe=
-statics).

  - Regarding the `expect(unused)` -- using `cfg_attr` is fine since
it is a simple case, but if it becomes a big issue, then of course
please feel free to use `allow` (you already know this, but in case it
helps others: I wrote some considerations about this at
https://docs.kernel.org/rust/coding-guidelines.html#lints).

Cheers,
Miguel
