Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2325E328B7F
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 14:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014276; cv=pass; b=thV0tBfOkkSXZS91Ji3Ydu7VlxSeM/PO4LW7Mn5U8io02oP6MAHq6wYo+lQPNuUMyJs+hbiqAVkOz5F/+Mr+X2W4WegI7geyxmpGmpYhEIB0rYoNEQeCwd9hwRWsBUqnT5k7UIpCMqCOi+wvgj8HwRcHod5khqA+3+f+jXUReCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014276; c=relaxed/simple;
	bh=O7/vXOHmBuDEN6iYoEcXZX9SQVUOxuFM9K3LUsWI6j0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZIcn2G9x/RP+cJTydHerC33qcXMZPz583ccjkspcxoe7wOAtyN3kFg1/Mw2yRM/CKZHMVMz1hlPZIlI67E7Z5hc+yOsAgNGPNedA+gXc4rDtvk0ZXhpbGgkLLgHAliRiHzB0eZZEbyUYuTiG2gcX1gZTVixq5qUf4YtOFahV4Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pO6mb/Mj; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pO6mb/Mj"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3042a99f0ceso652516eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 07:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781014274; cv=none;
        d=google.com; s=arc-20240605;
        b=HHNUFCaWwCckfpC+8nlNUT6Zax7qxSDjOTzV+2sx/3/jKGeDGaPzcf7UvKpWylBk4d
         t4CzOzjRTgtU+xphGvu2iEkpKBSw6+Gz059vQ7MFjou5dUDYs0GxUQnkUICM1EYTVl8m
         9k3WnzH3S4mDrvZVFIwkz2JW7lVio1CsYll/oq386zUR2zWskLO0PKIXEcQ0OL4N05/P
         ig7uDBrMKQgKQnFcBtaqGPFTetqZVQLbB9aackp4rtGcWffzvAHK2i+QVqnQLOG2phNg
         EDvaCn4bMbxZMPARBBbWxYz8T63pzwrelEZwg6MaQMVZQ4oQMUegB2b+60iRtWFa8PwA
         bHYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nhjDW0OszKJAGtPcPLD3bV8YMBm1E7bkkVTPi52pFmI=;
        fh=OQROtRN3NJ4VHBPh3IKFYwiwQhOzFa53g6Hrbpy91MU=;
        b=CocLppEFPGjNNk+mflLxEH0Vcy5lI/k1mnOaMYOgK6pib51BSmA87E/BJ2CWaL+EGw
         oHM8L4niDxGhQqAPT8xtaTg4MmZcaUdm1CmoCf2ryjRLGjKfregmPuDFBKWvUHGwumps
         9setckTD/CsS8fswuMTNhHRFnCToNUeQnGr0Uf6V/IkJiNs/CSLGDQx9xPRDcWSBc8ZP
         lkkrLrWo6ZU5QlGV8OdyfoKWXAzmwR7HPEq6t2gIJ1J9Szh/KzevgwVtJK+2qEIoUq49
         WZfSOdupG7RQfAXk6DmIwddhM2YxFCoKNGT8QLOLC8gG2aCVYdxmgQRijOe9sAUj3Ts8
         PJFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781014274; x=1781619074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhjDW0OszKJAGtPcPLD3bV8YMBm1E7bkkVTPi52pFmI=;
        b=pO6mb/MjV7+9Lyoy7qKEe8jyrmAVmp1sVk9ZAQekGJY/qcYqRSPwEAedKazW1YDjAo
         daWkJzVnMyQBtO7fmggjHQ1cPEQGXHlt3VIr6I1Kj1CO/2HtnymY1aGpvzlRB8OH+ilA
         890WtpQyksZUJj37x9K37O3XCrrKWsg/O8Y8q+MGEolHuY3O9nF+Mz46OcSl6XEeAyYn
         PpKFuaWCdq+j/LCZ8xHOrMCCjyi8dyUYIO1ZCC3Qs9hwAGz+a0asgrLpY7oQ6QrXmnr+
         SzEi2Ndcvrsr6lg0pp6Uccf0k7gE8QI2hRsXCNfmZx5mer8km0ZAI5cl8BunKE5GWZwg
         VvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014274; x=1781619074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nhjDW0OszKJAGtPcPLD3bV8YMBm1E7bkkVTPi52pFmI=;
        b=O2zlHnwqIcHbDZbP397NXPbUzRvFr09Gx2ATuVSGfvZiFwL/7Ex+O8jo5b0flaswRy
         cmnc9H7LUlDbZlO6s1Kf3GEbISuxL6XveVypQwj9JPtpGuMVFZrDNMuPnYOxOxLJnRmb
         8dDh6mKGKhXNw7hSBy5+dgpuzuOUH3fbP2/TZ60BKMwAzBhiDEdP3ukSnN8ICSd/1E2x
         yEDUXXvbbBzflS2HSL8L1MqNCrdPe1DiyY0FwDpn03067s5DNnt8mPSodQHVF5UE63Uw
         HaZQvisEfvBt7204SHxDpfzk9XY5LQb5r8xuCg8tXKORmeRfvXvLVKa0GQkdCe4+gNbR
         wSzg==
X-Forwarded-Encrypted: i=1; AFNElJ/J28nX/qwHkeEOx/XNWseKeHQQuWdL4F/ufIrGKyBAPxsv8lC4SiHL7X7k5rMjRkR1fH4FyyE7Kun4tp1Gpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi8g63aNDpylon6YXY2RG0q8AnlXC6Yqk9G0F4Pa+U80fhBKLf
	rBskvRXf/Dae0/Y5bnN8x/zvlUSnQqQfBIHVdoA0dP5W8ptW1DV3DzOQGNzh3AkpER5nazHlJlg
	YhZqDyLCNTtOBPQg27pv6voiOmWKWkB0=
X-Gm-Gg: Acq92OG5DQSALVvlZEe3pA1vdGJ/SCtrgXeHB7I4rwlzFMWEzs4K1jeUckAPo0fRBGn
	hMpyOrNW8286iDAf5K13ySrZwFs9vNJtDwhbZbIe4UZNVVdfVV4GGcNKGqOsWoOHUrKAFgkqBQV
	y3P7zwS6mEcdGcNZt/dTjROINTXbcV7UvOXYdMMDqPlBDe/WTHzgJb5Tl7DBvB/P6MjJ0iDqL6I
	ERnpLnkvtuwklg0QFz73RWu6hUpUS1DM7skt6tjEeH5BJQrZwwMwwO9IDiyHyAwszIxVOCdA4Y+
	aHv4tx+O1cLNR4SePtL5i9f14lpomjXU0jr53i8gOFYG1s58hL9pZ6pMKmuOqXK2/eWCg7pbgh6
	ZEa1l/LbFy0/K4Ge7icbU9G5f65HkxaQyxQ==
X-Received: by 2002:a05:693c:3749:b0:304:8860:74d6 with SMTP id
 5a478bee46e88-3077b21ea10mr6213247eec.1.1781014274135; Tue, 09 Jun 2026
 07:11:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-unique-ref-v17-0-7b4c3d2930b9@kernel.org>
In-Reply-To: <20260604-unique-ref-v17-0-7b4c3d2930b9@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 16:11:01 +0200
X-Gm-Features: AVVi8CfNPwpEZxw0N5nqXBfBlOCze0ATuinL6YIsUVP51KJlhLB9xVsEvEDqHhw
Message-ID: <CANiq72nkYJnztntLzB5jNwi_oRY+V7UMpf6AuKM07aGH9FwPdg@mail.gmail.com>
Subject: Re: [PATCH v17 00/10] rust: add `Ownable` trait and `Owned` type
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	Serge Hallyn <sergeh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Igor Korotin <igor.korotin@linux.dev>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	driver-core@lists.linux.dev, Asahi Lina <lina+kernel@asahilina.net>, 
	Oliver Mangold <oliver.mangold@pm.me>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 10:13=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
>       rust: page: update formatting of `use` statements
>       rust: aref: update formatting of use statements

Applied these to `rust-next` to get them out of the way already since
I have another similar one for `str` I am applying too -- thanks!

    [ Picked from larger series and reworded. - Miguel ]

Cheers,
Miguel
